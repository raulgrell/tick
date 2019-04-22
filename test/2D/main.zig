const t = @import("../src/index.zig");

const s_font_png = @embedFile("../data/font.png");
const s_noise_png = @embedFile("../data/tex.png");
const s_grass_png = @embedFile("../data/tiles/tile_grass.png");
const s_wood_png = @embedFile("../data/tiles/tile_wood.png");

const s_font_char_width  = 18;
const s_font_char_height = 32;

const Hot = struct {
    const dimensions_tile = vec3(32, 32, 0);
    const dimensions_agent = vec3(16, 16, 0);
    const speed_agent = 2;
};

const s_level_data = [][]const u8 {
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

fn init(app: *App) &State {
    var state = try c.mem.create(State);
    state.font = try Spritesheet.init(s_font_png, s_font_char_width, s_font_char_height);
    state.noise = try Sprite.init(s_noise_png);
    state.grass = try Texture.init(s_grass_png);
    state.wood = try Texture.init(s_wood_png);
    state.cursor_position = vec2(0, 0);

    state.tile_map[' '] = state.grass;
    state.tile_map['#'] = state.wood;
    
    const fb_width = app.window.framebuffer_width;
    const fb_height = app.window.framebuffer_height;

    state.camera = scene.Camera.init(fb_width, fb_height);

    state.texture_shader = texture.TextureShader.init();
    state.im_renderer    = texture.IMRenderer.init(&state.texture_shader, fb_width, fb_height );

    state.level = Level.init(s_level_data[0..], Hot.dimensions_tile);
    const level_start = state.level.start;
    const level_center = state.level.getCenter();
    const level_end = state.level.end;
    
    state.player_agent = agent.Agent.init(level_start.xyz(), Hot.dimensions_agent, Hot.speed_agent, &state.noise.texture);
    state.player_td = agent.TopDownPlayer.init(&state.player_agent, &app.input, &state.camera);
    state.player_impulse = agent.ImpulsePlayer.init(&state.player_agent, &app.input, &state.camera);
    state.player_mouse = agent.MousePlayer.init(&state.player_agent, &app.input, &state.camera);
    
    state.agent_controller = agent.Controller.init(f32(fb_width), f32(fb_height));
    state.agent_controller.add(&state.player_agent);

    warn("init\n");

    return state;
}

fn update(app: *App, state: *State, deltaTime: f32) !void {
    state.cursor_position = app.input.cursor_position;
    if(app.input.keyPressed[c.GLFW_KEY_R]) reload(state);
    if(app.input.keyPressed[c.GLFW_KEY_P]) state.is_paused = !state.is_paused;
    if (state.is_paused) return;
    state.player_td.update(&state.level, deltaTime);
    state.player_impulse.update(&state.level, deltaTime);
    state.player_mouse.update(&state.level, deltaTime);
}

fn draw(app: *App, state: *State) void {
    state.camera.update();
    state.im_renderer.begin();
    {
        state.level.draw(&state.im_renderer, state.tile_map[0..]);
        state.player_agent.draw(&state.im_renderer);
        state.im_renderer.draw_text(&state.font, "Hello", 32, 32, 1);
    }
    state.im_renderer.end();
}

fn reload(state: *State) void {
    state.level = Level.init(s_level_data[0..], Hot.dimensions_tile);
    state.player_agent = agent.Agent.init(state.level.start.xyz(), Hot.dimensions_agent, Hot.speed_agent, &state.noise.texture);
    warn("reload\n");
}

fn unload(state: *State) void {
    warn("unload\n");
}

fn deinit(state: *State) void {
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
