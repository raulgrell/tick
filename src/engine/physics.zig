const t = @import("../tick.zig");

use tick.core;
use tick.math;
use tick.system;
use tick.graphics;
use tick.graphics.texture;
use tick.engine.scene;

const ArrayList = lib.ArrayList;
const math = std.math;

const MAX_BODIES = 64;
const MAX_MANIFOLDS = 4096;
const MAX_VERTICES = 24;
const CIRCLE_VERTICES = 24;

const DESIRED_DELTATIME = 1.0 / 60.0;
const MAX_TIMESTEP = 0.02;
const COLLISION_ITERATIONS = 100;
const PENETRATION_ALLOWANCE = 0.05;
const PENETRATION_CORRECTION = 0.4;
const EPSILON = 0.000001;

const DEG2RAD = (math.pi/180.0);

const Polygon = struct {
    vertex_count: usize,
    vertices: [MAX_VERTICES]Vec2,
    normals: [MAX_VERTICES]Vec2,
    transform: Mat2,

    fn createPolygon(radius: f32, sides: usize) Polygon {
        var data = Polygon {
            .vertex_count = sides,
            .vertices = undefined,
            .normals = undefined,
            .transform = Mat2Radians(0)
        };

        // Calculate polygon vertices positions
        for (data.vertices[0 .. data.vertex_count]) | v, i | {
            data.vertices[i].x = math.cos( (2*math.pi) / sides * i) * radius;
            data.vertices[i].y = math.sin( (2*math.pi) / sides * i) * radius;
        }

        // Calculate polygon faces normals
        for (data.vertices[0 .. data.vertex_count]) | v, i | {
            const next_index = if ((i + 1) < sides) i + 1 else 0;
            const face = data.vertices[next_index].sub(data.vertices[i]);
            data.normals[i] = vec2(face.y, -face.x).normalize();
        }

        return data;
    }

    // Creates a rectangle polygon shape based on a min and max positions
    fn createRectanglePolygon(pos: Vec2, size: Vec2) Polygon {
        var data = Polygon {
            .vertex_count = 4,
            .vertices = undefined,
            .normals = undefined,
            .transform = Mat2Radians(0)
        };

        data.vertex_count = 4;
        data.transform = Mat2Radians(0);

        // Calculate polygon vertices positions
        data.vertices[0] = vec2(pos.x + size.x/2, pos.y - size.y/2);
        data.vertices[1] = vec2(pos.x + size.x/2, pos.y + size.y/2);
        data.vertices[2] = vec2(pos.x - size.x/2, pos.y + size.y/2);
        data.vertices[3] = vec2(pos.x - size.x/2, pos.y - size.y/2);

        // Calculate polygon faces normals
        for (data.vertices[0 .. data.vertex_count]) {
            const next_index = if ((i + 1) < data.vertex_count) i + 1 else 0;
            const face = data.vertices[next_index].sub(data.vertices[i]);
            data.normals[i] = vec2(face.y, -face.x).normalize();
        }

        return data;
    }
};

const PhysicsShapeType = enum {
    Circle: struct {
        radius: f32,
    },
    Polygon: struct {
        vertex_data: *Polygon
    }
};

const PhysicsShape = struct {
    body: *PhysicsBody,                 // Shape physics body reference
    type: *PhysicsShapeType,            // Physics shape type (circle or polygon)

    // Returns the extreme point along a direction within a polygon
    fn getSupport(shape: PhysicsShape, dir: Vec2)Vec2 {
        const bestProjection = -FLT_MAX;
        var bestVertex: Vec2 = undefined;
        const data = shape.vertexData;

        for (data.vertices[0 .. data.vertex_count]) {
            const vertex = data.vertices[i];
            const projection = Vec2.dot(vertex, dir);

            if (projection > bestProjection) {
                bestVertex = vertex;
                bestProjection = projection;
            }
        }

        return bestVertex;
    }

    // Finds polygon shapes axis least penetration
    fn findAxisLeastPenetration(face_index: *usize, shapeA: PhysicsShape, shapeB: PhysicsShape)float {
        const bestDistance = -FLT_MAX;
        var bestIndex: usize = 0;

        const dataA = shapeA.vertexData;
        const dataB = shapeB.vertexData;

        for (dataA.vertices) {
            // Retrieve a face normal from A shape
            var normal = dataA.normals[i];
            const transNormal = Mat2.mul_vec(dataA.transform, normal);

            // Transform face normal into B shape's model space
            const buT = Mat2Transpose(dataB.transform);
            normal = Mat2.mul_vec(buT, transNormal);

            // Retrieve support point from B shape along -n
            const support = GetSupport(shapeB, vec2(-normal.x, -normal.y ));

            // Retrieve vertex on face from A shape, transform into B shape's model space
            var vertex = dataA.vertices[i];
            vertex = Mat2.mul_vec(dataA.transform, vertex);
            vertex = Vec2.add(vertex, shapeA.body.position);
            vertex = Vec2.sub(vertex, shapeB.body.position);
            vertex = Mat2.mul_vec(buT, vertex);

            // Compute penetration distance in B shape's model space
            const distance = Vec2.dot(normal, Vec2.sub(support, vertex));

            // Store greatest distance
            if (distance > bestDistance) {
                bestDistance = distance;
                bestIndex = i;
            }
        }

        *face_index = bestIndex;
        return bestDistance;
    }

    // Finds two polygon shapes incident face
    fn findIncidentFace(v0: *Vec2, v1: *Vec2, ref: PhysicsShape, inc: PhysicsShape, index: usize) void {
        const refData = ref.vertexData;
        const incData = inc.vertexData;

        var referenceNormal = refData.normals[index];

        // Calculate normal in incident's frame of reference
        referenceNormal = Mat2.mul_vec(refData.transform, referenceNormal); // To world space
        referenceNormal = Mat2.mul_vec(Mat2Transpose(incData.transform), referenceNormal); // To incident's model space

        // Find most anti-normal face on polygon
        var incidentFace = 0;
        var minDot = FLT_MAX;

        for (incData.vertices) {
            const dot = Vec2.dot(referenceNormal, incData.normals[i]);

            if (dot < minDot) {
                minDot = dot;
                incidentFace = i;
            }
        }

        // Assign face vertices for incident face
        *v0 = Mat2.mul_vec(incData.transform, incData.vertices[incidentFace]);
        *v0 = Vec2.add(*v0, inc.body.position);
        incidentFace = if((incidentFace + 1) < incData.vertex_count) incidentFace + 1 else 0;
        *v1 = Mat2.mul_vec(incData.transform, incData.vertices[incidentFace]);
        *v1 = Vec2.add(*v1, inc.body.position);
    }

    // Calculates clipping based on a normal and two faces
    fn clip(normal: Vec2, clip: f32, faceA: *Vec2, faceB: *Vec2)usize {
        var sp = 0;
        var out = [2]Vec2 { *faceA, *faceB };

        // Retrieve distances from each endpoint to the line
        const distanceA = Vec2.dot(normal, *faceA) - clip;
        const distanceB = Vec2.dot(normal, *faceB) - clip;

        // If negative (behind plane)
        if (distanceA <= 0) { 
            out[sp] = *faceA;
            sp += 1;
        }
        if (distanceB <= 0) { 
            out[sp] = *faceB;
            sp += 1;
        }   

        // If the points are on different sides of the plane
        if ((distanceA*distanceB) < 0) {
            // Push intersection point
            const alpha = distanceA/(distanceA - distanceB);
            out[sp] = *faceA;
            var delta = Vec2.sub(*faceB, *faceA);
            delta.x *= alpha;
            delta.y *= alpha;
            out[sp] = Vec2.add(out[sp], delta);
            sp += 1;
        }

        // Assign the new converted values
        *faceA = out[0];
        *faceB = out[1];

        return sp;
    }
};

