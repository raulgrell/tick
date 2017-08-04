// Math
use @import("../math/index.zig");

// System
const c        = @import("../system/c.zig");
const debug    = @import("../system/debug.zig");

const TARGET_FPS       = 60.0;
const TARGET_FRAMETIME = 1.0 / TARGET_FPS;
const MAX_DELTA_TIME   = 1.0;
const MAX_FRAME_STEPS  = 6;

const WINDOW_WIDTH  = 800;
const WINDOW_HEIGHT = 600;

const setupFunction  = fn(app: &App) -> void;
const drawFunction   = fn(app: &App) -> void;
const updateFunction = fn(app: &App, deltaTime: f32) -> void;

// Main App Object
pub const App = struct {
    window:          Window,
    input:           InputManager,
    onInit:          setupFunction,
    onDraw:          drawFunction,
    onUpdate:        updateFunction,

    pub fn init() -> App {
        var app: App = undefined;

        // Window
        app.window.init(WINDOW_WIDTH, WINDOW_HEIGHT);
        _ = c.glfwSetKeyCallback(app.window.window, key_callback);    
        _ = c.glfwSetMouseButtonCallback(app.window.window, mouse_button_callback);    
        _ = c.glfwSetCursorPosCallback(app.window.window, cursor_position_callback);
        _ = c.glfwSetMonitorCallback(monitor_callback);

        c.glClearColor(0.0, 0.0, 0.0, 1.0);

        c.glEnable(c.GL_BLEND);
        c.glBlendFunc(c.GL_SRC_ALPHA, c.GL_ONE_MINUS_SRC_ALPHA);

        debug.assertNoErrorGL();

        // Input Manager
        app.input.init();

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
        else => {
            app.input.keyDown[(usize)(key)] = (action != c.GLFW_RELEASE);
        },
    }
}

extern fn cursor_position_callback(win: ?&c.GLFWwindow, xpos: f64, ypos: f64) -> void {
    const app = @ptrCast(&App, ??c.glfwGetWindowUserPointer(win));
    app.input.cursorX =  xpos;
    app.input.cursorY =  ypos;
}

extern fn mouse_button_callback(win: ?&c.GLFWwindow, button: c_int, action: c_int, mods: c_int) -> void {
    // Make sure valid index for input manager
    if (button < 0) return;
    const app = @ptrCast(&App, ??c.glfwGetWindowUserPointer(win));
    app.input.mouseDown[(usize)(button)] = (action != c.GLFW_RELEASE);
}

extern fn monitor_callback(monitor: ?&c.GLFWmonitor, event: c_int) {
    if (event == c.GLFW_CONNECTED) {
         // The monitor was connected
    } else if (event == c.GLFW_DISCONNECTED) {
        // The monitor was disconnected
    }
}

extern fn error_callback(err: c_int, description: ?&const u8) {
    _ = c.printf(c"Error: %s\n", description);
    c.abort();
}

pub const Window = struct {
    window: &c.GLFWwindow,
    framebuffer_width: c_int,
    framebuffer_height: c_int,

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
        // c.glfwWindowHint(c.GLFW_RED_BITS, mode.redBits);
        // c.glfwWindowHint(c.GLFW_GREEN_BITS, mode.greenBits);
        // c.glfwWindowHint(c.GLFW_BLUE_BITS, mode.blueBits);
        // c.glfwWindowHint(c.GLFW_REFRESH_RATE, mode.refreshRate);
        
        c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MAJOR, 3);
        c.glfwWindowHint(c.GLFW_CONTEXT_VERSION_MINOR, 3);

        c.glfwWindowHint(c.GLFW_OPENGL_FORWARD_COMPAT, c.GL_TRUE);
        c.glfwWindowHint(c.GLFW_OPENGL_DEBUG_CONTEXT, debug.is_on);
        c.glfwWindowHint(c.GLFW_OPENGL_PROFILE, c.GLFW_OPENGL_CORE_PROFILE);

        c.glfwWindowHint(c.GLFW_DEPTH_BITS, 8);
        c.glfwWindowHint(c.GLFW_STENCIL_BITS, 8);
        c.glfwWindowHint(c.GLFW_RESIZABLE, c.GL_FALSE);
        
        win.window = c.glfwCreateWindow(window_width, window_height, c"App", null, null) ?? {
            _ = c.printf(c"unable to create window\n");
            c.abort();
        };

        c.glfwMakeContextCurrent(win.window);
        c.glfwSwapInterval(1);

        c.glfwGetFramebufferSize(win.window, &win.framebuffer_width, &win.framebuffer_height);

        if (win.framebuffer_width < window_width or win.framebuffer_height < window_height) unreachable;
        
        c.glViewport(0, 0, win.framebuffer_width, win.framebuffer_height);
    }

    pub fn destroy(win: &Window){
        c.glfwDestroyWindow(win.window);
        c.glfwTerminate();
    }

    pub fn update(win: &Window) {
        c.glfwSwapBuffers(win.window);
        c.glfwPollEvents();
    }
    
    pub fn clear(win: &Window) {
        c.glClearDepth(1.0);
        c.glClear(c.GL_COLOR_BUFFER_BIT|c.GL_DEPTH_BUFFER_BIT|c.GL_STENCIL_BUFFER_BIT);
    }
};

const MAX_KEYS = 1024;
const MAX_BUTTONS = 32;

pub const InputManager = struct {
    // Keyboard
    keyDown: [MAX_KEYS]bool,
    prevKeyState: [MAX_KEYS]bool,
    keyPressed: [MAX_KEYS]bool,
    // Mouse
    mouseDown: [MAX_BUTTONS]bool,
    prevMouseState: [MAX_BUTTONS]bool,
    mouseClicked: [MAX_BUTTONS]bool,
    cursorX: f64,
    cursorY: f64,

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

        @memcpy(@ptrCast(&u8, &im.prevKeyState), @ptrCast(&u8, &im.keyDown), MAX_KEYS);
        @memcpy(@ptrCast(&u8, &im.prevMouseState),@ptrCast(&u8, &im.mouseDown), MAX_BUTTONS);
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