const Builder = @import("std").build.Builder;

pub fn build(b: &Builder) {
    // Get options
    const mode = b.standardReleaseOptions();

    // Statically linked
    var exe = b.addExecutable("run", "platform/run.zig");
    exe.setBuildMode(mode);
    
    exe.linkSystemLibrary("c");
    exe.linkSystemLibrary("m");
    exe.linkSystemLibrary("z");
    exe.linkSystemLibrary("dl");
    exe.linkSystemLibrary("glfw");
    exe.linkSystemLibrary("epoxy");
    exe.linkSystemLibrary("png");
    exe.linkSystemLibrary("soundio");
    b.installArtifact(exe);
    
    // Dynamically linked, hot reloading
    var dev = b.addExecutable("dev", "platform/dev.zig");
    dev.setBuildMode(mode);
    
    dev.linkSystemLibrary("c");
    dev.linkSystemLibrary("m");
    dev.linkSystemLibrary("z");
    dev.linkSystemLibrary("dl");
    dev.linkSystemLibrary("glfw");
    dev.linkSystemLibrary("epoxy");
    dev.linkSystemLibrary("png");
    dev.linkSystemLibrary("soundio");
    b.installArtifact(dev);

    const version = b.version(0, 0, 1);

    var lib = b.addSharedLibrary("game", "games/live.zig", version);

    // Default
    b.default_step.dependOn(&exe.step);
    b.default_step.dependOn(&dev.step);
    b.default_step.dependOn(&lib.step);

    // Commands
    const run_exe = b.addCommand(".", b.env_map, exe.getOutputPath(), [][]const u8{});
    run_exe.step.dependOn(&exe.step);

    const run_dev = b.addCommand(".", b.env_map, dev.getOutputPath(), [][]const u8{});
    run_dev.step.dependOn(&dev.step);
    run_dev.step.dependOn(&lib.step);
    
    // Steps
    const play = b.step("play", "Play the game");
    play.dependOn(&run_exe.step);
    
    const live = b.step("live", "Run live development environment");
    live.dependOn(&run_dev.step);

    const update = b.step("update", "Update game library");
    update.dependOn(&lib.step);    
}