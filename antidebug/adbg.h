#pragma once

#define WIN32_LEAN_AND_MEAN

#include "core\atcptr.h"
#include "core\handler.h"
#include "core\hasher.h"
#include "core\syscall.h"
#include "core\thrmng.h"


#include "api\dbgobjhandle.h"
#include "api\dbgpresent.h"
#include "api\procdbgflag.h"
#include "api\procdbgport.h"
#include "api\rdbgpresent.h"


#include "asm\dbgbreak.h"
#include "asm\int2d.h"
#include "asm\int3.h"
#include "asm\lbr_btf.h"
#include "asm\popf.h"
#include "asm\prehop.h"
#include "asm\sckreg.h"


#include "exceptions\hwbreakp2.h"
#include "exceptions\pgexcbp.h"
#include "exceptions\raiseexc.h"
#include "exceptions\vch_integrity.h" // [新增] VCH 完整性校验


#include "flags\duphnd.h"
#include "flags\job.h"
#include "flags\kerneldbg.h"
#include "flags\ntglobalflag.h"
#include "flags\ntldt.h"
#include "flags\prntproc.h"
#include "flags\prochpflag.h"
#include "flags\prochpforceflag.h"
#include "flags\timing.h"
#include "flags\window.h"


#include "memory\dbgp.h"
#include "memory\hwbreakp.h"
#include "memory\membreakp.h"
#include "memory\peb.h"
#include "memory\readstck.h"
#include "memory\vrtalloc.h"


#include "object\clshandle.h"
#include "object\dbgobj.h"
#include "object\opnproc.h"
#include "object\prothnd.h"
#include "object\sysdbgctl.h"

#ifdef __cplusplus
extern "C" {
#endif

// [新增] 用于传递主线程ID给隐蔽线程的上下文结构
typedef struct _ADBG_CONTEXT {
    DWORD MainThreadId;
} ADBG_CONTEXT, *PADBG_CONTEXT;

typedef struct {
  bool result;
  const char *functionName;
  union {
    bool (*functionPtr)();
    bool (*functionPtrWithProcess)(HANDLE);
    bool (*functionPtrWithThread)(HANDLE);
    bool (*functionPtrWithProcessAndThread)(HANDLE, HANDLE);
  };
} DebugCheckResult;

extern DebugCheckResult debuggerChecks[];

void StartDebugProtection();   // guard mode
bool isProgramBeingDebugged(); // single run mode

#ifdef __cplusplus
}
#endif