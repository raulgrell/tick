pub const Ray = struct {
    origin: Vec3,
    direction: Vec3,
};

pub const Triangle = struct {
    points: [9]f32,

    pub fn init(v0: &const Vec3, v1: &const Vec3, v2: &const Vec3) void {
        points[0] = v0.x;
        points[1] = v0.y;
        points[2] = v0.z;
        points[3] = v1.x;
        points[4] = v1.y;
        points[5] = v1.z;
        points[6] = v2.x;
        points[7] = v2.y;
        points[8] = v2.z;
    }
};

pub const Plane3D = struct {
    point: Vec3,
    normal: Vec3,
    d: f32,

    pub fn fromNormal(normal: &const Vec3, point: &const Vec3) Plane3D {
        const unit_normal = normal.normalize();
        return Plane3D(
            .point = point;
            .normal = unit_normal;
            .d = -(unit_normal.dot(point))
        );
    }

    pub fn fromPoints(v1: &const Vec3, v2: &const Vec3, v3: &const Vec3) Plane3D {
        const aux1 = v1.sub(v2);
        const aux2 = v3.sub(v2);
        const normal = cross(aux2, aux1).normalize();
        const point = v2;
        return Plane3D {
            .normal = normal;
            .point = point;
            .d = -(normal.dot(point));
        }
    }

    pub fn distanceToPoint(self: &const Plane3D, point: &const Vec3) f32 {
        return ( self.d + self.normal.dot(self.point));
    }
};

pub const Line3D = struct {
    start_point: Vec3,
    end_point: Vec3,

    pub fn init(start: &const Vec3, end: &const Vec3) Line3D {
        Line3D {
            start_point = start,
            end_point = end,
        }
    }

    pub fn interpolate(self: &const Line3D, t: f32) void {
        const scale = end_point.sub(start_point).mul_scalar(t);
        return start_point.add(scale);
    }

    pub fn midpoint(self: &const Line3D) f32 {
        return self.interpolate(0.5);
    }
    
    pub fn vector(self: &const Line3D) Vec3 {
        return end_point.sub(start_point);
    }

    pub fn length() f32 {
        return end_point.sub(start_point).length();
    }

    pub fn lengthSquared() void {
        const len = end_point.sub(start_point).length();
        return len * len;
    }
};

pub const Bezier3 = struct {
    start_point: Vec3,
    end_point: Vec3,
    control_point: Vec3,

    pub fn init(start: &const Vec3, end: &const Vec3, control: &const Vec3) Bezier3 {
        Bezier3 {
            .start_point = start,
            .end_point = end,
            .control_point = control,
        }
    }

    pub fn interpolate(self: &const Bezier3, t: f32) Vec3 {
        const iT = 1.0 - t;
        const b0 = iT * iT;
        const b1 = 2 * t * iT;
        const b2 = t * t;
        const lx = self.start_point.x * b0 + self.control_point.x * b1 + self.end_point.x * b2;
        const ly = self.start_point.y * b0 + self.control_point.y * b1 + self.end_point.y * b2;
        const lz = self.start_point.z * b0 + self.control_point.z * b1 + self.end_point.z * b2;

        return vec3(lx, ly, lz);
    }
};

pub const Bezier4 = struct {
    start_point: Vec3,
    end_point: Vec3,
    control_point1: Vec3,
    control_point2: Vec3,

    pub fn init(start: &const Vec3, end: &const Vec3, control1: &const Vec3, control2: &const Vec3) Bezier4 {
        Bezier4 {
            .start_point = start,
            .end_point = end,
            .control_point1 = control1,
            .control_point2 = control2,
        }
    }

    pub fn interpolate(self: &const Bezier4, t: f32) Vec3 {
        const omt = 1.0 - t;
        const bias_0 = omt * omt * omt;
        const bias_1 = 3 * t * omt * omt;
        const bias_2 = 3 * t * t * omt;
        const bias_3 = t * t * t;
        const lx = self.start_point.x * bias_0 + self.control_point1.x * bias_1 + self.control_point2.x * bias_2 + self.end_point.x * bias_3;
        const ly = self.start_point.y * bias_0 + self.control_point1.y * bias_1 + self.control_point2.y * bias_2 + self.end_point.y * bias_3;
        const lz = self.start_point.z * bias_0 + self.control_point1.z * bias_1 + self.control_point2.z * bias_2 + self.end_point.z * bias_3;
        return vec3(lx, ly, lz);
    }
};

