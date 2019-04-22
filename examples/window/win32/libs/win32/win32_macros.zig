use @import("win32_types.zig");

//This is designed to replace L"" for unicode string literals
pub fn _L(comptime cstr: [*]const u8) [*]const u8 {
    comptime {
        var i_cstr: u16 = 0;
        while(cstr[i_cstr] != 0):(i_cstr += 1){}
        i_cstr += 1;
        var str = cstr[0..i_cstr];
        var wstr_tmp: [str.len*4]u8 = undefined; //maximum possible expansion
        var i_8: u16 = 0;  //if type not specified, we get an overflow??
        var i_16 = 0;
        while(i_8 < str.len) {
            //decode codepoints
            var cp_len = switch(str[i_8]) {
                0b00000000 ... 0b01111111 => 1,
                0b10000000 ... 0b10111111 => @compileError("Unexpected continuation byte!"),
                0b11000000 ... 0b11011111 => 2,
                0b11100000 ... 0b11101111 => 3,
                0b11110000 ... 0b11111111 => 4,
                else => @compileError("Invalid codepoint length!"),
            };
            if(i_8 + cp_len > str.len) @compileError("Invalid utf8 string!");
            var cp = switch (cp_len) {
                1 => @intCast(u32, str[i_8]),
                2 ... 4 => v: { 
                    if(str[i_8+1] & 0b11000000 != 0b10000000) @compileError("Expected continuation byte, got something else!");
                    var val: u32 = @intCast(u32, str[i_8] & (0xFF >> cp_len+1)); //2=>0b00011111, 3=>0b0b00001111, 4=> 0b00000111
                    val <<= 6;
                    val |= str[i_8+1] & 0b00111111;
                    if(cp_len == 2) {
                        if(val < 0x80) @compileError("Overlong encoding!");
                        break :v val;
                    }
                    if(str[i_8+2] & 0b11000000 != 0b10000000) @compileError("Expected continuation byte, got something else!");
                    val <<= 6;
                    val |= str[i_8+2] & 0b00111111;
                    if(cp_len == 3) {
                        if(val < 0x800) @compileError("Overlong encoding!");
                        break :v val;
                    }
                    if(str[i_8+3] & 0b11000000 != 0b10000000) @compileError("Expected continuation byte, got something else!");
                    val <<= 6;
                    val |= str[i_8+3] & 0b00111111;
                    if(val < 0x10000) @compileError("Overlong encoding!");
                    break :v val;
                },
                else => unreachable,
            };
            if(cp > 0x10FFFF) @compileError("Codepoint too large!");
            if(cp >= 0xD800 and cp <= 0xDFFF) @compileError("Codepoint encodes surrogate half!");
            i_8 += cp_len;

            //encode codepoints into wstr_tmp
            switch(cp)
            {
                //U+0000 to U+D7FF and U+E000 to U+FFFF
                0 ... 0xD7FF, 
                0xE000 ... 0xFFFF => {
                    wstr_tmp[i_16] = @intCast(u8, cp & 0x00FF);
                    wstr_tmp[i_16+1] = @intCast(u8, (cp & 0xFF00) >> 8);
                    i_16 += 2;
                },
                //U+D800 to U+DFFF
                0xD800 ... 0xDFFF => {
                    @compileError("Codepoint encodes surrogate half!");
                },
                //U+10000 to U+10FFFF
                0x10000 ... 0x10FFFF => {
                    var adj = cp - 0x010000;
                    var ls = (adj & 0x03FF) + 0xDC00;
                    var hs = (adj >> 10) + 0xD800;
                    wstr_tmp[i_16] = @intCast(u8, hs & 0x00FF);
                    wstr_tmp[i_16+1] = @intCast(u8, (hs & 0xFF00) >> 8);
                    wstr_tmp[i_16+2] = @intCast(u8, ls & 0x00FF);
                    wstr_tmp[i_16+3] = @intCast(u8, (ls & 0xFF00) >> 8);
                    i_16 += 4;
                },
            }
        }
        var wstr: [i_16]u8 = undefined;
        var j = 0;
        while(j < i_16):(j += 1) {
            wstr[j] = wstr_tmp[j];
        }
        return wstr[0..].ptr;
    }
}

//These go along with a set of extern functions, but they are just macros
pub fn VarI4FromI4(in: LONG, pOut: ?*LONG) HRESULT {
    pOut.?.* = in;
    return 0;
}