const PhysicsBody = struct {
    id: uint,                          // Reference unique identifier
    enabled: bool,                     // Enabled dynamics state (collisions are calculated anyway)
    position: Vec2,                    // Physics body shape pivot
    velocity: Vec2,                    // Current linear velocity applied to position
    force: Vec2,                       // Current linear force (reset to 0 every step)
    angularVelocity: float,            // Current angular velocity applied to orient
    torque: float,                     // Current angular force (reset to 0 every step)
    orient: float,                     // Rotation in radians
    inertia: float,                    // Moment of inertia
    inverseInertia: float,             // Inverse value of inertia
    mass: float,                       // Physics body mass
    inverseMass: float,                // Inverse value of mass
    staticFriction: float,             // Friction when the body has not movement (0 to 1)
    dynamicFriction: float,            // Friction when the body has movement (0 to 1)
    restitution: float,                // Restitution coefficient of the body (0 to 1)
    useGravity: bool,                  // Apply gravity force to dynamics
    isGrounded: bool,                  // Physics grounded on other body state
    freezeOrient: bool,                // Physics rotation constraint
    shape: PhysicsShape,               // Physics body shape information (type, radius, vertices, normals)

    pub fn circle(pos: *const Vec2, radius: f32, density: f32)PhysicsBody {
        return Polygon(pos, radius, CIRCLE_VERTICES, density);
    }

    pub fn rectangle(pos: *const Vec2, width: f32, height: f32, density: f32)PhysicsBody {
        var new_body: PhysicsBody = undefined;
        
        new_body.id = newId;
        new_body.enabled = true;
        new_body.position = pos;    
        new_body.velocity = vec2(0, 0);
        new_body.force = vec2(0, 0);
        new_body.angularVelocity = 0;
        new_body.torque = 0;
        new_body.orientation = 0;
        new_body.shape.type = PhysicsShapeType.Polygon;
        new_body.shape.body = new_body;
        new_body.shape.vertexData = CreateRectanglePolygon(pos, vec2(width, height));

        // Calculate centroid and moment of inertia
        var center = vec2(0,0);
        var area = 0;
        var inertia = 0;
        const k = 1.0/3.0;

        for (new_body.shape.vertexData.vertices) | vert, i | {
            // Triangle vertices, third vertex implied as (0, 0)
            const p1 = new_body.shape.vertexData.vertices[i];
            const next_index = if ((i + 1) < new_body.shape.vertexData.vertex_count) i + 1 else 0;
            const p2 = new_body.shape.vertexData.vertices[next_index];

            const D = Vec2.cross(p1, p2);
            const triangle_area = D/2;

            area += triangle_area;

            // Use area to weight the centroid average, not just vertex position
            center.x += triangle_area*k*(p1.x + p2.x);
            center.y += triangle_area*k*(p1.y + p2.y);

            const intx2 = p1.x*p1.x + p2.x*p1.x + p2.x*p2.x;
            const inty2 = p1.y*p1.y + p2.y*p1.y + p2.y*p2.y;
            inertia += (0.25*k*D)*(intx2 + inty2);
        }

        center.x *= 1.0/area;
        center.y *= 1.0/area;

        // Translate vertices to centroid (make the centroid (0, 0) for the polygon in model space)
        // Note: this is not really necessary
        for (new_body.shape.vertexData.vertices) | vert, i | {
            new_body.shape.vertexData.vertices[i].x -= center.x;
            new_body.shape.vertexData.vertices[i].y -= center.y;
        }

        new_body.mass = density*area;
        new_body.inverseMass = if (new_body.mass != 0.0) 1.0/new_body.mass else 0.0;
        new_body.inertia = density*inertia;
        new_body.inverseInertia = if(new_body.inertia != 0.0) 1.0/new_body.inertia else 0.0;
        new_body.staticFriction = 0.4;
        new_body.dynamicFriction = 0.2;
        new_body.restitution = 0;
        new_body.useGravity = true;
        new_body.isGrounded = false;
        new_body.freezeOrient = false;

        // Add new body to bodies pointers array and update bodies count
        bodies[physicsBodiesCount] = new_body;
        physicsBodiesCount += 1;
        usedMemory += @sizeOf(PhysicsBody);        

        return new_body;
    }

    // Creates a new polygon physics body with generic parameters
    pub fn polygon(pos: *const Vec2, width: f32, height: f32, density: f32)PhysicsBody  {
        var new_body: PhysicsBody = undefined;

        // Initialize new body with generic values
        new_body.id = newId;
        new_body.enabled = true;
        new_body.position = pos;    
        new_body.velocity = vec2(0, 0);
        new_body.force = vec2(0, 0);
        new_body.angularVelocity = 0;
        new_body.torque = 0;
        new_body.orientation = 0;
        new_body.shape.type = PhysicsShapeType.Polygon;
        new_body.shape.body = new_body;
        new_body.shape.vertexData = CreatePolygon(radius, sides);

        // Calculate centroid and moment of inertia
        var center = vec2(0,0);
        var area = 0;
        var inertia = 0;
        const alpha = 1.0/3.0;

        for (new_body.shape.vertexData.vertices) | vert, i | {
            // Triangle vertices, third vertex implied as (0, 0)
            const position1 = new_body.shape.vertexData.vertices[i];
            const next_index = if ((i + 1) < new_body.shape.vertexData.vertex_count) i + 1 else 0;
            const position2 = new_body.shape.vertexData.vertices[next_index];

            const cross = Vec2.cross(position1, position2);
            const triangle_area = cross/2;

            area += triangle_area;

            // Use area to weight the centroid average, not just vertex position
            center.x += triangle_area*alpha*(position1.x + position2.x);
            center.y += triangle_area*alpha*(position1.y + position2.y);

            const intx2 = position1.x*position1.x + position2.x*position1.x + position2.x*position2.x;
            const inty2 = position1.y*position1.y + position2.y*position1.y + position2.y*position2.y;
            inertia += (0.25*alpha*cross)*(intx2 + inty2);
        }

        center.x *= 1.0/area;
        center.y *= 1.0/area;

        // Translate vertices to centroid (make the centroid (0, 0) for the polygon in model space)
        // Note: this is not really necessary
        for (new_body.shape.vertexData.vertices) | vert, i | {
            new_body.shape.vertexData.vertices[i].x -= center.x;
            new_body.shape.vertexData.vertices[i].y -= center.y;
        }

        new_body.mass = density*area;
        new_body.inverseMass = if (new_body.mass != 0.0) 1.0/new_body.mass else 0.0;
        new_body.inertia = density*inertia;
        new_body.inverseInertia = if(new_body.inertia != 0.0) 1.0/new_body.inertia else 0.0;
        new_body.staticFriction = 0.4;
        new_body.dynamicFriction = 0.2;
        new_body.restitution = 0;
        new_body.useGravity = true;
        new_body.isGrounded = false;
        new_body.freezeOrient = false;

        // Add new body to bodies pointers array and update bodies count
        bodies[physicsBodiesCount] = new_body;
        physicsBodiesCount += 1;
        usedMemory += @sizeOf(PhysicsBody);

        return new_body;
    }

    // Adds a force to a physics body
    pub fn physicsAddForce(body: PhysicsBody, force: Vec2) void {
        body.force = Vec2.add(body.force, force);
    }

    // Adds an angular force to a physics body
    pub fn physicsAddTorque(body: PhysicsBody, amount: float) void {
        body.torque += amount;
    }

    // Returns transformed position of a body shape (body position + vertex transformed position)
    pub fn getPhysicsShapeVertex(body: PhysicsBody, vertex_index: usize)Vec2 {
        var position: Vec2 = undefined;
        switch (body.shape.type) {
            PhysicsShapeType.Circle => {
                position.x = body.position.x + math.cos(360/CIRCLE_VERTICES*vertex*DEG2RAD)*body.shape.radius;
                position.y = body.position.y + math.sin(360/CIRCLE_VERTICES*vertex*DEG2RAD)*body.shape.radius;
            },
            PhysicsShapeType.Polygon => {
                var vertexData = body.shape.vertexData;
                position = Vec2.add(body.position, Mat2.mul_vec(vertexData.transform, vertexData.vertices[vertex_index]));
            }
        }
        return position;
    }

    // Sets physics body shape transform based on radians parameter
    pub fn setPhysicsBodyRotation(body: PhysicsBody, radians: float) void {
        body.orientation = radians;
        if (body.shape.type == PhysicsShapeType.Polygon)
            body.shape.vertexData.transform = Mat2Radians(radians);
    }

    // Uninitializes and destroys a physics body
    pub fn destroyPhysicsBody(body: PhysicsBody) void {
        const id = body.id;
        var index = -1;

        for (physicsBodies) | b, i | {
            if (bodies[i].id == id) {
                index = i;
                break;
            }
        }

        // Free body allocated memory
        FREE(bodies[index]);
        usedMemory -= @sizeOf(PhysicsBody);
        bodies[index] = null;

        // Reorder physics bodies pointers array and its catched index
        for (physicsBodies) | b, i | {
            if ((i + 1) < physicsBodiesCount) bodies[i] = bodies[i + 1];
        }

        // Update physics bodies count
        physicsBodiesCount -= 1;
    }

    // Returns the current amount of created physics bodies
    pub fn getPhysicsBodiesCount(void)usize {
        return physicsBodiesCount;
    }

    // Returns a physics body of the bodies pool at a specific index
    pub fn getPhysicsBody(index: usize) !PhysicsBody {
        if (index < physicsBodiesCount) {
            return bodies[index];
        } else {
            return error.NotFound;
        }
    }

    // Returns the physics body shape type (PhysicsShapeType.Circle or PhysicsShapeType.Polygon)
    pub fn getPhysicsShape(index: usize) !PhysicsShapeType {
        if (index < physicsBodiesCount) {
            return bodies[index].shape.type;
        } else {
            return error.NotFound;
        }
    }

    // Returns the amount of vertices of a physics body shape
    pub fn getPhysicsShapeVerticesCount(index: usize)usize {
        if (index < physicsBodiesCount) {
            const body: PhysicsBody = bodies[index];
            switch (body.shape.type) {
                PhysicsShapeType.Circle => return CIRCLE_VERTICES,
                PhysicsShapeType.Polygon => return body.shape.vertexData.vertex_count
            }
        } else {
            return error.NotFound;
        }
    }

    // Integrates physics velocity into position and forces
    fn integratePhysicsVelocity(body: PhysicsBody) void {
        if (!body.enabled) return;

        body.position.x += body.velocity.x*deltaTime;
        body.position.y += body.velocity.y*deltaTime;

        if (!body.freezeOrient) body.orientation += body.angularVelocity*deltaTime;
        Mat2Set(&body.shape.vertexData.transform, body.orientation);

        IntegratePhysicsForces(body);
    }

    // Integrates physics forces into velocity
    fn integratePhysicsForces(body: PhysicsBody) void {
        if (body.inverseMass == 0 or !body.enabled) return;

        body.velocity.x += (body.force.x*body.inverseMass)*(deltaTime/2);
        body.velocity.y += (body.force.y*body.inverseMass)*(deltaTime/2);

        if (body.useGravity) {
            body.velocity.x += gravityForce.x*(deltaTime/2);
            body.velocity.y += gravityForce.y*(deltaTime/2);
        }

        if (!body.freezeOrient) 
            body.angularVelocity += body.torque*body.inverseInertia*(deltaTime/2);
    }

};

