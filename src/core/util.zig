const t = @import("../index.zig");
const std = @import("std");
const ArrayList = std.ArrayList;

// creates an OutStream that writes to an ArrayList(u8).
pub const ArrayListOutStream = struct {
  array_list: *ArrayList(u8),
  stream: Stream,

  pub const Error = std.mem.Allocator.Error; // this is what ArrayList::appendSlice can throw
  pub const Stream = std.io.OutStream(Error);

  pub fn init(array_list: *ArrayList(u8)) ArrayListOutStream {
    return ArrayListOutStream {
      .array_list = array_list,
      .stream = Stream{ .writeFn = writeFn },
    };
  }

  fn writeFn(out_stream: *Stream, bytes: []const u8) !void {
    const self = @fieldParentPtr(ArrayListOutStream, "stream", out_stream);
    try self.array_list.appendSlice(bytes);
  }
};

test "ArrayListOutStream" {
  const ssaf = @import("test/util/test_allocator.zig").ssaf;
  const allocator = &ssaf.allocator;
  const mark = ssaf.get_mark();
  defer ssaf.free_to_mark(mark);

  var array_list = ArrayList(u8).init(allocator);
  defer array_list.deinit();

  var alos = ArrayListOutStream.init(&array_list);

  try alos.stream.print("This is pretty nice, no buffer limit.");

  std.debug.assert(std.mem.eql(u8, array_list.toSlice(), "This is pretty nice, no buffer limit."));
}

// Read a line from stdin
pub fn LineReader(comptime OutStreamError: type) type {
  return struct {
    // TODO - move this out... too specialized
    pub fn read_line_from_stdin(out_stream: *std.io.OutStream(OutStreamError)) !void {
      var stdin = std.io.getStdIn() catch return error.StdInUnavailable;
      var adapter = std.io.FileInStream.init(&stdin);
      return read_line_from_stream(std.io.FileInStream.Error, &adapter.stream, out_stream);
    }

    pub fn read_line_from_stream(
      comptime InStreamError: type,
      stream: *std.io.InStream(InStreamError),
      out_stream: *std.io.OutStream(OutStreamError),
    ) !void {
      var failed: ?OutStreamError = null;
      while (true) {
        const byte = stream.readByte() catch return error.EndOfFile;
        switch (byte) {
          '\r' => {
            // trash the following \n
            _ = stream.readByte() catch return error.EndOfFile;
            break;
          },
          '\n' => break,
          else => {
            // if a write fails, we will keep consuming stdin till end of line
            if (failed == null) {
              out_stream.writeByte(byte) catch |err| {
                failed = err;
              };
            }
          },
        }
      }

      if (failed) |err| {
        return err;
      }
    }
  };
}

test "LineReader: reads lines and fails upon EOF" {
  // test the `read_line_from_stream` function directly to avoid stdin

  // note that by importing these files, their tests will be run too, kind of
  // as prerequisites - nice!
  const MemoryInStream = @import("MemoryInStream.zig").MemoryInStream;

  var in_stream = MemoryInStream.init("First line\nSecond line\n\nUnterminated line");

  var out_buf: [100]u8 = undefined;
  var mos = std.io.SliceOutStream.init(out_buf[0..]);

  const line_reader = LineReader(std.io.SliceOutStream.Error);

  mos.reset();
  try line_reader.read_line_from_stream(MemoryInStream.ReadError, &in_stream.stream, &mos.stream);
  std.debug.assert(std.mem.eql(u8, mos.getWritten(), "First line"));

  mos.reset();
  try line_reader.read_line_from_stream(MemoryInStream.ReadError, &in_stream.stream, &mos.stream);
  std.debug.assert(std.mem.eql(u8, mos.getWritten(), "Second line"));

  mos.reset();
  try line_reader.read_line_from_stream(MemoryInStream.ReadError, &in_stream.stream, &mos.stream);
  std.debug.assert(std.mem.eql(u8, mos.getWritten(), ""));

  // current behaviour is to throw an error when a read fails (e.g. end of
  // file). not sure if this is ideal
  var endOfFile = false;
  mos.reset();
  line_reader.read_line_from_stream(MemoryInStream.ReadError, &in_stream.stream, &mos.stream) catch |err| switch (err) {
    error.EndOfFile => endOfFile = true,
    else => {},
  };
  std.debug.assert(endOfFile == true);
  std.debug.assert(std.mem.eql(u8, mos.getWritten(), "Unterminated line"));
}

test "LineReader: keeps consuming till EOL even if write fails" {
  const MemoryInStream = @import("MemoryInStream.zig").MemoryInStream;

  var in_stream = MemoryInStream.init("First line is pretty long\nSecond\n");

  var out_buf: [12]u8 = undefined;
  var mos = std.io.SliceOutStream.init(out_buf[0..]);

  const line_reader = LineReader(std.io.SliceOutStream.Error);

  var outOfSpace = false;
  mos.reset();
  line_reader.read_line_from_stream(MemoryInStream.ReadError, &in_stream.stream, &mos.stream) catch |err| switch (err) {
    error.OutOfSpace => outOfSpace = true,
    else => {},
  };
  std.debug.assert(outOfSpace == true);
  std.debug.assert(std.mem.eql(u8, mos.getWritten(), "First line i"));

  mos.reset();
  try line_reader.read_line_from_stream(MemoryInStream.ReadError, &in_stream.stream, &mos.stream);
  std.debug.assert(std.mem.eql(u8, mos.getWritten(), "Second"));
}

// TODO - test line ending handling, i guess
