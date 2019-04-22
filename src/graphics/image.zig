const t = @import("../index.zig");

const std = @import("std");
const swapSlices = @import("../util.zig").swapSlices;

pub const Format = enum {
  RGBA,
  RGB,
  INDEXED,

  pub fn getBytesPerPixel(imageFormat: Format) u32 {
    switch (imageFormat) {
      Format.RGBA => return 4,
      Format.RGB => return 3,
      Format.INDEXED => return 1,
    }
  }
};

pub const Info = struct{
  width: u32,
  height: u32,
  format: Format,
};

pub const Palette = struct{
  format: Format,
  data: []u8,
};

pub const Image = struct{
  info: Info,
  pixels: []u8,
};

pub const Pixel = struct {
  r: u8,
  g: u8,
  b: u8,
  a: u8,
};

pub fn createImage(allocator: *std.mem.Allocator, info: *const Info) !*Image {
  const pixels = try allocator.alloc(u8, info.width * info.height * Format.getBytesPerPixel(info.format));

  var image = try allocator.create(Image{
    .info = info.*,
    .pixels = pixels,
  });

  return image;
}

pub fn destroyImage(allocator: *std.mem.Allocator, img: *Image) void {
  allocator.free(img.pixels);
  allocator.destroy(img);
}

pub fn createPalette(allocator: *std.mem.Allocator) !*Palette {
  const data = try allocator.alloc(u8, 256*3);

  var palette = try allocator.create(Palette{
    .format = Format.RGB,
    .data = data,
  });

  return palette;
}

pub fn destroyPalette(allocator: *std.mem.Allocator, palette: *Palette) void {
  allocator.free(palette.data);
  allocator.destroy(palette);
}

pub fn convertToTrueColor(
  dest: *Image,
  source: *const Image,
  sourcePalette: *const Palette,
  transparent_color_index: ?u8,
) void {
  std.debug.assert(dest.info.width == source.info.width);
  std.debug.assert(dest.info.height == source.info.height);
  std.debug.assert(source.info.format == Format.INDEXED);

  var i: usize = 0;
  while (i < dest.info.width * dest.info.height) : (i += 1) {
    const index = source.pixels[i];
    if ((transparent_color_index orelse ~index) == index) {
      setColor(dest.info.format, dest.pixels, i, Pixel{
        .r = 0,
        .g = 0,
        .b = 0,
        .a = 0,
      });
    } else {
      const p = getColor(sourcePalette.format, sourcePalette.data, index);
      setColor(dest.info.format, dest.pixels, i, p);
    }
  }
}

pub fn flipHorizontal(image: *Image) void {
  var y: u32 = 0;
  while (y < image.info.height) : (y += 1) {
    var x0: u32 = 0;
    while (x0 < @divTrunc(image.info.width, 2)) : (x0 += 1) {
      const x1 = image.info.width - 1 - x0;
      const p0 = getPixel(image, x0, y).?;
      const p1 = getPixel(image, x1, y).?;
      setPixel(image, x0, y, p1);
      setPixel(image, x1, y, p0);
    }
  }
}

pub fn flipVertical(image: *Image) void {
  const bpp = Format.getBytesPerPixel(image.info.format);
  const rb = bpp * image.info.width;

  var y: u32 = 0;

  while (y < image.info.height / 2) : (y += 1) {
    const ofs0 = rb * y;
    const ofs1 = rb * (image.info.height - 1 - y);

    const row0 = image.pixels[ofs0..ofs0 + rb];
    const row1 = image.pixels[ofs1..ofs1 + rb];

    swapSlices(u8, row0, row1);
  }
}

pub fn getPixel(image: *const Image, x: u32, y: u32) ?Pixel {
  if (x >= image.info.width or y >= image.info.height) {
    return null;
  } else {
    return getPixelUnsafe(image, x, y);
  }
}

// dumb name
pub fn getPixelUnsafe(image: *const Image, x: u32, y: u32) Pixel {
  return getColor(image.info.format, image.pixels, y * image.info.width + x);
}

pub fn getColor(format: Format, data: []const u8, ofs: usize) Pixel {
  switch (format) {
    Format.RGBA => {
      const mem = data[ofs * 4..ofs * 4 + 4];

      return Pixel{
        .r = mem[0],
        .g = mem[1],
        .b = mem[2],
        .a = mem[3],
      };
    },
    Format.RGB => {
      const mem = data[ofs * 3..ofs * 3 + 3];

      return Pixel{
        .r = mem[0],
        .g = mem[1],
        .b = mem[2],
        .a = 255,
      };
    },
    Format.INDEXED => {
      const index = data[ofs];

      return Pixel{
        .r = index,
        .g = index,
        .b = index,
        .a = 255,
      };
    },
  }
}

pub fn setPixel(image: *Image, x: u32, y: u32, pixel: Pixel) void {
  if (x < image.info.width and y < image.info.height) {
    return setColor(image.info.format, image.pixels, y * image.info.width + x, pixel);
  }
}

