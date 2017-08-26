const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("unistd.h");
    @cInclude("sys/types.h");
    @cInclude("sys/stat.h");
    @cInclude("dlfcn.h");
});

extern const GAME: API;

const State = struct {};

const API = struct {
    init: fn() -> State,
    finalize: fn(struct game_state *state)-> void;
    reload: fn(struct game_state *state)-> void;
    unload: fn(struct game_state *state)-> void;
    step: fn(struct game_state *state)-> bool;
};

const GAME_LIBRARY = "./libgame.so";

const Game = struct {
    handle: &u8,
    id: ino_t,
    api: game_api,
    state: &game_state,
};

fn game_load(game: &Game) {
    var attr: c.struct_stat = undefined;
    if ((c.stat(GAME_LIBRARY, &attr) == 0) && (game.id != attr.st_ino)) {
        if (game.handle) {
            game.api.unload(game.state);
            c.dlclose(game.handle);
        }
        var game_handle: &u8 = c.dlopen(GAME_LIBRARY, RTLD_NOW);
        if (game_handle) | handle | {
            game.handle = handle;
            game.id = attr.st_ino;
            const game_api: &API = dlsym(game.handle, "GAME");
            if ( game_api ) | api | {
                game.api = *api;
                if (game.state == null)
                    game.state = game.api.init();
                game.api.reload(game.state);
            } else {
                c.dlclose(game.handle);
                game.handle = null;
                game.id = 0;
            }
        } else {
            game.handle = null;
            game.id = 0;
        }
    }
}

fn game_unload(struct game *game) {
    if (game.handle) {
        game.api.finalize(game.state);
        game.state = null;
        c.dlclose(game.handle);
        game.handle = null;
        game.id = 0;
    }
}

pub fn main {
    struct game game = {0};
    while (true) {
        game_load(&game);
        if (game.handle)
            if (!game.api.step(game.state))
                break;
        c.usleep(100000);
    }
    game_unload(&game);
    return 0;
}
