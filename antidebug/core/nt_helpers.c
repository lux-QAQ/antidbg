#include "nt_helpers.h"

// 定义函数指针类型
typedef PVOID(NTAPI *pRtlAddVectoredExceptionHandler)(
    ULONG First, PVECTORED_EXCEPTION_HANDLER Handler);
typedef ULONG(NTAPI *pRtlRemoveVectoredExceptionHandler)(PVOID Handle);

PVOID Dbg_AddVectoredExceptionHandler(ULONG First,
                                      PVECTORED_EXCEPTION_HANDLER Handler) {
  // 动态获取 RtlAddVectoredExceptionHandler 地址
  // 哈希值对应 "RtlAddVectoredExceptionHandler"
  // [修改] Dbg_GetNtdllExport -> DbgGetNtdllExport
  pRtlAddVectoredExceptionHandler fn =
      (pRtlAddVectoredExceptionHandler)DbgGetNtdllExport(
          Dbg_HashSyscall("RtlAddVectoredExceptionHandler"));

  if (fn) {
    return fn(First, Handler);
  }
  return NULL;
}

ULONG Dbg_RemoveVectoredExceptionHandler(PVOID Handle) {
  // 动态获取 RtlRemoveVectoredExceptionHandler 地址
  // 哈希值对应 "RtlRemoveVectoredExceptionHandler"
  // [修改] Dbg_GetNtdllExport -> DbgGetNtdllExport
  pRtlRemoveVectoredExceptionHandler fn =
      (pRtlRemoveVectoredExceptionHandler)DbgGetNtdllExport(
          Dbg_HashSyscall("RtlRemoveVectoredExceptionHandler"));

  if (fn) {
    return fn(Handle);
  }
  return 0;
}

void ForceExit() {
    // 1. 尝试分离调试器 (ProcessDebugPort = 7)
    // 如果成功，调试器会立即收到 detach 事件或报错，无法继续查看上下文
    HANDLE hProcess = (HANDLE)-1;
    ULONG_PTR debugPort = 0;
    
    // ProcessDebugPort = 7. 我们需要确保 syscalls.h 中有定义，或者直接用数字
    // 注意：这通常需要 SeDebugPrivilege，但在某些环境下能起效
    DbgNtSetInformationProcess(hProcess, (PROCESSINFOCLASS)7, &debugPort, sizeof(debugPort));

    // 2. 直接通过 Syscall 终止进程
    // 绕过所有 DLL_PROCESS_DETACH 通知和 atexit 处理程序
    DbgNtTerminateProcess(hProcess, 0);

    // 3. 如果内核没有立即杀死我们（极低概率），破坏栈并崩溃
    // 这样调试器看到的调用栈是损坏的，无法回溯
    #ifdef _WIN64
    __asm {
        xor rcx, rcx
        mov rsp, rcx  ; 破坏栈指针
        ud2           ; 触发未定义指令异常
    }
    #else
    __asm {
        xor ecx, ecx
        mov esp, ecx
        ud2
    }
    #endif
}