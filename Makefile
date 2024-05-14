# g++
# lmingw32

#APP .exe
EXE = main
#SDL3
SDL_PATH = SDL3/x86_64-w64-mingw32
SDL_INCLUDES = -I $(SDL_PATH)/include
SDL_LIBS = -L $(SDL_PATH)/lib
#IMGUI
IMGUI_DIR = imgui
IMGUI_INCLUDES = -I $(IMGUI_DIR)/
IMGUI_INCLUDES += -I $(IMGUI_DIR)/backends
#MAIN
#SOURCES = src/main.cpp
SOURCES = src/sdl3_opengl_imgui.cpp
#SRC
SOURCES += $(IMGUI_DIR)/imgui.cpp 
SOURCES += $(IMGUI_DIR)/imgui_demo.cpp 
SOURCES += $(IMGUI_DIR)/imgui_draw.cpp 
SOURCES += $(IMGUI_DIR)/imgui_tables.cpp 
SOURCES += $(IMGUI_DIR)/imgui_widgets.cpp
SOURCES += $(IMGUI_DIR)/backends/imgui_impl_sdl3.cpp 
SOURCES += $(IMGUI_DIR)/backends/imgui_impl_opengl3.cpp
#LIBS
#LIBS = -lgdi32 -lopengl32 -limm32 -lmingw32 -lSDL3
LIBS = -lopengl32 -lSDL3

all:
	g++ $(SDL_INCLUDES) $(IMGUI_INCLUDES) $(SDL_LIBS) -o $(EXE) $(SOURCES) $(LIBS)