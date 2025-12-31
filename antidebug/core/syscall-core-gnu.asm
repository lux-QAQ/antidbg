#if (defined(__clang__) || defined(__GNUC__)) && !defined(_MSC_VER)
.intel_syntax noprefix
.text


.extern Dbg_GetSyscallNumber

.global DbgNtAccessCheck
DbgNtAccessCheck:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8C22C5FD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWorkerFactoryWorkerReady
DbgNtWorkerFactoryWorkerReady:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x715B47E5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAcceptConnectPort
DbgNtAcceptConnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE035FBDA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMapUserPhysicalPagesScatter
DbgNtMapUserPhysicalPagesScatter:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE18A2AD6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForSingleObject
DbgNtWaitForSingleObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0B12E409        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCallbackReturn
DbgNtCallbackReturn:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1C867E92        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReadFile
DbgNtReadFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE37EF3CB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeviceIoControlFile
DbgNtDeviceIoControlFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x78E6586C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWriteFile
DbgNtWriteFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAD65E7C3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRemoveIoCompletion
DbgNtRemoveIoCompletion:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5ED51C79        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReleaseSemaphore
DbgNtReleaseSemaphore:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8A9A7486        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReplyWaitReceivePort
DbgNtReplyWaitReceivePort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xECBFC720        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReplyPort
DbgNtReplyPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6AF47B58        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationThread
DbgNtSetInformationThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x38080AA1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetEvent
DbgNtSetEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x084935C0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtClose
DbgNtClose:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x00951D2D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryObject
DbgNtQueryObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCC95D518        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationFile
DbgNtQueryInformationFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x96071C10        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenKey
DbgNtOpenKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7AC69BBC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnumerateValueKey
DbgNtEnumerateValueKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x49FCABA7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFindAtom
DbgNtFindAtom:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD75BD6C9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDefaultLocale
DbgNtQueryDefaultLocale:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD158E1CD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryKey
DbgNtQueryKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x77CD5A5E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryValueKey
DbgNtQueryValueKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x29B9362C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAllocateVirtualMemory
DbgNtAllocateVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCBD3E774        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationProcess
DbgNtQueryInformationProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE280F928        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForMultipleObjects32
DbgNtWaitForMultipleObjects32:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0C812A6E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWriteFileGather
DbgNtWriteFileGather:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0DA2370B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateKey
DbgNtCreateKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x881B6C01        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFreeVirtualMemory
DbgNtFreeVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x831F8B8F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtImpersonateClientOfPort
DbgNtImpersonateClientOfPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBC317372        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReleaseMutant
DbgNtReleaseMutant:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0C821308        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationToken
DbgNtQueryInformationToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAF9B9530        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRequestWaitReplyPort
DbgNtRequestWaitReplyPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x20B24D6A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryVirtualMemory
DbgNtQueryVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC192D11B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenThreadToken
DbgNtOpenThreadToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB314C1F4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationThread
DbgNtQueryInformationThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x183F44FE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenProcess
DbgNtOpenProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x752F54BA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationFile
DbgNtSetInformationFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6CD5AAF6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMapViewOfSection
DbgNtMapViewOfSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x76A8543D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAccessCheckAndAuditAlarm
DbgNtAccessCheckAndAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x90551544        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnmapViewOfSection
DbgNtUnmapViewOfSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x72AE723D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReplyWaitReceivePortEx
DbgNtReplyWaitReceivePortEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x239EEEDA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTerminateProcess
DbgNtTerminateProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x07B2062E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetEventBoostPriority
DbgNtSetEventBoostPriority:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1CBB1638        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReadFileScatter
DbgNtReadFileScatter:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA1B26AEE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenThreadTokenEx
DbgNtOpenThreadTokenEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7AE0AFBD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenProcessTokenEx
DbgNtOpenProcessTokenEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE602107C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryPerformanceCounter
DbgNtQueryPerformanceCounter:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCBA4E17C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnumerateKey
DbgNtEnumerateKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB93DD4DA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenFile
DbgNtOpenFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF9B8E90D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDelayExecution
DbgNtDelayExecution:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFC483E19        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDirectoryFile
DbgNtQueryDirectoryFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x252207A4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySystemInformation
DbgNtQuerySystemInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3B6317B9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenSection
DbgNtOpenSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06A6180B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryTimer
DbgNtQueryTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x43974F0A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFsControlFile
DbgNtFsControlFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x983F5E84        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWriteVirtualMemory
DbgNtWriteVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x09970711        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCloseObjectAuditAlarm
DbgNtCloseObjectAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3A930ADE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDuplicateObject
DbgNtDuplicateObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x273E53A1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryAttributesFile
DbgNtQueryAttributesFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3ABB4C26        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtClearEvent
DbgNtClearEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x574C72E4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReadVirtualMemory
DbgNtReadVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0B930717        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenEvent
DbgNtOpenEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x189D7F86        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAdjustPrivilegesToken
DbgNtAdjustPrivilegesToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7DA6EE9A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDuplicateToken
DbgNtDuplicateToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x97A1E323        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtContinue
DbgNtContinue:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06A6D1EE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDefaultUILanguage
DbgNtQueryDefaultUILanguage:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1FB1D51C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueueApcThread
DbgNtQueueApcThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFA5FF4ED        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtYieldExecution
DbgNtYieldExecution:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD417DEF3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAddAtom
DbgNtAddAtom:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1C483DD9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateEvent
DbgNtCreateEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB115577F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryVolumeInformationFile
DbgNtQueryVolumeInformationFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA5066F27        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateSection
DbgNtCreateSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD08BF015        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushBuffersFile
DbgNtFlushBuffersFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x38BBA59E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtApphelpCacheControl
DbgNtApphelpCacheControl:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0197EBD1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateProcessEx
DbgNtCreateProcessEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9FF4AB48        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateThread
DbgNtCreateThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8ED454EA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtIsProcessInJob
DbgNtIsProcessInJob:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x96501A63        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtProtectVirtualMemory
DbgNtProtectVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x07922B07        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySection
DbgNtQuerySection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFFF0F965        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtResumeThread
DbgNtResumeThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1820429D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTerminateThread
DbgNtTerminateThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1E5B2C0D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReadRequestData
DbgNtReadRequestData:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9C100826        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateFile
DbgNtCreateFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6179AFD8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryEvent
DbgNtQueryEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x468C2F58        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWriteRequestData
DbgNtWriteRequestData:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2CB15A26        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenDirectoryObject
DbgNtOpenDirectoryObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x281718AA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAccessCheckByTypeAndAuditAlarm
DbgNtAccessCheckByTypeAndAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x542B46A6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForMultipleObjects
DbgNtWaitForMultipleObjects:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC122CDA3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationObject
DbgNtSetInformationObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1A242499        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelIoFile
DbgNtCancelIoFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1CBAD6EE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTraceEvent
DbgNtTraceEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xDF74D5E2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPowerInformation
DbgNtPowerInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x376F33F5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetValueKey
DbgNtSetValueKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06A2E0BD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelTimer
DbgNtCancelTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x4FE77548        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetTimer
DbgNtSetTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3D9B1520        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAccessCheckByType
DbgNtAccessCheckByType:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9E78C54C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAccessCheckByTypeResultList
DbgNtAccessCheckByTypeResultList:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE1A4D0E1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAccessCheckByTypeResultListAndAuditAlarm
DbgNtAccessCheckByTypeResultListAndAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x36A999A6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAccessCheckByTypeResultListAndAuditAlarmByHandle
DbgNtAccessCheckByTypeResultListAndAuditAlarmByHandle:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB5B9852C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAcquireProcessActivityReference
DbgNtAcquireProcessActivityReference:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBA8BBB2E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAddAtomEx
DbgNtAddAtomEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9991D4A4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAddBootEntry
DbgNtAddBootEntry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0998130A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAddDriverEntry
DbgNtAddDriverEntry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8611E6F7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAdjustGroupsToken
DbgNtAdjustGroupsToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x83A600BA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAdjustTokenClaimsAndDeviceGroups
DbgNtAdjustTokenClaimsAndDeviceGroups:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x63F5416D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlertResumeThread
DbgNtAlertResumeThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE4DE2BF5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlertThread
DbgNtAlertThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAC8FA629        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlertThreadByThreadId
DbgNtAlertThreadByThreadId:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x92B235AA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAllocateLocallyUniqueId
DbgNtAllocateLocallyUniqueId:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x73EB14E8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAllocateReserveObject
DbgNtAllocateReserveObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x07181787        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAllocateUserPhysicalPages
DbgNtAllocateUserPhysicalPages:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x331F08B0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAllocateUuids
DbgNtAllocateUuids:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6BEAFBE5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAllocateVirtualMemoryEx
DbgNtAllocateVirtualMemoryEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB4A36EE1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcAcceptConnectPort
DbgNtAlpcAcceptConnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE4B3DFFC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcCancelMessage
DbgNtAlpcCancelMessage:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x93305F81        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcConnectPort
DbgNtAlpcConnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5E80BFDE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcConnectPortEx
DbgNtAlpcConnectPortEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x615EDD9A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcCreatePort
DbgNtAlpcCreatePort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x20B02538        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcCreatePortSection
DbgNtAlpcCreatePortSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFB63C7CA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcCreateResourceReserve
DbgNtAlpcCreateResourceReserve:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x77663852        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcCreateSectionView
DbgNtAlpcCreateSectionView:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF4ABF335        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcCreateSecurityContext
DbgNtAlpcCreateSecurityContext:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x22A33520        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcDeletePortSection
DbgNtAlpcDeletePortSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD68BFCCF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcDeleteResourceReserve
DbgNtAlpcDeleteResourceReserve:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5CA4B827        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcDeleteSectionView
DbgNtAlpcDeleteSectionView:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x28B43D2B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcDeleteSecurityContext
DbgNtAlpcDeleteSecurityContext:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9E4B9BC2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcDisconnectPort
DbgNtAlpcDisconnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x22B23F1A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcImpersonateClientContainerOfPort
DbgNtAlpcImpersonateClientContainerOfPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x20B2D1E8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcImpersonateClientOfPort
DbgNtAlpcImpersonateClientOfPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBB30BCA3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcOpenSenderProcess
DbgNtAlpcOpenSenderProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF1ADE843        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcOpenSenderThread
DbgNtAlpcOpenSenderThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1AB5C40F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcQueryInformation
DbgNtAlpcQueryInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5CCC5A59        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcQueryInformationMessage
DbgNtAlpcQueryInformationMessage:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x07B0D888        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcRevokeSecurityContext
DbgNtAlpcRevokeSecurityContext:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x4E9A793A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcSendWaitReceivePort
DbgNtAlpcSendWaitReceivePort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x26B7C1DC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAlpcSetInformation
DbgNtAlpcSetInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1EB85C6D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAreMappedFilesTheSame
DbgNtAreMappedFilesTheSame:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA42EA1B7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAssignProcessToJobObject
DbgNtAssignProcessToJobObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF9560818        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAssociateWaitCompletionPacket
DbgNtAssociateWaitCompletionPacket:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0D3477DA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCallEnclave
DbgNtCallEnclave:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0AACC180        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelIoFileEx
DbgNtCancelIoFileEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCE55170B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelSynchronousIoFile
DbgNtCancelSynchronousIoFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1E543282        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelTimer2
DbgNtCancelTimer2:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x07A8DC25        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelWaitCompletionPacket
DbgNtCancelWaitCompletionPacket:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x396C1FDE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCommitComplete
DbgNtCommitComplete:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x269D3636        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCommitEnlistment
DbgNtCommitEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB923F0F1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCommitRegistryTransaction
DbgNtCommitRegistryTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9E30B8A5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCommitTransaction
DbgNtCommitTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x96CC5491        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCompactKeys
DbgNtCompactKeys:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x23B62600        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCompareObjects
DbgNtCompareObjects:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAE3D90FE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCompareSigningLevels
DbgNtCompareSigningLevels:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x32E8006E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCompareTokens
DbgNtCompareTokens:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7DD51731        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCompleteConnectPort
DbgNtCompleteConnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x64B2411C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCompressKey
DbgNtCompressKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x88155B4E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtConnectPort
DbgNtConnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7AF5796A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtConvertBetweenAuxiliaryCounterAndPerformanceCounter
DbgNtConvertBetweenAuxiliaryCounterAndPerformanceCounter:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2FA0473B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateDebugObject
DbgNtCreateDebugObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x16BF6A77        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateDirectoryObject
DbgNtCreateDirectoryObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x98A9A0E5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateDirectoryObjectEx
DbgNtCreateDirectoryObjectEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB24DF6F0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateEnclave
DbgNtCreateEnclave:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD1ACF97F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateEnlistment
DbgNtCreateEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x07C519AF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateEventPair
DbgNtCreateEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x80D2AE0A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateIRTimer
DbgNtCreateIRTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x23931934        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateIoCompletion
DbgNtCreateIoCompletion:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x920B9699        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateJobObject
DbgNtCreateJobObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x16BCC1E7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateJobSet
DbgNtCreateJobSet:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8009F8E5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateKeyTransacted
DbgNtCreateKeyTransacted:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9EC115EF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateKeyedEvent
DbgNtCreateKeyedEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x74AE0F48        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateLowBoxToken
DbgNtCreateLowBoxToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAF1AF5B2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateMailslotFile
DbgNtCreateMailslotFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3D9CACA8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateMutant
DbgNtCreateMutant:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x32AC353E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateNamedPipeFile
DbgNtCreateNamedPipeFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x74BB4A68        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreatePagingFile
DbgNtCreatePagingFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xACFD5EAA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreatePartition
DbgNtCreatePartition:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x04B26421        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreatePort
DbgNtCreatePort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF57FE8F7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreatePrivateNamespace
DbgNtCreatePrivateNamespace:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x88D649FB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateProcess
DbgNtCreateProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5B99246A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateProfile
DbgNtCreateProfile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x34A27A0A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateProfileEx
DbgNtCreateProfileEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x42A9BCDF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateRegistryTransaction
DbgNtCreateRegistryTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0C902C01        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateResourceManager
DbgNtCreateResourceManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8132D3EE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateSemaphore
DbgNtCreateSemaphore:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x188F4436        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateSymbolicLinkObject
DbgNtCreateSymbolicLinkObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x44DE4243        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateThreadEx
DbgNtCreateThreadEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD03F0E79        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateTimer
DbgNtCreateTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9A1FA093        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateTimer2
DbgNtCreateTimer2:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0985895B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateToken
DbgNtCreateToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x43DC4F46        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateTokenEx
DbgNtCreateTokenEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7A9D3866        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateTransaction
DbgNtCreateTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC4E5E2B1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateTransactionManager
DbgNtCreateTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9E29B2BB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateUserProcess
DbgNtCreateUserProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE2B3C32F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateWaitCompletionPacket
DbgNtCreateWaitCompletionPacket:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFFA1FB31        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateWaitablePort
DbgNtCreateWaitablePort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA476C9EE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateWnfStateName
DbgNtCreateWnfStateName:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFADAD54E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateWorkerFactory
DbgNtCreateWorkerFactory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3893D4F4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDebugActiveProcess
DbgNtDebugActiveProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0FA5083E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDebugContinue
DbgNtDebugContinue:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF25DFDF2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteAtom
DbgNtDeleteAtom:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1AC90740        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteBootEntry
DbgNtDeleteBootEntry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8C10F4E1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteDriverEntry
DbgNtDeleteDriverEntry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC191DF16        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteFile
DbgNtDeleteFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x73DBECE9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteKey
DbgNtDeleteKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06D2E6AC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteObjectAuditAlarm
DbgNtDeleteObjectAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x36993E06        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeletePrivateNamespace
DbgNtDeletePrivateNamespace:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x16AFDFFB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteValueKey
DbgNtDeleteValueKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCEF32DA8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteWnfStateData
DbgNtDeleteWnfStateData:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBE058A52        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDeleteWnfStateName
DbgNtDeleteWnfStateName:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x940BBF8D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDisableLastKnownGood
DbgNtDisableLastKnownGood:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x68D92A7E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDisplayString
DbgNtDisplayString:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCED8F25D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtDrawText
DbgNtDrawText:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC131FAB7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnableLastKnownGood
DbgNtEnableLastKnownGood:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x79EF7544        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnumerateBootEntries
DbgNtEnumerateBootEntries:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAC8CC774        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnumerateDriverEntries
DbgNtEnumerateDriverEntries:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAC97B41C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnumerateSystemEnvironmentValuesEx
DbgNtEnumerateSystemEnvironmentValuesEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x172B5BDF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtEnumerateTransactionObject
DbgNtEnumerateTransactionObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1A38F344        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtExtendSection
DbgNtExtendSection:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x544D76D9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFilterBootOption
DbgNtFilterBootOption:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9C979F0A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFilterToken
DbgNtFilterToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6DB15D10        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFilterTokenEx
DbgNtFilterTokenEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x28A2F6F4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushBuffersFileEx
DbgNtFlushBuffersFileEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1D2457F7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushInstallUILanguage
DbgNtFlushInstallUILanguage:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC457F38B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushInstructionCache
DbgNtFlushInstructionCache:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1C3A5EE3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushKey
DbgNtFlushKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x87B49A20        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushProcessWriteBuffers
DbgNtFlushProcessWriteBuffers:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x44E47854        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushVirtualMemory
DbgNtFlushVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFD6F1903        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFlushWriteBuffer
DbgNtFlushWriteBuffer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x032B6BD2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFreeUserPhysicalPages
DbgNtFreeUserPhysicalPages:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x09B83234        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFreezeRegistry
DbgNtFreezeRegistry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x4CED467D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtFreezeTransactions
DbgNtFreezeTransactions:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCC12D49E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetCachedSigningLevel
DbgNtGetCachedSigningLevel:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2C996244        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetCompleteWnfStateSubscription
DbgNtGetCompleteWnfStateSubscription:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x736931B9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetContextThread
DbgNtGetContextThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x74582EE1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetCurrentProcessorNumber
DbgNtGetCurrentProcessorNumber:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8698F25A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetCurrentProcessorNumberEx
DbgNtGetCurrentProcessorNumberEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7CC385BD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetDevicePowerState
DbgNtGetDevicePowerState:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCE4DFEE6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetMUIRegistryInfo
DbgNtGetMUIRegistryInfo:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD47D1821        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetNextProcess
DbgNtGetNextProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x4D2742BC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetNextThread
DbgNtGetNextThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0EBDFEEE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetNlsSectionPtr
DbgNtGetNlsSectionPtr:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x22122B89        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetNotificationResourceManager
DbgNtGetNotificationResourceManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCE11D2BF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetWriteWatch
DbgNtGetWriteWatch:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8CC3B99E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtImpersonateAnonymousToken
DbgNtImpersonateAnonymousToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x61D536EC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtImpersonateThread
DbgNtImpersonateThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x722AAC90        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtInitializeEnclave
DbgNtInitializeEnclave:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x26DE4FDC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtInitializeNlsFiles
DbgNtInitializeNlsFiles:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x80BAAF18        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtInitializeRegistry
DbgNtInitializeRegistry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x14893A1D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtInitiatePowerAction
DbgNtInitiatePowerAction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBC24937D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtIsSystemResumeAutomatic
DbgNtIsSystemResumeAutomatic:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x178150A3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtIsUILanguageComitted
DbgNtIsUILanguageComitted:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xDE621FDF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtListenPort
DbgNtListenPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAEB2AB38        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLoadDriver
DbgNtLoadDriver:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x947DCD56        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLoadEnclaveData
DbgNtLoadEnclaveData:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD00B4338        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLoadHotPatch
DbgNtLoadHotPatch:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFC63F3F4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLoadKey
DbgNtLoadKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF55EC4E6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLoadKey2
DbgNtLoadKey2:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x13AA49AE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLoadKeyEx
DbgNtLoadKeyEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8BB945FE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLockFile
DbgNtLockFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE372EDE7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLockProductActivationKeys
DbgNtLockProductActivationKeys:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3797203C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLockRegistryKey
DbgNtLockRegistryKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0229FF2D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtLockVirtualMemory
DbgNtLockVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC05D2530        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMakePermanentObject
DbgNtMakePermanentObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x253543E7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMakeTemporaryObject
DbgNtMakeTemporaryObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x85BDAB07        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtManagePartition
DbgNtManagePartition:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0EA00E33        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMapCMFModule
DbgNtMapCMFModule:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6EC17246        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMapUserPhysicalPages
DbgNtMapUserPhysicalPages:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x02A49BB0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMapViewOfSectionEx
DbgNtMapViewOfSectionEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAE956DCF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtModifyBootEntry
DbgNtModifyBootEntry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1D9B0F00        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtModifyDriverEntry
DbgNtModifyDriverEntry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0B963CD8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtNotifyChangeDirectoryFile
DbgNtNotifyChangeDirectoryFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA4838418        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtNotifyChangeDirectoryFileEx
DbgNtNotifyChangeDirectoryFileEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x809B04A7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtNotifyChangeKey
DbgNtNotifyChangeKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC93FD0AC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtNotifyChangeMultipleKeys
DbgNtNotifyChangeMultipleKeys:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAD16BE90        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtNotifyChangeSession
DbgNtNotifyChangeSession:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9651A4F1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenEnlistment
DbgNtOpenEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF9650D02        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenEventPair
DbgNtOpenEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x40134C8D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenIoCompletion
DbgNtOpenIoCompletion:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x93059590        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenJobObject
DbgNtOpenJobObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x04B9EDC5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenKeyEx
DbgNtOpenKeyEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x597B5FC6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenKeyTransacted
DbgNtOpenKeyTransacted:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA49B5C86        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenKeyTransactedEx
DbgNtOpenKeyTransactedEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC81C0A46        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenKeyedEvent
DbgNtOpenKeyedEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x4ED56D42        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenMutant
DbgNtOpenMutant:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x34B27378        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenObjectAuditAlarm
DbgNtOpenObjectAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3E9ED8CA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenPartition
DbgNtOpenPartition:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x414A21D9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenPrivateNamespace
DbgNtOpenPrivateNamespace:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBF13C08A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenProcessToken
DbgNtOpenProcessToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9DA0F3A0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenRegistryTransaction
DbgNtOpenRegistryTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5E987005        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenResourceManager
DbgNtOpenResourceManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3BA1436A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenSemaphore
DbgNtOpenSemaphore:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0A9A33C6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenSession
DbgNtOpenSession:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC707DB84        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenSymbolicLinkObject
DbgNtOpenSymbolicLinkObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA638C0E5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenThread
DbgNtOpenThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7EAA7E09        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenTimer
DbgNtOpenTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC9983FE0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenTransaction
DbgNtOpenTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x63487FFB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtOpenTransactionManager
DbgNtOpenTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1840C00A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPlugPlayControl
DbgNtPlugPlayControl:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x09DA0D41        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrePrepareComplete
DbgNtPrePrepareComplete:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3AA7C8B8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrePrepareEnlistment
DbgNtPrePrepareEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF9A105D2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrepareComplete
DbgNtPrepareComplete:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x28B04FB2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrepareEnlistment
DbgNtPrepareEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x09A72475        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrivilegeCheck
DbgNtPrivilegeCheck:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2685FBC7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrivilegeObjectAuditAlarm
DbgNtPrivilegeObjectAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA5211F77        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPrivilegedServiceAuditAlarm
DbgNtPrivilegedServiceAuditAlarm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB0A25233        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPropagationComplete
DbgNtPropagationComplete:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9B2461B9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPropagationFailed
DbgNtPropagationFailed:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x201B50CE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPulseEvent
DbgNtPulseEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x182A2DE2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryAuxiliaryCounterFrequency
DbgNtQueryAuxiliaryCounterFrequency:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAA19C7FC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryBootEntryOrder
DbgNtQueryBootEntryOrder:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF357FDCB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryBootOptions
DbgNtQueryBootOptions:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x4BA53149        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDebugFilterState
DbgNtQueryDebugFilterState:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x02942A1A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDirectoryFileEx
DbgNtQueryDirectoryFileEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x38874205        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDirectoryObject
DbgNtQueryDirectoryObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x02A3F5A3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryDriverEntryOrder
DbgNtQueryDriverEntryOrder:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2409EF53        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryEaFile
DbgNtQueryEaFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x58F3A6AA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryFullAttributesFile
DbgNtQueryFullAttributesFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA604B6AE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationAtom
DbgNtQueryInformationAtom:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB621DBA0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationByName
DbgNtQueryInformationByName:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3CD84F0F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationEnlistment
DbgNtQueryInformationEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAB25AEB3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationJobObject
DbgNtQueryInformationJobObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8892F618        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationPort
DbgNtQueryInformationPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB22CD7BE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationResourceManager
DbgNtQueryInformationResourceManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9330A190        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationTransaction
DbgNtQueryInformationTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x02950E0F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationTransactionManager
DbgNtQueryInformationTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x05B69396        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInformationWorkerFactory
DbgNtQueryInformationWorkerFactory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0D5E1BD0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryInstallUILanguage
DbgNtQueryInstallUILanguage:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE85BFBE3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryIntervalProfile
DbgNtQueryIntervalProfile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8CB80F9F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryIoCompletion
DbgNtQueryIoCompletion:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x48636A37        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryLicenseValue
DbgNtQueryLicenseValue:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0C5B17E4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryMultipleValueKey
DbgNtQueryMultipleValueKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x962F7737        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryMutant
DbgNtQueryMutant:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x12B21B26        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryOpenSubKeys
DbgNtQueryOpenSubKeys:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAAD18175        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryOpenSubKeysEx
DbgNtQueryOpenSubKeysEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB5A5EB62        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryPortInformationProcess
DbgNtQueryPortInformationProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x832D9AA0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryQuotaInformationFile
DbgNtQueryQuotaInformationFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFE6FF0FC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySecurityAttributesToken
DbgNtQuerySecurityAttributesToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2B8A110E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySecurityObject
DbgNtQuerySecurityObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFC783F27        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySecurityPolicy
DbgNtQuerySecurityPolicy:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x963DABF9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySemaphore
DbgNtQuerySemaphore:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x608849C4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySymbolicLinkObject
DbgNtQuerySymbolicLinkObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0581777E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySystemEnvironmentValue
DbgNtQuerySystemEnvironmentValue:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB3A92296        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySystemEnvironmentValueEx
DbgNtQuerySystemEnvironmentValueEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1D3855F8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySystemInformationEx
DbgNtQuerySystemInformationEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2CDA5628        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryTimerResolution
DbgNtQueryTimerResolution:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x18B6DD9D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryWnfStateData
DbgNtQueryWnfStateData:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2F00B121        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueryWnfStateNameInformation
DbgNtQueryWnfStateNameInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x949A6F8E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQueueApcThreadEx
DbgNtQueueApcThreadEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8CB142C6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRaiseException
DbgNtRaiseException:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x76329421        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRaiseHardError
DbgNtRaiseHardError:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xDF8EFADD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReadOnlyEnlistment
DbgNtReadOnlyEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1A2710B1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRecoverEnlistment
DbgNtRecoverEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD946FEDD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRecoverResourceManager
DbgNtRecoverResourceManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE3B2749B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRecoverTransactionManager
DbgNtRecoverTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x87339198        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRegisterProtocolAddressInformation
DbgNtRegisterProtocolAddressInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1D8B0318        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRegisterThreadTerminatePort
DbgNtRegisterThreadTerminatePort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE4B1DF1F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReleaseKeyedEvent
DbgNtReleaseKeyedEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0A8F1302        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReleaseWorkerFactoryWorker
DbgNtReleaseWorkerFactoryWorker:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x604916AD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRemoveIoCompletionEx
DbgNtRemoveIoCompletionEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x58AD0478        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRemoveProcessDebug
DbgNtRemoveProcessDebug:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8A2B9D9A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRenameKey
DbgNtRenameKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCDF0D268        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRenameTransactionManager
DbgNtRenameTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1A4002CA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReplaceKey
DbgNtReplaceKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x16A2C2F1        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReplacePartitionUnit
DbgNtReplacePartitionUnit:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFB7BDF23        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReplyWaitReplyPort
DbgNtReplyWaitReplyPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA0319F9A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRequestPort
DbgNtRequestPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE572E2E9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtResetEvent
DbgNtResetEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0AA82B1C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtResetWriteWatch
DbgNtResetWriteWatch:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3CBF4A62        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRestoreKey
DbgNtRestoreKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06DAF6A0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtResumeProcess
DbgNtResumeProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB52ECAC4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRevertContainerImpersonation
DbgNtRevertContainerImpersonation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x089F060F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRollbackComplete
DbgNtRollbackComplete:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x483558BE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRollbackEnlistment
DbgNtRollbackEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x01DF1C5D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRollbackRegistryTransaction
DbgNtRollbackRegistryTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC8922E02        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRollbackTransaction
DbgNtRollbackTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06992409        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRollforwardTransactionManager
DbgNtRollforwardTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1B2269C2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSaveKey
DbgNtSaveKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x6BBF86D9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSaveKeyEx
DbgNtSaveKeyEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x296111A6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSaveMergedKeys
DbgNtSaveMergedKeys:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8737BCA0        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSecureConnectPort
DbgNtSecureConnectPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x66FF796C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSerializeBoot
DbgNtSerializeBoot:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAB3E6078        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetBootEntryOrder
DbgNtSetBootEntryOrder:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD7CDC76F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetBootOptions
DbgNtSetBootOptions:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xDF9B0CDC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetCachedSigningLevel
DbgNtSetCachedSigningLevel:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD61A94A4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetCachedSigningLevel2
DbgNtSetCachedSigningLevel2:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x72CD5DDC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetContextThread
DbgNtSetContextThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9430D695        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetDebugFilterState
DbgNtSetDebugFilterState:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x548DB2CC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetDefaultHardErrorPort
DbgNtSetDefaultHardErrorPort:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x268E271C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetDefaultLocale
DbgNtSetDefaultLocale:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x67AF117D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetDefaultUILanguage
DbgNtSetDefaultUILanguage:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9FBC9824        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetDriverEntryOrder
DbgNtSetDriverEntryOrder:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x131675E3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetEaFile
DbgNtSetEaFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0215EC1E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetHighEventPair
DbgNtSetHighEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC64F869D        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetHighWaitLowEventPair
DbgNtSetHighWaitLowEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x70D66C5F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetIRTimer
DbgNtSetIRTimer:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x035F220C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationDebugObject
DbgNtSetInformationDebugObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF3590553        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationEnlistment
DbgNtSetInformationEnlistment:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2A3233A6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationJobObject
DbgNtSetInformationJobObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xBA85DA18        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationKey
DbgNtSetInformationKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1CE20F79        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationResourceManager
DbgNtSetInformationResourceManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0BB2E8C3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationSymbolicLink
DbgNtSetInformationSymbolicLink:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xEE7BE6EE        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationToken
DbgNtSetInformationToken:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8D92F71A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationTransaction
DbgNtSetInformationTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF0B9DE65        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationTransactionManager
DbgNtSetInformationTransactionManager:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x015427EC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationVirtualMemory
DbgNtSetInformationVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0D9F415B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationWorkerFactory
DbgNtSetInformationWorkerFactory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x865790CA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetIntervalProfile
DbgNtSetIntervalProfile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC582BB58        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetIoCompletion
DbgNtSetIoCompletion:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06EC263F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetIoCompletionEx
DbgNtSetIoCompletionEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x38D37416        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetLdtEntries
DbgNtSetLdtEntries:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA80DC1E9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetLowEventPair
DbgNtSetLowEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2F30AF27        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetLowWaitHighEventPair
DbgNtSetLowWaitHighEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x96B25AEF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetQuotaInformationFile
DbgNtSetQuotaInformationFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xAB36AB93        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetSecurityObject
DbgNtSetSecurityObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8CA7A43B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetSystemEnvironmentValue
DbgNtSetSystemEnvironmentValue:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFC3B2C80        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetSystemEnvironmentValueEx
DbgNtSetSystemEnvironmentValueEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x40BB0C00        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetSystemInformation
DbgNtSetSystemInformation:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xDC4680EB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetSystemPowerState
DbgNtSetSystemPowerState:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x36380EA7        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetSystemTime
DbgNtSetSystemTime:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2EAA2F37        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetThreadExecutionState
DbgNtSetThreadExecutionState:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x02AD7C28        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetTimer2
DbgNtSetTimer2:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1DA6FCB9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetTimerEx
DbgNtSetTimerEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB2B8FC7E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetTimerResolution
DbgNtSetTimerResolution:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCA5C0401        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetUuidSeed
DbgNtSetUuidSeed:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x87ADCF81        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetVolumeInformationFile
DbgNtSetVolumeInformationFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE577F1CB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetWnfProcessNotificationEvent
DbgNtSetWnfProcessNotificationEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x30BA0D72        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtShutdownSystem
DbgNtShutdownSystem:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x22801F50        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtShutdownWorkerFactory
DbgNtShutdownWorkerFactory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x02962A38        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSignalAndWaitForSingleObject
DbgNtSignalAndWaitForSingleObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x85959509        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSinglePhaseReject
DbgNtSinglePhaseReject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x882798BB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtStartProfile
DbgNtStartProfile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF095FB33        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtStopProfile
DbgNtStopProfile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x67A699FD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSubscribeWnfStateChange
DbgNtSubscribeWnfStateChange:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x44E15944        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSuspendProcess
DbgNtSuspendProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCE20D7AF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSuspendThread
DbgNtSuspendThread:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE73FEF94        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSystemDebugControl
DbgNtSystemDebugControl:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC397CD05        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTerminateEnclave
DbgNtTerminateEnclave:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x74D3627E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTerminateJobObject
DbgNtTerminateJobObject:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x8BA5B9EB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTestAlert
DbgNtTestAlert:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1E3727BA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtThawRegistry
DbgNtThawRegistry:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC24DD723        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtThawTransactions
DbgNtThawTransactions:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7FA5673F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTraceControl
DbgNtTraceControl:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xB41B300A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtTranslateFilePath
DbgNtTranslateFilePath:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x56EC7360        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUmsThreadYield
DbgNtUmsThreadYield:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xEA566373        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnloadDriver
DbgNtUnloadDriver:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0EC75E06        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnloadKey
DbgNtUnloadKey:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x09DFE8A8        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnloadKey2
DbgNtUnloadKey2:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xA1D66544        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnloadKeyEx
DbgNtUnloadKeyEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xFB742C28        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnlockFile
DbgNtUnlockFile:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3E37402C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnlockVirtualMemory
DbgNtUnlockVirtualMemory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0791111F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnmapViewOfSectionEx
DbgNtUnmapViewOfSectionEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x809357CD        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUnsubscribeWnfStateChange
DbgNtUnsubscribeWnfStateChange:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF85DDE04        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtUpdateWnfStateData
DbgNtUpdateWnfStateData:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2D04B739        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtVdmControl
DbgNtVdmControl:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x03940707        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForAlertByThreadId
DbgNtWaitForAlertByThreadId:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x7AAF9ED4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForDebugEvent
DbgNtWaitForDebugEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCA40E3D2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForKeyedEvent
DbgNtWaitForKeyedEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3A917D5A        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForWorkViaWorkerFactory
DbgNtWaitForWorkViaWorkerFactory:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9C8AE07F        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitHighEventPair
DbgNtWaitHighEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2EB1AAA4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitLowEventPair
DbgNtWaitLowEventPair:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x61D3FAF6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtAcquireCMFViewOwnership
DbgNtAcquireCMFViewOwnership:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x9D42C3EB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCancelDeviceWakeupRequest
DbgNtCancelDeviceWakeupRequest:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x5F85511E        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtClearAllSavepointsTransaction
DbgNtClearAllSavepointsTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xE04BE0D9        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtClearSavepointTransaction
DbgNtClearSavepointTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF850E6C3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRollbackSavepointTransaction
DbgNtRollbackSavepointTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x970FF006        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSavepointTransaction
DbgNtSavepointTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD04BF6DB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSavepointComplete
DbgNtSavepointComplete:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCD4222CA        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateSectionEx
DbgNtCreateSectionEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x2C9FEFC5        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtCreateCrossVmEvent
DbgNtCreateCrossVmEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x40044D94        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtGetPlugPlayEvent
DbgNtGetPlugPlayEvent:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x06AC3AE4        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtListTransactions
DbgNtListTransactions:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x1B8904E3        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtMarshallTransaction
DbgNtMarshallTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCB24EBB6        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtPullTransaction
DbgNtPullTransaction:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xC28AE05B        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtReleaseCMFViewOwnership
DbgNtReleaseCMFViewOwnership:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF22CDCF2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtWaitForWnfNotifications
DbgNtWaitForWnfNotifications:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x0DDF2E89        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtStartTm
DbgNtStartTm:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x3F925D6C        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtSetInformationProcess
DbgNtSetInformationProcess:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x811F9F74        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRequestDeviceWakeup
DbgNtRequestDeviceWakeup:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xCD950BC2        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtRequestWakeupLatency
DbgNtRequestWakeupLatency:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0x035B28CF        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtQuerySystemTime
DbgNtQuerySystemTime:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF46FFDCB        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtManageHotPatch
DbgNtManageHotPatch:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xF549F9FC        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret

.global DbgNtContinueEx
DbgNtContinueEx:
	mov [rsp +8], rcx          # Save registers.
	mov [rsp+16], rdx
	mov [rsp+24], r8
	mov [rsp+32], r9
	sub rsp, 0x28
	mov ecx, 0xD7493035        # Load function hash into ECX.
	call Dbg_GetSyscallNumber              # Resolve function hash into syscall number.
	add rsp, 0x28
	mov rcx, [rsp+8]                      # Restore registers.
	mov rdx, [rsp+16]
	mov r8, [rsp+24]
	mov r9, [rsp+32]
	mov r10, rcx
	syscall                    # Invoke system call.
	ret


#endif
