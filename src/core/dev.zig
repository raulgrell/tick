use @import("../math/index.zig");
use @import("../system/index.zig");

// use @import("audio.zig");
use @import("window.zig");

const InputManager = @import("index.zig").InputManager;
const State = @import("../../games/live.zig").State;

const TARGET_FPS       = 60.0;
const TARGET_FRAMETIME = 1.0 / TARGET_FPS;
const MAX_DELTA_TIME   = 1.0;
const MAX_FRAME_STEPS  = 6;

const WINDOW_WIDTH  = 640;
const WINDOW_HEIGHT = 360;

pub const API = struct {
    init:     fn(app: *App)&State,
    update:   fn(app: *App, state: *State, delta_time: f32) !void,
    draw:     fn(app: *App, state: *State) void,
    reload:   fn(state: *State) void,
    unload:   fn(state: *State) void,
    deinit:   fn(state: *State) void,
};

const Game = struct {
    handle: ?*c_void,
    id: c.ino_t,
    api: ?*API,
    state: ?*State,

    pub fn load(path: *const u8, name: *const u8, game: *Game, app: *App) void {
        var attr: c.struct_stat = undefined;
        if (c.stat(path, &attr) != 0) return;
        if (game.id == attr.st_ino) return;
        if (game.handle) | handle | {
            var state = game.state orelse panic("load: No State");
            if (game.api) | api | api.unload(state);
            _ = c.dlclose(handle);
        }
        var game_handle: ?*c_void = c.dlopen(path, c.RTLD_NOW);
        if (game_handle) | handle | {
            game.handle = handle;
            game.id = attr.st_ino;
            var game_api = @ptrCast(?*API, @alignCast(@alignOf(API), c.dlsym(handle, name)));
            if ( game_api ) | api | {
                const game_state = game.state orelse api.init(app);
                game.api = api;
                game.state = game_state;
                api.reload(game_state);
            } else {
                warn("Could not load API");
                _ = c.dlclose(handle);
                game.handle = null;
                game.id = 0;
            }
        } else {
            warn("Could not load Lib");
            game.handle = null;
            game.id = 0;
        }
    }
    
    pub fn unload(game: *Game) void {
        if (game.handle) | handle | {
            const api = game.api orelse panic("unload: No API");
            const state = game.state orelse panic("unload: No State");
            api.deinit(state);
            game.state = null;
            _ = c.dlclose(handle);
            game.handle = null;
            game.id = 0;
        }
    }

};

extern const GAME: API;

pub const App = struct {
    window: Window,
    input:  InputManager,
    // audio:  AudioEngine,

    pub fn init() &App {
        var app = c.mem.create(App) catch unreachable;

        // Window
        app.window.init(WINDOW_WIDTH, WINDOW_HEIGHT);
        app.window.setWindowPointer(@ptrCast(*const u8, app));

        app.window.setCustomCursor();
        app.window.setCursorMode(CursorMode.Window);

        Window.setClearColor(0, 0, 0, 1);
        Window.enableBlending();

        debug.assertNoErrorGL();

        // Input Manager
        app.input.init();

        // Audio
        // app.audio.init() catch unreachable;
        // app.audio.open() catch unreachable;
        // app.audio.start() catch unreachable;

        return app;
    }

    pub fn run (app: *App) void {
        var game_lib = Game {
            .handle = null,
            .id = 0,
            .api = null,
            .state = null
        };
        
        var current_ticks: f32 = 0.0;
        var previous_ticks: f32 = 0.0;
        var delta_time: f32 = 0.0;

        while (app.window.running()) {
            Game.load(c"./zig-cache/libgame.so", c"GAME", &game_lib, app);

            if (game_lib.handle) | handle | {
                const api = game_lib.api orelse panic("loop: No API");
                const state = game_lib.state orelse panic("loop: No state");

                // Tick
                const new_ticks: f32 = (f32)(c.glfwGetTime());
                current_ticks = new_ticks - previous_ticks;
                previous_ticks = new_ticks;
                
                // Update
                var frameSteps: u8 = 0;
                var total_delta_time = current_ticks / TARGET_FRAMETIME;
                while (total_delta_time > 0.0 and frameSteps < MAX_FRAME_STEPS) {
                    delta_time = if (total_delta_time < MAX_DELTA_TIME) total_delta_time else MAX_DELTA_TIME;
                    api.update(app, state, delta_time) catch break;
                    total_delta_time -= delta_time;
                    frameSteps += 1;
                }

                // Input
                app.input.update();

                // Draw
                app.window.clear();
                api.draw(app, state);
                app.window.update();
            }
        }

        Game.unload(&game_lib);
        debug.assertNoErrorGL();
    }
};