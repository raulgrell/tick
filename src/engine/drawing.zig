const t = @import("../index.zig");

// Draw a pixel
const DrawPixel = fn(position: Vec2, color: Color);
// Draw a line
const DrawLine = fn(startPos: Vec2, endPos: Vec2, thick: f32, color: Color);
// Draw line using cubic-bezier curves in-out
const DrawLineBezier = fn(startPos: Vec2, endPos: Vec2, thick: f32, color: Color);
// Draw a color-filled circle
const DrawCircle = fn(center: Vec2, radius: f32, color: Color);
// Draw circle outline
const DrawCircleLines = fn(center: Vec2, radius: f32, color: Color);
// Draw a color-filled rectangle
const DrawRectangle = fn(rec: Rectangle, color: Color);
// Draw a transformed, filled rectangle
const DrawRectangleTransform = fn(rec: Rectangle, origin: Vec2, rotation: f32, color: Color);
// Draw a triangle
const DrawTriangle = fn(v1: Vec2, v2: Vec2, v3: Vec2, color: Color);
// Draw a regular polygon of n sides
const DrawPolygon = (center: Vec2, sides: i32, radius: f32, rotation: f32, color: Color);
// Draw a closed polygon defined by points
const DrawPolygonPoints = fn(points: []const Vec2, color: Color);
// Draw a Texture2D
const DrawTextureEx = fn(texture: Texture2D, position: Vec2, rotation: f32, scale: f32, tint: Color);
// Draw a part of a texture (defined by a rectangle)
const DrawTextureRect = fn(texture: Texture2D, Rectangle sourceRec, position: Vec2, tint: Color);
// Draw a part of a texture (defined by a rectangle) with 'pro' parameters
const DrawTextureFrom = fn(texture: Texture2D, Rectangle sourceRec, Rectangle destRec, origin: Vec2, rotation: f32, tint: Color);

// 3D

// Draw a line in 3D world space
const DrawLine3D = fn(startPos: *const Vec3, endPos: *const Vec3, color: Color);
// Draw a circle in 3D world space
const DrawCircle3D = fn(center: *const Vec3, radius: f32, rotationAxis: *const Vec3, rotationAngle: f32, color: Color);
// Draw cube
const DrawCubeTexture = fn(texture: Texture2D, position: *const Vec3, size: *const Vec3, color: Color);
// Draw sphere
const DrawSphere = fn(centerPos: *const Vec3, radius: f32, color: Color);
// Draw sphere with extended parameters
const DrawSphereEx = fn(centerPos: *const Vec3, radius: f32, rings: i32, slices: i32, color: Color);
// Draw a cylinder
const DrawCylinder = fn(position: *const Vec3, radiusTop: f32, radiusBottom: f32, height: f32, sides: i32, color: Color);
// Draw a plane
const DrawPlane = fn(centerPos: *const Vec3, size: Vec2, color: Color);
// Draw a ray line
const DrawRay = fn(Ray ray, color: Color);
// Draw a grid centered at (0, 0, 0)
const DrawGrid = fn(slices: i32, spacing: f32);
