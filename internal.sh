#!/bin/sh
cd "${0%/*}"
if [ $(uname) = "Darwin" ]; then
  clang++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -arch arm64 -arch x86_64; ./internal.out;
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal.out;
  else
    clang++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall; ./internal.out;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -static; ./internal.out;
elif [ $(uname) = "DragonFly" ]; then
  g++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal.out;
elif [ $(uname) = "NetBSD" ]; then
  g++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal.out;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -lkvm -static; ./internal.out;
elif [ $(uname) = "SunOS" ]; then
  g++ getexecname/internal.cpp internal.cpp -o internal.out -std=c++17 -Wall -static-libgcc; ./internal.out;
else
  g++ getexecname/internal.cpp internal.cpp -o internal.out.exe -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./internal.out.exe;
fi
