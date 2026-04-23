#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -arch arm64 -arch x86_64; ./exepath;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepath;
  else
    clang++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall; ./exepath;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -static; ./exepath;
elif [ $(uname) = "DragonFly" ]; then
  g++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepath;
elif [ $(uname) = "NetBSD" ]; then
  g++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./exepath;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -lkvm -static; ./exepath;
elif [ $(uname) = "SunOS" ]; then
  g++ exepath/exepath.cpp exepath.cpp -o exepath -std=c++17 -Wall -static-libgcc; ./exepath;
else
  g++ exepath/exepath.cpp exepath.cpp -o exepath.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./exepath.exe;
fi
