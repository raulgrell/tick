pub const std = @import("std");
pub const panic = std.debug.panic;
pub const c = @import("c.zig");
pub const debug = @import("debug.zig");
pub const mem = @import("memory.zig");

var vfs_instance: VFS = undefined;

pub const MountPoints = HashMap(String, ArrayList(String));

pub const VFS = struct {
    mount_points: MountPoints,

    pub fn init() {
        vfs_instance = VFS {
            .mount_points = MountPoints.init()
        }
    }

    pub fn deinit() {
        vfs_instance.mount_points.deinit();
    }

    pub fn mount(virtual_path: []const u8, physical_path: []const u8) {
        mount_points[virtual_path].push_back(physical_path);
    }

    pub fn unmount(path: []const u8) {
        mount_points[path].clear();
    }

    pub fn resolve(path: []const u8, physical_path: []u8) -> %void {
        if (path[0] != '/') {
            physical_path = path;
            return c.fileExists(path);
        }

        var dirs = mem.split(path, '/');
        virtualDir: []const u8 = dirs.front();

        if (mount_points.find(virtualDir) == mount_points.end() or mount_points[virtualDir].empty())
            return false;

        const rem = path.substr(virtualDir.size() + 1, path.size() - virtualDir.size());

        for (mount_points[virtualDir]) | physical_path | {
            const path = physical_path + rem;
            if (c.fileExists(path)) {
                physical_path = path;
                return true;
            }
        }
        return false;
    }

    pub fn readFile(path: []const u8) -> %[]u8 {
        return if (resolve(path)) | physical_path | c.readFile(physical_path) else error.NotFound;
    }

    pub fn readTextFile(path: []const u8) -> %[]const u8 {
        return if (resolve(path)) | physical_path | c.readTextFile(physical_path) else error.NotFound;
    }

    pub fn writeFile(path: []const u8, buffer: []u8) -> %void {
        return if (resolve(path)) | physical_path | c.writeFile(physical_path, buffer) else error.NotFound;
    }

    pub fn writeTextFile(path: []const u8, text: []const u8) -> %void {
        return if (resolve(path)) | physical_path | c.writeTextFile(physical_path, text) else error.NotFound;
    }
};