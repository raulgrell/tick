const std = @import("std");
const c = @import("windows_lean.h.zig");

const SRCCOPY = (c.DWORD)(0x00CC0020); // dest = source
const IDC_ARROW = c.MAKEINTRESOURCEA(32512);

var s_close = u32(0);
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
                _ = c.StretchDIBits(s_hdc, 0, 0, s_width, s_height, 0, 0, s_width, s_height, @ptrCast(*c_void, s_buffer.ptr), s_bitmapInfo, c.DIB_RGB_COLORS, SRCCOPY);
                _ = c.ValidateRect(hWnd, null);
            }
        },
        c.WM_KEYDOWN => {
            if ((wParam & 0xFF) == 27) 
                s_close = 1;
        },
        c.WM_CLOSE => {
            s_close = 1;
        },
        else => {
            res = c.DefWindowProc(hWnd, message, wParam, lParam);
        }
    }
    return res;
}

pub fn open(title: []const u8, width: c_long, height: c_long) error!void {
    // TODO: Zero this memory
    var rect: c.RECT = undefined;

    s_wc.style = c.CS_OWNDC | c.CS_VREDRAW | c.CS_HREDRAW;
    s_wc.lpfnWndProc = WndProc;
    s_wc.hCursor = c.LoadCursor(null, IDC_ARROW);
    s_wc.lpszClassName = title.ptr;
    _ = c.RegisterClass(&s_wc);

    rect.right = width;
    rect.bottom = height;

    _ = c.AdjustWindowRect(&rect, c_ulong(c.WS_SYSMENU) | c_ulong(c.WS_CAPTION), 0);

    rect.right -= rect.left;
    rect.bottom -= rect.top;

    s_width = width;
    s_height = height;

    s_wnd = c.CreateWindowEx(0,
        title.ptr, title.ptr,
        c_ulong(c.WS_OVERLAPPEDWINDOW & ~c.WS_MAXIMIZEBOX & ~c.WS_THICKFRAME),
        c.CW_USEDEFAULT, c.CW_USEDEFAULT,
        rect.right, rect.bottom,
        null, null, null, null);

    if (s_wnd == null)
        return error.NoWindow;

    _ = c.ShowWindow(s_wnd, c.SW_NORMAL);

    s_bitmapInfo = try std.debug.global_allocator.create(c.tagBITMAPINFO);
    s_bitmapInfo.bmiHeader.biSize = @sizeOf(c.BITMAPINFOHEADER);
    s_bitmapInfo.bmiHeader.biPlanes = 1;
    s_bitmapInfo.bmiHeader.biBitCount = 32;
    s_bitmapInfo.bmiHeader.biCompression = c_ulong(c.BI_BITFIELDS);
    s_bitmapInfo.bmiHeader.biWidth = width;
    s_bitmapInfo.bmiHeader.biHeight = -height;
    s_bitmapInfo.bmiColors[0].rgbRed = 0xff; 
    s_bitmapInfo.bmiColors[1].rgbGreen = 0xff; 
    s_bitmapInfo.bmiColors[2].rgbBlue = 0xff; 

    s_hdc = c.GetDC(s_wnd);
}

pub fn update(buffer: []u32) c_int {
    s_buffer = buffer;

    _ = c.InvalidateRect(s_wnd, null, 0);
    _ = c.SendMessage(s_wnd, c.WM_PAINT, 0, 0);

    var msg: c.MSG = undefined;
    while (c.PeekMessage(&msg, s_wnd, 0, 0, c.PM_REMOVE) != 0) {
        _ = c.TranslateMessage(&msg);
        _ = c.DispatchMessage(&msg);
    }

    if (s_close == 1)
        return -1;

    return 0;
}

pub fn close() void {
    // s_buffer = 0;
    // free(s_bitmapInfo);
    _ = c.ReleaseDC(s_wnd, s_hdc);
    _ = c.DestroyWindow(s_wnd);
}