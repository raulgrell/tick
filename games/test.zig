const os = @import("std").os;

use @import("../src/tick.zig");
use renderable;
use math;

const FONT_CHAR_WIDTH  = 18;
const FONT_CHAR_HEIGHT = 32;

const FONT_PNG    = @embedFile("../data/font.png");
const TEXTURE_PNG = @embedFile("../data/tex.png");
const SPRITE_PNG  = @embedFile("../data/tiles/tile_202.png");

const POINT_ORIGIN = vec3(0, 0, 0);
const POINT_UNITS  = vec3(1, 1, 1);
const POINT_XUNIT  = vec3(1, 0, 0);
const POINT_YUNIT  = vec3(0, 1, 0);
const POINT_ZUNIT  = vec3(0, 0, 1);

const COLOR_OBJ  = vec4(1, 0.5, 1, 0.5);
const COLOR_MID  = vec4(0.5, 0.5, 0.5, 0.5);
const COLOR_LINE = vec4(1, 0.5, 1, 1);

const GameData = struct {
    font: Spritesheet,
    texture: Texture,
    sprite: Sprite,
    is_paused:  bool,
    x:          f32,
    y:          f32,
};

var GAME_DATA = GameData {
    .font = undefined,
    .texture = undefined,
    .sprite = undefined,
    .is_paused = false,
    .x = 0,
    .y = 0,
};

// Camera
var CAMERA: camera.Camera = undefined;

// Level: 
var LEVEL: level.Level = undefined;

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

// Controllers
var AGENT_CONTROLLER: entity.Controller = undefined;

// Cell
// Grid
// PlatformPlayer
// Level
// Physics
// Scene


// Grouping

// Layer
// LayerStack
// Group
// Grid

fn togglePause() {
    GAME_DATA.is_paused = !(GAME_DATA.is_paused);
    _= c.printf(c"Toggle Pause\n");
}

fn restartGame() {
    GAME_DATA.x = 0.0;
    GAME_DATA.y = 0.0;
    GAME_DATA.is_paused = false;
    _= c.printf(c"Restart Game\n");
}

pub fn setup(app: &core.App) {
    GAME_DATA.font = Spritesheet.init(FONT_PNG, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT) %% {
        _ = c.printf(c"unable to read font\n");
        os.abort();
    };

    GAME_DATA.texture = Texture.init(TEXTURE_PNG) %% {
        _ = c.printf(c"unable to read texture\n");
        os.abort();
    };

    GAME_DATA.sprite = Sprite.init(SPRITE_PNG) %% {
        _ = c.printf(c"unable to read sprite\n");
        os.abort();
    };
    
    const fb_width = app.window.framebuffer_width;
    const fb_height = app.window.framebuffer_height;

    CAMERA = camera.Camera.init(fb_width, fb_height);

    PRIMITIVE_SHADER = shader.PrimitiveShader.init();
    STRIP_RENDERER   = renderer.StripRenderer.init(&PRIMITIVE_SHADER, fb_width, fb_height);
    LINE_RENDERER    = renderer.LineRenderer.init(&PRIMITIVE_SHADER, fb_width, fb_height );

    TEXTURE_SHADER = shader.TextureShader.init();
    IM_RENDERER    = renderer.IMRenderer.init(&TEXTURE_SHADER, fb_width, fb_height );
    BATCH_RENDERER = renderer.BatchRenderer.init(&TEXTURE_SHADER, fb_width, fb_height );

    LIGHT_SHADER = light.LightShader.init();

    // LEVEL = Level.init();

    AGENT_CONTROLLER = entity.Controller.init(f32(fb_width), f32(fb_height));

    AGENT = entity.Agent.init(POINT_ORIGIN, POINT_UNITS, &GAME_DATA.texture);
    PLAYER = entity.Player.init(&AGENT, &app.input, &CAMERA);

    TD_AGENT = entity.Agent.init(POINT_ORIGIN, POINT_UNITS, &GAME_DATA.texture);
    TD_PLAYER = entity.TopDownPlayer.init(&TD_AGENT, &app.input, &CAMERA);
}   

pub fn update(app: &core.App, deltaTime: f32) {
    if(app.input.keyPressed[c.GLFW_KEY_P]) togglePause();
    if(app.input.keyPressed[c.GLFW_KEY_R]) restartGame();

    AGENT_CONTROLLER.update(deltaTime);

    if (GAME_DATA.is_paused) return;

    GAME_DATA.x += deltaTime;
    GAME_DATA.y += deltaTime;

    if(app.input.keyDown[c.GLFW_KEY_W]) GAME_DATA.y -= deltaTime * 2;
    if(app.input.keyDown[c.GLFW_KEY_S]) GAME_DATA.y += deltaTime * 2;
    if(app.input.keyDown[c.GLFW_KEY_A]) GAME_DATA.x -= deltaTime * 2;
    if(app.input.keyDown[c.GLFW_KEY_D]) GAME_DATA.x += deltaTime * 2;

    // agent.position.set(GAME_DATA.x/2, GAME_DATA.y/2, 0);
    TD_PLAYER.update(". .. ...", deltaTime);
}


pub fn draw(app: &core.App) {
    const c_x = f32(app.input.cursorX);
    const c_y = f32(app.input.cursorY);

    STRIP_RENDERER.begin();
    {
        STRIP_RENDERER.submit(COLOR_OBJ, GAME_DATA.x, GAME_DATA.y, 20.0, 20.0);
        STRIP_RENDERER.submit(COLOR_OBJ, c_x, c_y, 200.0, 200.0);
    }
    STRIP_RENDERER.end();

    IM_RENDERER.begin();
    {
        IM_RENDERER.draw_text(&GAME_DATA.font, "Hello", 0, 0, 1);
        IM_RENDERER.draw_sprite(&GAME_DATA.sprite, 128, 128, 64, 64);
        IM_RENDERER.draw_rect(&GAME_DATA.texture, 128, 128, 128, 512);
        IM_RENDERER.draw_sprite(&GAME_DATA.sprite, 256, 256, 128, 128);
        IM_RENDERER.draw_rect(&GAME_DATA.texture, 128, 128, 512, 128);
        AGENT.draw(&IM_RENDERER);
        TD_AGENT.draw(&IM_RENDERER);
    }
    IM_RENDERER.end();

    BATCH_RENDERER.begin();
    {
        const destRect = vec4(10, 10, 512, 10);
        const uvRect = vec4(0, 0, 1, 1);

        BATCH_RENDERER.submit(destRect, uvRect, GAME_DATA.texture.id, 0, COLOR_OBJ, 0);
    }
    BATCH_RENDERER.end();
    BATCH_RENDERER.render();

    LINE_RENDERER.begin();
    {
        const data = vec3(GAME_DATA.x, GAME_DATA.y, 0);
        const cursor = vec3(c_x, c_y, 0);
        LINE_RENDERER.drawLine(COLOR_LINE, POINT_ORIGIN, cursor);
        LINE_RENDERER.drawLine(COLOR_LINE, data, cursor);
        // LINE_RENDERER.drawPolygon(COLOR_LINE, cursor, 20, 0, 5);
    }
    LINE_RENDERER.end();
}