// Core
use @import("index.zig");

// Tick
use @import("../system/index.zig");
use @import("../math/index.zig");


pub const MAX_KEYS = c.GLFW_KEY_LAST;
pub const MAX_BUTTONS = c.GLFW_MOUSE_BUTTON_LAST;
pub const MAX_JOYSTICKS = c.GLFW_JOYSTICK_LAST;

pub const CursorMode = enum {
    Hidden,
    Disabled,
    Normal,
    Window
};

pub const Window = struct {
    window: &c.GLFWwindow,
    cursor: &c.GLFWcursor,
    framebuffer_width: usize,
    framebuffer_height: usize,

    pub fn init(win: &Window, window_width: c_int, window_height: c_int) void {
        _ = c.glfwSetErrorCallback(error_callback);
        if (c.glfwInit() == c.GL_FALSE) {
            _ = warn("GLFW init failure\n");
            c.abort();
        }

        // const primary = c.glfwGetPrimaryMonitor();
        // const mode = c.glfwGetVideoMode(primary) ?? {
        //     _ = warn("unable to get video mode\n");
        //     c.abort();
        // };
        // const monitor_width = mode.width;
        // const monitor_ height = mode.height;
        // c.glfwWindowHint(c.GLFW_RED_BITS, mode.redBits);
        // c.glfwWindowHint(c.GLFW_GREEN_BITS, mode.greenBits);
        // c.glfwWindowHint(c.GLFW_BLUE_BITS, mode.blueBits);
        // c.glfwWindowHint(c.GLFW_REFRESH_RATE, mode.refreshRate);
        
        c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MAJOR, 3);
        c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MINOR, 3);

        c.glfwWindowHint(c.GLFW_OPENGL_PROFILE, c.GLFW_OPENGL_CORE_PROFILE);
        c.glfwWindowHint(c.GLFW_OPENGL_FORWARD_COMPAT, c.GL_TRUE);
        c.glfwWindowHint(c.GLFW_OPENGL_DEBUG_CONTEXT, debug.is_on);

        c.glfwWindowHint(c.GLFW_DEPTH_BITS, 8);
        c.glfwWindowHint(c.GLFW_STENCIL_BITS, 8);
        c.glfwWindowHint(c.GLFW_DOUBLEBUFFER, c.GL_TRUE);
        c.glfwWindowHint(c.GLFW_RESIZABLE, c.GL_FALSE);
        
        win.window = c.glfwCreateWindow(window_width, window_height, c"App", null, null) ?? {
            _ = warn("unable to create window\n");
            c.abort();
        };
        
        c.glfwMakeContextCurrent(win.window);
        c.glfwSwapInterval(1);
        
        var fb_width = c_int(0);
        var fb_height = c_int(0);
        c.glfwGetFramebufferSize(win.window, &fb_width, &fb_height);

        c.glViewport(0, 0, fb_width, fb_height);
        
        win.framebuffer_width = usize(fb_width);
        win.framebuffer_height = usize(fb_height);        
        win.cursor = c.glfwCreateStandardCursor(c.GLFW_CROSSHAIR_CURSOR) ?? unreachable;
        
        _ = c.glfwSetKeyCallback(win.window, key_callback);    
        _ = c.glfwSetMouseButtonCallback(win.window, mouse_button_callback);    
        _ = c.glfwSetCursorPosCallback(win.window, cursor_position_callback);
        _ = c.glfwSetMonitorCallback(monitor_callback);
        _ = c.glfwSetCursorEnterCallback(win.window, cursor_enter_callback);
        _ = c.glfwSetJoystickCallback(joystick_callback);
        _ = c.glfwSetWindowCloseCallback(win.window, window_close_callback);
        _ = c.glfwSetWindowSizeCallback(win.window, window_size_callback);
        _ = c.glfwSetDropCallback(win.window, file_drop_callback); 
    }

    pub fn setWindowPointer(win: &Window, app: &const u8) void {
        c.glfwSetWindowUserPointer(win.window, @ptrCast(&c_void, app));        
    }

    pub fn setClearColor(r: f32, g: f32, b: f32, a: f32) void {
        c.glClearColor(r, g, b, a);
    }
    
    pub fn enableBlending() void {
        c.glEnable(c.GL_BLEND);
        c.glBlendFunc(c.GL_SRC_ALPHA, c.GL_ONE_MINUS_SRC_ALPHA);
    }

    pub fn setCustomCursor(win: &Window) void {
        var pixels = []u8 { 0xFF, 0xFF, 0xFF, 0xFF } ** 4;
        const image = c.GLFWimage { .width = 2, .height = 2, .pixels = &pixels[0] };
        if (c.glfwCreateCursor(&image, 0, 0)) | cursor | {
            c.glfwDestroyCursor(win.cursor);
            win.cursor = cursor;
        }
    }

    pub fn setCursorMode(win: &Window, mode: CursorMode) void {
        switch(mode) {
            CursorMode.Hidden => c.glfwSetInputMode(win.window, c.GLFW_CURSOR, c.GLFW_CURSOR_HIDDEN),
            CursorMode.Disabled => c.glfwSetInputMode(win.window, c.GLFW_CURSOR, c.GLFW_CURSOR_DISABLED),
            CursorMode.Normal => c.glfwSetInputMode(win.window, c.GLFW_CURSOR, c.GLFW_CURSOR_NORMAL),
            CursorMode.Window => c.glfwSetCursor(win.window, win.cursor)
        }
    }
    
    pub fn running(win: &Window) bool {
        return (c.glfwWindowShouldClose(win.window) == c.GL_FALSE);
    }
    
    pub fn update(win: &Window) void {
        c.glfwSwapBuffers(win.window);
        c.glfwPollEvents();
    }
    
    pub fn clear(win: &Window) void {
        c.glClearDepth(1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT|c.GL_DEPTH_BUFFER_BIT|c.GL_STENCIL_BUFFER_BIT);
    }

    pub fn destroy(win: &Window) void {
        c.glfwDestroyWindow(win.window);
        c.glfwTerminate();
    }
};