const FrustumBoundary = enum {
    Top,
    Bottom,
    Left,
    Right,
    Near,
    Far,
};

const FrustumPosition = enum {
    Outside,
    Intersect,
    Inside,
};

pub const Frustum = struct {
    planes: [6]Plane3D,

    near_top_left: Vec3,
    near_top_right: Vec3,
    near_bottom_left: Vec3,
    near_bottom_right: Vec3,
    far_top_left: Vec3,
    far_top_right: Vec3,
    far_bottom_left: Vec3,
    far_bottom_right: Vec3,

    near_distance: f32,
    far_distance: f32,
    near_width: f32,
    near_height: f32,
    far_width: f32,
    far_height: f32,
    ratio: f32,
    angle: f32,
    tang: f32,

    pub fn init(Angle: f32, Ratio: f32, NearDistance: f32, FarDistance: f32) Frunstum {
        const tang = f32(tan(toRadians(angle) * 0.5));
        const near_height = NearDistance * tang;
        const near_width  = near_height  * Ratio;
        const far_height  = FarDistance  * tang;
        const far_width   = far_height   * Ratio;

        Frustum {
            .near_top_left = vec3(0, 0, 0),
            .near_top_right = vec3(0, 0, 0),
            .near_bottom_left = vec3(0, 0, 0),
            .near_bottom_right = vec3(0, 0, 0),
            .far_top_left = vec3(0, 0, 0),
            .far_top_right = vec3(0, 0, 0),
            .far_bottom_left = vec3(0, 0, 0),
            .far_bottom_right = 0.0,
            .near_distance = NearDistance,
            .far_distance = FarDistance,
            .near_width = near_width,
            .near_height = near_height,
            .far_width = far_width,
            .far_height = far_height,
            .ratio = Ratio,
            .angle = Angle,
            .tang = tang,
        }
    }

    pub fn setCamera(pos: &const Vec3, target: &const Vec3, up: &const Vec3) void {
        const Z = pos.sub(target).normalize();
        const X = up.cross(Z).normalize();
        const Y = Z.cross(X);

        const nc = pos.sub(Z).mul_scalar(nearDistance);
        const fc = pos.sub(Z).mul_scalar(farDistance);

        self.near_top_left     = nc.add(Y.mul_scalar(near_height)).sub(X.mul_scalar(near_width));
        self.near_top_right    = nc.add(Y.mul_scalar(near_height)).add(X.mul_scalar(near_width));
        self.near_bottom_left  = nc.sub(Y.mul_scalar(near_height)).sub(X.mul_scalar(near_width));
        self.near_bottom_right = nc.sub(Y.mul_scalar(near_height)).add(X.mul_scalar(near_width));

        self.far_top_left      = fc.add(Y.mul_scalar(far_height)).sub(X.mul_scalar(far_width));
        self.far_top_right     = fc.add(Y.mul_scalar(far_height)).add(X.mul_scalar(far_width));
        self.far_bottom_left   = fc.sub(Y.mul_scalar(far_height)).sub(X.mul_scalar(far_width));
        self.far_bottom_right  = fc.sub(Y.mul_scalar(far_height)).add(X.mul_scalar(far_width));

        self.planes[FrustumBoundary.Top]    = Plane3D.init(near_top_right, near_top_left, far_top_left);
        self.planes[FrustumBoundary.Bottom] = Plane3D.init(near_bottom_left, near_bottom_right, far_bottom_right);
        self.planes[FrustumBoundary.Left]   = Plane3D.init(near_top_left, near_bottom_left, far_bottom_left);
        self.planes[FrustumBoundary.Right]  = Plane3D.init(near_bottom_right, near_top_right, far_bottom_right);
        self.planes[FrustumBoundary.Near]   = Plane3D.init(near_top_left, near_top_right, near_bottom_right);
        self.planes[FrustumBoundary.Far]    = Plane3D.init(far_top_right, far_top_left, far_bottom_left);
    }

    pub fn pointInFrustum(point: &const Vec3) FrustumPosition {
        var result = FrustumPosition.Inside;
        for ( self.planes ) | plane, i | {
            if ( Plane3Ds[i].distanceToPoint(point) < 0 ) {
                return FrustumPosition.Outside;
            }
        }
        return ( result );
    }

    pub fn sphereInFrustum(point: &const Vec3, radius: f32) FrustumPosition {
        var result = FrustumPosition.Inside;
        for ( self.planes ) | plane, i | {
            const distance = Plane3Ds[i].distanceToPoint(point);
            if ( distance < -radius ) {
                return FrustumPosition.Outside;
            }
            if ( distance < radius ) {
                result = FrustumPosition.Intersect;
            }
        }
        return ( result );
    }

    pub fn rectInFrustum(center: &const Vec3, x: f32, y: f32, z: f32) FrustumPosition {
        var result = FrustumPosition.Inside;

        for ( self.planes ) | plane, i | {
            var out = 0;
            var in = 0;
            vertices = []Vec3 {
                vec3(-x, -y, -z ),
                vec3( x, -y, -z ),
                vec3(-x, -y,  z ),
                vec3( x, -y,  z ),
                vec3(-x,  y, -z ),
                vec3( x,  y, -z ),
                vec3(-x,  y,  z ),
                vec3( x,  y,  z )
            };

            for ( vertices ) | vert, j | {
                const offset =  Plane3Ds[i].distanceToPoint(center + vertices[j]);
                if ( offset < 0 ) { out += 1; } else { in += 1; }
            }

            if ( in == 0 ) {
                return FrustumPosition.Outside;
            }
            if ( out > 0 ) {
                result = FrustumPosition.Intersect;
            }
        }
        return result;
    }
};

