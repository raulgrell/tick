use @import("../src/tick.zig");

use core;
use system;
use math;

use graphics;
use graphics.sprite;
use graphics.texture;
use graphics.shader;
use graphics.primitive;
use graphics.texture;

use engine;
use engine.scene;

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
const COLOR_LINE = vec4(1, 1, 0, 1);

const GameData = struct {
    font: Spritesheet,
    texture: Texture,
    circle: Texture,
    noise: Texture,
    sprite: Sprite,
    is_paused:  bool,
    gui_toggle_active: bool,
    gui_options: [3][]const u8,
    gui_togglegroup_active: usize,
    gui_checkbox_active: bool,
    gui_combobox_active: usize,
    gui_float: f32,
    gui_int: i32,
};

var GAME_DATA = GameData {
    .font = undefined,
    .texture = undefined,
    .noise = undefined,
    .circle = undefined,
    .sprite = undefined,
    .is_paused = false,
    .gui_toggle_active = false,
    .gui_options = [][]const u8 {
        "A",
        "B",
        "C",
    },
    .gui_togglegroup_active = 0,
    .gui_checkbox_active = false,
    .gui_combobox_active = 0,
    .gui_float = 0.0,
    .gui_int = 0,
};

// Scene
var CAMERA: scene.Camera = undefined;
var LEVEL: scene.Level = undefined;

