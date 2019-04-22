const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
  const mode = b.standardReleaseOptions();
  const version = b.version(0, 0, 1);

  var t = b.addTest("main.zig");
  const test_step = b.step("test", "Run all tests");
  test_step.dependOn(&t.step);

  var exe = b.addExecutable("main", "main.zig");
  exe.linkSystemLibrary("c");
  exe.setBuildMode(mode);

  b.installArtifact(exe);
  b.default_step.dependOn(&exe.step);

  const play = b.step("play", "Play the game");
  const run = b.addCommand(".", b.env_map, [][]const u8{exe.getOutputPath()});
  play.dependOn(&run.step);
  run.step.dependOn(&exe.step);
}