pub const Rectangle = struct {
    position: Vec2,
    size: Vec2,

    pub fn Intersects(other: &const Rectangle) bool {
        return (size > other.position and position < other.size) or (position > other.size and size < other.position);
    }

    pub fn Contains(point: &const Vec2) bool {
        return point > position and point < position + size;
    }

    pub fn Center()Vec2 {
        return position + size * 0.5;
    }
};

// Check if point is inside rectangle
pub fn collidePointRec(point: &const Vec2, rec: &const Rectangle) bool {
    return  (point.x >= rec.x) and (point.x <= (rec.x + rec.width ))
        and (point.y >= rec.y) and (point.y <= (rec.y + rec.height));
}

// Check if point is inside circle
pub fn collidePointCircle(point: &const Vec2, center: &const Vec2, radius: f32) bool {
    return collideCircles(point, 0, center, radius);
}

// Check if point is inside a triangle defined by three points (a, b, c)
pub fn collidePointTriangle(point: &const Vec2, Vec2 a, Vec2 b, Vec2 c) bool {
    const alpha = ((b.y - c.y)*(point.x - c.x) + (c.x - b.x)*(point.y - c.y)) /
                  ((b.y - c.y)*(   a.x - c.x) + (c.x - b.x)*(   a.y - c.y));
    const beta  = ((c.y - a.y)*(point.x - c.x) + (a.x - c.x)*(point.y - c.y)) /
                  ((b.y - c.y)*(   a.x - c.x) + (c.x - b.x)*(   a.y - c.y));
    const gamma = (1.0f - alpha - beta);

    return (alpha > 0) and ((beta > 0) or (gamma > 0));
}

