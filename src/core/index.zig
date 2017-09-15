// Core
pub const audio = @import("audio.zig");
pub const dev = @import("dev.zig");
pub const window = @import("window.zig");
pub const gui = @import("gui.zig");

use window;

// System
use @import("../system/index.zig");
use @import("../math/index.zig");

const TARGET_FPS       = 60.0;
const TARGET_FRAMETIME = 1.0 / TARGET_FPS;
const MAX_DELTA_TIME   = 1.0;
const MAX_FRAME_STEPS  = 6;

const WINDOW_WIDTH  = 640;
const WINDOW_HEIGHT = 360;

pub const API = struct {
    init:     fn(app: &App) -> void,
    update:   fn(app: &App, delta_time: f32) -> %void,
    draw:     fn(app: &App) -> void,
    deinit:   fn(app: &App) -> void,
};

// Main App Object
pub const App = struct {
    window:   Window,
    input:    InputManager,
    // audio:    AudioEngine,

    pub fn init() -> &App {
        var app = c.mem.create(App) %% unreachable;

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
        // %%app.audio.init();
        // %%app.audio.open();
        // %%app.audio.start();

        return app;
    }

    pub fn run (app: &App, api: &const API) {
        api.init(app);

        var current_ticks: f32 = 0.0;
        var previous_ticks: f32 = 0.0;
        var delta_time: f32 = 0.0;

        while (app.window.running()) {
            // Tick
            const newTicks: f32 = (f32)(c.glfwGetTime());
            current_ticks = newTicks - previous_ticks;
            previous_ticks = newTicks;
            
            // Update
            var frameSteps: u8 = 0;
            var total_delta_time = current_ticks / TARGET_FRAMETIME;
            while (total_delta_time > 0.0 and frameSteps < MAX_FRAME_STEPS) {
                delta_time = if (total_delta_time < MAX_DELTA_TIME) total_delta_time else MAX_DELTA_TIME;
                api.update(app, delta_time) %% break;
                total_delta_time -= delta_time;
                frameSteps += 1;
            }
            app.input.update();
            
            app.window.clear();
            api.draw(app);
            app.window.update();
        }

        debug.assertNoErrorGL();
    }
};

pub const InputManager = struct {
    // Keyboard
    keyPressed: [MAX_KEYS]bool,
    keyDown: [MAX_KEYS]bool,
    prevKeyState: [MAX_KEYS]bool,
    // Mouse
    buttonPressed: [MAX_BUTTONS]bool,
    buttonDown: [MAX_BUTTONS]bool,
    prevButtonState: [MAX_BUTTONS]bool,
    cursor_position: Vec2,
    scroll_offset: Vec2,

    const KeyMods = struct {
        mods: u8,

        fn controlDown(self: &KeyMods) -> bool { (self.mods & GLFW_MOD_CONTROL) and GLFW_MOD_CONTROL } 
        fn shiftDown(self: &KeyMods)   -> bool { (self.mods & GLFW_MOD_SHIFT)   and GLFW_MOD_SHIFT   } 
        fn altDown(self: &KeyMods)     -> bool { (self.mods & GLFW_MOD_ALT)     and GLFW_MOD_ALT     } 
        fn superDown(self: &KeyMods)   -> bool { (self.mods & GLFW_MOD_SUPER)   and GLFW_MOD_SUPER   }
    };

    pub fn create() -> InputManager {
        InputManager {
            .keyPressed      = []bool{false} ** MAX_KEYS,    
            .keyReleased     = []bool{false} ** MAX_KEYS,    
            .keyDown         = []bool{false} ** MAX_KEYS,    
            .prevKeyState    = []bool{false} ** MAX_KEYS,    
            .buttonPressed   = []bool{false} ** MAX_BUTTONS, 
            .buttonReleased  = []bool{false} ** MAX_BUTTONS, 
            .buttonDown      = []bool{false} ** MAX_BUTTONS, 
            .prevButtonState = []bool{false} ** MAX_BUTTONS, 
            .cursor_position = vec2(0, 0)
            .scroll_offset   = vec2(0, 0)
        }
    }

    pub fn init(self: &InputManager)  {
        self.clearKeys();
        self.clearMouseButtons();
    }

    pub fn update(self: &InputManager) -> void {
        { var i: usize = 0; while(i < MAX_KEYS) : (i += 1) {
            self.keyPressed[i] = self.keyDown[i] and !self.prevKeyState[i];
        }}
        std.mem.copy(bool, self.prevKeyState[0..], self.keyDown[0..]);

        { var i: usize = 0; while(i < MAX_BUTTONS) : (i += 1) {
            self.buttonPressed[i] = self.buttonDown[i] and !self.prevButtonState[i];
        }}
        std.mem.copy(bool, self.prevButtonState[0..], self.buttonDown[0..]);
    }
    
    pub fn clearKeys(self: &InputManager) {
        for (self.keyDown)         | *k | *k = false;
        for (self.prevKeyState)    | *k | *k = false;
        for (self.keyPressed)      | *k | *k = false;
    }

    pub fn clearMouseButtons(self: &InputManager) {
        for (self.buttonDown)      | *k | *k = false;
        for (self.prevButtonState) | *k | *k = false;
        for (self.buttonPressed)   | *k | *k = false;
    }
};