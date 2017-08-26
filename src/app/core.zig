const stdmem = @import("std").mem;

// Math
use @import("audio.zig");
use @import("../math/index.zig");
use @import("../system/index.zig");

// System

const TARGET_FPS       = 60.0;
const TARGET_FRAMETIME = 1.0 / TARGET_FPS;
const MAX_DELTA_TIME   = 1.0;
const MAX_FRAME_STEPS  = 6;

const WINDOW_WIDTH  = 640;
const WINDOW_HEIGHT = 360;

const SetupFunction  = fn(app: &App) -> void;
const DrawFunction   = fn(app: &App) -> void;
const UpdateFunction = fn(app: &App, deltaTime: f32) -> void;

// Main App Object
pub const App = struct {
    window:          Window,
    input:           InputManager,
    audio:           AudioEngine,
    onInit:          SetupFunction,
    onDraw:          DrawFunction,
    onUpdate:        UpdateFunction,

    pub fn init() -> &App {
        var app = mem.mem.create(App) %% unreachable;

        // Window
        app.window.init(WINDOW_WIDTH, WINDOW_HEIGHT);
        app.window.setWindowPointer(@ptrCast(&const u8, app));

        app.window.setCustomCursor();
        app.window.setCursorMode(CursorMode.Window);

        Window.setClearColor(0, 0, 0, 1);
        Window.enableBlending();

        debug.assertNoErrorGL();

        // Input Manager
        app.input.init();

        // Audio
        %%app.audio.init();
        %%app.audio.open();
        %%app.audio.start();

        return app;
    }

    pub fn run (app: &App) {
        app.onInit(app);

        var currentTicks: f32 = 0.0;
        var previousTicks: f32 = 0.0;
        var deltaTime: f32 = 0.0;

        while (c.glfwWindowShouldClose(app.window.window) == c.GL_FALSE) {
            const newTicks: f32 = (f32)(c.glfwGetTime());
            currentTicks = newTicks - previousTicks;
            previousTicks = newTicks;
            var frameSteps: u8 = 0;
            var totalDeltaTime = currentTicks / TARGET_FRAMETIME;
            while (totalDeltaTime > 0.0 and frameSteps < MAX_FRAME_STEPS) {
                deltaTime = if (totalDeltaTime < MAX_DELTA_TIME) totalDeltaTime else MAX_DELTA_TIME;
                app.input.update();
                app.onUpdate(app, deltaTime);
                totalDeltaTime -= deltaTime;
                frameSteps += 1;
            }
            app.window.clear();
            app.onDraw(app);
            app.window.update();
        }

        debug.assertNoErrorGL();
    }
};

extern fn key_callback(win: ?&c.GLFWwindow, key: c_int, scancode: c_int, action: c_int, mods: c_int) -> void {
    // Filter actions and make sure key is a valid array index for the input manager
    if (action == c.GLFW_REPEAT or key < 0) return;
    const app = @ptrCast(&App, ??c.glfwGetWindowUserPointer(win));
    switch (key) {
        c.GLFW_KEY_ESCAPE => c.glfwSetWindowShouldClose(win, c.GL_TRUE),
        else => app.input.keyDown[usize(key)] = (action != c.GLFW_RELEASE)
    }
}

extern fn cursor_position_callback(win: ?&c.GLFWwindow, xpos: f64, ypos: f64) -> void {
    const app = @ptrCast(&App, ??c.glfwGetWindowUserPointer(win));
    app.input.cursor_position = vec2(f32(xpos - 1), f32(ypos - 1));
}

extern fn cursor_enter_callback(win: ?&c.GLFWwindow, entered: c_int) {
    if (entered != 0) {
        // The cursor entered the client area of the window
    } else {
        // The cursor left the client area of the window
    }
}
extern fn mouse_button_callback(win: ?&c.GLFWwindow, button: c_int, action: c_int, mods: c_int) -> void {
    if (button < 0) return;
    const app = @ptrCast(&App, ??c.glfwGetWindowUserPointer(win));
    app.input.mouseDown[usize(button)] = (action != c.GLFW_RELEASE);
}

extern fn scroll_callback(win: ?&c.GLFWwindow, xpos: f64, ypos: f64) {

}

extern fn monitor_callback(monitor: ?&c.GLFWmonitor, event: c_int) {
    if (event == c.GLFW_CONNECTED) {
         // The monitor was connected
    } else if (event == c.GLFW_DISCONNECTED) {
        // The monitor was disconnected
    }
}

extern fn joystick_callback(joy: c_int, event: c_int) {
    if (event == c.GLFW_CONNECTED) {
        // The joystick was connected
    } else if (event == c.GLFW_DISCONNECTED) {
        // The joystick was disconnected
    }
}

extern fn window_close_callback(window: ?&c.GLFWwindow) {
    c.glfwSetWindowShouldClose(window, c.GLFW_TRUE);
}

extern fn window_size_callback(window: ?&c.GLFWwindow, width: c_int, height: c_int) {
    // User or system resized window
}

extern fn error_callback(err: c_int, description: ?&const u8) {
    _ = c.printf(c"Error: %s\n", description);
    c.abort();
}

