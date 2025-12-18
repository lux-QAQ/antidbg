/*
 * Author:       Broihon
 * Copyright:    Guided Hacking™ © 2012-2023 Guided Hacking LLC
 * Copyright:    luxqaqq © 2023-2024 luxqaqq
 */

#include "pch.h"

#ifdef _WIN64

#include "Start Routine.h"

// =============================================================
// Antidbg Direct Syscall Declarations
// 手动声明，避免包含 syscall.h 导致的类型冲突
// =============================================================
extern "C" {
    NTSTATUS DbgNtAllocateVirtualMemory(HANDLE ProcessHandle, PVOID* BaseAddress, ULONG_PTR ZeroBits, PSIZE_T RegionSize, ULONG AllocationType, ULONG Protect);
    NTSTATUS DbgNtFreeVirtualMemory(HANDLE ProcessHandle, PVOID* BaseAddress, PSIZE_T RegionSize, ULONG FreeType);
    NTSTATUS DbgNtWriteVirtualMemory(HANDLE ProcessHandle, PVOID BaseAddress, PVOID Buffer, SIZE_T NumberOfBytesToWrite, PSIZE_T NumberOfBytesWritten);
    NTSTATUS DbgNtReadVirtualMemory(HANDLE ProcessHandle, PVOID BaseAddress, PVOID Buffer, SIZE_T NumberOfBytesToRead, PSIZE_T NumberOfBytesRead);
    NTSTATUS DbgNtProtectVirtualMemory(HANDLE ProcessHandle, PVOID* BaseAddress, PSIZE_T RegionSize, ULONG NewProtect, PULONG OldProtect);
    NTSTATUS DbgNtCreateThreadEx(PHANDLE ThreadHandle, ACCESS_MASK DesiredAccess, PVOID ObjectAttributes, HANDLE ProcessHandle, PVOID StartRoutine, PVOID Argument, ULONG CreateFlags, ULONG_PTR ZeroBits, SIZE_T StackSize, SIZE_T MaximumStackSize, PVOID AttributeList);
    NTSTATUS DbgNtResumeThread(HANDLE ThreadHandle, PULONG PreviousSuspendCount);
    NTSTATUS DbgNtTerminateThread(HANDLE ThreadHandle, NTSTATUS ExitStatus);
    NTSTATUS DbgNtClose(HANDLE Handle);
    NTSTATUS DbgNtWaitForMultipleObjects(ULONG Count, PHANDLE Handles, ULONG WaitType, BOOLEAN Alertable, PLARGE_INTEGER Timeout);
    NTSTATUS DbgNtQueryInformationThread(HANDLE ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength, PULONG ReturnLength);
    NTSTATUS DbgNtSetInformationThread(HANDLE ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength);
    NTSTATUS DbgNtDelayExecution(BOOLEAN Alertable, PLARGE_INTEGER DelayInterval);
}

// 定义 ThreadWow64Context，避免依赖 nttypes.h
#define ThreadWow64Context ((THREADINFOCLASS)29)

// 辅助宏
#define NT_STATUS_FROM_WIN32(x) ((NTSTATUS)(x) <= 0 ? ((NTSTATUS)(x)) : ((NTSTATUS) (((x) & 0x0000FFFF) | (FACILITY_NTWIN32 << 16) | ERROR_SEVERITY_ERROR)))

