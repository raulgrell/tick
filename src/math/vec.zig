pub fn Vec2T(comptime T: type) -> type {
    struct {
        data: [2]T,

        const Self = this;

        inline fn x(v: &const Self) -> T { v.data[0] }
        inline fn y(v: &const Self) -> T { v.data[1] }

        pub fn new() -> Self {
            Self { .data = []T {0, 0} }
        }

        pub fn init(x: T, y: T) -> Self {
            Self { .data = []T {x, y} }
        }

        pub fn dup(vec: &const Self) {
            Self { .data = vec.data }
        }

        pub fn Up()    -> Self { return init( 0,  1); }
        pub fn Down()  -> Self { return init( 0, -1); }
        pub fn Left()  -> Self { return init(-1,  0); }
        pub fn Right() -> Self { return init( 1,  0); }
        pub fn Zero()  -> Self { return init( 0,  0); }
        pub fn XAxis() -> Self { return init( 1,  0); }
        pub fn YAxis() -> Self { return init( 0,  1); }

        pub fn set(self: &Vec2, X: f32, Y: f32) {
            self.data[0] = X;
            self.data[1] = Y;
        }

        pub fn add(self: &Self, other: &const Self) -> &Self {
            self.data[0] += other.data[0];
            self.data[1] += other.data[1];
            return self;
        }

        pub fn sub(self: &Self, other: &const Self) -> &Self {
            self.data[0] -= other.data[0];
            self.data[1] -= other.data[1];
            return self;
        }

        pub fn mul(self: &Self, other: &const Self) -> &Self {
            self.data[0] *= other.data[0];
            self.data[1] *= other.data[1];
            return self;
        }

        pub fn div(self: &Self, other: &const Self) -> &Self {
            self.data[0] /= other.data[0];
            self.data[1] /= other.data[1];
            return self;
        }

        pub fn add_scalar(self: &Self, value: T) -> &Self {
            self.data[0] += value;
            self.data[1] += value;
            return self;
        }

        pub fn sub_scalar(self: &Self, value: T) -> &Self {
            self.data[0] -= value;
            self.data[1] -= value;
            return self;
        }

        pub fn mul_scalar(self: &Self, value: T) -> &Self {
            self.data[0] *= value;
            self.data[1] *= value;
            return self;
        }

        pub fn div_scalar(self: &Self, value: T) -> &Self {
            self.data[0] /= value;
            self.data[1] /= value;
            return self;
        }

        pub fn rotate(self: &const Self, angle: f32) -> vec2 {
            return vec2(
                self.x * cos(angle) - self.y * sin(angle),
                self.x * sin(angle) + self.y * cos(angle)
            );
        }

        pub fn isEqual(self: &const Self, other: &const Self) -> bool {
            return x == other.x and y == other.y;
        }

        pub fn distance(self: &const Self, other: &const Self) -> f32 {
            const a = self.x - other.x;
            const b = self.y - other.y;
            return sqrt(a * a + b * b);
        }

        pub fn dot(self: &const Self, other: &const Self) -> f32 {
            return self.x * other.x + self.y * other.y;
        }

        pub fn length(self: &const Self) -> f32 {
            return sqrt(self.x * self.x + self.y * self.y);
        }

        pub fn normalize(self: &const Self) -> vec2 {
            const len = length();
            return vec2(self.x / len, self.y / len);
        }
    }
}

