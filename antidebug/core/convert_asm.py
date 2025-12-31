import re
import os

# 配置路径
INPUT_FILE = r"syscall-core.asm"
OUTPUT_FILE = r"syscall-core-gnu.asm"

def convert_masm_to_gnu(input_path, output_path):
    if not os.path.exists(input_path):
        print(f"错误: 找不到输入文件 {input_path}")
        return

    with open(input_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    
    # 1. 添加头部宏定义和语法指令
    # 只有在 Clang/GCC 下且非 MSVC 环境下才编译
    new_lines.append("#if (defined(__clang__) || defined(__GNUC__)) && !defined(_MSC_VER)\n")
    new_lines.append(".intel_syntax noprefix\n")
    new_lines.append(".text\n\n")

    for line in lines:
        original_line = line
        stripped = line.strip()

        # 2. 跳过空行
        if not stripped:
            new_lines.append(line)
            continue

        # 3. 处理注释 (MASM ';' -> GNU '#')
        # 注意：简单的替换，假设分号不出现在字符串中
        if ';' in line:
            line = line.replace(';', '#')

        # 4. 处理 END 指令 (删除)
        if stripped.lower() == 'end':
            continue

        # 5. 处理 .code 指令 (已在头部添加 .text，这里忽略)
        if stripped.lower() == '.code':
            continue

        # 6. 处理 EXTERN
        # MASM: EXTERN Name: PROC
        # GNU:  .extern Name
        match_extern = re.match(r'\s*EXTERN\s+([a-zA-Z0-9_@]+)\s*:\s*PROC', line, re.IGNORECASE)
        if match_extern:
            symbol = match_extern.group(1)
            new_lines.append(f".extern {symbol}\n")
            continue

        # 7. 处理 PROC (函数开始)
        # MASM: FuncName PROC
        # GNU:  .global FuncName \n FuncName:
        match_proc = re.match(r'\s*([a-zA-Z0-9_@]+)\s+PROC', line, re.IGNORECASE)
        if match_proc:
            func_name = match_proc.group(1)
            new_lines.append(f".global {func_name}\n")
            new_lines.append(f"{func_name}:\n")
            continue

        # 8. 处理 ENDP (函数结束) -> 忽略或保留为空行
        if re.search(r'\s+ENDP', line, re.IGNORECASE):
            continue

        # 9. 处理十六进制数
        # MASM: 08C22C5FDh (以数字开头，h结尾)
        # GNU:  0x8C22C5FD
        # 正则逻辑：单词边界，可选的前导0，十六进制串，h后缀，单词边界
        def hex_replacer(match):
            return "0x" + match.group(1)
        
        line = re.sub(r'\b0?([0-9A-Fa-f]+)h\b', hex_replacer, line)

        new_lines.append(line)

    # 10. 添加尾部宏结束
    new_lines.append("\n#endif\n")

    with open(output_path, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
    
    print(f"转换完成！已生成: {output_path}")

if __name__ == "__main__":
    # 自动定位到脚本所在目录（如果脚本和asm在同一目录）
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_full_path = os.path.join(script_dir, INPUT_FILE)
    output_full_path = os.path.join(script_dir, OUTPUT_FILE)
    
    # 如果直接运行找不到文件，尝试使用绝对路径（根据你的工作区）
    if not os.path.exists(input_full_path):
        # 备用路径：根据你提供的工作区路径
        input_full_path = r"e:\code\ollvm_plugins\SsagePass\Obfuscation\antidbg\antidebug\core\syscall-core.asm"
        output_full_path = r"e:\code\ollvm_plugins\SsagePass\Obfuscation\antidbg\antidebug\core\syscall-core-gnu.asm"

    convert_masm_to_gnu(input_full_path, output_full_path)