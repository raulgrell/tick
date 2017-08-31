const stdmem = @import("std").mem;

// Math
use @import("window.zig");
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

pub const InputManager = struct {
    // Keyboard
    keyPressed: [MAX_KEYS]bool,
    keyDown: [MAX_KEYS]bool,
    prevKeyState: [MAX_KEYS]bool,
    // Mouse
    buttonClicked: [MAX_BUTTONS]bool,
    buttonDown: [MAX_BUTTONS]bool,
    prevButtonState: [MAX_BUTTONS]bool,
    cursor_position: Vec2,

    pub fn create() -> InputManager {
        InputManager {
            .keyPressed = []bool{false} ** MAX_KEYS,
            .keyDown = []bool{false} ** MAX_KEYS,
            .prevKeyState = []bool{false} ** MAX_KEYS ,
            .buttonClicked = []bool{false} ** MAX_BUTTONS,
            .buttonDown = []bool{false} ** MAX_BUTTONS,
            .prevButtonState = []bool{false} ** MAX_BUTTONS,
            .cursor_position = vec2(0, 0)
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
            im.buttonClicked[i] = im.buttonDown[i] and !im.prevButtonState[i];
        }}

        mem.copy(bool, im.prevKeyState[0..], im.keyDown[0..]);
        mem.copy(bool, im.prevButtonState[0..], im.buttonDown[0..]);
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
            im.buttonDown[i] = false;
            im.prevButtonState[i] = false;
            im.buttonClicked[i] = false;
        }}
    }
};