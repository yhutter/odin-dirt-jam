package main

import "core:fmt"
import gl "vendor:OpenGL"
import "vendor:glfw"

WIDTH :: 1920
HEIGHT :: 1080
TITLE :: "Odin Dirt Jam"

GL_MAJOR_VERSION :: 4
GL_MINOR_VERSION :: 1

main :: proc() {
	if !bool(glfw.Init()) {
		fmt.eprintln("GLFW has failed to load")
		return
	}

	window_handle := glfw.CreateWindow(WIDTH, HEIGHT, TITLE, nil, nil)

	defer glfw.Terminate()
	defer glfw.DestroyWindow(window_handle)

	if window_handle == nil {
		fmt.eprintln("GLFW has failed to load the window.")
		return
	}

	// Load OpenGL Context
	glfw.MakeContextCurrent(window_handle)
	gl.load_up_to(GL_MAJOR_VERSION, GL_MINOR_VERSION, glfw.gl_set_proc_address)

	for !glfw.WindowShouldClose(window_handle) {
		glfw.PollEvents()

		gl.ClearColor(0.0, 0.0, 0.0, 1.0)
		gl.Clear(gl.COLOR_BUFFER_BIT)

		glfw.SwapBuffers(window_handle)
	}
}