pub fn Vec3T(comptime T: type) -> type {
    struct {
        data: [3]T,

        const Self = this;

        inline fn x(v: &const Self) -> T { v.data[0] }
        inline fn y(v: &const Self) -> T { v.data[1] }
        inline fn z(v: &const Self) -> T { v.data[2] }

        pub fn new() -> Self {
            Self { .data = []T {0, 0, 0} }
        }

        pub fn init(x: T, y: T, z: T) -> Self {
            Self { .data = []T {x, y, z} }
        }

        pub fn dup(vec: &const Self) {
            Self { .data = vec.data }
        }

        pub fn Up()        -> Vec3 { return vec3( 0.0,  1.0,  0.0); }
        pub fn Down()      -> Vec3 { return vec3( 0.0, -1.0,  0.0); }
        pub fn Left()      -> Vec3 { return vec3(-1.0,  0.0,  0.0); }
        pub fn Right()     -> Vec3 { return vec3( 1.0,  0.0,  0.0); }
        pub fn Forwards()  -> Vec3 { return vec3( 0.0,  0.0,  1.0); }
        pub fn Backwards() -> Vec3 { return vec3( 0.0,  0.0, -1.0); }
        pub fn XAxis()     -> Vec3 { return vec3( 1.0,  0.0,  0.0); }
        pub fn YAxis()     -> Vec3 { return vec3( 0.0,  1.0,  0.0); }
        pub fn ZAxis()     -> Vec3 { return vec3( 0.0,  0.0,  1.0); }
        pub fn Zero()      -> Vec3 { return vec3( 0.0,  0.0,  0.0); }

        pub fn set(self: &Vec3, X: f32, Y: f32, Z: f32) {
            self.data[0] = X;
            self.data[1] = Y;
            self.data[2] = Z;
        }

        pub fn add(self: &Self, other: &const Self) -> &Self {
            self.data[0] += other.data[0];
            self.data[1] += other.data[1];
            self.data[2] += other.data[2];
            return self;
        }

        pub fn sub(self: &Self, other: &const Self) -> &Self {
            self.data[0] -= other.data[0];
            self.data[1] -= other.data[1];
            self.data[2] -= other.data[2];
            return self;
        }

        pub fn mul(self: &Self, other: &const Self) -> &Self {
            self.data[0] *= other.data[0];
            self.data[1] *= other.data[1];
            self.data[2] *= other.data[2];
            return self;
        }

        pub fn div(self: &Self, other: &const Self) -> &Self {
            self.data[0] /= other.data[0];
            self.data[1] /= other.data[1];
            self.data[2] /= other.data[2];
            return self;
        }

        pub fn add_scalar(self: &Self, value: T) -> &Self {
            self.data[0] += value;
            self.data[1] += value;
            self.data[2] += value;
            return self;
        }

        pub fn sub_scalar(self: &Self, value: T) -> &Self {
            self.data[0] -= value;
            self.data[1] -= value;
            self.data[2] -= value;
            return self;
        }

        pub fn mul_scalar(self: &Self, value: T) -> &Self {
            self.data[0] *= value;
            self.data[1] *= value;
            self.data[2] *= value;
            return self;
        }

        pub fn div_scalar(self: &Self, value: T) -> &Self {
            self.data[0] /= value;
            self.data[1] /= value;
            self.data[2] /= value;
            return self;
        }

        pub fn mul_mat(self: &const Self, transform: &const Mat3) -> Self {
            return vec3(
                transform.rows[0].x * x + transform.rows[0].y * y + transform.rows[0].z * z + transform.rows[0].w,
                transform.rows[1].x * x + transform.rows[1].y * y + transform.rows[1].z * z + transform.rows[1].w,
                transform.rows[2].x * x + transform.rows[2].y * y + transform.rows[2].z * z + transform.rows[2].w
            );
        }

        pub fn cross(self: &const Self, other: &const Self) -> Self {
            return vec3(
                self.y * other.z - self.z * other.y,
                self.z * other.x - self.x * other.z,
                self.x * other.y - self.y * other.x
            );
        }

        pub fn distance(self: &const Self, other: &const Self) -> f32 {
            const a = self.x - other.x;
            const b = self.y - other.y;
            const c = self.z - other.z;
            return sqrt(a * a + b * b + c * c);
        }

        pub fn dot(self: &const Self, other: &const Self) -> f32 {
            return self.x * other.x + self.y * other.y + self.z * other.z;
        }

        pub fn length(self: &const Self) -> f32 {
            return sqrt(self.x * self.x + self.y * self.y + self.z * self.z);
        }

        pub fn normalize(self: &const Self) -> vec3 {
            const m = self.length();
            return vec3(x / m, y / m, z / m);
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
            const w = vec3(0, 0, 0);

            if ( (self.x == 0) and (self.y == 0) and (self.z == 0) ) return w;

            const n_axis = axis.normalize();
            const c = cos(angle);
            const s = sin(angle);
            const t = 1 - c;

            w.x = ( t * n_axis.x * n_axis.x + c ) * x
                + ( t * n_axis.x * n_axis.y + s * n_axis.z ) * y
                + ( t * n_axis.x * n_axis.z - s * n_axis.y ) * z;

            w.y = ( t * n_axis.x * n_axis.y - s * n_axis.z ) * x
                + ( t * n_axis.y * n_axis.y + c ) * y
                + ( t * n_axis.y * n_axis.z + s * n_axis.x ) * z;

            w.z = ( t * n_axis.x * n_axis.z + s * n_axis.y ) * x
                + ( t * n_axis.y * n_axis.z - s * n_axis.x ) * y
                + ( t * n_axis.z * n_axis.z + c ) * z;

            w = w.normalize() * self.length();

            return w;
        }
    }
}

