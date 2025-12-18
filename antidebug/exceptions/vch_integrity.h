#pragma once

#include <windows.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

    /**
     * @brief 执行 VCH + LBR 完整性校验
     * 
     * 原理：
     * 1. 开启 CPU LBR (Last Branch Record) 功能。
     * 2. 执行一段特定的跳转指令 (JMP + ICEBP)。
     * 3. 触发异常后，在 VCH (Vectored Continue Handler) 中校验 LBR 记录。
     * 4. 如果调试器介入（吞掉异常、修改上下文、单步跟踪），LBR 记录将丢失或不匹配。
     * 
     * @return true 检测到调试器 (校验失败)
     * @return false 未检测到调试器 (校验通过)
     */
    bool VchIntegrityCheck();

#ifdef __cplusplus
}
#endif