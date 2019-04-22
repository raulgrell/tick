const t = @import("../index.zig");

pub const Sprite = struct {
    texture: Texture,
    vertex_buffer: c.GLuint,
    uv_buffer: c.GLuint,

    pub fn init(compressed_bytes: []const u8) !Sprite {
        var s = Sprite {
            .texture = try Texture.init(compressed_bytes),
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
        errdefer c.glDeleteBuffers(1, &s.vertex_buffer);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.vertex_buffer);
        c.glBufferData(c.GL_ARRAY_BUFFER, 4 * 3 * @sizeOf(c.GLfloat), @ptrCast(&c_void, &vertices[0][0]), c.GL_STATIC_DRAW);

        c.glGenBuffers(1, &s.uv_buffer);
        errdefer c.glDeleteBuffers(1, &s.uv_buffer);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, s.uv_buffer);
        c.glBufferData(c.GL_ARRAY_BUFFER, 4 * 2 * @sizeOf(c.GLfloat), @ptrCast(&c_void, &tex_coords[0][0]), c.GL_STATIC_DRAW);

        return s;
    }

    pub fn draw(s: *Sprite, shader: *TextureShader, mvp: *const Mat4) void {
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

pub const Glyph = struct {
    bottomLeft: Vertex,
    topLeft: Vertex,
    topRight: Vertex,
    bottomRight: Vertex,
    texture: *const Texture,
    depth: f32,

    fn init(dest: *const Vec4, uv: *const Vec4, glyph_texture: *const Texture, depth: f32, colour: *const Vec4) Glyph {
        const tlv = vertex(vec3(dest.x + 0, dest.y + 0, 0), *colour, vec2(uv.x, uv.y));
        const blv = vertex(vec3(dest.x + 0, dest.y + dest.w, 0), *colour, vec2(uv.x, uv.y + uv.w));
        const trv = vertex(vec3(dest.x + dest.z, dest.y + 0, 0), *colour, vec2(uv.x + uv.z, uv.y));
        const brv = vertex(vec3(dest.x + dest.z, dest.y + dest.w, 0), *colour, vec2(uv.x + uv.z, uv.y + uv.w));
        return Glyph {
            .bottomLeft = blv,
            .topLeft = tlv,
            .topRight = trv, 
            .bottomRight = brv, 
            .texture = glyph_texture,
            .depth = depth
        };
    }

    fn initR(dest: Vec4, uv: Vec4, texture: c.GLuint, depth: f32, colour: Vec4, angle: f32) Glyph {
        // Center at origin and rotate
        const halfDims = vec2( dest.z / 2.0, dest.w / 2.0  );
        const bl = vec2(-halfDims.x, -halfDims.y );
        const tl = vec2(-halfDims.x,  halfDims.y );
        const tr = vec2( halfDims.x,  halfDims.y );
        const br = vec2( halfDims.x, -halfDims.y );
        bl = rotate(bl, angle) + halfDims;
        tl = rotate(tl, angle) + halfDims;
        tr = rotate(tr, angle) + halfDims;
        br = rotate(br, angle) + halfDims;

        const blv = vertex(vec3(dest.x + bl.x, dest.y + bl.y, 0), *colour, vec2(uv.x, uv.y));
        const tlv = vertex(vec3(dest.x + tl.x, dest.y + tl.y, 0), *colour, vec2(uv.x, uv.y + uv.w));
        const trv = vertex(vec3(dest.x + tr.x, dest.y + tr.y, 0), *colour, vec2(uv.x + uv.z, uv.y + uv.w));
        const brv = vertex(vec3(dest.x + br.x, dest.y + br.y, 0), *colour, vec2(uv.x + uv.z, uv.y));
        return Glyph {
            .bottomLeft = blv,
            .topLeft = tlv,
            .topRight = trv, 
            .bottomRight = brv, 
            .textureID = texture,
            .depth = depth
        };
    }
};

const SpriteUnit = struct {
    frames: []Frame,
    texture: *Texture,
    current_frame: usize,
    animation_speed: f32,
    time: f32,
    playing: bool,
    reverse: bool,
    loop: bool,

    const Self = this;

    fn create(origin: *const Vec2, size: *const Vec2, file_path: []const u8, src_rect: *const Rectangle) void {
         var self = Self {
            .current_frame = 0,
            .animation_speed = 1.0,
            .time = 0.0,
            .playing = false,
            .reverse = false,
            .loop = false,
        };

        if(!resManager.aquireTexture(self.texture, file_path)) {
            panic("Failed to aqure texture for use in Sprite: ", file_path);
            return;
        }

        this.addFrame(src_rect, vec2(0.0, 0.0), 0.0);
        this.setFrame(0);
    }

    fn loadTexture(file_path: []const u8) void {
        if(!resManager.aquireTexture(self.texture, file_path)) {
            panic("Failed to aqure texture for use in Sprite: ", file_path);
            return;
        }
    }

    fn addFrame(src_rect: *const Rectangle, pos_offset: *const Vec2, frame_time: f32) void {
        const uv = Rectangle {
            .x = src_rect.x / self.texture.width,
            .y = (self.texture.height - (src_rect.y + src_rect.height)) / self.texture.height,
            .width = src_rect.width / self.texture.width,
            .height = src_rect.height / self.texture.height,
        };
        self.frames.emplace_back(uv, pos_offset, frame_time);
    }

    fn createFrames(src_rect: *const Rectangle, rows: usize, cols: usize, animationTime: f32, padding: f32) void {
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

    fn update(deltaTime: f32) void {
        if(!self.playing) return;
        self.time += deltaTime;
        if(self.time >= self.frames[self.current_frame].frame_time * self.animation_speed) {
            const lastFrame = if (self.reverse) 0 else self.frames.size() - 1;
            if(self.current_frame == lastFrame) {
                if(self.loop) {
                    this.setFrame(if(self.reverse) self.frames.size() - 1 else 0);
                } else { 
                    self.playing = false;
                }
            } else { 
                this.setFrame(self.current_frame + (if(self.reverse) -1 else 1));
            }
        }
    }

    fn render(renderer: *BatchRenderer) void {
        renderer.submit(this);
    }

    fn scaleAnimationSpeed(scale: f32) void {
        self.animation_speed *= scale;
    }

    fn pauseAnimation() void {
        self.playing = false;
    }

    fn playAnimation() void {
        self.playing = true;
    }

    fn stopAnimation() void {
        self.playing = false;
        self.current_frame = 0;
        self.time = 0.0;
    }

    fn reverse() void {
        self.reverse = !self.reverse;
        self.time = self.frames[self.current_frame].frame_time - self.time;
    }

    fn hasAnimationEnded()bool {
        if(self.loop) return false;

        const lastFrame = if (self.reverse) 0 else self.frames.size() - 1;

        return (self.current_frame == lastFrame 
            and self.time >= self.frames[self.current_frame].frame_time * self.animation_speed);
    }

    fn setAnimationTime(milliseconds: f32) void {
        self.animation_speed = milliseconds / self.getAnimationTime();
    }

    fn setFrame(frame_index: usize) void {
        if(frame_index >= self.frames.size()) return;
        self.current_frame = frame_index;
        self.time = 0.0;
        const uv = self.frames[self.current_frame].src_rect;
        self.verts[0].setUV(uv.x, uv.y + uv.height);
        self.verts[1].setUV(uv.x, uv.y);
        self.verts[2].setUV(uv.x + uv.width, uv.y);
        self.verts[3].setUV(uv.x + uv.width, uv.y + uv.height);
    }

    fn setAnimationTimeScale(animationTimeScale: f32) void {
        self.animation_speed = animationTimeScale;
    }

    const indices = []usize {0, 1, 2, 0, 2, 3};

    fn getAnimationTime()f32 {
        var time: f32 = 0.0;
        for(self.frames) | frame, i | {
            time += self.frames[i].frame_time;
        }
        return if (time != 0) time else 1.0;
    }
};