pub fn Vec4T(comptime T: type) -> type {
    struct {
        data: [4]T,

        const Self = this;

        inline fn x(v: &const Self) -> T { v.data[0] }
        inline fn y(v: &const Self) -> T { v.data[1] }
        inline fn z(v: &const Self) -> T { v.data[2] }
        inline fn w(v: &const Self) -> T { v.data[3] }

        pub fn new() -> Self {
            Self { .data = []T {0, 0, 0, 0} }
        }

        pub fn init(x: T, y: T, z: T, w: T) -> Self {
            Self { .data = []T {x, y, z, w} }
        }

        pub fn dup(vec: &const Self) {
            Self { .data = vec.data }
        }

        pub fn set(self: &Vec4, X: T, Y: T, Z: T, W: T) {
            self.data[0] = X;
            self.data[1] = Y;
            self.data[2] = Z;
            self.data[3] = W;
        }

        pub fn add(self: &Self, other: &const Self) -> &Self {
            self.data[0] += other.data[0];
            self.data[1] += other.data[1];
            self.data[2] += other.data[2];
            self.data[3] += other.data[3];
            return self;
        }

        pub fn sub(self: &Self, other: &const Self) -> &Self {
            self.data[0] -= other.data[0];
            self.data[1] -= other.data[1];
            self.data[2] -= other.data[2];
            self.data[3] -= other.data[3];
            return self;
        }

        pub fn mul(self: &Self, other: &const Self) -> &Self {
            self.data[0] *= other.data[0];
            self.data[1] *= other.data[1];
            self.data[2] *= other.data[2];
            self.data[3] *= other.data[3];
            return self;
        }

        pub fn div(self: &Self, other: &const Self) -> &Self {
            self.data[0] /= other.data[0];
            self.data[1] /= other.data[1];
            self.data[2] /= other.data[2];
            self.data[3] /= other.data[3];
            return self;
        }

        pub fn add_scalar(self: &Self, value: T) -> &Self {
            self.data[0] += value;
            self.data[1] += value;
            self.data[2] += value;
            self.data[3] += value;
            return self;
        }

        pub fn sub_scalar(self: &Self, value: T) -> &Self {
            self.data[0] -= value;
            self.data[1] -= value;
            self.data[2] -= value;
            self.data[3] -= value;
            return self;
        }

        pub fn mul_scalar(self: &Self, value: T) -> &Self {
            self.data[0] *= value;
            self.data[1] *= value;
            self.data[2] *= value;
            self.data[3] *= value;
            return self;
        }

        pub fn div_scalar(self: &Self, value: T) -> &Self {
            self.data[0] /= value;
            self.data[1] /= value;
            self.data[2] /= value;
            self.data[3] /= value;
            return self;
        }

        pub fn mul_mat(self: &const Self, trans: &Mat4) -> Self {
            return vec4(
                trans.rows[0].x * x + trans.rows[0].y * y + trans.rows[0].z * z + trans.rows[0].w * w,
                trans.rows[1].x * x + trans.rows[1].y * y + trans.rows[1].z * z + trans.rows[1].w * w,
                trans.rows[2].x * x + trans.rows[2].y * y + trans.rows[2].z * z + trans.rows[2].w * w,
                trans.rows[3].x * x + trans.rows[3].y * y + trans.rows[3].z * z + trans.rows[3].w * w
            );
        }

        pub fn isEqual(self: &const Self, other: &const Self) -> bool {
            return self.x == other.x and self.y == other.y and self.z == other.z and self.w == other.w;
        }

        pub fn dot(self: &const Self, other: &const Self) -> f32 {
            return self.x * other.x + self.y * other.y + self.z * other.z + self.w * other.w;
        }

        pub fn length(self: &const Self) -> f32 {
            return sqrt(self.x * self.x + self.y * self.y + self.z * self.z + self.w * self.w);
        }

        pub fn normalize(self: &const Self) -> vec4 {
            const len = self.length();
            return vec4(self.x / len, self.y / len, self.z / len, self.w / len);
        }
    }
}

// min
// max
// input
// reflect

pub const Vec2 = Vec2T(f32); 

pub fn vec2(x: f32, y: f32) -> Vec2 {
    Vec2 { .data = []f32 { x, y }}
}

pub const Vec3 = Vec3T(f32); 
pub const Vec4 = Vec4T(f32);

test "Vectors" {
    const v2 = Vec2.new();
    const v3 = Vec3.new();
    const v4 = Vec4.new();
}

pub const Vec3 = struct {
    data: [3]f32,

    pub fn normalize(v: &const Vec3) -> Vec3 {
        v.scale(1.0 / c.sqrtf(v.dot(v)))
    }

    pub fn length(v: &const Vec3) -> f32 {
        c.sqrtf(v.dot(v))
    }

};

pub fn vec3(x: f32, y: f32, z: f32) -> Vec3 {
    Vec3 { .data = []f32 { x, y, z, } }
}


pub fn vec4(xa: f32, xb: f32, xc: f32, xd: f32) -> Vec4 {
    Vec4 { .data = []f32 { xa, xb, xc, xd, } }
}

