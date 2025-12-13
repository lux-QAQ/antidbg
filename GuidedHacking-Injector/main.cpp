#include <Windows.h>
#include <cstdlib>
#include <iostream>

// 前置声明必需的类型和函数
#include "GH Injector Library/Start Routine.h"
#include "GH Injector Library/pch.h"

// 包含 NT 函数定义
#include "GH Injector Library/NT Funcs.h"

// 手动初始化必要的 NT 函数
void InitNTFuncs() {
  HMODULE hNtdll = GetModuleHandleW(L"ntdll.dll");
  if (!hNtdll)
    return;

  // 初始化 NtCreateThreadEx
  if (!NATIVE::NtCreateThreadEx) {
    NATIVE::NtCreateThreadEx =
        (f_NtCreateThreadEx)GetProcAddress(hNtdll, "NtCreateThreadEx");
  }

  // 初始化 NtQueryInformationThread (用于 SkipThreadAttach)
  if (!NATIVE::NtQueryInformationThread) {
    NATIVE::NtQueryInformationThread =
        (f_NtQueryInformationThread)GetProcAddress(hNtdll,
                                                   "NtQueryInformationThread");
  }

  // 初始化 NtQueryInformationProcess (用于 ProcessInfo)
  if (!NATIVE::NtQueryInformationProcess) {
    NATIVE::NtQueryInformationProcess =
        (f_NtQueryInformationProcess)GetProcAddress(
            hNtdll, "NtQueryInformationProcess");
  }

  // 初始化其他可能用到的函数
  if (!NATIVE::NtClose) {
    NATIVE::NtClose = (f_NtClose)GetProcAddress(hNtdll, "NtClose");
  }
}

// 反调试检测线程函数
DWORD __stdcall AntiDebugLoop(void *pArg) {
  DWORD tid = GetCurrentThreadId();
  printf("[AntiDebug] Hidden thread started. TID: %d\n", tid);

  while (true) {
    bool detected = false;

    // 1. IsDebuggerPresent 检测
    if (IsDebuggerPresent()) {
      detected = true;
    }

    // 2. CheckRemoteDebuggerPresent 检测
    BOOL isRemote = FALSE;
    if (CheckRemoteDebuggerPresent(GetCurrentProcess(), &isRemote) &&
        isRemote) {
      detected = true;
    }

    if (detected) {
      printf("[AntiDebug] !!! Debugger Detected !!!\n");
      // 发现调试器后的操作，例如退出进程
      // exit(0);
    }

    Sleep(1000);
  }
  return 0;
}

int main() {
  // [关键] 在做任何操作前先初始化函数指针
  InitNTFuncs();

  if (!NATIVE::NtCreateThreadEx) {
    std::cout << "[Error] Failed to resolve NtCreateThreadEx. Aborting."
              << std::endl;
    return -1;
  }

  std::cout << "[Main] Process started. PID: " << GetCurrentProcessId()
            << std::endl;

  // 修改这里：获取真实句柄而不是伪句柄
  // HANDLE hProcess = GetCurrentProcess();
  HANDLE hProcess =
      OpenProcess(PROCESS_ALL_ACCESS, FALSE, GetCurrentProcessId());

  if (!hProcess) {
    std::cout << "[Error] Failed to open current process." << std::endl;
    return -1;
  }

  DWORD exitCode = 0;
  ERROR_DATA errorData = {0};

  // 组合标志：
  // 1. INJ_CTF_HIDE_FROM_DEBUGGER: 阻止调试器接收创建事件
  // 2. INJ_CTF_RUN_AND_FORGET: 注入后不等待，保持 Shellcode 内存
  // 3. INJ_CTF_FAKE_START_ADDRESS: [新增] 伪装起始地址，使其看起来像合法线程
  DWORD flags = INJ_CTF_HIDE_FROM_DEBUGGER | INJ_CTF_RUN_AND_FORGET |
                INJ_CTF_FAKE_START_ADDRESS | INJ_CTF_FAKE_TEB_CLIENT_ID|INJ_CTF_SKIP_THREAD_ATTACH;

  std::cout << "[Main] Launching hidden anti-debug thread..." << std::endl;

  // 使用 NtCreateThreadEx 方法创建线程
  DWORD ret = StartRoutine(hProcess, (f_Routine)AntiDebugLoop, nullptr,
                           LAUNCH_METHOD::LM_HijackThread, flags, exitCode,
                           1000, errorData);

  // 记得在程序结束前关闭句柄
  CloseHandle(hProcess);

  if (ret == SR_ERR_SUCCESS) {
    std::cout << "[Main] Hidden thread created successfully." << std::endl;
  } else {
    std::cout << "[Main] Failed to create thread. Error: 0x" << std::hex << ret
              << std::endl;
    if (errorData.AdvErrorCode != 0) {
      std::cout << "[Main] Advanced error code: 0x" << std::hex
                << errorData.AdvErrorCode << std::endl;
    }
    // 不要直接退出，方便查看错误
    system("pause");
    return 1;
  }

  // 主线程继续执行
  std::cout << "[Main] Main thread running. Press Ctrl+C to exit." << std::endl;

  while (true) {

    Sleep(5000);
    std::cout << "[Main] Heartbeat..." << std::endl;
  }


  return 0;
}