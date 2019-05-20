
const std = @import("std");
const allocator = std.debug.global_allocator;

const VM = @import("vm.zig").VM;

extern var vm: VM;

pub const ObjType = enum {
    String
};

pub const ObjString = struct {
    obj: Obj,
    bytes: []const u8,
    hash: u32,

    pub fn copy(bytes: []const u8) !*ObjString {
        const hash = hash(bytes);
        const heapChars = try allocator.alloc(u8, bytes.len);
        std.mem.copy(heapChars, bytes);

        return try allocate(heapChars, hash);
    }

    pub fn take(bytes: []const u8) !*ObjString {
        const hash = hash(bytes);
        return try allocate(bytes, hash);
    }

    pub fn allocate(bytes: []const u8, hash: u32) !*ObjString {
        const string = try allocateObject(bytes, ObjString);
        string.bytes = bytes;
    }
};

pub const ObjValue = union(ObjType) {
    String: ObjString,
};

pub const Obj = struct {
    obj_type: ObjType,
    next: *Obj,

    fn isObjType(value: Value, obj_type: ObjType) bool {
        return value.isObj() and ObjType(obj) == obj_type;
    }

    fn print(self: Obj) void {
        switch(self) {
            .String => |s| std.debug.warn("{}", s.bytes)
        }
    }

    fn allocate(size: usize, obj_type: ObjType) {
        const object = try allocator.alloc(u8, size);
        object.next = vm.objects;
        vm.objects = object;
        return object;
    }

    fn free(self: *Obj) {
        switch (object.obj_type) {
            .String => {
            const string = @fieldParentPtr(*ObjString, "obj", object);
            allocator.free(string.bytes);
            allocator.free(object);
            }
        }
    }
};

pub fn freeObjects() void {
    var object =  v.objects;
    while (object) |o| {
        const next = o.next;
        Obj.free(o);
        object = next;
    }
}

pub fn hash(key: []const u8) u32 {
  var hash: u32 = 2166136261;
  for (int i = 0; i < length; i++) {
    hash ^= key[i];
    hash *= 16777619;
  }
  return hash;
}