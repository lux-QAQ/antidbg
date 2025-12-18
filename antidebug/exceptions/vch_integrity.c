/**
 * @file vch_integrity.c
 * @brief 
 * @author Lux-QAQ
 * @version 1.0.1
 * @date 2025-12-16
 * @warning 效果不好，容易误报特别是在VBA环境下，不使用
 * @copyright Copyright (c) 2025  Lux-QAQ
 * 
*/
#include "vch_integrity.h"
#include "../core/atcptr.h"
#include "../core/syscall.h"
#include <intrin.h>
#include <stdio.h>

#ifdef _DEBUG
#define DBG_PRINT(...)                                                         \
  do {                                                                         \
    printf("[VCH] " __VA_ARGS__);                                              \
    fflush(stdout);                                                            \
  } while (0)
#else
#define DBG_PRINT(...)
#endif

typedef PVOID(WINAPI *PAddVectoredContinueHandler)(ULONG,
                                                   PVECTORED_EXCEPTION_HANDLER);

// 使用静态变量传递数据，避免依赖易被 OS/Hypervisor 清除的 DR 寄存器
static DWORD64 g_ExpectedMagic = 0;
static volatile bool *g_pResultPtr = NULL;

// -------------------------------------------------------------------------
// 1. VEH (Vectored Exception Handler)
// -------------------------------------------------------------------------
static LONG WINAPI VehHandler(PEXCEPTION_POINTERS pExceptionInfo) {
  DWORD code = pExceptionInfo->ExceptionRecord->ExceptionCode;

  if (code == EXCEPTION_SINGLE_STEP) {
    unsigned char *pIp = (unsigned char *)pExceptionInfo->ContextRecord->Rip;
    bool bIsIcebp = false;
    bool bIsTrap = false;

    // Check ICEBP (0xF1)
    // Trap: RIP 指向下一条指令
    if (pIp && *(pIp - 1) == 0xF1) {
      bIsIcebp = true;
      bIsTrap = true;
    }
    // Fault: RIP 指向当前指令 (罕见，取决于 CPU/OS 实现)
    else if (pIp && *pIp == 0xF1) {
      bIsIcebp = true;
      bIsTrap = false;
    }

    if (bIsIcebp) {
      DBG_PRINT("VEH: ICEBP detected. Resuming.\n");
      // 即使 Dr0 为 0，我们也必须处理异常，否则进程会崩溃
      if (!bIsTrap) {
        pExceptionInfo->ContextRecord->Rip++;
      }
      return EXCEPTION_CONTINUE_EXECUTION; // 触发 VCH
    }
  } else if (code == EXCEPTION_ILLEGAL_INSTRUCTION) {
    unsigned char *pIp = (unsigned char *)pExceptionInfo->ContextRecord->Rip;
    if (pIp && *pIp == 0xF1) {
      DBG_PRINT("VEH: ICEBP caused #UD. Skipping.\n");
      pExceptionInfo->ContextRecord->Rip++;
      return EXCEPTION_CONTINUE_EXECUTION;
    }
  }

  return EXCEPTION_CONTINUE_SEARCH;
}

