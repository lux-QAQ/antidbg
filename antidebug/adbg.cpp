#include "adbg.h"
#include "core/nt_helpers.h"
#include <intrin.h> // 用于 __readgsqword, __rdtsc
#include <stdio.h>

// 声明外部封装函数
extern "C" void InitGHInjectorFuncs();
extern "C" void StartHiddenThreadWrapper(void *pRoutine, void *pArg);

// [新增] 全局上下文，确保在线程启动时内存有效
static ADBG_CONTEXT g_AdbgContext = {0};

// -----------------------------------------------------------------------------
// 辅助函数：直接从 TEB 获取线程 ID (绕过 API)
// -----------------------------------------------------------------------------
__forceinline DWORD GetTID_TEB() {
#ifdef _WIN64
  // x64: TEB 在 GS 寄存器，ClientId.UniqueThread 在偏移 0x48
  return (DWORD)__readgsqword(0x48);
#else
  // x86: TEB 在 FS 寄存器，ClientId.UniqueThread 在偏移 0x24
  return (DWORD)__readfsdword(0x24);
#endif
}

// -----------------------------------------------------------------------------
// 辅助函数：基于 RDTSC 的简单随机数生成 (绕过 BCrypt)
// -----------------------------------------------------------------------------
__forceinline DWORD Rng_RDTSC() {
  unsigned __int64 tsc = __rdtsc();
  // 简单的线性同余生成器 (LCG) 混淆
  tsc = tsc * 6364136223846793005ULL + 1442695040888963407ULL;
  return (DWORD)(tsc >> 32);
}

// -----------------------------------------------------------------------------
// 声明需要的 Syscall (syscalls.h 中已定义宏，这里确保类型匹配)
// -----------------------------------------------------------------------------
// ThreadBasePriority = 3
#define ThreadBasePriority ((THREADINFOCLASS)3)

DebugCheckResult debuggerChecks[] = {
    {false, "VCH Integrity (LBR)", .functionPtr = VchIntegrityCheck},
    {false, "IsBeingDebugged", .functionPtr = IsBeingDebugged},
    {false, "IsRemoteDebuggerPresent",
     .functionPtrWithProcess = IsRemoteDebuggerPresent},
    {false, "DebuggerBreak", .functionPtr = DebuggerBreak},
    {false, "int2D", .functionPtr = int2D},
    // {false, "int3", .functionPtr = int3},
    {false, "StackSegmentRegister",
     .functionPtrWithThread = StackSegmentRegister},
    {false, "PrefixHop", .functionPtr = PrefixHop},
    {false, "RaiseDbgControl", .functionPtr = RaiseDbgControl},
    {false, "DebugObjectHandle", .functionPtrWithProcess = DebugObjectHandle},
    {false, "KernelDebugger", .functionPtr = KernelDebugger},
    {false, "NtGlobalFlag", .functionPtr = NtGlobalFlag},
    {false, "DebugFlags", .functionPtrWithProcess = DebugFlags},
    {false, "ProcessHeap_Flags", .functionPtr = ProcessHeapFlag},
    {false, "ProcessHeapForce_Flag", .functionPtr = ProcessHeapForceFlag},
    {false, "DuplicatedHandles", .functionPtrWithProcess = DuplicatedHandles},
    {false, "ParentProcesses", .functionPtrWithProcess = ParentProcesses},
    {false, "NtSetLdtEntries", .functionPtr = CheckNtSetLdtEntries},
    {false, "PEB", .functionPtr = CheckPEB},
    {false, "DebugPort", .functionPtrWithProcess = DebugPort},
    {false, "HardwareBreakpoint", .functionPtrWithThread = HardwareBreakpoint},
    {false, "HardwareBreakpoint2",
     .functionPtrWithProcessAndThread = HardwareBreakPoint2},
    {false, "VirtualAlloc_MEM_WRITE_WATCH", .functionPtr = WriteWatch},
    {false, "InvalidHandle", .functionPtr = CheckCloseHandle},
    {false, "NtQueryObject", .functionPtr = CheckNtQueryObject},
    {false, "OpenProcess", .functionPtr = CheckOpenProcess},
    {false, "SetHandleInformation", .functionPtr = ProtectedHandle},
    {false, "NtSystemDebugControl", .functionPtr = NtSystemDebugControl},
    {false, "ReadOwnMemoryStack", .functionPtr = ReadMemoryStack},
    {false, "ProcessJob", .functionPtr = ProcessJob},
    {false, "POPFTrapFlag", .functionPtr = POPFTrapFlag},
    {false, "MemoryBreakpoint", .functionPtrWithProcess = MemoryBreakpoint},
    {false, "PageExceptionBreakpoint",
     .functionPtrWithProcess = PageExceptionBreakpoint},
    {false, "Timing", .functionPtr = TimingAttacks},
    {false, "Window", .functionPtr = CheckWindow},
    {false, "DBGP", .functionPtr = dbgp},
    {false, "LBR", .functionPtr = lbr},
};