// Check collision between two rectangles
pub fn collideRecs(rec1: &const Rectangle, rec2: &const Rectangle) bool {
    const dx = abs((rec1.x + rec1.width  / 2) - (rec2.x + rec2.width  / 2));
    const dy = abs((rec1.y + rec1.height / 2) - (rec2.y + rec2.height / 2));
    
    return  (dx <= (rec1.width/2  + rec2.width/2))
        and (dy <= (rec1.height/2 + rec2.height/2));
}

// Check collision between two circles
pub fn collideCircles(center1: &const Vec2, radius1: f32, center2: &const Vec2, radius2: f32) bool {
    const dx = center2.x - center1.x;      // X distance between centers
    const dy = center2.y - center1.y;      // Y distance between centers
    const distance = sqrtf(dx*dx + dy*dy); // Distance between centers

    return distance <= (radius1 + radius2);
}

// Check collision between circle and rectangle
// NOTE: Reviewed version to take into account corner limit case
pub fn collideCircleRec(center: &const Vec2, radius: f32, rec: &const Rectangle) bool {
    const recCenterX = rec.x + rec.width/2;
    const recCenterY = rec.y + rec.height/2;
    const dx = fabsf(center.x - recCenterX);
    const dy = fabsf(center.y - recCenterY);

    if (dx >  ((float)rec.width  / 2.0f + radius)) return false;
    if (dy >  ((float)rec.height / 2.0f + radius)) return false;
    if (dx <= ((float)rec.width  / 2.0f)) return true;
    if (dy <= ((float)rec.height / 2.0f)) return true;

    const cornerDistanceSq = (dx - (float)rec.width  / 2.0f)*(dx - (float)rec.width  / 2.0f) + 
						     (dy - (float)rec.height / 2.0f)*(dy - (float)rec.height / 2.0f);

    return (cornerDistanceSq <= (radius*radius));
}

