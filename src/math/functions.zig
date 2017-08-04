const c = @import("../system/c.zig");

pub inline fn toRadians(degrees: f32) ->  f32 {
    return degrees * ( f32(M_PI) / 180.0 );
}

pub inline fn toDegrees(radians: f32) ->  f32 {
    return 360.0 * radians / ( f32(M_PI) * 2.0 );
}

pub inline fn sign(value: f32) -> f32 {
    return ( value > 0 ) - ( value < 0 );
}

pub inline fn clamp_min(value: f32, minimum: f32) ->  f32 {
    return if ( value < minimum ) minimum else value;
}

pub inline fn clamp_max(value: f32, maximum: f32) ->  f32 {
    return if ( value > maximum ) maximum else value;
}

pub inline fn clamp(value: f32, minimum: f32, maximum: f32) ->  f32 {
    return if ( value > minimum ) { if ( value < maximum ) value else maximum } else  { minimum };
}

pub inline fn sin(angle: f32) ->  f32 {
    return c.sinf(angle);
}

pub inline fn cos(angle: f32) ->  f32 {
    return c.cosf(angle);
}

pub inline fn tan(angle: f32) ->  f32 {
    return c.tanf(angle);
}

pub inline fn sqrt(value: f32) ->  f32 {
    return c.sqrtf(value);
}

pub inline fn rsqrt(value: f32) ->  f32 {
    return 1.0 / c.sqrtf(value);
}

pub inline fn asin(value: f32) ->  f32 {
    return c.asinf(value);
}

pub inline fn acos(value: f32) ->  f32 {
    return c.acosf(value);
}

pub inline fn atan(value: f32) ->  f32 {
    return c.atanf(value);
}

pub inline fn atan2(y: f32, x: f32) ->  f32 {
    return c.atan2(y, x);
}
