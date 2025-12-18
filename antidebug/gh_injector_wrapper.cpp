#include "GH Injector Library/NT Funcs.h"
#include "GH Injector Library/Start Routine.h"
#include <Windows.h>

// =============================================================
// Antidbg Direct Syscall Declarations
// 声明我们需要用到的 Syscall 函数
// =============================================================
extern "C" {
    NTSTATUS DbgNtCreateThreadEx(PHANDLE ThreadHandle, ACCESS_MASK DesiredAccess, PVOID ObjectAttributes, HANDLE ProcessHandle, PVOID StartRoutine, PVOID Argument, ULONG CreateFlags, ULONG_PTR ZeroBits, SIZE_T StackSize, SIZE_T MaximumStackSize, PVOID AttributeList);
    NTSTATUS DbgNtQueryInformationThread(HANDLE ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength, PULONG ReturnLength);
    NTSTATUS DbgNtQueryInformationProcess(HANDLE ProcessHandle, PROCESSINFOCLASS ProcessInformationClass, PVOID ProcessInformation, ULONG ProcessInformationLength, PULONG ReturnLength);
    NTSTATUS DbgNtClose(HANDLE Handle);
    // 新增：DbgNtOpenProcess 声明
    NTSTATUS DbgNtOpenProcess(PHANDLE ProcessHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PCLIENT_ID ClientId);
}

// 导出给 adbg.cpp 使用的函数
extern "C" void InitGHInjectorFuncs();
extern "C" void StartHiddenThreadWrapper(void *pRoutine, void *pArg);

void InitGHInjectorFuncs() {
  // 重定向 GH Injector 内部使用的函数指针到我们的 Syscall
  if (!NATIVE::NtCreateThreadEx)
    NATIVE::NtCreateThreadEx = (f_NtCreateThreadEx)&DbgNtCreateThreadEx;

  if (!NATIVE::NtQueryInformationThread)
    NATIVE::NtQueryInformationThread = (f_NtQueryInformationThread)&DbgNtQueryInformationThread;

  if (!NATIVE::NtQueryInformationProcess)
    NATIVE::NtQueryInformationProcess = (f_NtQueryInformationProcess)&DbgNtQueryInformationProcess;

  if (!NATIVE::NtClose)
    NATIVE::NtClose = (f_NtClose)&DbgNtClose;
}

void StartHiddenThreadWrapper(void *pRoutine, void *pArg) {
  HANDLE hProcess = NULL;
  
  // ---------------------------------------------------------
  // 使用 DbgNtOpenProcess 替代 OpenProcess
  // ---------------------------------------------------------
  CLIENT_ID clientId = { 0 };
  clientId.UniqueProcess = (HANDLE)(ULONG_PTR)GetCurrentProcessId();
  clientId.UniqueThread = 0;

  OBJECT_ATTRIBUTES objAttr = { 0 };
  InitializeObjectAttributes(&objAttr, NULL, 0, NULL, NULL);

  NTSTATUS status = DbgNtOpenProcess(&hProcess, PROCESS_ALL_ACCESS, &objAttr, &clientId);

  if (!NT_SUCCESS(status) || !hProcess) {
      // 如果失败，可以尝试回退或者直接返回
      return;
  }
  // ---------------------------------------------------------

  DWORD exitCode = 0;
  ERROR_DATA errorData = {0};

  // 隐藏调试器 + 运行后不管 + 伪造起始地址 + 伪造 TEB/ClientID + 跳过线程附加
  DWORD flags = INJ_CTF_HIDE_FROM_DEBUGGER | INJ_CTF_RUN_AND_FORGET |
                INJ_CTF_FAKE_START_ADDRESS | INJ_CTF_FAKE_TEB_CLIENT_ID | INJ_CTF_SKIP_THREAD_ATTACH;

  StartRoutine(hProcess, (f_Routine)pRoutine, pArg,
               LAUNCH_METHOD::LM_NtCreateThreadEx, flags, exitCode, 100,
               errorData);

  // 使用 DbgNtClose 关闭句柄
  DbgNtClose(hProcess);
}