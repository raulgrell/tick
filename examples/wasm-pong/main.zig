const std = @import("std");

// Shaders
extern fn compileShader(source: *const u8 , len:  c_uint, type: c_uint) c_uint;
extern fn linkShaderProgram(vertexShaderId: c_uint, fragmentShaderId: c_uint) c_uint;

// GL
extern fn glClearColor(_: f32, _: f32, _: f32, _: f32) void;
extern fn glEnable(_: c_uint) void;
extern fn glDepthFunc(_: c_uint) void;
extern fn glBlendFunc(_: c_uint, _: c_uint) void;
extern fn glClear(_: c_uint) void;
extern fn glGetAttribLocation(_: c_uint, _: *const u8, _: c_uint) c_int;
extern fn glGetUniformLocation(_: c_uint, _: *const u8, _: c_uint) c_int;
extern fn glUniform4fv(_: c_int, _: f32, _: f32, _: f32, _: f32) void;
extern fn glUniform1i(_: c_int, _: c_int) void;
extern fn glUniform1f(_: c_int, _: f32) void;
extern fn glCreateBuffer() c_uint;
extern fn glBindBuffer(_: c_uint, _: c_uint) void;
extern fn glBufferData(_: c_uint, _: *const f32, _: c_uint, _: c_uint) void;
extern fn glUseProgram(_: c_uint) void;
extern fn glEnableVertexAttribArray(_: c_uint) void;
extern fn glVertexAttribPointer(_: c_uint, _: c_uint, _: c_uint, _: c_uint, _: c_uint, _: c_uint) void;
extern fn glDrawArrays(_: c_uint, _: c_uint, _: c_uint) void;
extern fn glCreateTexture() c_uint;
extern fn glBindTexture(_: c_uint, _: c_uint) void;
extern fn glTexImage2D(_: c_uint, _: c_uint, _: c_uint, _: c_uint, _: c_uint, _: c_uint, _: c_uint, _: c_uint, _: *const u8, _: c_uint) void;
extern fn glTexParameteri(_: c_uint, _: c_uint, _: c_uint) void;
extern fn glActiveTexture(_: c_uint) void;

extern fn consoleLog(_: c_int) void;
extern fn consoleLogF(_: f32) void;
extern fn playAudio(_: [*c]f32, _: c_uint) void;
extern fn setScore(_: c_uint, _: c_uint) void;

// Identifier constants pulled from WebGLRenderingContext
const GL_VERTEX_SHADER: c_uint = 35633;
const GL_FRAGMENT_SHADER: c_uint = 35632;
const GL_ARRAY_BUFFER: c_uint = 34962;
const GL_TRIANGLES: c_uint = 4;
const GL_STATIC_DRAW: c_uint = 35044;
const GL_FLOAT: c_uint = 5126;
const GL_DEPTH_TEST: c_uint = 2929;
const GL_LEQUAL: c_uint = 515;
const GL_COLOR_BUFFER_BIT: c_uint = 16384;
const GL_DEPTH_BUFFER_BIT: c_uint = 256;
const GL_TEXTURE_2D: c_uint = 3553;
const GL_RGBA: c_uint = 6408;
const GL_UNSIGNED_BYTE: c_uint = 5121;
const GL_TEXTURE_MAG_FILTER: c_uint = 10240;
const GL_TEXTURE_MIN_FILTER: c_uint = 10241;
const GL_NEAREST: c_uint = 9728;
const GL_TEXTURE0: c_uint = 33984;
const GL_BLEND: c_uint = 3042;
const GL_SRC_ALPHA: c_uint = 770;
const GL_ONE_MINUS_SRC_ALPHA: c_uint = 771;
const GL_ONE: c_uint= 1;

const vertexShader = 
  \\attribute vec2 a_position;
  \\attribute vec2 a_texcoord;
  \\uniform vec4 u_offset;
  \\varying mediump vec2 v_texcoord;
  \\void main() {
  \\  gl_Position = vec4(a_position, 1.0, 1.0) + u_offset;
  \\  v_texcoord = a_texcoord;
  \\}
;

const fragmentShader =
  \\precision mediump float;
  \\varying mediump vec2 v_texcoord;
  \\uniform sampler2D u_sampler;
  \\uniform float u_opacity;
  \\void main() {
  \\  gl_FragColor = texture2D(u_sampler, v_texcoord);
  \\  gl_FragColor.a *= u_opacity;
  \\}
;

const BALL_TAIL_VERTICES = []f32 {
  -0.04,-0.04,0,0, 0.04,0.04,1,1, -0.04,0.04,0,1,
  -0.04,-0.04,0,0, 0.04,-0.04,1,0, 0.04,0.04,1,1
};

