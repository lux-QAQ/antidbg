// example/main.cpp
#include "adbg.h"
#include <iostream>
#include <windows.h>

int main() {
  // 必须调用这个来安装 VEH，否则 isProgramBeingDebugged 会崩溃
  StartDebugProtection();


  // 给一点时间让 VEH 生效
  Sleep(100);

  int input = 0;
  std::cin >> input;
  if (input == 123456) {
    if (isProgramBeingDebugged()) {
      printf("Debugger detected.\n");
    } else {
      printf("No debugger was detected.\n");
    }
    std::cout << "OK";
  } else {
    if (isProgramBeingDebugged()) {
      printf("Debugger detected.\n");
    } else {
      printf("No debugger was detected.\n");
    }
    std::cout << "fail";
  }
  std::cout << '\n';
  system("pause");
  return 0;
}