var level_data = [][]const u8 {
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

var tile_map = []?Texture { null } ** 256;

// Primitives
var PRIMITIVE_SHADER: primitive.PrimitiveShader = undefined;
var STRIP_RENDERER: primitive.StripRenderer = undefined;
var LINE_RENDERER:  primitive.LineRenderer  = undefined;

// Texture
var TEXTURE_SHADER: texture.TextureShader = undefined;
var IM_RENDERER:    texture.IMRenderer    = undefined;
var BATCH_RENDERER: texture.BatchRenderer = undefined;

// Particles
var PARTICLE_BATCH  : particle.ParticleBatch2D = undefined;
var PARTICLE_ENGINE : particle.ParticleEngine2D = undefined;

// Light
var LIGHT_SHADER: light.LightShader = undefined;

// Generic Player
var AGENT:  agent.Agent  = undefined;
var AGENT_CONTROLLER: agent.Controller = undefined;

// Top Down Player
var TD_AGENT:  agent.Agent         = undefined;
var TD_PLAYER: agent.TopDownPlayer = undefined;

// Platform Player
var PF_AGENT:  agent.Agent         = undefined;
var PF_PLAYER: agent.ImpulsePlayer = undefined;

// GUI
var GUI: gui.GUI = undefined;

const FONT_PNG = @embedFile("../data/font.png");
const NOISE_PNG = @embedFile("../data/tex.png");


fn togglePause() {
    GAME_DATA.is_paused = !(GAME_DATA.is_paused);
    _= c.printf(c"Toggle Pause\n");
}

fn restartGame() {
    GAME_DATA.is_paused = false;
    _= c.printf(c"Restart Game\n");
}

pub fn init(app: &core.App) {
    GAME_DATA.font = Spritesheet.init(FONT_PNG, FONT_CHAR_WIDTH, FONT_CHAR_HEIGHT) %% {
        panic("Unable to load spritesheet");
    };
    GAME_DATA.noise = Texture.init(NOISE_PNG) %% panic("Unable to load noise");


    tile_map[' '] = GAME_DATA.noise;
    tile_map['#'] = GAME_DATA.noise;
    
    const fb_width = app.window.framebuffer_width;
    const fb_height = app.window.framebuffer_height;

    CAMERA = scene.Camera.init(fb_width, fb_height);

    PRIMITIVE_SHADER = primitive.PrimitiveShader.init();
    STRIP_RENDERER   = primitive.StripRenderer.init(&PRIMITIVE_SHADER, fb_width, fb_height);
    LINE_RENDERER    = primitive.LineRenderer.init(&PRIMITIVE_SHADER, fb_width, fb_height);

    TEXTURE_SHADER = texture.TextureShader.init();
    IM_RENDERER    = texture.IMRenderer.init(&TEXTURE_SHADER, fb_width, fb_height );
    BATCH_RENDERER = texture.BatchRenderer.init(&TEXTURE_SHADER, fb_width, fb_height );

    PARTICLE_ENGINE = particle.ParticleEngine2D.init();
    PARTICLE_BATCH = particle.ParticleBatch2D.init(&GAME_DATA.noise, 32, 1, particle.defaultParticleUpdate);
    PARTICLE_ENGINE.addParticleBatch(&PARTICLE_BATCH);

    GUI = gui.GUI.init(&app.input, &IM_RENDERER, &GAME_DATA.font, &GAME_DATA.noise);

    LIGHT_SHADER = light.LightShader.init();

    LEVEL = Level.init(level_data[0..], DIMENSIONS_TILE);
    const level_start = LEVEL.start;
    const level_center = LEVEL.getCenter();
    const level_end = LEVEL.end;
    
    TD_AGENT = agent.Agent.init(level_start.xyz(), DIMENSIONS_AGENT, 2, &GAME_DATA.noise);
    TD_PLAYER = agent.TopDownPlayer.init(&TD_AGENT, &app.input, &CAMERA);
    
    PF_AGENT = agent.Agent.init(level_end.xyz(), DIMENSIONS_AGENT, 2, &GAME_DATA.noise);
    PF_PLAYER = agent.ImpulsePlayer.init(&PF_AGENT, &app.input, &CAMERA);
    
    AGENT = agent.Agent.init(level_start.xyz(), DIMENSIONS_AGENT, 2, &GAME_DATA.noise);
    AGENT_CONTROLLER = agent.Controller.init(f32(fb_width), f32(fb_height));
    AGENT_CONTROLLER.add(&AGENT);
    AGENT_CONTROLLER.addNew(agent.Agent.init(level_center.xyz().cast(f32), DIMENSIONS_AGENT, 2, &GAME_DATA.noise));
}   

pub fn update(app: &core.App, deltaTime: f32) -> %void {
    if(app.input.keyPressed[c.GLFW_KEY_P]) togglePause();
    if(app.input.keyPressed[c.GLFW_KEY_R]) restartGame();

    if (GAME_DATA.is_paused) return;

    PARTICLE_ENGINE.update(deltaTime);
    PARTICLE_BATCH.addParticle(vec2(64,64), vec2(10,0), vec4(0,0,0,1), 60, 10);

    if(app.input.buttonDown[c.GLFW_MOUSE_BUTTON_LEFT])
        TD_PLAYER.agent.position = app.input.cursor_position.xyz();
    
    AGENT_CONTROLLER.update(&LEVEL, deltaTime);
    TD_PLAYER.update(&LEVEL, deltaTime);
    PF_PLAYER.update(&LEVEL, deltaTime);
}

pub fn draw(app: &core.App) {
    const cursor = app.input.cursor_position;
    
    CAMERA.update();

    // 2D Primitives, Batched 
    STRIP_RENDERER.begin();
    {
        STRIP_RENDERER.submit(COLOR_OBJ, cursor.x, cursor.y, 8.0, 8.0);
    }
    STRIP_RENDERER.end();

    // 2D Textures, Immediate
    IM_RENDERER.begin();
    {
        // LEVEL.draw(&IM_RENDERER, tile_map[0..]);

        // IM_RENDERER.draw_text(&GAME_DATA.font, "Hello", 32, 32, 1);
        // IM_RENDERER.draw_rect(&GAME_DATA.noise, 128, 32, 64, 64);
        // IM_RENDERER.draw_rect(&GAME_DATA.noise, 192, 32, 64, 64);
        // IM_RENDERER.draw_sprite(&GAME_DATA.sprite, 256, 32, 32, 32);

        // AGENT_CONTROLLER.draw(&IM_RENDERER);

        // TD_AGENT.draw(&IM_RENDERER);
        // PF_AGENT.draw(&IM_RENDERER);
        const bounds_label        = gui.Rectangle {.x = 64, .y =   0, .width = 128, .height = 32};
        const bounds_button       = gui.Rectangle {.x = 64, .y =  32, .width = 128, .height = 32};
        const bounds_togglebutton = gui.Rectangle {.x = 64, .y =  64, .width = 128, .height = 32};
        const bounds_togglegroup  = gui.Rectangle {.x = 64, .y =  96, .width = 128, .height = 32};
        const bounds_checkbox     = gui.Rectangle {.x = 64, .y = 128, .width = 128, .height = 32};
        const bounds_combobox     = gui.Rectangle {.x = 64, .y = 160, .width = 128, .height = 32};
        const bounds_slider       = gui.Rectangle {.x = 64, .y = 192, .width = 128, .height = 32};
        const bounds_sliderbar    = gui.Rectangle {.x = 64, .y = 224, .width = 128, .height = 32};
        const bounds_progressbar  = gui.Rectangle {.x = 64, .y = 256, .width = 128, .height = 32};
        const bounds_spinner      = gui.Rectangle {.x = 64, .y = 288, .width = 128, .height = 32};
        const bounds_textbox      = gui.Rectangle {.x = 64, .y = 320, .width = 128, .height = 32};
        const bounds_icon         = gui.Rectangle {.x = 320, .y = 320, .width = 128, .height = 32};
        

        GUI.Label( bounds_label, "Hello");
        if (GUI.Button(bounds_button, "Hello")) %%std.io.stdout.printf("Button\n");

        GAME_DATA.gui_toggle_active = GUI.ToggleButton(bounds_togglebutton, "Text", GAME_DATA.gui_toggle_active);
        GUI.ToggleGroup(bounds_togglegroup, GAME_DATA.gui_options[0..], &GAME_DATA.gui_togglegroup_active);
        GUI.CheckBox(bounds_checkbox, &GAME_DATA.gui_checkbox_active);
        GUI.ComboBox(bounds_combobox, GAME_DATA.gui_options[0..], &GAME_DATA.gui_combobox_active);
        GUI.Slider(bounds_slider, 0, 100, &GAME_DATA.gui_float);
        GUI.SliderBar(bounds_sliderbar, 0, 100, &GAME_DATA.gui_float);
        GUI.ProgressBar(bounds_progressbar, 0, 100, &GAME_DATA.gui_float);
        GUI.Spinner(bounds_spinner, 0, 100, &GAME_DATA.gui_int);
        GUI.TextBox(bounds_textbox, "Text");
        GUI.Icon(bounds_icon, &GAME_DATA.noise);
    }
    IM_RENDERER.end();

    // 2D Textures, Batched
    BATCH_RENDERER.begin();
    {
        const destRect = vec4(16, 16, 32, 32);
        const uvRect = vec4(0, 0, 1, 1);

        BATCH_RENDERER.submit(destRect, uvRect, GAME_DATA.noise, 0, COLOR_OBJ, 0);
        BATCH_RENDERER.submit(destRect.mul_scalar(1.5), uvRect, GAME_DATA.noise, 0, COLOR_OBJ, 0);
        BATCH_RENDERER.submit(destRect.mul_scalar(2), uvRect, GAME_DATA.noise, 0, COLOR_MID, 0);
        BATCH_RENDERER.submit(destRect.mul_scalar(2.5), uvRect, GAME_DATA.noise, 0, COLOR_MID, 0);
        BATCH_RENDERER.submit(destRect.mul_scalar(3), uvRect, GAME_DATA.noise, 0, COLOR_MID, 0);
    }
    BATCH_RENDERER.end();
    BATCH_RENDERER.render();

    PARTICLE_ENGINE.draw(&BATCH_RENDERER);    

    // 3D
    LINE_RENDERER.begin();
    {
        LINE_RENDERER.drawLine(COLOR_LINE, POINT_ORIGIN, cursor.xyz());
        // LINE_RENDERER.drawPolygon(COLOR_LINE, cursor, 20, 0, 5);
    }
    LINE_RENDERER.end();

    if (GAME_DATA.gui_toggle_active) %%std.io.stdout.printf("Toggle");
    if (GAME_DATA.gui_togglegroup_active > 0) %%std.io.stdout.printf("{}", GAME_DATA.gui_togglegroup_active);
    if (GAME_DATA.gui_checkbox_active) %%std.io.stdout.printf("Checkbox");
    if (GAME_DATA.gui_combobox_active > 0) %%std.io.stdout.printf("{}", GAME_DATA.gui_combobox_active);
}

pub fn deinit(app: &core.App) {

}