const BALL_TAIL_TEXTURE = []u8 {
  0x00,0x00,0x00,0x00, 0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC, 0x00,0x00,0x00,0x00,
  0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC,
  0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC,
  0x00,0x00,0x00,0x00, 0xFF,0x00,0x00,0xCC, 0xFF,0x00,0x00,0xCC, 0x00,0x00,0x00,0x00
};

const AUDIO_BUFFER_SIZE = 8192;
var beep = []f32 { 0 } ** AUDIO_BUFFER_SIZE;
var boop = []f32 { 0 } ** AUDIO_BUFFER_SIZE;
var bloop = []f32 { 0 } ** AUDIO_BUFFER_SIZE;

const Vec2 = struct {
  x:f32,
  y:f32,
};

const Model = struct {
  vertexBufferId: c_uint,
  numVertices: c_uint,
  textureId: c_uint,
  extent: Vec2,
};

const Sprite = struct {
  position: Vec2,
  model: *Model,
};

const Particle = struct {
  position: Vec2,
  velocity: Vec2,
  acceleration: Vec2,
  life: f32,
  totalLife: f32,
};

const MAX_PARTICLES = 100;

const ParticleSystem = struct {
  particles: [MAX_PARTICLES]Particle,
  model: *Model,
  alive: c_uint,
};

var programId: c_uint = 0;
var positionAttributeLocation: c_int = 0;
var positionAttributeName = "a_position";
var texcoordAttributeLocation: c_int = 0;
var texcoordAttributeName = "a_texcoord";
var offsetUniformLocation: c_int = 0;
var offsetUniformName = "u_offset";
var samplerUniformLocation: c_int = 0;
var samplerUniformName = "u_sampler";
var opacityUniformLocation: c_int = 0;
var opacityUniformName = "u_opacity";
var positionBuffer: c_uint = 0;

var ballTailModel = make_model();

var ballTail = make_particle_system(&ballTailModel);

var leftScore: c_uint = 0;
var rightScore: c_uint = 0;

fn make_sprite(model: *Model, x: f32, y: f32) Sprite {
  return Sprite {
    .position = Vec2 {.x = x, .y = y},
    .model =  model,
  };
}

fn make_model() Model {
  return Model {
    .vertexBufferId = 0,
    .numVertices = 0,
    .textureId = 0,
    .extent = Vec2{.x = 0, .y = 0},
  };
}

fn make_particle_system(model: *Model) ParticleSystem {
  return ParticleSystem { 
    .particles = undefined,
    .model = model,
    .alive = 0,
  };
}

fn initTexture(data: []const u8, width: c_uint, height: c_uint) c_uint {
  const id: c_uint = glCreateTexture();
  glBindTexture(GL_TEXTURE_2D, id);
  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, &data[0], width * height * @sizeOf(f32));
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

  return id;
}

fn initModel(m: *Model, vertices: []const f32, textureId: c_uint) void {
  m.vertexBufferId = glCreateBuffer();
  m.numVertices = vertices.len;
  m.textureId = textureId;
  glBindBuffer(GL_ARRAY_BUFFER, m.vertexBufferId);
  glBufferData(GL_ARRAY_BUFFER, &vertices[0], vertices.len, GL_STATIC_DRAW);

  var i: c_uint = 0;
  const a: f32 = 1;
  while(i < vertices.len) : (i += 4) {
    const fx: f32 = vertices[i];
    const fy: f32 = vertices[i+1];
    m.extent.x = if ((if (fx > m.extent.x) fx else -fx) > (if (m.extent.x != 0) -fx else m.extent.x)) a else 0;
    m.extent.y = if ((if (fy > m.extent.y) fy else -fy) > (if (m.extent.y != 0) -fy else m.extent.y)) a else 0;
  }
  m.extent.x *= 0.9;
  m.extent.y *= 0.9;
}

