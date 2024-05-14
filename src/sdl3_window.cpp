// https://github.com/ocornut/imgui/blob/master/examples/example_sdl3_opengl3/main.cpp
// 
// Example program:
// Using SDL3 to create an application window

#include <SDL3/SDL.h>

int main(int argc, char* argv[]) {

    SDL_Window *window;                    // Declare a pointer

    SDL_Init(SDL_INIT_VIDEO);              // Initialize SDL2

    // Create an application window with the following settings:
    window = SDL_CreateWindow(
        "An SDL3 window",                  // window title
        640,                               // width, in pixels
        480,                               // height, in pixels
        SDL_WINDOW_OPENGL                  // flags - see below
    );

    // Check that the window was successfully created
    if (window == NULL) {
        // In the case that the window could not be made...
        SDL_LogError(SDL_LOG_CATEGORY_ERROR, "Could not create window: %s\n", SDL_GetError());
        return 1;
    }

    // The window is open: could enter program loop here (see SDL_PollEvent())

     // Main loop
    bool done = false;
    while (!done){
      SDL_Event event;
      while (SDL_PollEvent(&event))
      {
          //ImGui_ImplSDL3_ProcessEvent(&event);
          if (event.type == SDL_EVENT_QUIT)
              done = true;
          if (event.type == SDL_EVENT_WINDOW_CLOSE_REQUESTED && event.window.windowID == SDL_GetWindowID(window))
              done = true;
      }
    }

    //SDL_Delay(3000);  // Pause execution for 3000 milliseconds, for example

    // Close and destroy the window
    SDL_DestroyWindow(window);

    // Clean up
    SDL_Quit();
    return 0;
}