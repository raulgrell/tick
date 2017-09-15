// System
use @import("../system/index.zig");
use @import("../math/index.zig");

use asset;

// Graphics
use @import("texture.zig");

pub const Sprite = struct {
    texture: Texture,
    vertex_buffer: c.GLuint,
    uv_buffer: c.GLuint,

    pub fn init(compressed_bytes: []const u8) -> %Sprite {
        
        var s = Sprite {
            .texture = %return Texture.init(compressed_bytes),
            .vertex_buffer = 0,
            .uv_buffer = 0,
        };

        const vertices = [][3]c.GLfloat {
            []c.GLfloat{0.0, 0.0, 0.0},
            []c.GLfloat{0.0, 1.0, 0.0},
            []c.GLfloat{1.0, 0.0, 0.0},
            []c.GLfloat{1.0, 1.0, 0.0},
        };

        const tex_coords = [][2]c.GLfloat{
            []c.GLfloat{0, 0},
            []c.GLfloat{0, 1},
            []c.GLfloat{1, 0},
            []c.GLfloat{1, 1},
        };

        c.glGenBuffers(1, &s.vertex_buffer);
        %defer c.glDeleteBuffers(1, &s.vertex_buffer);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.vertex_buffer);
        c.glBufferData(c.GL_ARRAY_BUFFER, 4 * 3 * @sizeOf(c.GLfloat), @ptrCast(&c_void, &vertices[0][0]), c.GL_STATIC_DRAW);

        c.glGenBuffers(1, &s.uv_buffer);
        %defer c.glDeleteBuffers(1, &s.uv_buffer);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.uv_buffer);
        c.glBufferData(c.GL_ARRAY_BUFFER, 4 * 2 * @sizeOf(c.GLfloat), @ptrCast(&c_void, &tex_coords[0][0]), c.GL_STATIC_DRAW);

        return s;
    }

    pub fn draw(s: &Sprite, shader: &TextureShader, mvp: &const Mat4) {
        shader.program.bind();
        shader.program.setUniform_mat4(shader.uniform_mvp, mvp);
        shader.program.setUniform_int(shader.uniform_tex, c.GLint(s.texture.id));

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.vertex_buffer);
        c.glEnableVertexAttribArray(c.GLuint(shader.attrib_position));
        c.glVertexAttribPointer(c.GLuint(shader.attrib_position), 3, c.GL_FLOAT, c.GL_FALSE, 0, null);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.uv_buffer);
        c.glEnableVertexAttribArray(c.GLuint(shader.attrib_uv));
        c.glVertexAttribPointer(c.GLuint(shader.attrib_uv), 2, c.GL_FLOAT, c.GL_FALSE, 0, null);

        s.texture.bind();
        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, 4);
    }
};

