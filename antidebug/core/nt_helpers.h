#pragma once

#include "syscall.h"
#include "atcptr.h"
#include <windows.h>

#ifdef __cplusplus
extern "C" {
#endif

// 封装隐蔽的 VEH 注册/移除函数
PVOID Dbg_AddVectoredExceptionHandler(ULONG First,
                                      PVECTORED_EXCEPTION_HANDLER Handler);
ULONG Dbg_RemoveVectoredExceptionHandler(PVOID Handle);

// 封装隐蔽的 VCH 注册/移除函数
PVOID Dbg_AddVectoredContinueHandler(ULONG First,
                                     PVECTORED_EXCEPTION_HANDLER Handler);
ULONG Dbg_RemoveVectoredContinueHandler(PVOID Handle);

void ForceExit();
#ifdef __cplusplus
}

#endif