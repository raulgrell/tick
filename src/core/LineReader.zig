const std = @import("std");

//
// Read a line from stdin
//

pub fn LineReader(comptime OutStreamError: type) type {
  return struct {
    // TODO - move this out... too specialized
    pub fn read_line_from_stdin(out_stream: *std.io.OutStream(OutStreamError)) !void {
      var stdin = std.io.getStdIn() catch return error.StdInUnavailable;
      var adapter = std.io.FileInStream.init(&stdin);
      return read_line_from_stream(std.io.FileInStream.Error, &adapter.stream, out_stream);
    }

    // this function is split off so it can be tested
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
