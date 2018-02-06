pub fn QuatT(comptime T: type)type {
    struct {
        data: [4]T,
        
        pub fn new()Self {
            quat(0, 0, 0, 1)
        }

        pub fn init(x: T, y: T, z: T, w: T)Self {
            quat(x, y, z, w)
        }

        pub fn cat(xyz: Vec3T(T), w: T )Self {
            quat(xyz.x, xyz.y, xyz.z, w)
        }

        pub fn dup(self: &const Self)Self {
            Self { .data = self.data }
        }

        pub fn fromEulerAngles(angles: &Self)Self {
            const pitch = quat(1, 0, 0, angles.x);
            const yaw   = quat(0, 1, 0, angles.y);
            const roll  = quat(0, 0, 1, angles.z);
            return prod(prod(pitch, yaw), roll);
        }

        pub fn add(self: &Self, other: &const Self)&Self {
            *self = sum(self, other);
            return self 
        }
        pub fn sub(self: &Self, other: &const Self)&Self {
            *self = diff(self, other);
            return self 
        }
        pub fn mul(self: &Self, other: &const Self)&Self {
            *self = prod(self, other);
            return self 
        }
        pub fn scale(self: &Self, scalar: T)&Self {
            *self = scaleDown(self, scalar);
            return self 
        }
        pub fn div(self: &Self, scalar: T)&Self {
            *self = scaleUp(self, scalar);
            return self 
        }

        pub fn sum(self: &const Self, other: &const Self) void {
            quat(self.x + other.x, self.y + other.y, self.z + other.z, self.w + other.w);
        }
        pub fn diff(self: &const Self, other: &const Self) void {
            quat(self.x - other.x, self.y - other.y, self.z - other.z, self.w - other.w);
        }
        pub fn prod(self: &const Self, other: &const Self) void {
            normalize(quat(
                (((self.w * other.x) + (self.x * other.w)) + (self.y * other.z)) - (self.z * other.y),
                (((self.w * other.y) + (self.y * other.w)) + (self.z * other.x)) - (self.x * other.z),
                (((self.w * other.z) + (self.z * other.w)) + (self.x * other.y)) - (self.y * other.x),
                (((self.w * other.w) - (self.x * other.x)) - (self.y * other.y)) - (self.z * other.z)
            ))
        }

        pub fn scaleUp(self: &const Self, scalar: T) void {
            quat(self.x * scalar, self.y * scalar, self.z * scalar, self.w * scalar);
        }
        pub fn scaleDown(self: &const Self, scalar: T) void {
            quat(self.x / scalar, self.y / scalar, self.z / scalar, self.w / scalar);
        }
        pub fn neg(self: &const Self, scalar: T) void {
            quat(-self.x, -self.y, -self.z, -self.w);
        }

        pub fn rotationX(self: &Self, radians: T) void {
            const angle = radians / 2;
            return quat(sin(angle), 0, 0, cos(angle));
        }
        pub fn rotationY(self: &Self, radians: T) void {
            const angle = radians / 2;
            return quat(0, sin(angle), 0, cos(angle));
        }
        pub fn rotationZ(self: &Self, radians: T) void {
            const angle = radians / 2;
            return quat(0, 0, sin(angle), cos(angle));
        }

        pub fn set(self: &Self, other: &const Self)&Self {
            self.x = other.x;
            self.y = other.y;
            self.z = other.z;
            self.w = other.w;
            return self;
        }

        pub fn setElement(self: &Self, index: usize, value: T)&Self {
            self.data[index] = value;
        }

        pub fn setXYZ(self: &Self, vec: &const Vec3T(T))&Self {
            self.x = vec.x;
            self.y = vec.y;
            self.z = vec.z;
            return self;
        }

        pub fn getXYZ(self: &const Self)Vec3T(T) void {
            return Vec3T(T).init(self.x, self.y, self.z);
        }

        pub fn getElement(self: &const Self, index: usize) T {
            return self.data[index];
        }

        pub fn getAxis(self: &const Self)Vec3T(T) void {
            const x = 1.0 - self.w * self.w;
            if (x < 0.0000001) // Divide by zero safety check
                return Vec3.XAxis();

            const x2 = x * x;
            return getXYZ() / x2;
        }

        pub fn toEulerAngles(self: &const Self)Vec3T(T) void {
            const X = atan2(2 * self.x * self.w - 2 * self.y * self.z, 1 - 2 * self.x * self.x - 2 * self.z * self.z);
            const Y = atan2(2 * self.y * self.w - 2 * self.x * self.z, 1 - 2 * self.y * self.y - 2 * self.z * self.z);
            const Z =  asin(2 * self.x * self.y + 2 * self.z * self.w);
            return vec3(X, Y, Z);
        }

        pub fn isEqual(self: &const Self, other: &const Self)bool {
            return (self.x == other.x) and (self.y == other.y) and (self.z == other.z) and (self.w == other.w);
        }

        pub fn norm(self: &const Self) T {
            return (self.x * self.x) + (self.y * self.y) + (self.z * self.z) + (self.w * self.w);
        }

        pub fn length(self: &const Self)float {
            return sqrt(norm(self));
        }

        pub fn conjugate(self: &const Self)quat {
            return quat(-self.x, -self.y, -self.z, self.w);
        }

        pub fn normalize(self: &const Self)quat {
            const lenSqr = norm(self);
            const lenInv = rsqrt(lenSqr);
            return self * lenInv;
        }

        pub fn rotationVector(unitVec0: &const Vec3T(T), unitVec1: &const Vec3T(T))quat {
            const cosHalfAngleX2 = sqrt((2 * (1 + unitVec0.dot(unitVec1))));
            const recipCosHalfAngleX2 = (1 / cosHalfAngleX2);
            return quat((unitVec0.cross(unitVec1) * recipCosHalfAngleX2), (cosHalfAngleX2 / 2));
        }

        pub fn rotationAngle(radians: f32, unitVec: &const Vec3)quat {
            const angle = radians / 2;
            return quat((unitVec * sin(angle)), cos(angle));
        }

        pub fn rotate(self: &const Self, quat: &const Self, vec: &const Vec3T(T))Vec3 {
            const tmpX = (((quat.w * vec.x) + (quat.y * vec.z)) - (quat.z * vec.y));
            const tmpY = (((quat.w * vec.y) + (quat.z * vec.x)) - (quat.x * vec.z));
            const tmpZ = (((quat.w * vec.z) + (quat.x * vec.y)) - (quat.y * vec.x));
            const tmpW = (((quat.x * vec.x) + (quat.y * vec.y)) + (quat.z * vec.z));

            return vec3(
                ((((tmpW * quat.x) + (tmpX * quat.w)) - (tmpY * quat.z)) + (tmpZ * quat.y)),
                ((((tmpW * quat.y) + (tmpY * quat.w)) - (tmpZ * quat.x)) + (tmpX * quat.z)),
                ((((tmpW * quat.z) + (tmpZ * quat.w)) - (tmpX * quat.y)) + (tmpY * quat.x))
            );
        }

        pub fn select(first: &const Self, second: &const Self, select_second: bool)quat {
            return quat(
                if(select_second) second.x else first.x,
                if(select_second) second.y else first.y,
                if(select_second) second.z else first.z,
                if(select_second) second.w else first.w
            );
        }

        pub fn dot(self: &const Self, other: &const Self)float {
            return (self.x * other.x) + (self.y * other.y) + (self.z * other.z) + (self.w * other.w);
        }
    }
}