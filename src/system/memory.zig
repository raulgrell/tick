
const std = @import("std");
const math = @import("std").math;
const lib  = @import("../tick.zig").lib;
const c = @import("c.zig");

pub const copy = std.mem.copy;

error NoMem;

pub fn alloc(comptime T: type, n: usize) -> %[]T {
    return @ptrCast(&T, c.malloc(c.size_t(n * @sizeOf(T))) ?? return error.NoMem)[0..n];
}

pub fn free(comptime T: type, old_mem: []T) {
    c.free(@ptrCast(&c_void, old_mem.ptr));
}

pub var mem = lib.Allocator {
    .allocFn = libcAlloc,
    .reallocFn = libcRealloc,
    .freeFn = libcFree,
};

fn libcAlloc(self: &lib.Allocator, size: usize, alignment: u8) -> %[]u8 {
    return @ptrCast(&u8, c.malloc(c.size_t(size)) ?? return error.NoMem)[0..size];
}

fn libcRealloc(self: &lib.Allocator, old_mem: []u8, new_size: usize, alignment: u8) -> %[]u8 {
    return @ptrCast(&u8, c.realloc(@ptrCast(&c_void, old_mem.ptr), c.size_t(new_size)) ?? return error.NoMem)[0..new_size];
}

fn libcFree(self: &lib.Allocator, old_mem: []u8) -> void {
    c.free(@ptrCast(&c_void, &old_mem[0]));
}

const SystemMemoryInfo = struct {
    availablePhysicalMemory: usize,
    totalPhysicalMemory: usize,
    availableVirtualMemory: usize,
    totalVirtualMemory: usize,
};

const MemoryStats = struct {
    totalAllocated: usize,
    totalFreed: usize,
    currentUsed: usize,
    totalAllocations: usize,
};