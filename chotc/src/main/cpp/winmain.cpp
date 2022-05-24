#ifdef OS_WIN_ENTRY

#include <Windows.h>
#include <fstream>
#include "app.h"

int WINAPI WinMain(
  HINSTANCE hInstance,
  HINSTANCE hPrevInstance,
  LPSTR     lpCmdLine,
  int       nShowCmd
) {
    chotc::chot_app app;
    std::ofstream f("tttt.log");
    f << app.apply(lpCmdLine) << std::endl;
    return 0;
}

#endif
