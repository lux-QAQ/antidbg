cmake_minimum_required(VERSION 3.10.0)
project(testthread VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)

# 添加库的头文件路径
include_directories("${CMAKE_SOURCE_DIR}/GH Injector Library")

# 自动搜集 GH Injector Library 目录下的所有 .cpp 和 .h 文件
file(GLOB GH_LIB_SOURCES
    "GH Injector Library/*.cpp"
)

file(GLOB GH_LIB_HEADERS
    "GH Injector Library/*.h"
)

# 创建可执行文件
add_executable(testthread main.cpp ${GH_LIB_SOURCES} ${GH_LIB_HEADERS})

# Windows 特定设置
if(WIN32)
    # 添加必需的 Windows 库
    target_link_libraries(testthread ntdll dbghelp)
    #target_compile_options(testthread PRIVATE -fsanitize=address)
    #target_compile_options(testthread PRIVATE /fsanitize=address)


    # 禁用一些警告
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        target_compile_options(testthread PRIVATE
            -Wno-attributes
            -Wno-ignored-attributes
            -Wno-unused-variable
            -Wno-unused-parameter
            -Wno-unknown-pragmas
            -Wno-missing-braces
        )
    endif()
endif()

# 设置预编译头
target_precompile_headers(testthread PRIVATE "GH Injector Library/pch.h")
