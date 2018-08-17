use @cImport(
    @cInclude("X11/Xlib.h");
    @cInclude("X11/Xutil.h");
)

const KEY_FUNCTION = 0xFF;
const KEY_ESC = 0x1B;

var s_display: &Display  = undefined;
var s_screen: c_int  = undefined;
var s_width: c_int  = undefined;
var s_height: c_int  = undefined;
var s_window: Window  = undefined;
var s_gc: GC  = undefined;
var s_ximage: &XImage = undefined;

pub fn open(title: []const u8, width: u32, height: u32) error!void
{
    s_display = XOpenDisplay(0);

    if (s_display == null)
        return error.NoDisplay;
    
    s_screen = DefaultScreen(s_display);
    var visual: Visual* = DefaultVisual(s_display, s_screen);
    
    var formatCount: c_int = -1;
    var formats: XPixmapFormatValues* = XListPixmapFormats(s_display, &formatCount);
    
    var depth: c_int = DefaultDepth(s_display, s_screen);
    Window defaultRootWindow = DefaultRootWindow(s_display);

    var convDepth: c_int = -1;
    { var i: usize = 0; while(i < formatCount) : (i += 1) {
        if (depth == formats[i].depth) {
            convDepth = formats[i].bits_per_pixel;
            break;
        }
    }}
  
    XFree(formats);

    // We only support 32-bit right now
    if (convDepth != 32) {
        XCloseDisplay(s_display);
        return error.InvalidBitDepth;
    }

    const screenWidth: c_int = DisplayWidth(s_display, s_screen);
    const screenHeight: c_int = DisplayHeight(s_display, s_screen);

    var windowAttributes: XSetWindowAttributes = undefined;	
    windowAttributes.border_pixel = BlackPixel(s_display, s_screen);
    windowAttributes.background_pixel = BlackPixel(s_display, s_screen);
    windowAttributes.backing_store = NotUseful;

    s_window = XCreateWindow(s_display, defaultRootWindow, (screenWidth - width) / 2,
                    (screenHeight - height) / 2, width, height, 0, depth, InputOutput,
                    visual, CWBackPixel | CWBorderPixel | CWBackingStore,
                    &windowAttributes);

    if (s_window == null)
        return error.NoWindow;

    XSelectInput(s_display, s_window, KeyPressMask | KeyReleaseMask);
    XStoreName(s_display, s_window, title);

    var sizeHints: XSizeHints = undefined;
    sizeHints.flags = PPosition | PMinSize | PMaxSize;
    sizeHints.x = 0;
    sizeHints.y = 0;
    sizeHints.min_width = width;
    sizeHints.max_width = width;
    sizeHints.min_height = height;
    sizeHints.max_height = height;

    XSetWMNormalHints(s_display, s_window, &sizeHints);
    XClearWindow(s_display, s_window);
    XMapRaised(s_display, s_window);
    XFlush(s_display);

    s_gc = DefaultGC(s_display, s_screen);
    s_ximage = XCreateImage(s_display, CopyFromParent, depth, ZPixmap, 0, null, width, height, 32, width * 4);
    s_width = width;
    s_height = height;
}

fn processEvents() c_int {
    if (!XPending(s_display))
        return 0;

    var event: XEvent = undefined;
    XNextEvent(s_display, &event);

    if (event.type != KeyPress)
        return 0;

    const sym: KeySym = XLookupKeysym(&event.xkey, 0);

    if ((sym >> 8) != KEY_FUNCTION)
        return 0;

    if ((sym & 0xFF) == KEY_ESC)
        return -1;

    return 0;
}

fn update(buffer: []u32) u32 {
    s_ximage.data = buffer;

    XPutImage(s_display, s_window, s_gc, s_ximage, 0, 0, 0, 0, s_width, s_height);
    XFlush(s_display);

    if (processEvents() < 0)
        return -1;

    return 0;
}

fn close (void) {
    s_ximage.data = null;
    XDestroyImage(s_ximage);
    XDestroyWindow(s_display, s_window);
    XCloseDisplay(s_display);
}