pub fn VarUI4FromUI4(in: ULONG, pOut: ?*ULONG) HRESULT {
    (pOut.?).* = in;
    return 0;
}


//These aren't all technically macros, but they'red so the may as well be

pub fn ReadAcquire8(Source: ?*const volatile CHAR) CHAR {
    var Value: CHAR = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn ReadNoFence8(Source: ?*const volatile CHAR) CHAR {
    var Value: CHAR = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn WriteRelease8(Destination: ?*volatile CHAR, Value: CHAR) void {
    Destination.?.* = Value;
    return;
}
pub fn WriteNoFence8(Destination: ?*volatile CHAR, Value: CHAR) void {
    Destination.?.* = Value;
    return;
}
pub fn ReadAcquire16(Source: ?*const volatile SHORT) SHORT {
    var Value: SHORT = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn ReadNoFence16(Source: ?*const volatile SHORT) SHORT {
    var Value: SHORT = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn WriteRelease16(Destination: ?*volatile SHORT, Value: SHORT) void {
    Destination.?.* = Value;
    return;
}
pub fn WriteNoFence16(Destination: ?*volatile SHORT, Value: SHORT) void {
    Destination.?.* = Value;
    return;
}
pub fn ReadAcquire(Source: ?*const volatile LONG) LONG {
    var Value: LONG = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn ReadNoFence(Source: ?*const volatile LONG) LONG {
    var Value: LONG = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn WriteRelease(Destination: ?*volatile LONG, Value: LONG) void {
    Destination.?.* = Value;
    return;
}
pub fn WriteNoFence(Destination: ?*volatile LONG, Value: LONG) void {
    Destination.?.* = Value;
    return;
}
pub fn ReadAcquire64(Source: ?*const volatile LONG64) LONG64 {
    var Value: LONG64 = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn ReadNoFence64(Source: ?*const volatile LONG64) LONG64 {
    var Value: LONG64 = undefined;
    Value = Source.?.*;
    return Value;
}
pub fn WriteRelease64(Destination: ?*volatile LONG64, Value: LONG64) void {
    Destination.?.* = Value;
    return;
}
pub fn WriteNoFence64(Destination: ?*volatile LONG64, Value: LONG64) void {
    Destination.?.* = Value;
    return;
}
pub fn ReadRaw8(Source: ?*const volatile CHAR) CHAR {
    var Value: CHAR = undefined;
    Value = @ptrCast(*CHAR, Source).*;
    return Value;
}
pub fn WriteRaw8(Destination: ?*volatile CHAR, Value: CHAR) void {
    @ptrCast(*CHAR, Destination).* = Value;
    return;
}
pub fn ReadRaw16(Source: ?*const volatile SHORT) SHORT {
    var Value: SHORT = undefined;
    Value = @ptrCast(*SHORT, Source).*;
    return Value;
}
pub fn WriteRaw16(Destination: ?*volatile SHORT, Value: SHORT) void {
    @ptrCast(*SHORT, Destination).* = Value;
    return;
}
pub fn ReadRaw(Source: ?*const volatile LONG) LONG {
    var Value: LONG = undefined;
    Value = @ptrCast(*LONG, Source).*;
    return Value;
}
pub fn WriteRaw(Destination: ?*volatile LONG, Value: LONG) void {
    @ptrCast(*LONG, Destination).* = Value;
    return;
}
pub fn ReadRaw64(Source: ?*const volatile LONG64) LONG64 {
    var Value: LONG64 = undefined;
    Value = @ptrCast(*LONG64, Source).*;
    return Value;
}
pub fn WriteRaw64(Destination: ?*volatile LONG64, Value: LONG64) void {
    @ptrCast(*LONG64, Destination).* = Value;
    return;
}
pub fn ReadUCharAcquire(Source: ?*const volatile BYTE) BYTE {
    return BYTE(ReadAcquire8(@ptrCast(*const volatile CHAR, @ptrCast(PCHAR.Child, Source))));
}
pub fn ReadUCharNoFence(Source: ?*const volatile BYTE) BYTE {
    return BYTE(ReadNoFence8(@ptrCast(*const volatile CHAR, @ptrCast(PCHAR.Child, Source))));
}
pub fn ReadBooleanAcquire(Source: ?*const volatile BOOLEAN) BYTE {
    return BOOLEAN(ReadAcquire8(@ptrCast(*const volatile CHAR, @ptrCast(PCHAR.Child, Source))));
}
pub fn ReadBooleanNoFence(Source: ?*const volatile BOOLEAN) BYTE {
    return BOOLEAN(ReadNoFence8(@ptrCast(*const volatile CHAR, @ptrCast(PCHAR.Child, Source))));
}
pub fn ReadUCharRaw(Source: ?*const volatile BYTE) BYTE {
    return BYTE(ReadRaw8(@ptrCast(*const volatile CHAR, @ptrCast(PCHAR.Child, Source))));
}
pub fn WriteUCharRelease(Destination: ?*volatile BYTE, Value: BYTE) void {
    WriteRelease8(@ptrCast(*volatile CHAR, @ptrCast(PCHAR.Child, Destination)), CHAR(Value));
    return;
}
pub fn WriteUCharNoFence(Destination: ?*volatile BYTE, Value: BYTE) void {
    WriteNoFence8(@ptrCast(*volatile CHAR, @ptrCast(PCHAR.Child, Destination)), CHAR(Value));
    return;
}
pub fn WriteBooleanRelease(Destination: ?*volatile BOOLEAN, Value: BOOLEAN) void {
    WriteRelease8(@ptrCast(*volatile CHAR, @ptrCast(PCHAR.Child, Destination)), CHAR(Value));
    return;
}
pub fn WriteBooleanNoFence(Destination: ?*volatile BOOLEAN, Value: BOOLEAN) void {
    WriteNoFence8(@ptrCast(*volatile CHAR, @ptrCast(PCHAR.Child, Destination)), CHAR(Value));
    return;
}
pub fn WriteUCharRaw(Destination: ?*volatile BYTE, Value: BYTE) void {
    WriteRaw8(@ptrCast(*volatile CHAR, @ptrCast(PCHAR.Child, Destination)), CHAR(Value));
    return;
}
pub fn ReadUShortAcquire(Source: ?*const volatile WORD) WORD {
    return WORD(ReadAcquire16(@ptrCast(*const volatile SHORT, @ptrCast(PSHORT.Child, Source))));
}
pub fn ReadUShortNoFence(Source: ?*const volatile WORD) WORD {
    return WORD(ReadNoFence16(@ptrCast(*const volatile SHORT, @ptrCast(PSHORT.Child, Source))));
}
pub fn ReadUShortRaw(Source: ?*const volatile WORD) WORD {
    return WORD(ReadRaw16(@ptrCast(*const volatile SHORT, @ptrCast(PSHORT.Child, Source))));
}
pub fn WriteUShortRelease(Destination: ?*volatile WORD, Value: WORD) void {
    WriteRelease16(@ptrCast(*volatile SHORT, @ptrCast(PSHORT.Child, Destination)), SHORT(Value));
    return;
}
pub fn WriteUShortNoFence(Destination: ?*volatile WORD, Value: WORD) void {
    WriteNoFence16(@ptrCast(*volatile SHORT, @ptrCast(PSHORT.Child, Destination)), SHORT(Value));
    return;
}
pub fn WriteUShortRaw(Destination: ?*volatile WORD, Value: WORD) void {
    WriteRaw16(@ptrCast(*volatile SHORT, @ptrCast(PSHORT.Child, Destination)), SHORT(Value));
    return;
}
pub fn ReadULongAcquire(Source: ?*const volatile DWORD) DWORD {
    return DWORD(ReadAcquire(@ptrCast(*const volatile LONG, @ptrCast(PLONG.Child, Source))));
}
pub fn ReadULongNoFence(Source: ?*const volatile DWORD) DWORD {
    return DWORD(ReadNoFence(@ptrCast(*const volatile LONG, @ptrCast(PLONG.Child, Source))));
}
pub fn ReadULongRaw(Source: ?*const volatile DWORD) DWORD {
    return DWORD(ReadRaw(@ptrCast(*const volatile LONG, @ptrCast(PLONG.Child, Source))));
}
pub fn WriteULongRelease(Destination: ?*volatile DWORD, Value: DWORD) void {
    WriteRelease(@ptrCast(*volatile LONG, @ptrCast(PLONG.Child, Destination)), LONG(Value));
    return;
}
pub fn WriteULongNoFence(Destination: ?*volatile DWORD, Value: DWORD) void {
    WriteNoFence(@ptrCast(*volatile LONG, @ptrCast(PLONG.Child, Destination)), LONG(Value));
    return;
}
pub fn WriteULongRaw(Destination: ?*volatile DWORD, Value: DWORD) void {
    WriteRaw(@ptrCast(*volatile LONG, @ptrCast(PLONG.Child, Destination)), LONG(Value));
    return;
}
pub fn ReadULong64Acquire(Source: ?*const volatile DWORD64) DWORD64 {
    return DWORD64(ReadAcquire64(@ptrCast(*const volatile LONG64, @ptrCast(PLONG64.Child, Source))));
}
pub fn ReadULong64NoFence(Source: ?*const volatile DWORD64) DWORD64 {
    return DWORD64(ReadNoFence64(@ptrCast(*const volatile LONG64, @ptrCast(PLONG64.Child, Source))));
}
pub fn ReadULong64Raw(Source: ?*const volatile DWORD64) DWORD64 {
    return DWORD64(ReadRaw64(@ptrCast(*const volatile LONG64, @ptrCast(PLONG64.Child, Source))));
}
pub fn WriteULong64Release(Destination: ?*volatile DWORD64, Value: DWORD64) void {
    WriteRelease64(@ptrCast(*volatile LONG64, @ptrCast(PLONG64.Child, Destination)), LONG64(Value));
    return;
}
pub fn WriteULong64NoFence(Destination: ?*volatile DWORD64, Value: DWORD64) void {
    WriteNoFence64(@ptrCast(*volatile LONG64, @ptrCast(PLONG64.Child, Destination)), LONG64(Value));
    return;
}
pub fn WriteULong64Raw(Destination: ?*volatile DWORD64, Value: DWORD64) void {
    WriteRaw64(@ptrCast(*volatile LONG64, @ptrCast(PLONG64.Child, Destination)), LONG64(Value));
    return;
}
pub fn ReadPointerAcquire(Source: ?*const volatile PVOID) PVOID {
    return @intToPtr(PVOID, ReadAcquire64(@ptrCast(*const volatile LONG64, @ptrCast(PLONG64.Child, Source))));
}
pub fn ReadPointerNoFence(Source: ?*const volatile PVOID) PVOID {
    return @intToPtr(PVOID, ReadNoFence64(@ptrCast(*const volatile LONG64, @ptrCast(PLONG64.Child, Source))));
}
pub fn ReadPointerRaw(Source: ?*const volatile PVOID) PVOID {
    return @intToPtr(PVOID, ReadRaw64(@ptrCast(*const volatile LONG64, @ptrCast(PLONG64.Child, Source))));
}
pub fn WritePointerRelease(Destination: ?*volatile PVOID, Value: PVOID) void {
    WriteRelease64(@ptrCast(*volatile LONG64, @ptrCast(PLONG64.Child, Destination)), LONG64(Value));
    return;
}
pub fn WritePointerNoFence(Destination: ?*volatile PVOID, Value: PVOID) void {
    WriteNoFence64(@ptrCast(*volatile LONG64, @ptrCast(PLONG64.Child, Destination)), LONG64(Value));
    return;
}
pub fn WritePointerRaw(Destination: ?*volatile PVOID, Value: PVOID) void {
    WriteRaw64(@ptrCast(*volatile LONG64, @ptrCast(PLONG64.Child, Destination)), LONG64(Value));
    return;
}
pub fn HEAP_MAKE_TAG_FLAGS(TagBase: DWORD, Tag: DWORD) DWORD {
    return DWORD(TagBase +% (Tag << @import("std").math.Log2Int(DWORD)(18)));
}
pub fn TpInitializeCallbackEnviron(CallbackEnviron: PTP_CALLBACK_ENVIRON) void {
    CallbackEnviron.?.Version = TP_VERSION(3);
    CallbackEnviron.?.Pool = null;
    CallbackEnviron.?.CleanupGroup = null;
    CallbackEnviron.?.CleanupGroupCancelCallback = null;
    CallbackEnviron.?.RaceDll = (?*c_void)(0);
    CallbackEnviron.?.ActivationContext = null;
    CallbackEnviron.?.FinalizationCallback = null;
    CallbackEnviron.?.u.Flags = DWORD(0);
    CallbackEnviron.?.CallbackPriority = TP_CALLBACK_PRIORITY(TP_CALLBACK_PRIORITY_NORMAL);
    CallbackEnviron.?.Size = DWORD(@sizeOf(TP_CALLBACK_ENVIRON));
}
pub fn TpSetCallbackThreadpool(CallbackEnviron: PTP_CALLBACK_ENVIRON, Pool: PTP_POOL) void {
    CallbackEnviron.?.Pool = Pool;
}
pub fn TpSetCallbackCleanupGroup(CallbackEnviron: PTP_CALLBACK_ENVIRON, CleanupGroup: PTP_CLEANUP_GROUP, CleanupGroupCancelCallback: PTP_CLEANUP_GROUP_CANCEL_CALLBACK) void {
    CallbackEnviron.?.CleanupGroup = CleanupGroup;
    CallbackEnviron.?.CleanupGroupCancelCallback = CleanupGroupCancelCallback;
}
pub fn TpSetCallbackActivationContext(CallbackEnviron: PTP_CALLBACK_ENVIRON, ActivationContext: ?*struct__ACTIVATION_CONTEXT) void {
    CallbackEnviron.?.ActivationContext = ActivationContext;
}
pub fn TpSetCallbackNoActivationContext(CallbackEnviron: PTP_CALLBACK_ENVIRON) void {
    CallbackEnviron.?.ActivationContext = (?*struct__ACTIVATION_CONTEXT)(LONG_PTR(-1));
}
pub fn TpSetCallbackLongFunction(CallbackEnviron: PTP_CALLBACK_ENVIRON) void {
    CallbackEnviron.?.u.s.LongFunction = DWORD(1);
}
pub fn TpSetCallbackRaceWithDll(CallbackEnviron: PTP_CALLBACK_ENVIRON, DllHandle: PVOID) void {
    CallbackEnviron.?.RaceDll = DllHandle;
}
pub fn TpSetCallbackFinalizationCallback(CallbackEnviron: PTP_CALLBACK_ENVIRON, FinalizationCallback: PTP_SIMPLE_CALLBACK) void {
    CallbackEnviron.?.FinalizationCallback = FinalizationCallback;
}
pub fn TpSetCallbackPriority(CallbackEnviron: PTP_CALLBACK_ENVIRON, Priority: TP_CALLBACK_PRIORITY) void {
    CallbackEnviron.?.CallbackPriority = Priority;
}
pub fn TpSetCallbackPersistent(CallbackEnviron: PTP_CALLBACK_ENVIRON) void {
    CallbackEnviron.?.u.s.Persistent = DWORD(1);
}
pub fn TpDestroyCallbackEnviron(CallbackEnviron: PTP_CALLBACK_ENVIRON) void {
    CallbackEnviron;
}
pub fn GetCurrentFiber() PVOID {
    @compileError("This function is unimplemented at this time due to requiring __readfsdword intrinsic.");
    return @intToPtr(PVOID.Child, __readfsdword(0x10));  //intrinsic: read memory at offset from begining of FS segment, also byte, qword, sword
}
pub fn GetFiberData() PVOID {
    return @ptrCast(PVOID.Child, GetCurrentFiber());
}
pub fn GetCurrentProcessToken() HANDLE {
    return @intToPtr(HANDLE.Child, -4);
}
pub fn GetCurrentThreadToken() HANDLE {
    return @intToPtr(HANDLE.Child, -5);
}
pub fn GetCurrentThreadEffectiveToken() HANDLE {
    return @intToPtr(HANDLE.Child, -6);
}
pub fn MapViewOfFile2(FileMappingHandle: HANDLE, ProcessHandle: HANDLE, Offset: ULONG64, BaseAddress: PVOID, ViewSize: SIZE_T, AllocationType: ULONG, PageProtection: ULONG) PVOID {
    return MapViewOfFileNuma2(FileMappingHandle, ProcessHandle, Offset, BaseAddress, ViewSize, AllocationType, PageProtection, DWORD(-1));
}

pub fn InitializeThreadpoolEnvironment(pcbe: PTP_CALLBACK_ENVIRON) void {
    TpInitializeCallbackEnviron(pcbe);
}
pub fn SetThreadpoolCallbackPool(pcbe: PTP_CALLBACK_ENVIRON, ptpp: PTP_POOL) void {
    TpSetCallbackThreadpool(pcbe, ptpp);
}
pub fn SetThreadpoolCallbackCleanupGroup(pcbe: PTP_CALLBACK_ENVIRON, ptpcg: PTP_CLEANUP_GROUP, pfng: PTP_CLEANUP_GROUP_CANCEL_CALLBACK) void {
    TpSetCallbackCleanupGroup(pcbe, ptpcg, pfng);
}
pub fn SetThreadpoolCallbackRunsLong(pcbe: PTP_CALLBACK_ENVIRON) void {
    TpSetCallbackLongFunction(pcbe);
}
pub fn SetThreadpoolCallbackLibrary(pcbe: PTP_CALLBACK_ENVIRON, mod: PVOID) void {
    TpSetCallbackRaceWithDll(pcbe, mod);
}
pub fn SetThreadpoolCallbackPriority(pcbe: PTP_CALLBACK_ENVIRON, Priority: TP_CALLBACK_PRIORITY) void {
    TpSetCallbackPriority(pcbe, Priority);
}
pub fn DestroyThreadpoolEnvironment(pcbe: PTP_CALLBACK_ENVIRON) void {
    TpDestroyCallbackEnviron(pcbe);
}
pub fn SetThreadpoolCallbackPersistent(pcbe: PTP_CALLBACK_ENVIRON) void {
    TpSetCallbackPersistent(pcbe);
}

pub fn HRESULT_FROM_WIN32(x: c_ulong) HRESULT {
    return if (HRESULT(x) <= c_long(0)) HRESULT(x) else HRESULT(((x & c_ulong(65535)) | c_ulong(7 << @import("std").math.Log2Int(c_int)(16))) | c_ulong(-2147483648));
}

pub fn HandleToULong(h: ?*const c_void) c_ulong {
    return @truncate(c_ulong, @ptrToInt(h));
}
pub fn HandleToLong(h: ?*const c_void) c_long {
    return @bitCast(c_long, HandleToULong(h));
}
pub fn ULongToHandle(h: c_ulong) HANDLE {
    return @intToPtr(HANDLE.Child, h);
}
pub fn LongToHandle(h: c_long) HANDLE {
    return ULongToHandle(@bitCast(c_ulong, h));
}
pub fn PtrToUlong(p: ?*const c_void) c_ulong {
    return @truncate(c_ulong, @ptrToInt(p));
}
pub fn PtrToUint(p: ?*const c_void) c_uint {
    return @truncate(c_uint, @ptrToInt(p));
}
pub fn PtrToUshort(p: ?*const c_void) c_ushort {
    return @truncate(c_ushort, @ptrToInt(p));
}
pub fn PtrToLong(p: ?*const c_void) c_long {
    return @bitCast(c_long, PtrToUlong(p));
}
pub fn PtrToInt(p: ?*const c_void) c_int {
    return @bitCast(c_int, PtrToUint(p));
}
pub fn PtrToShort(p: ?*const c_void) c_short {
    return @bitCast(c_short, PtrToUshort(p));
}
pub fn UIntToPtr(ui: c_uint) ?*c_void {
    return @intToPtr(*c_void, ui);
}
pub fn IntToPtr(i: c_int) ?*c_void {
    return UIntToPtr(@bitCast(c_uint, i));
}
pub fn ULongToPtr(ul: c_ulong) ?*c_void {
    return @intToPtr(*c_void, ul);
}
pub fn LongToPtr(l: c_long) ?*c_void {
    return ULongToPtr(@bitCast(c_ulong, l));
}
pub fn Ptr32ToPtr(p: ?*const c_void) ?*c_void {
    return ULongToPtr(PtrToUlong(p));
}
pub fn Handle32ToHandle(h: ?*const c_void) HANDLE {
    return @ptrCast(HANDLE.Child, Ptr32ToPtr(h));
}
pub fn PtrToPtr32(p: ?*const c_void) ?*c_void {
    return @intToPtr(@truncate(u32, @ptrToInt(p)));
}

pub fn MAKEINTRESOURCEA(i: WORD) LPSTR {
    //return LPSTR(ULONG_PTR(WORD(i)));
    //LPSTR is a nullable type and crashes
    //compiler with intToPtr
    return @intToPtr(LPSTR.Child, i);
}
pub fn MAKEINTRESOURCEW(i: WORD) LPWSTR {
    //LPWSTR(ULONG_PTR(WORD(i)));
    return @intToPtr(LPWSTR.Child, i);
}
pub fn MAKEINTATOM(i: WORD) LPTSTR {
    return @intToPtr(LPTSTR.Child, i);
}

//pub fn TEXT(comptime i: [*]const u8) LPTSTR {
//    //this is supposed to convert provided string
//    //to wide at compile time if appropriate
//    comptime var str = if(__win32_zig_is_unicode) _L(i) else i;
//    return @ptrCast(LPTSTR.Child, str);
//}

pub fn ua_CharUpperW(String: LPUWSTR) LPUWSTR {
    {
        const _tmp = 1;
        if (@bitCast(@IntType(false, @sizeOf(@typeOf(_tmp)) * 8), _tmp) != 0) {
            return @ptrCast(LPUWSTR.Child, CharUpperW(@ptrCast(PWSTR.Child, String)));
        } else {
            return uaw_CharUpperW(String);
        }
    }
}
pub fn ua_lstrcmpW(String1: LPCUWSTR, String2: LPCUWSTR) c_int {
    if (1 and 1) {
        return lstrcmpW(@ptrCast(LPCWSTR.Child, String1), @ptrCast(LPCWSTR.Child, String2));
    } else {
        return uaw_lstrcmpW(String1, String2);
    }
}
pub fn ua_lstrcmpiW(String1: LPCUWSTR, String2: LPCUWSTR) c_int {
    if (1 and 1) {
        return lstrcmpiW(@ptrCast(LPCWSTR.Child, String1), @ptrCast(LPCWSTR.Child, String2));
    } else {
        return uaw_lstrcmpiW(String1, String2);
    }
}
pub fn ua_lstrlenW(String: LPCUWSTR) c_int {
    {
        const _tmp = 1;
        if (@bitCast(@IntType(false, @sizeOf(@typeOf(_tmp)) * 8), _tmp) != 0) {
            return lstrlenW(@ptrCast(PCWSTR.Child, String));
        } else {
            return uaw_lstrlenW(String);
        }
    }
}
pub fn ua_wcschr(String: PCUWSTR, Character: WCHAR) PUWSTR_C {
    {
        const _tmp = 1;
        if (@bitCast(@IntType(false, @sizeOf(@typeOf(_tmp)) * 8), _tmp) != 0) {
            return @ptrCast(PUWSTR_C.Child, wcschr(@ptrCast(PCWSTR.Child, String), Character));
        } else {
            return @ptrCast(PUWSTR_C.Child, uaw_wcschr(String, Character));
        }
    }
}
pub fn ua_wcsrchr(String: PCUWSTR, Character: WCHAR) PUWSTR_C {
    {
        const _tmp = 1;
        if (@bitCast(@IntType(false, @sizeOf(@typeOf(_tmp)) * 8), _tmp) != 0) {
            return @ptrCast(PUWSTR_C.Child, wcsrchr(@ptrCast(PCWSTR.Child, String), Character));
        } else {
            return @ptrCast(PUWSTR_C.Child, uaw_wcsrchr(String, Character));
        }
    }
}
pub fn ua_wcscpy(Destination: PUWSTR, Source: PCUWSTR) PUWSTR {
    if (1 and 1) {
        return @ptrCast(PUWSTR.Child, wcscpy(@ptrCast(PWSTR.Child, Destination), @ptrCast(PCWSTR.Child, Source)));
    } else {
        return uaw_wcscpy(Destination, Source);
    }
}
pub fn ua_wcscpy_s(Destination: PUWSTR, DestinationSize: usize, Source: PCUWSTR) PUWSTR {
    if (1 and 1) {
        return if (wcscpy_s(@ptrCast(PWSTR.Child, Destination), DestinationSize, @ptrCast(PCWSTR.Child, Source)) == 0) Destination else null;
    } else {
        return uaw_wcscpy(Destination, Source);
    }
}
pub fn ua_wcslen(String: PCUWSTR) usize {
    {
        const _tmp = 1;
        if (@bitCast(@IntType(false, @sizeOf(@typeOf(_tmp)) * 8), _tmp) != 0) {
            return wcslen(@ptrCast(PCWSTR.Child, String));
        } else {
            return uaw_wcslen(String);
        }
    }
}
pub fn ua_wcsicmp(String1: PCUWSTR, String2: PCUWSTR) c_int {
    if (1 and 1) {
        return _wcsicmp(@ptrCast(LPCWSTR.Child, String1), @ptrCast(LPCWSTR.Child, String2));
    } else {
        return uaw_wcsicmp(String1, String2);
    }
}