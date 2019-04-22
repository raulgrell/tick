pub const std = @import("std");
pub const c = @import("c.zig");

pub const MAX_KEYS = c.GLFW_KEY_LAST;
pub const MAX_BUTTONS = c.GLFW_MOUSE_BUTTON_LAST;
pub const MAX_JOYSTICKS = c.GLFW_JOYSTICK_LAST;

pub const CursorMode = enum {
    Hidden,
    Disabled,
    Normal,
    Window
};

pub const WindowMode = enum {
    Windowed,
    Fullscreen,
};

pub const Window = struct {
    context: *c.GLFWwindow,
    cursor: *c.GLFWcursor,
    fb_width: c_int,
    fb_height: c_int,

    pub fn init(title: [*]const u8, window_width: c_int, window_height: c_int, window_mode: WindowMode) !Window {
        var self = Window {
            .context = undefined,
            .cursor = undefined,
            .fb_width = 0,
            .fb_height = 0,
        };

        _ = c.glfwSetErrorCallback(error_callback);
        if (c.glfwInit() == c.GL_FALSE) {
            return error.GlfwInitFailed;
        }

        c.glfwWindowHint(c.GLFW_SAMPLES, 4);
        c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MAJOR, 3);
        c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MINOR, 3);
        c.glfwWindowHint(c.GLFW_OPENGL_PROFILE, c.GLFW_OPENGL_CORE_PROFILE);
        c.glfwWindowHint(c.GLFW_OPENGL_FORWARD_COMPAT, c.GL_TRUE);
        c.glfwWindowHint(c.GLFW_OPENGL_DEBUG_CONTEXT, c.GL_TRUE);
        c.glfwWindowHint(c.GLFW_DEPTH_BITS, 8);
        c.glfwWindowHint(c.GLFW_STENCIL_BITS, 8);
        c.glfwWindowHint(c.GLFW_DOUBLEBUFFER, c.GL_TRUE);
        c.glfwWindowHint(c.GLFW_RESIZABLE, c.GL_FALSE);  

        if (window_mode == WindowMode.Fullscreen) {
            const primary_monitor = c.glfwGetPrimaryMonitor();
            const video_mode = c.glfwGetVideoMode(primary_monitor) orelse {
                return error.GlfwVideovideo_mode;
            };
            const monitor_width = video_mode.width;
            const monitor_height = video_mode.height;
            c.glfwWindowHint(c.GLFW_RED_BITS, video_mode.redBits);
            c.glfwWindowHint(c.GLFW_GREEN_BITS, video_mode.greenBits);
            c.glfwWindowHint(c.GLFW_BLUE_BITS, video_mode.blueBits);
            c.glfwWindowHint(c.GLFW_REFRESH_RATE, video_mode.refreshRate);
            
            self.context = c.glfwCreateWindow(monitor_width, monitor_height, title, null, null) orelse {
                return error.GlfwFullscreen;
            };
        } else {
            self.context = c.glfwCreateWindow(window_width, window_height, title, null, null) orelse {
                return error.GlfwWindow;
            };
        }

        c.glfwMakeContextCurrent(self.context);
        c.glfwGetFramebufferSize(self.context, &self.fb_width, &self.fb_height);

        c.loadGL(c.glfwGetProcAddress);

        c.glViewport(0, 0, self.fb_width, self.fb_height);
        
        c.glfwSwapInterval(1);
        
        self.cursor = c.glfwCreateStandardCursor(c.GLFW_CROSSHAIR_CURSOR) orelse {
            return error.CreateCursor;
        };

        self.setDefaultCursor();

        _ = c.glfwSetKeyCallback(self.context, key_callback);    
        _ = c.glfwSetMouseButtonCallback(self.context, mouse_button_callback);    
        _ = c.glfwSetCursorPosCallback(self.context, cursor_position_callback);
        _ = c.glfwSetMonitorCallback(monitor_callback);
        _ = c.glfwSetCursorEnterCallback(self.context, cursor_enter_callback);
        _ = c.glfwSetJoystickCallback(joystick_callback);
        _ = c.glfwSetWindowCloseCallback(self.context, window_close_callback);
        _ = c.glfwSetWindowSizeCallback(self.context, window_size_callback);
        _ = c.glfwSetDropCallback(self.context, file_drop_callback); 

        return self;
    }

    pub fn setWindowPointer(win: *Window, ptr: *c_void) void {
        c.glfwSetWindowUserPointer(win.context, ptr);        
    }

    pub fn setClearColor(r: f32, g: f32, b: f32, a: f32) void {
        c.glClearColor(r, g, b, a);
    }
    
    pub fn enableBlending() void {
        c.glEnable(c.GL_BLEND);
        c.glBlendFunc(c.GL_SRC_ALPHA, c.GL_ONE_MINUS_SRC_ALPHA);
    }

    pub fn setDefaultCursor(win: *Window) void {
        var pixels = []u8 { 0xFF, 0xFF, 0xFF, 0xFF } ** 4;
        const image = c.GLFWimage { .width = 2, .height = 2, .pixels = &pixels };
        if (c.glfwCreateCursor(&image, 1, 1)) | cursor | {
            c.glfwDestroyCursor(win.cursor);
            win.cursor = cursor;
        }
    }

    pub fn setCursorMode(win: *Window, mode: CursorMode) void {
        switch(mode) {
            CursorMode.Hidden => c.glfwSetInputMode(win.context, c.GLFW_CURSOR, c.GLFW_CURSOR_HIDDEN),
            CursorMode.Disabled => c.glfwSetInputMode(win.context, c.GLFW_CURSOR, c.GLFW_CURSOR_DISABLED),
            CursorMode.Normal => c.glfwSetInputMode(win.context, c.GLFW_CURSOR, c.GLFW_CURSOR_NORMAL),
            CursorMode.Window => c.glfwSetCursor(win.context, win.cursor)
        }
    }

    pub fn setKeyMods(win: *Window, mods: c_int, out: *c_int) void {
        if(mods & c.GLFW_MOD_CONTROL != 0) mKeyMods.mods |= c.GLFW_MOD_CONTROL;
        if(mods & c.GLFW_MOD_SHIFT   != 0) mKeyMods.mods |= c.GLFW_MOD_SHIFT;
        if(mods & c.GLFW_MOD_ALT     != 0) mKeyMods.mods |= c.GLFW_MOD_ALT;
        if(mods & c.GLFW_MOD_SUPER   != 0) mKeyMods.mods |= c.GLFW_MOD_SUPER;
    }
    
    pub fn running(win: *Window) bool {
        return (c.glfwWindowShouldClose(win.context) == c.GL_FALSE);
    }
    
    pub fn update(win: *Window) void {
        c.glfwSwapBuffers(win.context);
        c.glfwPollEvents();
    }
    
    pub fn clear(win: *Window) void {
        c.glClearDepth(1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT|c.GL_DEPTH_BUFFER_BIT|c.GL_STENCIL_BUFFER_BIT);
    }

    pub fn destroy(win: *Window) void {
        c.glfwDestroyWindow(win.context);
        c.glfwTerminate();
    }
};

