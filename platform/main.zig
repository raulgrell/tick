const c     = @import("../src/system/c.zig");
const core  = @import("../src/app/core.zig");

const game  = @import("../games/test.zig");

pub fn main() -> %void {
    var app = core.App.init();
    c.glfwSetWindowUserPointer(app.window.window, @ptrCast(&c_void, &app));

    app.onInit = game.setup;
    app.onDraw = game.draw;
    app.onUpdate = game.update;
        
    app.run();
}

