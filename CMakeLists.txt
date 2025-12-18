cmake_minimum_required(VERSION 3.15)
# 1. 启用 C, C++ 和 MASM 汇编支持
project(antidebug LANGUAGES C CXX ASM_MASM)

# Require x64
if(NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
    message(FATAL_ERROR "This project targets x64 only. Please use a 64-bit toolchain/generator.")
endif()

# Options
option(BUILD_SHARED_LIBS "Build antidebug as a shared library (DLL)" OFF)
option(BUILD_EXAMPLE "Build a small example executable" ON)

set(CMAKE_CXX_STANDARD 20) # GH Injector 需要较新的 C++ 标准
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE OFF)

# GH Injector Library Integration 
# 使用绝对路径，并确保路径正确
set(GH_LIB_DIR "${CMAKE_SOURCE_DIR}/GuidedHacking-Injector/GH Injector Library")

# 将 GH Injector Library 目录本身加入包含路径
# 这样 #include "Start Routine.h" 就能工作了
include_directories("${GH_LIB_DIR}")

# 同时将 GuidedHacking-Injector 目录加入包含路径
include_directories("${CMAKE_SOURCE_DIR}/GuidedHacking-Injector")

# 只包含 GH Injector Library 下的 .cpp 文件，不递归
file(GLOB GH_LIB_SOURCES "${GH_LIB_DIR}/*.cpp")
# ---------------------------------------

# Collect sources
file(GLOB_RECURSE ADBG_SOURCES
    "${CMAKE_SOURCE_DIR}/*.c"
    "${CMAKE_SOURCE_DIR}/*.cpp"
    "${CMAKE_SOURCE_DIR}/*.asm"
    "${CMAKE_SOURCE_DIR}/api/*.c"
    "${CMAKE_SOURCE_DIR}/asm/*.c"
    "${CMAKE_SOURCE_DIR}/core/*.c"
    "${CMAKE_SOURCE_DIR}/exceptions/*.c"
    "${CMAKE_SOURCE_DIR}/flags/*.c"
    "${CMAKE_SOURCE_DIR}/memory/*.c"
    "${CMAKE_SOURCE_DIR}/object/*.c"
)

# 将 GH Injector Library 的源文件添加到列表
list(APPEND ADBG_SOURCES ${GH_LIB_SOURCES})

# 排除 .history 目录
list(FILTER ADBG_SOURCES EXCLUDE REGEX "[/\\\\]\\.history[/\\\\]")
# 排除 example 目录下的源文件
list(FILTER ADBG_SOURCES EXCLUDE REGEX "[/\\\\]example[/\\\\]")
# 排除 GuidedHacking-Injector 下的 main.cpp (防止多重 main 定义)
list(FILTER ADBG_SOURCES EXCLUDE REGEX "GuidedHacking-Injector[/\\\\]main\\.cpp")
# 排除 GH Injector DNP 目录
list(FILTER ADBG_SOURCES EXCLUDE REGEX "GuidedHacking-Injector[/\\\\]GH Injector DNP[/\\\\]")
# 排除 GH Injector SM 目录
list(FILTER ADBG_SOURCES EXCLUDE REGEX "GuidedHacking-Injector[/\\\\]GH Injector SM[/\\\\]")

if(NOT ADBG_SOURCES)
    message(FATAL_ERROR "No sources found.")
endif()

# Create library target
add_library(antidebug ${ADBG_SOURCES})

# Public include directory
target_include_directories(antidebug
    PUBLIC
    ${CMAKE_SOURCE_DIR}
    "${GH_LIB_DIR}" # 确保库的使用者也能找到 GH 的头文件
)

# Compiler-specific flags
if(MSVC)
    target_compile_options(antidebug PRIVATE /W4 /wd4201 /wd4996)
    target_compile_options(antidebug PRIVATE /MP)
else()
    target_compile_options(antidebug PRIVATE -Wall -Wextra -Wshadow -Wno-unused-parameter -Wno-missing-field-initializers)
    target_compile_options(antidebug PRIVATE -fno-strict-aliasing)
    # GH Injector 可能需要忽略一些警告
    target_compile_options(antidebug PRIVATE -Wno-unknown-pragmas -Wno-missing-braces)
endif()

target_link_libraries(antidebug PRIVATE kernel32 user32 dbghelp WinInet Urlmon WtsApi32) 

# Example binary
if(BUILD_EXAMPLE)
    add_executable(adbg_example example/main.cpp)

    target_link_libraries(adbg_example PRIVATE antidebug)

    target_include_directories(adbg_example PRIVATE
        ${CMAKE_SOURCE_DIR}
        ${CMAKE_SOURCE_DIR}/antidebug
    )
endif()

# Install rules
install(TARGETS antidebug
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)
install(DIRECTORY ${CMAKE_SOURCE_DIR}/
    DESTINATION include/antidebug
    FILES_MATCHING PATTERN "*.h"
)

if(BUILD_SHARED_LIBS)
    set(LIB_TYPE "shared")
else()
    set(LIB_TYPE "static")
endif()

message(STATUS "antidebug: building ${LIB_TYPE} library for x64")
message(STATUS "Sources: ${ADBG_SOURCES}")