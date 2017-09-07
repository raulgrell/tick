const math = @import("std").math;

pub fn Vec2T(comptime T: type) -> type {
    packed struct {
        x: T,
        y: T,

        const Self = this;

        inline fn xyz(v: &const Self) -> Vec3T(T) {
            Vec3T(T) { .x = v.x, .y = v.y, .z = 0 }
        }

        pub fn new() -> Self {
            Self { .x = 0, .y = 0 }
        }

        pub fn init(X: T, Y: T) -> Self {
            Self { .x = X, .y = Y }
        }

        pub fn dup(vec: &const Self) {
            Self { vec }
        }

        pub fn cast(self: &const Self, comptime C: type) -> Vec2T(C) {
            Vec2T(C) { .x = C(self.x), .y = C(self.y) }
        }
        
        pub fn Up()    -> Self { return init( 0,  1); }
        pub fn Down()  -> Self { return init( 0, -1); }
        pub fn Left()  -> Self { return init(-1,  0); }
        pub fn Right() -> Self { return init( 1,  0); }
        pub fn Zero()  -> Self { return init( 0,  0); }
        pub fn XAxis() -> Self { return init( 1,  0); }
        pub fn YAxis() -> Self { return init( 0,  1); }

        pub fn set(self: &Vec2, X: T, Y: T) {
            self.x = X;
            self.y = Y;
        }

        pub fn offset(self: &Self, other: &const Self) -> &Self {
            self.x += other.x;
            self.y += other.y;
            return self;
        }

        pub fn scale_aniso(self: &Self, other: &const Self) -> &Self {
            self.x *= other.x;
            self.y *= other.y;
            return self;
        }
        
        pub fn scale(self: &Self, value: T) -> &Self {
            self.x *= value;
            self.y *= value;
            return self;
        }

        pub fn add(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x + other.x, self.y + other.y)
        }

        pub fn sub(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x - other.x, self.y - other.y)
        }

        pub fn mul(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x * other.x, self.y * other.y)
        }

        pub fn div(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x / other.x, self.y / other.y)
        }

        pub fn add_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x + value, self.y + value)
        }

        pub fn sub_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x - value, self.y - value)
        }

        pub fn mul_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x * value, self.y * value)
        }

        pub fn div_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x / value, self.y / value)
        }

        pub fn rotate(self: &const Self, angle: f32) -> vec2 {
            return Self.init(
                self.x * cos(angle) - self.y * sin(angle),
                self.x * sin(angle) + self.y * cos(angle)
            );
        }

        pub fn isEqual(self: &const Self, other: &const Self) -> bool {
            return x == other.x and y == other.y;
        }

        pub fn isZero(self: &const Self, other: &const Self) -> bool {
            return x == 0 and y == 0;
        }

        pub fn distance(self: &const Self, other: &const Self) -> f32 {
            const a = self.x - other.x;
            const b = self.y - other.y;
            return math.sqrt(a * a + b * b);
        }

        pub fn dot(self: &const Self, other: &const Self) -> f32 {
            return self.x * other.x + self.y * other.y;
        }

        pub fn length(self: &const Self) -> f32 {
            return math.sqrt(self.x * self.x + self.y * self.y);
        }

        pub fn normalize(self: &const Self) -> Self {
            const len = self.length();
            return Self.init(self.x / len, self.y / len);
        }
    }
}