#define NUM_DEBUG_CHECKS (sizeof(debuggerChecks) / sizeof(debuggerChecks[0]))

DWORD __stdcall __adbg(LPVOID lpParam) {
  PADBG_CONTEXT pCtx = (PADBG_CONTEXT)lpParam;
  const HANDLE hProcess = (HANDLE)(-1LL);
  const HANDLE hSelfThread = (HANDLE)(-2LL); // 用于自身优先级保护
  HANDLE hTargetThread = NULL;               // 用于反调试检查（主线程）

  // [修改] 使用直接 Syscall 打开主线程句柄
  if (pCtx && pCtx->MainThreadId) {
    CLIENT_ID clientId = {0};
    clientId.UniqueProcess = 0;
    clientId.UniqueThread = (HANDLE)(ULONG_PTR)pCtx->MainThreadId;

    OBJECT_ATTRIBUTES objAttr = {0};
    objAttr.Length = sizeof(OBJECT_ATTRIBUTES);
    objAttr.RootDirectory = NULL;
    objAttr.Attributes = 0;
    objAttr.ObjectName = NULL;
    objAttr.SecurityDescriptor = NULL;
    objAttr.SecurityQualityOfService = NULL;

    // 使用 THREAD_GET_CONTEXT | THREAD_QUERY_INFORMATION 权限
    NTSTATUS status = DbgNtOpenThread(
        &hTargetThread,
        THREAD_GET_CONTEXT | THREAD_QUERY_INFORMATION | SYNCHRONIZE, &objAttr,
        &clientId);

    if (!NT_SUCCESS(status)) {
#ifdef _DEBUG
      printf("[-] Failed to open main thread via syscall: %08X\n", status);
#endif
      hTargetThread = NULL;
    }
  }

  // 如果打开失败，回退到检查自身（虽然效果差，但保证不崩溃）
  HANDLE hCheckThread = hTargetThread ? hTargetThread : hSelfThread;

  while (1) {
    for (int i = 0; i < NUM_DEBUG_CHECKS; ++i) {
      if (debuggerChecks[i].functionPtrWithProcess != NULL) {
        debuggerChecks[i].result =
            debuggerChecks[i].functionPtrWithProcess(hProcess);
      } else if (debuggerChecks[i].functionPtrWithThread != NULL) {
        // [修改] 传入主线程句柄进行检查 (如 HardwareBreakpoint)
        debuggerChecks[i].result =
            debuggerChecks[i].functionPtrWithThread(hCheckThread);
      } else if (debuggerChecks[i].functionPtrWithProcessAndThread != NULL) {
        // [修改] 传入主线程句柄进行检查 (如 HardwareBreakpoint2)
        debuggerChecks[i].result =
            debuggerChecks[i].functionPtrWithProcessAndThread(hProcess,
                                                              hCheckThread);
      } else if (debuggerChecks[i].functionPtr != NULL) {
        debuggerChecks[i].result = debuggerChecks[i].functionPtr();
      }

      if (debuggerChecks[i].result) {
#ifdef _DEBUG
        printf("[!] Debugger detected in function: %s\n",
               debuggerChecks[i].functionName);
        __fastfail(EXIT_SUCCESS);
#endif
        ForceExit();
      }

      // [修改] 使用 Syscall 保护隐蔽线程自身的优先级
      // 防止被调试器挂起或降级 (ThreadBasePriority = 3)
      LONG currentPriority = 0;
      ULONG retLen = 0;
      NTSTATUS status = DbgNtQueryInformationThread(
          hSelfThread, ThreadBasePriority, &currentPriority,
          sizeof(currentPriority), &retLen);

      // 正常优先级通常是 8 (NORMAL_PRIORITY_CLASS) 或相对值 0
      // 这里我们简单检查，如果查询失败或者优先级极低，尝试重置
      if (NT_SUCCESS(status)) {
        // 如果优先级过低 (例如被设为 IDLE/LOW)，强制提升
        // 注意：Native Priority 值与 Win32 不同，这里仅作演示，重置为默认基准
        // 实际上，只要能成功调用 SetInformationThread，就证明我们还有控制权
        if (currentPriority < 8) {
          LONG newPriority = 8; // 尝试恢复到 Normal
          DbgNtSetInformationThread(hSelfThread, ThreadBasePriority,
                                    &newPriority, sizeof(newPriority));
        }
      }

      const DWORD minDelayMs = 500;
      const DWORD maxDelayMs = 2000;

      // [修改] 使用 RDTSC 替代 BCryptGenRandom
      DWORD randomValue = Rng_RDTSC();
      DWORD randomDelayMs =
          minDelayMs + (randomValue % (maxDelayMs - minDelayMs + 1));

      LARGE_INTEGER delay = {0};
      const __int64 randomDelayMs64 = (__int64)randomDelayMs;
      const __int64 conversionFactor = 10000;
      const __int64 result = -(randomDelayMs64 * conversionFactor);

      delay.QuadPart = result;

      // 使用 Syscall 延时
      DbgNtDelayExecution(FALSE, &delay);
    }
  }

  // 清理句柄
  if (hTargetThread && hTargetThread != hSelfThread) {
    DbgNtClose(hTargetThread);
  }

  return 0;
}

