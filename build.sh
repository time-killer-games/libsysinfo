#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ gamemaker.cpp system.cpp libGLEW.a libglfw3.a -o libsysinfo.dylib -std=c++17 -DGLEW_STATIC -I/usr/local/include `pkg-config --cflags glfw3` `pkg-config --cflags glew` -framework Cocoa -framework IOKit -framework OpenGL -lobjc -arch arm64 -arch x86_64 -shared;
elif [ $(uname) = "Linux" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -llibsysinfo.so -shared;
elif [ $(uname) = "FreeBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -llibsysinfo.so -shared;
elif [ $(uname) = "DragonFly" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -shared;
elif [ $(uname) = "NetBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -shared;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -shared;
elif [ $(uname) = "SunOS" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -shared;
else
  g++ gamemaker.cpp system.cpp -o libsysinfo.dll -std=c++17 -DGLEW_STATIC -static-libgcc -static-libstdc++ -static -lws2_32 -lglfw3 -lglew32 -lopengl32 -lgdi32 -ld3d11 -ldxgi -shared;
fi
