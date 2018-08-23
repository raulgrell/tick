const std = @import("std");
const allocator = std.heap.c_allocator;

const VM = @import("./vm.zig").VM;
const REPL = @import("./repl.zig").REPL;

const example_file = @embedFile("../example/script.zag") ++ []u8 {0};

const builtin_str = []const []const u8 { "pass", };
const builtin_fn = []const fn(args: []const []const u8) i32 { pass };

pub fn pass(args: []const []const u8) i32 {
    return 0;
}

pub fn main() error!void {
    var args_it = std.os.args();
    var args_list = std.ArrayList([]const u8).init(allocator);
    defer args_list.deinit();

    while (args_it.next(allocator)) | arg | {
        try args_list.append(try unwrapArg(arg));
    }

    var vm = VM.create();
    defer vm.destroy();

    std.debug.warn("{}\n", example_file);

    try vm.interpret(example_file);
    
    // switch(args_list.len) {
    //     1 => try runRepl(&vm),
    //     2 => try runFile(&vm, args_list.at(1)),
    //     else => showUsage()
    // }
}

fn runRepl(vm: *VM) !void {
    var repl = try REPL.create(builtin_str[0..], builtin_fn[0..]);
    defer repl.destroy();

    try repl.loop("| ", VM.interpret);
}

fn runFile(vm: *VM, path: []const u8) !void {
  const source = readFile(path);
  const result = interpret(source);
}

fn readFile(path: []const u8) void {
    var file = os.File.openRead(allocator, path) catch |err| {
        std.debug.warn("Unable to open file: {}\n", @errorName(err));
        return err;
    };
    defer file.close();
}

fn unwrapArg(arg: error![]u8) ![]u8 {
    return arg catch |err| {
        std.debug.warn("Unable to parse command line: {}\n", err);
        return err;
    };
}

fn showUsage() void {
    std.debug.warn("Usage: lang [path]\n");
}