pub const Spritesheet = struct {
    img: PngImage,
    count: usize,
    width: usize,
    height: usize,
    texture_id: c.GLuint,
    vertex_buffer: c.GLuint,
    tex_coord_buffers: []c.GLuint,

    pub fn init(compressed_bytes: []const u8, w: usize, h: usize) -> %Spritesheet {
        var s: Spritesheet = undefined;

        s.img = %return PngImage.create(compressed_bytes);
        const col_count = s.img.width / w;
        const row_count = s.img.height / h;
        s.width = w;
        s.height = h;
        s.count = col_count * row_count;

        c.glGenTextures(1, &s.texture_id);
        %defer c.glDeleteTextures(1, &s.texture_id);

        c.glBindTexture(c.GL_TEXTURE_2D, s.texture_id);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_MAG_FILTER, c.GL_NEAREST);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_MIN_FILTER, c.GL_NEAREST);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_WRAP_S, c.GL_CLAMP_TO_EDGE);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_WRAP_T, c.GL_CLAMP_TO_EDGE);
        c.glPixelStorei(c.GL_PACK_ALIGNMENT, 4);
        c.glTexImage2D(c.GL_TEXTURE_2D, 0, c.GL_RGBA, c_int(s.img.width), c_int(s.img.height),
                0, c.GL_RGBA, c.GL_UNSIGNED_BYTE, @ptrCast(&c_void, &s.img.raw[0]));

        c.glGenBuffers(1, &s.vertex_buffer);
        %defer c.glDeleteBuffers(1, &s.vertex_buffer);

        const vertices = [][3]c.GLfloat {
            []c.GLfloat{0.0,          0.0,          0.0},
            []c.GLfloat{0.0,          c.GLfloat(h), 0.0},
            []c.GLfloat{c.GLfloat(w), 0.0,          0.0},
            []c.GLfloat{c.GLfloat(w), c.GLfloat(h), 0.0},
        };

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.vertex_buffer);
        c.glBufferData(c.GL_ARRAY_BUFFER, 4 * 3 * @sizeOf(c.GLfloat), @ptrCast(&c_void, &vertices[0][0]), c.GL_STATIC_DRAW);

        s.tex_coord_buffers = c.mem.alloc(c.GLuint, s.count) %% return error.NoMem;
        %defer c.mem.free(s.tex_coord_buffers);

        c.glGenBuffers(c.GLint(s.tex_coord_buffers.len), &s.tex_coord_buffers[0]);
        %defer c.glDeleteBuffers(c.GLint(s.tex_coord_buffers.len), &s.tex_coord_buffers[0]);

        for (s.tex_coord_buffers) |tex_coord_buffer, i| {
            const upside_down_row = i / col_count;
            const col = i % col_count;
            const row = row_count - upside_down_row - 1;

            const x = f32(col * w);
            const y = f32(row * h);

            const img_w = f32(s.img.width);
            const img_h = f32(s.img.height);
            const tex_coords = [][2]c.GLfloat {
                []c.GLfloat{ x / img_w, (y + f32(h)) / img_h, },
                []c.GLfloat{ x / img_w, y / img_h, },
                []c.GLfloat{ (x + f32(w)) / img_w, (y + f32(h)) / img_h, },
                []c.GLfloat{ (x + f32(w)) / img_w, y / img_h, },
            };

            c.glBindBuffer(c.GL_ARRAY_BUFFER, tex_coord_buffer);
            c.glBufferData(c.GL_ARRAY_BUFFER, 4 * 2 * @sizeOf(c.GLfloat), @ptrCast(&c_void, &tex_coords[0][0]), c.GL_STATIC_DRAW);
        }

        return s;
    }

    pub fn draw(s: &Spritesheet, shader: &TextureShader, index: usize, mvp: &const Mat4) {
        shader.program.bind();
        shader.program.setUniform_mat4(shader.uniform_mvp, mvp);
        shader.program.setUniform_int(shader.uniform_tex, c.GLint(s.texture_id));

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.vertex_buffer);
        c.glEnableVertexAttribArray(c.GLuint(shader.attrib_position));
        c.glVertexAttribPointer(c.GLuint(shader.attrib_position), 3, c.GL_FLOAT, c.GL_FALSE, 0, null);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.tex_coord_buffers[index]);
        c.glEnableVertexAttribArray(c.GLuint(shader.attrib_uv));
        c.glVertexAttribPointer(c.GLuint(shader.attrib_uv), 2, c.GL_FLOAT, c.GL_FALSE, 0, null);

        c.glActiveTexture(c.GL_TEXTURE0 + s.texture_id);
        c.glBindTexture(c.GL_TEXTURE_2D, s.texture_id);

        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, 4);
    }
    
    pub fn deinit(s: &Spritesheet) {
        c.glDeleteBuffers(c.GLint(s.tex_coord_buffers.len), &s.tex_coord_buffers[0]);
        mem.free(c.GLuint, s.tex_coord_buffers);
        c.glDeleteBuffers(1, &s.vertex_buffer);
        c.glDeleteTextures(1, &s.texture_id);

        s.img.destroy();
    }
};

const Frame = struct {
    src_rect: Rectangle,
    pos_offset: Vec2,
    frame_time: float,

    fn init(rect: &const Rectangle, pos: &const Vec2, time: f32) -> Frame {
        Frame {
            .src_rect = rect,
            .pos_offset = pos,
            .frame_time = time,
        }
    }
};

