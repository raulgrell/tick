const os = @import("std").os;

use @import("../src/tick.zig");
use system;
use sprite;
use math;
use level;

const FONT_CHAR_WIDTH  = 18;
const FONT_CHAR_HEIGHT = 32;

const POINT_ORIGIN = vec3(0, 0, 0);
const POINT_UNITS  = vec3(1, 1, 1);
const POINT_XUNIT  = vec3(1, 0, 0);
const POINT_YUNIT  = vec3(0, 1, 0);
const POINT_ZUNIT  = vec3(0, 0, 1);

const DIMENSIONS_TILE = vec3(32, 32, 0);
const DIMENSIONS_AGENT = vec3(32, 32, 0);

const COLOR_OBJ  = vec4(1, 0.5, 1, 0.5);
const COLOR_MID  = vec4(0.5, 0.5, 0.5, 0.5);
const COLOR_LINE = vec4(1, 0.5, 1, 1);

const GameData = struct {
    font: Spritesheet,
    texture: Texture,
    sprite: Sprite,
    is_paused:  bool,
    position: Vec2,
};

var GAME_DATA = GameData {
    .font = undefined,
    .texture = undefined,
    .sprite = undefined,
    .is_paused = false,
    .position = vec2(0, 0)
};

// Camera
var CAMERA: scene.Camera = undefined;

// Level: 
var LEVEL: level.Level = undefined;

var level_data = [][]const u8 {
    "################",
    "#              #",
    "#  @    #      #",
    "#        #     #",
    "#         #    #",
    "#          #   #",
    "#     $        #",
    "#              #",
    "################",
};

var tile_map = []?Texture { null } ** 256;

// Shaders
var PRIMITIVE_SHADER: shader.PrimitiveShader = undefined;
var TEXTURE_SHADER: shader.TextureShader = undefined;
var LIGHT_SHADER: light.LightShader = undefined;

// Renderers
var STRIP_RENDERER: renderer.StripRenderer = undefined;
var IM_RENDERER:    renderer.IMRenderer    = undefined;
var LINE_RENDERER:  renderer.LineRenderer  = undefined;
var BATCH_RENDERER: renderer.BatchRenderer = undefined;


// Generic Player
var AGENT:  entity.Agent  = undefined;
var PLAYER: entity.Player = undefined;

// Top Down Player
var TD_AGENT:  entity.Agent         = undefined;
var TD_PLAYER: entity.TopDownPlayer = undefined;

// Platform Player
var PF_AGENT:  entity.Agent         = undefined;
var PF_PLAYER: entity.TopDownPlayer = undefined;

// Controllers
var AGENT_CONTROLLER: entity.Controller = undefined;
// Grid
// Cell
// PlatformPlayer
// Physics
// Scene

// Grouping

// Layer
// LayerStack
// Group
// Grid

const FONT_PNG = @embedFile("../data/font.png");
const TEX_PNG = @embedFile("../data/tiles/tile_01.png");
const SPRITE_PNG = @embedFile("../data/tiles/tile_101.png");

fn togglePause() {
    GAME_DATA.is_paused = !(GAME_DATA.is_paused);
    _= c.printf(c"Toggle Pause\n");
}

fn restartGame() {
    GAME_DATA.position = vec2(0,0);
    GAME_DATA.is_paused = false;
    _= c.printf(c"Restart Game\n");
}

