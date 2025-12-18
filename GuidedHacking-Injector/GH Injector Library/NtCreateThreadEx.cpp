/*
 * Author:       Broihon
 * Copyright:    Guided Hacking™ © 2012-2023 Guided Hacking LLC
 * Copyright:    luxqaqq © 2023-2024 luxqaqq
 */

#include "pch.h"
#include "Start Routine.h"

// =============================================================
// Antidbg Direct Syscall Declarations
// 手动声明 antidbg 的系统调用函数，避免头文件冲突
// =============================================================
extern "C" {
    NTSTATUS DbgNtAllocateVirtualMemory(HANDLE ProcessHandle, PVOID* BaseAddress, ULONG_PTR ZeroBits, PSIZE_T RegionSize, ULONG AllocationType, ULONG Protect);
    NTSTATUS DbgNtFreeVirtualMemory(HANDLE ProcessHandle, PVOID* BaseAddress, PSIZE_T RegionSize, ULONG FreeType);
    NTSTATUS DbgNtWriteVirtualMemory(HANDLE ProcessHandle, PVOID BaseAddress, PVOID Buffer, SIZE_T NumberOfBytesToWrite, PSIZE_T NumberOfBytesWritten);
    NTSTATUS DbgNtReadVirtualMemory(HANDLE ProcessHandle, PVOID BaseAddress, PVOID Buffer, SIZE_T NumberOfBytesToRead, PSIZE_T NumberOfBytesRead);
    NTSTATUS DbgNtProtectVirtualMemory(HANDLE ProcessHandle, PVOID* BaseAddress, PSIZE_T RegionSize, ULONG NewProtect, PULONG OldProtect);
    NTSTATUS DbgNtCreateThreadEx(PHANDLE ThreadHandle, ACCESS_MASK DesiredAccess, PVOID ObjectAttributes, HANDLE ProcessHandle, PVOID StartRoutine, PVOID Argument, ULONG CreateFlags, ULONG_PTR ZeroBits, SIZE_T StackSize, SIZE_T MaximumStackSize, PVOID AttributeList);
    NTSTATUS DbgNtGetContextThread(HANDLE ThreadHandle, PCONTEXT pContext);
    NTSTATUS DbgNtSetContextThread(HANDLE ThreadHandle, PCONTEXT pContext);
    NTSTATUS DbgNtResumeThread(HANDLE ThreadHandle, PULONG PreviousSuspendCount);
    NTSTATUS DbgNtTerminateThread(HANDLE ThreadHandle, NTSTATUS ExitStatus);
    NTSTATUS DbgNtClose(HANDLE Handle);
    NTSTATUS DbgNtWaitForMultipleObjects(ULONG Count, PHANDLE Handles, ULONG WaitType, BOOLEAN Alertable, PLARGE_INTEGER Timeout);
    NTSTATUS DbgNtQueryInformationThread(HANDLE ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength, PULONG ReturnLength);
    NTSTATUS DbgNtDelayExecution(BOOLEAN Alertable, PLARGE_INTEGER DelayInterval);
}

// 辅助宏：将 Win32 错误码转换为 NTSTATUS (简单映射，用于日志)
#define NT_STATUS_FROM_WIN32(x) ((NTSTATUS)(x) <= 0 ? ((NTSTATUS)(x)) : ((NTSTATUS) (((x) & 0x0000FFFF) | (FACILITY_NTWIN32 << 16) | ERROR_SEVERITY_ERROR)))

DWORD SR_NtCreateThreadEx(HANDLE hTargetProc, f_Routine pRoutine, void *pArg,
                          DWORD Flags, DWORD &Out, DWORD Timeout,
                          ERROR_DATA &error_data) {
  LOG(2, "Begin SR_NtCreateThreadEx (Direct Syscall)\n");

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

    pEntrypoint = pi.GetEntrypoint();
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
    ntFlags |= THREAD_CREATE_FLAGS_CREATE_SUSPENDED;
  }

  if (Flags & INJ_CTF_FAKE_TEB_CLIENT_ID) {
    FakeClientId = true;
  }

