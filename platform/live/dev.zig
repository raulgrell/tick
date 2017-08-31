pub const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("unistd.h");
    @cInclude("sys/types.h");
    @cInclude("sys/stat.h");
    @cInclude("dlfcn.h");
});

const panic = @import("std").debug.panic;
const io = @import("std").io;

const Game = struct {
    handle: ?&c_void,
    id: c.ino_t,
    api: ?&API,
    state: ?&State,
};

pub const State = struct {
    a: usize
};

pub const API = struct {
    init:     fn() -> &State,
    update:   fn(state: &State) -> %void,
    draw:     fn(state: &State) -> void,
    reload:   fn(state: &State) -> void,
    unload:   fn(state: &State) -> void,
    finalize: fn(state: &State) -> void,
};

extern const GAME: API;

fn load(path: &const u8, game: &Game) {
    var attr: c.struct_stat = undefined;
    
    // Return if file not found
    if (c.stat(path, &attr) != 0) return;

    // Return if file unchanged
    if (game.id == attr.st_ino) return;

    %%io.stdout.printf("Loading...\n");

    // Unload current
    if (game.handle) | handle | {
        var state = game.state ?? panic("load: No State");
        if (game.api) | api | api.unload(state);
        _ = c.dlclose(handle);
    }

    // Load New
    var game_handle: ?&c_void = c.dlopen(path, c.RTLD_NOW);
    if (game_handle) | handle | {
        // Set ID
        game.handle = handle;
        game.id = attr.st_ino;
        
        // Get functions
        var game_api = @ptrCast(?&API, c.dlsym(handle, c"GAME"));
        if ( game_api ) | api | {
            game.api = api;
            const game_state = game.state ?? api.init();
            game.state = game_state;
            api.reload(game_state);
        } else {
            _ = c.dlclose(handle);
            game.handle = null;
            game.id = 0;
        }
    } else {
        game.handle = null;
        game.id = 0;
    }
}

fn unload(game: &Game) {
    if (game.handle) | handle | {
        %%io.stdout.printf("Unloading...\n");        
        const api = game.api ?? panic("unload: No API");
        const state = game.state ?? panic("unload: No State");
        api.finalize(state);
        game.state = null;
        _ = c.dlclose(handle);
        game.handle = null;
        game.id = 0;
    }
}

pub fn main() -> %void {
    var game = Game {
        .handle = null,
        .id = 0,
        .api = null,
        .state = null
    };

    while (true) {
        load(c"./game", &game);
        if (game.handle) | handle | {
            const api = game.api ?? panic("loop: No API");
            const state = game.state ?? panic("loop: No state");
            api.update(state) %% break;
            api.draw(state);
        }
        _ = c.sleep(1); // in unistd
    }
    unload(&game);
}

