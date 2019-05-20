const std = @import("std");
const allocator = std.heap.c_allocator;

const c = @import("libs/win32_lean.zig");

const SRCCOPY = (c.DWORD)(0x00CC0020); // dest = source

var s_close: bool = false;
var s_wc: c.WNDCLASS = undefined;
var s_wnd: c.HWND = undefined;
var s_width: c_long = undefined;
var s_height: c_long = undefined;
var s_hdc: c.HDC = undefined;
var s_buffer: []u32 = undefined;
var s_bitmapInfo: *c.BITMAPINFO = undefined;

extern fn WndProc(hWnd: c.HWND, message: c.UINT, wParam: c.WPARAM, lParam: c.LPARAM) c.LRESULT {
    var res: c.LRESULT = 0;
    switch (message) {
        c.WM_PAINT => {
            if (s_buffer.len > 0) {
                const scanlines_copied = c.StretchDIBits(s_hdc,
                        0, 0, s_width, s_height, 
                        0, 0, s_width, s_height, 
                        s_buffer.ptr, s_bitmapInfo, c.DIB_RGB_COLORS, SRCCOPY);
                const succeded = c.ValidateRect(hWnd, null) != 0;
            }
        },
        c.WM_KEYDOWN => {
            if ((wParam & 0xFF) == 27) 
                s_close = true;
        },
        c.WM_CLOSE => {
            s_close = true;
        },
        else => {
            res = c.DefWindowProc(hWnd, message, wParam, lParam);
        }
    }
    return res;
}

pub fn open(title: []const u8, width: u32, height: u32) !void {
    var rect = c.RECT { .left = 0, .top = 0, .right = 0, .bottom = 0, };
    s_wc.style = c.CS_OWNDC | c.CS_VREDRAW | c.CS_HREDRAW;
    s_wc.lpfnWndProc = WndProc;
    s_wc.hCursor = c.LoadCursor(null, c.IDC_ARROW);
    s_wc.lpszClassName = title.ptr;
    if (c.RegisterClass(&s_wc) == 0) return error.RegisterClassFailed;

    rect.right = @intCast(c_long, width);
    rect.bottom = @intCast(c_long, height);

    if (c.AdjustWindowRect(&rect, @intCast(c_ulong, c.WS_SYSMENU) | @intCast(c_ulong, c.WS_CAPTION), 0) == 0)
        return error.AdjustWindowFailed;

    rect.right -= rect.left;
    rect.bottom -= rect.top;

    s_width = @intCast(c_long, width);
    s_height = @intCast(c_long, height);

    s_wnd = c.CreateWindowEx(0,
        title.ptr, title.ptr,
        @intCast(c_ulong, c.WS_OVERLAPPEDWINDOW & ~c.WS_MAXIMIZEBOX & ~c.WS_THICKFRAME),
        c.CW_USEDEFAULT, c.CW_USEDEFAULT,
        rect.right, rect.bottom,
        null, null, null, null) orelse return error.NoWindow;

    const was_hidden = c.ShowWindow(s_wnd, c.SW_NORMAL) == 0;

    s_bitmapInfo = try allocator.create(c.struct_tagBITMAPINFO);
    s_bitmapInfo.bmiHeader.biSize = @sizeOf(c.struct_tagBITMAPINFOHEADER);
    s_bitmapInfo.bmiHeader.biPlanes = 1;
    s_bitmapInfo.bmiHeader.biBitCount = 32;
    s_bitmapInfo.bmiHeader.biCompression = @intCast(c_ulong, c.BI_BITFIELDS);
    s_bitmapInfo.bmiHeader.biWidth = @intCast(c_long, width);
    s_bitmapInfo.bmiHeader.biHeight = -@intCast(c_long, height);
    s_bitmapInfo.bmiColors[0].rgbRed = 0xff; 
    s_bitmapInfo.bmiColors[1].rgbGreen = 0xff; 
    s_bitmapInfo.bmiColors[2].rgbBlue = 0xff; 

    s_hdc = c.GetDC(s_wnd) orelse return error.GetDcFailed;
}

pub fn update(buffer: []u32) !void {
    s_buffer = buffer;

    _ = c.InvalidateRect(s_wnd, null, 0);
    _ = c.SendMessage(s_wnd, c.WM_PAINT, 0, 0);

    var msg: c.MSG = undefined;
    while (c.PeekMessage(&msg, s_wnd, 0, 0, c.PM_REMOVE) != 0) {
        const not_translated = c.TranslateMessage(&msg) == 0;
        _ = c.DispatchMessage(&msg);
    }

    if (s_close == true) return error.Close;
}

pub fn close() void {
    allocator.destroy(s_bitmapInfo);
    _ = c.ReleaseDC(s_wnd, s_hdc);
    _ = c.DestroyWindow(s_wnd);
}