export fn onInit() void {
  glClearColor(0.1, 0.1, 0.1, 1.0);
  glEnable(GL_DEPTH_TEST);
  glEnable(GL_BLEND);
  glDepthFunc(GL_LEQUAL);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE);
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

  const vsId: c_uint = compileShader(&vertexShader[0], vertexShader.len, GL_VERTEX_SHADER);
  const fsId: c_uint = compileShader(&fragmentShader[0], fragmentShader.len, GL_FRAGMENT_SHADER);

  programId = linkShaderProgram(vsId, fsId);

  positionAttributeLocation = glGetAttribLocation(programId, &positionAttributeName[0], positionAttributeName.len);
  texcoordAttributeLocation = glGetAttribLocation(programId, &texcoordAttributeName[0], texcoordAttributeName.len);
  offsetUniformLocation = glGetUniformLocation(programId, &offsetUniformName[0], offsetUniformName.len);
  samplerUniformLocation = glGetUniformLocation(programId, &samplerUniformName[0], samplerUniformName.len);
  opacityUniformLocation = glGetUniformLocation(programId, &opacityUniformName[0], opacityUniformName.len);

  const ballTailTextureId: c_uint = initTexture(BALL_TAIL_TEXTURE, 4, 4);
  initModel(&ballTailModel, BALL_TAIL_VERTICES, ballTailTextureId);

  var i: c_uint = 0;
  var a: f32 = 0.1;
  while (i < AUDIO_BUFFER_SIZE) : (i += 1) {
    beep[i] = if ((i/64) % 2 == 1) a else -a;
    boop[i] = if ((i/128) % 2 == 1) a else -a;
    bloop[i] = beep[i]/2 + boop[i]/2;
  }
}

var previous: c_int = 0;

export fn onAnimationFrame(timestamp: c_int) void {
  const delta: f32 = @intToFloat(f32, if (previous > 0) timestamp - previous else 0);
  previous = timestamp;
  
  createParticle(&ballTail, 0, 0, std.math.sin(delta / 111) * 10, std.math.sin(delta / 333) * 10, 0, 0, 1000);
  updateParticleSystem(&ballTail, delta);

  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  glUseProgram(programId);
  glEnableVertexAttribArray(@intCast(c_uint, positionAttributeLocation));
  glEnableVertexAttribArray(@intCast(c_uint, texcoordAttributeLocation));
  renderParticleSystem(&ballTail);
}

const KEY_UP: c_uint = 38;
const KEY_DOWN: c_uint = 40;
const KEY_A: c_uint = 65;
const KEY_Z: c_uint = 90;

export fn onKey(keyCode: c_int, state: u8) void {
  if (state == 0)
    return;
  playAudio(&boop[0], AUDIO_BUFFER_SIZE);
}

fn createParticle(ps: *ParticleSystem, x: f32, y: f32, vx: f32, vy: f32, ax: f32, ay: f32, life: f32) void {
  if(ps.alive < MAX_PARTICLES) {
    var np: *Particle = &ps.particles[ps.alive];
    np.position.x = x;
    np.position.y = y;
    np.velocity.x = vx;
    np.velocity.y = vy;
    np.acceleration.x = ax;
    np.acceleration.y = ay;
    np.life = life;
    np.totalLife = life;
    ps.alive += 1;
  }
}

fn updateParticleSystem(ps: *ParticleSystem, delta: f32) void {
  var i: c_uint = 0;
  while (i < ps.alive) : (i += 1) {
    var p: *Particle = &ps.particles[i];
    if(delta > p.life) {
      ps.alive -= 1;
      if(i < ps.alive) {
        var np: *Particle = &ps.particles[ps.alive];
        p.position = np.position;
        p.velocity = np.velocity;
        p.acceleration = np.acceleration;
        p.life = np.life;
        p.totalLife = np.totalLife;
        i -= 1;
      }
    } else {
      p.life -= delta;
      p.velocity.x += p.acceleration.x * delta / 1000.0;
      p.velocity.y += p.acceleration.y * delta / 1000.0;
      p.position.x += p.velocity.x * delta / 1000.0;
      p.position.y += p.velocity.y * delta / 1000.0;
    }
  }
}

fn renderParticleSystem(ps: *const ParticleSystem) void {
  glBindBuffer(GL_ARRAY_BUFFER, ps.model.vertexBufferId);
  glActiveTexture(GL_TEXTURE0);
  glBindTexture(GL_TEXTURE_2D, ps.model.textureId);
  glVertexAttribPointer(@intCast(c_uint, positionAttributeLocation), 2, GL_FLOAT, 0, 16, 0);
  glVertexAttribPointer(@intCast(c_uint, texcoordAttributeLocation), 2, GL_FLOAT, 0, 16, 8);
  glUniform1i(samplerUniformLocation, 0);

  const numTriangles: c_uint = ps.model.numVertices / 4;

  var i: c_uint = 0;
  while (i < ps.alive) : (i += 1) {
    const p: *const Particle = &ps.particles[i];
    glUniform1f(opacityUniformLocation, p.life / p.totalLife);
    glUniform4fv(offsetUniformLocation, p.position.x, p.position.y, 0.0, 0.0);
    glDrawArrays(GL_TRIANGLES, 0, numTriangles);
  }
}