pub fn setColor(format: Format, data: []u8, ofs: usize, p: Pixel) void {
  switch (format) {
    Format.RGBA => {
      const mem = data[ofs * 4..ofs * 4 + 4];
      mem[0] = p.r;
      mem[1] = p.g;
      mem[2] = p.b;
      mem[3] = p.a;
    },
    Format.RGB => {
      const mem = data[ofs * 3..ofs * 3 + 3];
      mem[0] = p.r;
      mem[1] = p.g;
      mem[2] = p.b;
    },
    Format.INDEXED => {
      @panic("Cannot call setColor on indexed-color images");
    },
  }
}


const PNG_COLOR_TYPE_RGBA = c.PNG_COLOR_MASK_COLOR | c.PNG_COLOR_MASK_ALPHA;
const PNG_COLOR_TYPE_RGB  = c.PNG_COLOR_MASK_COLOR;

pub const PngImage = struct {
    width: u32,
    height: u32,
    pitch: u32,
    raw: []u8,

    pub fn destroy(pi: *PngImage) void {
        c_allocator.free(pi.raw);
    }

    pub fn create(compressed_bytes: []const u8) !PngImage {
        var pi: PngImage = undefined;

        if (c.png_sig_cmp(compressed_bytes.ptr, 0, 8) != 0) {
            return error.NotPngFile;
        }

        var png_ptr = c.png_create_read_struct(c.PNG_LIBPNG_VER_STRING, null, null, null);
        if (png_ptr == null) return error.NoMem;

        var info_ptr = c.png_create_info_struct(png_ptr);
        if (info_ptr == null) {
            c.png_destroy_read_struct(c.ptr(&png_ptr), null, null);
            return error.NoMem;
        }
        defer c.png_destroy_read_struct(c.ptr(&png_ptr), c.ptr(&info_ptr), null);

        c.png_set_sig_bytes(png_ptr, 8);

        var png_io = PngIo{
            .index = 8,
            .buffer = compressed_bytes,
        };
        c.png_set_read_fn(png_ptr, &png_io, read_png_data);

        c.png_read_info(png_ptr, info_ptr);

        pi.width = c.png_get_image_width(png_ptr, info_ptr);
        pi.height = c.png_get_image_height(png_ptr, info_ptr);

        if (pi.width <= 0 or pi.height <= 0) return error.NoPixels;

        // bits per channel (not per pixel)
        const bits_per_channel = c.png_get_bit_depth(png_ptr, info_ptr);
        if (bits_per_channel != 8) return error.InvalidFormat;

        const channel_count = c.png_get_channels(png_ptr, info_ptr);
        if (channel_count != 4) return error.InvalidFormat;

        const color_type = c.png_get_color_type(png_ptr, info_ptr);
        if (color_type != PNG_COLOR_TYPE_RGBA) return error.InvalidFormat;

        pi.pitch = pi.width * bits_per_channel * channel_count / 8;
        pi.raw = try c_allocator.alloc(u8, pi.height * pi.pitch);
        errdefer c_allocator.free(pi.raw);

        const row_ptrs = try c_allocator.alloc(c.png_bytep, pi.height);
        defer c_allocator.free(row_ptrs);

        var i: usize = 0;
        while (i < pi.height) : (i += 1) {
            const q = (pi.height - i - 1) * pi.pitch;
            row_ptrs[i] = pi.raw.ptr + q;
        }

        c.png_read_image(png_ptr, row_ptrs.ptr);

        return pi;
    }
};

const PngIo = struct {
    index: usize,
    buffer: []const u8,
};

extern fn read_png_data(png_ptr: c.png_structp, data: c.png_bytep, length: c.png_size_t) void {
    const png_io = @ptrCast(*PngIo, @alignCast(@alignOf(PngIo), c.png_get_io_ptr(png_ptr).?));
    const new_index = png_io.index + length;
    if (new_index > png_io.buffer.len) unreachable;
    @memcpy(@ptrCast([*]u8, data.?), png_io.buffer.ptr + png_io.index, length);
    png_io.index = new_index;
}

const TextureCache = struct {
    texture_map: HashMap([]const u8, Texture, hash_str, cmp_str),
    
    pub fn init()TextureCache {
        return TextureCache {
            .texture_map = HashMap([]const u8, Texture, hash_str, cmp_str).init(mem.c_allocator)
        };
    }

    pub fn getTexture(self: *TextureCache, texturePath: []const u8)Texture {
        if (map.get(texturePath)) | texture | {
            return texture;
        } else {
            const newTexture = texture(texturePath);
            self.texture_map.put(texturePath, newTexture);
            return newTexture;
        }
    }

    fn hash_str(x: i32)u32 {
        return *@ptrCast(&u32, &x);
    }

    fn cmp_str(a: i32, b: i32)bool {
        return a == b;
    }
};