const CursorMode = enum {
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

    pub fn init(win: &Window, window_width: c_int, window_height: c_int) {
        _ = c.glfwSetErrorCallback(error_callback);
        if (c.glfwInit() == c.GL_FALSE) {
            _ = c.printf(c"GLFW init failure\n");
            c.abort();
        }

        // const primary = c.glfwGetPrimaryMonitor();
        // const mode = c.glfwGetVideoMode(primary) ?? {
        //     _ = c.printf(c"unable to get video mode\n");
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
            _ = c.printf(c"unable to create window\n");
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
    }

    pub fn setWindowPointer(win: &Window, app: &const u8) {
        c.glfwSetWindowUserPointer(win.window, @ptrCast(&c_void, app));        
    }

    pub fn setClearColor(r: f32, g: f32, b: f32, a: f32) {
        c.glClearColor(r, g, b, a);
    }
    
    pub fn enableBlending() {
        c.glEnable(c.GL_BLEND);
        c.glBlendFunc(c.GL_SRC_ALPHA, c.GL_ONE_MINUS_SRC_ALPHA);
    }

    pub fn setCustomCursor(win: &Window) {
        var pixels = []u8 { 0xFF, 0xFF, 0xFF, 0xFF } ** 4;
        const image = c.GLFWimage { .width = 2, .height = 2, .pixels = &pixels[0] };
        if (c.glfwCreateCursor(&image, 0, 0)) | cursor | {
            c.glfwDestroyCursor(win.cursor);
            win.cursor = cursor;
        }
    }

    pub fn setCursorMode(win: &Window, mode: CursorMode) {
        switch(mode) {
            CursorMode.Hidden => c.glfwSetInputMode(win.window, c.GLFW_CURSOR, c.GLFW_CURSOR_HIDDEN),
            CursorMode.Disabled => c.glfwSetInputMode(win.window, c.GLFW_CURSOR, c.GLFW_CURSOR_DISABLED),
            CursorMode.Normal => c.glfwSetInputMode(win.window, c.GLFW_CURSOR, c.GLFW_CURSOR_NORMAL),
            CursorMode.Window => c.glfwSetCursor(win.window, win.cursor)
        }
    }
    
    pub fn update(win: &Window) {
        c.glfwSwapBuffers(win.window);
        c.glfwPollEvents();
    }
    
    pub fn clear(win: &Window) {
        c.glClearDepth(1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT|c.GL_DEPTH_BUFFER_BIT|c.GL_STENCIL_BUFFER_BIT);
    }

    pub fn destroy(win: &Window){
        c.glfwDestroyWindow(win.window);
        c.glfwTerminate();
    }
};

const MAX_KEYS = c.GLFW_KEY_LAST;
const MAX_BUTTONS = c.GLFW_MOUSE_BUTTON_LAST;

// const MAX_JOYSTICKS = c.GLFW_JOYSTICK_LAST;

// int present = glfwJoystickPresent(GLFW_JOYSTICK_1);

// int count;
// const float* axes = glfwGetJoystickAxes(GLFW_JOYSTICK_1, &count);

// int count;
// const unsigned char* buttons = glfwGetJoystickButtons(GLFW_JOYSTICK_1, &count);

// const char* name = glfwGetJoystickName(GLFW_JOYSTICK_1);

pub const InputManager = struct {
    // Keyboard
    keyDown: [MAX_KEYS]bool,
    prevKeyState: [MAX_KEYS]bool,
    keyPressed: [MAX_KEYS]bool,
    // Mouse
    mouseDown: [MAX_BUTTONS]bool,
    prevMouseState: [MAX_BUTTONS]bool,
    mouseClicked: [MAX_BUTTONS]bool,
    cursor_position: Vec2,

    pub fn create() -> InputManager {
        InputManager {
            .keyDown = []bool{false} ** MAX_KEYS,
            .prevKeyState = []bool{false} ** MAX_KEYS ,
            .keyPressed = []bool{false} ** MAX_KEYS,
            .mouseDown = []bool{false} ** MAX_BUTTONS,
            .prevMouseState = []bool{false} ** MAX_BUTTONS,
            .mouseClicked = []bool{false} ** MAX_BUTTONS,
            .cursorX = 0,
            .cursorY = 0,
        }
    }

    pub fn init(im: &InputManager)  {
        im.clearKeys();
        im.clearMouseButtons();
    }

    pub fn update(im: &InputManager) -> void {
        { var i: usize = 0; while(i < MAX_KEYS) : (i += 1) {
            im.keyPressed[i] = im.keyDown[i] and !im.prevKeyState[i];
        }}

        { var i: usize = 0; while(i < MAX_BUTTONS) : (i += 1) {
            im.mouseClicked[i] = im.mouseDown[i] and !im.prevMouseState[i];
        }}

        mem.copy(bool, im.prevKeyState[0..], im.keyDown[0..]);
        mem.copy(bool, im.prevMouseState[0..], im.mouseDown[0..]);
    }

    pub fn getMouseCoords() -> Vec2 {

    }
    
    pub fn clearKeys(im: &InputManager) {
        // TODO: Go down arrays instead of keys/buttons
        { var i: usize = 0; while(i < MAX_KEYS) : (i += 1) {
            im.keyDown[i] = false;
            im.prevKeyState[i] = false;
            im.keyPressed[i] = false;
        }}
    }

    pub fn clearMouseButtons(im: &InputManager) {
        { var i: usize = 0; while(i < MAX_BUTTONS) : (i += 1) {
            im.mouseDown[i] = false;
            im.prevMouseState[i] = false;
            im.mouseClicked[i] = false;
        }}
    }
};