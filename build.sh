#!/bin/sh
cd "${0%/*}";
xxd -i pci.ids > pci.ids.hpp;
if [ $(uname) = "Darwin" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.dylib -std=c++17 -fPIC -shared -arch x86_64 -arch arm64;
elif [ $(uname) = "Linux" ]; then
  g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs x11` -lGL `pkg-config --cflags --libs hwloc --static` -fPIC -shared;
elif [ $(uname) = "FreeBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs x11` -lGL `pkg-config --cflags --libs hwloc --static` -lkvm -fPIC -shared;
elif [ $(uname) = "DragonFly" ]; then
  g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs x11` -lGL `pkg-config --cflags --libs hwloc --static` -lkvm -lpthread -fPIC -shared;
elif [ $(uname) = "NetBSD" ]; then
  g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs x11` -I/usr/X11R7/include -Wl,-rpath,/usr/X11R7/lib -L/usr/X11R7/lib -lGL `pkg-config --cflags --libs hwloc --static` -fPIC -shared;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs x11` -lGL `pkg-config --cflags --libs hwloc --static` -fPIC -shared;
elif [ $(uname) = "SunOS" ]; then
  export PKG_CONFIG_PATH=/usr/lib/64/pkgconfig && g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc `pkg-config --cflags --libs x11` -lGL `pkg-config --cflags --libs hwloc --static` -fPIC -shared;
else
  g++ gamemaker.cpp system.cpp -o libsysinfo.dll -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs hwloc --static` -lws2_32 -ldxgi -lpsapi -static -fPIC -shared;
fi
