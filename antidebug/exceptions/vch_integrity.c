/**
 * @file vch_integrity.c
 * @brief Advanced VCH Integrity Check (LBR + Timing + Dr7 Validation)
 */
#include "vch_integrity.h"
#include "../core/nt_helpers.h"
#include "../core/syscall.h"
#include <intrin.h>
#include <stdio.h>

// 标志位
static volatile bool g_bDetected = false;   // 是否发现调试器痕迹
static volatile bool g_bLbrChecked = false; // 是否成功执行了 LBR 检查逻辑
static volatile bool g_bVchCalled = false;  // VCH 是否被调用
static volatile unsigned __int64 g_u64StartTSC = 0; // 起始时间戳

// 时间阈值：正常异常分发通常在 10k-100k 周期内
// 调试器介入通常会导致 > 1M 周期。这里设置 0x500000 (约500万周期) 作为保守阈值
#define RDTSC_THRESHOLD 0x500000




#ifdef VCH_DEBUG
#define VCH_DEBUG_PRINT(msg, ...) \
  printf("[VCH_DEBUG] " msg "\n", __VA_ARGS__)
#else
#define VCH_DEBUG_PRINT(msg, ...)
#endif

// -------------------------------------------------------------------------
// 1. VEH (Vectored Exception Handler)
// -------------------------------------------------------------------------
static LONG WINAPI VehHandler(PEXCEPTION_POINTERS pExceptionInfo) {
  // 立即获取结束时间
  unsigned __int64 endTSC = __rdtsc();


  VCH_DEBUG_PRINT("VEH called. Code: %08X at RIP: %p",
         pExceptionInfo->ExceptionRecord->ExceptionCode,
         (void *)pExceptionInfo->ContextRecord->Rip);


  if (pExceptionInfo->ExceptionRecord->ExceptionCode == EXCEPTION_SINGLE_STEP) {
    g_bLbrChecked = true;
    PCONTEXT ctx = pExceptionInfo->ContextRecord;

    // [增强检测 1] 时间差检测
    if (g_u64StartTSC != 0) {
      unsigned __int64 delta = endTSC - g_u64StartTSC;
      if (delta > RDTSC_THRESHOLD) {

        VCH_DEBUG_PRINT("Timing violation! Delta: %llu cycles. Debugger "
               "latency detected.",
               delta);

        g_bDetected = true;
      }
    }

    // [已移除] Dr6 检测 (因环境兼容性导致误报)

    // [增强检测 3] Dr7 持久性检测
    // 检查我们设置的 LBR(bit 8) 和 BTF(bit 9) 是否被调试器清除
    bool bLbrEnabled = (ctx->Dr7 & (1ULL << 8)) != 0;
    bool bBtfEnabled = (ctx->Dr7 & (1ULL << 9)) != 0;
    if (!bLbrEnabled || !bBtfEnabled) {

      VCH_DEBUG_PRINT(
          "[VCH_DEBUG] Dr7 violation! Bits cleared by debugger. Dr7: %016llX\n",
          ctx->Dr7);

      g_bDetected = true;
    }

    // [原有检测] LBR 记录是否存在
    if (pExceptionInfo->ExceptionRecord->NumberParameters == 0) {

      VCH_DEBUG_PRINT("[VCH_DEBUG] VEH: LBR missing. Detected!\n");

      g_bDetected = true;
    } else {
      // [原有检测] LBR 记录是否被内核地址污染
      ULONG_PTR lbrFrom =
          pExceptionInfo->ExceptionRecord->ExceptionInformation[0];
      if (lbrFrom > 0x7FFFFFFFFFFFFFFFULL) {

        VCH_DEBUG_PRINT("[VCH_DEBUG] VEH: LBR polluted. Detected!\n");

        g_bDetected = true;
      }
    }

    // 清除 EFLAGS 中的 TF (Trap Flag, bit 8)
    // 必须清除，否则 icebp 处理完后，CPU 会因为 TF 再次触发单步异常
    ctx->EFlags &= ~0x100;

    // [修正] icebp (0xF1) 触发异常时，RIP 已经指向下一条指令
    // 因此不需要 ctx->Rip++，否则会跳过 ret 指令导致崩溃
    // ctx->Rip++;

    // 返回 Continue Execution 会触发 VCH 的调用
    return EXCEPTION_CONTINUE_EXECUTION;
  }

  return EXCEPTION_CONTINUE_SEARCH;
}

// -------------------------------------------------------------------------
// 2. VCH (Vectored Continue Handler)
// -------------------------------------------------------------------------
static LONG WINAPI VchHandler(PEXCEPTION_POINTERS pExceptionInfo) {
  if (pExceptionInfo->ExceptionRecord->ExceptionCode == EXCEPTION_SINGLE_STEP) {
    // 证明 VCH 被成功调用，异常分发链条完整
    g_bVchCalled = true;
  }
  return EXCEPTION_CONTINUE_SEARCH;
}

