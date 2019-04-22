const X = @import("include.zig");

var s_display: *X.Display  = undefined;
var s_screen: c_int  = undefined;
var s_width: c_uint  = undefined;
var s_height: c_uint  = undefined;
var s_window: X.Window  = undefined;
var s_gc: X.GC  = undefined;
var s_ximage: *X.Image = undefined;

pub fn open(title: []const u8, width: u32, height: u32) !void {
    s_display = X.OpenDisplay(0) orelse return error.NoDisplay;

    s_screen = X.DefaultScreen(s_display);
    var visual: *X.Visual = X.DefaultVisual(s_display, s_screen); // orelse return error.NoVisual;

    var format_count: c_int = -1;
    var formats: [*]X.PixmapFormatValues = X.ListPixmapFormats(s_display, &format_count); // orelse return error.InvalidFormat;
    
    var depth: c_int = X.DefaultDepth(s_display, s_screen);
    const default_root_win: X.Window = X.DefaultRootWindow(s_display);

    var conv_depth: c_int = -1;
    { var i: usize = 0; while(i < @intCast(c_uint, format_count)) : (i += 1) {
        if (depth == formats[i].depth) {
            conv_depth = formats[i].bits_per_pixel;
            break;
        }
    }}
  
    _ = X.Free(@ptrCast(*c_void, formats));

    if (conv_depth != 32) {
        _ = X.CloseDisplay(s_display);
        return error.InvalidBitDepth;
    }

    const screenWidth: c_int = X.DisplayWidth(s_display, s_screen);
    const screenHeight: c_int = X.DisplayHeight(s_display, s_screen);

    var window_attrs: X.SetWindowAttributes = undefined;
    window_attrs.border_pixel = X.BlackPixel(s_display, s_screen);
    window_attrs.background_pixel = X.BlackPixel(s_display, s_screen);
    window_attrs.backing_store = X.NotUseful;

    s_window = X.CreateWindow(s_display, default_root_win,
            screenWidth - @divTrunc(@intCast(c_int, width), 2),
            screenHeight - @divTrunc(@intCast(c_int, height), 2),
            width, height, 0, depth, X.InputOutput,
            visual, X.CWBackPixel | X.CWBorderPixel | X.CWBackingStore,
            &window_attrs);

    if (s_window == 0) return error.NoWindow;

    _ = X.SelectInput(s_display, s_window, X.KeyPressMask | X.KeyReleaseMask);
    _ = X.StoreName(s_display, s_window, title.ptr);

    var size_hints: X.SizeHints = undefined;
    size_hints.flags = X.PPosition | X.PMinSize | X.PMaxSize;
    size_hints.x = 0;
    size_hints.y = 0;
    size_hints.min_width = @intCast(c_int, width);
    size_hints.max_width = @intCast(c_int, width);
    size_hints.min_height = @intCast(c_int, height);
    size_hints.max_height = @intCast(c_int, height);

    X.SetWMNormalHints(s_display, s_window, &size_hints);
    _ = X.ClearWindow(s_display, s_window);
    _ = X.MapRaised(s_display, s_window);
    _ = X.Flush(s_display);

    s_gc = X.DefaultGC(s_display, s_screen);
    s_ximage = X.CreateImage(s_display, visual, @intCast(c_uint, depth), X.ZPixmap, 0, 0,
            width, height, 32, @intCast(c_int, width * 4)); // orelse { return error.NoImage; };
    s_width = width;
    s_height = height;
}

pub fn processEvents() !void {
    if (X.Pending(s_display) == 0) return;

    var event: X.Event = undefined;
    _ = X.NextEvent(s_display, &event);
    if (event.type != X.KeyPress) return;

    const sym: X.KeySym = X.LookupKeysym(&event.xkey, 0);
    if ((sym >> 8) != X.KEY_FUNCTION) return;
    if ((sym & 0xFF) == X.KEY_ESC) return error.Exit;
}

pub fn update(buffer: []u32) !void {
    s_ximage.data = @ptrCast([*]u8, buffer.ptr);
    _ = X.PutImage(s_display, s_window, s_gc, s_ximage, 0, 0, 0, 0, s_width, s_height);
    _ = X.Flush(s_display);
    try processEvents();
}

pub fn close () void {
    s_ximage.data = 0;
    X.DestroyImage(s_ximage);
    _ = X.DestroyWindow(s_display, s_window);
    _ = X.CloseDisplay(s_display);
}