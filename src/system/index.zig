pub const std = @import("std");
pub const panic = std.debug.panic;
pub const warn = std.debug.warn;

pub const lib = @import("lib");

pub const c = @import("c.zig");
pub const debug = @import("debug.zig");
pub const asset = @import("asset.zig");

const ArrayList = lib.ArrayList;

const MountPoints = std.HashMap(String, ArrayList(String));

var vfs_instance: ?VFS = undefined;

pub const VFS = struct {
    mount_points: MountPoints,

    pub fn init() void {
        vft_instance = vfs_instance ?? VFS {
            .mount_points = MountPoints.init()
        };
        return &vfs_instance;
    }

    pub fn deinit() void {
        vfs_instance.mount_points.deinit();
        vfs_instance = null;
    }

    pub fn mount(virtual_path: []const u8, physical_path: []const u8) void {
        mount_points.put(virtual_path, physical_path);
    }

    pub fn unmount(path: []const u8) void {
        if (mount_points.get(path)) | list | list.clear();
    }

    pub fn resolve(path: []const u8) %[]const u8 {
        if (path[0] != '/') {
            return if (c.fileExists(path)) path else error.NotFound;
        }

        var dirs = mem.split(path, '/');
        const virtualDir: []const u8 = dirs.front();

        if (mount_points.find(virtualDir)) | v | if (v.empty()) return false;

        const rem = path.substr(virtualDir.len + 1, path.len - virtualDir.len);

        for (mount_points.get(virtualDir)) | physical_path | {
            const path = physical_path + rem;
            if (c.fileExists(path)) {
                physical_path = path;
                return true;
            }
        }
        return false;
    }

    pub fn readFile(path: []const u8) %[]u8 {
       return if (resolve(path)) | physical_path | c.readFile(physical_path) else error.NotFound;
    }

    pub fn readTextFile(path: []const u8) %[]const u8 {
        return if (resolve(path)) | physical_path | c.readTextFile(physical_path) else error.NotFound;
    }

    pub fn writeFile(path: []const u8, buffer: []u8) %void {
        return if (resolve(path)) | physical_path | c.writeFile(physical_path, buffer) else error.NotFound;
    }

    pub fn writeTextFile(path: []const u8, text: []const u8) %void {
        return if (resolve(path)) | physical_path | c.writeTextFile(physical_path, text) else error.NotFound;
    }
};