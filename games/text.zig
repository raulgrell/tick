const std = @import("std");

const FileInStream = std.io.FileInStream;
const FileOutStream = std.io.FileOutStream;

pub fn main() !void {

}

pub fn getIo() {
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

        std.debug.global_allocator.free(line);
        arg_list.len = 0;
    }
}