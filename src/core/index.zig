const t = @import("../index.zig");

const State = {
    persistent: [*]u8;
    transient: [*]u8;
}

pub const API = struct {
    init:     fn(app: *App) *State,
    update:   fn(app: *App, state: *State) !void,
    draw:     fn(app: *App, state: *State) void,
    reload:   fn(app: *App, state: *State) void,
    unload:   fn(app: *App, state: *State) void,
    deinit:   fn(app: *App, state: *State) void,
};

pub const App = struct {
    window: Window,
    input:  InputManager,
    audio:  AudioEngine,
    timing: Timing,

    pub fn init(window_width: u32, window_height: u32) !*App {
        var app = try c.mem.create(App);

        app.window.init(window_width, window_height);
        app.window.setWindowPointer(app);
        app.window.setCustomCursor();
        app.window.setCursorMode(CursorMode.Window);

        Window.setClearColor(0, 0, 0, 1);
        Window.enableBlending();

        debug.assertNoErrorGL();

        app.input.init();

        try app.audio.init();
        try app.audio.open();
        try app.audio.start();

        return app;
    }

    pub fn run (app: *App, api: *const API) void {
        const state = api.init(app);
        var timing = Timing.create();

        while (app.window.running()) {
            timing.update(api.update, app, state, delta_time);
            app.input.update();
            app.window.clear();
            api.draw(app);
            app.window.update();
        }

        debug.assertNoErrorGL();
    }

    pub fn runHot(app: *App, path: []const u8, name: []const u8) void {
        var game_lib = Game {
            .handle = null,
            .id = 0,
            .api = null,
            .state = null
        };
        
        var timing = Timing.create();

        while (app.window.running()) {
            game_lib.load(path, name, app);
            if (game_lib.handle) | handle | {
                const api = game_lib.api orelse panic("loop: No API");
                const state = game_lib.state orelse panic("loop: No state");
                timing.update(api.update, app, state, delta_time);
                app.input.update();
                app.window.clear();
                api.draw(app, state);
                app.window.update();
            }
        }

        Game.unload(&game_lib);
        debug.assertNoErrorGL();
    }
};

const UpdateFn = fn(a: *App, s: *State, dt: f32) !void;

const Timing = struct {
    current_ticks: f64,
    previous_ticks: f64,
    delta_time: f64,

    const TARGET_FPS       = 60.0;
    const TARGET_FRAMETIME = 1.0 / TARGET_FPS;
    const MAX_DELTA_TIME   = 1.0;
    const MAX_FRAME_STEPS  = 6;

    fn create() Timing {
        return Timing {
            .current_ticks = 0.0,
            .previous_ticks = 0.0,
            .delta_time = 0.0,
        };
    }

    fn update(self: *Timing, api_fn: UpdateFn, state: *State ) void {
        // Tick
        const newTicks: f32 = c.glfwGetTime();
        self.current_ticks = newTicks - self.previous_ticks;
        selg.previous_ticks = newTicks;
        
        // Update
        var frameSteps: u8 = 0;
        var total_dt = current_ticks / TARGET_FRAMETIME;
        while (total_dt > 0.0 and frameSteps < MAX_FRAME_STEPS) {
            self.delta_time = if (total_dt < MAX_DELTA_TIME) total_dt else MAX_DELTA_TIME;
            api_fn(app, state, self.delta_time) catch break;
            total_dt -= self.delta_time;
            frameSteps += 1;
        }
    }
}

const Game = struct {
    handle: ?*c_void,
    id: c.ino_t,
    api: ?*API,
    state: ?*State,

    pub fn create() {
        return Game { .handle = null, .id = 0, .api = null, .state = null };
    }

    pub fn load(game: *Game, path: []const u8, name: []const u8, app: *App) void {
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