const PhysicsManifold = struct {
    id: uint,                          // Reference unique identifier
    bodyA: PhysicsBody,                // Manifold first physics body reference
    bodyB: PhysicsBody,                // Manifold second physics body reference
    penetration: float,                // Depth of penetration from collision
    normal: Vec2,                      // Normal direction vector from 'a' to 'b'
    contacts: [2]Vec2,                 // Points of contact during collision
    contactsCount: uint,               // Current collision number of contacts
    restitution: float,                // Mixed restitution during collision
    dynamicFriction: float,            // Mixed dynamic friction during collision
    staticFriction: float,             // Mixed static during collisionfriction

    // Creates a new physics manifold to solve collision
    fn createPhysicsManifold(a: PhysicsBody, b: PhysicsBody)PhysicsManifold {
        var new_manifold: PhysicsManifold = undefined;
        
        // Initialize new manifold with generic values
        new_manifold.id = newId;
        new_manifold.bodyA = a;
        new_manifold.bodyB = b;
        new_manifold.penetration = 0;
        new_manifold.normal = vec2(0, 0);
        new_manifold.contacts[0] = vec2(0, 0);
        new_manifold.contacts[1] = vec2(0, 0);
        new_manifold.contactsCount = 0;
        new_manifold.restitution = 0;
        new_manifold.dynamicFriction = 0;
        new_manifold.staticFriction = 0;
        
        // Add new body to bodies pointers array and update bodies count
        contacts[physicsManifoldsCount] = new_manifold;
        physicsManifoldsCount += 1;
        usedMemory += @sizeOf(PhysicsManifold);

        return new_manifold;
    }

    // Uninitializes and destroys a physics manifold
    fn destroyPhysicsManifold(manifold: PhysicsManifold) void {
        const id = manifold.id;
        var index: usize = -1;

        for (physicsManifolds) | m, i | {
            if (contacts[i].id == id) {
                index = i;
                break;
            }
        }

        // Free manifold allocated memory
        FREE(contacts[index]);
        usedMemory -= @sizeOf(PhysicsManifold);
        contacts[index] = null;

        // Reorder physics manifolds pointers array and its catched index
        for (physicsManifolds[index..physicsManifoldsCount]) {
            contacts[i] = contacts[i + 1];
        }

        // Update physics manifolds count
        physicsManifoldsCount -= 1;
    }

    // Solves a created physics manifold between two physics bodies
    fn solvePhysicsManifold(manifold: PhysicsManifold) void {
        switch (manifold.bodyA.shape.type) {
            PhysicsShapeType.Circle => {
                switch (manifold.bodyB.shape.type) {
                    PhysicsShapeType.Circle => SolveCircleToCircle(manifold),
                    PhysicsShapeType.Polygon => SolveCircleToPolygon(manifold),
                }
            },
            PhysicsShapeType.Polygon => {
                switch (manifold.bodyB.shape.type) {
                    PhysicsShapeType.Circle => SolvePolygonToCircle(manifold),
                    PhysicsShapeType.Polygon => SolvePolygonToPolygon(manifold)
                }
            } 
        }

        // Update physics body grounded state if normal direction is downside
        manifold.bodyB.isGrounded = (manifold.normal.y < 0);
    }

    // Solves collision between two circle shape physics bodies
    fn solveCircleToCircle(manifold: PhysicsManifold) void {
        const bodyA: PhysicsBody = manifold.bodyA;
        const bodyB: PhysicsBody = manifold.bodyB;

        // Calculate translational vector, which is normal
        const normal = Vec2.sub(bodyB.position, bodyA.position);

        const dist_sqr = MathLenSqr(normal);
        const radius: f32 = bodyA.shape.radius + bodyB.shape.radius;

        // Check if circles are not in contact
        if (dist_sqr >= radius*radius) {
            manifold.contactsCount = 0;
            return;
        }

        const distance = math.sqrt(dist_sqr);
        manifold.contactsCount = 1;

        if (distance == 0) {
            manifold.penetration = bodyA.shape.radius;
            manifold.normal = (Vec2){ 1, 0 };
            manifold.contacts[0] = bodyA.position;
        } else {
            manifold.penetration = radius - distance;
            manifold.normal = (Vec2){ normal.x/distance, normal.y/distance }; // Faster than using MathNormalize() due to sqrt is already performed
            manifold.contacts[0] = (Vec2){ manifold.normal.x*bodyA.shape.radius + bodyA.position.x, manifold.normal.y*bodyA.shape.radius + bodyA.position.y };
        }

        // Update physics body grounded state if normal direction is down
        if (manifold.normal.y < 0) bodyA.isGrounded = true;
    }

    // Solves collision between a circle to a polygon shape physics bodies
    fn solveCircleToPolygon(manifold: PhysicsManifold) void {
        const bodyA: PhysicsBody = manifold.bodyA;
        const bodyB: PhysicsBody = manifold.bodyB;

        manifold.contactsCount = 0;

        // Transform circle center to polygon transform space
        var center = bodyA.position;
        center = Mat2.mul_vec(Mat2Transpose(bodyB.shape.vertexData.transform), Vec2.sub(center, bodyB.position));

        // Find edge with minimum penetration
        // It is the same concept as using support points in SolvePolygonToPolygon
        const separation = -FLT_MAX;
        var faceNormal = 0;
        const vertexData = bodyB.shape.vertexData;

        for (vertexData.vertices) | v, i | {
            const currentSeparation = Vec2.dot(vertexData.normals[i], Vec2.sub(center, vertexData.vertices[i]));

            if (currentSeparation > bodyA.shape.radius) return;

            if (currentSeparation > separation) {
                separation = currentSeparation;
                faceNormal = i;
            }
        }

        // Grab face's vertices
        const v1 = vertexData.vertices[faceNormal];
        const next_index = if ((faceNormal + 1) < vertexData.vertex_count) faceNormal + 1 else 0;
        const v2 = vertexData.vertices[next_index];

        // Check to see if center is within polygon
        if (separation < EPSILON) {
            manifold.contactsCount = 1;
            const normal = Mat2.mul_vec(vertexData.transform, vertexData.normals[faceNormal]);
            manifold.normal = (Vec2){ -normal.x, -normal.y };
            manifold.contacts[0] = (Vec2){ manifold.normal.x*bodyA.shape.radius + bodyA.position.x, manifold.normal.y*bodyA.shape.radius + bodyA.position.y };
            manifold.penetration = bodyA.shape.radius;
            return;
        }

        // Determine which voronoi region of the edge center of circle lies within
        const dot1 = Vec2.dot(Vec2.sub(center, v1), Vec2.sub(v2, v1));
        const dot2 = Vec2.dot(Vec2.sub(center, v2), Vec2.sub(v1, v2));
        manifold.penetration = bodyA.shape.radius - separation;

        if (dot1 <= 0) {        
            // Closest to v1
            if (dist_sqr(center, v1) > bodyA.shape.radius*bodyA.shape.radius) return;

            manifold.contactsCount = 1;
            var normal = Vec2.sub(v1, center);
            normal = Mat2.mul_vec(vertexData.transform, normal);
            MathNormalize(&normal);
            manifold.normal = normal;
            v1 = Mat2.mul_vec(vertexData.transform, v1);
            v1 = Vec2.add(v1, bodyB.position);
            manifold.contacts[0] = v1;
        } else if (dot2 <= 0) {
            // Closest to v2
            if (dist_sqr(center, v2) > bodyA.shape.radius*bodyA.shape.radius) return;

            manifold.contactsCount = 1;
            var normal = Vec2.sub(v2, center);
            v2 = Mat2.mul_vec(vertexData.transform, v2);
            v2 = Vec2.add(v2, bodyB.position);
            manifold.contacts[0] = v2;
            normal = Mat2.mul_vec(vertexData.transform, normal);
            MathNormalize(&normal);
            manifold.normal = normal;
        } else {
            // Closest to face 
            var normal = vertexData.normals[faceNormal];

            if (Vec2.dot(Vec2.sub(center, v1), normal) > bodyA.shape.radius) return;

            normal = Mat2.mul_vec(vertexData.transform, normal);
            manifold.normal = (Vec2){ -normal.x, -normal.y };
            manifold.contacts[0] = (Vec2){ manifold.normal.x*bodyA.shape.radius + bodyA.position.x, manifold.normal.y*bodyA.shape.radius + bodyA.position.y };
            manifold.contactsCount = 1;
        }
    }

    // Solves collision between a polygon to a circle shape physics bodies
    fn solvePolygonToCircle(manifold: PhysicsManifold) void {
        const bodyA: PhysicsBody = manifold.bodyA;
        const bodyB: PhysicsBody = manifold.bodyB;

        manifold.bodyA = bodyB;
        manifold.bodyB = bodyA;
        SolveCircleToPolygon(manifold);

        manifold.normal.x *= -1;
        manifold.normal.y *= -1;
    }

    // Solves collision between two polygons shape physics bodies
    fn solvePolygonToPolygon(manifold: PhysicsManifold) void {
        const bodyA = manifold.bodyA.shape;
        const bodyB = manifold.bodyB.shape;
        manifold.contactsCount = 0;

        // Check for separating axis with A shape's face planes
        var faceA = 0;
        const penetrationA = FindAxisLeastPenetration(&faceA, bodyA, bodyB);
        if (penetrationA >= 0) return;

        // Check for separating axis with B shape's face planes
        var faceB = 0;
        const penetrationB = FindAxisLeastPenetration(&faceB, bodyB, bodyA);
        if (penetrationB >= 0) return;

        var referenceIndex = 0;
        var flip = false;  // Always point from A shape to B shape

        var refPoly: PhysicsShape = undefined; // Reference
        var incPoly: PhysicsShape = undefined; // Incident

        // Determine which shape contains reference face
        if (BiasGreaterThan(penetrationA, penetrationB)) {
            refPoly = bodyA;
            incPoly = bodyB;
            referenceIndex = faceA;
        } else {
            refPoly = bodyB;
            incPoly = bodyA;
            referenceIndex = faceB;
            flip = true;
        }

        // World space incident face
        var incidentFace: [2]Vec2 = undefined;
        FindIncidentFace(&incidentFace[0], &incidentFace[1], refPoly, incPoly, referenceIndex);

        // Setup reference face vertices
        var refData = refPoly.vertexData;
        var v1 = refData.vertices[referenceIndex];
        referenceIndex = if ((referenceIndex + 1) < refData.vertex_count) referenceIndex + 1 else 0;
        var v2 = refData.vertices[referenceIndex];

        // Transform vertices to world space
        v1 = Mat2.mul_vec(refData.transform, v1);
        v1 = Vec2.add(v1, refPoly.body.position);
        v2 = Mat2.mul_vec(refData.transform, v2);
        v2 = Vec2.add(v2, refPoly.body.position);

        // Calculate reference face side normal in world space
        const sidePlaneNormal = Vec2.sub(v2, v1);
        MathNormalize(&sidePlaneNormal);

        // Orthogonalize
        const refFaceNormal = vec2(sidePlaneNormal.y, -sidePlaneNormal.x);
        const refC = Vec2.dot(refFaceNormal, v1);
        const negSide = Vec2.dot(sidePlaneNormal, v1)*-1;
        const posSide = Vec2.dot(sidePlaneNormal, v2);

        // Clip incident face to reference face side planes (due to floating point error, possible to not have required points
        if (Clip((Vec2){ -sidePlaneNormal.x, -sidePlaneNormal.y }, negSide, &incidentFace[0], &incidentFace[1]) < 2) return;
        if (Clip(sidePlaneNormal, posSide, &incidentFace[0], &incidentFace[1]) < 2) return;

        // Flip normal if required
        manifold.normal = if (flip) vec2(-refFaceNormal.x, -refFaceNormal.y) else refFaceNormal;

        // Keep points behind reference face
        var currentPoint = 0; // Clipped points behind reference face
        const separation = Vec2.dot(refFaceNormal, incidentFace[0]) - refC;
        if (separation <= 0) {
            manifold.contacts[currentPoint] = incidentFace[0];
            manifold.penetration = -separation;
            currentPoint += 1;
        } else {
            manifold.penetration = 0;
        } 

        separation = Vec2.dot(refFaceNormal, incidentFace[1]) - refC;

        if (separation <= 0) {
            manifold.contacts[currentPoint] = incidentFace[1];
            manifold.penetration += -separation;
            currentPoint += 1;

            // Calculate total penetration average
            manifold.penetration /= currentPoint;
        }

        manifold.contactsCount = currentPoint;
    }

    // Initializes physics manifolds to solve collisions
    fn initializePhysicsManifolds(manifold: PhysicsManifold) void {
        const bodyA: PhysicsBody = manifold.bodyA;
        const bodyB: PhysicsBody = manifold.bodyB;

        manifold.restitution = math.sqrt(bodyA.restitution*bodyB.restitution);
        manifold.staticFriction = math.sqrt(bodyA.staticFriction*bodyB.staticFriction);
        manifold.dynamicFriction = math.sqrt(bodyA.dynamicFriction*bodyB.dynamicFriction);

        for (2) {
            // Caculate radius from center of mass to contact
            const radiusA = Vec2.sub(manifold.contacts[i], bodyA.position);
            const radiusB = Vec2.sub(manifold.contacts[i], bodyB.position);

            const crossA = Vec2.cross(bodyA.angularVelocity, radiusA);
            const crossB = Vec2.cross(bodyB.angularVelocity, radiusB);

            var radiusV: Vec2 = undefined;
            radiusV.x = bodyB.velocity.x + crossB.x - bodyA.velocity.x - crossA.x;
            radiusV.y = bodyB.velocity.y + crossB.y - bodyA.velocity.y - crossA.y;

            // Determine if we should perform a resting collision or not;
            // The idea is if the only thing moving this object is gravity, then the collision should be performed without any restitution
            if (MathLenSqr(radiusV) < (MathLenSqr( vec2(gravityForce.x*deltaTime, gravityForce.y*deltaTime) + EPSILON)))
                manifold.restitution = 0;
        }
    }

    // Integrates physics collisions impulses to solve collisions
    fn integratePhysicsImpulses(manifold: PhysicsManifold) void {
        const bodyA: PhysicsBody = manifold.bodyA;
        const bodyB: PhysicsBody = manifold.bodyB;

        // Early out and pos_al correct if both objects have infinite mass
        if (fabs(bodyA.inverseMass + bodyB.inverseMass) <= EPSILON) {
            bodyA.velocity = vec2(0, 0);        
            bodyB.velocity = vec2(0, 0);
            return;
        }

        for (manifold.contacts) | con, i | {
            // Calculate radius from center of mass to contact
            const radiusA = Vec2.sub(manifold.contacts[i], bodyA.position);
            const radiusB = Vec2.sub(manifold.contacts[i], bodyB.position);

            // Calculate relative velocity
            var radiusV: Vec2 = undefined;
            radiusV.x = bodyB.velocity.x + Vec2.cross(bodyB.angularVelocity, radiusB).x - bodyA.velocity.x - Vec2.cross(bodyA.angularVelocity, radiusA).x;
            radiusV.y = bodyB.velocity.y + Vec2.cross(bodyB.angularVelocity, radiusB).y - bodyA.velocity.y - Vec2.cross(bodyA.angularVelocity, radiusA).y;

            // Relative velocity along the normal
            const contactVelocity = Vec2.dot(radiusV, manifold.normal);

            // Do not resolve if velocities are separating
            if (contactVelocity > 0) return;

            const raCrossN = Vec2.cross(radiusA, manifold.normal);
            const rbCrossN = Vec2.cross(radiusB, manifold.normal);

            const inverseMassSum = bodyA.inverseMass + bodyB.inverseMass + (raCrossN*raCrossN)*bodyA.inverseInertia + (rbCrossN*rbCrossN)*bodyB.inverseInertia;

            // Calculate impulse scalar value
            var impulse = -(1.0 + manifold.restitution)*contactVelocity;
            impulse /= inverseMassSum;                
            impulse /= f32(manifold.contactsCount);

            // Apply impulse to each physics body
            const impulseV = vec2(manifold.normal.x*impulse, manifold.normal.y*impulse);

            if (bodyA.enabled) {
                bodyA.velocity.x += bodyA.inverseMass*(-impulseV.x);
                bodyA.velocity.y += bodyA.inverseMass*(-impulseV.y);
                if (!bodyA.freezeOrient) bodyA.angularVelocity += bodyA.inverseInertia*Vec2.cross(radiusA, (Vec2){ -impulseV.x, -impulseV.y });
            }

            if (bodyB.enabled) {
                bodyB.velocity.x += bodyB.inverseMass*(impulseV.x);
                bodyB.velocity.y += bodyB.inverseMass*(impulseV.y);
                if (!bodyB.freezeOrient) bodyB.angularVelocity += bodyB.inverseInertia*Vec2.cross(radiusB, impulseV);
            }

            // Apply friction impulse to each physics body
            radiusV.x = bodyB.velocity.x + Vec2.cross(bodyB.angularVelocity, radiusB).x - bodyA.velocity.x - Vec2.cross(bodyA.angularVelocity, radiusA).x;
            radiusV.y = bodyB.velocity.y + Vec2.cross(bodyB.angularVelocity, radiusB).y - bodyA.velocity.y - Vec2.cross(bodyA.angularVelocity, radiusA).y;

            const tangent = Vec2 {
                radiusV.x - (manifold.normal.x*Vec2.dot(radiusV, manifold.normal)),
                radiusV.y - (manifold.normal.y*Vec2.dot(radiusV, manifold.normal))
            };
            MathNormalize(&tangent);

            // Calculate impulse tangent magnitude
            var impulseTangent = -Vec2.dot(radiusV, tangent);
            impulseTangent /= inverseMassSum;
            impulseTangent /= f32(manifold.contactsCount);

            const absImpulseTangent = math.abs(impulseTangent);

            // Don't apply tiny friction impulses
            if (absImpulseTangent <= EPSILON) return;

            // Apply coulumb's law
            const tangentImpulse = if (absImpulseTangent < impulse*manifold.staticFriction)
                vec2(tangent.x*impulseTangent, tangent.y*impulseTangent)
            else
                vec2(tangent.x*-impulse*manifold.dynamicFriction, tangent.y*-impulse*manifold.dynamicFriction);

            // Apply friction impulse
            if (bodyA.enabled) {
                bodyA.velocity.x += bodyA.inverseMass*(-tangentImpulse.x);
                bodyA.velocity.y += bodyA.inverseMass*(-tangentImpulse.y);

                if (!bodyA.freezeOrient)
                    bodyA.angularVelocity += bodyA.inverseInertia*Vec2.cross(radiusA, vec2(-tangentImpulse.x, -tangentImpulse.y));
            }

            if (bodyB.enabled) {
                bodyB.velocity.x += bodyB.inverseMass*(tangentImpulse.x);
                bodyB.velocity.y += bodyB.inverseMass*(tangentImpulse.y);

                if (!bodyB.freezeOrient)
                    bodyB.angularVelocity += bodyB.inverseInertia*Vec2.cross(radiusB, tangentImpulse);
            }
        }
    }

    // Corrects physics bodies positions based on manifolds collision information
    fn correctPhysicsPositions(manifold: PhysicsManifold) void {
        const bodyA: PhysicsBody = manifold.bodyA;
        const bodyB: PhysicsBody = manifold.bodyB;

        var correction: Vec2 = undefined;
        correction.x = (max(manifold.penetration - PENETRATION_ALLOWANCE, 0)/(bodyA.inverseMass + bodyB.inverseMass))*manifold.normal.x*PENETRATION_CORRECTION;
        correction.y = (max(manifold.penetration - PENETRATION_ALLOWANCE, 0)/(bodyA.inverseMass + bodyB.inverseMass))*manifold.normal.y*PENETRATION_CORRECTION;

        if (bodyA.enabled) {
            bodyA.position.x -= correction.x*bodyA.inverseMass;
            bodyA.position.y -= correction.y*bodyA.inverseMass;
        }

        if (bodyB.enabled) {
            bodyB.position.x += correction.x*bodyB.inverseMass;
            bodyB.position.y += correction.y*bodyB.inverseMass;
        }
    }
};

