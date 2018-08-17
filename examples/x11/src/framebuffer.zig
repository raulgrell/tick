const c = @cImport({
    @cInclude("X11/Xlib.h");
    @cInclude("X11/Xutil.h");
});

use c;

const KEY_FUNCTION = 0xFF;
const KEY_ESC = 0x1B;

const CWBackPixmap: u32 = 1 << 0; 
const CWBackPixel: u32 = 1 << 1;
const CWBorderPixmap: u32 = 1 << 2;
const CWBorderPixel: u32 = 1 << 3;
const CWBackingStore: u32 = 1 << 6;

fn DefaultScreen(dpy: &Display) c_int {
    return (??@ptrCast(_XPrivDisplay, @alignCast(8, dpy))).default_screen;
}

fn DefaultVisual(dpy: &Display, scr: c_int) &Visual {
    return ??ScreenOfDisplay(dpy,scr).root_visual;
}

fn DefaultDepth(dpy: &Display, scr: c_int) c_uint {
    return c_uint(ScreenOfDisplay(dpy,scr).root_depth);
}

fn DefaultRootWindow(dpy: &Display) Window {
    return ScreenOfDisplay(dpy, DefaultScreen(dpy)).root;
}

fn DefaultGC(dpy: &Display, scr: c_int) GC {
    return ScreenOfDisplay(dpy, DefaultScreen(dpy)).default_gc;
}

fn DisplayWidth(dpy: &Display, scr: c_int) c_uint {
    return c_uint(ScreenOfDisplay(dpy,scr).width);
}

fn DisplayHeight(dpy: &Display, scr: c_int) c_uint {
    return c_uint(ScreenOfDisplay(dpy,scr).height);
}

fn BlackPixel(dpy: &Display, scr: c_int) c_ulong {
    return ScreenOfDisplay(dpy,scr).black_pixel;
}

fn ScreenOfDisplay(dpy: &Display, scr: c_int) &Screen {
    return dpy.screens[scr];
}

fn XDestroyImage(ximage: &XImage) void {
    _ = (??ximage.f.destroy_image)(ximage);
}

var s_display: &Display  = undefined;
var s_screen: c_int  = undefined;
var s_width: c_uint  = undefined;
var s_height: c_uint  = undefined;
var s_window: Window  = undefined;
var s_gc: GC  = undefined;
var s_ximage: &XImage = undefined;

error NoDisplay;
error InvalidFormat;
error InvalidBitDepth;
error NoWindow;
error NoImage;

