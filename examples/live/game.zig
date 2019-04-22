const API = @import("dev.zig").API;
const State = @import("dev.zig").State;
const c = @import("dev.zig").c;

fn init()&State {
    std.debug.warn("init\n");    
    return &state_instance;
}

fn reload(state: &State) void {
    std.debug.warn("reload\n");    
    state.a = 0;
}

fn unload(state: &State) void {
    std.debug.warn("unload\n");    
    state.a = 0;
}

fn finalize(state: &State) void {
    std.debug.warn("finalize\n");        
    state.a = @maxValue(usize);
}

fn update(state: &State) %void {+
    state.a += 5;
}

fn draw(state: &State) void {
    std.debug.warn("draw: %d\n", state.a);
}

var state_instance = State {
    .a = 0
};

export var GAME = API {
    .init = init,
    .update = update,
    .draw = draw,
    .reload = reload,
    .unload = unload,
    .finalize = finalize
};