DWORD __stdcall MemoryTrackerThread(LPVOID lpParam) {
  StartMemoryTracker((HANDLE)lpParam);
  return 0;
}

void StartDebugProtection() {
  // 1. 初始化 GH Injector 所需函数
  InitGHInjectorFuncs();

  // [修改] 手动解析 ntdll 导出表调用 RtlAddVectoredExceptionHandler，绕过
  // kernel32 const PVOID hVeh = AddVectoredExceptionHandler(1,
  // VectoredDebuggerCheck);

  const PVOID hVeh = Dbg_AddVectoredExceptionHandler(1, VectoredDebuggerCheck);

  if (!hVeh) {
#ifndef _DEBUG
    ForceExit();
#endif
    __fastfail(STATUS_ACCESS_VIOLATION);
  }

  StartAttachProtection();
  const HANDLE hProcess = (HANDLE)(-1LL);

  // [修改] 使用 TEB 直接获取当前线程 ID，不调用 kernel32 API
  g_AdbgContext.MainThreadId = GetTID_TEB();

  // 2. 使用封装函数启动隐蔽线程，传入 Context 指针
  StartHiddenThreadWrapper((void *)__adbg, (void *)&g_AdbgContext);

  // 3. 使用封装函数启动内存监控线程 (保持原样，传入 Process 伪句柄)
  StartHiddenThreadWrapper((void *)MemoryTrackerThread, (void *)hProcess);
}

bool isProgramBeingDebugged() {
  const HANDLE hProcess = (HANDLE)(-1LL);
  const HANDLE hThread = (HANDLE)(-2LL);

  for (int i = 0; i < NUM_DEBUG_CHECKS; ++i) {
    if (debuggerChecks[i].functionPtrWithProcess != NULL) {
      debuggerChecks[i].result =
          debuggerChecks[i].functionPtrWithProcess(hProcess);
    } else if (debuggerChecks[i].functionPtrWithThread != NULL) {
      debuggerChecks[i].result =
          debuggerChecks[i].functionPtrWithThread(hThread);
    } else if (debuggerChecks[i].functionPtrWithProcessAndThread != NULL) {
      debuggerChecks[i].result =
          debuggerChecks[i].functionPtrWithProcessAndThread(hProcess, hThread);
    } else if (debuggerChecks[i].functionPtr != NULL) {
      debuggerChecks[i].result = debuggerChecks[i].functionPtr();
    }

    if (debuggerChecks[i].result) {
#ifdef _DEBUG
      printf("[!] Debugger detected in function: %s\n",
             debuggerChecks[i].functionName);
      return true;
#endif
      ForceExit();
      return true;
    }
  }
  return false;
}