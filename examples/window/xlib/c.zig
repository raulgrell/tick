// missing symbols

fn XDestroyImage(ximage: *XImage) void {
    _ = ximage.f.destroy_image.?(ximage);
}

pub const XSizeHints = extern struct {
    flags: c_long,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    min_width: c_int,
    min_height: c_int,
    max_width: c_int,
    max_height: c_int,
    width_inc: c_int,
    height_inc: c_int,
    min_aspect: extern struct {
        x: c_int,
        y: c_int,
    },
    max_aspect: extern struct {
        x: c_int,
        y: c_int,
    },
    base_width: c_int,
    base_height: c_int,
    win_gravity: c_int,
};

pub const XWMHints = extern struct {
    flags: c_long,
    input: c_int,
    initial_state: c_int,
    icon_pixmap: Pixmap,
    icon_window: Window,
    icon_x: c_int,
    icon_y: c_int,
    icon_mask: Pixmap,
    window_group: XID,
};

pub const XTextProperty = extern struct {
    value: ?[*]u8,
    encoding: Atom,
    format: c_int,
    nitems: c_ulong,
};

pub const XClassHint = extern struct {
    res_name: ?[*]const u8,
    res_class: ?[*]const u8,
};

pub extern "X11" fn XAllocSizeHints() ?*XSizeHints;
pub extern "X11" fn XAllocWMHints() ?*XWMHints;
pub extern "X11" fn XAllocClassHint() ?*XClassHint;
pub extern "X11" fn XSetWMNormalHints(arg0: ?*Display, arg1: Window, arg2: ?*XSizeHints) void;
pub extern "X11" fn XStringListToTextProperty(arg0: [*]const ?[*]const u8, arg1: c_int, arg2: *XTextProperty) c_int;
pub extern "X11" fn XSetWMProperties(
    arg0: *Display,
    arg1: Window,
    arg2: *XTextProperty,
    arg3: *XTextProperty,
    arg4: ?[*]?[*]u8,
    arg5: c_int,
    arg6: *XSizeHints,
    arg7: *XWMHints,
    arg8: *XClassHint,
) void;

pub const KEY_FUNCTION = 0xFF;
pub const KEY_ESC = 0x1B;
pub const CWBackPixmap: u32 = 1 << 0; 
pub const CWBackPixel: u32 = 1 << 1;
pub const CWBorderPixmap: u32 = 1 << 2;
pub const CWBorderPixel: u32 = 1 << 3;
pub const CWBackingStore: u32 = 1 << 6;

pub const PPosition = 1 << 2;
pub const PSize = 1 << 3;
pub const PMinSize = 1 << 4;
pub const PMaxSize = 1 << 5;
pub const PResizeInc = 1 << 6;
pub const PAspect = 1 << 7;
pub const PBaseSize = 1 << 8;
pub const PWinGravity = 1 << 9;

pub const InputHint = 1 << 0;
pub const StateHint = 1 << 1;
pub const IconPixmapHint = 1 << 2;
pub const IconWindowHint = 1 << 3;
pub const IconPositionHint = 1 << 4;
pub const IconMaskHint = 1 << 5;
pub const WindowGroupHint = 1 << 6;
pub const AllHints = InputHint | StateHint | IconPixmapHint | IconWindowHint |
    IconPositionHint | IconMaskHint | WindowGroupHint;
pub const XUrgencyHint = 1 << 8;

/// for windows that are not mapped
pub const WithdrawnState = 0;

/// most applications want to start this way
pub const NormalState = 1;

/// application wants to start as an icon
pub const IconicState = 3;

pub const KeyPressMask = 1 << 0;
pub const KeyReleaseMask = 1 << 1;
pub const ButtonPressMask = 1 << 2;
pub const ButtonReleaseMask = 1 << 3;
pub const EnterWindowMask = 1 << 4;
pub const LeaveWindowMask = 1 << 5;
pub const PointerMotionMask = 1 << 6;
pub const PointerMotionHintMask = 1 << 7;
pub const Button1MotionMask = 1 << 8;
pub const Button2MotionMask = 1 << 9;
pub const Button3MotionMask = 1 << 10;
pub const Button4MotionMask = 1 << 11;
pub const Button5MotionMask = 1 << 12;
pub const ButtonMotionMask = 1 << 13;
pub const KeymapStateMask = 1 << 14;
pub const ExposureMask = 1 << 15;
pub const VisibilityChangeMask = 1 << 16;
pub const StructureNotifyMask = 1 << 17;
pub const ResizeRedirectMask = 1 << 18;
pub const SubstructureNotifyMask = 1 << 19;
pub const SubstructureRedirectMask = 1 << 20;
pub const FocusChangeMask = 1 << 21;
pub const PropertyChangeMask = 1 << 22;
pub const ColormapChangeMask = 1 << 23;
pub const OwnerGrabButtonMask = 1 << 24;

// alias so that at the call site it can look
// like X.Foo() instead of X.XFoo()

pub const AllocClassHint = XAllocClassHint;
pub const AllocSizeHints = XAllocSizeHints;
pub const AllocWMHints = XAllocWMHints;
pub const BlackPixel = XBlackPixel;
pub const ClearWindow = XClearWindow;
pub const CloseDisplay = XCloseDisplay;
pub const CreateGC = XCreateGC;
pub const CreateImage = XCreateImage;
pub const CreateWindow = XCreateWindow;
pub const CreateSimpleWindow = XCreateSimpleWindow;
pub const DefaultScreen = XDefaultScreen;
pub const DefaultDepth = XDefaultDepth;
pub const DefaultGC = XDefaultGC;
pub const DefaultRootWindow = XDefaultRootWindow;
pub const DefaultVisual = XDefaultVisual;
pub const DestroyImage = XDestroyImage;
pub const DestroyWindow = XDestroyWindow;
pub const DisplayHeight = XDisplayHeight;
pub const DisplayWidth = XDisplayWidth;
pub const DrawString = XDrawString;
pub const Event = XEvent;
pub const Flush = XFlush;
pub const Free = XFree;
pub const FreeGC = XFreeGC;
pub const GCValues = XGCValues;
pub const Image = XImage;
pub const ListPixmapFormats = XListPixmapFormats;
pub const LoadQueryFont = XLoadQueryFont;
pub const LookupKeysym = XLookupKeysym;
pub const MapWindow = XMapWindow;
pub const MapRaised = XMapRaised;
pub const NextEvent = XNextEvent;
pub const OpenDisplay = XOpenDisplay;
pub const Pending = XPending;
pub const PutImage = XPutImage;
pub const PixmapFormatValues = XPixmapFormatValues;
pub const RootWindow = XRootWindow;
pub const SelectInput = XSelectInput;
pub const SetFont = XSetFont;
pub const SetForeground = XSetForeground;
pub const SetWMProperties = XSetWMProperties;
pub const SetWindowAttributes = XSetWindowAttributes;
pub const SetWMNormalHints = XSetWMNormalHints;
pub const SizeHints = XSizeHints;
pub const StoreName = XStoreName;
pub const StringListToTextProperty = XStringListToTextProperty;
pub const TextProperty = XTextProperty;
pub const TextWidth = XTextWidth;
pub const UnloadFont = XUnloadFont;
pub const WhitePixel = XWhitePixel;

// zig translate-c include.h > include.zig -isystem /usr/include
// NOTES: Added "X11" library name to extern functions

pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulong;
pub const register_t = c_long;
pub fn __bswap_16(__bsx: __uint16_t) __uint16_t {
    return __uint16_t(((c_int(__bsx) >> @import("std").math.Log2Int(c_int)(8)) & 255) | ((c_int(__bsx) & 255) << @import("std").math.Log2Int(c_int)(8)));
}
pub fn __bswap_32(__bsx: __uint32_t) __uint32_t {
    return ((((__bsx & 4278190080) >> @import("std").math.Log2Int(c_uint)(24)) | ((__bsx & 16711680) >> @import("std").math.Log2Int(c_uint)(8))) | ((__bsx & 65280) << @import("std").math.Log2Int(c_uint)(8))) | ((__bsx & 255) << @import("std").math.Log2Int(c_uint)(24));
}
pub fn __bswap_64(__bsx: __uint64_t) __uint64_t {
    return __uint64_t(((((((((c_ulonglong(__bsx) & 18374686479671623680) >> @import("std").math.Log2Int(c_ulonglong)(56)) | ((c_ulonglong(__bsx) & 71776119061217280) >> @import("std").math.Log2Int(c_ulonglong)(40))) | ((c_ulonglong(__bsx) & 280375465082880) >> @import("std").math.Log2Int(c_ulonglong)(24))) | ((c_ulonglong(__bsx) & 1095216660480) >> @import("std").math.Log2Int(c_ulonglong)(8))) | ((c_ulonglong(__bsx) & 4278190080) << @import("std").math.Log2Int(c_ulonglong)(8))) | ((c_ulonglong(__bsx) & 16711680) << @import("std").math.Log2Int(c_ulonglong)(24))) | ((c_ulonglong(__bsx) & 65280) << @import("std").math.Log2Int(c_ulonglong)(40))) | ((c_ulonglong(__bsx) & 255) << @import("std").math.Log2Int(c_ulonglong)(56)));
}
pub fn __uint16_identity(__x: __uint16_t) __uint16_t {
    return __x;
}
pub fn __uint32_identity(__x: __uint32_t) __uint32_t {
    return __x;
}
pub fn __uint64_identity(__x: __uint64_t) __uint64_t {
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong,
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t,
    tv_usec: __suseconds_t,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask,
};
pub const fd_mask = __fd_mask;
pub extern "X11" fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern "X11" fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list,
    __next: [*c]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_cond_s = extern struct {
    @"": extern union {
        __wseq: c_ulonglong,
        __wseq32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    @"": extern union {
        __g1_start: c_ulonglong,
        __g1_start32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const XID = c_ulong;
pub const Mask = c_ulong;
pub const Atom = c_ulong;
pub const VisualID = c_ulong;
pub const Time = c_ulong;
pub const Window = XID;
pub const Drawable = XID;
pub const Font = XID;
pub const Pixmap = XID;
pub const Cursor = XID;
pub const Colormap = XID;
pub const GContext = XID;
pub const KeySym = XID;
pub const KeyCode = u8;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong,
    __clang_max_align_nonce2: c_longdouble,
};
pub extern "X11" fn _Xmblen(str: [*c]u8, len: c_int) c_int;
pub const XPointer = [*c]u8;
pub const struct__XExtData = extern struct {
    number: c_int,
    next: [*c]struct__XExtData,
    free_private: ?extern fn([*c]struct__XExtData) c_int,
    private_data: XPointer,
};
pub const XExtData = struct__XExtData;
pub const XExtCodes = extern struct {
    extension: c_int,
    major_opcode: c_int,
    first_event: c_int,
    first_error: c_int,
};
pub const XPixmapFormatValues = extern struct {
    depth: c_int,
    bits_per_pixel: c_int,
    scanline_pad: c_int,
};
pub const XGCValues = extern struct {
    function: c_int,
    plane_mask: c_ulong,
    foreground: c_ulong,
    background: c_ulong,
    line_width: c_int,
    line_style: c_int,
    cap_style: c_int,
    join_style: c_int,
    fill_style: c_int,
    fill_rule: c_int,
    arc_mode: c_int,
    tile: Pixmap,
    stipple: Pixmap,
    ts_x_origin: c_int,
    ts_y_origin: c_int,
    font: Font,
    subwindow_mode: c_int,
    graphics_exposures: c_int,
    clip_x_origin: c_int,
    clip_y_origin: c_int,
    clip_mask: Pixmap,
    dash_offset: c_int,
    dashes: u8,
};
pub const struct__XGC = @OpaqueType();
pub const GC = ?*struct__XGC;
pub const Visual = extern struct {
    ext_data: [*c]XExtData,
    visualid: VisualID,
    class: c_int,
    red_mask: c_ulong,
    green_mask: c_ulong,
    blue_mask: c_ulong,
    bits_per_rgb: c_int,
    map_entries: c_int,
};
pub const Depth = extern struct {
    depth: c_int,
    nvisuals: c_int,
    visuals: [*c]Visual,
};
pub const struct__XDisplay = @OpaqueType();
pub const Screen = extern struct {
    ext_data: [*c]XExtData,
    display: ?*struct__XDisplay,
    root: Window,
    width: c_int,
    height: c_int,
    mwidth: c_int,
    mheight: c_int,
    ndepths: c_int,
    depths: [*c]Depth,
    root_depth: c_int,
    root_visual: [*c]Visual,
    default_gc: GC,
    cmap: Colormap,
    white_pixel: c_ulong,
    black_pixel: c_ulong,
    max_maps: c_int,
    min_maps: c_int,
    backing_store: c_int,
    save_unders: c_int,
    root_input_mask: c_long,
};
pub const ScreenFormat = extern struct {
    ext_data: [*c]XExtData,
    depth: c_int,
    bits_per_pixel: c_int,
    scanline_pad: c_int,
};
pub const XSetWindowAttributes = extern struct {
    background_pixmap: Pixmap,
    background_pixel: c_ulong,
    border_pixmap: Pixmap,
    border_pixel: c_ulong,
    bit_gravity: c_int,
    win_gravity: c_int,
    backing_store: c_int,
    backing_planes: c_ulong,
    backing_pixel: c_ulong,
    save_under: c_int,
    event_mask: c_long,
    do_not_propagate_mask: c_long,
    override_redirect: c_int,
    colormap: Colormap,
    cursor: Cursor,
};
pub const XWindowAttributes = extern struct {
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    depth: c_int,
    visual: [*c]Visual,
    root: Window,
    class: c_int,
    bit_gravity: c_int,
    win_gravity: c_int,
    backing_store: c_int,
    backing_planes: c_ulong,
    backing_pixel: c_ulong,
    save_under: c_int,
    colormap: Colormap,
    map_installed: c_int,
    map_state: c_int,
    all_event_masks: c_long,
    your_event_mask: c_long,
    do_not_propagate_mask: c_long,
    override_redirect: c_int,
    screen: [*c]Screen,
};
pub const XHostAddress = extern struct {
    family: c_int,
    length: c_int,
    address: [*c]u8,
};
pub const XServerInterpretedAddress = extern struct {
    typelength: c_int,
    valuelength: c_int,
    type: [*c]u8,
    value: [*c]u8,
};
pub const struct_funcs = extern struct {
    create_image: ?extern fn(?*struct__XDisplay, [*c]Visual, c_uint, c_int, c_int, [*c]u8, c_uint, c_uint, c_int, c_int) [*c]struct__XImage,
    destroy_image: ?extern fn([*c]struct__XImage) c_int,
    get_pixel: ?extern fn([*c]struct__XImage, c_int, c_int) c_ulong,
    put_pixel: ?extern fn([*c]struct__XImage, c_int, c_int, c_ulong) c_int,
    sub_image: ?extern fn([*c]struct__XImage, c_int, c_int, c_uint, c_uint) [*c]struct__XImage,
    add_pixel: ?extern fn([*c]struct__XImage, c_long) c_int,
};
pub const struct__XImage = extern struct {
    width: c_int,
    height: c_int,
    xoffset: c_int,
    format: c_int,
    data: [*c]u8,
    byte_order: c_int,
    bitmap_unit: c_int,
    bitmap_bit_order: c_int,
    bitmap_pad: c_int,
    depth: c_int,
    bytes_per_line: c_int,
    bits_per_pixel: c_int,
    red_mask: c_ulong,
    green_mask: c_ulong,
    blue_mask: c_ulong,
    obdata: XPointer,
    f: struct_funcs,
};
pub const XImage = struct__XImage;
pub const XWindowChanges = extern struct {
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    sibling: Window,
    stack_mode: c_int,
};
pub const XColor = extern struct {
    pixel: c_ulong,
    red: c_ushort,
    green: c_ushort,
    blue: c_ushort,
    flags: u8,
    pad: u8,
};
pub const XSegment = extern struct {
    x1: c_short,
    y1: c_short,
    x2: c_short,
    y2: c_short,
};
pub const XPoint = extern struct {
    x: c_short,
    y: c_short,
};
pub const XRectangle = extern struct {
    x: c_short,
    y: c_short,
    width: c_ushort,
    height: c_ushort,
};
pub const XArc = extern struct {
    x: c_short,
    y: c_short,
    width: c_ushort,
    height: c_ushort,
    angle1: c_short,
    angle2: c_short,
};
pub const XKeyboardControl = extern struct {
    key_click_percent: c_int,
    bell_percent: c_int,
    bell_pitch: c_int,
    bell_duration: c_int,
    led: c_int,
    led_mode: c_int,
    key: c_int,
    auto_repeat_mode: c_int,
};
pub const XKeyboardState = extern struct {
    key_click_percent: c_int,
    bell_percent: c_int,
    bell_pitch: c_uint,
    bell_duration: c_uint,
    led_mask: c_ulong,
    global_auto_repeat: c_int,
    auto_repeats: [32]u8,
};
pub const XTimeCoord = extern struct {
    time: Time,
    x: c_short,
    y: c_short,
};
pub const XModifierKeymap = extern struct {
    max_keypermod: c_int,
    modifiermap: [*c]KeyCode,
};
pub const Display = struct__XDisplay;
pub const struct__XPrivate = @OpaqueType();
pub const struct__XrmHashBucketRec = @OpaqueType();
pub const _XPrivDisplay = [*c]extern struct {
    ext_data: [*c]XExtData,
    private1: ?*struct__XPrivate,
    fd: c_int,
    private2: c_int,
    proto_major_version: c_int,
    proto_minor_version: c_int,
    vendor: [*c]u8,
    private3: XID,
    private4: XID,
    private5: XID,
    private6: c_int,
    resource_alloc: ?extern fn(?*struct__XDisplay) XID,
    byte_order: c_int,
    bitmap_unit: c_int,
    bitmap_pad: c_int,
    bitmap_bit_order: c_int,
    nformats: c_int,
    pixmap_format: [*c]ScreenFormat,
    private8: c_int,
    release: c_int,
    private9: ?*struct__XPrivate,
    private10: ?*struct__XPrivate,
    qlen: c_int,
    last_request_read: c_ulong,
    request: c_ulong,
    private11: XPointer,
    private12: XPointer,
    private13: XPointer,
    private14: XPointer,
    max_request_size: c_uint,
    db: ?*struct__XrmHashBucketRec,
    private15: ?extern fn(?*struct__XDisplay) c_int,
    display_name: [*c]u8,
    default_screen: c_int,
    nscreens: c_int,
    screens: [*c]Screen,
    motion_buffer: c_ulong,
    private16: c_ulong,
    min_keycode: c_int,
    max_keycode: c_int,
    private17: XPointer,
    private18: XPointer,
    private19: c_int,
    xdefaults: [*c]u8,
};
pub const XKeyEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    state: c_uint,
    keycode: c_uint,
    same_screen: c_int,
};
pub const XKeyPressedEvent = XKeyEvent;
pub const XKeyReleasedEvent = XKeyEvent;
pub const XButtonEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    state: c_uint,
    button: c_uint,
    same_screen: c_int,
};
pub const XButtonPressedEvent = XButtonEvent;
pub const XButtonReleasedEvent = XButtonEvent;
pub const XMotionEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    state: c_uint,
    is_hint: u8,
    same_screen: c_int,
};
pub const XPointerMovedEvent = XMotionEvent;
pub const XCrossingEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    root: Window,
    subwindow: Window,
    time: Time,
    x: c_int,
    y: c_int,
    x_root: c_int,
    y_root: c_int,
    mode: c_int,
    detail: c_int,
    same_screen: c_int,
    focus: c_int,
    state: c_uint,
};
pub const XEnterWindowEvent = XCrossingEvent;
pub const XLeaveWindowEvent = XCrossingEvent;
pub const XFocusChangeEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    mode: c_int,
    detail: c_int,
};
pub const XFocusInEvent = XFocusChangeEvent;
pub const XFocusOutEvent = XFocusChangeEvent;
pub const XKeymapEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    key_vector: [32]u8,
};
pub const XExposeEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    count: c_int,
};
pub const XGraphicsExposeEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    drawable: Drawable,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    count: c_int,
    major_code: c_int,
    minor_code: c_int,
};
pub const XNoExposeEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    drawable: Drawable,
    major_code: c_int,
    minor_code: c_int,
};
pub const XVisibilityEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    state: c_int,
};
pub const XCreateWindowEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    parent: Window,
    window: Window,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    override_redirect: c_int,
};
pub const XDestroyWindowEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
};
pub const XUnmapEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
    from_configure: c_int,
};
pub const XMapEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
    override_redirect: c_int,
};
pub const XMapRequestEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    parent: Window,
    window: Window,
};
pub const XReparentEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
    parent: Window,
    x: c_int,
    y: c_int,
    override_redirect: c_int,
};
pub const XConfigureEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    above: Window,
    override_redirect: c_int,
};
pub const XGravityEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
    x: c_int,
    y: c_int,
};
pub const XResizeRequestEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    width: c_int,
    height: c_int,
};
pub const XConfigureRequestEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    parent: Window,
    window: Window,
    x: c_int,
    y: c_int,
    width: c_int,
    height: c_int,
    border_width: c_int,
    above: Window,
    detail: c_int,
    value_mask: c_ulong,
};
pub const XCirculateEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    event: Window,
    window: Window,
    place: c_int,
};
pub const XCirculateRequestEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    parent: Window,
    window: Window,
    place: c_int,
};
pub const XPropertyEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    atom: Atom,
    time: Time,
    state: c_int,
};
pub const XSelectionClearEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    selection: Atom,
    time: Time,
};
pub const XSelectionRequestEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    owner: Window,
    requestor: Window,
    selection: Atom,
    target: Atom,
    property: Atom,
    time: Time,
};
pub const XSelectionEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    requestor: Window,
    selection: Atom,
    target: Atom,
    property: Atom,
    time: Time,
};
pub const XColormapEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    colormap: Colormap,
    new: c_int,
    state: c_int,
};
pub const XClientMessageEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    message_type: Atom,
    format: c_int,
    data: extern union {
        b: [20]u8,
        s: [10]c_short,
        l: [5]c_long,
    },
};
pub const XMappingEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
    request: c_int,
    first_keycode: c_int,
    count: c_int,
};
pub const XErrorEvent = extern struct {
    type: c_int,
    display: ?*Display,
    resourceid: XID,
    serial: c_ulong,
    error_code: u8,
    request_code: u8,
    minor_code: u8,
};
pub const XAnyEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    window: Window,
};
pub const XGenericEvent = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
};
pub const XGenericEventCookie = extern struct {
    type: c_int,
    serial: c_ulong,
    send_event: c_int,
    display: ?*Display,
    extension: c_int,
    evtype: c_int,
    cookie: c_uint,
    data: ?*c_void,
};
pub const union__XEvent = extern union {
    type: c_int,
    xany: XAnyEvent,
    xkey: XKeyEvent,
    xbutton: XButtonEvent,
    xmotion: XMotionEvent,
    xcrossing: XCrossingEvent,
    xfocus: XFocusChangeEvent,
    xexpose: XExposeEvent,
    xgraphicsexpose: XGraphicsExposeEvent,
    xnoexpose: XNoExposeEvent,
    xvisibility: XVisibilityEvent,
    xcreatewindow: XCreateWindowEvent,
    xdestroywindow: XDestroyWindowEvent,
    xunmap: XUnmapEvent,
    xmap: XMapEvent,
    xmaprequest: XMapRequestEvent,
    xreparent: XReparentEvent,
    xconfigure: XConfigureEvent,
    xgravity: XGravityEvent,
    xresizerequest: XResizeRequestEvent,
    xconfigurerequest: XConfigureRequestEvent,
    xcirculate: XCirculateEvent,
    xcirculaterequest: XCirculateRequestEvent,
    xproperty: XPropertyEvent,
    xselectionclear: XSelectionClearEvent,
    xselectionrequest: XSelectionRequestEvent,
    xselection: XSelectionEvent,
    xcolormap: XColormapEvent,
    xclient: XClientMessageEvent,
    xmapping: XMappingEvent,
    xerror: XErrorEvent,
    xkeymap: XKeymapEvent,
    xgeneric: XGenericEvent,
    xcookie: XGenericEventCookie,
    pad: [24]c_long,
};
pub const XEvent = union__XEvent;
pub const XCharStruct = extern struct {
    lbearing: c_short,
    rbearing: c_short,
    width: c_short,
    ascent: c_short,
    descent: c_short,
    attributes: c_ushort,
};
pub const XFontProp = extern struct {
    name: Atom,
    card32: c_ulong,
};
pub const XFontStruct = extern struct {
    ext_data: [*c]XExtData,
    fid: Font,
    direction: c_uint,
    min_char_or_byte2: c_uint,
    max_char_or_byte2: c_uint,
    min_byte1: c_uint,
    max_byte1: c_uint,
    all_chars_exist: c_int,
    default_char: c_uint,
    n_properties: c_int,
    properties: [*c]XFontProp,
    min_bounds: XCharStruct,
    max_bounds: XCharStruct,
    per_char: [*c]XCharStruct,
    ascent: c_int,
    descent: c_int,
};
pub const XTextItem = extern struct {
    chars: [*c]u8,
    nchars: c_int,
    delta: c_int,
    font: Font,
};
pub const XChar2b = extern struct {
    byte1: u8,
    byte2: u8,
};
pub const XTextItem16 = extern struct {
    chars: [*c]XChar2b,
    nchars: c_int,
    delta: c_int,
    font: Font,
};
pub const XEDataObject = extern union {
    display: ?*Display,
    gc: GC,
    visual: [*c]Visual,
    screen: [*c]Screen,
    pixmap_format: [*c]ScreenFormat,
    font: [*c]XFontStruct,
};
pub const XFontSetExtents = extern struct {
    max_ink_extent: XRectangle,
    max_logical_extent: XRectangle,
};
pub const struct__XOM = @OpaqueType();
pub const XOM = ?*struct__XOM;
pub const struct__XOC = @OpaqueType();
pub const XOC = ?*struct__XOC;
pub const XFontSet = ?*struct__XOC;
pub const XmbTextItem = extern struct {
    chars: [*c]u8,
    nchars: c_int,
    delta: c_int,
    font_set: XFontSet,
};
pub const XwcTextItem = extern struct {
    chars: [*c]wchar_t,
    nchars: c_int,
    delta: c_int,
    font_set: XFontSet,
};
pub const XOMCharSetList = extern struct {
    charset_count: c_int,
    charset_list: [*c]([*c]u8),
};
pub const XOMOrientation_LTR_TTB = 0;
pub const XOMOrientation_RTL_TTB = 1;
pub const XOMOrientation_TTB_LTR = 2;
pub const XOMOrientation_TTB_RTL = 3;
pub const XOMOrientation_Context = 4;
pub const XOrientation = extern enum {
    XOMOrientation_LTR_TTB = 0,
    XOMOrientation_RTL_TTB = 1,
    XOMOrientation_TTB_LTR = 2,
    XOMOrientation_TTB_RTL = 3,
    XOMOrientation_Context = 4,
};
pub const XOMOrientation = extern struct {
    num_orientation: c_int,
    orientation: [*c]XOrientation,
};
pub const XOMFontInfo = extern struct {
    num_font: c_int,
    font_struct_list: [*c]([*c]XFontStruct),
    font_name_list: [*c]([*c]u8),
};
pub const struct__XIM = @OpaqueType();
pub const XIM = ?*struct__XIM;
pub const struct__XIC = @OpaqueType();
pub const XIC = ?*struct__XIC;
pub const XIMProc = ?extern fn(XIM, XPointer, XPointer) void;
pub const XICProc = ?extern fn(XIC, XPointer, XPointer) c_int;
pub const XIDProc = ?extern fn(?*Display, XPointer, XPointer) void;
pub const XIMStyle = c_ulong;
pub const XIMStyles = extern struct {
    count_styles: c_ushort,
    supported_styles: [*c]XIMStyle,
};
pub const XVaNestedList = ?*c_void;
pub const XIMCallback = extern struct {
    client_data: XPointer,
    callback: XIMProc,
};
pub const XICCallback = extern struct {
    client_data: XPointer,
    callback: XICProc,
};
pub const XIMFeedback = c_ulong;
pub const struct__XIMText = extern struct {
    length: c_ushort,
    feedback: [*c]XIMFeedback,
    encoding_is_wchar: c_int,
    string: extern union {
        multi_byte: [*c]u8,
        wide_char: [*c]wchar_t,
    },
};
pub const XIMText = struct__XIMText;
pub const XIMPreeditState = c_ulong;
pub const struct__XIMPreeditStateNotifyCallbackStruct = extern struct {
    state: XIMPreeditState,
};
pub const XIMPreeditStateNotifyCallbackStruct = struct__XIMPreeditStateNotifyCallbackStruct;
pub const XIMResetState = c_ulong;
pub const XIMStringConversionFeedback = c_ulong;
pub const struct__XIMStringConversionText = extern struct {
    length: c_ushort,
    feedback: [*c]XIMStringConversionFeedback,
    encoding_is_wchar: c_int,
    string: extern union {
        mbs: [*c]u8,
        wcs: [*c]wchar_t,
    },
};
pub const XIMStringConversionText = struct__XIMStringConversionText;
pub const XIMStringConversionPosition = c_ushort;
pub const XIMStringConversionType = c_ushort;
pub const XIMStringConversionOperation = c_ushort;
pub const XIMForwardChar = 0;
pub const XIMBackwardChar = 1;
pub const XIMForwardWord = 2;
pub const XIMBackwardWord = 3;
pub const XIMCaretUp = 4;
pub const XIMCaretDown = 5;
pub const XIMNextLine = 6;
pub const XIMPreviousLine = 7;
pub const XIMLineStart = 8;
pub const XIMLineEnd = 9;
pub const XIMAbsolutePosition = 10;
pub const XIMDontChange = 11;
pub const XIMCaretDirection = extern enum {
    XIMForwardChar = 0,
    XIMBackwardChar = 1,
    XIMForwardWord = 2,
    XIMBackwardWord = 3,
    XIMCaretUp = 4,
    XIMCaretDown = 5,
    XIMNextLine = 6,
    XIMPreviousLine = 7,
    XIMLineStart = 8,
    XIMLineEnd = 9,
    XIMAbsolutePosition = 10,
    XIMDontChange = 11,
};
pub const struct__XIMStringConversionCallbackStruct = extern struct {
    position: XIMStringConversionPosition,
    direction: XIMCaretDirection,
    operation: XIMStringConversionOperation,
    factor: c_ushort,
    text: [*c]XIMStringConversionText,
};
pub const XIMStringConversionCallbackStruct = struct__XIMStringConversionCallbackStruct;
pub const struct__XIMPreeditDrawCallbackStruct = extern struct {
    caret: c_int,
    chg_first: c_int,
    chg_length: c_int,
    text: [*c]XIMText,
};
pub const XIMPreeditDrawCallbackStruct = struct__XIMPreeditDrawCallbackStruct;
pub const XIMIsInvisible = 0;
pub const XIMIsPrimary = 1;
pub const XIMIsSecondary = 2;
pub const XIMCaretStyle = extern enum {
    XIMIsInvisible = 0,
    XIMIsPrimary = 1,
    XIMIsSecondary = 2,
};
pub const struct__XIMPreeditCaretCallbackStruct = extern struct {
    position: c_int,
    direction: XIMCaretDirection,
    style: XIMCaretStyle,
};
pub const XIMPreeditCaretCallbackStruct = struct__XIMPreeditCaretCallbackStruct;
pub const XIMTextType = 0;
pub const XIMBitmapType = 1;
pub const XIMStatusDataType = extern enum {
    XIMTextType = 0,
    XIMBitmapType = 1,
};
pub const struct__XIMStatusDrawCallbackStruct = extern struct {
    type: XIMStatusDataType,
    data: extern union {
        text: [*c]XIMText,
        bitmap: Pixmap,
    },
};
pub const XIMStatusDrawCallbackStruct = struct__XIMStatusDrawCallbackStruct;
pub const struct__XIMHotKeyTrigger = extern struct {
    keysym: KeySym,
    modifier: c_int,
    modifier_mask: c_int,
};
pub const XIMHotKeyTrigger = struct__XIMHotKeyTrigger;
pub const struct__XIMHotKeyTriggers = extern struct {
    num_hot_key: c_int,
    key: [*c]XIMHotKeyTrigger,
};
pub const XIMHotKeyTriggers = struct__XIMHotKeyTriggers;
pub const XIMHotKeyState = c_ulong;
pub const XIMValuesList = extern struct {
    count_values: c_ushort,
    supported_values: [*c]([*c]u8),
};
pub extern var _Xdebug: c_int;
pub extern "X11" fn XLoadQueryFont(arg0: ?*Display, arg1: [*c]const u8) [*c]XFontStruct;
pub extern "X11" fn XQueryFont(arg0: ?*Display, arg1: XID) [*c]XFontStruct;
pub extern "X11" fn XGetMotionEvents(arg0: ?*Display, arg1: Window, arg2: Time, arg3: Time, arg4: [*c]c_int) [*c]XTimeCoord;
pub extern "X11" fn XDeleteModifiermapEntry(arg0: [*c]XModifierKeymap, arg1: KeyCode, arg2: c_int) [*c]XModifierKeymap;
pub extern "X11" fn XGetModifierMapping(arg0: ?*Display) [*c]XModifierKeymap;
pub extern "X11" fn XInsertModifiermapEntry(arg0: [*c]XModifierKeymap, arg1: KeyCode, arg2: c_int) [*c]XModifierKeymap;
pub extern "X11" fn XNewModifiermap(arg0: c_int) [*c]XModifierKeymap;
pub extern "X11" fn XCreateImage(arg0: ?*Display, arg1: [*c]Visual, arg2: c_uint, arg3: c_int, arg4: c_int, arg5: [*c]u8, arg6: c_uint, arg7: c_uint, arg8: c_int, arg9: c_int) [*c]XImage;
pub extern "X11" fn XInitImage(arg0: [*c]XImage) c_int;
pub extern "X11" fn XGetImage(arg0: ?*Display, arg1: Drawable, arg2: c_int, arg3: c_int, arg4: c_uint, arg5: c_uint, arg6: c_ulong, arg7: c_int) [*c]XImage;
pub extern "X11" fn XGetSubImage(arg0: ?*Display, arg1: Drawable, arg2: c_int, arg3: c_int, arg4: c_uint, arg5: c_uint, arg6: c_ulong, arg7: c_int, arg8: [*c]XImage, arg9: c_int, arg10: c_int) [*c]XImage;
pub extern "X11" fn XOpenDisplay(arg0: [*c]const u8) ?*Display;
pub extern "X11" fn XrmInitialize() void;
pub extern "X11" fn XFetchBytes(arg0: ?*Display, arg1: [*c]c_int) [*c]u8;
pub extern "X11" fn XFetchBuffer(arg0: ?*Display, arg1: [*c]c_int, arg2: c_int) [*c]u8;
pub extern "X11" fn XGetAtomName(arg0: ?*Display, arg1: Atom) [*c]u8;
pub extern "X11" fn XGetAtomNames(arg0: ?*Display, arg1: [*c]Atom, arg2: c_int, arg3: [*c]([*c]u8)) c_int;
pub extern "X11" fn XGetDefault(arg0: ?*Display, arg1: [*c]const u8, arg2: [*c]const u8) [*c]u8;
pub extern "X11" fn XDisplayName(arg0: [*c]const u8) [*c]u8;
pub extern "X11" fn XKeysymToString(arg0: KeySym) [*c]u8;
pub extern "X11" fn XSynchronize(arg0: ?*Display, arg1: c_int) ?extern fn(?*Display) c_int;
pub extern "X11" fn XSetAfterFunction(arg0: ?*Display, arg1: ?extern fn(?*Display) c_int) ?extern fn(?*Display) c_int;
pub extern "X11" fn XInternAtom(arg0: ?*Display, arg1: [*c]const u8, arg2: c_int) Atom;
pub extern "X11" fn XInternAtoms(arg0: ?*Display, arg1: [*c]([*c]u8), arg2: c_int, arg3: c_int, arg4: [*c]Atom) c_int;
pub extern "X11" fn XCopyColormapAndFree(arg0: ?*Display, arg1: Colormap) Colormap;
pub extern "X11" fn XCreateColormap(arg0: ?*Display, arg1: Window, arg2: [*c]Visual, arg3: c_int) Colormap;
pub extern "X11" fn XCreatePixmapCursor(arg0: ?*Display, arg1: Pixmap, arg2: Pixmap, arg3: [*c]XColor, arg4: [*c]XColor, arg5: c_uint, arg6: c_uint) Cursor;
pub extern "X11" fn XCreateGlyphCursor(arg0: ?*Display, arg1: Font, arg2: Font, arg3: c_uint, arg4: c_uint, arg5: [*c]const XColor, arg6: [*c]const XColor) Cursor;
pub extern "X11" fn XCreateFontCursor(arg0: ?*Display, arg1: c_uint) Cursor;
pub extern "X11" fn XLoadFont(arg0: ?*Display, arg1: [*c]const u8) Font;
pub extern "X11" fn XCreateGC(arg0: ?*Display, arg1: Drawable, arg2: c_ulong, arg3: [*c]XGCValues) GC;
pub extern "X11" fn XGContextFromGC(arg0: GC) GContext;
pub extern "X11" fn XFlushGC(arg0: ?*Display, arg1: GC) void;
pub extern "X11" fn XCreatePixmap(arg0: ?*Display, arg1: Drawable, arg2: c_uint, arg3: c_uint, arg4: c_uint) Pixmap;
pub extern "X11" fn XCreateBitmapFromData(arg0: ?*Display, arg1: Drawable, arg2: [*c]const u8, arg3: c_uint, arg4: c_uint) Pixmap;
pub extern "X11" fn XCreatePixmapFromBitmapData(arg0: ?*Display, arg1: Drawable, arg2: [*c]u8, arg3: c_uint, arg4: c_uint, arg5: c_ulong, arg6: c_ulong, arg7: c_uint) Pixmap;
pub extern "X11" fn XCreateSimpleWindow(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_int, arg4: c_uint, arg5: c_uint, arg6: c_uint, arg7: c_ulong, arg8: c_ulong) Window;
pub extern "X11" fn XGetSelectionOwner(arg0: ?*Display, arg1: Atom) Window;
pub extern "X11" fn XCreateWindow(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_int, arg4: c_uint, arg5: c_uint, arg6: c_uint, arg7: c_int, arg8: c_uint, arg9: [*c]Visual, arg10: c_ulong, arg11: [*c]XSetWindowAttributes) Window;
pub extern "X11" fn XListInstalledColormaps(arg0: ?*Display, arg1: Window, arg2: [*c]c_int) [*c]Colormap;
pub extern "X11" fn XListFonts(arg0: ?*Display, arg1: [*c]const u8, arg2: c_int, arg3: [*c]c_int) [*c]([*c]u8);
pub extern "X11" fn XListFontsWithInfo(arg0: ?*Display, arg1: [*c]const u8, arg2: c_int, arg3: [*c]c_int, arg4: [*c]([*c]XFontStruct)) [*c]([*c]u8);
pub extern "X11" fn XGetFontPath(arg0: ?*Display, arg1: [*c]c_int) [*c]([*c]u8);
pub extern "X11" fn XListExtensions(arg0: ?*Display, arg1: [*c]c_int) [*c]([*c]u8);
pub extern "X11" fn XListProperties(arg0: ?*Display, arg1: Window, arg2: [*c]c_int) [*c]Atom;
pub extern "X11" fn XListHosts(arg0: ?*Display, arg1: [*c]c_int, arg2: [*c]c_int) [*c]XHostAddress;
pub extern "X11" fn XKeycodeToKeysym(arg0: ?*Display, arg1: KeyCode, arg2: c_int) KeySym;
pub extern "X11" fn XLookupKeysym(arg0: [*c]XKeyEvent, arg1: c_int) KeySym;
pub extern "X11" fn XGetKeyboardMapping(arg0: ?*Display, arg1: KeyCode, arg2: c_int, arg3: [*c]c_int) [*c]KeySym;
pub extern "X11" fn XStringToKeysym(arg0: [*c]const u8) KeySym;
pub extern "X11" fn XMaxRequestSize(arg0: ?*Display) c_long;
pub extern "X11" fn XExtendedMaxRequestSize(arg0: ?*Display) c_long;
pub extern "X11" fn XResourceManagerString(arg0: ?*Display) [*c]u8;
pub extern "X11" fn XScreenResourceString(arg0: [*c]Screen) [*c]u8;
pub extern "X11" fn XDisplayMotionBufferSize(arg0: ?*Display) c_ulong;
pub extern "X11" fn XVisualIDFromVisual(arg0: [*c]Visual) VisualID;
pub extern "X11" fn XInitThreads() c_int;
pub extern "X11" fn XLockDisplay(arg0: ?*Display) void;
pub extern "X11" fn XUnlockDisplay(arg0: ?*Display) void;
pub extern "X11" fn XInitExtension(arg0: ?*Display, arg1: [*c]const u8) [*c]XExtCodes;
pub extern "X11" fn XAddExtension(arg0: ?*Display) [*c]XExtCodes;
pub extern "X11" fn XFindOnExtensionList(arg0: [*c]([*c]XExtData), arg1: c_int) [*c]XExtData;
pub extern "X11" fn XEHeadOfExtensionList(arg0: XEDataObject) [*c]([*c]XExtData);
pub extern "X11" fn XRootWindow(arg0: ?*Display, arg1: c_int) Window;
pub extern "X11" fn XDefaultRootWindow(arg0: ?*Display) Window;
pub extern "X11" fn XRootWindowOfScreen(arg0: [*c]Screen) Window;
pub extern "X11" fn XDefaultVisual(arg0: ?*Display, arg1: c_int) [*c]Visual;
pub extern "X11" fn XDefaultVisualOfScreen(arg0: [*c]Screen) [*c]Visual;
pub extern "X11" fn XDefaultGC(arg0: ?*Display, arg1: c_int) GC;
pub extern "X11" fn XDefaultGCOfScreen(arg0: [*c]Screen) GC;
pub extern "X11" fn XBlackPixel(arg0: ?*Display, arg1: c_int) c_ulong;
pub extern "X11" fn XWhitePixel(arg0: ?*Display, arg1: c_int) c_ulong;
pub extern "X11" fn XAllPlanes() c_ulong;
pub extern "X11" fn XBlackPixelOfScreen(arg0: [*c]Screen) c_ulong;
pub extern "X11" fn XWhitePixelOfScreen(arg0: [*c]Screen) c_ulong;
pub extern "X11" fn XNextRequest(arg0: ?*Display) c_ulong;
pub extern "X11" fn XLastKnownRequestProcessed(arg0: ?*Display) c_ulong;
pub extern "X11" fn XServerVendor(arg0: ?*Display) [*c]u8;
pub extern "X11" fn XDisplayString(arg0: ?*Display) [*c]u8;
pub extern "X11" fn XDefaultColormap(arg0: ?*Display, arg1: c_int) Colormap;
pub extern "X11" fn XDefaultColormapOfScreen(arg0: [*c]Screen) Colormap;
pub extern "X11" fn XDisplayOfScreen(arg0: [*c]Screen) ?*Display;
pub extern "X11" fn XScreenOfDisplay(arg0: ?*Display, arg1: c_int) [*c]Screen;
pub extern "X11" fn XDefaultScreenOfDisplay(arg0: ?*Display) [*c]Screen;
pub extern "X11" fn XEventMaskOfScreen(arg0: [*c]Screen) c_long;
pub extern "X11" fn XScreenNumberOfScreen(arg0: [*c]Screen) c_int;
pub const XErrorHandler = ?extern fn(?*Display, [*c]XErrorEvent) c_int;
pub extern "X11" fn XSetErrorHandler(arg0: XErrorHandler) XErrorHandler;
pub const XIOErrorHandler = ?extern fn(?*Display) c_int;
pub extern "X11" fn XSetIOErrorHandler(arg0: XIOErrorHandler) XIOErrorHandler;
pub extern "X11" fn XListPixmapFormats(arg0: ?*Display, arg1: [*c]c_int) [*c]XPixmapFormatValues;
pub extern "X11" fn XListDepths(arg0: ?*Display, arg1: c_int, arg2: [*c]c_int) [*c]c_int;
pub extern "X11" fn XReconfigureWMWindow(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_uint, arg4: [*c]XWindowChanges) c_int;
pub extern "X11" fn XGetWMProtocols(arg0: ?*Display, arg1: Window, arg2: [*c]([*c]Atom), arg3: [*c]c_int) c_int;
pub extern "X11" fn XSetWMProtocols(arg0: ?*Display, arg1: Window, arg2: [*c]Atom, arg3: c_int) c_int;
pub extern "X11" fn XIconifyWindow(arg0: ?*Display, arg1: Window, arg2: c_int) c_int;
pub extern "X11" fn XWithdrawWindow(arg0: ?*Display, arg1: Window, arg2: c_int) c_int;
pub extern "X11" fn XGetCommand(arg0: ?*Display, arg1: Window, arg2: [*c]([*c]([*c]u8)), arg3: [*c]c_int) c_int;
pub extern "X11" fn XGetWMColormapWindows(arg0: ?*Display, arg1: Window, arg2: [*c]([*c]Window), arg3: [*c]c_int) c_int;
pub extern "X11" fn XSetWMColormapWindows(arg0: ?*Display, arg1: Window, arg2: [*c]Window, arg3: c_int) c_int;
pub extern "X11" fn XFreeStringList(arg0: [*c]([*c]u8)) void;
pub extern "X11" fn XSetTransientForHint(arg0: ?*Display, arg1: Window, arg2: Window) c_int;
pub extern "X11" fn XActivateScreenSaver(arg0: ?*Display) c_int;
pub extern "X11" fn XAddHost(arg0: ?*Display, arg1: [*c]XHostAddress) c_int;
pub extern "X11" fn XAddHosts(arg0: ?*Display, arg1: [*c]XHostAddress, arg2: c_int) c_int;
pub extern "X11" fn XAddToExtensionList(arg0: [*c]([*c]struct__XExtData), arg1: [*c]XExtData) c_int;
pub extern "X11" fn XAddToSaveSet(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XAllocColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]XColor) c_int;
pub extern "X11" fn XAllocColorCells(arg0: ?*Display, arg1: Colormap, arg2: c_int, arg3: [*c]c_ulong, arg4: c_uint, arg5: [*c]c_ulong, arg6: c_uint) c_int;
pub extern "X11" fn XAllocColorPlanes(arg0: ?*Display, arg1: Colormap, arg2: c_int, arg3: [*c]c_ulong, arg4: c_int, arg5: c_int, arg6: c_int, arg7: c_int, arg8: [*c]c_ulong, arg9: [*c]c_ulong, arg10: [*c]c_ulong) c_int;
pub extern "X11" fn XAllocNamedColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]const u8, arg3: [*c]XColor, arg4: [*c]XColor) c_int;
pub extern "X11" fn XAllowEvents(arg0: ?*Display, arg1: c_int, arg2: Time) c_int;
pub extern "X11" fn XAutoRepeatOff(arg0: ?*Display) c_int;
pub extern "X11" fn XAutoRepeatOn(arg0: ?*Display) c_int;
pub extern "X11" fn XBell(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XBitmapBitOrder(arg0: ?*Display) c_int;
pub extern "X11" fn XBitmapPad(arg0: ?*Display) c_int;
pub extern "X11" fn XBitmapUnit(arg0: ?*Display) c_int;
pub extern "X11" fn XCellsOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XChangeActivePointerGrab(arg0: ?*Display, arg1: c_uint, arg2: Cursor, arg3: Time) c_int;
pub extern "X11" fn XChangeGC(arg0: ?*Display, arg1: GC, arg2: c_ulong, arg3: [*c]XGCValues) c_int;
pub extern "X11" fn XChangeKeyboardControl(arg0: ?*Display, arg1: c_ulong, arg2: [*c]XKeyboardControl) c_int;
pub extern "X11" fn XChangeKeyboardMapping(arg0: ?*Display, arg1: c_int, arg2: c_int, arg3: [*c]KeySym, arg4: c_int) c_int;
pub extern "X11" fn XChangePointerControl(arg0: ?*Display, arg1: c_int, arg2: c_int, arg3: c_int, arg4: c_int, arg5: c_int) c_int;
pub extern "X11" fn XChangeProperty(arg0: ?*Display, arg1: Window, arg2: Atom, arg3: Atom, arg4: c_int, arg5: c_int, arg6: [*c]const u8, arg7: c_int) c_int;
pub extern "X11" fn XChangeSaveSet(arg0: ?*Display, arg1: Window, arg2: c_int) c_int;
pub extern "X11" fn XChangeWindowAttributes(arg0: ?*Display, arg1: Window, arg2: c_ulong, arg3: [*c]XSetWindowAttributes) c_int;
pub extern "X11" fn XCheckIfEvent(arg0: ?*Display, arg1: [*c]XEvent, arg2: ?extern fn(?*Display, [*c]XEvent, XPointer) c_int, arg3: XPointer) c_int;
pub extern "X11" fn XCheckMaskEvent(arg0: ?*Display, arg1: c_long, arg2: [*c]XEvent) c_int;
pub extern "X11" fn XCheckTypedEvent(arg0: ?*Display, arg1: c_int, arg2: [*c]XEvent) c_int;
pub extern "X11" fn XCheckTypedWindowEvent(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: [*c]XEvent) c_int;
pub extern "X11" fn XCheckWindowEvent(arg0: ?*Display, arg1: Window, arg2: c_long, arg3: [*c]XEvent) c_int;
pub extern "X11" fn XCirculateSubwindows(arg0: ?*Display, arg1: Window, arg2: c_int) c_int;
pub extern "X11" fn XCirculateSubwindowsDown(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XCirculateSubwindowsUp(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XClearArea(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_int, arg4: c_uint, arg5: c_uint, arg6: c_int) c_int;
pub extern "X11" fn XClearWindow(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XCloseDisplay(arg0: ?*Display) c_int;
pub extern "X11" fn XConfigureWindow(arg0: ?*Display, arg1: Window, arg2: c_uint, arg3: [*c]XWindowChanges) c_int;
pub extern "X11" fn XConnectionNumber(arg0: ?*Display) c_int;
pub extern "X11" fn XConvertSelection(arg0: ?*Display, arg1: Atom, arg2: Atom, arg3: Atom, arg4: Window, arg5: Time) c_int;
pub extern "X11" fn XCopyArea(arg0: ?*Display, arg1: Drawable, arg2: Drawable, arg3: GC, arg4: c_int, arg5: c_int, arg6: c_uint, arg7: c_uint, arg8: c_int, arg9: c_int) c_int;
pub extern "X11" fn XCopyGC(arg0: ?*Display, arg1: GC, arg2: c_ulong, arg3: GC) c_int;
pub extern "X11" fn XCopyPlane(arg0: ?*Display, arg1: Drawable, arg2: Drawable, arg3: GC, arg4: c_int, arg5: c_int, arg6: c_uint, arg7: c_uint, arg8: c_int, arg9: c_int, arg10: c_ulong) c_int;
pub extern "X11" fn XDefaultDepth(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDefaultDepthOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XDefaultScreen(arg0: ?*Display) c_int;
pub extern "X11" fn XDefineCursor(arg0: ?*Display, arg1: Window, arg2: Cursor) c_int;
pub extern "X11" fn XDeleteProperty(arg0: ?*Display, arg1: Window, arg2: Atom) c_int;
pub extern "X11" fn XDestroyWindow(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XDestroySubwindows(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XDoesBackingStore(arg0: [*c]Screen) c_int;
pub extern "X11" fn XDoesSaveUnders(arg0: [*c]Screen) c_int;
pub extern "X11" fn XDisableAccessControl(arg0: ?*Display) c_int;
pub extern "X11" fn XDisplayCells(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDisplayHeight(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDisplayHeightMM(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDisplayKeycodes(arg0: ?*Display, arg1: [*c]c_int, arg2: [*c]c_int) c_int;
pub extern "X11" fn XDisplayPlanes(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDisplayWidth(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDisplayWidthMM(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XDrawArc(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: c_uint, arg6: c_uint, arg7: c_int, arg8: c_int) c_int;
pub extern "X11" fn XDrawArcs(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XArc, arg4: c_int) c_int;
pub extern "X11" fn XDrawImageString(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]const u8, arg6: c_int) c_int;
pub extern "X11" fn XDrawImageString16(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]const XChar2b, arg6: c_int) c_int;
pub extern "X11" fn XDrawLine(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: c_int, arg6: c_int) c_int;
pub extern "X11" fn XDrawLines(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XPoint, arg4: c_int, arg5: c_int) c_int;
pub extern "X11" fn XDrawPoint(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int) c_int;
pub extern "X11" fn XDrawPoints(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XPoint, arg4: c_int, arg5: c_int) c_int;
pub extern "X11" fn XDrawRectangle(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: c_uint, arg6: c_uint) c_int;
pub extern "X11" fn XDrawRectangles(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XRectangle, arg4: c_int) c_int;
pub extern "X11" fn XDrawSegments(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XSegment, arg4: c_int) c_int;
pub extern "X11" fn XDrawString(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]const u8, arg6: c_int) c_int;
pub extern "X11" fn XDrawString16(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]const XChar2b, arg6: c_int) c_int;
pub extern "X11" fn XDrawText(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]XTextItem, arg6: c_int) c_int;
pub extern "X11" fn XDrawText16(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]XTextItem16, arg6: c_int) c_int;
pub extern "X11" fn XEnableAccessControl(arg0: ?*Display) c_int;
pub extern "X11" fn XEventsQueued(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XFetchName(arg0: ?*Display, arg1: Window, arg2: [*c]([*c]u8)) c_int;
pub extern "X11" fn XFillArc(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: c_uint, arg6: c_uint, arg7: c_int, arg8: c_int) c_int;
pub extern "X11" fn XFillArcs(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XArc, arg4: c_int) c_int;
pub extern "X11" fn XFillPolygon(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XPoint, arg4: c_int, arg5: c_int, arg6: c_int) c_int;
pub extern "X11" fn XFillRectangle(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: c_uint, arg6: c_uint) c_int;
pub extern "X11" fn XFillRectangles(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XRectangle, arg4: c_int) c_int;
pub extern "X11" fn XFlush(arg0: ?*Display) c_int;
pub extern "X11" fn XForceScreenSaver(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XFree(arg0: ?*c_void) c_int;
pub extern "X11" fn XFreeColormap(arg0: ?*Display, arg1: Colormap) c_int;
pub extern "X11" fn XFreeColors(arg0: ?*Display, arg1: Colormap, arg2: [*c]c_ulong, arg3: c_int, arg4: c_ulong) c_int;
pub extern "X11" fn XFreeCursor(arg0: ?*Display, arg1: Cursor) c_int;
pub extern "X11" fn XFreeExtensionList(arg0: [*c]([*c]u8)) c_int;
pub extern "X11" fn XFreeFont(arg0: ?*Display, arg1: [*c]XFontStruct) c_int;
pub extern "X11" fn XFreeFontInfo(arg0: [*c]([*c]u8), arg1: [*c]XFontStruct, arg2: c_int) c_int;
pub extern "X11" fn XFreeFontNames(arg0: [*c]([*c]u8)) c_int;
pub extern "X11" fn XFreeFontPath(arg0: [*c]([*c]u8)) c_int;
pub extern "X11" fn XFreeGC(arg0: ?*Display, arg1: GC) c_int;
pub extern "X11" fn XFreeModifiermap(arg0: [*c]XModifierKeymap) c_int;
pub extern "X11" fn XFreePixmap(arg0: ?*Display, arg1: Pixmap) c_int;
pub extern "X11" fn XGeometry(arg0: ?*Display, arg1: c_int, arg2: [*c]const u8, arg3: [*c]const u8, arg4: c_uint, arg5: c_uint, arg6: c_uint, arg7: c_int, arg8: c_int, arg9: [*c]c_int, arg10: [*c]c_int, arg11: [*c]c_int, arg12: [*c]c_int) c_int;
pub extern "X11" fn XGetErrorDatabaseText(arg0: ?*Display, arg1: [*c]const u8, arg2: [*c]const u8, arg3: [*c]const u8, arg4: [*c]u8, arg5: c_int) c_int;
pub extern "X11" fn XGetErrorText(arg0: ?*Display, arg1: c_int, arg2: [*c]u8, arg3: c_int) c_int;
pub extern "X11" fn XGetFontProperty(arg0: [*c]XFontStruct, arg1: Atom, arg2: [*c]c_ulong) c_int;
pub extern "X11" fn XGetGCValues(arg0: ?*Display, arg1: GC, arg2: c_ulong, arg3: [*c]XGCValues) c_int;
pub extern "X11" fn XGetGeometry(arg0: ?*Display, arg1: Drawable, arg2: [*c]Window, arg3: [*c]c_int, arg4: [*c]c_int, arg5: [*c]c_uint, arg6: [*c]c_uint, arg7: [*c]c_uint, arg8: [*c]c_uint) c_int;
pub extern "X11" fn XGetIconName(arg0: ?*Display, arg1: Window, arg2: [*c]([*c]u8)) c_int;
pub extern "X11" fn XGetInputFocus(arg0: ?*Display, arg1: [*c]Window, arg2: [*c]c_int) c_int;
pub extern "X11" fn XGetKeyboardControl(arg0: ?*Display, arg1: [*c]XKeyboardState) c_int;
pub extern "X11" fn XGetPointerControl(arg0: ?*Display, arg1: [*c]c_int, arg2: [*c]c_int, arg3: [*c]c_int) c_int;
pub extern "X11" fn XGetPointerMapping(arg0: ?*Display, arg1: [*c]u8, arg2: c_int) c_int;
pub extern "X11" fn XGetScreenSaver(arg0: ?*Display, arg1: [*c]c_int, arg2: [*c]c_int, arg3: [*c]c_int, arg4: [*c]c_int) c_int;
pub extern "X11" fn XGetTransientForHint(arg0: ?*Display, arg1: Window, arg2: [*c]Window) c_int;
pub extern "X11" fn XGetWindowProperty(arg0: ?*Display, arg1: Window, arg2: Atom, arg3: c_long, arg4: c_long, arg5: c_int, arg6: Atom, arg7: [*c]Atom, arg8: [*c]c_int, arg9: [*c]c_ulong, arg10: [*c]c_ulong, arg11: [*c]([*c]u8)) c_int;
pub extern "X11" fn XGetWindowAttributes(arg0: ?*Display, arg1: Window, arg2: [*c]XWindowAttributes) c_int;
pub extern "X11" fn XGrabButton(arg0: ?*Display, arg1: c_uint, arg2: c_uint, arg3: Window, arg4: c_int, arg5: c_uint, arg6: c_int, arg7: c_int, arg8: Window, arg9: Cursor) c_int;
pub extern "X11" fn XGrabKey(arg0: ?*Display, arg1: c_int, arg2: c_uint, arg3: Window, arg4: c_int, arg5: c_int, arg6: c_int) c_int;
pub extern "X11" fn XGrabKeyboard(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_int, arg4: c_int, arg5: Time) c_int;
pub extern "X11" fn XGrabPointer(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_uint, arg4: c_int, arg5: c_int, arg6: Window, arg7: Cursor, arg8: Time) c_int;
pub extern "X11" fn XGrabServer(arg0: ?*Display) c_int;
pub extern "X11" fn XHeightMMOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XHeightOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XIfEvent(arg0: ?*Display, arg1: [*c]XEvent, arg2: ?extern fn(?*Display, [*c]XEvent, XPointer) c_int, arg3: XPointer) c_int;
pub extern "X11" fn XImageByteOrder(arg0: ?*Display) c_int;
pub extern "X11" fn XInstallColormap(arg0: ?*Display, arg1: Colormap) c_int;
pub extern "X11" fn XKeysymToKeycode(arg0: ?*Display, arg1: KeySym) KeyCode;
pub extern "X11" fn XKillClient(arg0: ?*Display, arg1: XID) c_int;
pub extern "X11" fn XLookupColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]const u8, arg3: [*c]XColor, arg4: [*c]XColor) c_int;
pub extern "X11" fn XLowerWindow(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XMapRaised(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XMapSubwindows(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XMapWindow(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XMaskEvent(arg0: ?*Display, arg1: c_long, arg2: [*c]XEvent) c_int;
pub extern "X11" fn XMaxCmapsOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XMinCmapsOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XMoveResizeWindow(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_int, arg4: c_uint, arg5: c_uint) c_int;
pub extern "X11" fn XMoveWindow(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_int) c_int;
pub extern "X11" fn XNextEvent(arg0: ?*Display, arg1: [*c]XEvent) c_int;
pub extern "X11" fn XNoOp(arg0: ?*Display) c_int;
pub extern "X11" fn XParseColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]const u8, arg3: [*c]XColor) c_int;
pub extern "X11" fn XParseGeometry(arg0: [*c]const u8, arg1: [*c]c_int, arg2: [*c]c_int, arg3: [*c]c_uint, arg4: [*c]c_uint) c_int;
pub extern "X11" fn XPeekEvent(arg0: ?*Display, arg1: [*c]XEvent) c_int;
pub extern "X11" fn XPeekIfEvent(arg0: ?*Display, arg1: [*c]XEvent, arg2: ?extern fn(?*Display, [*c]XEvent, XPointer) c_int, arg3: XPointer) c_int;
pub extern "X11" fn XPending(arg0: ?*Display) c_int;
pub extern "X11" fn XPlanesOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XProtocolRevision(arg0: ?*Display) c_int;
pub extern "X11" fn XProtocolVersion(arg0: ?*Display) c_int;
pub extern "X11" fn XPutBackEvent(arg0: ?*Display, arg1: [*c]XEvent) c_int;
pub extern "X11" fn XPutImage(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: [*c]XImage, arg4: c_int, arg5: c_int, arg6: c_int, arg7: c_int, arg8: c_uint, arg9: c_uint) c_int;
pub extern "X11" fn XQLength(arg0: ?*Display) c_int;
pub extern "X11" fn XQueryBestCursor(arg0: ?*Display, arg1: Drawable, arg2: c_uint, arg3: c_uint, arg4: [*c]c_uint, arg5: [*c]c_uint) c_int;
pub extern "X11" fn XQueryBestSize(arg0: ?*Display, arg1: c_int, arg2: Drawable, arg3: c_uint, arg4: c_uint, arg5: [*c]c_uint, arg6: [*c]c_uint) c_int;
pub extern "X11" fn XQueryBestStipple(arg0: ?*Display, arg1: Drawable, arg2: c_uint, arg3: c_uint, arg4: [*c]c_uint, arg5: [*c]c_uint) c_int;
pub extern "X11" fn XQueryBestTile(arg0: ?*Display, arg1: Drawable, arg2: c_uint, arg3: c_uint, arg4: [*c]c_uint, arg5: [*c]c_uint) c_int;
pub extern "X11" fn XQueryColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]XColor) c_int;
pub extern "X11" fn XQueryColors(arg0: ?*Display, arg1: Colormap, arg2: [*c]XColor, arg3: c_int) c_int;
pub extern "X11" fn XQueryExtension(arg0: ?*Display, arg1: [*c]const u8, arg2: [*c]c_int, arg3: [*c]c_int, arg4: [*c]c_int) c_int;
pub extern "X11" fn XQueryKeymap(arg0: ?*Display, arg1: [*c]u8) c_int;
pub extern "X11" fn XQueryPointer(arg0: ?*Display, arg1: Window, arg2: [*c]Window, arg3: [*c]Window, arg4: [*c]c_int, arg5: [*c]c_int, arg6: [*c]c_int, arg7: [*c]c_int, arg8: [*c]c_uint) c_int;
pub extern "X11" fn XQueryTextExtents(arg0: ?*Display, arg1: XID, arg2: [*c]const u8, arg3: c_int, arg4: [*c]c_int, arg5: [*c]c_int, arg6: [*c]c_int, arg7: [*c]XCharStruct) c_int;
pub extern "X11" fn XQueryTextExtents16(arg0: ?*Display, arg1: XID, arg2: [*c]const XChar2b, arg3: c_int, arg4: [*c]c_int, arg5: [*c]c_int, arg6: [*c]c_int, arg7: [*c]XCharStruct) c_int;
pub extern "X11" fn XQueryTree(arg0: ?*Display, arg1: Window, arg2: [*c]Window, arg3: [*c]Window, arg4: [*c]([*c]Window), arg5: [*c]c_uint) c_int;
pub extern "X11" fn XRaiseWindow(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XReadBitmapFile(arg0: ?*Display, arg1: Drawable, arg2: [*c]const u8, arg3: [*c]c_uint, arg4: [*c]c_uint, arg5: [*c]Pixmap, arg6: [*c]c_int, arg7: [*c]c_int) c_int;
pub extern "X11" fn XReadBitmapFileData(arg0: [*c]const u8, arg1: [*c]c_uint, arg2: [*c]c_uint, arg3: [*c]([*c]u8), arg4: [*c]c_int, arg5: [*c]c_int) c_int;
pub extern "X11" fn XRebindKeysym(arg0: ?*Display, arg1: KeySym, arg2: [*c]KeySym, arg3: c_int, arg4: [*c]const u8, arg5: c_int) c_int;
pub extern "X11" fn XRecolorCursor(arg0: ?*Display, arg1: Cursor, arg2: [*c]XColor, arg3: [*c]XColor) c_int;
pub extern "X11" fn XRefreshKeyboardMapping(arg0: [*c]XMappingEvent) c_int;
pub extern "X11" fn XRemoveFromSaveSet(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XRemoveHost(arg0: ?*Display, arg1: [*c]XHostAddress) c_int;
pub extern "X11" fn XRemoveHosts(arg0: ?*Display, arg1: [*c]XHostAddress, arg2: c_int) c_int;
pub extern "X11" fn XReparentWindow(arg0: ?*Display, arg1: Window, arg2: Window, arg3: c_int, arg4: c_int) c_int;
pub extern "X11" fn XResetScreenSaver(arg0: ?*Display) c_int;
pub extern "X11" fn XResizeWindow(arg0: ?*Display, arg1: Window, arg2: c_uint, arg3: c_uint) c_int;
pub extern "X11" fn XRestackWindows(arg0: ?*Display, arg1: [*c]Window, arg2: c_int) c_int;
pub extern "X11" fn XRotateBuffers(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XRotateWindowProperties(arg0: ?*Display, arg1: Window, arg2: [*c]Atom, arg3: c_int, arg4: c_int) c_int;
pub extern "X11" fn XScreenCount(arg0: ?*Display) c_int;
pub extern "X11" fn XSelectInput(arg0: ?*Display, arg1: Window, arg2: c_long) c_int;
pub extern "X11" fn XSendEvent(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: c_long, arg4: [*c]XEvent) c_int;
pub extern "X11" fn XSetAccessControl(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XSetArcMode(arg0: ?*Display, arg1: GC, arg2: c_int) c_int;
pub extern "X11" fn XSetBackground(arg0: ?*Display, arg1: GC, arg2: c_ulong) c_int;
pub extern "X11" fn XSetClipMask(arg0: ?*Display, arg1: GC, arg2: Pixmap) c_int;
pub extern "X11" fn XSetClipOrigin(arg0: ?*Display, arg1: GC, arg2: c_int, arg3: c_int) c_int;
pub extern "X11" fn XSetClipRectangles(arg0: ?*Display, arg1: GC, arg2: c_int, arg3: c_int, arg4: [*c]XRectangle, arg5: c_int, arg6: c_int) c_int;
pub extern "X11" fn XSetCloseDownMode(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XSetCommand(arg0: ?*Display, arg1: Window, arg2: [*c]([*c]u8), arg3: c_int) c_int;
pub extern "X11" fn XSetDashes(arg0: ?*Display, arg1: GC, arg2: c_int, arg3: [*c]const u8, arg4: c_int) c_int;
pub extern "X11" fn XSetFillRule(arg0: ?*Display, arg1: GC, arg2: c_int) c_int;
pub extern "X11" fn XSetFillStyle(arg0: ?*Display, arg1: GC, arg2: c_int) c_int;
pub extern "X11" fn XSetFont(arg0: ?*Display, arg1: GC, arg2: Font) c_int;
pub extern "X11" fn XSetFontPath(arg0: ?*Display, arg1: [*c]([*c]u8), arg2: c_int) c_int;
pub extern "X11" fn XSetForeground(arg0: ?*Display, arg1: GC, arg2: c_ulong) c_int;
pub extern "X11" fn XSetFunction(arg0: ?*Display, arg1: GC, arg2: c_int) c_int;
pub extern "X11" fn XSetGraphicsExposures(arg0: ?*Display, arg1: GC, arg2: c_int) c_int;
pub extern "X11" fn XSetIconName(arg0: ?*Display, arg1: Window, arg2: [*c]const u8) c_int;
pub extern "X11" fn XSetInputFocus(arg0: ?*Display, arg1: Window, arg2: c_int, arg3: Time) c_int;
pub extern "X11" fn XSetLineAttributes(arg0: ?*Display, arg1: GC, arg2: c_uint, arg3: c_int, arg4: c_int, arg5: c_int) c_int;
pub extern "X11" fn XSetModifierMapping(arg0: ?*Display, arg1: [*c]XModifierKeymap) c_int;
pub extern "X11" fn XSetPlaneMask(arg0: ?*Display, arg1: GC, arg2: c_ulong) c_int;
pub extern "X11" fn XSetPointerMapping(arg0: ?*Display, arg1: [*c]const u8, arg2: c_int) c_int;
pub extern "X11" fn XSetScreenSaver(arg0: ?*Display, arg1: c_int, arg2: c_int, arg3: c_int, arg4: c_int) c_int;
pub extern "X11" fn XSetSelectionOwner(arg0: ?*Display, arg1: Atom, arg2: Window, arg3: Time) c_int;
pub extern "X11" fn XSetState(arg0: ?*Display, arg1: GC, arg2: c_ulong, arg3: c_ulong, arg4: c_int, arg5: c_ulong) c_int;
pub extern "X11" fn XSetStipple(arg0: ?*Display, arg1: GC, arg2: Pixmap) c_int;
pub extern "X11" fn XSetSubwindowMode(arg0: ?*Display, arg1: GC, arg2: c_int) c_int;
pub extern "X11" fn XSetTSOrigin(arg0: ?*Display, arg1: GC, arg2: c_int, arg3: c_int) c_int;
pub extern "X11" fn XSetTile(arg0: ?*Display, arg1: GC, arg2: Pixmap) c_int;
pub extern "X11" fn XSetWindowBackground(arg0: ?*Display, arg1: Window, arg2: c_ulong) c_int;
pub extern "X11" fn XSetWindowBackgroundPixmap(arg0: ?*Display, arg1: Window, arg2: Pixmap) c_int;
pub extern "X11" fn XSetWindowBorder(arg0: ?*Display, arg1: Window, arg2: c_ulong) c_int;
pub extern "X11" fn XSetWindowBorderPixmap(arg0: ?*Display, arg1: Window, arg2: Pixmap) c_int;
pub extern "X11" fn XSetWindowBorderWidth(arg0: ?*Display, arg1: Window, arg2: c_uint) c_int;
pub extern "X11" fn XSetWindowColormap(arg0: ?*Display, arg1: Window, arg2: Colormap) c_int;
pub extern "X11" fn XStoreBuffer(arg0: ?*Display, arg1: [*c]const u8, arg2: c_int, arg3: c_int) c_int;
pub extern "X11" fn XStoreBytes(arg0: ?*Display, arg1: [*c]const u8, arg2: c_int) c_int;
pub extern "X11" fn XStoreColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]XColor) c_int;
pub extern "X11" fn XStoreColors(arg0: ?*Display, arg1: Colormap, arg2: [*c]XColor, arg3: c_int) c_int;
pub extern "X11" fn XStoreName(arg0: ?*Display, arg1: Window, arg2: [*c]const u8) c_int;
pub extern "X11" fn XStoreNamedColor(arg0: ?*Display, arg1: Colormap, arg2: [*c]const u8, arg3: c_ulong, arg4: c_int) c_int;
pub extern "X11" fn XSync(arg0: ?*Display, arg1: c_int) c_int;
pub extern "X11" fn XTextExtents(arg0: [*c]XFontStruct, arg1: [*c]const u8, arg2: c_int, arg3: [*c]c_int, arg4: [*c]c_int, arg5: [*c]c_int, arg6: [*c]XCharStruct) c_int;
pub extern "X11" fn XTextExtents16(arg0: [*c]XFontStruct, arg1: [*c]const XChar2b, arg2: c_int, arg3: [*c]c_int, arg4: [*c]c_int, arg5: [*c]c_int, arg6: [*c]XCharStruct) c_int;
pub extern "X11" fn XTextWidth(arg0: [*c]XFontStruct, arg1: [*c]const u8, arg2: c_int) c_int;
pub extern "X11" fn XTextWidth16(arg0: [*c]XFontStruct, arg1: [*c]const XChar2b, arg2: c_int) c_int;
pub extern "X11" fn XTranslateCoordinates(arg0: ?*Display, arg1: Window, arg2: Window, arg3: c_int, arg4: c_int, arg5: [*c]c_int, arg6: [*c]c_int, arg7: [*c]Window) c_int;
pub extern "X11" fn XUndefineCursor(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XUngrabButton(arg0: ?*Display, arg1: c_uint, arg2: c_uint, arg3: Window) c_int;
pub extern "X11" fn XUngrabKey(arg0: ?*Display, arg1: c_int, arg2: c_uint, arg3: Window) c_int;
pub extern "X11" fn XUngrabKeyboard(arg0: ?*Display, arg1: Time) c_int;
pub extern "X11" fn XUngrabPointer(arg0: ?*Display, arg1: Time) c_int;
pub extern "X11" fn XUngrabServer(arg0: ?*Display) c_int;
pub extern "X11" fn XUninstallColormap(arg0: ?*Display, arg1: Colormap) c_int;
pub extern "X11" fn XUnloadFont(arg0: ?*Display, arg1: Font) c_int;
pub extern "X11" fn XUnmapSubwindows(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XUnmapWindow(arg0: ?*Display, arg1: Window) c_int;
pub extern "X11" fn XVendorRelease(arg0: ?*Display) c_int;
pub extern "X11" fn XWarpPointer(arg0: ?*Display, arg1: Window, arg2: Window, arg3: c_int, arg4: c_int, arg5: c_uint, arg6: c_uint, arg7: c_int, arg8: c_int) c_int;
pub extern "X11" fn XWidthMMOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XWidthOfScreen(arg0: [*c]Screen) c_int;
pub extern "X11" fn XWindowEvent(arg0: ?*Display, arg1: Window, arg2: c_long, arg3: [*c]XEvent) c_int;
pub extern "X11" fn XWriteBitmapFile(arg0: ?*Display, arg1: [*c]const u8, arg2: Pixmap, arg3: c_uint, arg4: c_uint, arg5: c_int, arg6: c_int) c_int;
pub extern "X11" fn XSupportsLocale() c_int;
pub extern "X11" fn XSetLocaleModifiers(arg0: [*c]const u8) [*c]u8;
pub extern "X11" fn XOpenOM(arg0: ?*Display, arg1: ?*struct__XrmHashBucketRec, arg2: [*c]const u8, arg3: [*c]const u8) XOM;
pub extern "X11" fn XCloseOM(arg0: XOM) c_int;
pub extern "X11" fn XSetOMValues(arg0: XOM, ...) [*c]u8;
pub extern "X11" fn XGetOMValues(arg0: XOM, ...) [*c]u8;
pub extern "X11" fn XDisplayOfOM(arg0: XOM) ?*Display;
pub extern "X11" fn XLocaleOfOM(arg0: XOM) [*c]u8;
pub extern "X11" fn XCreateOC(arg0: XOM, ...) XOC;
pub extern "X11" fn XDestroyOC(arg0: XOC) void;
pub extern "X11" fn XOMOfOC(arg0: XOC) XOM;
pub extern "X11" fn XSetOCValues(arg0: XOC, ...) [*c]u8;
pub extern "X11" fn XGetOCValues(arg0: XOC, ...) [*c]u8;
pub extern "X11" fn XCreateFontSet(arg0: ?*Display, arg1: [*c]const u8, arg2: [*c]([*c]([*c]u8)), arg3: [*c]c_int, arg4: [*c]([*c]u8)) XFontSet;
pub extern "X11" fn XFreeFontSet(arg0: ?*Display, arg1: XFontSet) void;
pub extern "X11" fn XFontsOfFontSet(arg0: XFontSet, arg1: [*c]([*c]([*c]XFontStruct)), arg2: [*c]([*c]([*c]u8))) c_int;
pub extern "X11" fn XBaseFontNameListOfFontSet(arg0: XFontSet) [*c]u8;
pub extern "X11" fn XLocaleOfFontSet(arg0: XFontSet) [*c]u8;
pub extern "X11" fn XContextDependentDrawing(arg0: XFontSet) c_int;
pub extern "X11" fn XDirectionalDependentDrawing(arg0: XFontSet) c_int;
pub extern "X11" fn XContextualDrawing(arg0: XFontSet) c_int;
pub extern "X11" fn XExtentsOfFontSet(arg0: XFontSet) [*c]XFontSetExtents;
pub extern "X11" fn XmbTextEscapement(arg0: XFontSet, arg1: [*c]const u8, arg2: c_int) c_int;
pub extern "X11" fn XwcTextEscapement(arg0: XFontSet, arg1: [*c]const wchar_t, arg2: c_int) c_int;
pub extern "X11" fn Xutf8TextEscapement(arg0: XFontSet, arg1: [*c]const u8, arg2: c_int) c_int;
pub extern "X11" fn XmbTextExtents(arg0: XFontSet, arg1: [*c]const u8, arg2: c_int, arg3: [*c]XRectangle, arg4: [*c]XRectangle) c_int;
pub extern "X11" fn XwcTextExtents(arg0: XFontSet, arg1: [*c]const wchar_t, arg2: c_int, arg3: [*c]XRectangle, arg4: [*c]XRectangle) c_int;
pub extern "X11" fn Xutf8TextExtents(arg0: XFontSet, arg1: [*c]const u8, arg2: c_int, arg3: [*c]XRectangle, arg4: [*c]XRectangle) c_int;
pub extern "X11" fn XmbTextPerCharExtents(arg0: XFontSet, arg1: [*c]const u8, arg2: c_int, arg3: [*c]XRectangle, arg4: [*c]XRectangle, arg5: c_int, arg6: [*c]c_int, arg7: [*c]XRectangle, arg8: [*c]XRectangle) c_int;
pub extern "X11" fn XwcTextPerCharExtents(arg0: XFontSet, arg1: [*c]const wchar_t, arg2: c_int, arg3: [*c]XRectangle, arg4: [*c]XRectangle, arg5: c_int, arg6: [*c]c_int, arg7: [*c]XRectangle, arg8: [*c]XRectangle) c_int;
pub extern "X11" fn Xutf8TextPerCharExtents(arg0: XFontSet, arg1: [*c]const u8, arg2: c_int, arg3: [*c]XRectangle, arg4: [*c]XRectangle, arg5: c_int, arg6: [*c]c_int, arg7: [*c]XRectangle, arg8: [*c]XRectangle) c_int;
pub extern "X11" fn XmbDrawText(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]XmbTextItem, arg6: c_int) void;
pub extern "X11" fn XwcDrawText(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]XwcTextItem, arg6: c_int) void;
pub extern "X11" fn Xutf8DrawText(arg0: ?*Display, arg1: Drawable, arg2: GC, arg3: c_int, arg4: c_int, arg5: [*c]XmbTextItem, arg6: c_int) void;
pub extern "X11" fn XmbDrawString(arg0: ?*Display, arg1: Drawable, arg2: XFontSet, arg3: GC, arg4: c_int, arg5: c_int, arg6: [*c]const u8, arg7: c_int) void;
pub extern "X11" fn XwcDrawString(arg0: ?*Display, arg1: Drawable, arg2: XFontSet, arg3: GC, arg4: c_int, arg5: c_int, arg6: [*c]const wchar_t, arg7: c_int) void;
pub extern "X11" fn Xutf8DrawString(arg0: ?*Display, arg1: Drawable, arg2: XFontSet, arg3: GC, arg4: c_int, arg5: c_int, arg6: [*c]const u8, arg7: c_int) void;
pub extern "X11" fn XmbDrawImageString(arg0: ?*Display, arg1: Drawable, arg2: XFontSet, arg3: GC, arg4: c_int, arg5: c_int, arg6: [*c]const u8, arg7: c_int) void;
pub extern "X11" fn XwcDrawImageString(arg0: ?*Display, arg1: Drawable, arg2: XFontSet, arg3: GC, arg4: c_int, arg5: c_int, arg6: [*c]const wchar_t, arg7: c_int) void;
pub extern "X11" fn Xutf8DrawImageString(arg0: ?*Display, arg1: Drawable, arg2: XFontSet, arg3: GC, arg4: c_int, arg5: c_int, arg6: [*c]const u8, arg7: c_int) void;
pub extern "X11" fn XOpenIM(arg0: ?*Display, arg1: ?*struct__XrmHashBucketRec, arg2: [*c]u8, arg3: [*c]u8) XIM;
pub extern "X11" fn XCloseIM(arg0: XIM) c_int;
pub extern "X11" fn XGetIMValues(arg0: XIM, ...) [*c]u8;
pub extern "X11" fn XSetIMValues(arg0: XIM, ...) [*c]u8;
pub extern "X11" fn XDisplayOfIM(arg0: XIM) ?*Display;
pub extern "X11" fn XLocaleOfIM(arg0: XIM) [*c]u8;
pub extern "X11" fn XCreateIC(arg0: XIM, ...) XIC;
pub extern "X11" fn XDestroyIC(arg0: XIC) void;
pub extern "X11" fn XSetICFocus(arg0: XIC) void;
pub extern "X11" fn XUnsetICFocus(arg0: XIC) void;
pub extern "X11" fn XwcResetIC(arg0: XIC) [*c]wchar_t;
pub extern "X11" fn XmbResetIC(arg0: XIC) [*c]u8;
pub extern "X11" fn Xutf8ResetIC(arg0: XIC) [*c]u8;
pub extern "X11" fn XSetICValues(arg0: XIC, ...) [*c]u8;
pub extern "X11" fn XGetICValues(arg0: XIC, ...) [*c]u8;
pub extern "X11" fn XIMOfIC(arg0: XIC) XIM;
pub extern "X11" fn XFilterEvent(arg0: [*c]XEvent, arg1: Window) c_int;
pub extern "X11" fn XmbLookupString(arg0: XIC, arg1: [*c]XKeyPressedEvent, arg2: [*c]u8, arg3: c_int, arg4: [*c]KeySym, arg5: [*c]c_int) c_int;
pub extern "X11" fn XwcLookupString(arg0: XIC, arg1: [*c]XKeyPressedEvent, arg2: [*c]wchar_t, arg3: c_int, arg4: [*c]KeySym, arg5: [*c]c_int) c_int;
pub extern "X11" fn Xutf8LookupString(arg0: XIC, arg1: [*c]XKeyPressedEvent, arg2: [*c]u8, arg3: c_int, arg4: [*c]KeySym, arg5: [*c]c_int) c_int;
pub extern "X11" fn XVaCreateNestedList(arg0: c_int, ...) XVaNestedList;
pub extern "X11" fn XRegisterIMInstantiateCallback(arg0: ?*Display, arg1: ?*struct__XrmHashBucketRec, arg2: [*c]u8, arg3: [*c]u8, arg4: XIDProc, arg5: XPointer) c_int;
pub extern "X11" fn XUnregisterIMInstantiateCallback(arg0: ?*Display, arg1: ?*struct__XrmHashBucketRec, arg2: [*c]u8, arg3: [*c]u8, arg4: XIDProc, arg5: XPointer) c_int;
pub const XConnectionWatchProc = ?extern fn(?*Display, XPointer, c_int, c_int, [*c]XPointer) void;
pub extern "X11" fn XInternalConnectionNumbers(arg0: ?*Display, arg1: [*c]([*c]c_int), arg2: [*c]c_int) c_int;
pub extern "X11" fn XProcessInternalConnection(arg0: ?*Display, arg1: c_int) void;
pub extern "X11" fn XAddConnectionWatch(arg0: ?*Display, arg1: XConnectionWatchProc, arg2: XPointer) c_int;
pub extern "X11" fn XRemoveConnectionWatch(arg0: ?*Display, arg1: XConnectionWatchProc, arg2: XPointer) void;
pub extern "X11" fn XSetAuthorization(arg0: [*c]u8, arg1: c_int, arg2: [*c]u8, arg3: c_int) void;
pub extern "X11" fn _Xmbtowc(arg0: [*c]wchar_t, arg1: [*c]u8, arg2: c_int) c_int;
pub extern "X11" fn _Xwctomb(arg0: [*c]u8, arg1: wchar_t) c_int;
pub extern "X11" fn XGetEventData(arg0: ?*Display, arg1: [*c]XGenericEventCookie) c_int;
pub extern "X11" fn XFreeEventData(arg0: ?*Display, arg1: [*c]XGenericEventCookie) void;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __INT64_FMTd__ = c"ld";
pub const __STDC_VERSION__ = c_long(201112);
pub const FillOpaqueStippled = 3;
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const XNFilterEvents = c"filterEvents";
pub const __LZCNT__ = 1;
pub const __INVPCID__ = 1;
pub const XNCursor = c"cursor";
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __clang_version__ = c"8.0.0 (tags/RELEASE_800/final)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const __INTMAX_FMTd__ = c"ld";
pub const LeaveNotify = 8;
pub const NeedNestedPrototypes = 1;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const Button5 = 5;
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const __MMX__ = 1;
pub const GenericEvent = 35;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const _THREAD_SHARED_TYPES_H = 1;
pub const __RDSEED__ = 1;
pub const FamilyDECnet = 1;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const BadLength = 16;
pub const NotifyHint = 1;
pub const XIMReverse = c_long(1);
pub const BadValue = 2;
pub const NeedWidePrototypes = 0;
pub const XNResourceClass = c"resourceClass";
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const Mod3MapIndex = 5;
pub const __ptr_t = [*c]void;
pub const __WCHAR_WIDTH__ = 32;
pub const __FSGSBASE__ = 1;
pub const __USE_MISC = 1;
pub const __SIZEOF_PTHREAD_ATTR_T = 56;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const Complex = 0;
pub const MapNotify = 19;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __SSE_MATH__ = 1;
pub const ColormapInstalled = 1;
pub const __UINT_FAST8_FMTo__ = c"hho";
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const __INT8_MAX__ = 127;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const AsyncKeyboard = 3;
pub const XIMStatusCallbacks = c_long(512);
pub const __DBL_DECIMAL_DIG__ = 17;
pub const ConfigureRequest = 23;
pub const __PTHREAD_MUTEX_HAVE_PREV = 1;
pub const __SSSE3__ = 1;
pub const AllocNone = 0;
pub const XIMStringConversionChar = 4;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const _SYS_CDEFS_H = 1;
pub const _ATFILE_SOURCE = 1;
pub const AnyKey = c_long(0);
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __USE_POSIX199309 = 1;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const XLookupChars = 2;
pub const MappingModifier = 0;
pub const XIMInitialState = c_long(1);
pub const __pic__ = 2;
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INT_FAST16_FMTi__ = c"hi";
pub const BadName = 15;
pub const VisibilityNotify = 15;
pub const __LDBL_DENORM_MIN__ = 0.000000;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub const __INT64_C_SUFFIX__ = L;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const Above = 0;
pub const XIMStatusNone = c_long(2048);
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const FillStippled = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __USE_ATFILE = 1;
pub const DestroyAll = 0;
pub const PointerWindow = c_long(0);
pub const ReplayKeyboard = 5;
pub const WindingRule = 1;
pub const XLookupNone = 1;
pub const GXequiv = 9;
pub const BadImplementation = 17;
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const GrabModeAsync = 1;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __DBL_DIG__ = 15;
pub const __ATOMIC_ACQUIRE = 2;
pub const XNFocusWindow = c"focusWindow";
pub const __FLT16_HAS_DENORM__ = 1;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub const FontChange = 255;
pub const NorthWestGravity = 1;
pub const XYBitmap = 0;
pub const __UINT8_FMTo__ = c"hho";
pub const X_HAVE_UTF8_STRING = 1;
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const GXandInverted = 4;
pub const __VERSION__ = c"4.2.1 Compatible Clang 8.0.0 (tags/RELEASE_800/final)";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const StippleShape = 2;
pub const DisableScreenInterval = 0;
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const YXSorted = 2;
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const __clockid_t_defined = 1;
pub const __UINT_LEAST8_MAX__ = 255;
pub const NotifyPointer = 5;
pub const GXnoop = 5;
pub const __RDRND__ = 1;
pub const __MOVBE__ = 1;
pub const PropertyDelete = 1;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const __UINT16_MAX__ = 65535;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __x86_64 = 1;
pub const __PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;
pub const __SIZEOF_WINT_T__ = 4;
pub const CopyFromParent = c_long(0);
pub const __UINTMAX_FMTo__ = c"lo";
pub const InputOutput = 1;
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub const __WINT_UNSIGNED__ = 1;
pub const XNClientWindow = c"clientWindow";
pub const ScreenSaverReset = 0;
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;
pub const __POINTER_WIDTH__ = 64;
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub const __tune_corei7__ = 1;
pub const __FLT16_DIG__ = 3;
pub const __SIZEOF_LONG__ = 8;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const PlaceOnBottom = 1;
pub const ButtonPress = 4;
pub const YSorted = 1;
pub const ParentRelative = c_long(1);
pub const InputOnly = 2;
pub const CoordModePrevious = 1;
pub const __NO_INLINE__ = 1;
pub const XNGeometryCallback = c"geometryCallback";
pub const __INT_FAST32_MAX__ = 2147483647;
pub const _BITS_PTHREADTYPES_COMMON_H = 1;
pub const MotionNotify = 6;
pub const __UINTMAX_FMTu__ = c"lu";
pub const ScreenSaverActive = 1;
pub const EnableAccess = 1;
pub const __FLT_RADIX__ = 2;
pub const __GLIBC_MINOR__ = 29;
pub const XNPreeditStartCallback = c"preeditStartCallback";
pub const LSBFirst = 0;
pub const _BITS_BYTESWAP_H = 1;
pub const IsUnviewable = 1;
pub const _STRUCT_TIMESPEC = 1;
pub const PropertyNewValue = 0;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __FLT16_DECIMAL_DIG__ = 5;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const FontRightToLeft = 1;
pub const __UINTMAX_WIDTH__ = 64;
pub const XYPixmap = 1;
pub const __PTHREAD_MUTEX_USE_UNION = 0;
pub const __INT64_FMTi__ = c"li";
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const XNForeground = c"foreground";
pub const __INT_FAST16_TYPE__ = short;
pub const FUNCPROTO = 15;
pub const NotifyPointerRoot = 6;
pub const XNQueryOrientation = c"queryOrientation";
pub const NotifyGrab = 1;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __LDBL_MIN__ = 0.000000;
pub const ZPixmap = 2;
pub const SelectionClear = 29;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const GXcopyInverted = 12;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __PIC__ = 2;
pub const Button4 = 4;
pub const XIMPreeditArea = c_long(1);
pub const _DEFAULT_SOURCE = 1;
pub const KeyRelease = 3;
pub const __FD_SETSIZE = 1024;
pub const FamilyChaos = 2;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const __clang_minor__ = 0;
pub const DisableScreenSaver = 0;
pub const CapButt = 1;
pub const __SIZEOF_FLOAT128__ = 16;
pub const AllowExposures = 1;
pub const DisableAccess = 0;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const __DBL_MAX__ = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878;
pub const Button1 = 1;
pub const GXclear = 0;
pub const __UINT64_FMTx__ = c"lx";
pub const XNHotKey = c"hotKey";
pub const RaiseLowest = 0;
pub const AllocAll = 1;
pub const __SLONG32_TYPE = int;
pub const _DEBUG = 1;
pub const X_PROTOCOL = 11;
pub const GXnand = 14;
pub const PointerRoot = c_long(1);
pub const __restrict_arr = __restrict;
pub const GrabNotViewable = 3;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const __UINT8_FMTX__ = c"hhX";
pub const SetModeInsert = 0;
pub const __UINTPTR_WIDTH__ = 64;
pub const CirculateNotify = 26;
pub const Status = int;
pub const __time_t_defined = 1;
pub const AnyPropertyType = c_long(0);
pub const ReparentNotify = 21;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const DontAllowExposures = 0;
pub const __AES__ = 1;
pub const __UINT8_FMTx__ = c"hhx";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __time64_t = __time_t;
pub const __INT16_FMTd__ = c"hd";
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const XIMStatusNothing = c_long(1024);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const MappingKeyboard = 1;
pub const XNAreaNeeded = c"areaNeeded";
pub const XIMStringConversionBuffer = 1;
pub const __INTMAX_WIDTH__ = 64;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __USE_POSIX = 1;
pub const __SIZE_FMTo__ = c"lo";
pub const __PDP_ENDIAN = 3412;
pub const SouthWestGravity = 7;
pub const __INT_FAST8_FMTi__ = c"hhi";
pub const __UINT_LEAST32_FMTo__ = c"o";
pub const AutoRepeatModeOff = 0;
pub const XNStatusDrawCallback = c"statusDrawCallback";
pub const Opposite = 4;
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __FLT_MIN_EXP__ = -125;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const MappingPointer = 2;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GXX_ABI_VERSION = 1002;
pub const __FLT_MANT_DIG__ = 24;
pub const NotifyNonlinearVirtual = 4;
pub const __UINT_FAST64_FMTx__ = c"lx";
pub const __STDC__ = 1;
pub const XIMStringConversionSubstitution = 1;
pub const XNFontSet = c"fontSet";
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const __SIZE_WIDTH__ = 64;
pub const __INT_LEAST64_FMTi__ = c"li";
pub const __SSE4_2__ = 1;
pub const X_PROTOCOL_REVISION = 0;
pub const __AVX__ = 1;
pub const __INT_FAST16_MAX__ = 32767;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const ResizeRequest = 25;
pub const __have_pthread_attr_t = 1;
pub const FamilyServerInterpreted = 5;
pub const __INT_MAX__ = 2147483647;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __DBL_DENORM_MIN__ = 0.000000;
pub const __clang_major__ = 8;
pub const __FLT16_MANT_DIG__ = 11;
pub const MapRequest = 20;
pub const CreateNotify = 16;
pub const XNBaseFontName = c"baseFontName";
pub const SyncPointer = 1;
pub const __FLT_DENORM_MIN__ = 0.000000;
pub const __BIG_ENDIAN = 4321;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __LDBL_HAS_DENORM__ = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const XNPreeditAttributes = c"preeditAttributes";
pub const XNHotKeyState = c"hotKeyState";
pub const ShiftMapIndex = 0;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __SIZEOF_PTHREAD_MUTEX_T = 40;
pub const __UINT8_FMTu__ = c"hhu";
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const NorthGravity = 2;
pub const UnmapGravity = 0;
pub const __SSE3__ = 1;
pub const __UINT16_FMTu__ = c"hu";
pub const FocusOut = 10;
pub const Mod2MapIndex = 4;
pub const __SIZE_FMTu__ = c"lu";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const __pie__ = 2;
pub const __SSP_STRONG__ = 2;
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __clang_patchlevel__ = 0;
pub const BadIDChoice = 14;
pub const GXand = 1;
pub const ArcChord = 0;
pub const XNDefaultString = c"defaultString";
pub const KeymapNotify = 11;
pub const CirculateRequest = 27;
pub const PropModeReplace = 0;
pub const __PCLMUL__ = 1;
pub const __FXSR__ = 1;
pub const GrabInvalidTime = 2;
pub const __UINT32_FMTx__ = c"x";
pub const __UINT32_FMTu__ = c"u";
pub const __SIZEOF_PTHREAD_COND_T = 48;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const _BITS_UINTN_IDENTITY_H = 1;
pub const HostInsert = 0;
pub const GXor = 7;
pub const XNVisiblePosition = c"visiblePosition";
pub const XNOMAutomatic = c"omAutomatic";
pub const __USE_ISOC11 = 1;
pub const __x86_64__ = 1;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub const __UINTMAX_FMTx__ = c"lx";
pub const __UINT64_C_SUFFIX__ = UL;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __clock_t_defined = 1;
pub const __UINT32_FMTo__ = c"o";
pub const _SYS_SELECT_H = 1;
pub const NorthEastGravity = 3;
pub const _SYS_TYPES_H = 1;
pub const __INT_LEAST16_TYPE__ = short;
pub const __attribute_copy__ = arg;
pub const NotifyNormal = 0;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const GXinvert = 10;
pub const EnterNotify = 7;
pub const __SIZEOF_INT__ = 4;
pub const __USE_POSIX_IMPLICITLY = 1;
pub const VisibilityFullyObscured = 2;
pub const ForgetGravity = 0;
pub const __amd64 = 1;
pub const _BITS_TIME64_H = 1;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const XNLineSpace = c"lineSpace";
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __SIZEOF_INT128__ = 16;
pub const SelectionNotify = 31;
pub const AlreadyGrabbed = 1;
pub const __glibc_c99_flexarr_available = 1;
pub const __linux = 1;
pub const __sigset_t_defined = 1;
pub const XNPreeditState = c"preeditState";
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = 4;
pub const QueuedAfterReading = 1;
pub const CurrentTime = c_long(0);
pub const __clang__ = 1;
pub const DirectColor = 5;
pub const __SSE4_1__ = 1;
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const Success = 0;
pub const __UINT64_FMTo__ = c"lo";
pub const __INT_FAST32_FMTd__ = c"d";
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const __ATOMIC_ACQ_REL = 4;
pub const XNRequiredCharSet = c"requiredCharSet";
pub const IsViewable = 2;
pub const XIMStatusArea = c_long(256);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const BadFont = 7;
pub const _ENDIAN_H = 1;
pub const XNQueryICValuesList = c"queryICValuesList";
pub const XIMPreeditEnable = c_long(1);
pub const __GLIBC__ = 2;
pub const SouthGravity = 8;
pub const StaticGray = 0;
pub const __WORDSIZE = 64;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const SyncKeyboard = 4;
pub const GXorReverse = 11;
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const FillTiled = 1;
pub const __FLT_HAS_DENORM__ = 1;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const NotifyUngrab = 2;
pub const _X_INLINE = @"inline";
pub const LastExtensionError = 255;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __INT32_FMTi__ = c"i";
pub const CursorShape = 0;
pub const __DBL_HAS_INFINITY__ = 1;
pub const Unsorted = 0;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const _STDC_PREDEF_H = 1;
pub const __FLT16_MAX_EXP__ = 15;
pub const XNStdColormap = c"stdColorMap";
pub const __SIZEOF_FLOAT__ = 4;
pub const XIMStringConversionRetrieval = 2;
pub const __INT_LEAST32_FMTi__ = c"i";
pub const __LDBL_EPSILON__ = 0.000000;
pub const __INT_LEAST32_FMTd__ = c"d";
pub const __STDC_UTF_32__ = 1;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __FD_ZERO_STOS = c"stosq";
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const FamilyInternet = 0;
pub const NotifyNonlinear = 3;
pub const __SIZEOF_DOUBLE__ = 8;
pub const ColormapUninstalled = 0;
pub const XNDestroyCallback = c"destroyCallback";
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const PropModePrepend = 1;
pub const XNSpotLocation = c"spotLocation";
pub const BYTE_ORDER = __BYTE_ORDER;
pub const __SIZE_FMTX__ = c"lX";
pub const GravityNotify = 24;
pub const __ID_T_TYPE = __U32_TYPE;
pub const _BITS_TYPES_H = 1;
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const WestGravity = 4;
pub const __DBL_MIN_EXP__ = -1021;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const InputFocus = c_long(1);
pub const Bool = int;
pub const __PID_T_TYPE = __S32_TYPE;
pub const CapProjecting = 3;
pub const __DBL_HAS_DENORM__ = 1;
pub const __FLOAT128__ = 1;
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __FLT16_HAS_QUIET_NAN__ = 1;
pub const __ATOMIC_RELAXED = 0;
pub const __SIZEOF_SHORT__ = 2;
pub const __UINT_FAST16_MAX__ = 65535;
pub const __UINT16_FMTX__ = c"hX";
pub const __timeval_defined = 1;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const XlibSpecificationRelease = 6;
pub const MappingNotify = 34;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __AVX2__ = 1;
pub const __WINT_MAX__ = c_uint(4294967295);
pub const __STDC_ISO_10646__ = c_long(201706);
pub const Mod1MapIndex = 3;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const XNResetState = c"resetState";
pub const FontLeftToRight = 0;
pub const __STDC_HOSTED__ = 1;
pub const __INT_LEAST32_TYPE__ = int;
pub const __SCHAR_MAX__ = 127;
pub const AutoRepeatModeDefault = 2;
pub const __USE_POSIX2 = 1;
pub const FocusIn = 9;
pub const __FLT16_MIN_EXP__ = -14;
pub const __TIMESIZE = __WORDSIZE;
pub const XIMPreeditPosition = c_long(4);
pub const __USE_XOPEN2K = 1;
pub const LockMapIndex = 1;
pub const __PRFCHW__ = 1;
pub const __USE_FORTIFY_LEVEL = 0;
pub const __ELF__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __PTHREAD_MUTEX_LOCK_ELISION = 1;
pub const AsyncBoth = 6;
pub const XNBackground = c"background";
pub const __USE_XOPEN2K8 = 1;
pub const Convex = 2;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const LowerHighest = 1;
pub const XIMPreeditNothing = c_long(8);
pub const __UINT64_FMTX__ = c"lX";
pub const NotifyAncestor = 0;
pub const CapNotLast = 0;
pub const __DBL_MANT_DIG__ = 53;
pub const XIMHotKeyStateON = c_long(1);
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __GLIBC_USE_DEPRECATED_SCANF = 0;
pub const RetainPermanent = 1;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __USE_ISOC95 = 1;
pub const ColormapNotify = 32;
pub const BadDrawable = 9;
pub const __UID_T_TYPE = __U32_TYPE;
pub const XNStringConversionCallback = c"stringConversionCallback";
pub const Mod5MapIndex = 7;
pub const __LITTLE_ENDIAN__ = 1;
pub const __SSE__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const XNColormap = c"colorMap";
pub const JoinRound = 1;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const GXset = 15;
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub const LedModeOn = 1;
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const Always = 2;
pub const XNResourceName = c"resourceName";
pub const Button3 = 3;
pub const XIMHotKeyStateOFF = c_long(2);
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __warnattr = msg;
pub const __STD_TYPE = typedef;
pub const BadAlloc = 11;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const AllTemporary = c_long(0);
pub const __LDBL_MAX__ = inf;
pub const Mod4MapIndex = 6;
pub const _LP64 = 1;
pub const FD_SETSIZE = __FD_SETSIZE;
pub const XNVaNestedList = c"XNVaNestedList";
pub const _X_RESTRICT_KYWD = restrict;
pub const linux = 1;
pub const __code_model_small_ = 1;
pub const XNQueryInputStyle = c"queryInputStyle";
pub const __FLT_DIG__ = 6;
pub const __INT16_MAX__ = 32767;
pub const __FLT_MAX_10_EXP__ = 38;
pub const _FEATURES_H = 1;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __WINT_WIDTH__ = 32;
pub const GrabFrozen = 4;
pub const __SHRT_MAX__ = 32767;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const GCLastBit = 22;
pub const DestroyNotify = 17;
pub const PreferBlanking = 1;
pub const XIMStringConversionWrapped = 32;
pub const WhenMapped = 1;
pub const __INT32_FMTd__ = c"d";
pub const __DBL_MIN__ = 0.000000;
pub const XIMStringConversionTopEdge = 4;
pub const ArcPieSlice = 1;
pub const __S32_TYPE = int;
pub const __INTPTR_WIDTH__ = 64;
pub const __FLT16_MAX_10_EXP__ = 4;
pub const MappingSuccess = 0;
pub const __INT_FAST32_TYPE__ = int;
pub const ClipByChildren = 0;
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const _POSIX_SOURCE = 1;
pub const __LITTLE_ENDIAN = 1234;
pub const __gnu_linux__ = 1;
pub const NotUseful = 0;
pub const __corei7__ = 1;
pub const BadCursor = 6;
pub const GXandReverse = 2;
pub const __timer_t_defined = 1;
pub const __FLT16_HAS_INFINITY__ = 1;
pub const XNBackgroundPixmap = c"backgroundPixmap";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const CoordModeOrigin = 0;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const _BITS_STDINT_INTN_H = 1;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const __KEY_T_TYPE = __S32_TYPE;
pub const XIMPreeditCallbacks = c_long(2);
pub const __INT32_TYPE__ = int;
pub const GraphicsExpose = 13;
pub const __USE_POSIX199506 = 1;
pub const LineSolid = 0;
pub const XNPreeditDrawCallback = c"preeditDrawCallback";
pub const __FLT_MIN__ = 0.000000;
pub const XNStatusAttributes = c"statusAttributes";
pub const __INT8_FMTd__ = c"hhd";
pub const XNStatusStartCallback = c"statusStartCallback";
pub const __FLT_MAX_EXP__ = 128;
pub const __XSAVE__ = 1;
pub const __INT_FAST64_FMTi__ = c"li";
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const XNArea = c"area";
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const LineDoubleDash = 2;
pub const XIMStringConversionLine = 2;
pub const IsUnmapped = 0;
pub const NoExpose = 14;
pub const XNStringConversion = c"stringConversion";
pub const AllPlanes = if (@typeId(@typeOf(~c_long(0))) == @import("builtin").TypeId.Pointer) @ptrCast(if (@typeId(@typeOf(long)) == @import("builtin").TypeId.Pointer) @ptrCast(unsigned, long) else if (@typeId(@typeOf(long)) == @import("builtin").TypeId.Int) @intToPtr(unsigned, long) else unsigned(long), ~c_long(0)) else if (@typeId(@typeOf(~c_long(0))) == @import("builtin").TypeId.Int) @intToPtr(if (@typeId(@typeOf(long)) == @import("builtin").TypeId.Pointer) @ptrCast(unsigned, long) else if (@typeId(@typeOf(long)) == @import("builtin").TypeId.Int) @intToPtr(unsigned, long) else unsigned(long), ~c_long(0)) else if (@typeId(@typeOf(long)) == @import("builtin").TypeId.Pointer) @ptrCast(unsigned, long) else if (@typeId(@typeOf(long)) == @import("builtin").TypeId.Int) @intToPtr(unsigned, long) else unsigned(long)(~c_long(0));
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const SetModeDelete = 1;
pub const XNMissingCharSet = c"missingCharSet";
pub const __LDBL_REDIR_DECL = name;
pub const GrayScale = 1;
pub const SyncBoth = 7;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const StaticColor = 2;
pub const __SIZE_FMTx__ = c"lx";
pub const PlaceOnTop = 0;
pub const __DBL_EPSILON__ = 0.000000;
pub const BadWindow = 3;
pub const GXcopy = 3;
pub const XNFontInfo = c"fontInfo";
pub const HostDelete = 1;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const XNDirectionalDependentDrawing = c"directionalDependentDrawing";
pub const MappingFailed = 2;
pub const __CHAR_BIT__ = 8;
pub const GXorInverted = 13;
pub const PseudoColor = 3;
pub const __INT16_FMTi__ = c"hi";
pub const False = 0;
pub const XNQueryIMValuesList = c"queryIMValuesList";
pub const __GNUC_MINOR__ = 2;
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const True = 1;
pub const NoEventMask = c_long(0);
pub const NFDBITS = __NFDBITS;
pub const __FLT_EPSILON__ = 0.000000;
pub const _Xconst = @"const";
pub const IncludeInferiors = 1;
pub const XNInputStyle = c"inputStyle";
pub const PropModeAppend = 2;
pub const __llvm__ = 1;
pub const BottomIf = 3;
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub const NotifyVirtual = 1;
pub const PropertyNotify = 28;
pub const __INT_FAST32_FMTi__ = c"i";
pub const UnmapNotify = 18;
pub const ClientMessage = 33;
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const BadAtom = 5;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const NULL = if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Pointer) @ptrCast([*c]void, 0) else if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Int) @intToPtr([*c]void, 0) else ([*c]void)(0);
pub const EastGravity = 6;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const XNOrientation = c"orientation";
pub const __UINT32_FMTX__ = c"X";
pub const NeedVarargsPrototypes = 1;
pub const XIMStringConversionWord = 3;
pub const __PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;
pub const FirstExtensionError = 128;
pub const __UINT32_C_SUFFIX__ = U;
pub const __INT32_MAX__ = 2147483647;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __BIT_TYPES_DEFINED__ = 1;
pub const BadGC = 13;
pub const XNSeparatorofNestedList = c"separatorofNestedList";
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __STDC_UTF_16__ = 1;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const __ATOMIC_RELEASE = 3;
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const MSBFirst = 1;
pub const XNContextualDrawing = c"contextualDrawing";
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __SIZEOF_PTHREAD_BARRIER_T = 32;
pub const __INT16_TYPE__ = short;
pub const NeedFunctionPrototypes = 1;
pub const ReplayPointer = 2;
pub const LineOnOffDash = 1;
pub const GrabModeSync = 0;
pub const __SSE2_MATH__ = 1;
pub const TileShape = 1;
pub const Nonconvex = 1;
pub const __INT_FAST8_MAX__ = 127;
pub const StaticGravity = 10;
pub const __MPX__ = 1;
pub const BadMatch = 8;
pub const NoSymbol = c_long(0);
pub const BadAccess = 10;
pub const __STDC_IEC_559__ = 1;
pub const __USE_ISOC99 = 1;
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const ButtonRelease = 5;
pub const Below = 1;
pub const XIMStringConversionConcealed = 16;
pub const __UINT64_FMTu__ = c"lu";
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __SSE2__ = 1;
pub const Button2 = 2;
pub const __INTMAX_FMTi__ = c"li";
pub const QueuedAlready = 0;
pub const FamilyInternet6 = 6;
pub const __GNUC__ = 4;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub const EvenOddRule = 0;
pub const KeyPress = 2;
pub const XBufferOverflow = -1;
pub const _POSIX_C_SOURCE = c_long(200809);
pub const __DBL_MAX_EXP__ = 1024;
pub const __INT8_FMTi__ = c"hhi";
pub const MappingBusy = 1;
pub const Expose = 12;
pub const __FLT16_MIN_10_EXP__ = -13;
pub const XIMPreeditNone = c_long(16);
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const NotifyWhileGrabbed = 3;
pub const __ATOMIC_SEQ_CST = 5;
pub const NotifyInferior = 2;
pub const NotifyDetailNone = 7;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const XNR6PreeditCallback = c"r6PreeditCallback";
pub const __GNUC_STDC_INLINE__ = 1;
pub const __UINT8_MAX__ = 255;
pub const XNPreeditDoneCallback = c"preeditDoneCallback";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const XLookupKeySym = 3;
pub const YXBanded = 3;
pub const __UINT16_FMTo__ = c"ho";
pub const __POPCNT__ = 1;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __SIZEOF_PTHREAD_CONDATTR_T = 4;
pub const JoinMiter = 0;
pub const __SIZEOF_POINTER__ = 8;
pub const __TIMER_T_TYPE = [*c]void;
pub const __unix = 1;
pub const FillSolid = 0;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const unix = 1;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const XNPreeditStateNotifyCallback = c"preeditStateNotifyCallback";
pub const XNPreeditCaretCallback = c"preeditCaretCallback";
pub const __FLT_MAX__ = 340282346999999984391321947108527833088.000000;
pub const __corei7 = 1;
pub const XIMStringConversionBottomEdge = 8;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const TrueColor = 4;
pub const __ATOMIC_CONSUME = 1;
pub const __unix__ = 1;
pub const DefaultBlanking = 2;
pub const VisibilityUnobscured = 0;
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __GNU_LIBRARY__ = 6;
pub const __FLT_MIN_10_EXP__ = -37;
pub const ConfigureNotify = 22;
pub const JoinBevel = 2;
pub const __UINTPTR_FMTo__ = c"lo";
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const XLookupBoth = 4;
pub const __UINTPTR_FMTx__ = c"lx";
pub const BadColor = 12;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const XIMStringConversionLeftEdge = 1;
pub const __attribute_alloc_size__ = params;
pub const XIMStringConversionRightEdge = 2;
pub const BadPixmap = 4;
pub const RevertToParent = 2;
pub const __INT_LEAST8_MAX__ = 127;
pub const DontPreferBlanking = 0;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const CapRound = 2;
pub const SelectionRequest = 30;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const RetainTemporary = 2;
pub const __PIE__ = 2;
pub const __SIZEOF_PTHREAD_RWLOCK_T = 56;
pub const AutoRepeatModeOn = 1;
pub const __UINT16_FMTx__ = c"hx";
pub const __UINTPTR_FMTu__ = c"lu";
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __CLFLUSHOPT__ = 1;
pub const __amd64__ = 1;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const __linux__ = 1;
pub const GrabSuccess = 0;
pub const __LP64__ = 1;
pub const __SYSCALL_WORDSIZE = 64;
pub const __PTRDIFF_FMTi__ = c"li";
pub const _BITS_TYPESIZES_H = 1;
pub const LASTEvent = 36;
pub const _BITS_PTHREADTYPES_ARCH_H = 1;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const GXxor = 6;
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = 4;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const __INO_T_MATCHES_INO64_T = 1;
pub const TopIf = 2;
pub const QueuedAfterFlush = 2;
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const __WCHAR_MAX__ = 2147483647;
pub const AsyncPointer = 0;
pub const DefaultExposures = 2;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const GXnor = 8;
pub const CenterGravity = 5;
pub const __UINTMAX_FMTX__ = c"lX";
pub const VisibilityPartiallyObscured = 1;
pub const BadRequest = 1;
pub const SouthEastGravity = 9;
pub const ControlMapIndex = 2;
pub const LedModeOff = 0;
pub const XIMPreeditUnKnown = c_long(0);
pub const AnyButton = c_long(0);
pub const XNStatusDoneCallback = c"statusDoneCallback";
pub const None = c_long(0);
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const _XExtData = struct__XExtData;
pub const _XGC = struct__XGC;
pub const _XDisplay = struct__XDisplay;
pub const funcs = struct_funcs;
pub const _XImage = struct__XImage;
pub const _XPrivate = struct__XPrivate;
pub const _XrmHashBucketRec = struct__XrmHashBucketRec;
pub const _XEvent = union__XEvent;
pub const _XOM = struct__XOM;
pub const _XOC = struct__XOC;
pub const _XIM = struct__XIM;
pub const _XIC = struct__XIC;
pub const _XIMText = struct__XIMText;
pub const _XIMPreeditStateNotifyCallbackStruct = struct__XIMPreeditStateNotifyCallbackStruct;
pub const _XIMStringConversionText = struct__XIMStringConversionText;
pub const _XIMStringConversionCallbackStruct = struct__XIMStringConversionCallbackStruct;
pub const _XIMPreeditDrawCallbackStruct = struct__XIMPreeditDrawCallbackStruct;
pub const _XIMPreeditCaretCallbackStruct = struct__XIMPreeditCaretCallbackStruct;
pub const _XIMStatusDrawCallbackStruct = struct__XIMStatusDrawCallbackStruct;
pub const _XIMHotKeyTrigger = struct__XIMHotKeyTrigger;
pub const _XIMHotKeyTriggers = struct__XIMHotKeyTriggers;