pub const World = struct {
    var physicsThreadId: pthread_t;                  // Physics thread id
    var usedMemory: uint = 0;                        // Total allocated dynamic memory
    var physicsThreadEnabled: bool = false;          // Physics thread enabled state
    var currentTime: double = 0;                     // Current time in milliseconds
    var baseTime: double = 0;                        // Android and RPI platforms base time
    var startTime: double = 0;                       // Start time in milliseconds
    var deltaTime: double = 0;                       // Delta time used for physics steps
    var frameTime: double = 0;                       // Physics time step delta time frameTime
    var stepsCount: uint = 0;                        // Total physics steps processed
    var gravityForce: vec2( 0, 9.81/1000);           // Physics world gravity force
    var bodies: PhysicsBody[MAX_BODIES];             // Physics bodies pointers array
    var physicsBodiesCount: uint = 0;                // Physics world current bodies counter
    var contacts: PhysicsManifold[MAX_MANIFOLDS];    // Physics bodies pointers array
    var physicsManifoldsCount: uint = 0;             // Physics world current manifolds counter

    // Initializes physics values, pointers and creates physics loop thread
    pub fn init() void {
        pthread_create(&physicsThreadId, null, &PhysicsLoop, null);
    }

    pub fn isEnabled()bool {
        return physicsThreadEnabled;
    }

    pub fn setGravity(x: f32, y: f32) void {
        gravityForce = vec2(x, y);
    }

    pub fn reset() void {
        // Uninitialize physics bodies dynamic memory allocations
        for (physicsBodies) | b, i | {
            if (bodies[i]) | body | {
                FREE(body);
                body = null;
                usedMemory -= @sizeOf(PhysicsBody);
            }
        }

        physicsBodiesCount = 0;

        // Uninitialize physics manifolds dynamic memory allocations
        for (physicsManifolds) | m, i | {
            if (contacts[i]) | manifold | {
                FREE(manifold);
                manifold = null;
                usedMemory -= @sizeOf(PhysicsManifold);
            }
        }

        physicsManifoldsCount = 0;
    }

    pub fn deinit() void {
        physicsThreadEnabled = false;
        pthread_join(physicsThreadId, null);
    }

    // Physics loop thread function
    fn physicsLoop() void {
        // Initialize physics loop thread values
        physicsThreadEnabled = true;
        frameTime = 0;

        // Initialize high resolution timer
        InitTimer();

        // Physics update loop
        while (physicsThreadEnabled) {
            currentTime = GetCurrentTime();
            deltaTime = currentTime - startTime;
            frameTime += deltaTime;

            // Clamp frameTime to max time step to avoid bad performance
            MathClamp(&frameTime, 0, MAX_TIMESTEP);

            // Fixed time stepping loop
            while (frameTime >= DESIRED_DELTATIME) {
                PhysicsStep();
                frameTime -= deltaTime;
            }

            // Record the starting of this frame
            startTime = currentTime;
        }

        // Uninitialize physics manifolds dynamic memory allocations
        for (physicsManifolds) | m, i | DestroyPhysicsManifold(contacts[i]);

        // Uninitialize physics bodies dynamic memory allocations
        for (physicsBodies) DestroyPhysicsBody(bodies[i]);
    }

    // Physics steps calculations (dynamics, collisions and position corrections)
    fn physicsStep(void) void {
        stepsCount += 1;

        // Clear previous generated collisions information
        for (physicsManifolds) | m, i | {
            const manifold: PhysicsManifold = contacts[i];
            if (manifold != null) DestroyPhysicsManifold(manifold);
        }

        // Generate new collision information
        for (physicsBodies) | b, i |{
            const bodyA: PhysicsBody = bodies[i];

            var j = i + 1;
            while (j < physicsBodiesCount) : (j += 1) {
                const bodyB: PhysicsBody = bodies[j];

                if ((bodyA.inverseMass == 0) and (bodyB.inverseMass == 0)) continue;

                const manifold = if (bodyA.shape.type == PhysicsShapeType.Polygon and bodyB.shape.type == PhysicsShapeType.Circle)
                    CreatePhysicsManifold(bodyB, bodyA)
                else
                    CreatePhysicsManifold(bodyA, bodyB);
                
                SolvePhysicsManifold(manifold);

                if (manifold.contactsCount > 0) {
                    // Create a new manifold with same information as previously solved manifold and add it to the manifolds pool last slot
                    var new_manifold = CreatePhysicsManifold(bodyA, bodyB);
                    new_manifold.penetration = manifold.penetration;
                    new_manifold.normal = manifold.normal;
                    new_manifold.contacts[0] = manifold.contacts[0];
                    new_manifold.contacts[1] = manifold.contacts[1];
                    new_manifold.contactsCount = manifold.contactsCount;
                    new_manifold.restitution = manifold.restitution;
                    new_manifold.dynamicFriction = manifold.dynamicFriction;
                    new_manifold.staticFriction = manifold.staticFriction;
                }
            }
        }

        // Integrate forces to physics bodies
        for (bodies) | b, i | {
            var body: PhysicsBody = bodies[i];
            IntegratePhysicsForces(body);
        }

        // Initialize physics manifolds to solve collisions
        for (contacts) | m, i | {
            var manifold: PhysicsManifold = contacts[i];
            InitializePhysicsManifolds(manifold);
        }

        // Integrate physics collisions impulses to solve collisions
        for (COLLISION_ITERATIONS) {
            for (contacts) {
                var manifold: PhysicsManifold = contacts[i];
                IntegratePhysicsImpulses(manifold);
            }
        }

        // Integrate velocity to physics bodies
        for (bodies) | b, i | {
            var body: PhysicsBody = bodies[i];
            IntegratePhysicsVelocity(body);
        }

        // Correct physics bodies positions based on manifolds collision information
        for (contacts) | m, i | {
            var manifold: PhysicsManifold = contacts[i];
            CorrectPhysicsPositions(manifold);
        }

        // Clear physics bodies forces
        for (bodies) | b, i |{
            var body: PhysicsBody = bodies[i];
            body.force = vec2(0, 0);
            body.torque = 0;
        }
    }

    // Check if values are between bias range
    fn biasGreaterThan(valueA: f32, valueB: f32)bool {
        return (valueA >= (valueB*0.95 + valueA*0.01));
    }

    // Returns the barycenter of a triangle given by 3 points
    fn triangleBarycenter(v1: *const Vec2, v2: *const Vec2, v3: *const Vec2)Vec2 {
        return Vec2 {
            .x = (v1.x + v2.x + v3.x)/3,
            .y = (v1.y + v2.y + v3.y)/3
        };
    }

    fn initTimer(void) void {
        srand(time(null));              // Initialize random seed
        startTime = GetCurrentTime();
    }
};
