const tick = @import("../src/tick.zig");

use tick.core.dev;

use tick.engine;
use tick.engine.agent;
use tick.engine.scene;

use tick.graphics;
use tick.graphics.sprite;
use tick.graphics.texture;

use tick.math;

use tick.system;

const io = std.io;

const FONT_PNG = @embedFile("../data/font.png");
const NOISE_PNG = @embedFile("../data/tex.png");
const GRASS_PNG = @embedFile("../data/tiles/tile_grass.png");
const WOOD_PNG = @embedFile("../data/tiles/tile_wood.png");

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
    "#  @           #",
    "#        #  #  #",
    "#     $        #",
    "#              #",
    "################",
};

pub const State = struct {
    font: Spritesheet,
    grass: Texture,
    wood: Texture,
    noise: Sprite,
    is_paused:  bool,
    cursor_position: Vec2,
    camera: scene.Camera,
    level: scene.Level,
    texture_shader: texture.TextureShader,
    im_renderer:    texture.IMRenderer,
    player_agent:  agent.Agent,
    player_td: agent.TopDownPlayer,
    player_impulse: agent.ImpulsePlayer,
    player_mouse: agent.MousePlayer,
    agent_controller: agent.Controller,
    tile_map: [256]?Texture,
};

fn init(app: &App) &State {
    var state = c.mem.create(State) catch panic("cannot create state");

    state.font = Spritesheet.init(FONT_PNG, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT) catch {
        panic("Unable to load spritesheet");
    };
    state.noise = Sprite.init(NOISE_PNG) catch panic("Unable to load noise");
    state.grass = Texture.init(GRASS_PNG) catch panic("Unable to load grass");
    state.wood = Texture.init(WOOD_PNG) catch panic("Unable to load wood");
    state.cursor_position = vec2(0, 0);

    state.tile_map[' '] = state.grass;
    state.tile_map['#'] = state.wood;
    
    const fb_width = app.window.framebuffer_width;
    const fb_height = app.window.framebuffer_height;

    state.camera = scene.Camera.init(fb_width, fb_height);

    state.texture_shader = texture.TextureShader.init();
    state.im_renderer    = texture.IMRenderer.init(&state.texture_shader, fb_width, fb_height );

    state.level = Level.init(LEVEL_DATA[0..], HOT.DIMENSIONS_TILE);
    const level_start = state.level.start;
    const level_center = state.level.getCenter();
    const level_end = state.level.end;
    
    state.player_agent = agent.Agent.init(level_start.xyz(), HOT.DIMENSIONS_AGENT, HOT.SPEED_AGENT, &state.noise.texture);
    state.player_td = agent.TopDownPlayer.init(&state.player_agent, &app.input, &state.camera);
    state.player_impulse = agent.ImpulsePlayer.init(&state.player_agent, &app.input, &state.camera);
    state.player_mouse = agent.MousePlayer.init(&state.player_agent, &app.input, &state.camera);
    
    state.agent_controller = agent.Controller.init(f32(fb_width), f32(fb_height));
    state.agent_controller.add(&state.player_agent);

    warn("init\n");

    return state;
}

fn update(app: &App, state: &State, deltaTime: f32) %void {
    // Update cursor
    state.cursor_position = app.input.cursor_position;
    
    // Reload
    if(app.input.keyPressed[c.GLFW_KEY_R]) reload(state);
    
    // Pause
    if(app.input.keyPressed[c.GLFW_KEY_P]) state.is_paused = !state.is_paused;
    if (state.is_paused) return;
    
    // Update agents
    state.player_td.update(&state.level, deltaTime);
    state.player_impulse.update(&state.level, deltaTime);
    state.player_mouse.update(&state.level, deltaTime);
}

fn draw(app: &App, state: &State) void {
    // Update camera
    state.camera.update();
    
    // Render
    state.im_renderer.begin();
    {
        state.level.draw(&state.im_renderer, state.tile_map[0..]);
        state.player_agent.draw(&state.im_renderer);
        state.im_renderer.draw_text(&state.font, "Hello", 32, 32, 1);
    }
    state.im_renderer.end();
}

fn reload(state: &State) void {
    state.level = Level.init(LEVEL_DATA[0..], HOT.DIMENSIONS_TILE);
    state.player_agent = agent.Agent.init(state.level.start.xyz(), HOT.DIMENSIONS_AGENT, HOT.SPEED_AGENT, &state.noise.texture);
    warn("reload\n");
}

fn unload(state: &State) void {
    warn("unload\n");
}

fn deinit(state: &State) void {
    c.mem.destroy(state);
    warn("deinit\n");
}

export var GAME = API {
    .init = init,
    .update = update,
    .draw = draw,
    .reload = reload,
    .unload = unload,
    .deinit = deinit
};