// -------------------------------------------------------------------------
// 2. VCH (Vectored Continue Handler) - 核心校验逻辑
// -------------------------------------------------------------------------
static LONG WINAPI VchHandler(PEXCEPTION_POINTERS pExceptionInfo) {
  if (pExceptionInfo->ExceptionRecord->ExceptionCode == EXCEPTION_SINGLE_STEP) {

    DWORD64 magic = g_ExpectedMagic;
    volatile bool *pVerified = g_pResultPtr;

    if (pVerified) {
      bool bPassed = true;

      DWORD64 currentRcx = pExceptionInfo->ContextRecord->Rcx;
      DWORD64 currentRdx = pExceptionInfo->ContextRecord->Rdx;
      DWORD64 currentDr6 = pExceptionInfo->ContextRecord->Dr6;
      DWORD64 currentDr0 = pExceptionInfo->ContextRecord->Dr0;
      DWORD64 currentDr1 = pExceptionInfo->ContextRecord->Dr1;
      DWORD64 currentDr7 = pExceptionInfo->ContextRecord->Dr7;

      DBG_PRINT("VCH Check: Magic=%llX, RCX=%llX, RDX=%llX, Dr7=%llX\n", magic,
                currentRcx, currentRdx, currentDr7);

      // [校验 A] 上下文一致性：RCX 必须等于 Magic
      if (currentRcx != magic) {
        DBG_PRINT("VCH: DETECTED! RCX mismatch (Got %llX, Exp %llX).\n",
                  currentRcx, magic);
        bPassed = false;
      }

      // [校验 B] 上下文一致性：RDX 必须等于 Magic
      if (currentRdx != magic) {
        DBG_PRINT("VCH: DETECTED! RDX mismatch.\n");
        bPassed = false;
      }

      // [校验 C] Dr6 状态检查
      // ICEBP 触发单步异常时，硬件通常置位 DR6.BS (Bit 14)
      // 在 VBS/Hyper-V 环境下，Dr6 可能不准确 (BS 位丢失)
      if ((currentDr6 & 0x4000) == 0) {
        DBG_PRINT("VCH: WARNING! Dr6 BS flag missing (Dr6=%llX) - Likely VBS/Hyper-V.\n",
                  currentDr6);
        // 仅警告，不拦截
      }

      // [校验 D] LBR 记录检查 (宽松模式)
      if (pExceptionInfo->ExceptionRecord->NumberParameters > 0) {
        ULONG_PTR lbrFrom =
            pExceptionInfo->ExceptionRecord->ExceptionInformation[0];

        // 检查是否包含内核地址 (调试器干扰迹象)
        if (lbrFrom > 0x7FFFFFFFFFFFFFFFULL) {
          DBG_PRINT("VCH: DETECTED! LBR contains kernel address (%p).\n",
                    (void *)lbrFrom);
          bPassed = false;
        } else {
          DBG_PRINT("VCH: LBR Check Passed (From: %p)\n", (void *)lbrFrom);
        }
      } else {
        DBG_PRINT("VCH: WARNING! LBR enabled but no record found (VBS or Debugger).\n");
      }

      // [校验 E] Dr0/Dr1 寄存器完整性检查
      // 我们在 SetupContext 中显式启用了 Dr0/Dr1 (在 Dr7 中置位 L0/L1)。
      // 即使在 VBS 环境下，OS 也应该保存这些寄存器。
      // 如果调试器介入，通常会接管 DR 寄存器导致值不匹配。
      if (currentDr0 != magic) {
          DBG_PRINT("VCH: DETECTED! Dr0 mismatch (Got %llX, Exp %llX).\n", currentDr0, magic);
          bPassed = false;
      }
      
      if (currentDr1 != (DWORD64)pVerified) {
          DBG_PRINT("VCH: DETECTED! Dr1 mismatch (Got %llX, Exp %p).\n", currentDr1, pVerified);
          bPassed = false;
      }

      __try {
        *pVerified = bPassed;
      } __except (EXCEPTION_EXECUTE_HANDLER) {
        DBG_PRINT("VCH: Failed to write result to pointer.\n");
      }
    }
  }
  return EXCEPTION_CONTINUE_SEARCH;
}

// -------------------------------------------------------------------------
// 辅助函数
// -------------------------------------------------------------------------
static bool SetupContext(HANDLE hThread, DWORD64 magic,
                         volatile bool *pResultAddr) {
  g_ExpectedMagic = magic;
  g_pResultPtr = pResultAddr;

  CONTEXT ctx = {0};
  ctx.ContextFlags = CONTEXT_DEBUG_REGISTERS;

  if (NT_SUCCESS(DbgNtGetContextThread(hThread, &ctx))) {
    ctx.Dr0 = magic;
    ctx.Dr1 = (DWORD64)pResultAddr;
    // 开启 LBR(bit 8) 和 BTF(bit 9)
    // 关键修改：同时开启 Dr0 (L0=bit0) 和 Dr1 (L1=bit2) 的局部启用位
    // 这强制 OS/VBS 保存寄存器值，防止被优化掉。
    ctx.Dr7 |= (1ULL << 0) | (1ULL << 2) | (1ULL << 8) | (1ULL << 9);
    return NT_SUCCESS(DbgNtSetContextThread(hThread, &ctx));
  }
  return false;
}

