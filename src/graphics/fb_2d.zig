const t = @import("../index.zig");

const std = @import("std");
const swapSlices = @import("../util.zig").swapSlices;

pub const IMRenderer = struct {
    shader: *TextureShader,
    vao: c.GLuint,
    projection: Mat4,
    rectangleBuffer: c.GLuint,
    rectangleUV: c.GLuint,
    triangleBuffer: c.GLuint,
    triangleUV: c.GLuint,

    fn init(s: *TextureShader, fb_width: usize, fb_height: usize) IMRenderer {
        var r = IMRenderer {
            .shader = s,
            .vao = 0,
            .projection = Mat4.orthographic( 0.0, f32(fb_width), f32(fb_height), 0.0, 0.0, 1.0 ),
            .rectangleBuffer = 0,
            .rectangleUV = 0,
            .triangleBuffer = 0,
            .triangleUV = 0,
        };

        c.glGenVertexArrays(1, &r.vao);
        c.glBindVertexArray(r.vao);
        
        c.glGenBuffers(1, &r.rectangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            4 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &rectangleVertices[0][0]),
            c.GL_STATIC_DRAW
        );      

        c.glGenBuffers(1, &r.rectangleUV);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleUV);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            4 * 2 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &rectangleUV[0][0]),
            c.GL_STATIC_DRAW
        );

        c.glGenBuffers(1, &r.triangleBuffer);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.triangleBuffer);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            3 * 3 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &triangleVertices[0][0]),
            c.GL_STATIC_DRAW
        );

        c.glGenBuffers(1, &r.triangleUV);
        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.triangleUV);
        c.glBufferData(
            c.GL_ARRAY_BUFFER,
            3 * 2 * @sizeOf(c.GLfloat),
            @ptrCast(&c_void, &triangleUV[0][0]),
            c.GL_STATIC_DRAW
        );

        return r;
    }

    fn begin (r: *IMRenderer) void {
        c.glBindVertexArray(r.vao);
        r.shader.program.bind();
    }

    fn end(r: *IMRenderer) void {
        r.shader.program.unbind();
        c.glBindVertexArray(0);        
    }

    pub fn draw_rect(r: *IMRenderer, rect_texture: *Texture, x: f32, y: f32, w: f32, h: f32) void {
        const model = Mat4.diagonal(1).translate(x, y, 0.0).scale(w, h, 0.0);
        const mvp = r.projection.mul(model);
        r.shader.program.setUniform_mat4(r.shader.uniform_mvp, mvp);
        r.shader.program.setUniform_int(r.shader.uniform_tex, c.GLint(rect_texture.id));

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleBuffer);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_position));
        c.glVertexAttribPointer(c.GLuint(r.shader.attrib_position), 3, c.GL_FLOAT, c.GL_FALSE, 0, null);

        c.glBindBuffer(c.GL_ARRAY_BUFFER, r.rectangleUV);
        c.glEnableVertexAttribArray(c.GLuint(r.shader.attrib_uv));
        c.glVertexAttribPointer(c.GLuint(r.shader.attrib_uv), 2, c.GL_FLOAT, c.GL_FALSE, 0, null);

        rect_texture.bind();
        
        c.glDrawArrays(c.GL_TRIANGLE_STRIP, 0, 4);
    }

    fn draw_text(r: *IMRenderer, s: *Spritesheet, string: []const u8, left: f32, top: f32, size: f32) void {
        for (string) |col, i| {
            if (col <= '~') {
                const char_left = left + f32(i * s.width) * size;
                const model = Mat4.diagonal(1).translate(char_left, top, 0.0).scale(size, size, 0.0);
                const mvp = r.projection.mul(model);
                s.draw(r.shader, col, mvp);
            } else {
                unreachable;
            }
        }
    }

    fn draw_sprite(r: *IMRenderer, s: *Sprite, left: f32, top: f32, width: f32, height: f32) void {
        const model = Mat4.diagonal(1).translate(left, top, 0.0).scale(width, height, 0.0);
        const mvp = r.projection.mul(model);
        s.draw(r.shader, mvp);
    }

    fn destroy(r: *IMRenderer) void {
        if (r.vao != 0)             c.glDeleteVertexArrays(1, &r.vao);
        if (r.rectangleBuffer != 0) c.glDeleteBuffers(1, &r.rectangleBuffer);
        if (r.rectangleUV != 0)     c.glDeleteBuffers(1, &r.rectangleUV);
        if (r.triangleBuffer != 0)  c.glDeleteBuffers(1, &r.triangleBuffer);
        if (r.triangleUV != 0)      c.glDeleteBuffers(1, &r.triangleUV);
    }
};