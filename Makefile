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
#SOURCES = src/sdl3_opengl_imgui.cpp
SOURCES = src/sdl3_renderer_imgui.cpp
#SRC
SOURCES += $(IMGUI_DIR)/imgui.cpp 
SOURCES += $(IMGUI_DIR)/imgui_demo.cpp 
SOURCES += $(IMGUI_DIR)/imgui_draw.cpp 
SOURCES += $(IMGUI_DIR)/imgui_tables.cpp 
SOURCES += $(IMGUI_DIR)/imgui_widgets.cpp
SOURCES += $(IMGUI_DIR)/backends/imgui_impl_sdl3.cpp 
#SOURCES += $(IMGUI_DIR)/backends/imgui_impl_opengl3.cpp
SOURCES += $(IMGUI_DIR)/backends/imgui_impl_sdlrenderer3.cpp
#LIBS
#LIBS = -lgdi32 -lopengl32 -limm32 -lmingw32 -lSDL3
LIBS = -lopengl32 -lSDL3

IMGUI_SDL = sdl
IMGUI_OPENGL = opengl
#IMGUI_TYPE = $(IMGUI_OPENGL)
IMGUI_TYPE = $(IMGUI_SDL)

# $(error   VAR is $(VAR))
# $(warning VAR is $(VAR))
$(info    IMGUI_TYPE is $(IMGUI_TYPE))

#echo "$(IMGUI_SDL)"
#$(info "IMGUI_TYPE: " $(IMGUI_TYPE))

# ifeq ($(IMGUI_TYPE), sdl)
# $(info "IMGUI SDL")
# else
# $(info "IMGUI RENDERER")
# endif

# filenames := main.exe imgui.ini

# files := $(strip $(foreach f,$(filenames),$(wildcard $(f))))

MY_EXECUTABLE = $(EXE).exe

all: build

.PHONY: build
build:
	$(info "init compile")
	g++ $(SDL_INCLUDES) $(IMGUI_INCLUDES) $(SDL_LIBS) -o $(EXE) $(SOURCES) $(LIBS)

.PHONY: clean
clean:
	$(info "OS $(OS)")
	$(info "CURDIR $(CURDIR)")
ifeq ($(OS),Windows_NT)
	rm -f "$(MY_EXECUTABLE)"
endif

# ifeq ($(OS),Windows_NT)
# 	rm "$(CURDIR)/$(MY_EXECUTABLE)"
# endif
#rm -f $(MY_EXECUTABLE)
#	rm -f ./main.exe
# ifneq ($(files),)
#   rm -f $(files)
# endif