#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -arch arm64 -arch x86_64; ./pidpath.out;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./pidpath.out;
  else
    clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall; ./pidpath.out;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -static; ./pidpath.out;
elif [ $(uname) = "DragonFly" ]; then
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./pidpath.out;
elif [ $(uname) = "NetBSD" ]; then
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./pidpath.out;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -lkvm -static; ./pidpath.out;
elif [ $(uname) = "SunOS" ]; then
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out -std=c++17 -Wall -static-libgcc -lproc; ./pidpath.out;
else
  g++ pidpath/pidpath.cpp pidpath.cpp -o pidpath.out.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./pidpath.out.exe;
fi
