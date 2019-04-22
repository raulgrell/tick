const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    // Get options
    const mode = b.standardReleaseOptions();
    const windows = b.option(bool, "windows", "create windows build") orelse false;

    // Environment
    b.addCIncludePath("include");

    // Game lib
    const version = b.version(0, 0, 1);
    var game_lib = b.addSharedLibrary("game", "games/live.zig", version);
    if (windows) game_lib.setTarget(builtin.Arch.x86_64, builtin.Os.windows, builtin.Environ.gnu);

    // Dynamically Linked, Hot Reloading
    var dev_exe = b.addExecutable("dev", "platform/dev.zig");
    dev_exe.addObject(glad);
    dev_exe.setBuildMode(mode);
    if (windows) dev_exe.setTarget(builtin.Arch.x86_64, builtin.Os.windows, builtin.Environ.gnu);

    dev_exe.linkSystemLibrary("c");
    dev_exe.linkSystemLibrary("m");
    dev_exe.linkSystemLibrary("z");
    dev_exe.linkSystemLibrary("dl");
    dev_exe.linkSystemLibrary("glfw");
    dev_exe.linkSystemLibrary("png");
    dev_exe.linkSystemLibrary("soundio");
    b.installArtifact(dev_exe);

    const dev_command = b.addCommand(".", b.env_map, [][]const u8{dev_exe.getOutputPath()});
    dev_command.step.dependOn(&dev_exe.step);
    dev_command.step.dependOn(&game_lib.step);

    // Commands
    b.default_step.dependOn(&glad.step);
    b.default_step.dependOn(&game_lib.step);
    b.default_step.dependOn(&dev_exe.step);
 
    const dev = b.step("dev", "Run live development environment");
    dev.dependOn(&dev_command.step);

    const update = b.step("update", "Update game library");
    update.dependOn(&game_lib.step);    
}