const SpriteUnit = struct {
    pos: Vec2,
    scale: Vec2,
    origin: Vec2,
    angle: f32,
    verts: []Vertex2D,
    frames: []Frame,
    texture: &Texture,
    current_frame: usize,
    animation_speed: f32,
    time: f32,
    playing: bool,
    reverse: bool,
    loop: bool,

    const Self = this;

    fn init() -> Self {
        Self {
            .current_frame = 0,
            .animation_speed = 1.0,
            .time = 0.0,
            .playing = false,
            .reverse = false,
            .loop = false,
        }
    }

    fn create(pos: &const Vec2, scale: &const Vec2, angle: f32, origin: &const Vec2, size: &const Vec2, file_path: []const u8, src_rect: &const Rectangle) {
        self.pos = pos;
        self.scale = scale;
        self.angle = angle;
        self.origin = origin;
        self.current_frame = 0;
        self.animation_speed = 1.0;
        self.time = 0.0;
        self.playing = false;
        self.reverse = false;
        self.loop = false;

        if(!resManager.aquireTexture(self.texture, file_path)) {
            panic("Failed to aqure texture for use in Sprite: ", file_path);
            return;
        }

        //set up vertex data in object(local) space
        self.verts.resize(4);

        self.verts[0].setPos(0.0, 0.0, 0.0);
        self.verts[0].setColor(VOLT_COLOR_WHITE);

        self.verts[1].setPos(0.0, size.h, 0.0);
        self.verts[1].setColor(VOLT_COLOR_WHITE);

        self.verts[2].setPos(size.w, size.h, 0.0);
        self.verts[2].setColor(VOLT_COLOR_WHITE);

        self.verts[3].setPos(size.w, 0.0, 0.0);
        self.verts[3].setColor(VOLT_COLOR_WHITE);

        if(src_rect.width <= 0 or src_rect.height <= 0) {
            src_rect.width = self.texture.width - src_rect.x;
            src_rect.height = self.texture.height - src_rect.y;
        }

        this.addFrame(src_rect, vec2(0.0, 0.0), 0.0);
        this.setFrame(0);

    }

    fn create(pos: &const Vec2, size: &const Vec2, file_path: []const u8, src_rect: &const Rectangle) {
        this.setPos(pos);
        this.create(null, null, null, null, size, file_path, src_rect);
    }

    fn loadTexture(file_path: []const u8) {
        if(!resManager.aquireTexture(self.texture, file_path)) {
            panic("Failed to aqure texture for use in Sprite: ", file_path);
            return;
        }
    }

    fn addFrame(src_rect: &const Rectangle, pos_offset: &const Vec2, frame_time: f32) {
        const uv = Rectangle {
            .x = src_rect.x / self.texture.width,
            .y = (self.texture.height - (src_rect.y + src_rect.height)) / self.texture.height,
            .width = src_rect.width / self.texture.width,
            .height = src_rect.height / self.texture.height,
        };

        self.frames.emplace_back(uv, pos_offset, frame_time);
    }

    fn createFrames(src_rect: &const Rectangle, rows: usize, cols: usize, animationTime: f32, padding: f32) {
        self.frames.clear();
        self.frames.reserve(rows * cols);

        const frame_time: f32 = animationTime / (rows * cols);
        const frame_width: f32 = (src_rect.width - (padding * (cols - 1))) / cols;
        const frame_height: f32 = (src_rect.height - (padding * (rows - 1))) / rows;

        for(rows) | j | {
            for(cols) | i | {
                const rect = Rectangle {
                    .x = src_rect.x + (i * (frame_width + padding)),
                    .y = src_rect.y + (j * (frame_height + padding)),
                    .width = frame_width,
                    .height = frame_height,
                };
                this.addFrame(rect, vec2(0.0, 0.0), frame_time);
            }
        }
        this.setFrame(0);
    }

    fn update(deltaTime: f32) {
        if(!self.playing) return;

        self.time += deltaTime;

        //check if we've waited long enough to advance the frame
        if(self.time >= self.frames[self.current_frame].frame_time * self.animation_speed) {
            //check if we are on the 'last' frame
            const lastFrame = if (self.reverse) 0 else self.frames.size() - 1;
            if(self.current_frame == lastFrame) {
                //loop the animation if needed
                if(self.loop) {
                    //set current frame to 'first' frame, to start the animation again
                    this.setFrame(if(self.reverse) self.frames.size() - 1 else 0);
                }
                else { 
                    // we are not looping
                    self.playing = false;
                }
            }
            else { 
                // we are not on the 'last' frame, advance the frame
                this.setFrame(self.current_frame + (if(self.reverse) -1 else 1));
            }

        }
    }

    fn render(renderer: &BatchRenderer) {
        renderer.submit(this);
    }

    fn scaleAnimationSpeed(scale: f32) {
        self.animation_speed *= scale;
    }

    fn pauseAnimation() {
        self.playing = false;
    }

    fn playAnimation() {
        self.playing = true;
    }

    fn stopAnimation() {
        self.playing = false;
        self.current_frame = 0;
        self.time = 0.0;
    }

    fn reverse() {
        self.reverse = !self.reverse;
        self.time = self.frames[self.current_frame].frame_time - self.time;
    }

    fn hasAnimationEnded() -> bool {
        if(self.loop) return false;

        const lastFrame = if (self.reverse) 0 else self.frames.size() - 1;

        return (self.current_frame == lastFrame 
            and self.time >= self.frames[self.current_frame].frame_time * self.animation_speed);
    }

    fn resetVerticies(size: &const Vec2) {
        //set up vertex data in object(local) space
        self.verts.clear();
        self.verts.resize(4);

        self.verts[0].setPos(0.0, 0.0, 0.0);
        self.verts[0].setColor(VOLT_COLOR_WHITE);

        self.verts[1].setPos(0.0, size.h, 0.0);
        self.verts[1].setColor(VOLT_COLOR_WHITE);

        self.verts[2].setPos(size.w, size.h, 0.0);
        self.verts[2].setColor(VOLT_COLOR_WHITE);

        self.verts[3].setPos(size.w, 0.0, 0.0);
        self.verts[3].setColor(VOLT_COLOR_WHITE);
    }

    fn setTint(color: Colour) {
        self.verts[0].setColor(color);
        self.verts[1].setColor(color);
        self.verts[2].setColor(color);
        self.verts[3].setColor(color);
    }

    fn setDepth(depth: f32) {
        self.verts[0].setDepth(depth);
        self.verts[1].setDepth(depth);
        self.verts[2].setDepth(depth);
        self.verts[3].setDepth(depth);
    }

    fn setAnimationTime(milliseconds: f32) {
        self.animation_speed = milliseconds / self.getAnimationTime();
    }

    fn setFrame(frame_index: usize) {
        if(frame_index >= self.frames.size()) return;

        self.current_frame = frame_index;
        self.time = 0.0;

        //set the verts texture coords to mach the frame
        const uv = self.frames[self.current_frame].src_rect;

        self.verts[0].setUV(uv.x, uv.y + uv.height);
        self.verts[1].setUV(uv.x, uv.y);
        self.verts[2].setUV(uv.x + uv.width, uv.y);
        self.verts[3].setUV(uv.x + uv.width, uv.y + uv.height);
    }

    fn setAnimationTimeScale(animationTimeScale: f32) {
        self.animation_speed = animationTimeScale;
    }

    fn getVerts() -> []Vertex2D {
        return self.verts;
    }

    fn getIndices() -> []usize {
        return []usize {0, 1, 2, 0, 2, 3};
    }

    fn getIndexCount() -> usize {
        return 6;
    }

    fn getModelMatrix() -> Mat3 {
        self.reconstructTransform();
        return (self.getTransform().getMatrix());
    }

    fn getDepth() -> f32 {
        return self.verts[0].pos.z;
    }

    fn getAnimationTime() -> f32 {
        var time: f32 = 0.0;

        for(self.frames) | frame, i | {
            time += self.frames[i].frame_time;
        }

        //return 1 if animation time is 0 to avoid div by 0 in setAnimationTime()
        return if (time != 0) time else 1.0;
    }
};