pub fn open(title: []const u8, width: c_uint, height: c_uint) %void
{
    s_display = XOpenDisplay(@intToPtr(&const u8, 0)) ?? {
        return error.NoDisplay;
    };

    s_screen = DefaultScreen(s_display);
    var visual: &Visual = DefaultVisual(s_display, s_screen);
    
    var formatCount: c_int = -1;
    var formats: &XPixmapFormatValues = XListPixmapFormats(s_display, &formatCount) ?? {
        return error.InvalidFormat;
    };
    
    var depth: c_uint = DefaultDepth(s_display, s_screen);
    const defaultRootWindow: Window = DefaultRootWindow(s_display);

    var convDepth: c_int = -1;
    { var i: c_uint = 0; while(i < c_uint(formatCount)) : (i += 1) {
        if (depth == c_uint(formats[i].depth)) {
            convDepth = formats[i].bits_per_pixel;
            break;
        }
    }}
  
    _ = XFree(@ptrCast(&c_void, formats));

    // We only support 32-bit right now
    if (convDepth != 32) {
        _ = XCloseDisplay(s_display);
        return error.InvalidBitDepth;
    }

    const screenWidth: c_uint = DisplayWidth(s_display, s_screen);
    const screenHeight: c_uint = DisplayHeight(s_display, s_screen);

    var windowAttributes: XSetWindowAttributes = undefined;
    windowAttributes.border_pixel = BlackPixel(s_display, s_screen);
    windowAttributes.background_pixel = BlackPixel(s_display, s_screen);
    windowAttributes.backing_store = NotUseful;

    s_window = XCreateWindow(s_display, defaultRootWindow,
            c_int((screenWidth - width) / 2),
            c_int((screenHeight - height) / 2),
            width, height, 0, c_int(depth), InputOutput,
            visual, CWBackPixel | CWBorderPixel | CWBackingStore,
            &windowAttributes);

    if (s_window == 0)
        return error.NoWindow;

    // XSelectInput(s_display, s_window, c.KeyPressMask | c.KeyReleaseMask);
    _ = XStoreName(s_display, s_window, title.ptr);

    var sizeHints: XSizeHints = undefined;
    // sizeHints.flags = c.PPosition | c.PMinSize | c.PMaxSize;
    sizeHints.x = 0;
    sizeHints.y = 0;
    sizeHints.min_width = c_int(width);
    sizeHints.max_width = c_int(width);
    sizeHints.min_height = c_int(height);
    sizeHints.max_height = c_int(height);

    XSetWMNormalHints(s_display, s_window, &sizeHints);
    _ = XClearWindow(s_display, s_window);
    _ = XMapRaised(s_display, s_window);
    _ = XFlush(s_display);

    s_gc = DefaultGC(s_display, s_screen);
    s_ximage = XCreateImage(s_display, visual, depth, ZPixmap, 0, null, width, height, 32, c_int(width * 4)) ?? {
        return error.NoImage;   
    };
    s_width = width;
    s_height = height;
}

fn processEvents() c_int {
    if (XPending(s_display) == 0)
        return 0;

    var event: XEvent = undefined;
    _ = XNextEvent(s_display, &event);

    if (event.type != KeyPress)
        return 0;

    const sym: KeySym = XLookupKeysym(&event.xkey, 0);

    if ((sym >> 8) != KEY_FUNCTION)
        return 0;

    if ((sym & 0xFF) == KEY_ESC)
        return -1;

    return 0;
}

fn update(buffer: []u32) c_int
{
    s_ximage.data = @ptrCast(&u8, buffer.ptr);

    _ = XPutImage(s_display, s_window, s_gc, s_ximage, 0, 0, 0, 0, s_width, s_height);
    _ = XFlush(s_display);

    if (processEvents() < 0)
        return -1;

    return 0;
}

fn close () void {
    s_ximage.data = null;
    XDestroyImage(s_ximage);
    _ = XDestroyWindow(s_display, s_window);
    _ = XCloseDisplay(s_display);
}

pub fn rgb(r: u8, g: u8, b: u8) u32 {
    return u32(r) << 16 | u32(g) << 8 | b;
}

pub const FB = struct {
    open: fn(name: []const u8, width: c_uint, height: c_uint) %void,
    update: fn(buffer: []u32) c_int,
    close: fn() void,
};

pub const x11_fb = FB {
    .open = open,
    .update = update,
    .close = close
};

const WIDTH: c_uint = 800;
const HEIGHT: c_uint = 600;

var s_buffer = []u32 {0} ** (WIDTH * HEIGHT);

pub fn main() %void {
    var noise = u32(0xbeef);
    var carry = u32(0xbeef);
    var seed = u32(0xbeef);

    try x11_fb.open("Noise Test", WIDTH, HEIGHT);

    while (true)
    {
        var i: c_uint = 0;
        var state: c_int = 0;

        while (i < WIDTH * HEIGHT) : (i += 1)
        {
            noise = seed;
            noise >>= 3;
            noise ^= seed;
            carry = noise & 1;
            noise >>= 1;
            seed >>= 1;
            seed |= (carry << 30);
            noise &= 0xFF;
            s_buffer[usize(i)] = rgb(@truncate(u8, noise), @truncate(u8, noise), @truncate(u8, noise)); 
        }

        state = x11_fb.update(s_buffer[0..]);

        if (state < 0) break;
    }

    x11_fb.close();
}