extern fn key_callback(win: ?&c.GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) void {
    // Filter actions and make sure key is a valid array index for the input manager
    if (action == c.GLFW_REPEAT or key < 0) return;
    const app = @ptrCast(&App, @alignCast(@alignOf(App), ??c.glfwGetWindowUserPointer(win)));
    switch (key) {
        c.GLFW_KEY_ESCAPE => c.glfwSetWindowShouldClose(win, c.GL_TRUE),
        else => app.input.keyDown[usize(key)] = (action != c.GLFW_RELEASE)
    }
}

extern fn cursor_position_callback(win: ?&c.GLFWwindow, xpos: f64, ypos: f64) void {
    const app = @ptrCast(&App, @alignCast(@alignOf(App), ??c.glfwGetWindowUserPointer(win)));
    app.input.cursor_position = vec2(f32(xpos - 1), f32(ypos - 1));
}

extern fn cursor_enter_callback(win: ?&c.GLFWwindow, entered: c_int) void {
    if (entered != 0) {
        // The cursor entered the client area of the window
    } else {
        // The cursor left the client area of the window
    }
}
extern fn mouse_button_callback(win: ?&c.GLFWwindow, button: c_int, action: c_int, mods: c_int) void {
    if (button < 0) return;
    const app = @ptrCast(&App, @alignCast(@alignOf(App), ??c.glfwGetWindowUserPointer(win)));
    app.input.buttonDown[usize(button)] = (action != c.GLFW_RELEASE);
}

extern fn scroll_callback(win: ?&c.GLFWwindow, xpos: f64, ypos: f64) void {

}

extern fn monitor_callback(monitor: ?&c.GLFWmonitor, event: c_int) void {
    if (event == c.GLFW_CONNECTED) {
         // The monitor was connected
    } else if (event == c.GLFW_DISCONNECTED) {
        // The monitor was disconnected
    }
}

extern fn joystick_callback(joy: c_int, event: c_int) void {
    if (event == c.GLFW_CONNECTED) {
        // The joystick was connected
    } else if (event == c.GLFW_DISCONNECTED) {
        // The joystick was disconnected
    }
}

extern fn window_close_callback(win: ?&c.GLFWwindow) void {
    c.glfwSetWindowShouldClose(win, c.GLFW_TRUE);
}

extern fn window_size_callback(win: ?&c.GLFWwindow, width: c_int, height: c_int) void {
    // User or system resized window
}

extern fn file_drop_callback(win: ?&c.GLFWwindow, count: c_int, paths: ?&?&const u8) void {
    // File dropped in window
}

extern fn error_callback(err: c_int, description: ?&const u8) void {
    _ = warn("Error: {}\n", std.cstr.toSliceConst(??description));
    c.abort();
}


// int present = glfwJoystickPresent(GLFW_JOYSTICK_1);
// int count;
// const float* axes = glfwGetJoystickAxes(GLFW_JOYSTICK_1, &count);
// const unsigned char* buttons = glfwGetJoystickButtons(GLFW_JOYSTICK_1, &count);
// const char* name = glfwGetJoystickName(GLFW_JOYSTICK_1);