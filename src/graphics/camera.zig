use @import("../math/index.zig");

const lib = @import("../system/lib.zig");

pub const Camera = struct {
    position: Vec3,
    rotation: Vec3,
    focalPoint: Vec3,
    scale: f32,
    screenWidth: c_int,
    screenHeight: c_int,
    viewMatrix: Mat4x4,
    projectionMatrix: Mat4x4,
    needsMatrixUpdate: bool,
    active: bool,

    pub fn init(screenWidth: c_int, screenHeight: c_int) -> Camera {
        Camera {
            .position = vec3(0,0,0),
            .rotation = vec3(0,0,0),
            .focalPoint = vec3(0,0,0),
            .scale = 1,
            .screenWidth = screenWidth,
            .screenHeight = screenHeight,
            .viewMatrix = mat4x4_identity,
            .projectionMatrix = mat4x4_identity,
            .needsMatrixUpdate = true,
            .active = true,
        }
    }

    pub fn getAspectRatio(c: &Camera) -> f32 { 
        return f32(c.screenWidth) / f32(c.screenHeight);
    }

    pub fn offsetPosition(c: &Camera, offset: Vec2) {
        c.position.add(offset);
        c.needsMatrixUpdate = true;
    }

    pub fn offsetScale(c: &Camera, offset: f32) -> void {
        c.scale += offset;
        if ( c.scale < 0.001) c.scale = 0.001;
        c.needsMatrixUpdate = true;
    }

    pub fn convertScreenToWorld(c: &Camera, screenCoords: &const Vec2) -> Vec3 {
        var worldCoords = vec3(
            screenCoords.x,
            c.screenHeight - screenCoords.y, // Invert Y direction
            0.0
        );

        // Center at 0, 0
        screenCoords -= vec2(c.screenWidth / 2, c.screenHeight / 2);
        
        worldCoords.mul(1/c.Scale);
        worldCoords.add(c.position);

        return worldCoords;
    }

    pub fn isBoxInView(c: &Camera, position: &const Vec2, dimenstions: &const Vec2) -> bool {
        const scaledScreenDimensions = vec2(c.screenWidth / c.Scale, c.screenHeight / c.Scale);

        const MIN_DISTANCE_X = (dimensions.x + scaledScreenDimensions.x) / 2.0;
        const MIN_DISTANCE_Y = (dimensions.y + scaledScreenDimensions.y) / 2.0;

        const centerPos = position + dimensions / 2.0;
        const distVec = centerPos - c.position.xy();

        const xDepth = MIN_DISTANCE_X - abs(distVec.x);
        const yDepth = MIN_DISTANCE_Y - abs(distVec.y);

        if (xDepth > 0 or yDepth > 0) return true;

        return false;
    }

    pub fn update(c: &Camera) -> void {
        if (c.needsMatrixUpdate) {
            const translation = vec3(
                -c.position.x + c.screenWidth / 2,
                -c.position.y + c.screenHeight / 2,
                0.0
            );

            c.ProjectionMatrix = c.orthographicMatrix.Translate(translation);

            const scale = vec3(c.Scale, c.Scale, 0.0);

            c.ProjectionMatrix = Mat4x4.Scale(scale) *  c.ProjectionMatrix;
            c.needsMatrixUpdate = false;
        }
    }

    pub fn translate(c: &Camera, translation: &const Vec3) {
        c.position += translation;
    }
    
    pub fn rotate(c: &Camera, rotation: &const Vec3) {
        c.rotation += rotation;
    }
};