const std = @import("std");
const allocator = std.debug.global_allocator;

const ObjectType = enum {
  Int,
  Pair
};

const Value = union(ObjectType) {
  Int: i32,
  Pair: [2]*Object
};

const Object = struct {
  value: Value,
  next: ?*Object,
  marked: bool,

  pub fn print(object: *Object) void {
    switch (object.value) {
      Value.Int => std.debug.warn("{}", object.value),
      Value.Pair => {
        std.debug.warn("(");
        print(object.value.Pair[0]);
        std.debug.warn(", ");
        print(object.value.Pair[1]);
        std.debug.warn(")");
      }
    }
  }
};

const STACK_MAX: usize = 255;

const VM = struct {
  allocator: *std.mem.Allocator,
  stack: std.ArrayList(*Object),
  first_object: ?*Object,
  num_objects: usize,
  max_objects: usize,

  pub fn create(_allocator: *std.mem.Allocator) VM {
    return VM {
      .allocator = _allocator,
      .stack = std.ArrayList(*Object).init(_allocator),
      .first_object = null,
      .num_objects = 0,
      .max_objects = 8,
    };
  }

  pub fn collect(self: *VM) void {
    const num_objects = self.num_objects;
    for (self.stack.toSliceConst()) |obj| mark(obj);
    self.sweep();
    self.max_objects = self.num_objects * 2;
    std.debug.warn("\nCollected {} objects, {} remaining.\n", num_objects - self.num_objects, self.num_objects);
  }

  pub fn destroy(self: *VM) void {
    self.stack.deinit();
    self.collect();
  }

  pub fn pushInt(self: *VM, int_value: i32) !void {
    var object = try new(self, Value { .Int = int_value });
    try push(self, object);
  }

  pub fn pushPair(self: *VM) !*Object {
    const a = self.pop();
    const b = self.pop();
    const object = try new(self, Value { .Pair = []*Object {a, b} });
    try push(self, object);
    return object;
  }

  fn push(self: *VM, value: *Object) !void {
      try self.stack.append(value);
  }

  fn pop(self: *VM) *Object {
    std.debug.assert(self.stack.len != 0);
    return self.stack.pop();
  }

  fn new(self: *VM, value: Value) !*Object {
    if (self.num_objects == self.max_objects) self.collect();

    var object = try self.allocator.create(Object{
      .value = value,
      .next = self.first_object,
      .marked = false
    });

    self.num_objects += 1;

    return object;
  }

  fn mark(object: *Object) void {
    if (object.marked) return;
    object.marked = true;
  
    if (ObjectType(object.value) == ObjectType.Pair) {
      mark(object.value.Pair[0]);
      mark(object.value.Pair[1]);
    }
  }

  fn sweep(self: *VM) void {
    var object = &self.first_object;
    while (object.*) |obj| {
      if (!obj.marked) {
        object.* = obj.next;
        self.allocator.destroy(obj);
        self.num_objects -= 1;
      } else {
        obj.marked = false;
        object = &obj.next;
      }
    }
  }
};

test "Objects on stack are preserved" {
  var vm = VM.create(allocator);
  defer vm.destroy();
  try vm.pushInt(1);
  try vm.pushInt(2);
  vm.collect();
  std.debug.assert(vm.num_objects == 2);
}

test "Reach nested objects" {
  var vm = VM.create(allocator);
  defer vm.destroy();
  try vm.pushInt(1);
  try vm.pushInt(2);
  _ = try vm.pushPair();
  try vm.pushInt(3);
  try vm.pushInt(4);
  _ = try vm.pushPair();
  _ = try vm.pushPair();
  vm.collect();
  std.debug.assert(vm.num_objects == 7);
}

test "Unreached objects are collected." {
  var vm = VM.create(allocator);
  defer vm.destroy();
  try vm.pushInt(1);
  try vm.pushInt(2);
  _ = vm.pop();
  _ = vm.pop();
  vm.collect();
  std.debug.assert(vm.num_objects == 0);
}

test "Handle cycles" {
  var vm = VM.create(allocator);
  defer vm.destroy();
  try vm.pushInt(1);
  try vm.pushInt(2);
  var a = try vm.pushPair();
  try vm.pushInt(3);
  try vm.pushInt(4);
  var b = try vm.pushPair();
  // Set up a cycle, and also make 2 and 4 unreachable and collectible.
  a.value.Pair[0] = b;
  b.value.Pair[1] = a;
  vm.collect();
  std.debug.assert(vm.num_objects == 4);
}

test "Performance Test" {
  var vm = VM.create(allocator);
  defer vm.destroy();
  var i = i32(0);
  while (i < 1000) : (i += 1) {
    var j = i32(0);
    while (j < 20) : (j += 1) {
      try vm.pushInt(i);
    }
    var k = i32(0);
    while (k < 20) : (k += 1) {
      _ = vm.pop();
    }
  }
}