// -------------------------------------------------------------------------
// 主检测函数
// -------------------------------------------------------------------------
bool VchIntegrityCheck() {
  g_bDetected = false;
  g_bLbrChecked = false;
  g_bVchCalled = false;
  g_u64StartTSC = 0;
  NTSTATUS status;

  // 1. 注册隐蔽的 VEH 和 VCH
  PVOID hVeh = Dbg_AddVectoredExceptionHandler(1, VehHandler);
  PVOID hVch = Dbg_AddVectoredContinueHandler(1, VchHandler);

  if (!hVeh || !hVch) {
    if (hVeh)
      Dbg_RemoveVectoredExceptionHandler(hVeh);
    if (hVch)
      Dbg_RemoveVectoredContinueHandler(hVch);
    return false;
  }

  // 2. 准备 Shellcode
  unsigned char code[] = {
      0x48, 0xC7, 0xC0, 0x05, 0x00, 0x00, 0x00, // mov rax, 5
      0x48, 0x83, 0xF8, 0x05,                   // cmp rax, 5
      0x74, 0x03,                               // je branch_target
      0x48, 0x31, 0xDB,                         // xor rbx, rbx
      // branch_target:
      0x9C, // pushfq
      0x48, 0x81, 0x0C, 0x24, 0x00, 0x01, 0x00,
      0x00, // or qword ptr[rsp], 0x100 (TF)
      0x9D, // popfq
      0xF1, // icebp
      0xC3  // ret
  };

  PVOID pExecMem = NULL;
  SIZE_T regionSize = sizeof(code);
  HANDLE hProcess = (HANDLE)-1;

  // 步骤 A: 申请 READWRITE
  status = DbgNtAllocateVirtualMemory(hProcess, &pExecMem, 0, &regionSize,
                                      MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);

  if (!NT_SUCCESS(status)) {
    Dbg_RemoveVectoredExceptionHandler(hVeh);
    Dbg_RemoveVectoredContinueHandler(hVch);
    return false;
  }

  // 步骤 B: 写入 Shellcode
  for (size_t i = 0; i < sizeof(code); i++)
    ((unsigned char *)pExecMem)[i] = code[i];

  // 步骤 C: 修改权限为 EXECUTE_READ
  ULONG oldProtect = 0;
  PVOID pBase = pExecMem;
  SIZE_T sizeToProtect = regionSize;
  status = DbgNtProtectVirtualMemory(hProcess, &pBase, &sizeToProtect,
                                     PAGE_EXECUTE_READ, &oldProtect);

  if (!NT_SUCCESS(status)) {
    regionSize = 0;
    DbgNtFreeVirtualMemory(hProcess, &pExecMem, &regionSize, MEM_RELEASE);
    Dbg_RemoveVectoredExceptionHandler(hVeh);
    Dbg_RemoveVectoredContinueHandler(hVch);
    return false;
  }

  DbgNtFlushInstructionCache(hProcess, pExecMem, regionSize);

  // 3. 设置调试寄存器 (LBR + BTF)
  HANDLE hThread = (HANDLE)-2;
  CONTEXT ctx = {0};
  ctx.ContextFlags = CONTEXT_DEBUG_REGISTERS;

  if (NT_SUCCESS(DbgNtGetContextThread(hThread, &ctx))) {
    ctx.Dr7 |= (1ULL << 8) | (1ULL << 9);

    if (NT_SUCCESS(DbgNtSetContextThread(hThread, &ctx))) {

      // 4. 执行 Shellcode
      typedef void (*FUNC)(void);
      FUNC f = (FUNC)pExecMem;

      // [关键] 记录开始时间
      g_u64StartTSC = __rdtsc();

      __try {
        f();
      } __except (EXCEPTION_EXECUTE_HANDLER) {

        VCH_DEBUG_PRINT("[VCH_DEBUG] Exception in shellcode caught (Code: %08X). "
               "Ignoring if check passed.\n",
               GetExceptionCode());
      }

      // 5. 清理 Dr7
      ctx.ContextFlags = CONTEXT_DEBUG_REGISTERS;
      DbgNtGetContextThread(hThread, &ctx);
      ctx.Dr7 &= ~((1ULL << 8) | (1ULL << 9));
      DbgNtSetContextThread(hThread, &ctx);
    }
  }

  // 6. 清理资源
  regionSize = 0;
  DbgNtFreeVirtualMemory(hProcess, &pExecMem, &regionSize, MEM_RELEASE);
  Dbg_RemoveVectoredExceptionHandler(hVeh);
  Dbg_RemoveVectoredContinueHandler(hVch);

  // 7. 综合判定
  if (g_bDetected) {
    // ForceExit();
    return true;
  }

  if (!g_bLbrChecked) {

    VCH_DEBUG_PRINT("[VCH_DEBUG] LBR check never ran! Debugger swallowed exception?\n");

    // ForceExit();
    return true;
  }

  if (!g_bVchCalled) {

    VCH_DEBUG_PRINT("[VCH_DEBUG] VCH not called! Chain broken.\n");

    // ForceExit();
    return true;
  }

  return false;
}