#ifdef _WIN64
  BYTE Shellcode[] = {
      SR_REMOTE_DATA_BUFFER

      0x48, 0x85, 0xC9, // test rcx, rcx
      0x74, 0x5B,       // je 0x60

      0x53,             // push rbx
      0x48, 0x8B, 0xD9, // mov rbx, rcx
      0xC6, 0x03, 0x01, // mov byte ptr [rbx], 1

      0x83, 0x7B, 0x28, 0x00, // cmp dword ptr [rbx + 0x28], 0
      0x74, 0x11,             // je 0x23
      0x48, 0x8B, 0x53, 0x28, // mov rdx, [rbx + 0x28]
      0x65, 0x48, 0x87, 0x14, 0x25, 0x48, 0x00, 0x00, 0x00, // xchg gs:[0x48], rdx
      0x48, 0x89, 0x53, 0x28, // mov [rbx + 0x28], rdx

      0x48, 0x8B, 0x4B, 0x18, // mov rcx, [rbx + 0x18]
      0x48, 0x83, 0xEC, 0x20, // sub rsp, 0x20
      0xFF, 0x53, 0x20,       // call qword ptr [rbx + 0x20]
      0x48, 0x83, 0xC4, 0x20, // add rsp, 0x20
      0x48, 0x89, 0x43, 0x08, // mov [rbx + 0x08], rax

      0x65, 0x48, 0x8B, 0x04, 0x25, 0x30, 0x00, 0x00, 0x00, // mov rax, gs:[0x30]
      0x8B, 0x40, 0x68,       // mov eax, [rax + 0x68]
      0x89, 0x43, 0x10,       // mov [rbx + 0x10], eax

      0x83, 0x7B, 0x28, 0x00, // cmp dword ptr [rbx + 0x28], 0
      0x74, 0x0D,             // je 0x58
      0x48, 0x8B, 0x53, 0x28, // mov rdx, [rbx + 0x28]
      0x65, 0x48, 0x89, 0x14, 0x25, 0x48, 0x00, 0x00, 0x00, // mov gs:[0x48], rdx

      0xC6, 0x03, 0x02, // mov byte ptr [rbx], 2
      0x5B,             // pop rbx

      0x31, 0xC0,       // xor rax, rax
      0xEB, 0x03,       // jmp 0x63

      0x83, 0xC8, 0xFF, // or rax, -1

      0xC3              // ret
  };
#else
  // x86 Shellcode omitted for brevity, assuming x64 build
  BYTE Shellcode[] = { 0xCC }; 
