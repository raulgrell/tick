use @import("../src/system/index.zig");
const dev = @import("../src/core/dev.zig");

pub fn main() !void {
    var app = dev.App.init();
    app.run();
}