pub fn setup(app: &core.App) {
    GAME_DATA.font = Spritesheet.init(FONT_PNG, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT) %% {
        panic("Unable to load spritesheet");
    };
    GAME_DATA.texture = Texture.init(TEX_PNG) %% panic("Unable to load texture");
    GAME_DATA.sprite = Sprite.init(SPRITE_PNG) %% panic("Unable to load sprite");

    tile_map[' '] = GAME_DATA.texture;
    tile_map['#'] = GAME_DATA.sprite.texture;
    
    const fb_width = app.window.framebuffer_width;
    const fb_height = app.window.framebuffer_height;

    CAMERA = scene.Camera.init(fb_width, fb_height);

    PRIMITIVE_SHADER = shader.PrimitiveShader.init();
    STRIP_RENDERER   = renderer.StripRenderer.init(&PRIMITIVE_SHADER, fb_width, fb_height);
    LINE_RENDERER    = renderer.LineRenderer.init(&PRIMITIVE_SHADER, fb_width, fb_height );

    TEXTURE_SHADER = shader.TextureShader.init();
    IM_RENDERER    = renderer.IMRenderer.init(&TEXTURE_SHADER, fb_width, fb_height );
    BATCH_RENDERER = renderer.BatchRenderer.init(&TEXTURE_SHADER, fb_width, fb_height );

    LIGHT_SHADER = light.LightShader.init();

    LEVEL = Level.init(level_data[0..], DIMENSIONS_TILE);
    const level_start = LEVEL.player_start_position;
    const level_end = LEVEL.player_end_position;

    AGENT_CONTROLLER = entity.Controller.init(f32(fb_width), f32(fb_height));
    AGENT = entity.Agent.init(POINT_ORIGIN, DIMENSIONS_AGENT, &GAME_DATA.texture);
    PLAYER = entity.Player.init(&AGENT, &app.input, &CAMERA);
    AGENT_CONTROLLER.add(&AGENT);
    
    TD_AGENT = entity.Agent.init(level_start.xyz(), DIMENSIONS_AGENT, &GAME_DATA.sprite.texture);
    TD_PLAYER = entity.TopDownPlayer.init(&TD_AGENT, &app.input, &CAMERA);

    PF_AGENT = entity.Agent.init(level_end.xyz(), DIMENSIONS_AGENT, &GAME_DATA.sprite.texture);
    PF_PLAYER = entity.TopDownPlayer.init(&TD_AGENT, &app.input, &CAMERA);
}   

pub fn update(app: &core.App, deltaTime: f32) {
    if(app.input.keyPressed[c.GLFW_KEY_P]) togglePause();
    if(app.input.keyPressed[c.GLFW_KEY_R]) restartGame();

    if (GAME_DATA.is_paused) return;

    CAMERA.update();
    AGENT_CONTROLLER.update(deltaTime);

    TD_PLAYER.update(&LEVEL, deltaTime);

    if(app.input.keyPressed[c.GLFW_KEY_L]) _ = GAME_DATA.position.offset(GAME_DATA.position);
    if(app.input.keyPressed[c.GLFW_KEY_C]) TD_PLAYER.agent.position = app.input.cursor_position.xyz();
    if(app.input.keyPressed[c.GLFW_KEY_SPACE]) GAME_DATA.position = TD_PLAYER.agent.position.xy();
}

pub fn draw(app: &core.App) {
    const cursor = app.input.cursor_position;
    const pos = GAME_DATA.position;

    // 2D Primitives, Batched
    STRIP_RENDERER.begin();
    {
        STRIP_RENDERER.submit(COLOR_OBJ, cursor.x, cursor.y, 8.0, 8.0);
    }
    STRIP_RENDERER.end();

    // 2D Textures, Immediate
    IM_RENDERER.begin();
    {
        LEVEL.draw(&IM_RENDERER, tile_map[0..]);

        IM_RENDERER.draw_text(&GAME_DATA.font, "Hello", 32, 32, 1);
        IM_RENDERER.draw_sprite(&GAME_DATA.sprite, 64, 64, 32, 32);
        IM_RENDERER.draw_rect(&GAME_DATA.texture, 128, 128, 64, 64);

        TD_AGENT.draw(&IM_RENDERER);
    }
    IM_RENDERER.end();

    // 2D Textures, Batched
    // BATCH_RENDERER.begin();
    // {
    //     const destRect = vec4(10, 10, 100, 10);
    //     const uvRect = vec4(0, 0, 1, 1);

    //     BATCH_RENDERER.submit(destRect, uvRect, GAME_DATA.texture.id, 0, COLOR_OBJ, 0);
    // }
    // BATCH_RENDERER.end();
    // BATCH_RENDERER.render();

    // 3D
    // LINE_RENDERER.begin();
    // {
    //     const data = vec3(pos_x, pos_y, 0);
    //     const cursor = vec3(cursor_x, cursor_y, 0);
    //     LINE_RENDERER.drawLine(COLOR_LINE, POINT_ORIGIN, cursor);
    //     LINE_RENDERER.drawLine(COLOR_LINE, data, cursor);
    //     // LINE_RENDERER.drawPolygon(COLOR_LINE, cursor, 20, 0, 5);
    // }
    // LINE_RENDERER.end();
}