static void ClearContext(HANDLE hThread) {
  g_ExpectedMagic = 0;
  g_pResultPtr = NULL;

  CONTEXT ctx = {0};
  ctx.ContextFlags = CONTEXT_DEBUG_REGISTERS;
  if (NT_SUCCESS(DbgNtGetContextThread(hThread, &ctx))) {
    ctx.Dr0 = 0;
    ctx.Dr1 = 0;
    ctx.Dr7 = 0;
    DbgNtSetContextThread(hThread, &ctx);
  }
}

// -------------------------------------------------------------------------
// 主检测函数
// -------------------------------------------------------------------------
#if defined(_MSC_VER)
__declspec(guard(nocf))
#endif
bool VchIntegrityCheck() {
  DBG_PRINT("Starting VchIntegrityCheck (Volatile GPR Mode)...\n");

  volatile bool bSecurePathVerified = false;

  DWORD64 magic = __rdtsc();
  if (magic == 0)
    magic = 0xDEADBEEFCAFEBABE;

  HMODULE hKernel32 = GetModuleHandleA("kernel32.dll");
  if (!hKernel32)
    return false;

  PAddVectoredContinueHandler pAddVectoredContinueHandler =
      (PAddVectoredContinueHandler)GetProcAddress(hKernel32,
                                                  "AddVectoredContinueHandler");
  if (!pAddVectoredContinueHandler)
    return false;

  PVOID hVeh = AddVectoredExceptionHandler(1, VehHandler);
  PVOID hVch = pAddVectoredContinueHandler(1, VchHandler);

  if (!hVeh || !hVch) {
    if (hVeh)
      RemoveVectoredExceptionHandler(hVeh);
    if (hVch)
      RemoveVectoredContinueHandler(hVch);
    return false;
  }

  // Shellcode:
  // 1. MOV RAX, <Magic>
  // 2. MOV RCX, RAX  (Volatile)
  // 3. MOV RDX, RAX  (Volatile)
  // 4. ICEBP
  // 5. RET
  unsigned char code[] = {
      0x48, 0xB8, 0x00, 0x00, 0x00,
      0x00, 0x00, 0x00, 0x00, 0x00, // MOV RAX, <Magic> (offset 2)
      0x48, 0x89, 0xC1,             // MOV RCX, RAX
      0x48, 0x89, 0xC2,             // MOV RDX, RAX
      0xF1,                         // ICEBP
      0xC3                          // RET
  };

  *(DWORD64 *)(code + 2) = magic;

  PVOID pExecMem = NULL;
  SIZE_T regionSize = sizeof(code);

  NTSTATUS status = DbgNtAllocateVirtualMemory(
      (HANDLE)-1, &pExecMem, 0, &regionSize, MEM_COMMIT | MEM_RESERVE,
      PAGE_EXECUTE_READWRITE);

  if (!NT_SUCCESS(status)) {
    RemoveVectoredExceptionHandler(hVeh);
    RemoveVectoredContinueHandler(hVch);
    return false;
  }

  memcpy(pExecMem, code, sizeof(code));
  FlushInstructionCache((HANDLE)-1, pExecMem, regionSize);

  HANDLE hThread = (HANDLE)-2;
  if (SetupContext(hThread, magic, &bSecurePathVerified)) {

    DBG_PRINT("Executing Shellcode at %p with Magic %llX...\n", pExecMem,
              magic);
    _ReadWriteBarrier();

    typedef void (*FUNC)(void);
    FUNC f = (FUNC)pExecMem;

    __try {
      f();
    } __except (EXCEPTION_EXECUTE_HANDLER) {
      DBG_PRINT("Exception caught by SEH (VEH failed to handle it)\n");
    }

    ClearContext(hThread);
  }

  regionSize = 0;
  DbgNtFreeVirtualMemory((HANDLE)-1, &pExecMem, &regionSize, MEM_RELEASE);

  RemoveVectoredExceptionHandler(hVeh);
  RemoveVectoredContinueHandler(hVch);

  DBG_PRINT("VchIntegrityCheck Result: %s (Verified: %d)\n",
            !bSecurePathVerified ? "DETECTED" : "SAFE", bSecurePathVerified);

  return !bSecurePathVerified;
}