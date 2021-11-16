#ifdef OS_WIN_ENTRY

#include <Windows.h>
#include <iostream>
#include "app.h"

int WINAPI WinMain(
  HINSTANCE hInstance,
  HINSTANCE hPrevInstance,
  LPSTR     lpCmdLine,
  int       nShowCmd
) {
    chotc::chot_app app;
    std::cout << app.apply(lpCmdLine) << std::endl;
    return 0;
}

#endif
