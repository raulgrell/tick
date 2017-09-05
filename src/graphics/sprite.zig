use @import("../system/index.zig");
use @import("../math/index.zig");

const sh = @import("../graphics/shader.zig");
const renderer = @import("renderer.zig");

pub const Vertex = struct {
    position: Vec3,
    uv: Vec2,
    colour: Vec4,
};

pub const Glyph = struct {
    bottomLeft: Vertex,
    topLeft: Vertex,
    topRight: Vertex,
    bottomRight: Vertex,
    texture: &const Texture,
    depth: f32,

    fn init(destRect: &const Vec4, uvRect: &const Vec4, texture: &const Texture, depth: f32, colour: &const Vec4) -> Glyph {
        const tlv = Vertex {
            .position = vec3(destRect.x, destRect.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y)
        };

        const blv = Vertex {
            .position = vec3(destRect.x, destRect.y + destRect.w, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y + uvRect.w)
        };

        const brv = Vertex {
            .position = vec3(destRect.x + destRect.z, destRect.y + destRect.w, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y + uvRect.w),
        };

        const trv = Vertex {
            .position = vec3(destRect.x + destRect.z, destRect.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y),
        };

        return Glyph {
            .bottomLeft = blv,
            .topLeft = tlv,
            .topRight = trv, 
            .bottomRight = brv, 
            .texture = texture,
            .depth = depth
        };
    }

    fn initR(destRect: Vec4, uvRect: Vec4, texture: c.GLuint, depth: f32, colour: Vec4, angle: f32) -> Glyph {
        // To get center position
        const halfDims = vec2( destRect.z / 2.0, destRect.w / 2.0  );

        // Center at origin
        const bl = vec2(-halfDims.x, -halfDims.y );
        const tl = vec2(-halfDims.x,  halfDims.y );
        const tr = vec2( halfDims.x,  halfDims.y );
        const br = vec2( halfDims.x, -halfDims.y );

        // rotate the points

        bl = rotate(bl, angle) + halfDims;
        tl = rotate(tl, angle) + halfDims;
        tr = rotate(tr, angle) + halfDims;
        br = rotate(br, angle) + halfDims;

        const blv = Vertex {
            .position = vec3(destRect.x + bl.x, destRect.y + bl.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y)
        };

        const tlv = Vertex {
            .position = vec3(destRect.x + tl.x, destRect.y + tl.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x, uvRect.y + uvRect.w)
        };

        const trv = Vertex {
            .position = vec3(destRect.x + tr.x, destRect.y + tr.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y + uvRect.w)
        };

        const brv = Vertex {
            .position = vec3(destRect.x + br.x, destRect.y + br.y, 0),
            .colour = *colour,
            .uv = vec2(uvRect.x + uvRect.z, uvRect.y)
        };

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

pub const Texture = struct {
    img: PngImage,    
    id: c.GLuint,
    path: []const u8,

    pub fn init(compressed_bytes: []const u8) -> %Texture {
        var t: Texture = undefined;
        t.img = %return PngImage.create(compressed_bytes);

        c.glGenTextures(1, &t.id);
        %defer c.glDeleteTextures(1, &t.id);

        c.glBindTexture(c.GL_TEXTURE_2D, t.id);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_WRAP_S, c.GL_REPEAT);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_WRAP_T, c.GL_REPEAT);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_MAG_FILTER, c.GL_LINEAR);
        c.glTexParameteri(c.GL_TEXTURE_2D, c.GL_TEXTURE_MIN_FILTER, c.GL_LINEAR_MIPMAP_LINEAR);
        c.glPixelStorei(c.GL_PACK_ALIGNMENT, 4);
        c.glTexImage2D(c.GL_TEXTURE_2D, 0, c_int(t.img.color_type), c_int(t.img.width), c_int(t.img.height),
                0, c_uint(t.img.color_type), c.GL_UNSIGNED_BYTE, @ptrCast(&c_void, &t.img.raw[0]));

        c.glGenerateMipmap(c.GL_TEXTURE_2D);
        c.glBindTexture(c.GL_TEXTURE_2D, 0);

        return t;
    }

    pub fn bind(t: &Texture) {
        c.glActiveTexture(c.GL_TEXTURE0 + t.id);
        c.glBindTexture(c.GL_TEXTURE_2D, t.id);
    }

    pub fn unbind(t: &Texture) {
        c.glBindTexture(c.GL_TEXTURE_2D, 0);
    }
    
    pub fn deinit(t: &Texture) {
        c.glDeleteTextures(1, &t.id);
        t.img.destroy();
    }
};

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

    pub fn draw(s: &Sprite, shader: &sh.TextureShader, mvp: &const Mat4) {
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

    pub fn draw(s: &Spritesheet, shader: &sh.TextureShader, index: usize, mvp: &const Mat4) {
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

const TextureCache = struct {
    texture_map: HashMap([]const u8, Texture, hash_str, cmp_str),
    
    pub fn init() -> TextureCache {
        return TextureCache {
            .texture_map = HashMap([]const u8, Texture, hash_str, cmp_str).init(mem.c_allocator)
        };
    }

    pub fn getTexture(self: &TextureCache, texturePath: []const u8) -> Texture {
        if (map.get(texturePath)) | texture | {
            return texture;
        } else {
            const newTexture = texture(texturePath);
            self.texture_map.put(texturePath, newTexture);
            return newTexture;
        }
    }

    fn hash_str(x: i32) -> u32 {
        *@ptrCast(&u32, &x)
    }

    fn cmp_str(a: i32, b: i32) -> bool {
        a == b
    }
};

error NotPngFile;
error NoMem;
error InvalidFormat;
error NoPixels;

const PNG_COLOR_TYPE_RGBA = c.PNG_COLOR_MASK_COLOR | c.PNG_COLOR_MASK_ALPHA;
const PNG_COLOR_TYPE_RGB  = c.PNG_COLOR_MASK_COLOR;

pub const PngImage = struct {
    width: u32,
    height: u32,
    pitch: u32,
    color_type: c_uint,
    raw: []u8,

    pub fn destroy(pi: &PngImage) {
        mem.free(u8, pi.raw);
    }

    pub fn create(compressed_bytes: []const u8) -> %PngImage {
        var pi : PngImage = undefined;

        if (c.png_sig_cmp(&compressed_bytes[0], 0, 8) != 0) return error.NotPngFile;

        var png_ptr = c.png_create_read_struct(c.PNG_LIBPNG_VER_STRING, null, null, null);
        if (png_ptr == null) return error.NoMem;

        var info_ptr = c.png_create_info_struct(png_ptr);
        if (info_ptr == null) {
            c.png_destroy_read_struct(&png_ptr, null, null);
            return error.NoMem;
        };
        defer c.png_destroy_read_struct(&png_ptr, &info_ptr, null);

        c.png_set_sig_bytes(png_ptr, 8);

        var png_io = PngIo {
            .index = 8,
            .buffer = compressed_bytes,
        };
        c.png_set_read_fn(png_ptr, @ptrCast(&c_void, &png_io), read_png_data);

        c.png_read_info(png_ptr, info_ptr);

        pi.width  = c.png_get_image_width(png_ptr, info_ptr);
        pi.height = c.png_get_image_height(png_ptr, info_ptr);

        if (pi.width <= 0 or pi.height <= 0) return error.NoPixels;

        // bits per channel (not per pixel)
        const bits_per_channel = c.png_get_bit_depth(png_ptr, info_ptr);
        if (bits_per_channel != 8) return error.InvalidFormat;

        const channel_count = c.png_get_channels(png_ptr, info_ptr);
        const color_type = c.png_get_color_type(png_ptr, info_ptr);

        if(color_type == PNG_COLOR_TYPE_RGBA and channel_count == 4) {
            pi.color_type = c.GL_RGBA;
        } else if ( color_type == PNG_COLOR_TYPE_RGB and channel_count == 3) {
            pi.color_type = c.GL_RGB;
        } else {
            return error.InvalidFormat;
        }

        pi.pitch = pi.width * bits_per_channel * channel_count / 8;
        pi.raw = c.mem.alloc(u8, pi.height * pi.pitch) %% return error.NoMem;
        %defer c.mem.free(pi.raw);

        const row_ptrs = c.mem.alloc(c.png_bytep, pi.height) %% return error.NoMem;
        defer c.mem.free(row_ptrs);

        { var i: usize = 0; while (i < pi.height) : (i += 1) {
            const q = (pi.height - i - 1) * pi.pitch;
            row_ptrs[i] = &pi.raw[q];
        }}

        c.png_read_image(png_ptr, &row_ptrs[0]);

        return pi;
    }
};

const PngIo = struct {
    index: usize,
    buffer: []const u8,
};

extern fn read_png_data(png_ptr: c.png_structp, data: c.png_bytep, length: c.png_size_t) {
    const png_io = @ptrCast(&PngIo, ??c.png_get_io_ptr(png_ptr));
    const new_index = png_io.index + length;
    if (new_index > png_io.buffer.len) unreachable;
    @memcpy(@ptrCast(&u8, ??data), &png_io.buffer[png_io.index], length);
    png_io.index = new_index;
}