#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ main.cpp -o a.out -std=c++17 -Wall -arch arm64 -arch x86_64; ./a.out;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ main.cpp -o a.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out;
  else
    clang++ main.cpp -o a.out -std=c++17 -Wall; ./a.out;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ main.cpp -o a.out -std=c++17 -Wall -static; ./a.out;
elif [ $(uname) = "DragonFly" ]; then
  g++ main.cpp -o a.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out;
elif [ $(uname) = "NetBSD" ]; then
  g++ main.cpp -o a.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ main.cpp -o a.out -std=c++17 -Wall -lkvm -static; ./a.out;
elif [ $(uname) = "SunOS" ]; then
  g++ main.cpp -o a.out -std=c++17 -Wall -static-libgcc; ./a.out;
else
  g++ main.cpp -o a.out.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./a.out.exe;
fi
