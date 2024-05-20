# sdl3_sample01

# License: MIT

# Information:
 Note SDL3 is unstable. Have not check on the status. Looking debug test build.

 You can download imgui from github.

 Testing the cmake and make commands.


# SDL3 files:
 - download sdl3 dev from github
 - https://github.com/libsdl-org/SDL/releases/download/prerelease-3.1.2/SDL3-devel-3.1.2-mingw.tar.xz

```
project
-build
-SDL3
-imgui
-src
```

# Build make:
```
make
```
make to compile to execute app.

```
./main
```
  Run App.

# Build Cmake:

```
mkdir build
cd build
cmake ..
cmake --build .
```

# refs:
 - https://github.com/msys2/MSYS2-packages/issues/769
 - https://www.youtube.com/watch?v=H08t6gD1Y1E
 - https://www.youtube.com/watch?v=Mi47TQ4Tsr8 How to setup SDL3 as a git submodule with Modern CMake
 - 
# bug:
 - https://github.com/ocornut/imgui/pull/7580