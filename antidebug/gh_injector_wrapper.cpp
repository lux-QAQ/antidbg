#include "GH Injector Library/NT Funcs.h"
#include "GH Injector Library/Start Routine.h"
#include <Windows.h>


// 导出给 adbg.cpp 使用的函数
extern "C" void InitGHInjectorFuncs();
extern "C" void StartHiddenThreadWrapper(void *pRoutine, void *pArg);

void InitGHInjectorFuncs() {
  HMODULE hNtdll = GetModuleHandleW(L"ntdll.dll");
  if (!hNtdll)
    return;

  if (!NATIVE::NtCreateThreadEx)
    NATIVE::NtCreateThreadEx =
        (f_NtCreateThreadEx)GetProcAddress(hNtdll, "NtCreateThreadEx");
  if (!NATIVE::NtQueryInformationThread)
    NATIVE::NtQueryInformationThread =
        (f_NtQueryInformationThread)GetProcAddress(hNtdll,
                                                   "NtQueryInformationThread");
  if (!NATIVE::NtQueryInformationProcess)
    NATIVE::NtQueryInformationProcess =
        (f_NtQueryInformationProcess)GetProcAddress(
            hNtdll, "NtQueryInformationProcess");
  if (!NATIVE::NtClose)
    NATIVE::NtClose = (f_NtClose)GetProcAddress(hNtdll, "NtClose");
}

void StartHiddenThreadWrapper(void *pRoutine, void *pArg) {
  HANDLE hProcess =
      OpenProcess(PROCESS_ALL_ACCESS, FALSE, GetCurrentProcessId());
  if (!hProcess)
    return;

  DWORD exitCode = 0;
  ERROR_DATA errorData = {0};

  DWORD flags = INJ_CTF_HIDE_FROM_DEBUGGER | INJ_CTF_RUN_AND_FORGET |
                INJ_CTF_FAKE_START_ADDRESS | INJ_CTF_FAKE_TEB_CLIENT_ID|INJ_CTF_SKIP_THREAD_ATTACH;

  StartRoutine(hProcess, (f_Routine)pRoutine, pArg,
               LAUNCH_METHOD::LM_NtCreateThreadEx, flags, exitCode, 100,
               errorData);

  CloseHandle(hProcess);
}