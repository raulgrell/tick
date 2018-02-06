use @import("../system/index.zig");

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

    pub fn destroy(pi: &PngImage) void {
        mem.free(u8, pi.raw);
    }

    pub fn create(compressed_bytes: []const u8) %PngImage {
        var pi : PngImage = undefined;

        // if (c.png_sig_cmp(&compressed_bytes[0], 0, 8) != 0) {
        //     return error.NotPngFile;
        // }

        var png_ptr = c.png_create_read_struct(c.PNG_LIBPNG_VER_STRING, null, null, null);
        if (png_ptr == null) return error.NoMem;

        var info_ptr = c.png_create_info_struct(png_ptr);
        
        if (info_ptr == null) {
            c.png_destroy_read_struct(&png_ptr, null, null);
            return error.NoMem;
        }

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
        pi.raw = c.mem.alloc(u8, pi.height * pi.pitch) catch return error.NoMem;
        errdefer c.mem.free(pi.raw);

        const row_ptrs = c.mem.alloc(c.png_bytep, pi.height) catch return error.NoMem;
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

extern fn read_png_data(png_ptr: c.png_structp, data: c.png_bytep, length: c.png_size_t) void {
    const png_io = @ptrCast(&PngIo, @alignCast(@alignOf(PngIo), ??c.png_get_io_ptr(png_ptr)));
    const new_index = png_io.index + length;
    if (new_index > png_io.buffer.len) unreachable;
    @memcpy(@ptrCast(&u8, ??data), &png_io.buffer[png_io.index], length);
    png_io.index = new_index;
}


const TextureCache = struct {
    texture_map: HashMap([]const u8, Texture, hash_str, cmp_str),
    
    pub fn init()TextureCache {
        return TextureCache {
            .texture_map = HashMap([]const u8, Texture, hash_str, cmp_str).init(mem.c_allocator)
        };
    }

    pub fn getTexture(self: &TextureCache, texturePath: []const u8)Texture {
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


// RRESDEF RRES LoadAsset(const char *fileName, int rresId) {
// }

// RRESDEF void UnloadAsset(RRES rres) {
// }

// static void *DecompressData(const unsigned char *data, unsigned long compSize, int uncompSize) {
// }

// Mesh LoadMeshEx(int numVertex, float *vData, float *vtData, float *vnData, Color *cData);
// Shader LoadShader(const char *vsText, int vsLength);

// static SpriteFont LoadTTF(const char *fileName, int fontSize, int charsCount, int *fontChars)
// {
//     #define MAX_TTF_SIZE    16      // Maximum ttf file size in MB
    
//     // Calculate next power-of-two value
//     float guessSize = ceilf((float)fontSize*3/4)*ceilf(sqrtf((float)charsCount));
//     int textureSize = (int)powf(2, ceilf(logf((float)guessSize)/logf(2)));      // Calculate next POT

//     unsigned char *ttfBuffer = (unsigned char *)malloc(MAX_TTF_SIZE*1024*1024);
//     unsigned char *dataBitmap = (unsigned char *)malloc(textureSize*textureSize*sizeof(unsigned char));   // One channel bitmap returned!
//     stbtt_bakedchar *charData = (stbtt_bakedchar *)malloc(sizeof(stbtt_bakedchar)*charsCount);

//     SpriteFont font = { 0 };

//     FILE *ttfFile = fopen(fileName, "rb") ?? {
//         TraceLog(WARNING, "[%s] TTF file could not be opened", fileName);
//         return font;
//     }

//     // NOTE: We try reading up to 16 MB of elements of 1 byte
//     fread(ttfBuffer, 1, MAX_TTF_SIZE*1024*1024, ttfFile);

//     // NOTE: Using stb_truetype crappy packing method, no guarante the font fits the image...
//     // TODO: Replace this function by a proper packing method and support random chars order,
//     // we already receive a list (fontChars) with the ordered expected characters
//     int result = stbtt_BakeFontBitmap(ttfBuffer, 0, fontSize, dataBitmap, textureSize, textureSize, fontChars[0], charsCount, charData);

//     //if (result > 0) TraceLog(INFO, "TTF spritefont loading: first unused row of generated bitmap: %i", result);
//     if (result < 0) TraceLog(WARNING, "TTF spritefont loading: Not all the characters fit in the font");

//     free(ttfBuffer);

//     // Convert image data from grayscale to to UNCOMPRESSED_GRAY_ALPHA
//     unsigned char *dataGrayAlpha = (unsigned char *)malloc(textureSize*textureSize*sizeof(unsigned char)*2); // Two channels

//     for (int i = 0, k = 0; i < textureSize*textureSize; i++, k += 2)
//     {
//         dataGrayAlpha[k] = 255;
//         dataGrayAlpha[k + 1] = dataBitmap[i];
//     }

//     free(dataBitmap);

//     // Sprite font generation from TTF extracted data
//     Image image;
//     image.width = textureSize;
//     image.height = textureSize;
//     image.mipmaps = 1;
//     image.format = UNCOMPRESSED_GRAY_ALPHA;
//     image.data = dataGrayAlpha;

//     font.texture = LoadTextureFromImage(image);

//     //SavePNG("generated_ttf_image.png", (unsigned char *)image.data, image.width, image.height, 2);

//     UnloadImage(image);     // Unloads dataGrayAlpha

//     font.baseSize = fontSize;
//     font.charsCount = charsCount;
//     font.chars = (CharInfo *)malloc(font.charsCount*sizeof(CharInfo));

//     for (int i = 0; i < font.charsCount; i++)
//     {
//         font.chars[i].value = fontChars[i];

//         font.chars[i].rec.x = (int)charData[i].x0;
//         font.chars[i].rec.y = (int)charData[i].y0;
//         font.chars[i].rec.width = (int)charData[i].x1 - (int)charData[i].x0;
//         font.chars[i].rec.height = (int)charData[i].y1 - (int)charData[i].y0;

//         font.chars[i].offsetX = charData[i].xoff;
//         font.chars[i].offsetY = charData[i].yoff;
//         font.chars[i].advanceX = (int)charData[i].xadvance;
//     }

//     free(charData);

//     return font;
// }

// // Load raylib default font
// extern void LoadDefaultFont(void)
// {
//     #define BIT_CHECK(a,b) ((a) & (1 << (b)))

//     defaultFont.charsCount = 224;             // Number of chars included in our default font
//     int charsHeight = 10;
//     int charsDivisor = 1;    // Every char is separated from the consecutive by a 1 pixel divisor, horizontally and vertically

//     int charsWidth[224] = { 3, 1, 4, 6, 5, 7, 6, 2, 3, 3, 5, 5, 2, 4, 1, 7, 5, 2, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 3, 4, 3, 6,
//                             7, 6, 6, 6, 6, 6, 6, 6, 6, 3, 5, 6, 5, 7, 6, 6, 6, 6, 6, 6, 7, 6, 7, 7, 6, 6, 6, 2, 7, 2, 3, 5,
//                             2, 5, 5, 5, 5, 5, 4, 5, 5, 1, 2, 5, 2, 5, 5, 5, 5, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 3, 1, 3, 4, 4,
//                             1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
//                             1, 1, 5, 5, 5, 7, 1, 5, 3, 7, 3, 5, 4, 1, 7, 4, 3, 5, 3, 3, 2, 5, 6, 1, 2, 2, 3, 5, 6, 6, 6, 6,
//                             6, 6, 6, 6, 6, 6, 7, 6, 6, 6, 6, 6, 3, 3, 3, 3, 7, 6, 6, 6, 6, 6, 6, 5, 6, 6, 6, 6, 6, 6, 4, 6,
//                             5, 5, 5, 5, 5, 5, 9, 5, 5, 5, 5, 5, 2, 2, 3, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 5 };

//     int imWidth = 128;
//     int imHeight = 128;

//     Color *imagePixels = (Color *)malloc(imWidth*imHeight*sizeof(Color));

//     for (int i = 0; i < imWidth*imHeight; i++) imagePixels[i] = BLANK;        // Initialize array

//     int counter = 0;        // Font data elements counter

//     // Fill imgData with defaultFontData (convert from bit to pixel!)
//     for (int i = 0; i < imWidth*imHeight; i += 32) {
//         for (int j = 31; j >= 0; j--) {
//             if (BIT_CHECK(defaultFontData[counter], j)) imagePixels[i+j] = WHITE;
//         }

//         counter++;

//         if (counter > 512) counter = 0;         // Security check...
//     }

//     Image image = LoadImageEx(imagePixels, imWidth, imHeight);
//     ImageFormat(&image, UNCOMPRESSED_GRAY_ALPHA);

//     free(imagePixels);

//     defaultFont.texture = LoadTextureFromImage(image);
//     UnloadImage(image);

//     // Reconstruct charSet using charsWidth[], charsHeight, charsDivisor, charsCount
//     //------------------------------------------------------------------------------
    
//     // Allocate space for our characters info data
//     // NOTE: This memory should be freed at end! --> CloseWindow()
//     defaultFont.chars = (CharInfo *)malloc(defaultFont.charsCount*sizeof(CharInfo));    

//     int currentLine = 0;
//     int currentPosX = charsDivisor;
//     int testPosX = charsDivisor;

//     for (int i = 0; i < defaultFont.charsCount; i++) {
//         defaultFont.chars[i].value = 32 + i;  // First char is 32

//         defaultFont.chars[i].rec.x = currentPosX;
//         defaultFont.chars[i].rec.y = charsDivisor + currentLine*(charsHeight + charsDivisor);
//         defaultFont.chars[i].rec.width = charsWidth[i];
//         defaultFont.chars[i].rec.height = charsHeight;

//         testPosX += (defaultFont.chars[i].rec.width + charsDivisor);

//         if (testPosX >= defaultFont.texture.width) {
//             currentLine++;
//             currentPosX = 2*charsDivisor + charsWidth[i];
//             testPosX = currentPosX;

//             defaultFont.chars[i].rec.x = charsDivisor;
//             defaultFont.chars[i].rec.y = charsDivisor + currentLine*(charsHeight + charsDivisor);
//         } else {
//             currentPosX = testPosX;
//         }

//         // NOTE: On default font character offsets and xAdvance are not required
//         defaultFont.chars[i].offsetX = 0;
//         defaultFont.chars[i].offsetY = 0;
//         defaultFont.chars[i].advanceX = 0;
//     }

//     defaultFont.baseSize = defaultFont.chars[0].rec.height;
// }

// // Unload raylib default font
// extern void UnloadDefaultFont(void)
// {
//     UnloadTexture(defaultFont.texture);
//     free(defaultFont.chars);
// }

// // Load SpriteFont from file into GPU memory (VRAM)
// SpriteFont LoadSpriteFont(const char *fileName)
// {
//     // Default hardcoded values for ttf file loading
//     #define DEFAULT_TTF_FONTSIZE    32      // Font first character (32 - space)
//     #define DEFAULT_TTF_NUMCHARS    95      // ASCII 32..126 is 95 glyphs
//     #define DEFAULT_FIRST_CHAR      32      // Expected first char for image spritefont

//     SpriteFont spriteFont = { 0 };

//     // Check file extension
//     if (IsFileExtension(fileName, ".rres")) {
//         RRES rres = LoadAsset(fileName, 0);
//     }
//     else if (IsFileExtension(fileName, ".ttf")) {
//         spriteFont = LoadSpriteFontEx(fileName, DEFAULT_TTF_FONTSIZE, 0, NULL);
//     } else {
//         Image image = LoadImage(fileName);
//         if (image.data != NULL) spriteFont = LoadImageFont(image, MAGENTA, DEFAULT_FIRST_CHAR);
//         UnloadImage(image);
//     }

//     if (spriteFont.texture.id == 0) {
//         TraceLog(WARNING, "[%s] SpriteFont could not be loaded, using default font", fileName);
//         spriteFont = GetDefaultFont();
//     } else {
//         SetTextureFilter(spriteFont.texture, FILTER_POINT);    // By default we set point filter (best performance)
//     }

//     return spriteFont;
// }

// // Load SpriteFont from TTF font file with generation parameters
// // NOTE: You can pass an array with desired characters, those characters should be available in the font
// // if array is NULL, default char set is selected 32..126
// SpriteFont LoadSpriteFontEx(const char *fileName, int fontSize, int charsCount, int *fontChars)
// {
//     SpriteFont spriteFont = { 0 };

//     if (IsFileExtension(fileName, ".ttf")) {
//         if ((fontChars == NULL) or (charsCount == 0)) {
//             int totalChars = 95;    // Default charset [32..126]
//             int *defaultFontChars = (int *)malloc(totalChars*sizeof(int));
//             for (int i = 0; i < totalChars; i++) defaultFontChars[i] = i + 32; // Default first character: SPACE[32]
//             spriteFont = LoadTTF(fileName, fontSize, totalChars, defaultFontChars);
//         } else {
//             spriteFont = LoadTTF(fileName, fontSize, charsCount, fontChars);
//         }    
//     }

//     if (spriteFont.texture.id == 0) {
//         TraceLog(WARNING, "[%s] SpriteFont could not be generated, using default font", fileName);
//         spriteFont = GetDefaultFont();
//     }

//     return spriteFont;
// }

// // Unload SpriteFont from GPU memory (VRAM)
// void UnloadSpriteFont(SpriteFont spriteFont) {
//     if (spriteFont.texture.id != GetDefaultFont().texture.id) {
//         UnloadTexture(spriteFont.texture);
//         free(spriteFont.chars);
//     }
// }

// // Load image from file into CPU memory (RAM)
// Image LoadImage(const char *fileName) {
//     Image image = { 0 };

//     if (IsFileExtension(fileName, ".rres")) {
//         RRES rres = LoadAsset(fileName, 0);
//         UnloadAsset(rres);
//     }
//     else if ((IsFileExtension(fileName, ".png"))
//         or (IsFileExtension(fileName, ".bmp"))
//         or (IsFileExtension(fileName, ".tga"))
//         or (IsFileExtension(fileName, ".jpg"))
//         or (IsFileExtension(fileName, ".gif")) )
//     {
//         int imgWidth = 0;
//         int imgHeight = 0;
//         int imgBpp = 0;
        
//         FILE *imFile = fopen(fileName, "rb");

//         // NOTE: Using stb_image to load images (Supports: BMP, TGA, PNG, JPG, ...)
//         image.data = stbi_load_from_file(imFile, &imgWidth, &imgHeight, &imgBpp, 0);
        
//         fclose(imFile);

//         image.width = imgWidth;
//         image.height = imgHeight;
//         image.mipmaps = 1;

//         if (imgBpp == 1) image.format = UNCOMPRESSED_GRAYSCALE;
//         else if (imgBpp == 2) image.format = UNCOMPRESSED_GRAY_ALPHA;
//         else if (imgBpp == 3) image.format = UNCOMPRESSED_R8G8B8;
//         else if (imgBpp == 4) image.format = UNCOMPRESSED_R8G8B8A8;
//     }

//     return image;
// }

// // Load image from array (RGBA - 32bit), Creates a copy of pixels
// Image LoadImageEx(Color *pixels, int width, int height)
// {
//     Image image;
//     image.data = NULL;
//     image.width = width;
//     image.height = height;
//     image.mipmaps = 1;
//     image.format = UNCOMPRESSED_R8G8B8A8;

//     int k = 0;

//     image.data = (unsigned char *)malloc(image.width*image.height*4*sizeof(unsigned char));

//     for (int i = 0; i < image.width*image.height*4; i += 4)
//     {
//         ((unsigned char *)image.data)[i] = pixels[k].r;
//         ((unsigned char *)image.data)[i + 1] = pixels[k].g;
//         ((unsigned char *)image.data)[i + 2] = pixels[k].b;
//         ((unsigned char *)image.data)[i + 3] = pixels[k].a;
//         k++;
//     }

//     return image;
// }

// // Load image from raw data with parameters
// // NOTE: This functions makes a copy of provided data
// Image LoadImagePro(void *data, int width, int height, int format)
// {
//     Image srcImage = { 0 };

//     srcImage.data = data;
//     srcImage.width = width;
//     srcImage.height = height;
//     srcImage.mipmaps = 1;
//     srcImage.format = format;

//     Image dstImage = ImageCopy(srcImage);

//     return dstImage;
// }

// // Load an image from RAW file data
// Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize)
// {
//     Image image = { 0 };

//     FILE *rawFile = fopen(fileName, "rb");

//     if (rawFile == NULL)
//     {
//         TraceLog(WARNING, "[%s] RAW image file could not be opened", fileName);
//     }
//     else
//     {
//         if (headerSize > 0) fseek(rawFile, headerSize, SEEK_SET);

//         unsigned int size = width*height;

//         switch (format)
//         {
//             case UNCOMPRESSED_GRAYSCALE: image.data = (unsigned char *)malloc(size); break;               // 8 bit per pixel (no alpha)
//             case UNCOMPRESSED_GRAY_ALPHA: image.data = (unsigned char *)malloc(size*2); size *= 2; break; // 16 bpp (2 channels)
//             case UNCOMPRESSED_R5G6B5: image.data = (unsigned short *)malloc(size); break;                 // 16 bpp
//             case UNCOMPRESSED_R8G8B8: image.data = (unsigned char *)malloc(size*3); size *= 3; break;     // 24 bpp
//             case UNCOMPRESSED_R5G5B5A1: image.data = (unsigned short *)malloc(size); break;               // 16 bpp (1 bit alpha)
//             case UNCOMPRESSED_R4G4B4A4: image.data = (unsigned short *)malloc(size); break;               // 16 bpp (4 bit alpha)
//             case UNCOMPRESSED_R8G8B8A8: image.data = (unsigned char *)malloc(size*4); size *= 4; break;   // 32 bpp
//             case UNCOMPRESSED_R32G32B32: image.data = (float *)malloc(size*12); size *= 12; break;        // 4 byte per channel (12 byte)
//             default: TraceLog(WARNING, "Image format not suported"); break;
//         }

//         // NOTE: fread() returns num read elements instead of bytes, 
//         // to get bytes we need to read (1 byte size, elements) instead of (x byte size, 1 element)
//         int bytes = fread(image.data, 1, size, rawFile);

//         // Check if data has been read successfully
//         if (bytes < size)
//         {
//             TraceLog(WARNING, "[%s] RAW image data can not be read, wrong requested format or size", fileName);

//             if (image.data != NULL) free(image.data);
//         }
//         else
//         {
//             image.width = width;
//             image.height = height;
//             image.mipmaps = 0;
//             image.format = format;
//         }

//         fclose(rawFile);
//     }

//     return image;
// }

// // Load texture from file into GPU memory (VRAM)
// Texture2D LoadTexture(const char *fileName)
// {
//     Texture2D texture = { 0 };

//     Image image = LoadImage(fileName);

//     if (image.data != NULL)
//     {
//         texture = LoadTextureFromImage(image);
//         UnloadImage(image);
//     }
//     else TraceLog(WARNING, "Texture could not be created");

//     return texture;
// }

// // Load a texture from image data
// // NOTE: image is not unloaded, it must be done manually
// Texture2D LoadTextureFromImage(Image image)
// {
//     Texture2D texture = { 0 };

//     texture.id = rlglLoadTexture(image.data, image.width, image.height, image.format, image.mipmaps);

//     texture.width = image.width;
//     texture.height = image.height;
//     texture.mipmaps = image.mipmaps;
//     texture.format = image.format;
    
//     TraceLog(DEBUG, "[TEX ID %i] Parameters: %ix%i, %i mips, format %i", texture.id, texture.width, texture.height, texture.mipmaps, texture.format);

//     return texture;
// }

// // Load texture for rendering (framebuffer)
// RenderTexture2D LoadRenderTexture(int width, int height)
// {
//     RenderTexture2D target = rlglLoadRenderTexture(width, height);

//     return target;
// }

// // Unload image from CPU memory (RAM)
// void UnloadImage(Image image)
// {
//     free(image.data);

//     // NOTE: It becomes anoying every time a texture is loaded
//     //TraceLog(INFO, "Unloaded image data");
// }

// // Unload texture from GPU memory (VRAM)
// void UnloadTexture(Texture2D texture)
// {
//     if (texture.id != 0)
//     {
//         rlDeleteTextures(texture.id);

//         TraceLog(INFO, "[TEX ID %i] Unloaded texture data from VRAM (GPU)", texture.id);
//     }
// }

// // Unload render texture from GPU memory (VRAM)
// void UnloadRenderTexture(RenderTexture2D target)
// {
//     if (target.id != 0) rlDeleteRenderTextures(target);
// }

// // Get pixel data from image in the form of Color struct array
// Color *GetImageData(Image image)
// {
//     Color *pixels = (Color *)malloc(image.width*image.height*sizeof(Color));

//     int k = 0;

//     for (int i = 0; i < image.width*image.height; i++)
//     {
//         switch (image.format)
//         {
//             case UNCOMPRESSED_GRAYSCALE:
//             {
//                 pixels[i].r = ((unsigned char *)image.data)[k];
//                 pixels[i].g = ((unsigned char *)image.data)[k];
//                 pixels[i].b = ((unsigned char *)image.data)[k];
//                 pixels[i].a = 255;

//                 k++;
//             } break;
//             case UNCOMPRESSED_GRAY_ALPHA:
//             {
//                 pixels[i].r = ((unsigned char *)image.data)[k];
//                 pixels[i].g = ((unsigned char *)image.data)[k];
//                 pixels[i].b = ((unsigned char *)image.data)[k];
//                 pixels[i].a = ((unsigned char *)image.data)[k + 1];

//                 k += 2;
//             } break;
//             case UNCOMPRESSED_R5G5B5A1:
//             {
//                 unsigned short pixel = ((unsigned short *)image.data)[k];

//                 pixels[i].r = (unsigned char)((float)((pixel & 0b1111100000000000) >> 11)*(255/31));
//                 pixels[i].g = (unsigned char)((float)((pixel & 0b0000011111000000) >> 6)*(255/31));
//                 pixels[i].b = (unsigned char)((float)((pixel & 0b0000000000111110) >> 1)*(255/31));
//                 pixels[i].a = (unsigned char)((pixel & 0b0000000000000001)*255);

//                 k++;
//             } break;
//             case UNCOMPRESSED_R5G6B5:
//             {
//                 unsigned short pixel = ((unsigned short *)image.data)[k];

//                 pixels[i].r = (unsigned char)((float)((pixel & 0b1111100000000000) >> 11)*(255/31));
//                 pixels[i].g = (unsigned char)((float)((pixel & 0b0000011111100000) >> 5)*(255/63));
//                 pixels[i].b = (unsigned char)((float)(pixel & 0b0000000000011111)*(255/31));
//                 pixels[i].a = 255;

//                 k++;
//             } break;
//             case UNCOMPRESSED_R4G4B4A4:
//             {
//                 unsigned short pixel = ((unsigned short *)image.data)[k];

//                 pixels[i].r = (unsigned char)((float)((pixel & 0b1111000000000000) >> 12)*(255/15));
//                 pixels[i].g = (unsigned char)((float)((pixel & 0b0000111100000000) >> 8)*(255/15));
//                 pixels[i].b = (unsigned char)((float)((pixel & 0b0000000011110000) >> 4)*(255/15));
//                 pixels[i].a = (unsigned char)((float)(pixel & 0b0000000000001111)*(255/15));

//                 k++;
//             } break;
//             case UNCOMPRESSED_R8G8B8A8:
//             {
//                 pixels[i].r = ((unsigned char *)image.data)[k];
//                 pixels[i].g = ((unsigned char *)image.data)[k + 1];
//                 pixels[i].b = ((unsigned char *)image.data)[k + 2];
//                 pixels[i].a = ((unsigned char *)image.data)[k + 3];

//                 k += 4;
//             } break;
//             case UNCOMPRESSED_R8G8B8:
//             {
//                 pixels[i].r = (unsigned char)((unsigned char *)image.data)[k];
//                 pixels[i].g = (unsigned char)((unsigned char *)image.data)[k + 1];
//                 pixels[i].b = (unsigned char)((unsigned char *)image.data)[k + 2];
//                 pixels[i].a = 255;

//                 k += 3;
//             } break;
//             default: TraceLog(WARNING, "Format not supported for pixel data retrieval"); break;
//         }
//     }

//     return pixels;
// }

// // Get pixel data from GPU texture and return an Image
// // NOTE: Compressed texture formats not supported
// Image GetTextureData(Texture2D texture)
// {
//     Image image = { 0 };
    
//     if (texture.format < 8) {
//         image.data = rlglReadTexturePixels(texture);

//         if (image.data != NULL) {
//             image.width = texture.width;
//             image.height = texture.height;
//             image.mipmaps = 1;
            
//             if (rlGetVersion() == OPENGL_ES_20) {
//                 // NOTE: Data retrieved on OpenGL ES 2.0 comes as RGBA (from framebuffer)
//                 image.format = UNCOMPRESSED_R8G8B8A8;
//             }
//             else image.format = texture.format;
//         }
//         else TraceLog(WARNING, "Texture pixel data could not be obtained");
//     }
//     else TraceLog(WARNING, "Compressed texture data could not be obtained");

//     return image;
// }

// // Update GPU texture with new data
// // NOTE: pixels data must match texture.format
// void UpdateTexture(Texture2D texture, const void *pixels)
// {
//     rlglUpdateTexture(texture.id, texture.width, texture.height, texture.format, pixels);
// }

// // Convert image data to desired format
// void ImageFormat(Image *image, int newFormat) {
//     if (image->format != newFormat) {
//         if ((image->format < COMPRESSED_DXT1_RGB) && (newFormat < COMPRESSED_DXT1_RGB)) {
//             Color *pixels = GetImageData(*image);

//             free(image->data);

//             image->format = newFormat;

//             int k = 0;

//             switch (image->format) {
//                 case UNCOMPRESSED_GRAYSCALE: {
//                     image->data = (u8 *)malloc(image->width*image->height*sizeof(u8));

//                     for (int i = 0; i < image->width*image->height; i++) {
//                         ((u8 *)image->data)[i] = (u8)((float)pixels[i].r*0.299f + (float)pixels[i].g*0.587f + (float)pixels[i].b*0.114f);
//                     }

//                 } break;
//                 case UNCOMPRESSED_GRAY_ALPHA: {
//                    image->data = (u8 *)malloc(image->width*image->height*2*sizeof(u8));

//                    for (int i = 0; i < image->width*image->height*2; i += 2) {
//                         ((u8 *)image->data)[i] = (u8)((float)pixels[k].r*0.299f + (float)pixels[k].g*0.587f + (float)pixels[k].b*0.114f);
//                         ((u8 *)image->data)[i + 1] = pixels[k].a;
//                         k++;
//                     }

//                 } break;
//                 case UNCOMPRESSED_R8G8B8:
//                 {
//                     image->data = (u8 *)malloc(image->width*image->height*3*sizeof(u8));

//                     for (int i = 0; i < image->width*image->height*3; i += 3)
//                     {
//                         ((u8 *)image->data)[i] = pixels[k].r;
//                         ((u8 *)image->data)[i + 1] = pixels[k].g;
//                         ((u8 *)image->data)[i + 2] = pixels[k].b;
//                         k++;
//                     }
//                 } break;
//                 case UNCOMPRESSED_R4G4B4A4:
//                 {
//                     image->data = (unsigned short *)malloc(image->width*image->height*sizeof(unsigned short));

//                     u8 r = 0;
//                     u8 g = 0;
//                     u8 b = 0;
//                     u8 a = 0;

//                     for (int i = 0; i < image->width*image->height; i++)
//                     {
//                         r = (u8)(round((float)pixels[i].r*15/255));
//                         g = (u8)(round((float)pixels[i].g*15/255));
//                         b = (u8)(round((float)pixels[i].b*15/255));
//                         a = (u8)(round((float)pixels[i].a*15/255));

//                         ((unsigned short *)image->data)[i] = (unsigned short)r << 12 | (unsigned short)g << 8| (unsigned short)b << 4| (unsigned short)a;
//                     }

//                 } break;
//                 case UNCOMPRESSED_R8G8B8A8:
//                 {
//                     image->data = (u8 *)malloc(image->width*image->height*4*sizeof(u8));

//                     for (int i = 0; i < image->width*image->height*4; i += 4)
//                     {
//                         ((u8 *)image->data)[i] = pixels[k].r;
//                         ((u8 *)image->data)[i + 1] = pixels[k].g;
//                         ((u8 *)image->data)[i + 2] = pixels[k].b;
//                         ((u8 *)image->data)[i + 3] = pixels[k].a;
//                         k++;
//                     }
//                 } break;
//                 default: break;
//             }

//             free(pixels);
//         }
//         else TraceLog(WARNING, "Image data format is compressed, can not be converted");
//     }
// }

// // Apply alpha mask to image
// // NOTE 1: Returned image is GRAY_ALPHA (16bit) or RGBA (32bit)
// // NOTE 2: alphaMask should be same size as image
// void ImageAlphaMask(Image *image, Image alphaMask)
// {
//     if ((image->width != alphaMask.width) or (image->height != alphaMask.height))
//     {
//         TraceLog(WARNING, "Alpha mask must be same size as image");
//     }
//     else if (image->format >= COMPRESSED_DXT1_RGB)
//     {
//         TraceLog(WARNING, "Alpha mask can not be applied to compressed data formats");
//     }
//     else
//     {
//         // Force mask to be Grayscale
//         Image mask = ImageCopy(alphaMask);
//         if (mask.format != UNCOMPRESSED_GRAYSCALE) ImageFormat(&mask, UNCOMPRESSED_GRAYSCALE);

//         // In case image is only grayscale, we just add alpha channel
//         if (image->format == UNCOMPRESSED_GRAYSCALE)
//         {
//             ImageFormat(image, UNCOMPRESSED_GRAY_ALPHA);

//             // Apply alpha mask to alpha channel
//             for (int i = 0, k = 1; (i < mask.width*mask.height) 
//                     or (i < image->width*image->height); i++, k += 2) {
//                 ((u8 *)image->data)[k] = ((u8 *)mask.data)[i];
//             }
//         }
//         else
//         {
//             // Convert image to RGBA
//             if (image->format != UNCOMPRESSED_R8G8B8A8) ImageFormat(image, UNCOMPRESSED_R8G8B8A8);

//             // Apply alpha mask to alpha channel
//             for (int i = 0, k = 3; (i < mask.width*mask.height)
//                     or (i < image->width*image->height); i++, k += 4) {
//                 ((u8 *)image->data)[k] = ((u8 *)mask.data)[i];
//             }
//         }

//         UnloadImage(mask);
//     }
// }

// // Copy an image to a new image
// Image ImageCopy(Image image)
// {
//     Image newImage;

//     int byteSize = image.width*image.height;

//     switch (image.format)
//     {
//         case UNCOMPRESSED_GRAYSCALE: break;                 // 8 bpp (1 byte)
//         case UNCOMPRESSED_GRAY_ALPHA:                       // 16 bpp
//         case UNCOMPRESSED_R4G4B4A4: byteSize *= 2; break;   // 16 bpp (2 bytes)
//         case UNCOMPRESSED_R8G8B8: byteSize *= 3; break;     // 24 bpp (3 bytes)
//         case UNCOMPRESSED_R8G8B8A8: byteSize *= 4; break;   // 32 bpp (4 bytes)
//         default: TraceLog(WARNING, "Image format not recognized"); break;
//     }

//     newImage.data = malloc(byteSize);

//     if (newImage.data != NULL)
//     {
//         // NOTE: Size must be provided in bytes
//         memcpy(newImage.data, image.data, byteSize);

//         newImage.width = image.width;
//         newImage.height = image.height;
//         newImage.mipmaps = image.mipmaps;
//         newImage.format = image.format;
//     }

//     return newImage;
// }

// // Crop an image to area defined by a rectangle
// // NOTE: Security checks are performed in case rectangle goes out of bounds
// void ImageCrop(Image *image, Rectangle crop)
// {
//     // Security checks to make sure cropping rectangle is inside margins
//     if ((crop.x + crop.width) > image->width)
//     {
//         crop.width = image->width - crop.x;
//         TraceLog(WARNING, "Crop rectangle width out of bounds, rescaled crop width: %i", crop.width);
//     }

//     if ((crop.y + crop.height) > image->height)
//     {
//         crop.height = image->height - crop.y;
//         TraceLog(WARNING, "Crop rectangle height out of bounds, rescaled crop height: %i", crop.height);
//     }

//     if ((crop.x < image->width) && (crop.y < image->height))
//     {
//         // Start the cropping process
//         Color *pixels = GetImageData(*image);   // Get data as Color pixels array
//         Color *cropPixels = (Color *)malloc(crop.width*crop.height*sizeof(Color));

//         for (int j = crop.y; j < (crop.y + crop.height); j++)
//         {
//             for (int i = crop.x; i < (crop.x + crop.width); i++)
//             {
//                 cropPixels[(j - crop.y)*crop.width + (i - crop.x)] = pixels[j*image->width + i];
//             }
//         }

//         free(pixels);

//         int format = image->format;

//         UnloadImage(*image);

//         *image = LoadImageEx(cropPixels, crop.width, crop.height);

//         free(cropPixels);

//         // Reformat 32bit RGBA image to original format
//         ImageFormat(image, format);
//     }
//     else
//     {
//         TraceLog(WARNING, "Image can not be cropped, crop rectangle out of bounds");
//     }
// }

// // Resize and image to new size
// // NOTE: Uses stb default scaling filters (both bicubic):
// // STBIR_DEFAULT_FILTER_UPSAMPLE    STBIR_FILTER_CATMULLROM
// // STBIR_DEFAULT_FILTER_DOWNSAMPLE  STBIR_FILTER_MITCHELL   (high-quality Catmull-Rom)
// void ImageResize(Image *image, int newWidth, int newHeight)
// {
//     // Get data as Color pixels array to work with it
//     Color *pixels = GetImageData(*image);
//     Color *output = (Color *)malloc(newWidth*newHeight*sizeof(Color));

//     // NOTE: Color data is casted to (u8 *), there shouldn't been any problem...
//     stbir_resize_uint8((u8 *)pixels, image->width, image->height, 0, (u8 *)output, newWidth, newHeight, 0, 4);

//     int format = image->format;

//     UnloadImage(*image);

//     *image = LoadImageEx(output, newWidth, newHeight);
//     ImageFormat(image, format);  // Reformat 32bit RGBA image to original format

//     free(output);
//     free(pixels);
// }

// // Resize and image to new size using Nearest-Neighbor scaling algorithm
// void ImageResizeNN(Image *image,int newWidth,int newHeight)
// {
//     Color *pixels = GetImageData(*image);
//     Color *output = (Color *)malloc(newWidth*newHeight*sizeof(Color));

//     // EDIT: added +1 to account for an early rounding problem
//     int xRatio = (int)((image->width << 16)/newWidth) + 1;
//     int yRatio = (int)((image->height << 16)/newHeight) + 1;

//     int x2, y2;
//     for (int y = 0; y < newHeight; y++)
//     {
//         for (int x = 0; x < newWidth; x++)
//         {
//             x2 = ((x*xRatio) >> 16);
//             y2 = ((y*yRatio) >> 16);

//             output[(y*newWidth) + x] = pixels[(y2*image->width) + x2] ;
//         }
//     }

//     int format = image->format;

//     UnloadImage(*image);

//     *image = LoadImageEx(output, newWidth, newHeight);
//     ImageFormat(image, format);  // Reformat 32bit RGBA image to original format

//     free(output);
//     free(pixels);
// }

// // Draw an image (source) within an image (destination)
// // TODO: Feel this function could be simplified...
// void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec)
// {
//     bool cropRequired = false;

//     // Security checks to avoid size and rectangle issues (out of bounds)
//     // Check that srcRec is inside src image
//     if (srcRec.x < 0) srcRec.x = 0;
//     if (srcRec.y < 0) srcRec.y = 0;

//     if ((srcRec.x + srcRec.width) > src.width)
//     {
//         srcRec.width = src.width - srcRec.x;
//         TraceLog(WARNING, "Source rectangle width out of bounds, rescaled width: %i", srcRec.width);
//     }

//     if ((srcRec.y + srcRec.height) > src.height)
//     {
//         srcRec.height = src.height - srcRec.y;
//         TraceLog(WARNING, "Source rectangle height out of bounds, rescaled height: %i", srcRec.height);
//         cropRequired = true;
//     }

//     Image srcCopy = ImageCopy(src);     // Make a copy of source image to work with it
//     ImageCrop(&srcCopy, srcRec);        // Crop source image to desired source rectangle

//     // Check that dstRec is inside dst image
//     // TODO: Allow negative position within destination with cropping
//     if (dstRec.x < 0) dstRec.x = 0;
//     if (dstRec.y < 0) dstRec.y = 0;

//     // Scale source image in case destination rec size is different than source rec size
//     if ((dstRec.width != srcRec.width) or (dstRec.height != srcRec.height))
//     {
//         ImageResize(&srcCopy, dstRec.width, dstRec.height);
//     }

//     if ((dstRec.x + dstRec.width) > dst->width)
//     {
//         dstRec.width = dst->width - dstRec.x;
//         TraceLog(WARNING, "Destination rectangle width out of bounds, rescaled width: %i", dstRec.width);
//         cropRequired = true;
//     }

//     if ((dstRec.y + dstRec.height) > dst->height)
//     {
//         dstRec.height = dst->height - dstRec.y;
//         TraceLog(WARNING, "Destination rectangle height out of bounds, rescaled height: %i", dstRec.height);
//         cropRequired = true;
//     }

//     if (cropRequired)
//     {
//         // Crop destination rectangle if out of bounds
//         Rectangle crop = { 0, 0, dstRec.width, dstRec.height };
//         ImageCrop(&srcCopy, crop);
//     }

//     // Get image data as Color pixels array to work with it
//     Color *dstPixels = GetImageData(*dst);
//     Color *srcPixels = GetImageData(srcCopy);

//     UnloadImage(srcCopy);       // Source copy not required any more...

//     Color srcCol, dstCol;

//     // Blit pixels, copy source image into destination
//     // TODO: Probably out-of-bounds blitting could be considered here instead of so much cropping...
//     for (int j = dstRec.y; j < (dstRec.y + dstRec.height); j++)
//     {
//         for (int i = dstRec.x; i < (dstRec.x + dstRec.width); i++)
//         {
//             // Alpha blending implementation
//             dstCol = dstPixels[j*dst->width + i];
//             srcCol = srcPixels[(j - dstRec.y)*dstRec.width + (i - dstRec.x)];

//             dstCol.r = ((srcCol.a*(srcCol.r - dstCol.r)) >> 8) + dstCol.r;
//             dstCol.g = ((srcCol.a*(srcCol.g - dstCol.g)) >> 8) + dstCol.g;
//             dstCol.b = ((srcCol.a*(srcCol.b - dstCol.b)) >> 8) + dstCol.b;

//             dstPixels[j*dst->width + i] = dstCol;

//             // TODO: Support other blending options
//         }
//     }

//     UnloadImage(*dst);  // NOTE: Only dst->data is unloaded

//     *dst = LoadImageEx(dstPixels, dst->width, dst->height);
//     ImageFormat(dst, dst->format);

//     free(srcPixels);
//     free(dstPixels);
// }

// // Create an image from text (default font)
// Image ImageText(const char *text, int fontSize, Color color)
// {
//     int defaultFontSize = 10;   // Default Font chars height in pixel
//     if (fontSize < defaultFontSize) fontSize = defaultFontSize;
//     int spacing = fontSize/defaultFontSize;

//     Image imText = ImageTextEx(GetDefaultFont(), text, (float)fontSize, spacing, color);

//     return imText;
// }

// // Create an image from text (custom sprite font)
// Image ImageTextEx(SpriteFont font, const char *text, float fontSize, int spacing, Color tint)
// {
//     int length = strlen(text);
//     int posX = 0;

//     Vector2 imSize = MeasureTextEx(font, text, font.baseSize, spacing);

//     // NOTE: GetTextureData() not available in OpenGL ES
//     Image imFont = GetTextureData(font.texture);

//     ImageFormat(&imFont, UNCOMPRESSED_R8G8B8A8);    // Convert to 32 bit for color tint
//     ImageColorTint(&imFont, tint);                  // Apply color tint to font

//     Color *fontPixels = GetImageData(imFont);

//     // Create image to store text
//     // NOTE: Pixels are initialized to BLANK color (0, 0, 0, 0)
//     Color *pixels = (Color *)calloc((int)imSize.x*(int)imSize.y, sizeof(Color));

//     for (int i = 0; i < length; i++)
//     {
//         Rectangle letterRec = font.chars[(int)text[i] - 32].rec;

//         for (int y = letterRec.y; y < (letterRec.y + letterRec.height); y++)
//         {
//             for (int x = posX; x < (posX + letterRec.width); x++)
//             {
//                 pixels[(y - letterRec.y)*(int)imSize.x + x] = fontPixels[y*font.texture.width + (x - posX + letterRec.x)];
//             }
//         }

//         posX += letterRec.width + spacing;
//     }

//     UnloadImage(imFont);

//     Image imText = LoadImageEx(pixels, (int)imSize.x, (int)imSize.y);

//     // Scale image depending on text size
//     if (fontSize > imSize.y)
//     {
//         float scaleFactor = fontSize/imSize.y;
//         TraceLog(INFO, "Scalefactor: %f", scaleFactor);

//         // Using nearest-neighbor scaling algorithm for default font
//         if (font.texture.id == GetDefaultFont().texture.id) ImageResizeNN(&imText, (int)(imSize.x*scaleFactor), (int)(imSize.y*scaleFactor));
//         else ImageResize(&imText, (int)(imSize.x*scaleFactor), (int)(imSize.y*scaleFactor));
//     }

//     free(pixels);
//     free(fontPixels);

//     return imText;
// }

// // Draw text (default font) within an image (destination)
// void ImageDrawText(Image *dst, Vector2 position, const char *text, int fontSize, Color color)
// {
//     // NOTE: For default font, sapcing is set to desired font size / default font size (10)
//     ImageDrawTextEx(dst, position, GetDefaultFont(), text, (float)fontSize, fontSize/10, color);
// }

// // Draw text (custom sprite font) within an image (destination)
// void ImageDrawTextEx(Image *dst, Vector2 position, SpriteFont font, const char *text, float fontSize, int spacing, Color color)
// {
//     Image imText = ImageTextEx(font, text, fontSize, spacing, color);

//     Rectangle srcRec = { 0, 0, imText.width, imText.height };
//     Rectangle dstRec = { (int)position.x, (int)position.y, imText.width, imText.height };

//     ImageDraw(dst, imText, srcRec, dstRec);

//     UnloadImage(imText);
// }

// // Flip image vertically
// void ImageFlipVertical(Image *image)
// {
//     Color *srcPixels = GetImageData(*image);
//     Color *dstPixels = (Color *)malloc(sizeof(Color)*image->width*image->height);

//     for (int y = 0; y < image->height; y++)
//     {
//         for (int x = 0; x < image->width; x++)
//         {
//             dstPixels[y*image->width + x] = srcPixels[(image->height - 1 - y)*image->width + x];
//         }
//     }

//     Image processed = LoadImageEx(dstPixels, image->width, image->height);
//     ImageFormat(&processed, image->format);
//     UnloadImage(*image);

//     free(srcPixels);
//     free(dstPixels);

//     image->data = processed.data;
// }

// // Flip image horizontally
// void ImageFlipHorizontal(Image *image)
// {
//     Color *srcPixels = GetImageData(*image);
//     Color *dstPixels = (Color *)malloc(sizeof(Color)*image->width*image->height);

//     for (int y = 0; y < image->height; y++)
//     {
//         for (int x = 0; x < image->width; x++)
//         {
//             dstPixels[y*image->width + x] = srcPixels[y*image->width + (image->width - 1 - x)];
//         }
//     }

//     Image processed = LoadImageEx(dstPixels, image->width, image->height);
//     ImageFormat(&processed, image->format);
//     UnloadImage(*image);

//     free(srcPixels);
//     free(dstPixels);

//     image->data = processed.data;
// }

// // Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
// // NOTE: In case selected bpp do not represent an known 16bit format,
// // dithered data is stored in the LSB part of the unsigned short
// void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp)
// {
//     if (image->format >= COMPRESSED_DXT1_RGB)
//     {
//         TraceLog(WARNING, "Compressed data formats can not be dithered");
//         return;
//     }

//     if ((rBpp+gBpp+bBpp+aBpp) > 16)
//     {
//         TraceLog(WARNING, "Unsupported dithering bpps (%ibpp), only 16bpp or lower modes supported", (rBpp+gBpp+bBpp+aBpp));
//     }
//     else
//     {
//         Color *pixels = GetImageData(*image);

//         free(image->data);      // free old image data

//         if ((image->format != UNCOMPRESSED_R8G8B8) && (image->format != UNCOMPRESSED_R8G8B8A8))
//         {
//             TraceLog(WARNING, "Image format is already 16bpp or lower, dithering could have no effect");
//         }

//         // Define new image format, check if desired bpp match internal known format
//         if ((rBpp == 5) && (gBpp == 6) && (bBpp == 5) && (aBpp == 0)) image->format = UNCOMPRESSED_R5G6B5;
//         else if ((rBpp == 5) && (gBpp == 5) && (bBpp == 5) && (aBpp == 1)) image->format = UNCOMPRESSED_R5G5B5A1;
//         else if ((rBpp == 4) && (gBpp == 4) && (bBpp == 4) && (aBpp == 4)) image->format = UNCOMPRESSED_R4G4B4A4;
//         else
//         {
//             image->format = 0;
//             TraceLog(WARNING, "Unsupported dithered OpenGL internal format: %ibpp (R%iG%iB%iA%i)", (rBpp+gBpp+bBpp+aBpp), rBpp, gBpp, bBpp, aBpp);
//         }

//         // NOTE: We will store the dithered data as unsigned short (16bpp)
//         image->data = (unsigned short *)malloc(image->width*image->height*sizeof(unsigned short));

//         Color oldPixel = WHITE;
//         Color newPixel = WHITE;

//         int rError, gError, bError;
//         unsigned short rPixel, gPixel, bPixel, aPixel;   // Used for 16bit pixel composition

//         #define MIN(a,b) (((a)<(b))?(a):(b))

//         for (int y = 0; y < image->height; y++)
//         {
//             for (int x = 0; x < image->width; x++)
//             {
//                 oldPixel = pixels[y*image->width + x];

//                 // NOTE: New pixel obtained by bits truncate, it would be better to round values (check ImageFormat())
//                 newPixel.r = oldPixel.r >> (8 - rBpp);     // R bits
//                 newPixel.g = oldPixel.g >> (8 - gBpp);     // G bits
//                 newPixel.b = oldPixel.b >> (8 - bBpp);     // B bits
//                 newPixel.a = oldPixel.a >> (8 - aBpp);     // A bits (not used on dithering)

//                 // NOTE: Error must be computed between new and old pixel but using same number of bits!
//                 // We want to know how much color precision we have lost...
//                 rError = (int)oldPixel.r - (int)(newPixel.r << (8 - rBpp));
//                 gError = (int)oldPixel.g - (int)(newPixel.g << (8 - gBpp));
//                 bError = (int)oldPixel.b - (int)(newPixel.b << (8 - bBpp));

//                 pixels[y*image->width + x] = newPixel;

//                 // NOTE: Some cases are out of the array and should be ignored
//                 if (x < (image->width - 1))
//                 {
//                     pixels[y*image->width + x+1].r = MIN((int)pixels[y*image->width + x+1].r + (int)((float)rError*7.0f/16), 0xff);
//                     pixels[y*image->width + x+1].g = MIN((int)pixels[y*image->width + x+1].g + (int)((float)gError*7.0f/16), 0xff);
//                     pixels[y*image->width + x+1].b = MIN((int)pixels[y*image->width + x+1].b + (int)((float)bError*7.0f/16), 0xff);
//                 }

//                 if ((x > 0) && (y < (image->height - 1)))
//                 {
//                     pixels[(y+1)*image->width + x-1].r = MIN((int)pixels[(y+1)*image->width + x-1].r + (int)((float)rError*3.0f/16), 0xff);
//                     pixels[(y+1)*image->width + x-1].g = MIN((int)pixels[(y+1)*image->width + x-1].g + (int)((float)gError*3.0f/16), 0xff);
//                     pixels[(y+1)*image->width + x-1].b = MIN((int)pixels[(y+1)*image->width + x-1].b + (int)((float)bError*3.0f/16), 0xff);
//                 }

//                 if (y < (image->height - 1))
//                 {
//                     pixels[(y+1)*image->width + x].r = MIN((int)pixels[(y+1)*image->width + x].r + (int)((float)rError*5.0f/16), 0xff);
//                     pixels[(y+1)*image->width + x].g = MIN((int)pixels[(y+1)*image->width + x].g + (int)((float)gError*5.0f/16), 0xff);
//                     pixels[(y+1)*image->width + x].b = MIN((int)pixels[(y+1)*image->width + x].b + (int)((float)bError*5.0f/16), 0xff);
//                 }

//                 if ((x < (image->width - 1)) && (y < (image->height - 1)))
//                 {
//                     pixels[(y+1)*image->width + x+1].r = MIN((int)pixels[(y+1)*image->width + x+1].r + (int)((float)rError*1.0f/16), 0xff);
//                     pixels[(y+1)*image->width + x+1].g = MIN((int)pixels[(y+1)*image->width + x+1].g + (int)((float)gError*1.0f/16), 0xff);
//                     pixels[(y+1)*image->width + x+1].b = MIN((int)pixels[(y+1)*image->width + x+1].b + (int)((float)bError*1.0f/16), 0xff);
//                 }

//                 rPixel = (unsigned short)newPixel.r;
//                 gPixel = (unsigned short)newPixel.g;
//                 bPixel = (unsigned short)newPixel.b;
//                 aPixel = (unsigned short)newPixel.a;

//                 ((unsigned short *)image->data)[y*image->width + x] = (rPixel << (gBpp + bBpp + aBpp)) | (gPixel << (bBpp + aBpp)) | (bPixel << aBpp) | aPixel;
//             }
//         }

//         free(pixels);
//     }
// }

// // Modify image color: tint
// void ImageColorTint(Image *image, Color color)
// {
//     Color *pixels = GetImageData(*image);

//     float cR = (float)color.r/255;
//     float cG = (float)color.g/255;
//     float cB = (float)color.b/255;
//     float cA = (float)color.a/255;

//     for (int y = 0; y < image->height; y++)
//     {
//         for (int x = 0; x < image->width; x++)
//         {
//             u8 r = 255*((float)pixels[y*image->width + x].r/255*cR);
//             u8 g = 255*((float)pixels[y*image->width + x].g/255*cG);
//             u8 b = 255*((float)pixels[y*image->width + x].b/255*cB);
//             u8 a = 255*((float)pixels[y*image->width + x].a/255*cA);

//             pixels[y*image->width + x].r = r;
//             pixels[y*image->width + x].g = g;
//             pixels[y*image->width + x].b = b;
//             pixels[y*image->width + x].a = a;
//         }
//     }

//     Image processed = LoadImageEx(pixels, image->width, image->height);
//     ImageFormat(&processed, image->format);
//     UnloadImage(*image);
//     free(pixels);

//     image->data = processed.data;
// }

// // Modify image color: invert
// void ImageColorInvert(Image *image)
// {
//     Color *pixels = GetImageData(*image);

//     for (int y = 0; y < image->height; y++)
//     {
//         for (int x = 0; x < image->width; x++)
//         {
//             pixels[y*image->width + x].r = 255 - pixels[y*image->width + x].r;
//             pixels[y*image->width + x].g = 255 - pixels[y*image->width + x].g;
//             pixels[y*image->width + x].b = 255 - pixels[y*image->width + x].b;
//         }
//     }

//     Image processed = LoadImageEx(pixels, image->width, image->height);
//     ImageFormat(&processed, image->format);
//     UnloadImage(*image);
//     free(pixels);

//     image->data = processed.data;
// }

// // Modify image color: grayscale
// void ImageColorGrayscale(Image *image)
// {
//     ImageFormat(image, UNCOMPRESSED_GRAYSCALE);
// }

// // Modify image color: contrast
// // NOTE: Contrast values between -100 and 100
// void ImageColorContrast(Image *image, float contrast)
// {
//     if (contrast < -100) contrast = -100;
//     if (contrast > 100) contrast = 100;

//     contrast = (100.0f + contrast)/100.0f;
//     contrast *= contrast;

//     Color *pixels = GetImageData(*image);

//     for (int y = 0; y < image->height; y++) {
//         for (int x = 0; x < image->width; x++) {
//             float pR = (float)pixels[y*image->width + x].r/255.0f;
//             pR -= 0.5;
//             pR *= contrast;
//             pR += 0.5;
//             pR *= 255;
//             if (pR < 0) pR = 0;
//             if (pR > 255) pR = 255;

//             float pG = (float)pixels[y*image->width + x].g/255.0f;
//             pG -= 0.5;
//             pG *= contrast;
//             pG += 0.5;
//             pG *= 255;
//             if (pG < 0) pG = 0;
//             if (pG > 255) pG = 255;

//             float pB = (float)pixels[y*image->width + x].b/255.0f;
//             pB -= 0.5;
//             pB *= contrast;
//             pB += 0.5;
//             pB *= 255;
//             if (pB < 0) pB = 0;
//             if (pB > 255) pB = 255;

//             pixels[y*image->width + x].r = (u8)pR;
//             pixels[y*image->width + x].g = (u8)pG;
//             pixels[y*image->width + x].b = (u8)pB;
//         }
//     }

//     Image processed = LoadImageEx(pixels, image->width, image->height);
//     ImageFormat(&processed, image->format);
//     UnloadImage(*image);
//     free(pixels);

//     image->data = processed.data;
// }

// // Modify image color: brightness
// // NOTE: Brightness values between -255 and 255
// void ImageColorBrightness(Image *image, int brightness) {
//     if (brightness < -255) brightness = -255;
//     if (brightness > 255) brightness = 255;

//     Color *pixels = GetImageData(*image);

//     for (int y = 0; y < image->height; y++) {
//         for (int x = 0; x < image->width; x++) {
//             int cR = pixels[y*image->width + x].r + brightness;
//             int cG = pixels[y*image->width + x].g + brightness;
//             int cB = pixels[y*image->width + x].b + brightness;

//             if (cR < 0) cR = 1;
//             if (cR > 255) cR = 255;

//             if (cG < 0) cG = 1;
//             if (cG > 255) cG = 255;

//             if (cB < 0) cB = 1;
//             if (cB > 255) cB = 255;

//             pixels[y*image->width + x].r = (u8)cR;
//             pixels[y*image->width + x].g = (u8)cG;
//             pixels[y*image->width + x].b = (u8)cB;
//         }
//     }

//     Image processed = LoadImageEx(pixels, image->width, image->height);
//     ImageFormat(&processed, image->format);
//     UnloadImage(*image);
//     free(pixels);

//     image->data = processed.data;
// }