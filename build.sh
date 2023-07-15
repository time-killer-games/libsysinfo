#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  sudo port install libsdl2 +universal python311 ninja && git clone https://chromium.googlesource.com/angle/angle && git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && sudo port select --set python python311 && export PATH=`pwd`/depot_tools:"$PATH" && cd angle && python scripts/bootstrap.py && gclient sync && git checkout main;
  mkdir ../arm64 && gn gen ../arm64 && echo "target_cpu = \"arm64\"" >> ../arm64/args.gn && GYP_GENERATORS=ninja gclient runhooks && ninja -j 10 -k1 -C ../arm64 && mkdir ../x86_64 && gn gen ../x86_64 && echo "target_cpu = \"x64\"" >> ../x86_64/args.gn && GYP_GENERATORS=ninja gclient runhooks && ninja -j 10 -k1 -C ../x86_64;
  lipo -create -output ../libEGL.dylib ../arm64/libEGL.dylib ../x86_64/libEGL.dylib && lipo -create -output ../libGLESv2.dylib ../arm64/libGLESv2.dylib ../x86_64/libGLESv2.dylib && lipo -create -output ../libc++_chrome.dylib ../arm64/libc++_chrome.dylib ../x86_64/libc++_chrome.dylib && lipo -create -output ../libchrome_zlib.dylib ../arm64/libchrome_zlib.dylib ../x86_64/libchrome_zlib.dylib && lipo -create -output ../libthird_party_abseil-cpp_absl.dylib ../arm64/libthird_party_abseil-cpp_absl.dylib ../x86_64/libthird_party_abseil-cpp_absl.dylib;
  cd ..; clang++ /opt/local/lib/libSDL2.a gamemaker.cpp system.cpp -o libsysinfo.dylib -Iinclude -L. -I/opt/local/include -I/opt/local/include/SDL2 -std=c++17 -DCREATE_CONTEXT -lobjc -liconv -lEGL -lGLESv2 -Wl,-framework,CoreAudio -Wl,-framework,AudioToolbox -Wl,-weak_framework,CoreHaptics -Wl,-weak_framework,GameController -Wl,-framework,ForceFeedback -lobjc -Wl,-framework,CoreVideo -Wl,-framework,Cocoa -Wl,-framework,Carbon -Wl,-framework,IOKit -Wl,-weak_framework,QuartzCore -Wl,-weak_framework,Metal -fPIC -arch x86_64 -arch arm64 -fPIC -shared; install_name_tool -change @rpath/libEGL.dylib @loader_path/libEGL.dylib ./libsysinfo.dylib; install_name_tool -change @rpath/libGLESv2.dylib @loader_path/libGLESv2.dylib ./libsysinfo.dylib;
elif [ $(uname) = "Linux" ]; then
  g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs sdl2` -lGL -fPIC -shared;
elif [ $(uname) = "FreeBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs sdl2` -lGL -lkvm -fPIC -shared;
elif [ $(uname) = "DragonFly" ]; then
  g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs sdl2` -lGL -lkvm -lpthread -fPIC -shared;
elif [ $(uname) = "NetBSD" ]; then
  g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc -static-libstdc++ `pkg-config --cflags --libs sdl2` -I/usr/X11R7/include -Wl,-rpath,/usr/X11R7/lib -L/usr/X11R7/lib -lGL -fPIC -shared;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 `pkg-config --cflags --libs sdl2` -lGL -fPIC -shared;
elif [ $(uname) = "SunOS" ]; then
  export PKG_CONFIG_PATH=/usr/lib/64/pkgconfig && g++ gamemaker.cpp system.cpp -o libsysinfo.so -std=c++17 -static-libgcc `pkg-config --cflags --libs sdl2` -lGL -fPIC -shared;
else
  g++ gamemaker.cpp system.cpp -o libsysinfo.dll -std=c++17 -DCREATE_CONTEXT -static-libgcc -static-libstdc++ -static `pkg-config --cflags --libs --static sdl2` -lws2_32 -ldxgi -lopengl32 -static -fPIC -shared;
fi