DWORD SR_NtCreateThreadEx_WOW64(HANDLE hTargetProc, f_Routine_WOW64 pRoutine,
                                DWORD pArg, DWORD Flags, DWORD &Out,
                                DWORD Timeout, ERROR_DATA &error_data) {
  LOG(2, "Begin SR_NtCreateThreadEx_WOW64 (Direct Syscall Version)\n");

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

  // 1. 分配数据内存 (RW) -> DbgNtAllocateVirtualMemory
  PVOID pDataMem = nullptr;
  SIZE_T RegionSize = DataSize;
  NTSTATUS status = DbgNtAllocateVirtualMemory(hTargetProc, &pDataMem, 0, &RegionSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);

  if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtAllocateVirtualMemory (Data) failed: %08X\n", status);
      return SR_NTCTE_ERR_CANT_ALLOC_MEM;
  }

  // 2. 分配代码内存 (RW) -> DbgNtAllocateVirtualMemory
  PVOID pCodeMem = nullptr;
  RegionSize = CodeSize;
  status = DbgNtAllocateVirtualMemory(hTargetProc, &pCodeMem, 0, &RegionSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);

  if (NT_FAIL(status)) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtAllocateVirtualMemory (Code) failed: %08X\n", status);
    
    RegionSize = 0;
    DbgNtFreeVirtualMemory(hTargetProc, &pDataMem, &RegionSize, MEM_RELEASE);
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

  // 3. 写入数据 -> DbgNtWriteVirtualMemory
  SIZE_T bytesWritten = 0;
  status = DbgNtWriteVirtualMemory(hTargetProc, pDataMem, Shellcode, DataSize, &bytesWritten);
  if (NT_FAIL(status)) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtWriteVirtualMemory (Data) failed: %08X\n", status);
    goto CLEANUP_MEM;
  }

  // 4. 写入代码 -> DbgNtWriteVirtualMemory
  status = DbgNtWriteVirtualMemory(hTargetProc, pCodeMem, Shellcode + DataSize, CodeSize, &bytesWritten);
  if (NT_FAIL(status)) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtWriteVirtualMemory (Code) failed: %08X\n", status);
    goto CLEANUP_MEM;
  }

  // 5. 修改代码内存为 RX -> DbgNtProtectVirtualMemory
  {
      ULONG oldProtect = 0;
      PVOID base = pCodeMem;
      RegionSize = CodeSize;
      status = DbgNtProtectVirtualMemory(hTargetProc, &base, &RegionSize, PAGE_EXECUTE_READ, &oldProtect);
      if (NT_FAIL(status)) {
          LOG(2, "DbgNtProtectVirtualMemory failed: %08X\n", status);
      }
  }

  LOG(2, "Creating thread with:\n");
  LOG(3, "pRoutine = %08X\n", MDWD(pCodeMem));
  LOG(3, "pArg     = %08X\n", MDWD(pDataMem));

  // 6. 创建线程 -> DbgNtCreateThreadEx
  status = DbgNtCreateThreadEx(
      &hThread, THREAD_ALL_ACCESS, nullptr, hTargetProc,
      FakeStartAddress ? pEntrypoint : pCodeMem, pDataMem, ntFlags, 0, 0, 0,
      nullptr);

  if (NT_FAIL(status) || !hThread) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtCreateThreadEx failed: %08X\n", status);
    goto CLEANUP_MEM;
  }

  auto TID = GetThreadId(hThread);

  LOG(2, "Thread created with TID = %06X (%06d)\n", TID, TID);

  if (FakeStartAddress) {
    WOW64_CONTEXT ctx{0};
    ctx.ContextFlags = WOW64_CONTEXT_ALL;

    // 7. 获取上下文 -> DbgNtQueryInformationThread (ThreadWow64Context)
    // 使用未文档化的 ThreadWow64Context (29) 来获取 WOW64 上下文
    status = DbgNtQueryInformationThread(hThread, ThreadWow64Context, &ctx, sizeof(ctx), nullptr);
    
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtQueryInformationThread(ThreadWow64Context) failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    LOG(2, "Loaded thread context\n");

    ctx.Eax = MDWD(pCodeMem); // 修改为 pCodeMem

    // 8. 设置上下文 -> DbgNtSetInformationThread (ThreadWow64Context)
    status = DbgNtSetInformationThread(hThread, ThreadWow64Context, &ctx, sizeof(ctx));
    
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtSetInformationThread(ThreadWow64Context) failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    LOG(2, "Thread redirected\n");

    // 9. 恢复线程 -> DbgNtResumeThread
    ULONG prevSuspend = 0;
    status = DbgNtResumeThread(hThread, &prevSuspend);
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtResumeThread failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    LOG(2, "Thread resumed\n");
  }

  // Run and Forget
  if (Flags & INJ_CTF_RUN_AND_FORGET) {
    LOG(2, "Run and Forget flag set. Skipping wait and cleanup.\n");
    DbgNtClose(hThread);
    return SR_ERR_SUCCESS;
  }

  LOG(2, "Entering wait state\n");

  // 13. 延时 -> DbgNtDelayExecution
  {
      LARGE_INTEGER interval;
      interval.QuadPart = -1 * SR_REMOTE_DELAY * 10000;
      DbgNtDelayExecution(FALSE, &interval);
  }

  DWORD dwExitCode = 0;

  SR_REMOTE_DATA_WOW64 data{};
  data.State = (DWORD)SR_REMOTE_STATE::SR_RS_ExecutionPending;
  data.Ret = ERROR_SUCCESS;
  data.LastWin32Error = ERROR_SUCCESS;

  HANDLE handles[] = {hThread, g_hInterruptedEvent};

  // 14. 等待 -> DbgNtWaitForMultipleObjects
  LARGE_INTEGER timeoutLI;
  timeoutLI.QuadPart = -((LONGLONG)Timeout * 10000);
  
  status = DbgNtWaitForMultipleObjects(2, handles, 1, FALSE, &timeoutLI);
  
  if (status != STATUS_WAIT_0) {
      if (status == STATUS_WAIT_0 + 1) {
          INIT_ERROR_DATA(error_data, (DWORD)status);
          LOG(2, "Interrupt!\n");
      } else if (status == STATUS_TIMEOUT) {
          INIT_ERROR_DATA(error_data, (DWORD)status);
          LOG(2, "Timeout!\n");
      } else {
          INIT_ERROR_DATA(error_data, (DWORD)status);
          LOG(2, "DbgNtWaitForMultipleObjects failed: %08X\n", status);
      }
      
      goto CLEANUP_THREAD;
  }

  LOG(2, "Thread finished execution\n");

  // 15. 读取结果 -> DbgNtReadVirtualMemory
  status = DbgNtReadVirtualMemory(hTargetProc, pDataMem, &data, sizeof(data), nullptr);

  DbgNtClose(hThread);

  RegionSize = 0;
  DbgNtFreeVirtualMemory(hTargetProc, &pDataMem, &RegionSize, MEM_RELEASE);
  RegionSize = 0;
  DbgNtFreeVirtualMemory(hTargetProc, &pCodeMem, &RegionSize, MEM_RELEASE);

  if (NT_SUCCESS(status)) {
    LOG(2, "Remote data:\n");
    LOG(3, "State = %d\n", data.State);
    LOG(3, "Ret   = %08X\n", data.Ret);
    LOG(3, "Error = %08X\n", data.LastWin32Error);

    if (data.State != (DWORD)SR_REMOTE_STATE::SR_RS_ExecutionFinished) {
      INIT_ERROR_DATA(error_data, data.LastWin32Error);
      return SR_NTCTE_ERR_REMOTE_TIMEOUT;
    }
  } else {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtReadVirtualMemory failed: %08X\n", status);
      return SR_NTCTE_ERR_RPM_FAIL;
  }

  LOG(2, "pRoutine returned: %08X\n", data.Ret);

  Out = data.Ret;

  return SR_ERR_SUCCESS;

CLEANUP_THREAD:
    DbgNtTerminateThread(hThread, 0);
    DbgNtClose(hThread);

CLEANUP_MEM:
    if (pDataMem) {
        RegionSize = 0;
        DbgNtFreeVirtualMemory(hTargetProc, &pDataMem, &RegionSize, MEM_RELEASE);
    }
    if (pCodeMem) {
        RegionSize = 0;
        DbgNtFreeVirtualMemory(hTargetProc, &pCodeMem, &RegionSize, MEM_RELEASE);
    }
    
    if (status == STATUS_WAIT_0 + 1) return SR_ERR_INTERRUPT;
    
    return SR_NTCTE_ERR_REMOTE_TIMEOUT;
}

#endif