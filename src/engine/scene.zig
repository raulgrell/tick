const t = @import("../tick.zig");

// Camera system modes
const CameraMode = enum {
    Custom,
    Free,
    Orbital,
    FirstPerson,
    ThirdPerson
};

pub const Camera = struct {
    position: Vec3,
    rotation: Vec3,
    focal_point: Vec3,
    scale: f32,
    fb_width: usize,
    fb_height: usize,
    view_matrix: Mat4,
    projection_matrix: Mat4,
    orthographic_matrix: Mat4,
    needs_update: bool,
    is_active: bool,

    pub fn init(fb_width: usize, fb_height: usize)Camera {
        return Camera {
            .position = vec3(0,0,0),
            .rotation = vec3(0,0,0),
            .focal_point = vec3(0,0,0),
            .scale = 1,
            .fb_width = fb_width,
            .fb_height = fb_height,
            .view_matrix = Mat4.diagonal(1),
            .projection_matrix = Mat4.diagonal(1),
            .orthographic_matrix = Mat4.orthographic( 0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0 ),
            .needs_update = true,
            .is_active = true,
        };
    }

    pub fn getAspectRatio(self: *const Camera)f32 { 
        return f32(self.fb_width) / f32(self.fb_height);
    }

    pub fn offsetPosition(self: *Camera, offset: *const Vec2) void {
        self.position.offset(offset);
        self.needs_update = true;
    }

    pub fn offsetScale(self: *Camera, offset: f32) void {
        self.scale += offset;
        if (self.scale < 0.001) self.scale = 0.001;
        self.needs_update = true;
    }

    pub fn convertScreenToWorld(self: *Camera, screen_coords: *const Vec2)Vec3 {
        var worldCoords = vec3(
            screen_coords.x,
            self.fb_height - screen_coords.y, // Invert Y direction
            0.0
        );

        // Center at 0, 0
        screen_coords.offset(vec2(-self.fb_width / 2, -self.fb_height / 2));
        
        worldCoords.scale(1/self.scale);
        worldCoords.offset(self.position);

        return worldCoords;
    }

    pub fn isBoxInView(self: *Camera, position: *const Vec2, dimenstions: *const Vec2)bool {
        const scaled_screen = vec2(self.fb_width / self.scale, self.fb_height / self.scale);

        const min_distance_x = (dimensions.x + scaled_screen.x) / 2.0;
        const min_distance_y = (dimensions.y + scaled_screen.y) / 2.0;

        const centerPos = position.add(dimensions.div_scalar(2.0));
        const dist_vec = centerPos.sub(self.position.xy());

        const xDepth = min_distance_x - math.fabs(dist_vec.x);
        const yDepth = min_distance_y - math.fabs(dist_vec.y);

        return (xDepth > 0 or yDepth > 0);
    }

    pub fn update(self: *Camera) void {
        if (self.needs_update) return;

        const translation = vec3(
            -self.position.x + f32(self.fb_width / 2),
            -self.position.y + f32(self.fb_height / 2),
            0.0
        );

        self.projection_matrix = self.orthographic_matrix.translate_vec(translation);

        const scale = vec3(self.scale, self.scale, 0.0);

        self.projection_matrix = Mat4.scaling(scale).mul(self.projection_matrix);
        self.needs_update = false;
    }

    pub fn translate(self: *Camera, translation: *const Vec3) void {
        self.position.offset(translation);
    }
    
    pub fn rotate(self: *Camera, rotation: *const Vec3) void {
        self.rotation.offset(rotation);
    }
};

pub const Scene2D = struct {
    renderer: *BatchRenderer,
    camera: *Camera,
    agents: ArrayList(Agent),

    pub fn create(self: *Scene2D, width: usize, height: usize)Scene2D {
        const aspect = f32(width) / f32(height);

        self.camera = Camera.orthographic(
            Mat4.orthographic(-10.0 * aspect, 10.0 * aspect, -10.0, 10.0, -1.0, 1.0)
        );

        self.renderer = BatchRenderer.init(width, height);
        self.renderer.setCamera(self.camera);
    }

    pub fn destroy(self: *Scene2D) void {
        self.agents.deinit();
    }

    pub fn addAgent(self: *Scene2D, agent: *Agent) void {
        self.agents.append(agent);
    }

    pub fn update(self: *Scene2D) void {
        for (self.agents.toSlice) | *agent, i | agent.update();
    }

    pub fn render(self: *Scene2D) void {
        self.camera.update();

        self.renderer.begin();
        for (self.agents) | agent, i | {
            self.renderer.submit(agent);
        }

        self.render(self.renderer);

        self.renderer.end();
        self.renderer.present();
    }
};

