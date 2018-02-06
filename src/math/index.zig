const c = @import("system/c.zig");
const assert = @import("std").debug.assert;

const easing = @import("easing.zig");
const geometry = @import("geometry.zig");
const vec = @import("vec.zig");
const mat = @import("mat.zig");
const quat = @import("quat.zig");

// Vectors

pub const Vec2 = vec.Vec2T(f32); 
pub const Vec3 = vec.Vec3T(f32); 
pub const Vec4 = vec.Vec4T(f32);

pub const UVec2 = vec.Vec2T(u32); 
pub const UVec3 = vec.Vec3T(u32); 
pub const UVec4 = vec.Vec4T(u32);

pub fn vec2(x: f32, y: f32)Vec2 {
    return Vec2 { .x = x, .y = y };
}

pub fn vec3(x: f32, y: f32, z: f32)Vec3 {
    return Vec3 {.x = x, .y = y, .z = z };
}

pub fn vec4(x: f32, y: f32, z: f32, w: f32)Vec4 {
    return Vec4 {.x = x, .y = y, .z = z, .w = w };
}

// Matrices

pub const Mat3 = mat.Mat3T(f32);
pub const Mat4 = mat.Mat4T(f32);

pub fn mat3(diagonal: f32)Mat3 {
    return Mat3.diagonal(diagonal);
}

pub fn mat4(diagonal: f32)Mat4 {
    return Mat4.diagonal(diagonal);
}

// Quaternions

pub const Quat = quat.QuatT(f32);

// Functions

pub inline fn toRadians(degrees: f32) f32 {
    return degrees * ( f32(M_PI) / 180.0 );
}

pub inline fn toDegrees(radians: f32) f32 {
    return 360.0 * radians / ( f32(M_PI) * 2.0 );
}

pub inline fn sign(value: f32)f32 {
    return ( value > 0 ) - ( value < 0 );
}

pub inline fn clamp_min(value: f32, minimum: f32) f32 {
    return if ( value < minimum ) minimum else value;
}

pub inline fn clamp_max(value: f32, maximum: f32) f32 {
    return if ( value > maximum ) maximum else value;
}

pub inline fn clamp(value: f32, minimum: f32, maximum: f32) f32 {
    return if ( value > minimum ) { return if ( value < maximum ) value else maximum; } else minimum;
}