extern fn key_callback(win: ?*c.GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) void {
    switch (key) {
        c.GLFW_KEY_ESCAPE => c.glfwSetWindowShouldClose(win, c.GL_TRUE),
        else => {}
    }
}

extern fn cursor_position_callback(win: ?*c.GLFWwindow, xpos: f64, ypos: f64) void {
}

extern fn cursor_enter_callback(win: ?*c.GLFWwindow, entered: c_int) void {
}

extern fn mouse_button_callback(win: ?*c.GLFWwindow, button: c_int, action: c_int, mods: c_int) void {
}

extern fn scroll_callback(win: ?*c.GLFWwindow, xpos: f64, ypos: f64) void {
}

extern fn monitor_callback(monitor: ?*c.GLFWmonitor, event: c_int) void {
}

extern fn joystick_callback(joy: c_int, event: c_int) void {
}

extern fn window_close_callback(win: ?*c.GLFWwindow) void {
    c.glfwSetWindowShouldClose(win, c.GLFW_TRUE);
}

extern fn window_size_callback(win: ?*c.GLFWwindow, width: c_int, height: c_int) void {
}

extern fn file_drop_callback(win: ?*c.GLFWwindow, count: c_int, paths: ?[*]?[*]const u8) void {
}

extern fn error_callback(err: c_int, description: ?[*]const u8) void {
    std.debug.warn("Error: {}\n", description);
}