const Scene3D = struct {
    renderer: *BatchRenderer,
    camera: *Camera,
    agents: ArrayList(Agent),
    lights: ArrayList(Light),

    pub fn create(camera: *Camera)Scene3D {
        self.camera(camera);
    }

    pub fn destroy(self: *Scene3D)Scene3D {
        for (self.agents) | agent, i | self.agents[i].destroy();

        self.agents.clear();
        self.camera.destroy();
    }

    pub fn addAgent(self: *Scene3D, agent: *Agent) void {
        agent.getComponent(TransformComponent) orelse {
            agent.addComponent(TransformComponent.create(Mat4.Identity()));
        };
        self.agents.append(agent);
    }

    pub fn pushLight(self: *Scene3D, light: *Light) void {
        self.lights.append(light);
    }

    pub fn popLight(self: *Scene3D)&Light {
        const result = self.lights.back();
        self.lights.pop_back();
        return result;
    }

    pub fn setCamera(self: *Scene3D, camera: *Camera) void {
        self.camera = camera;
        self.camera.focus();
    }

    pub fn render(self: *Scene3D, renderer: *Renderer) void {
        self.camera.update();

        renderer.begin();
        renderer.beginScene(camera);

        for (self.lights) | light | renderer.submitLight(light);

        for (self.agents) {
            const mc = entity.GetComponent(MeshComponent);
            if (mc) {
                const tc = entity.GetComponent(TransformComponent);
                renderer.submitMesh(mc.mesh, tc.transform);
            }
        }
        renderer.endScene();
        renderer.end();
    }
};

const MAX_LAYERS = 4;

const Layer = struct {
    window: *Window,
    renderer: *BatchRenderer,
    scene: *Scene,
    projection_matrix: mat4,
    visible: bool,
    renderables: []*Texture,

    pub fn add() void {
    }
    
    pub fn submit() void {
    }
    
    pub fn init() void {
    }

    pub fn onInit() void {
    }

    pub fn deinit() void {
    }

    pub fn onDeinit() void {
    }

    pub fn onTick() void {
    }
    
    pub fn update() void {
    }

    pub fn onUpdate() void {
    }

    pub fn onRender() void {
    }

    pub fn onResize() void {
    }

    pub fn onEvent() void {
    }
};

const Stack = struct {
    layers: [MAX_LAYERS]Layer,

    pub fn pushLayer(self: *Stack, layer: *Layer) void {
        layers.append(layer);
        layer.Init();
    }

    pub fn popLayer(self: *Stack)&Layer {
        const layer: *Layer = layers.back();
        layers.pop_back();
        return layer;
    }

    pub fn removeLayer(self: *Stack, layer: *Layer)&Layer {
        for ( layers ) | l |{
            if ( l == layer ) {
                layers.erase(layers.begin() + i);
                break;
            }
        }
        return layer;
    }

    pub fn onEvent(self: *Stack, event: Event) void {
        for ( layers ) | l | l.onEvent(event);
    }

    pub fn onTick(self: *Stack) void {
        for ( layers ) | l | l.onTick();
    }

    pub fn onUpdate(self: *Stack) void {
        for (layers ) | l | l.onUpdate();
    }

    pub fn onRender(self: *Stack) void {
        for ( layers ) | l | {
            if ( l.visible ) l.onRender();
        }
    }
};

const Group = struct {
    textures: ArrayList(&Texture),
    transform: Mat4,

    pub fn init(transform: Mat4 )Group {
        return Group {
            .textures = ArrayList(&Texture).init(),
            .transform = transform,
        };
    }

    pub fn deinit(self: *Group) void {
        self.textures.deinit();
    }

    pub fn add(self: *Group, texture: *Texture) void {
        self.textures.append(renderable);
    }

    pub fn draw(self: *Group, renderer: *IMRenderer) void {
        renderer.pushTransform(self.transform);
        for (self.textures) | t, i | {
            t.draw(renderer);
        }
        renderer.popTransform();
    }

    pub fn submit(self: *Group, renderer: *BatchRenderer) void {
        renderer.pushTransform(self.transform);
        for (self.textures) | t, i | {
            t.submit(renderer);
        }
        renderer.popTransform();
    }
};
