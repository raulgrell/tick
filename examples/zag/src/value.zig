const std = @import("std");
const allocator = std.debug.global_allocator;

const Obj = @import("object.zig").Obj;

pub const ValueType = enum {
  Bool,
  Number,
  Obj,
  Nil,
};

var toString_buffer = []u8 {0} ** 1024;

pub const Value = union(ValueType) {
    Bool: bool,
    Number: f64,
    Obj: *Obj,
    Nil,

    fn toString(value: Value) []const u8 {
      switch (value) {
        .Bool => |b| return std.fmt.bufPrint(&toString_buffer, "{}", b) catch unreachable,
        .Number => |n|  return std.fmt.bufPrint(&toString_buffer, "{}", n) catch unreachable,
        .Obj => |o| return o.toString(),
        .Nil => return "nil",
      }
    }

    fn print(value: Value) void {
      switch (value) {
        .Bool => |b| std.debug.warn("{}", b),
        .Number => |d| std.debug.warn("{}", d),
        .Obj => |o| o.print(),
        .Nil => std.debug.warn("nil")
      }
    }

    fn printLine(value: Value) void {
      print(value);
      std.debug.warn("\n");
    }

    fn equals(a: Value, b: Value) bool {
      if (ValueType(a) != ValueType(b)) return false;
      switch (a) {
        .Bool => return a.Bool == b.Bool,
        .Number => return a.Number == b.Number,
        .Nil => return true,
        .Obj => |o| return o.equal(b.Obj),
      }
    }

    fn isTruthy(value: Value) bool {
      switch (value) {
        .Nil => return false,
        .Bool => |b| return b,
        .Number => |n| return true,
        .Obj => |o| return true, 
      }
    }
};