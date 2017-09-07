const tick = @import("../src/tick.zig");
use tick;
use tick.system;
use tick.dev;
use tick.sprite;
use tick.math;
use tick.level;

const io = std.io;

const FONT_PNG = @embedFile("../data/font.png");
const TEX_PNG = @embedFile("../data/tiles/tile_01.png");
const NOISE_PNG = @embedFile("../data/tex.png");
const SPRITE_PNG = @embedFile("../data/tiles/tile_101.png");

const FONT_CHAR_WIDTH  = 18;
const FONT_CHAR_HEIGHT = 32;

const HOT = struct {
    const DIMENSIONS_TILE = vec3(32, 32, 0);
    const DIMENSIONS_AGENT = vec3(16, 16, 0);
    const SPEED_AGENT = 2;
};

const LEVEL_DATA = [][]const u8 {
    "################",
    "#              #",
    "#              #",
    "#        # #   #",
    "#  @      #    #",
    "#          #   #",
    "#     $        #",
    "#              #",
    "################",
};

pub const State = struct {
    font: Spritesheet,
    texture: Texture,
    noise: Texture,
    sprite: Sprite,
    is_paused:  bool,
    cursor_position: Vec2,
    camera: scene.Camera,
    level: level.Level,
    texture_shader: shader.TextureShader,
    im_renderer:    renderer.IMRenderer,
    agent:  entity.Agent,
    td_player: entity.TopDownPlayer,
    impulse_player: entity.ImpulsePlayer,
    mouse_player: entity.MousePlayer,
    agent_controller: entity.Controller,
    tile_map: [256]?Texture,
};

fn init(app: &App) -> &State {
    var state = c.mem.create(State) %% panic("cannot create state");

    state.font = Spritesheet.init(FONT_PNG, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT) %% {
        panic("Unable to load spritesheet");
    };
    state.texture = Texture.init(TEX_PNG) %% panic("Unable to load texture");
    state.noise = Texture.init(NOISE_PNG) %% panic("Unable to load noise");
    state.sprite = Sprite.init(SPRITE_PNG) %% panic("Unable to load sprite");
    state.cursor_position = vec2(0, 0);

    state.tile_map[' '] = state.texture;
    state.tile_map['#'] = state.sprite.texture;
    
    const fb_width = app.window.framebuffer_width;
    const fb_height = app.window.framebuffer_height;

    state.camera = scene.Camera.init(fb_width, fb_height);

    state.texture_shader = shader.TextureShader.init();
    state.im_renderer    = renderer.IMRenderer.init(&state.texture_shader, fb_width, fb_height );

    state.level = Level.init(LEVEL_DATA[0..], HOT.DIMENSIONS_TILE);
    const level_start = state.level.start;
    const level_center = state.level.getCenter();
    const level_end = state.level.end;
    
    state.agent = entity.Agent.init(level_start.xyz(), HOT.DIMENSIONS_AGENT, HOT.SPEED_AGENT, &state.noise);
    state.td_player = entity.TopDownPlayer.init(&state.agent, &app.input, &state.camera);
    state.impulse_player = entity.ImpulsePlayer.init(&state.agent, &app.input, &state.camera);
    state.mouse_player = entity.MousePlayer.init(&state.agent, &app.input, &state.camera);
    
    state.agent_controller = entity.Controller.init(f32(fb_width), f32(fb_height));
    state.agent_controller.add(&state.agent);

    %%io.stdout.printf("init\n");

    return state;
}

fn update(app: &App, state: &State, deltaTime: f32) -> %void {
    // Update cursor
    state.cursor_position = app.input.cursor_position;
    
    // Reload
    if(app.input.keyPressed[c.GLFW_KEY_R]) reload(state);
    
    // Pause
    if(app.input.keyPressed[c.GLFW_KEY_P]) state.is_paused = !state.is_paused;
    if (state.is_paused) return;

    // Place agent at cursor
    if(app.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT])
        state.agent.position = app.input.cursor_position.xyz();
    
    // Update agents
    state.td_player.update(&state.level, deltaTime);
    state.impulse_player.update(&state.level, deltaTime);
    state.mouse_player.update(&state.level, deltaTime);
}

fn draw(app: &App, state: &State) {
    // Update camera
    state.camera.update();
    
    // Render
    state.im_renderer.begin();
    {
        state.level.draw(&state.im_renderer, state.tile_map[0..]);
        state.agent.draw(&state.im_renderer);
        state.im_renderer.draw_text(&state.font, "Hello", 32, 32, 1);
    }
    state.im_renderer.end();
}

fn reload(state: &State) -> void {
    state.level = Level.init(LEVEL_DATA[0..], HOT.DIMENSIONS_TILE);
    state.agent = entity.Agent.init(state.level.start.xyz(), HOT.DIMENSIONS_AGENT, HOT.SPEED_AGENT, &state.noise);
    %%io.stdout.printf("reload\n");
}

fn unload(state: &State)  -> void {
    %%io.stdout.printf("unload\n");
}

fn deinit(state: &State)  -> void {
    c.mem.destroy(state);
    %%io.stdout.printf("deinit\n");
}

export var GAME = API {
    .init = init,
    .update = update,
    .draw = draw,
    .reload = reload,
    .unload = unload,
    .deinit = deinit
};
