#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ gamemaker.cpp system.cpp libGLEW.a libglfw3.a -o libsysinfo.dylib -std=c++17 -DCREATE_OPENGL_CONTEXT -DGLEW_STATIC -Iinclude `pkg-config --cflags glfw3` `pkg-config --cflags glew` -framework Cocoa -framework IOKit -framework OpenGL -lobjc -arch arm64 -arch x86_64 -fPIC -shared;
elif [ $(uname) = "Linux" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -DCREATE_OPENGL_CONTEXT `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -fPIC -shared;
elif [ $(uname) = "FreeBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -DCREATE_OPENGL_CONTEXT `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -lkvm -fPIC -shared;
elif [ $(uname) = "DragonFly" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -DCREATE_OPENGL_CONTEXT `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -lkvm -fPIC -shared;
elif [ $(uname) = "NetBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -DCREATE_OPENGL_CONTEXT `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -fPIC -shared;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -DCREATE_OPENGL_CONTEXT `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -fPIC -shared;
elif [ $(uname) = "SunOS" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -DCREATE_OPENGL_CONTEXT `pkg-config --cflags --libs glfw3` `pkg-config --cflags --libs glew` -lGL -fPIC -shared;
else
  g++ gamemaker.cpp system.cpp -o libsysinfo.dll -std=c++17 -DCREATE_OPENGL_CONTEXT -DGLEW_STATIC -static-libgcc -static-libstdc++ -static -lws2_32 -ldxgi -fPIC -shared;
fi
