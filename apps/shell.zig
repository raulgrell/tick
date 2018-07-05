const std = @import("std");

const FileInStream = std.io.FileInStream;
const FileOutStream = std.io.FileOutStream;

const Term = std.os.ChildProcess.Term;

const builtin_str = []const []const u8 {
    "exit",
};

const builtin_fn = []fn(args: []const []const u8) i32 {
    shell_exit
};

pub fn main() !void {
    var stdin_file = try std.io.getStdIn();
    var stdin = FileInStream.init(&stdin_file);

    var stdout_file = try std.io.getStdOut();
    var stdout = FileOutStream.init(&stdout_file);

    var arg_list = std.ArrayList([]const u8).init(std.debug.global_allocator);
    defer arg_list.deinit();

    var status: i32 = 1;
    
    while (status > 0) {
        try stdout_file.write("> ");
        
        var line = try stdin.stream.readUntilDelimiterAlloc(std.debug.global_allocator, '\n', 256);

        var args_iterator = std.mem.split(line, " \t\r\n");
        while (args_iterator.next()) | arg | {
            try arg_list.append(arg);
        }

        const args = arg_list.toSliceConst();
        const flag = shell_parse(args);

        status = switch(flag) {
            ExecuteFlag.Empty => shell_pass(args),
            ExecuteFlag.Cmd => shell_execute(args),
            ExecuteFlag.Builtin => |i| shell_builtin(i, args),
            ExecuteFlag.Invalid => s: {
                std.debug.warn("Invalid query: ");
                shell_print_args(args);
                break :s 1;
            },
        };

        std.debug.global_allocator.free(line);
        arg_list.len = 0;
    }
}

const ExecuteFlag = union(enum) {
    Builtin: usize,
    Cmd,
    Invalid,
    Empty
};

pub fn shell_parse(args: []const []const u8) ExecuteFlag {
    if (args.len == 0) return ExecuteFlag.Empty;
    if (std.mem.eql(u8, args[0], ".")) return ExecuteFlag.Cmd;
    for (builtin_str[0..]) | str, i | {
        if (std.mem.eql(u8, str, args[0])) return ExecuteFlag { .Builtin = i };
    }
    return ExecuteFlag.Invalid;
}

pub fn shell_builtin(index: usize, args: []const []const u8) i32 {
    return builtin_fn[index](args);
}

pub fn shell_execute(args: []const []const u8) i32 {
    std.debug.assert(args.len > 0);
    
    const child = std.os.ChildProcess.init(args[1..], std.debug.global_allocator) catch {
        std.debug.panic("Unable to init child process");    
    };
    defer child.deinit();

    const term = child.spawnAndWait() catch |err| {
        std.debug.warn("Unable to spawn {}: {}\n", args[1], @errorName(err));
        return -1;
    };

    switch (term) {
        Term.Exited => |code| {
            if (code != 0) {
                std.debug.warn("The following command exited with error code {}:\n", code);
                shell_print_args(args);
                return -1;
            }
        },
        else => {
            std.debug.warn("The following command terminated unexpectedly:\n");
            shell_print_args(args);
            return -1;
        },
    }

    return 1;
}

fn shell_print_args(args: []const []const u8) void {
    for (args) |arg| std.debug.warn("{} ", arg);
    std.debug.warn("\n");
}

pub fn shell_pass(args: []const []const u8) i32 {
    return 1;
}

pub fn shell_exit(args: []const []const u8) i32 {
    return 0;
}
