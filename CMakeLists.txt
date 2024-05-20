# https://stackoverflow.com/questions/73896342/how-to-configure-a-cmake-file-with-dear-imgui-sdl-sdlrenderer-opencv
# 
cmake_minimum_required(VERSION 3.20)

project(sdl3_sample)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE)
#set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "" FORCE)
# https://stackoverflow.com/questions/10671916/how-to-copy-dll-files-into-the-same-folder-as-the-executable-using-cmake
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
#set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

set(CMAKE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set(CMAKE_PDB_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
LINK_DIRECTORIES(${CMAKE_BINARY_DIR}/libs)

#set(MAIN_FILE src/main.cpp)
#set(MAIN_FILE src/sdl3_opengl_imgui.cpp)
set(MAIN_FILE src/sdl3_renderer_imgui.cpp)

# Create an option to switch between a system sdl library and a vendored SDL library
# option(SDL_VENDORED "Use SDL3 libraries" OFF)

# set(SDL3_PATH "${CMAKE_CURRENT_LIST_DIR}/SDL3/x86_64-w64-mingw32")
# set(SDL3_INCLUDE_DIRS "${SDL3_PATH}/include")
# set(SDL3_LIBRARIES "${SDL3_PATH}/lib/x64/SDL2.lib;${SDL3_PATH}/lib/x64/SDL2main.lib")
find_package(SDL3 QUIET)
if(SDL3_FOUND)
    message(STATUS "Using SDL3 via find_package")
endif()

# 2. Try using a vendored SDL library
if(NOT SDL3_FOUND AND EXISTS "${CMAKE_CURRENT_LIST_DIR}/SDL3/CMakeLists.txt")
    add_subdirectory(SDL)
    message(STATUS "Using SDL3 via add_subdirectory")
    set(SDL3_FOUND TRUE)
endif()

# 3. Download SDL, and use that.
if(NOT SDL3_FOUND)
    include(FetchContent)
    set(SDL_SHARED TRUE CACHE BOOL "Build a SDL shared library (if available)")
    set(SDL_STATIC TRUE CACHE BOOL "Build a SDL static library (if available)")
    FetchContent_Declare(
        SDL
        GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
        GIT_TAG main  # Replace this with a particular git tag or git hash
        GIT_SHALLOW TRUE
        GIT_PROGRESS TRUE
    )
    message(STATUS "Using SDL3 via FetchContent")
    FetchContent_MakeAvailable(SDL)
    set_property(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/_deps/sdl-src" PROPERTY EXCLUDE_FROM_ALL TRUE)
endif()
set(IMGUI_PATH "${CMAKE_CURRENT_LIST_DIR}/imgui")

set(imgui_src
  #${IMGUI_PATH}/imconfig.h
  #${IMGUI_PATH}/imgui_internal.h
  ${IMGUI_PATH}/imgui.cpp
  ${IMGUI_PATH}/imgui.h
  ${IMGUI_PATH}/imgui_demo.cpp
  ${IMGUI_PATH}/imgui_draw.cpp
  ${IMGUI_PATH}/imgui_tables.cpp
  ${IMGUI_PATH}/imgui_widgets.cpp
  #${IMGUI_PATH}/backends/imgui_impl_opengl3.cpp
  ${IMGUI_PATH}/backends/imgui_impl_sdl3.cpp
  ${IMGUI_PATH}/backends/imgui_impl_sdlrenderer3.cpp
)

#EXECUTE APP
#add_executable(${PROJECT_NAME} ${MAIN_FILE} ${imgui_src})
add_executable(${PROJECT_NAME})

target_sources(${PROJECT_NAME} PRIVATE ${MAIN_FILE})
target_sources(${PROJECT_NAME} PUBLIC ${imgui_src})
#IMGUI
target_include_directories(${PROJECT_NAME} PUBLIC ${IMGUI_PATH} ${IMGUI_PATH}/backends)
#LIBS
target_link_libraries(${PROJECT_NAME} SDL3::SDL3 opengl32 )
#target_link_libraries(${PROJECT_NAME} SDL3::SDL3 gdi32 opengl32 imm32 )