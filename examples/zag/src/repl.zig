const std = @import("std");

const FileInStream = std.io.FileInStream;
const FileOutStream = std.io.FileOutStream;

const Term = std.os.ChildProcess.Term;

const builtin_str = []const []const u8 {
    "quit",
};

const builtin_fn = []fn(args: []const []const u8) i32 {
    quit
};

fn quit(args: []const []const u8) i32 {
    return -1;
}

pub const REPL = struct {
    stdin: FileInStream,
    stdout: FileOutStream,
    arg_list: std.ArrayList([]const u8),
    builtin_names: []const []const u8,
    builtin_funcs: []const fn(args: []const []const u8) i32,
    status: i32,

    pub fn create(names: []const []const u8, funcs: []const fn(args: []const []const u8) i32) !REPL {
        var stdin_file = try std.io.getStdIn();
        var stdout_file = try std.io.getStdOut();

        return REPL {
            .stdin = FileInStream.init(&stdin_file),
            .stdout = FileOutStream.init(&stdout_file),
            .arg_list = std.ArrayList([]const u8).init(std.debug.global_allocator),
            .builtin_names = names,
            .builtin_funcs = funcs,
            .status = 1
        };
    }

    pub fn destroy(self: *REPL) void {
        self.arg_list.deinit();
    }

    pub fn parse(args: []const []const u8) ExecuteFlag {
        if (args.len == 0) return ExecuteFlag.Empty;
        if (args[0][0] == '.') {
            for (builtin_str[0..]) | str, i | {
                if (std.mem.eql(u8, str, args[0])) {
                    return ExecuteFlag { .Builtin = i };
                }
            }
        }
        return ExecuteFlag.Invalid;
    }

    pub fn builtin(index: usize, args: []const []const u8) i32 {
        return builtin_fn[index](args);
    }

    fn printArgs(args: []const []const u8) void {
        for (args) |arg| std.debug.warn("{} ", arg);
        std.debug.warn("\n");
    }

    pub fn pass(args: []const []const u8) i32 {
        return 1;
    }

    pub fn quit(args: []const []const u8) i32 {
        return 0;
    }

    pub fn loop(self: *REPL, prefix: []const u8, parse_fn: fn([]const u8) void) !void {
        while (self.status > 0) {
            try self.stdout.stream.write(prefix);
            
            var line = try self.stdin.stream.readUntilDelimiterAlloc(std.debug.global_allocator, '\n', 256);
            var args_iterator = std.mem.split(line, " ");
            while (args_iterator.next()) | arg | {
                try self.arg_list.append(arg);
            }

            const args = self.arg_list.toSliceConst();
            const flag = parse(args);

            self.status = switch(flag) {
                ExecuteFlag.Empty => pass(args),
                ExecuteFlag.Builtin => |i| builtin(i, args),
                ExecuteFlag.Invalid => s: {
                    std.debug.warn("Invalid query: ");
                    printArgs(args);
                    break :s 1;
                },
            };

            std.debug.global_allocator.free(line);
            self.arg_list.len = 0;
        }
    }
};

const ExecuteFlag = union(enum) {
    Builtin: usize,
    Invalid,
    Empty
};

const ExecuteResult = enum {
    Ok,
    Exit,
    Error
};