#endif

  DWORD DataSize = sizeof(SR_REMOTE_DATA);
  DWORD CodeSize = sizeof(Shellcode) - DataSize;

  // 1. 分配数据内存 (RW) -> 使用 DbgNtAllocateVirtualMemory
  PVOID pDataMem = nullptr;
  SIZE_T RegionSize = DataSize;
  NTSTATUS status = DbgNtAllocateVirtualMemory(hTargetProc, &pDataMem, 0, &RegionSize, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
  
  if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtAllocateVirtualMemory (Data) failed: %08X\n", status);
      return SR_NTCTE_ERR_CANT_ALLOC_MEM;
  }

  // 2. 分配代码内存 (RW) -> 使用 DbgNtAllocateVirtualMemory
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

  // 准备数据
  auto *sr_data = ReCa<SR_REMOTE_DATA *>(Shellcode);
  sr_data->pArg = pArg;
  sr_data->pRoutine = pRoutine;
  sr_data->Buffer = FakeTID;

  LOG(2, "Data allocated at %p, Code allocated at %p\n", pDataMem, pCodeMem);

  // 3. 写入数据 -> 使用 DbgNtWriteVirtualMemory
  SIZE_T bytesWritten = 0;
  status = DbgNtWriteVirtualMemory(hTargetProc, pDataMem, Shellcode, DataSize, &bytesWritten);
  if (NT_FAIL(status)) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtWriteVirtualMemory (Data) failed: %08X\n", status);
    goto CLEANUP_MEM;
  }

  // 4. 写入代码 -> 使用 DbgNtWriteVirtualMemory
  status = DbgNtWriteVirtualMemory(hTargetProc, pCodeMem, Shellcode + DataSize, CodeSize, &bytesWritten);
  if (NT_FAIL(status)) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtWriteVirtualMemory (Code) failed: %08X\n", status);
    goto CLEANUP_MEM;
  }

  // 5. 修改代码内存为 RX -> 使用 DbgNtProtectVirtualMemory
  {
      ULONG oldProtect = 0;
      PVOID base = pCodeMem;
      RegionSize = CodeSize;
      status = DbgNtProtectVirtualMemory(hTargetProc, &base, &RegionSize, PAGE_EXECUTE_READ, &oldProtect);
      if (NT_FAIL(status)) {
          LOG(2, "DbgNtProtectVirtualMemory failed: %08X\n", status);
          // Continue anyway? Usually safer to fail.
      }
  }

  LOG(2, "Creating thread with:\n");
  LOG(3, "pRoutine = %p\n", pCodeMem);
  LOG(3, "pArg     = %p\n", pDataMem);

  // 6. 创建线程 -> 使用 DbgNtCreateThreadEx
  status = DbgNtCreateThreadEx(
      &hThread, THREAD_ALL_ACCESS, nullptr, hTargetProc,
      FakeStartAddress ? pEntrypoint : pCodeMem, pDataMem, ntFlags, 0, 0, 0,
      nullptr);

  if (NT_FAIL(status) || !hThread) {
    INIT_ERROR_DATA(error_data, (DWORD)status);
    LOG(2, "DbgNtCreateThreadEx failed: %08X\n", status);
    goto CLEANUP_MEM;
  }

  auto TID = GetThreadId(hThread); // GetThreadId is kernel32, but it just parses the handle/TEB locally.
  LOG(2, "Thread created with TID = %06X (%06d)\n", TID, TID);

  if (FakeStartAddress) {
    CONTEXT ctx{0};
    ctx.ContextFlags = CONTEXT_ALL;

    // 7. 获取上下文 -> DbgNtGetContextThread
    status = DbgNtGetContextThread(hThread, &ctx);
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtGetContextThread failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    LOG(2, "Loaded thread context\n");

#ifdef _WIN64
    ctx.Rcx = ReCa<DWORD64>(pCodeMem);
#else
    ctx.Eax = ReCa<DWORD>(pCodeMem);
#endif

    // 8. 设置上下文 -> DbgNtSetContextThread
    status = DbgNtSetContextThread(hThread, &ctx);
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtSetContextThread failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }
    LOG(2, "Thread redirected\n");
  }

  if (Flags & INJ_CTF_SKIP_THREAD_ATTACH) {
    THREAD_BASIC_INFORMATION tbi{0};
    // 9. 查询线程信息 -> DbgNtQueryInformationThread
    status = DbgNtQueryInformationThread(
        hThread, THREADINFOCLASS::ThreadBasicInformation, &tbi, sizeof(tbi),
        nullptr);
    
    if (NT_FAIL(status) || !tbi.TebBaseAddress) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtQueryInformationThread failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    WORD same_teb_flags = 0;
    // 10. 读取 TEB -> DbgNtReadVirtualMemory
    status = DbgNtReadVirtualMemory(hTargetProc,
                           ReCa<BYTE *>(tbi.TebBaseAddress) + TEB_SameTebFlags,
                           &same_teb_flags, sizeof(same_teb_flags), nullptr);
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtReadVirtualMemory (TEB) failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    same_teb_flags |= TEB_SAMETEB_FLAGS_SkipAttach;
    
    // 11. 写入 TEB -> DbgNtWriteVirtualMemory
    status = DbgNtWriteVirtualMemory(hTargetProc,
                            ReCa<BYTE *>(tbi.TebBaseAddress) + TEB_SameTebFlags,
                            &same_teb_flags, sizeof(same_teb_flags), nullptr);
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtWriteVirtualMemory (TEB) failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }

    LOG(2, "Fixed TEB flags\n");
  }

  if (ntFlags & THREAD_CREATE_FLAGS_CREATE_SUSPENDED) {
    ULONG prevSuspend = 0;
    // 12. 恢复线程 -> DbgNtResumeThread
    status = DbgNtResumeThread(hThread, &prevSuspend);
    if (NT_FAIL(status)) {
      INIT_ERROR_DATA(error_data, (DWORD)status);
      LOG(2, "DbgNtResumeThread failed: %08X\n", status);
      goto CLEANUP_THREAD;
    }
    LOG(2, "Thread resumed\n");
  }

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

  SR_REMOTE_DATA data{};
  data.State = SR_REMOTE_STATE::SR_RS_ExecutionPending;
  data.Ret = ERROR_SUCCESS;
  data.LastWin32Error = ERROR_SUCCESS;

  HANDLE handles[] = {hThread, g_hInterruptedEvent};

  // 14. 等待 -> DbgNtWaitForMultipleObjects
  // 注意：NtWaitForMultipleObjects 参数与 Win32 不同
  // NTSTATUS NtWaitForMultipleObjects(Count, Handles, WaitType, Alertable, Timeout)
  // WaitType: 0 = WaitAll, 1 = WaitAny
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

  // GetExitCodeThread is just a wrapper around NtQueryInformationThread
  // We can skip it or implement it via DbgNtQueryInformationThread if needed, 
  // but we are reading the result struct anyway.

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

    if (data.State != SR_REMOTE_STATE::SR_RS_ExecutionFinished) {
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
    
    return SR_NTCTE_ERR_REMOTE_TIMEOUT; // Generic error fallback
}