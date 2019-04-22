const std = @import("std");
const allocator = std.heap.c_allocator;

const c = @import("libs/win32_lean_gl.zig");

var s_close: bool = false;
var s_wc: c.WNDCLASS = undefined;
var s_wnd: c.HWND = undefined;
var s_hdc: c.HDC = undefined;
var s_background = c.struct_HBRUSH__ { .unused = c.COLOR_BACKGROUND };

export fn WinMain(hInstance: c.HINSTANCE, hPrevInstance: c.HINSTANCE, lpCmdLine: c.PWSTR, nCmdShow: c.INT) c.INT {
    var msg = c.MSG {
        .hwnd = null,
        .message = 0,
        .wParam = 0,
        .lParam = 0,
        .time = 0,
        .pt = c.POINT { .x = 0, .y = 0 },
    };
    
    s_wc = c.WNDCLASS {
        .style = c.CS_OWNDC,
        .lpfnWndProc = WndProc,
        .cbClsExtra = 0,
        .cbWndExtra = 0,
        .hInstance = hInstance,
        .hIcon = null,
        .hCursor = null,
        .hbrBackground = &s_background,
        .lpszMenuName = c"Menu",
        .lpszClassName = c"Class",
    };
    
    if (c.RegisterClass(&s_wc) == 0) {
        std.debug.warn("Register failed\n");
        return 1;
    }

    s_wnd = c.CreateWindowEx(0, s_wc.lpszClassName, c"Window",
        @intCast(c_ulong, c.WS_OVERLAPPEDWINDOW | c.WS_VISIBLE),
        0, 0, 640, 480,
        null, null, hInstance, null) orelse
    {
        std.debug.warn("Create window failed\n");
        return 1;
    };

    while (c.GetMessage(&msg, null, 0, 0) > 0) {
        _ = c.DispatchMessage(&msg);
    }

    return 0;
}

extern fn WndProc(hWnd: c.HWND, message: c.UINT, wParam: c.WPARAM, lParam: c.LPARAM) c.LRESULT {
    switch (message) {
        c.WM_CREATE => {
            const pfd = c.PIXELFORMATDESCRIPTOR {
                .nSize = @sizeOf(c.PIXELFORMATDESCRIPTOR),
                .nVersion = 1,
                .dwFlags = c.PFD_DRAW_TO_WINDOW | c.PFD_SUPPORT_OPENGL | c.PFD_DOUBLEBUFFER, //Flags
                .iPixelType = c.PFD_TYPE_RGBA, // The kind of framebuffer. RGBA or palette.
                .cColorBits = 32, // Colordepth of the framebuffer.
                .cRedBits = 0, .cRedShift = 0, 
                .cGreenBits = 0, .cGreenShift = 0, 
                .cBlueBits = 0, .cBlueShift = 0,
                .cAlphaBits = 0, .cAlphaShift = 0,
                .cAccumBits = 0,
                .cAccumRedBits = 0, 
                .cAccumGreenBits = 0, .cAccumBlueBits = 0, .cAccumAlphaBits = 0,
                .cDepthBits = 24, // Number of bits for the depthbuffer
                .cStencilBits = 8, // Number of bits for the stencilbuffer
                .cAuxBuffers = 0, // Number of Aux buffers in the framebuffer.
                .iLayerType = c.PFD_MAIN_PLANE,
                .bReserved = 0,
                .dwLayerMask = 0, 
                .dwVisibleMask = 0, 
                .dwDamageMask = 0
            };

            s_hdc = c.GetDC(hWnd);

            var pixel_format: c_int = c.ChoosePixelFormat(s_hdc, &pfd); 
            _ = c.SetPixelFormat(s_hdc, pixel_format, &pfd);

            var context: c.HGLRC = c.wglCreateContext(s_hdc);
            _ = c.wglMakeCurrent(s_hdc, context);
            _ = c.MessageBoxA(null, c.glGetString(c.GL_VERSION), c"OPENGL VERSION", 0);
        },
        c.WM_KEYDOWN => {
            if ((wParam & 0xFF) == 27) s_close = true;
        },
        c.WM_CLOSE => {
            s_close = true;
        },
        else => {
            return c.DefWindowProc(hWnd, message, wParam, lParam);
        }
    }
    return 0;
}

pub fn open(title: []const u8, width: u32, height: u32) !void {
}

pub fn update(buffer: []u32) !void {
}

pub fn close() void {
}