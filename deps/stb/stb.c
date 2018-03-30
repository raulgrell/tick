use @cImport({
    @cInclude("stdio.h");
    // @cInclude("stdlib.h");
    // @cInclude("stdint.h");
    // @cInclude("stdarg.h");
    // @cInclude("string.h");
    // @cInclude("math.h");
    // @cInclude("assert.h");
    // @cInclude("math.h");
    // @cInclude("limits.h");
    // @cInclude("time.h");

    @cInclude("stb/stb_image.h");
});

pub fn main() -> %void {

    var img_width: c_int = 0;
    var img_height: c_int = 0;
    var img_bpp: c_int = 0;
    
    var img_file = fopen(c"tex.png", c"rb") ?? unreachable;

    // NOTE: Using stb_image to load images (Supports: BMP, TGA, PNG, JPG, ...)
    const d = stbi_load_from_file(img_file, &img_width, &img_height, &img_bpp, 0);

    _ = fclose(img_file);
}