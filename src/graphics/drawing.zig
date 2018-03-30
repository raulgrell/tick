
// Draw a pixel
const DrawPixel = fn(Vec2 position, Color color);                                                                                 
// Draw a line 
const DrawLine = fn(Vec2 startPos, Vec2 endPos, float thick, Color color);                                                        
// Draw line using cubic-bezier curves in-out
const DrawLineBezier = fn(Vec2 startPos, Vec2 endPos, float thick, Color color);                                                  
// Draw a color-filled circle
const DrawCircle = fn(Vec2 center, float radius, Color color);                                                                    
// Draw a gradient-filled circle
const DrawCircleGradient = fn(Vec2 center, float radius, Color colorCenter, Color colorEdge);                                     
// Draw circle outline
const DrawCircleLines = fn(Vec2 center, float radius, Color color);                                                               
// Draw a color-filled rectangle
const DrawRectangle = fn(Rectangle rec, Color color);                                                                             
// Draw a transformed, filled rectangle
const DrawRectangleTransform = fn(Rectangle rec, Vec2 origin, float rotation, Color color);                                       
// Draw a color-filled rectangle
const DrawRectangle = fn(Vec2 position, Vec2 dimensions, Color color);                                                            
// Draw rectangle outline
const DrawRectangleLines = fn(Vec2 position, Vec2 dimensions, Color color);                                                       
// Draw a gradient-filled rectangle
const DrawRectangleGradient = (Vec2 position, Vec2 dimensions, Color colorTop, Color colorBottom);                                
// Draw a triangle
const DrawTriangle = fn(Vec2 v1, Vec2 v2, Vec2 v3, Color color);                                                                  
// Draw triangle outline
const DrawTriangleOutline = fn(Vec2 v1, Vec2 v2, Vec2 v3, Color color);                                                           
// Draw a regular polygon of n sides
const DrawPolygon = (Vec2 center, int sides, float radius, float rotation, Color color);                                          
// Draw a closed polygon defined by points
const DrawPolygonPoints = fn(points: []const Vec2, Color color);                                                                  
// Draw polygon Outline defined by lines
const DrawPolygonLines = fn(points: []const Vec2, Color color);                                                                   
// Draw a Texture2D
const DrawTexture = fn(Texture2D texture, int posX, int posY, Color tint);                                                        
// Draw a Texture2D with position defined as Vector2
const DrawTextureV = fn(Texture2D texture, Vector2 position, Color tint);                                                         
// Draw a Texture2D with extended parameters
const DrawTextureEx = fn(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);                           
// Draw a part of a texture (defined by a rectangle)
const DrawTextureRec = fn(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);                                  
// Draw a part of a texture (defined by a rectangle) with 'pro' parameters
const DrawTexturePro = fn(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);

// 3D

// Draw a line in 3D world space
const DrawLine3D = fn(startPos: &const Vec3, endPos: &const Vec3, Color color);                                                   
// Draw a circle in 3D world space
const DrawCircle3D = fn(center: &const Vec3, float radius, rotationAxis: &const Vec3, float rotationAngle, Color color);          
// Draw cube (Vector version)
const DrawCube = fn(position: &const Vec3, size: &const Vec3, Color color);                                                       
// Draw cube wires
const DrawCubeWires = fn(position: &const Vec3, size: &const Vec3, Color color);                                                  
// Draw cube
const DrawCubeTexture = fn(Texture2D texture, position: &const Vec3, size: &const Vec3, Color color);                             
// Draw sphere
const DrawSphere = fn(centerPos: &const Vec3, float radius, Color color);                                                         
// Draw sphere with extended parameters
const DrawSphereEx = fn(centerPos: &const Vec3, float radius, int rings, int slices, Color color);                                
// Draw sphere wires
const DrawSphereWires = fn(centerPos: &const Vec3, float radius, int rings, int slices, Color color);                             
// Draw a cylinder
const DrawCylinder = fn(position: &const Vec3, float radiusTop, float radiusBottom, float height, int sides, Color color);        
// Draw a wired cylinder
const DrawCylinderWires = fn(position: &const Vec3, float radiusTop, float radiusBottom, float height, int sides, Color color);   
// Draw a plane
const DrawPlane = fn(centerPos: &const Vec3, Vector2 size, Color color);                                                          
// Draw a ray line
const DrawRay = fn(Ray ray, Color color);                                                                                         
// Draw a grid centered at (0, 0, 0)
const DrawGrid = fn(int slices, float spacing);                                                                                   
// Draw gizmo
const DrawGizmo = fn(position: &const Vec3);                                                                                      