pub fn Vec3T(comptime T: type) -> type {
    packed struct {
        x: T,
        y: T,
        z: T,

        const Self = this;

        inline fn xy(v: &const Self) -> Vec2T(T) {
            Vec2T(T) { .x = v.x, .y = v.y }
        }
        
        pub fn new() -> Self {
            Self { .x = 0, .y = 0, .z = 0 }
        }

        pub fn init(X: T, Y: T, Z: T) -> Self {
            Self { .x = X, .y = Y, .z = Z }
        }

        pub fn dup(vec: &const Self) {
            Self { vec }
        }

        pub fn cast(vec: &const Self, comptime C: type) -> Vec3T(C) {
            Vec3T(C) { .x = C(vec.x), .y = C(vec.y), .z = C(vec.z) }
        }

        pub fn Up()        -> Vec3 { return Self.init( 0,  1,  0); }
        pub fn Down()      -> Vec3 { return Self.init( 0, -1,  0); }
        pub fn Left()      -> Vec3 { return Self.init(-1,  0,  0); }
        pub fn Right()     -> Vec3 { return Self.init( 1,  0,  0); }
        pub fn Forwards()  -> Vec3 { return Self.init( 0,  0,  1); }
        pub fn Backwards() -> Vec3 { return Self.init( 0,  0, -1); }
        pub fn XAxis()     -> Vec3 { return Self.init( 1,  0,  0); }
        pub fn YAxis()     -> Vec3 { return Self.init( 0,  1,  0); }
        pub fn ZAxis()     -> Vec3 { return Self.init( 0,  0,  1); }
        pub fn Zero()      -> Vec3 { return Self.init( 0,  0,  0); }

        pub fn set(self: &Vec3, X: f32, Y: f32, Z: f32) {
            self.x = X;
            self.y = Y;
            self.z = Z;
        }

        pub fn scale(self: &Self, value: T) -> &Self {
            self.x *= value;
            self.y *= value;
            self.z *= value;
            return self;
        }

        pub fn scale_aniso(self: &Self, other: &const Self) -> &Self {
            self.x *= other.x;
            self.y *= other.y;
            self.z *= other.z;
            return self;
        }

        pub fn offset(self: &Self, other: &const Self) -> &Self {
            self.x += other.x;
            self.y += other.y;
            self.z += other.z;
            return self;
        }

        pub fn add(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x + other.x, self.y + other.y, self.z + other.z)
        }

        pub fn sub(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x - other.x, self.y - other.y, self.z - other.z)
        }

        pub fn mul(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x * other.x, self.y * other.y, self.z * other.z)
        }

        pub fn div(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x / other.x, self.y / other.y, self.z / other.z)
        }

        pub fn add_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x + value, self.y + value, self.z + value)
        }

        pub fn sub_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x - value, self.y - value, self.z - value)
        }

        pub fn mul_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x * value, self.y * value, self.z * value)
        }

        pub fn div_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x / value, self.y / value, self.z / value)
        }

        pub fn transform(self: &const Self, trans: &const Mat4) -> Self {
            return Self.init(
                trans.rows[0].x * self.x + trans.rows[0].y * self.y + trans.rows[0].z * self.z + trans.rows[0].w,
                trans.rows[1].x * self.x + trans.rows[1].y * self.y + trans.rows[1].z * self.z + trans.rows[1].w,
                trans.rows[2].x * self.x + trans.rows[2].y * self.y + trans.rows[2].z * self.z + trans.rows[2].w
            );
        }

        pub fn cross(self: &const Self, other: &const Self) -> Self {
            return Self.init(
                self.y * other.z - self.z * other.y,
                self.z * other.x - self.x * other.z,
                self.x * other.y - self.y * other.x
            );
        }

        pub fn distance(self: &const Self, other: &const Self) -> f32 {
            const a = self.x - other.x;
            const b = self.y - other.y;
            const c = self.z - other.z;
            return math.sqrt(a * a + b * b + c * c);
        }

        pub fn dot(self: &const Self, other: &const Self) -> f32 {
            return self.x * other.x + self.y * other.y + self.z * other.z;
        }

        pub fn length(self: &const Self) -> f32 {
            return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
        }

        pub fn normalize(self: &const Self) -> Self {
            const m = self.length();
            return Self.init(self.x / m, self.y / m, self.z / m);
        }

        pub fn isEqual(self: &const Self, other: &const Self) -> bool {
            return self.x == other.x and self.y == other.y and self.z == other.z;
        }

        pub fn vectorAngle(v: &const Self, w: &const Self) -> f32 {
            const cosineOfAngle = v.normalize().dot(w.normalize());
            // Clamp values
            if ( cosineOfAngle > 1.0 ) cosineOfAngle = 1.0;
            if ( cosineOfAngle < -1.0 ) cosineOfAngle = -1.0;
            return -acos(cosineOfAngle);
        }

        pub fn rotate(self: &const Self, axis: &const Self, angle: f32) -> vec3 {
            var w = Self.init(0, 0, 0);

            if ( (self.x == 0) and (self.y == 0) and (self.z == 0) ) return w;

            const n = axis.normalize();
            const c = cos(angle);
            const s = sin(angle);
            const t = 1 - c;

            w.x = ( t * n.x * n.x + c ) * x + ( t * n.x * n.y + s * n.z ) * y + ( t * n.x * n.z - s * n.y ) * z;
            w.y = ( t * n.x * n.y - s * n.z ) * x + ( t * n.y * n.y + c ) * y + ( t * n.y * n.z + s * n.x ) * z;
            w.z = ( t * n.x * n.z + s * n.y ) * x + ( t * n.y * n.z - s * n.x ) * y + ( t * n.z * n.z + c ) * z;

            w = w.normalize() * self.length();

            return w;
        }
    }
}

