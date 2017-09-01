const c     = @import("../src/system/c.zig");
const core  = @import("../src/app/core.zig");

const game  = @import("../games/test.zig");

pub fn main() -> %void {
    var app = core.App.init();
    app.run(core.API {
        .init = game.init,
        .update = game.update,
        .draw = game.draw,
        .deinit = game.deinit
    });
}