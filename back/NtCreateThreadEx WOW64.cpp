/*
 * Author:       Broihon
 * Copyright:    Guided Hacking™ © 2012-2023 Guided Hacking LLC
 */

#include "pch.h"

#ifdef _WIN64

#include "Start Routine.h"

DWORD SR_NtCreateThreadEx_WOW64(HANDLE hTargetProc, f_Routine_WOW64 pRoutine,
                                DWORD pArg, DWORD Flags, DWORD &Out,
                                DWORD Timeout, ERROR_DATA &error_data) {
  LOG(2, "Begin SR_NtCreateThreadEx_WOW64\n");

  ProcessInfo pi;
  void *pEntrypoint = nullptr;
  DWORD FakeTID = 0;

  if (Flags & (INJ_CTF_FAKE_START_ADDRESS | INJ_CTF_FAKE_TEB_CLIENT_ID)) {
    LOG(2, "Thread cloaking specified\n");

    if (!pi.SetProcess(hTargetProc)) {
      INIT_ERROR_DATA(error_data, INJ_ERR_ADVANCED_NOT_DEFINED);
      LOG(2, "Can't initialize ProcessInfo class\n");
      return SR_NTCTE_ERR_PROC_INFO_FAIL;
    }

    pEntrypoint = pi.GetEntrypoint_WOW64();
    if (pEntrypoint == nullptr) {
      INIT_ERROR_DATA(error_data, INJ_ERR_ADVANCED_NOT_DEFINED);
      LOG(2, "Failed to resolve entrypoint\n");
      return SR_NTCTE_ERR_GET_ENTRYPOINT;
    }

    FakeTID = pi.GetThreadId();
  }

  DWORD ntFlags = NULL;
  HANDLE hThread = nullptr;

  bool FakeStartAddress = false;
  bool FakeClientId = false;

  if (Flags & INJ_CTF_FAKE_START_ADDRESS) {
    FakeStartAddress = true;
    ntFlags |= THREAD_CREATE_FLAGS_CREATE_SUSPENDED;
  }

  if (Flags & INJ_CTF_HIDE_FROM_DEBUGGER) {
    ntFlags |= THREAD_CREATE_FLAGS_HIDE_FROM_DEBUGGER;
  }

  if (Flags & INJ_CTF_SKIP_THREAD_ATTACH) {
    ntFlags |= THREAD_CREATE_FLAGS_SKIP_THREAD_ATTACH;
  }

  if (Flags & INJ_CTF_FAKE_TEB_CLIENT_ID) {
    FakeClientId = true;
  }

  // [修改] 分离数据和代码
  DWORD DataSize = sizeof(SR_REMOTE_DATA_WOW64);
  DWORD CodeSize = 0x200 - DataSize; // 保持总大小 0x200

  void *pDataMem = VirtualAllocEx(hTargetProc, nullptr, DataSize,
                                  MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
  void *pCodeMem = VirtualAllocEx(hTargetProc, nullptr, CodeSize,
                                  MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);

  if (!pDataMem || !pCodeMem) {
    if (pDataMem)
      VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
    if (pCodeMem)
      VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);

    INIT_ERROR_DATA(error_data, GetLastError());
    LOG(2, "VirtualAllocEx failed: %08X\n", error_data.AdvErrorCode);
    return SR_NTCTE_ERR_CANT_ALLOC_MEM;
  }

  BYTE Shellcode[] = {
      SR_REMOTE_DATA_BUFFER_86

      0x55, // + 0x00	-> push	ebp
      0x89,
      0xE5, // + 0x01	-> mov	ebp, esp

      0x53, // + 0x03	-> push	ebx
      0x8B,
      0x5D,
      0x08, // + 0x04	-> mov	ebx, [ebp + 0x08]
      0x85,
      0xDB, // + 0x07	-> test	ebx, ebx
      0x74,
      0x42, // + 0x09	-> je	0x4D

      0xC6,
      0x03,
      0x01, // + 0x0B	-> mov	byte ptr [ebx], 1

      0x83,
      0x7B,
      0x14,
      0x00, // + 0x0E	-> cmp  dword ptr [ebx + 0x14], 0
      0x74,
      0x0D, // + 0x12	-> je   0x21
      0x8B,
      0x53,
      0x14, // + 0x14	-> mov  edx, [ebx + 0x14]
      0x64,
      0x87,
      0x15,
      0x24,
      0x00,
      0x00,
      0x00, // + 0x17	-> xchg fs:[0x24], edx
      0x89,
      0x53,
      0x14, // + 0x1E	-> mov  [ebx + 0x14], edx

      0xFF,
      0x73,
      0x0C, // + 0x21	-> push	[ebx + 0x0C]
      0xFF,
      0x53,
      0x10, // + 0x24	-> call	dword ptr [ebx + 0x10]
      0x89,
      0x43,
      0x04, // + 0x27	-> mov	[ebx + 0x04], eax

      0x64,
      0xA1,
      0x18,
      0x00,
      0x00,
      0x00, // + 0x2D	-> mov	eax, fs:[0x18]
      0x8B,
      0x40,
      0x34, // + 0x30	-> mov	eax, [eax + 0x34]
      0x89,
      0x43,
      0x08, // + 0x33	-> mov	[ebx + 0x08], eax

      0x83,
      0x7B,
      0x14,
      0x00, // + 0x36	-> cmp  dword ptr [ebx + 0x14], 0
      0x74,
      0x0A, // + 0x3A	-> je   0x46
      0x8B,
      0x53,
      0x14, // + 0x3C	-> mov  edx, [ebx + 0x14]
      0x64,
      0x89,
      0x15,
      0x24,
      0x00,
      0x00,
      0x00, // + 0x3F	-> mov  fs:[0x24], edx

      0xC6,
      0x03,
      0x02, // + 0x46	-> mov	byte ptr [ebx], 2
      0x31,
      0xC0, // + 0x49	-> xor	eax, eax
      0xEB,
      0x03, // + 0x4B	-> jmp	0x50

      0x83,
      0xC8,
      0xFF, // + 0x4D	-> or	eax, -1

      0x5B, // + 0x50	-> pop	ebx

      0x5D, // + 0x51	-> pop	ebp
      0xC2,
      0x04,
      0x00 // + 0x52	-> ret	0x04
  };

  auto *sr_data = ReCa<SR_REMOTE_DATA_WOW64 *>(Shellcode);
  sr_data->pArg = MDWD(pArg);
  sr_data->pRoutine = MDWD(pRoutine);
  sr_data->Buffer = FakeTID;

  LOG(2, "Data allocated at %p, Code allocated at %p\n", pDataMem, pCodeMem);

  // 写入数据
  if (!WriteProcessMemory(hTargetProc, pDataMem, Shellcode, DataSize,
                          nullptr)) {
    INIT_ERROR_DATA(error_data, GetLastError());
    LOG(2, "WriteProcessMemory failed: %08X\n", error_data.AdvErrorCode);
    VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
    VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);
    return SR_NTCTE_ERR_WPM_FAIL;
  }

  // 写入代码
  if (!WriteProcessMemory(hTargetProc, pCodeMem, Shellcode + DataSize, CodeSize,
                          nullptr)) {
    INIT_ERROR_DATA(error_data, GetLastError());
    LOG(2, "WriteProcessMemory failed: %08X\n", error_data.AdvErrorCode);
    VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
    VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);
    return SR_NTCTE_ERR_WPM_FAIL;
  }

  // 修改代码权限为 RX
  DWORD oldProtect = 0;
  VirtualProtectEx(hTargetProc, pCodeMem, CodeSize, PAGE_EXECUTE_READ,
                   &oldProtect);

  LOG(2, "Creating thread with:\n");
  LOG(3, "pRoutine = %08X\n", MDWD(pCodeMem));
  LOG(3, "pArg     = %08X\n", MDWD(pDataMem));

  NTSTATUS ntRet = NATIVE::NtCreateThreadEx(
      &hThread, THREAD_ALL_ACCESS, nullptr, hTargetProc,
      FakeStartAddress ? pEntrypoint : pCodeMem, pDataMem, ntFlags, 0, 0, 0,
      nullptr);
  if (NT_FAIL(ntRet) || !hThread) {
    INIT_ERROR_DATA(error_data, (DWORD)ntRet);
    LOG(2, "NtCreateThreadEx failed: %08X\n", (DWORD)ntRet);
    VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
    VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);
    return SR_NTCTE_ERR_NTCTE_FAIL;
  }

  auto TID = GetThreadId(hThread);

  LOG(2, "Thread created with TID = %06X (%06d)\n", TID, TID);

  if (FakeStartAddress) {
    WOW64_CONTEXT ctx{0};
    ctx.ContextFlags = WOW64_CONTEXT_ALL;

    if (!Wow64GetThreadContext(hThread, &ctx)) {
      INIT_ERROR_DATA(error_data, GetLastError());
      LOG(2, "Wow64GetThreadContext failed: %08X\n", error_data.AdvErrorCode);
      TerminateThread(hThread, 0);
      CloseHandle(hThread);
      VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
      VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);
      return SR_NTCTE_ERR_GET_CONTEXT_FAIL;
    }

    LOG(2, "Loaded thread context\n");

    ctx.Eax = MDWD(pCodeMem); // 修改为 pCodeMem

    if (!Wow64SetThreadContext(hThread, &ctx)) {
      INIT_ERROR_DATA(error_data, GetLastError());
      LOG(2, "Wow64SetThreadContext failed: %08X\n", error_data.AdvErrorCode);
      TerminateThread(hThread, 0);
      CloseHandle(hThread);
      VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
      VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);
      return SR_NTCTE_ERR_SET_CONTEXT_FAIL;
    }

    LOG(2, "Thread redirected\n");

    if (ResumeThread(hThread) == (DWORD)-1) {
      INIT_ERROR_DATA(error_data, GetLastError());
      LOG(2, "ResumeThread failed: %08X\n", error_data.AdvErrorCode);
      TerminateThread(hThread, 0);
      CloseHandle(hThread);
      VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
      VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);
      return SR_NTCTE_ERR_RESUME_FAIL;
    }

    LOG(2, "Thread resumed\n");
  }

  // Run and Forget
  if (Flags & INJ_CTF_RUN_AND_FORGET) {
    LOG(2, "Run and Forget flag set. Skipping wait and cleanup.\n");
    CloseHandle(hThread);
    return SR_ERR_SUCCESS;
  }

  LOG(2, "Entering wait state\n");

  Sleep(SR_REMOTE_DELAY);

  DWORD dwExitCode = 0;

  SR_REMOTE_DATA_WOW64 data{};
  data.State = (DWORD)SR_REMOTE_STATE::SR_RS_ExecutionPending;
  data.Ret = ERROR_SUCCESS;
  data.LastWin32Error = ERROR_SUCCESS;

  HANDLE handles[] = {hThread, g_hInterruptedEvent};

  DWORD dwWaitRet = WaitForMultipleObjects(2, handles, FALSE, Timeout);
  if (dwWaitRet != WAIT_OBJECT_0) {
    if (dwWaitRet == (WAIT_OBJECT_0 + 1)) {
      INIT_ERROR_DATA(error_data, dwWaitRet);
      LOG(2, "Interrupt!\n");
    } else {
      if (dwWaitRet == WAIT_FAILED) {
        INIT_ERROR_DATA(error_data, GetLastError());
        LOG(2, "WaitForMultipleObjects failed: %08X\n",
            error_data.AdvErrorCode);
      } else {
        INIT_ERROR_DATA(error_data, dwWaitRet);
        LOG(2, "Timeout!\n");
      }
    }

    TerminateThread(hThread, 0);
    CloseHandle(hThread);

    VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
    VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);

    if (dwWaitRet == (WAIT_OBJECT_0 + 1)) {
      return SR_ERR_INTERRUPT;
    }

    return SR_NTCTE_ERR_REMOTE_TIMEOUT;
  }

  LOG(2, "Thread finished execution\n");

  if (!GetExitCodeThread(hThread, &dwExitCode)) {
    INIT_ERROR_DATA(error_data, GetLastError());
    LOG(2, "GetExitCodeThread failed: %08X\n", error_data.AdvErrorCode);
  }

  // [修改] 从 pDataMem 读取数据
  BOOL bRet = ReadProcessMemory(hTargetProc, pDataMem, &data, sizeof(data), nullptr);

  DWORD dwErr = GetLastError();

  CloseHandle(hThread);

  // [修改] 释放两块内存
  VirtualFreeEx(hTargetProc, pDataMem, 0, MEM_RELEASE);
  VirtualFreeEx(hTargetProc, pCodeMem, 0, MEM_RELEASE);

  if (bRet) {
    LOG(2, "Remote data:\n");
    LOG(3, "State = %d\n", data.State);
    LOG(3, "Ret   = %08X\n", data.Ret);
    LOG(3, "Error = %08X\n", data.LastWin32Error);

    if (data.State != (DWORD)SR_REMOTE_STATE::SR_RS_ExecutionFinished) {
      INIT_ERROR_DATA(error_data, data.LastWin32Error);
      return SR_NTCTE_ERR_REMOTE_TIMEOUT; // 使用现有的超时错误码
    }
  }

  // 恢复原始的错误处理逻辑
  if (dwExitCode == 0xFFFFFFFF) {
    INIT_ERROR_DATA(error_data, INJ_ERR_ADVANCED_NOT_DEFINED);
    LOG(2, "Shellcode creation failed\n");
    return SR_NTCTE_ERR_SHELLCODE_SETUP_FAIL;
  } else if (!bRet) {
    INIT_ERROR_DATA(error_data, dwErr);
    LOG(2, "ReadProcessMemory failed: %08X\n", error_data.AdvErrorCode);
    return SR_NTCTE_ERR_RPM_FAIL;
  }

  LOG(2, "pRoutine returned: %08X\n", data.Ret);

  Out = data.Ret;

  return SR_ERR_SUCCESS;
}

#endif