pub fn Vec4T(comptime T: type) -> type {
    packed struct {
        x: T,
        y: T,
        z: T,
        w: T,

        const Self = this;

        inline fn xyz(v: &const Self) -> Vec3T(T) {
            Vec3T(T) { .x = v.x, .y = v.y, .z = v.z }
        }

        pub fn new() -> Self {
            Self { .x = 0, .y = 0, .z = 0, .w = 0 }
        }

        pub fn init(X: T, Y: T, Z: T, W: T) -> Self {
            Self { .x = X, .y = Y, .z = Z, .w = W }
        }

        pub fn dup(vec: &const Self) {
            Self { vec }
        }

        pub fn cast(vec: &const Self, comptime C: type) -> Vec4T(C) {
            Vec4T(C) { .x = C(vec.x), .y = C(vec.y), .z = C(vec.z), .w = C(vec.w),  }
        }

        pub fn set(self: &Vec4, X: T, Y: T, Z: T, W: T) {
            self.x = X;
            self.y = Y;
            self.z = Z;
            self.w = W;
        }

        pub fn scale(self: &Self, value: T) -> &Self {
            self.x *= value;
            self.y *= value;
            self.z *= value;
            self.w *= value;
            return self;
        }

        pub fn scale_aniso(self: &Self, other: &const Self) -> &Self {
            self.x *= other.x;
            self.y *= other.y;
            self.z *= other.z;
            self.w *= other.w;
            return self;
        }

        pub fn offset(self: &Self, other: &const Self) -> &Self {
            self.x += other.x;
            self.y += other.y;
            self.z += other.z;
            self.w += other.w;
            return self;
        }

        pub fn add(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x + other.x, self.y + other.y, self.z + other.z, self.w + other.w)
        }

        pub fn sub(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x - other.x, self.y - other.y, self.z - other.z, self.w - other.w)
        }

        pub fn mul(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x * other.x, self.y * other.y, self.z * other.z, self.w * other.w)
        }

        pub fn div(self: &const Self, other: &const Self) -> Self {
            Self.init(self.x / other.x, self.y / other.y, self.z / other.z, self.w / other.w)
        }

        pub fn add_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x + value, self.y + value, self.z + value, self.w + value)
        }

        pub fn sub_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x - value, self.y - value, self.z - value, self.w - value)
        }

        pub fn mul_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x * value, self.y * value, self.z * value, self.w * value)
        }

        pub fn div_scalar(self: &const Self, value: T) -> Self {
            Self.init(self.x / value, self.y / value, self.z / value, self.w / value)
        }

        pub fn transform(self: &const Self, trans: &Mat4) -> Self {
            return Self.init(
                trans.rows[0].x * self.x + trans.rows[0].y * self.y + trans.rows[0].z * self.z + trans.rows[0].w * self.w,
                trans.rows[1].x * self.x + trans.rows[1].y * self.y + trans.rows[1].z * self.z + trans.rows[1].w * self.w,
                trans.rows[2].x * self.x + trans.rows[2].y * self.y + trans.rows[2].z * self.z + trans.rows[2].w * self.w,
                trans.rows[3].x * self.x + trans.rows[3].y * self.y + trans.rows[3].z * self.z + trans.rows[3].w * self.w
            );
        }

        pub fn isEqual(self: &const Self, other: &const Self) -> bool {
            return self.x == other.x and self.y == other.y and self.z == other.z and self.w == other.w;
        }

        pub fn dot(self: &const Self, other: &const Self) -> f32 {
            return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w;
        }

        pub fn length(self: &const Self) -> f32 {
            return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w);
        }

        pub fn normalize(self: &const Self) -> vec4 {
            const len = self.length();
            return Self.init(self.x / len, self.y / len, self.z / len, self.w / len);
        }
    }
}

// min
// max
// reflect