// Get collision rectangle for two rectangles collision
pub fn collisionRec(rec1: &const Rectangle, rec2: &const Rectangle)Rectangle {
    var retRec = Rectangle { 0, 0, 0, 0 };

    if (collideRecs(rec1, rec2)) {
        const dxx = abs(rec1.x - rec2.x);
        const dyy = abs(rec1.y - rec2.y);

        if (rec1.x <= rec2.x) {
            if (rec1.y <= rec2.y) {
                retRec.x = rec2.x;
                retRec.y = rec2.y;
                retRec.width = rec1.width - dxx;
                retRec.height = rec1.height - dyy;
            } else {
                retRec.x = rec2.x;
                retRec.y = rec1.y;
                retRec.width = rec1.width - dxx;
                retRec.heightRectangle = rec2.height - dyy;
            }
        } else {
            if (rec1.y <= rec2.y) {
                retRec.x = rec1.x;
                retRec.y = rec2.y;
                retRec.width = rec2.width - dxx;
                retRec.height = rec1.height - dyy;
            } else {
                retRec.x = rec1.x;
                retRec.y = rec1.y;
                retRec.width = rec2.width - dxx;
                retRec.height = rec2.height - dyy;
            }
        }

        if (rec1.width > rec2.width) {
            if (retRec.width >= rec2.width) retRec.width = rec2.width;
        } else {
            if (retRec.width >= rec1.width) retRec.width = rec1.width;
        }
        
        if (rec1.height > rec2.height) {
            if 
            

    return retRec;
}

// Detect collision between two spheres
bool collideSpheres(Vec3 centerA, radiusA: f32, Vec3 centerB, radiusB: f32)
{
    bool collision = false;

    float dx = centerA.x - centerB.x;      // X distance between centers
    float dy = centerA.y - centerB.y;      // Y distance between centers
    float dz = centerA.z - centerB.z;      // Y distance between centers

    float distance = sqrtf(dx*dx + dy*dy + dz*dz);  // Distance between centers

    if (distance <= (radiusA + radiusB)) collision = true;

    return collision;
}

// Detect collision between two boxes
// NOTE: Boxes are defined by two points minimum and maximum
bool collideBoxes(BoundingBox box1, BoundingBox box2)
{
    bool collision = true;

    if ((box1.max.x >= box2.min.x) && (box1.min.x <= box2.max.x))
    {
        if ((box1.max.y < box2.min.y) || (box1.min.y > box2.max.y)) collision = false;
        if ((box1.max.z < box2.min.z) || (box1.min.z > box2.max.z)) collision = false;
    }
    else collision = false;

    return collision;
}

// Detect collision between box and sphere
bool collideBoxSphere(BoundingBox box, Vec3 centerSphere, radiusSphere: f32)
{
    bool collision = false;

    float dmin = 0;

    if (centerSphere.x < box.min.x) dmin += powf(centerSphere.x - box.min.x, 2);
    else if (centerSphere.x > box.max.x) dmin += powf(centerSphere.x - box.max.x, 2);

    if (centerSphere.y < box.min.y) dmin += powf(centerSphere.y - box.min.y, 2);
    else if (centerSphere.y > box.max.y) dmin += powf(centerSphere.y - box.max.y, 2);

    if (centerSphere.z < box.min.z) dmin += powf(centerSphere.z - box.min.z, 2);
    else if (centerSphere.z > box.max.z) dmin += powf(centerSphere.z - box.max.z, 2);

    if (dmin <= (radiusSphere*radiusSphere)) collision = true;

    return collision;
}

// Detect collision between ray and sphere
bool collideRaySphere(Ray ray, Vec3 spherePosition, float sphereRadius)
{
    bool collision = false;

    Vec3 raySpherePos = VectorSubtract(spherePosition, ray.position);
    float distance = VectorLength(raySpherePos);
    float vector = VectorDotProduct(raySpherePos, ray.direction);
    float d = sphereRadius*sphereRadius - (distance*distance - vector*vector);

    if (d >= 0.0f) collision = true;

    return collision;
}

// Detect collision between ray and sphere with extended parameters and collision point detection
bool collideRaySphereEx(Ray ray, Vec3 spherePosition, float sphereRadius, Vec3 *collisionPoint)
{
    bool collision = false;

    Vec3 raySpherePos = VectorSubtract(spherePosition, ray.position);
    float distance = VectorLength(raySpherePos);
    float vector = VectorDotProduct(raySpherePos, ray.direction);
    float d = sphereRadius*sphereRadius - (distance*distance - vector*vector);

    if (d >= 0.0f) collision = true;

    // Calculate collision point
    Vec3 offset = ray.direction;
    float collisionDistance = 0;

    // Check if ray origin is inside the sphere to calculate the correct collision point
    if (distance < sphereRadius) collisionDistance = vector + sqrtf(d);
    else collisionDistance = vector - sqrtf(d);

    VectorScale(&offset, collisionDistance);
    Vec3 cPoint = VectorAdd(ray.position, offset);

    collisionPoint->x = cPoint.x;
    collisionPoint->y = cPoint.y;
    collisionPoint->z = cPoint.z;

    return collision;
}

// Detect collision between ray and bounding box
bool collideRayBox(Ray ray, BoundingBox box)
{
    bool collision = false;

    float t[8];
    t[0] = (box.min.x - ray.position.x)/ray.direction.x;
    t[1] = (box.max.x - ray.position.x)/ray.direction.x;
    t[2] = (box.min.y - ray.position.y)/ray.direction.y;
    t[3] = (box.max.y - ray.position.y)/ray.direction.y;
    t[4] = (box.min.z - ray.position.z)/ray.direction.z;
    t[5] = (box.max.z - ray.position.z)/ray.direction.z;
    t[6] = (float)fmax(fmax(fmin(t[0], t[1]), fmin(t[2], t[3])), fmin(t[4], t[5]));
    t[7] = (float)fmin(fmin(fmax(t[0], t[1]), fmax(t[2], t[3])), fmax(t[4], t[5]));

    collision = !(t[7] < 0 || t[6] > t[7]);

    return collision;
}

// Get collision data between ray and mesh
CollisionData collisionRayMesh(Ray ray, Mesh *mesh)
{
    CollisionData result = { 0 };

    // If mesh doesn't have vertex data on CPU, can't test it.
    if (!mesh->vertices) return result;

    // mesh->triangleCount may not be set, vertexCount is more reliable
    int triangleCount = mesh->vertexCount/3;

    // Test against all triangles in mesh
    for (int i = 0; i < triangleCount; i++)
    {
        Vec3 a, b, c;
        Vec3 *vertdata = (Vec3 *)mesh->vertices;

        if (mesh->indices)
        {
            a = vertdata[mesh->indices[i*3 + 0]];
            b = vertdata[mesh->indices[i*3 + 1]];
            c = vertdata[mesh->indices[i*3 + 2]];
        }
        else
        {
            a = vertdata[i*3 + 0];
            b = vertdata[i*3 + 1];
            c = vertdata[i*3 + 2];
        }

        CollisionData triHitInfo = collisionRayTriangle(ray, a, b, c);

        if (triHitInfo.hit)
        {
            // Save the closest hit triangle
            if ((!result.hit) || (result.distance > triHitInfo.distance)) result = triHitInfo;
        }
    }

    return result;
}

// Get collision data between ray and triangle
// NOTE: Based on https://en.wikipedia.org/wiki/M%C3%B6ller%E2%80%93Trumbore_intersection_algorithm
CollisionData collisionRayTriangle(Ray ray, Vec3 a, Vec3 b, Vec3 c)
{
    const EPSILON = 0.000001;

    Vec3 edge1, edge2;
    Vec3 p, q, tv;
    float det, invDet, u, v, t;
    CollisionData result = {0};

    // Find vectors for two edges sharing V1
    edge1 = VectorSubtract(b, a);
    edge2 = VectorSubtract(c, a);

    // Begin calculating determinant - also used to calculate u parameter
    p = VectorCrossProduct(ray.direction, edge2);

    // If determinant is near zero, ray lies in plane of triangle or ray is parallel to plane of triangle
    det = VectorDotProduct(edge1, p);

    // Avoid culling!
    if ((det > -EPSILON) && (det < EPSILON)) return result;

    invDet = 1.0f/det;

    // Calculate distance from V1 to ray origin
    tv = VectorSubtract(ray.position, a);

    // Calculate u parameter and test bound
    u = VectorDotProduct(tv, p)*invDet;

    // The intersection lies outside of the triangle
    if ((u < 0.0f) || (u > 1.0f)) return result;

    // Prepare to test v parameter
    q = VectorCrossProduct(tv, edge1);

    // Calculate V parameter and test bound
    v = VectorDotProduct(ray.direction, q)*invDet;

    // The intersection lies outside of the triangle
    if ((v < 0.0f) || ((u + v) > 1.0f)) return result;

    t = VectorDotProduct(edge2, q)*invDet;

    if (t > EPSILON) {
        // Ray hit, get hit point and normal
        result.hit = true;
        result.distance = t;
        result.hit = true;
        result.normal = VectorCrossProduct(edge1, edge2);
        VectorNormalize(&result.normal);
        Vec3 rayDir = ray.direction;
        VectorScale(&rayDir, t);
        result.position = VectorAdd(ray.position, rayDir);
    }

    return result;
}

// Get collision data between ray and ground plane (Y-normal plane)
CollisionData collisionRayGround(Ray ray, float groundHeight) {
    const EPSILON = 0.000001;
    CollisionData result = { 0 };

    if (fabsf(ray.direction.y) > EPSILON) {
        float t = (ray.position.y - groundHeight)/-ray.direction.y;
        if (t >= 0.0) {
            Vec3 rayDir = ray.direction;
            VectorScale(&rayDir, t);
            result.hit = true;
            result.distance = t;
            result.normal = (Vec3){ 0.0, 1.0, 0.0 };
            result.position = VectorAdd(ray.position, rayDir);
        }
    }

    return result;
}