pub const wchar_t = c_ushort;
pub const WCHAR = wchar_t;
pub const DWORD = c_ulong;
pub const PVOID = ?*c_void;
pub const ULONG_PTR = c_ulonglong;
pub const DWORD64 = c_ulonglong;
pub const WORD = c_ushort;
pub const BYTE = u8;
pub const ULONGLONG = c_ulonglong;
pub const LONGLONG = c_longlong;
pub const ULONG = c_ulong;
pub const PULONG = ?*ULONG;
pub const USHORT = c_ushort;
pub const PUSHORT = ?*USHORT;
pub const UCHAR = u8;
pub const PUCHAR = ?*UCHAR;
pub const PSZ = ?[*]u8;
pub const BOOL = c_int;
pub const FLOAT = f32;
pub const PFLOAT = ?*FLOAT;
pub const PBOOL = ?*BOOL;
pub const LPBOOL = ?*BOOL;
pub const PBYTE = ?*BYTE;
pub const LPBYTE = ?*BYTE;
pub const PINT = ?*c_int;
pub const LPINT = ?*c_int;
pub const PWORD = ?*WORD;
pub const LPWORD = ?*WORD;
pub const LPLONG = ?*c_long;
pub const PDWORD = ?*DWORD;
pub const LPDWORD = ?*DWORD;
pub const LPVOID = ?*c_void;
pub const LPCVOID = ?*const c_void;
pub const INT = c_int;
pub const UINT = c_uint;
pub const PUINT = ?*c_uint;
pub const __crt_bool = bool;
pub const errno_t = c_int;
pub const wint_t = c_ushort;
pub const wctype_t = c_ushort;
pub const __time32_t = c_long;
pub const __time64_t = c_longlong;

pub const mbstate_t = _Mbstatet;
pub const time_t = __time64_t;
pub const size_t = usize;
pub const rsize_t = usize;
pub const POINTER_64_INT = c_ulonglong;
pub const INT8 = i8;
pub const PINT8 = ?*i8;
pub const INT16 = c_short;
pub const PINT16 = ?*c_short;
pub const INT32 = c_int;
pub const PINT32 = ?*c_int;
pub const INT64 = c_longlong;
pub const PINT64 = ?*c_longlong;
pub const UINT8 = u8;
pub const PUINT8 = ?[*]u8;
pub const UINT16 = c_ushort;
pub const PUINT16 = ?*c_ushort;
pub const UINT32 = c_uint;
pub const PUINT32 = ?*c_uint;
pub const UINT64 = c_ulonglong;
pub const PUINT64 = ?*c_ulonglong;
pub const LONG32 = c_int;
pub const PLONG32 = ?*c_int;
pub const ULONG32 = c_uint;
pub const PULONG32 = ?*c_uint;
pub const DWORD32 = c_uint;
pub const PDWORD32 = ?*c_uint;
pub const INT_PTR = isize;
pub const PINT_PTR = ?*INT_PTR;
pub const UINT_PTR = usize;
pub const PUINT_PTR = ?*UINT_PTR;
pub const LONG_PTR = c_longlong;
pub const PLONG_PTR = ?*c_longlong;
pub const PULONG_PTR = ?*c_ulonglong;
pub const SHANDLE_PTR = c_longlong;
pub const HANDLE_PTR = c_ulonglong;
pub const UHALF_PTR = c_uint;
pub const PUHALF_PTR = ?*c_uint;
pub const HALF_PTR = c_int;
pub const PHALF_PTR = ?*c_int;
pub const SIZE_T = ULONG_PTR;
pub const PSIZE_T = ?*ULONG_PTR;
pub const SSIZE_T = LONG_PTR;
pub const PSSIZE_T = ?*LONG_PTR;
pub const DWORD_PTR = ULONG_PTR;
pub const PDWORD_PTR = ?*ULONG_PTR;
pub const LONG64 = c_longlong;
pub const PLONG64 = ?*c_longlong;
pub const ULONG64 = c_ulonglong;
pub const PULONG64 = ?*c_ulonglong;
pub const PDWORD64 = ?*c_ulonglong;
pub const KAFFINITY = ULONG_PTR;
pub const PKAFFINITY = ?*KAFFINITY;
pub const PVOID64 = ?*c_void;
pub const CHAR = u8;
pub const SHORT = c_short;
pub const LONG = c_long;
pub const PWCHAR = ?*WCHAR;
pub const LPWCH = ?*WCHAR;
pub const PWCH = ?*WCHAR;
pub const LPCWCH = ?*const WCHAR;
pub const PCWCH = ?*const WCHAR;
pub const NWPSTR = ?[*]WCHAR;
pub const LPWSTR = ?[*]WCHAR;
pub const PWSTR = ?[*]WCHAR;
pub const PZPWSTR = ?[*]PWSTR;
pub const PCZPWSTR = ?[*]const PWSTR;
pub const LPUWSTR = ?[*]WCHAR;
pub const PUWSTR = ?[*]WCHAR;
pub const LPCWSTR = ?[*]const WCHAR;
pub const PCWSTR = ?[*]const WCHAR;
pub const PZPCWSTR = ?[*]PCWSTR;
pub const PCZPCWSTR = ?[*]const PCWSTR;
pub const LPCUWSTR = ?[*]const WCHAR;
pub const PCUWSTR = ?[*]const WCHAR;
pub const PZZWSTR = ?[*]WCHAR;
pub const PCZZWSTR = ?[*]const WCHAR;
pub const PUZZWSTR = ?[*]WCHAR;
pub const PCUZZWSTR = ?[*]const WCHAR;
pub const PNZWCH = ?*WCHAR;
pub const PCNZWCH = ?*const WCHAR;
pub const PUNZWCH = ?*WCHAR;
pub const PCUNZWCH = ?*const WCHAR;
pub const LPCWCHAR = ?*const WCHAR;
pub const PCWCHAR = ?*const WCHAR;
pub const LPCUWCHAR = ?*const WCHAR;
pub const PCUWCHAR = ?*const WCHAR;
pub const UCSCHAR = c_ulong;
pub const PUCSCHAR = ?*UCSCHAR;
pub const PCUCSCHAR = ?*const UCSCHAR;
pub const PUCSSTR = ?[*]UCSCHAR;
pub const PUUCSSTR = ?[*]UCSCHAR;
pub const PCUCSSTR = ?[*]const UCSCHAR;
pub const PCUUCSSTR = ?[*]const UCSCHAR;
pub const PUUCSCHAR = ?*UCSCHAR;
pub const PCUUCSCHAR = ?*const UCSCHAR;
pub const PCHAR = ?*CHAR;
pub const LPCH = ?*CHAR;
pub const PCH = ?*CHAR;
pub const LPCCH = ?*const CHAR;
pub const PCCH = ?*const CHAR;
pub const NPSTR = ?[*]CHAR;
pub const LPSTR = ?[*]CHAR;
pub const PSTR = ?[*]CHAR;
pub const PZPSTR = ?[*]PSTR;
pub const PCZPSTR = ?[*]const PSTR;
pub const LPCSTR = ?[*]const CHAR;
pub const PCSTR = ?[*]const CHAR;
pub const PZPCSTR = ?[*]PCSTR;
pub const PCZPCSTR = ?[*]const PCSTR;
pub const PZZSTR = ?[*]CHAR;
pub const PCZZSTR = ?[*]const CHAR;
pub const PNZCH = ?*CHAR;
pub const PCNZCH = ?*const CHAR;
pub const TCHAR = u8;
pub const PTCHAR = ?[*]u8;
pub const TBYTE = u8;
pub const PTBYTE = ?[*]u8;
pub const LPTCH = LPCH;
pub const PTCH = LPCH;
pub const LPCTCH = LPCCH;
pub const PCTCH = LPCCH;
pub const PTSTR = LPSTR;
pub const LPTSTR = LPSTR;
pub const PUTSTR = LPSTR;
pub const LPUTSTR = LPSTR;
pub const PCTSTR = LPCSTR;
pub const LPCTSTR = LPCSTR;
pub const PCUTSTR = LPCSTR;
pub const LPCUTSTR = LPCSTR;
pub const PZZTSTR = PZZSTR;
pub const PUZZTSTR = PZZSTR;
pub const PCZZTSTR = PCZZSTR;
pub const PCUZZTSTR = PCZZSTR;
pub const PZPTSTR = PZPSTR;
pub const PNZTCH = PNZCH;
pub const PUNZTCH = PNZCH;
pub const PCNZTCH = PCNZCH;
pub const PCUNZTCH = PCNZCH;
pub const PSHORT = ?*SHORT;
pub const PLONG = ?*LONG;
pub const HANDLE = ?*c_void;
pub const PHANDLE = ?*HANDLE;
pub const FCHAR = BYTE;
pub const FSHORT = WORD;
pub const FLONG = DWORD;
pub const HRESULT = c_long;
pub const CCHAR = u8;
pub const LCID = DWORD;
pub const PLCID = PDWORD;
pub const LANGID = WORD;
pub const COMPARTMENT_ID = c_int;
pub const PCOMPARTMENT_ID = ?*c_int;
pub const PACCESS_TOKEN = PVOID;
pub const PSECURITY_DESCRIPTOR = PVOID;
pub const PSID = PVOID;
pub const PCLAIMS_BLOB = PVOID;
pub const ACCESS_MASK = DWORD;
pub const PACCESS_MASK = ?*ACCESS_MASK;

pub const ExceptionContinueExecution = EXCEPTION_DISPOSITION.ExceptionContinueExecution;
pub const ExceptionContinueSearch = EXCEPTION_DISPOSITION.ExceptionContinueSearch;
pub const ExceptionNestedException = EXCEPTION_DISPOSITION.ExceptionNestedException;
pub const ExceptionCollidedUnwind = EXCEPTION_DISPOSITION.ExceptionCollidedUnwind;
pub const EXCEPTION_DISPOSITION = extern enum {
    ExceptionContinueExecution,
    ExceptionContinueSearch,
    ExceptionNestedException,
    ExceptionCollidedUnwind,
};

pub const EXCEPTION_RECORD = extern struct {
    ExceptionCode: DWORD,
    ExceptionFlags: DWORD,
    ExceptionRecord: ?*EXCEPTION_RECORD,
    ExceptionAddress: PVOID,
    NumberParameters: DWORD,
    ExceptionInformation: [15]ULONG_PTR,
};
pub const M128A = extern struct {
    Low: ULONGLONG,
    High: LONGLONG,
};

pub const XSAVE_FORMAT = extern struct {
    ControlWord: WORD,
    StatusWord: WORD,
    TagWord: BYTE,
    Reserved1: BYTE,
    ErrorOpcode: WORD,
    ErrorOffset: DWORD,
    ErrorSelector: WORD,
    Reserved2: WORD,
    DataOffset: DWORD,
    DataSelector: WORD,
    Reserved3: WORD,
    MxCsr: DWORD,
    MxCsr_Mask: DWORD,
    FloatRegisters: [8]M128A,
    XmmRegisters: [16]M128A,
    Reserved4: [96]BYTE,
};

pub const XMM_SAVE_AREA32 = XSAVE_FORMAT;
pub const CONTEXT = extern struct {
    P1Home: DWORD64,
    P2Home: DWORD64,
    P3Home: DWORD64,
    P4Home: DWORD64,
    P5Home: DWORD64,
    P6Home: DWORD64,
    ContextFlags: DWORD,
    MxCsr: DWORD,
    SegCs: WORD,
    SegDs: WORD,
    SegEs: WORD,
    SegFs: WORD,
    SegGs: WORD,
    SegSs: WORD,
    EFlags: DWORD,
    Dr0: DWORD64,
    Dr1: DWORD64,
    Dr2: DWORD64,
    Dr3: DWORD64,
    Dr6: DWORD64,
    Dr7: DWORD64,
    Rax: DWORD64,
    Rcx: DWORD64,
    Rdx: DWORD64,
    Rbx: DWORD64,
    Rsp: DWORD64,
    Rbp: DWORD64,
    Rsi: DWORD64,
    Rdi: DWORD64,
    R8: DWORD64,
    R9: DWORD64,
    R10: DWORD64,
    R11: DWORD64,
    R12: DWORD64,
    R13: DWORD64,
    R14: DWORD64,
    R15: DWORD64,
    Rip: DWORD64,
    u: extern union {
        FltSave: XMM_SAVE_AREA32,
        s: extern struct {
            Header: [2]M128A,
            Legacy: [8]M128A,
            Xmm0: M128A,
            Xmm1: M128A,
            Xmm2: M128A,
            Xmm3: M128A,
            Xmm4: M128A,
            Xmm5: M128A,
            Xmm6: M128A,
            Xmm7: M128A,
            Xmm8: M128A,
            Xmm9: M128A,
            Xmm10: M128A,
            Xmm11: M128A,
            Xmm12: M128A,
            Xmm13: M128A,
            Xmm14: M128A,
            Xmm15: M128A,
        },
    },
    VectorRegister: [26]M128A,
    VectorControl: DWORD64,
    DebugControl: DWORD64,
    LastBranchToRip: DWORD64,
    LastBranchFromRip: DWORD64,
    LastExceptionToRip: DWORD64,
    LastExceptionFromRip: DWORD64,
};
pub const IMAGE_RUNTIME_FUNCTION_ENTRY = extern struct {
    BeginAddress: DWORD,
    EndAddress: DWORD,
    u: extern union {
        UnwindInfoAddress: DWORD,
        UnwindData: DWORD,
    },
};
pub const PRUNTIME_FUNCTION = ?*IMAGE_RUNTIME_FUNCTION_ENTRY;
pub const PCONTEXT = ?*CONTEXT;
pub const EXCEPTION_ROUTINE = extern fn(?*EXCEPTION_RECORD, PVOID, ?*CONTEXT, PVOID) EXCEPTION_DISPOSITION;
pub const PEXCEPTION_ROUTINE = ?*EXCEPTION_ROUTINE;
pub const UNWIND_HISTORY_TABLE_ENTRY = extern struct {
    ImageBase: DWORD64,
    FunctionEntry: PRUNTIME_FUNCTION,
};

pub const UNWIND_HISTORY_TABLE = extern struct {
    Count: DWORD,
    LocalHint: BYTE,
    GlobalHint: BYTE,
    Search: BYTE,
    Once: BYTE,
    LowAddress: DWORD64,
    HighAddress: DWORD64,
    Entry: [12]UNWIND_HISTORY_TABLE_ENTRY,
};
pub const PUNWIND_HISTORY_TABLE = ?*UNWIND_HISTORY_TABLE;
pub const DISPATCHER_CONTEXT = extern struct {
    ControlPc: DWORD64,
    ImageBase: DWORD64,
    FunctionEntry: PRUNTIME_FUNCTION,
    EstablisherFrame: DWORD64,
    TargetIp: DWORD64,
    ContextRecord: PCONTEXT,
    LanguageHandler: PEXCEPTION_ROUTINE,
    HandlerData: PVOID,
    HistoryTable: PUNWIND_HISTORY_TABLE,
    ScopeIndex: DWORD,
    Fill0: DWORD,
};
pub const _crt_locale_data_public = extern struct {
    _locale_pctype: ?*const c_ushort,
    _locale_mb_cur_max: c_int,
    _locale_lc_codepage: c_uint,
};

pub const _crt_locale_data = @OpaqueType();
pub const _crt_multibyte_data = @OpaqueType();
pub const _crt_locale_pointers = extern struct {
    locinfo: ?*_crt_locale_data,
    mbcinfo: ?*_crt_multibyte_data,
};

pub const _locale_t = ?*__crt_locale_pointers;
pub const Mbstatet = extern struct {
    _Wchar: c_ulong,
    _Byte: c_ushort,
    _State: c_ushort,
};
pub const PROCESSOR_NUMBER = extern struct {
    Group: WORD,
    Number: BYTE,
    Reserved: BYTE,
};

pub const PPROCESSOR_NUMBER = ?*PROCESSOR_NUMBER;
pub const GROUP_AFFINITY = extern struct {
    Mask: KAFFINITY,
    Group: WORD,
    Reserved: [3]WORD,
};

pub const PGROUP_AFFINITY = ?*GROUP_AFFINITY;
pub const FLOAT128 = extern struct {
    LowPart: c_longlong,
    HighPart: c_longlong,
};

pub const PFLOAT128 = ?*FLOAT128;
pub const PLONGLONG = ?*LONGLONG;
pub const PULONGLONG = ?*ULONGLONG;
pub const USN = LONGLONG;
pub const LARGE_INTEGER = extern union {
    s: extern struct {
        LowPart: DWORD,
        HighPart: LONG,
    },
    u: extern struct {
        LowPart: DWORD,
        HighPart: LONG,
    },
    QuadPart: LONGLONG,
};

pub const PLARGE_INTEGER = ?*LARGE_INTEGER;
pub const ULARGE_INTEGER = extern union {
    s: extern struct {
        LowPart: DWORD,
        HighPart: DWORD,
    },
    u: extern struct {
        LowPart: DWORD,
        HighPart: DWORD,
    },
    QuadPart: ULONGLONG,
};

pub const PULARGE_INTEGER = ?*ULARGE_INTEGER;
pub const RTL_REFERENCE_COUNT = LONG_PTR;
pub const PRTL_REFERENCE_COUNT = ?*LONG_PTR;
pub const RTL_REFERENCE_COUNT32 = LONG;
pub const PRTL_REFERENCE_COUNT32 = ?*LONG;
pub const LUID = extern struct {
    LowPart: DWORD,
    HighPart: LONG,
};

pub const PLUID = ?*LUID;
pub const DWORDLONG = ULONGLONG;
pub const PDWORDLONG = ?*DWORDLONG;
pub const BOOLEAN = BYTE;
pub const PBOOLEAN = ?*BOOLEAN;
pub const LIST_ENTRY = extern struct {
    Flink: ?*LIST_ENTRY,
    Blink: ?*LIST_ENTRY,
};

pub const PLIST_ENTRY = ?*LIST_ENTRY;
pub const PRLIST_ENTRY = ?*LIST_ENTRY;
pub const SINGLE_LIST_ENTRY = extern struct {
    Next: ?*SINGLE_LIST_ENTRY,
};

pub const PSINGLE_LIST_ENTRY = ?*SINGLE_LIST_ENTRY;
pub const LIST_ENTRY32 = extern struct {
    Flink: DWORD,
    Blink: DWORD,
};

pub const PLIST_ENTRY32 = ?*LIST_ENTRY32;
pub const LIST_ENTRY64 = extern struct {
    Flink: ULONGLONG,
    Blink: ULONGLONG,
};

pub const PLIST_ENTRY64 = ?*LIST_ENTRY64;
pub const GUID = extern struct {
    Data1: c_ulong,
    Data2: c_ushort,
    Data3: c_ushort,
    Data4: [8]u8,
};

pub const LPGUID = ?*GUID;
pub const LPCGUID = ?*const GUID;
pub const IID = GUID;
pub const LPIID = ?*IID;
pub const CLSID = GUID;
pub const LPCLSID = ?*CLSID;
pub const FMTID = GUID;
pub const LPFMTID = ?*FMTID;
pub const OBJECTID = extern struct {
    Lineage: GUID,
    Uniquifier: DWORD,
};

pub const KSPIN_LOCK = ULONG_PTR;
pub const PKSPIN_LOCK = ?*KSPIN_LOCK;
pub const PM128A = ?*M128A;
pub const PXSAVE_FORMAT = ?*XSAVE_FORMAT;
pub const XSAVE_AREA_HEADER = extern struct {
    Mask: DWORD64,
    CompactionMask: DWORD64,
    Reserved2: [6]DWORD64,
};

pub const PXSAVE_AREA_HEADER = ?*XSAVE_AREA_HEADER;
pub const XSAVE_AREA = extern struct {
    LegacyState: XSAVE_FORMAT,
    Header: XSAVE_AREA_HEADER,
};

pub const PXSAVE_AREA = ?*XSAVE_AREA;
pub const XSTATE_CONTEXT = extern struct {
    Mask: DWORD64,
    Length: DWORD,
    Reserved1: DWORD,
    Area: PXSAVE_AREA,
    Buffer: PVOID,
};

pub const PXSTATE_CONTEXT = ?*XSTATE_CONTEXT;
pub const SCOPE_TABLE_AMD64 = extern struct {
    Count: DWORD,
    ScopeRecord: [1]extern struct {
        BeginAddress: DWORD,
        EndAddress: DWORD,
        HandlerAddress: DWORD,
        JumpTarget: DWORD,
    },
};

pub const PSCOPE_TABLE_AMD64 = ?*SCOPE_TABLE_AMD64;
pub const PXMM_SAVE_AREA32 = ?*XSAVE_FORMAT;

pub const RUNTIME_FUNCTION = IMAGE_RUNTIME_FUNCTION_ENTRY;
pub const SCOPE_TABLE = SCOPE_TABLE_AMD64;
pub const PSCOPE_TABLE = ?*SCOPE_TABLE_AMD64;
pub const PUNWIND_HISTORY_TABLE_ENTRY = ?*UNWIND_HISTORY_TABLE_ENTRY;

pub const GET_RUNTIME_FUNCTION_CALLBACK = extern fn(DWORD64, PVOID) PRUNTIME_FUNCTION;
pub const PGET_RUNTIME_FUNCTION_CALLBACK = ?*GET_RUNTIME_FUNCTION_CALLBACK;
pub const OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK = extern fn(HANDLE, PVOID, PDWORD, ?*PRUNTIME_FUNCTION) DWORD;
pub const POUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK = ?*OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK;

pub const PDISPATCHER_CONTEXT = ?*DISPATCHER_CONTEXT;

pub const PEXCEPTION_RECORD = ?*EXCEPTION_RECORD;
pub const EXCEPTION_POINTERS = extern struct {
    ExceptionRecord: PEXCEPTION_RECORD,
    ContextRecord: PCONTEXT,
};
pub const PEXCEPTION_FILTER = ?extern fn(?*EXCEPTION_POINTERS, PVOID) LONG;
pub const PTERMINATION_HANDLER = ?extern fn(BOOLEAN, PVOID) void;
pub const KNONVOLATILE_CONTEXT_POINTERS = extern struct {
    u: extern union {
        FloatingContext: [16]PM128A,
        s: extern struct {
            Xmm0: PM128A,
            Xmm1: PM128A,
            Xmm2: PM128A,
            Xmm3: PM128A,
            Xmm4: PM128A,
            Xmm5: PM128A,
            Xmm6: PM128A,
            Xmm7: PM128A,
            Xmm8: PM128A,
            Xmm9: PM128A,
            Xmm10: PM128A,
            Xmm11: PM128A,
            Xmm12: PM128A,
            Xmm13: PM128A,
            Xmm14: PM128A,
            Xmm15: PM128A,
        },
    },
    u2: extern union {
        IntegerContext: [16]PDWORD64,
        s: extern struct {
            Rax: PDWORD64,
            Rcx: PDWORD64,
            Rdx: PDWORD64,
            Rbx: PDWORD64,
            Rsp: PDWORD64,
            Rbp: PDWORD64,
            Rsi: PDWORD64,
            Rdi: PDWORD64,
            R8: PDWORD64,
            R9: PDWORD64,
            R10: PDWORD64,
            R11: PDWORD64,
            R12: PDWORD64,
            R13: PDWORD64,
            R14: PDWORD64,
            R15: PDWORD64,
        },
    },
};

pub const PKNONVOLATILE_CONTEXT_POINTERS = ?*KNONVOLATILE_CONTEXT_POINTERS;
pub const SCOPE_TABLE_ARM = extern struct {
    Count: DWORD,
    ScopeRecord: [1]extern struct {
        BeginAddress: DWORD,
        EndAddress: DWORD,
        HandlerAddress: DWORD,
        JumpTarget: DWORD,
    },
};

pub const PSCOPE_TABLE_ARM = ?*SCOPE_TABLE_ARM;
pub const SCOPE_TABLE_ARM64 = extern struct {
    Count: DWORD,
    ScopeRecord: [1]extern struct {
        BeginAddress: DWORD,
        EndAddress: DWORD,
        HandlerAddress: DWORD,
        JumpTarget: DWORD,
    },
};

pub const PSCOPE_TABLE_ARM64 = ?*SCOPE_TABLE_ARM64;
pub const KNONVOLATILE_CONTEXT_POINTERS_ARM64 = extern struct {
    X19: PDWORD64,
    X20: PDWORD64,
    X21: PDWORD64,
    X22: PDWORD64,
    X23: PDWORD64,
    X24: PDWORD64,
    X25: PDWORD64,
    X26: PDWORD64,
    X27: PDWORD64,
    X28: PDWORD64,
    Fp: PDWORD64,
    Lr: PDWORD64,
    D8: PDWORD64,
    D9: PDWORD64,
    D10: PDWORD64,
    D11: PDWORD64,
    D12: PDWORD64,
    D13: PDWORD64,
    D14: PDWORD64,
    D15: PDWORD64,
};

pub const PKNONVOLATILE_CONTEXT_POINTERS_ARM64 = ?*KNONVOLATILE_CONTEXT_POINTERS_ARM64;
pub const LDT_ENTRY = extern struct {
    LimitLow: WORD,
    BaseLow: WORD,
    HighWord: extern union {
        Bytes: extern struct {
            BaseMid: BYTE,
            Flags1: BYTE,
            Flags2: BYTE,
            BaseHi: BYTE,
        },
        Bits: packed struct {
          BaseMid: @IntType(false, 8),
          Type: @IntType(false, 5),
          Dpl: @IntType(false, 2),
          Pres: @IntType(false, 1),
          LimitHi: @IntType(false, 4),
          Sys: @IntType(false, 1),
          Reserved_0: @IntType(false, 1),
          Default_Big: @IntType(false, 1),
          Granularity: @IntType(false, 1),
          BaseHi: @IntType(false, 8),
        },
    },
};

pub const PLDT_ENTRY = ?*LDT_ENTRY;
pub const WOW64_FLOATING_SAVE_AREA = extern struct {
    ControlWord: DWORD,
    StatusWord: DWORD,
    TagWord: DWORD,
    ErrorOffset: DWORD,
    ErrorSelector: DWORD,
    DataOffset: DWORD,
    DataSelector: DWORD,
    RegisterArea: [80]BYTE,
    Cr0NpxState: DWORD,
};

pub const PWOW64_FLOATING_SAVE_AREA = ?*WOW64_FLOATING_SAVE_AREA;
pub const WOW64_CONTEXT = extern struct {
    ContextFlags: DWORD,
    Dr0: DWORD,
    Dr1: DWORD,
    Dr2: DWORD,
    Dr3: DWORD,
    Dr6: DWORD,
    Dr7: DWORD,
    FloatSave: WOW64_FLOATING_SAVE_AREA,
    SegGs: DWORD,
    SegFs: DWORD,
    SegEs: DWORD,
    SegDs: DWORD,
    Edi: DWORD,
    Esi: DWORD,
    Ebx: DWORD,
    Edx: DWORD,
    Ecx: DWORD,
    Eax: DWORD,
    Ebp: DWORD,
    Eip: DWORD,
    SegCs: DWORD,
    EFlags: DWORD,
    Esp: DWORD,
    SegSs: DWORD,
    ExtendedRegisters: [512]BYTE,
};

pub const PWOW64_CONTEXT = ?*WOW64_CONTEXT;
pub const WOW64_LDT_ENTRY = extern struct {
    LimitLow: WORD,
    BaseLow: WORD,
    HighWord: extern union {
        Bytes: extern struct {
            BaseMid: BYTE,
            Flags1: BYTE,
            Flags2: BYTE,
            BaseHi: BYTE,
        },
        Bits: packed struct {
          BaseMid: @IntType(false, 8),
          Type: @IntType(false, 5),
          Dpl: @IntType(false, 2),
          Pres: @IntType(false, 1),
          LimitHi: @IntType(false, 4),
          Sys: @IntType(false, 1),
          Reserved_0: @IntType(false, 1),
          Default_Big: @IntType(false, 1),
          Granularity: @IntType(false, 1),
          BaseHi: @IntType(false, 8),
        },
    },
};

pub const PWOW64_LDT_ENTRY = ?*WOW64_LDT_ENTRY;
pub const WOW64_DESCRIPTOR_TABLE_ENTRY = extern struct {
    Selector: DWORD,
    Descriptor: WOW64_LDT_ENTRY,
};

pub const PWOW64_DESCRIPTOR_TABLE_ENTRY = ?*WOW64_DESCRIPTOR_TABLE_ENTRY;
pub const EXCEPTION_RECORD32 = extern struct {
    ExceptionCode: DWORD,
    ExceptionFlags: DWORD,
    ExceptionRecord: DWORD,
    ExceptionAddress: DWORD,
    NumberParameters: DWORD,
    ExceptionInformation: [15]DWORD,
};

pub const PEXCEPTION_RECORD32 = ?*EXCEPTION_RECORD32;
pub const EXCEPTION_RECORD64 = extern struct {
    ExceptionCode: DWORD,
    ExceptionFlags: DWORD,
    ExceptionRecord: DWORD64,
    ExceptionAddress: DWORD64,
    NumberParameters: DWORD,
    __unusedAlignment: DWORD,
    ExceptionInformation: [15]DWORD64,
};

pub const PEXCEPTION_RECORD64 = ?*EXCEPTION_RECORD64;

pub const PEXCEPTION_POINTERS = ?*EXCEPTION_POINTERS;
pub const GENERIC_MAPPING = extern struct {
    GenericRead: ACCESS_MASK,
    GenericWrite: ACCESS_MASK,
    GenericExecute: ACCESS_MASK,
    GenericAll: ACCESS_MASK,
};

pub const PGENERIC_MAPPING = ?*GENERIC_MAPPING;
pub const LUID_AND_ATTRIBUTES = extern struct {
    Luid: LUID,
    Attributes: DWORD,
};

pub const PLUID_AND_ATTRIBUTES = ?*LUID_AND_ATTRIBUTES;
pub const LUID_AND_ATTRIBUTES_ARRAY = [1]LUID_AND_ATTRIBUTES;
pub const PLUID_AND_ATTRIBUTES_ARRAY = ?*LUID_AND_ATTRIBUTES_ARRAY;
pub const SID_IDENTIFIER_AUTHORITY = extern struct {
    Value: [6]BYTE,
};

pub const PSID_IDENTIFIER_AUTHORITY = ?*SID_IDENTIFIER_AUTHORITY;
pub const SID = extern struct {
    Revision: BYTE,
    SubAuthorityCount: BYTE,
    IdentifierAuthority: SID_IDENTIFIER_AUTHORITY,
    SubAuthority: [1]DWORD,
};

pub const PISID = ?*SID;
pub const SE_SID = extern union {
    Sid: SID,
    Buffer: [68]BYTE,
};

pub const PSE_SID = ?*SE_SID;
pub const SID_NAME_USE = c_int;

pub const PSID_NAME_USE = ?*SID_NAME_USE;
pub const SID_AND_ATTRIBUTES = extern struct {
    Sid: PSID,
    Attributes: DWORD,
};

pub const PSID_AND_ATTRIBUTES = ?*SID_AND_ATTRIBUTES;
pub const SID_AND_ATTRIBUTES_ARRAY = [1]SID_AND_ATTRIBUTES;
pub const PSID_AND_ATTRIBUTES_ARRAY = ?*SID_AND_ATTRIBUTES_ARRAY;
pub const SID_HASH_ENTRY = ULONG_PTR;
pub const PSID_HASH_ENTRY = ?*ULONG_PTR;
pub const SID_AND_ATTRIBUTES_HASH = extern struct {
    SidCount: DWORD,
    SidAttr: PSID_AND_ATTRIBUTES,
    Hash: [32]SID_HASH_ENTRY,
};

pub const PSID_AND_ATTRIBUTES_HASH = ?*SID_AND_ATTRIBUTES_HASH;
pub const WELL_KNOWN_SID_TYPE = c_int;
pub const ACL = extern struct {
    AclRevision: BYTE,
    Sbz1: BYTE,
    AclSize: WORD,
    AceCount: WORD,
    Sbz2: WORD,
};

pub const PACL = ?*ACL;
pub const ACE_HEADER = extern struct {
    AceType: BYTE,
    AceFlags: BYTE,
    AceSize: WORD,
};

pub const PACE_HEADER = ?*ACE_HEADER;
pub const ACCESS_ALLOWED_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PACCESS_ALLOWED_ACE = ?*ACCESS_ALLOWED_ACE;
pub const ACCESS_DENIED_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PACCESS_DENIED_ACE = ?*ACCESS_DENIED_ACE;
pub const SYSTEM_AUDIT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_AUDIT_ACE = ?*SYSTEM_AUDIT_ACE;
pub const SYSTEM_ALARM_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_ALARM_ACE = ?*SYSTEM_ALARM_ACE;
pub const SYSTEM_RESOURCE_ATTRIBUTE_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_RESOURCE_ATTRIBUTE_ACE = ?*SYSTEM_RESOURCE_ATTRIBUTE_ACE;
pub const SYSTEM_SCOPED_POLICY_ID_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_SCOPED_POLICY_ID_ACE = ?*SYSTEM_SCOPED_POLICY_ID_ACE;
pub const SYSTEM_MANDATORY_LABEL_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_MANDATORY_LABEL_ACE = ?*SYSTEM_MANDATORY_LABEL_ACE;
pub const SYSTEM_PROCESS_TRUST_LABEL_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_PROCESS_TRUST_LABEL_ACE = ?*SYSTEM_PROCESS_TRUST_LABEL_ACE;
pub const SYSTEM_ACCESS_FILTER_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_ACCESS_FILTER_ACE = ?*SYSTEM_ACCESS_FILTER_ACE;
pub const ACCESS_ALLOWED_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PACCESS_ALLOWED_OBJECT_ACE = ?*ACCESS_ALLOWED_OBJECT_ACE;
pub const ACCESS_DENIED_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PACCESS_DENIED_OBJECT_ACE = ?*ACCESS_DENIED_OBJECT_ACE;
pub const SYSTEM_AUDIT_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PSYSTEM_AUDIT_OBJECT_ACE = ?*SYSTEM_AUDIT_OBJECT_ACE;
pub const SYSTEM_ALARM_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PSYSTEM_ALARM_OBJECT_ACE = ?*SYSTEM_ALARM_OBJECT_ACE;
pub const ACCESS_ALLOWED_CALLBACK_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PACCESS_ALLOWED_CALLBACK_ACE = ?*ACCESS_ALLOWED_CALLBACK_ACE;
pub const ACCESS_DENIED_CALLBACK_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PACCESS_DENIED_CALLBACK_ACE = ?*ACCESS_DENIED_CALLBACK_ACE;
pub const SYSTEM_AUDIT_CALLBACK_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_AUDIT_CALLBACK_ACE = ?*SYSTEM_AUDIT_CALLBACK_ACE;
pub const SYSTEM_ALARM_CALLBACK_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    SidStart: DWORD,
};

pub const PSYSTEM_ALARM_CALLBACK_ACE = ?*SYSTEM_ALARM_CALLBACK_ACE;
pub const ACCESS_ALLOWED_CALLBACK_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PACCESS_ALLOWED_CALLBACK_OBJECT_ACE = ?*ACCESS_ALLOWED_CALLBACK_OBJECT_ACE;
pub const ACCESS_DENIED_CALLBACK_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PACCESS_DENIED_CALLBACK_OBJECT_ACE = ?*ACCESS_DENIED_CALLBACK_OBJECT_ACE;
pub const SYSTEM_AUDIT_CALLBACK_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PSYSTEM_AUDIT_CALLBACK_OBJECT_ACE = ?*SYSTEM_AUDIT_CALLBACK_OBJECT_ACE;
pub const SYSTEM_ALARM_CALLBACK_OBJECT_ACE = extern struct {
    Header: ACE_HEADER,
    Mask: ACCESS_MASK,
    Flags: DWORD,
    ObjectType: GUID,
    InheritedObjectType: GUID,
    SidStart: DWORD,
};

pub const PSYSTEM_ALARM_CALLBACK_OBJECT_ACE = ?*SYSTEM_ALARM_CALLBACK_OBJECT_ACE;
pub const ACL_INFORMATION_CLASS = c_int;

pub const ACL_REVISION_INFORMATION = extern struct {
    AclRevision: DWORD,
};

pub const PACL_REVISION_INFORMATION = ?*ACL_REVISION_INFORMATION;
pub const ACL_SIZE_INFORMATION = extern struct {
    AceCount: DWORD,
    AclBytesInUse: DWORD,
    AclBytesFree: DWORD,
};

pub const PACL_SIZE_INFORMATION = ?*ACL_SIZE_INFORMATION;
pub const SECURITY_DESCRIPTOR_CONTROL = WORD;
pub const PSECURITY_DESCRIPTOR_CONTROL = ?*WORD;
pub const SECURITY_DESCRIPTOR_RELATIVE = extern struct {
    Revision: BYTE,
    Sbz1: BYTE,
    Control: SECURITY_DESCRIPTOR_CONTROL,
    Owner: DWORD,
    Group: DWORD,
    Sacl: DWORD,
    Dacl: DWORD,
};

pub const PISECURITY_DESCRIPTOR_RELATIVE = ?*SECURITY_DESCRIPTOR_RELATIVE;
pub const SECURITY_DESCRIPTOR = extern struct {
    Revision: BYTE,
    Sbz1: BYTE,
    Control: SECURITY_DESCRIPTOR_CONTROL,
    Owner: PSID,
    Group: PSID,
    Sacl: PACL,
    Dacl: PACL,
};

pub const PISECURITY_DESCRIPTOR = ?*SECURITY_DESCRIPTOR;
pub const SECURITY_OBJECT_AI_PARAMS = extern struct {
    Size: DWORD,
    ConstraintMask: DWORD,
};

pub const PSECURITY_OBJECT_AI_PARAMS = ?*SECURITY_OBJECT_AI_PARAMS;
pub const OBJECT_TYPE_LIST = extern struct {
    Level: WORD,
    Sbz: WORD,
    ObjectType: ?*GUID,
};

pub const POBJECT_TYPE_LIST = ?*OBJECT_TYPE_LIST;
pub const AuditEventObjectAccess = AUDIT_EVENT_TYPE.AuditEventObjectAccess;
pub const AuditEventDirectoryServiceAccess = AUDIT_EVENT_TYPE.AuditEventDirectoryServiceAccess;
pub const AUDIT_EVENT_TYPE = extern enum {
    AuditEventObjectAccess,
    AuditEventDirectoryServiceAccess,
};

pub const PAUDIT_EVENT_TYPE = ?*AUDIT_EVENT_TYPE;
pub const PRIVILEGE_SET = extern struct {
    PrivilegeCount: DWORD,
    Control: DWORD,
    Privilege: [1]LUID_AND_ATTRIBUTES,
};

pub const PPRIVILEGE_SET = ?*PRIVILEGE_SET;
pub const ACCESS_REASON_TYPE = c_int;

pub const ACCESS_REASON = DWORD;
pub const ACCESS_REASONS = extern struct {
    Data: [32]ACCESS_REASON,
};

pub const PACCESS_REASONS = ?*ACCESS_REASONS;
pub const SE_SECURITY_DESCRIPTOR = extern struct {
    Size: DWORD,
    Flags: DWORD,
    SecurityDescriptor: PSECURITY_DESCRIPTOR,
};

pub const PSE_SECURITY_DESCRIPTOR = ?*SE_SECURITY_DESCRIPTOR;
pub const SE_ACCESS_REQUEST = extern struct {
    Size: DWORD,
    SeSecurityDescriptor: PSE_SECURITY_DESCRIPTOR,
    DesiredAccess: ACCESS_MASK,
    PreviouslyGrantedAccess: ACCESS_MASK,
    PrincipalSelfSid: PSID,
    GenericMapping: PGENERIC_MAPPING,
    ObjectTypeListCount: DWORD,
    ObjectTypeList: POBJECT_TYPE_LIST,
};

pub const PSE_ACCESS_REQUEST = ?*SE_ACCESS_REQUEST;
pub const SE_ACCESS_REPLY = extern struct {
    Size: DWORD,
    ResultListCount: DWORD,
    GrantedAccess: PACCESS_MASK,
    AccessStatus: PDWORD,
    AccessReason: PACCESS_REASONS,
    Privileges: ?*PPRIVILEGE_SET,
};

pub const PSE_ACCESS_REPLY = ?*SE_ACCESS_REPLY;
pub const SecurityAnonymous = SECURITY_IMPERSONATION_LEVEL.SecurityAnonymous;
pub const SecurityIdentification = SECURITY_IMPERSONATION_LEVEL.SecurityIdentification;
pub const SecurityImpersonation = SECURITY_IMPERSONATION_LEVEL.SecurityImpersonation;
pub const SecurityDelegation = SECURITY_IMPERSONATION_LEVEL.SecurityDelegation;
pub const SECURITY_IMPERSONATION_LEVEL = extern enum {
    SecurityAnonymous,
    SecurityIdentification,
    SecurityImpersonation,
    SecurityDelegation,
};

pub const PSECURITY_IMPERSONATION_LEVEL = ?*SECURITY_IMPERSONATION_LEVEL;
pub const TOKEN_TYPE = c_int;

pub const PTOKEN_TYPE = ?*TOKEN_TYPE;
pub const TOKEN_ELEVATION_TYPE = c_int;

pub const PTOKEN_ELEVATION_TYPE = ?*TOKEN_ELEVATION_TYPE;
pub const TOKEN_INFORMATION_CLASS = c_int;

pub const PTOKEN_INFORMATION_CLASS = ?*TOKEN_INFORMATION_CLASS;
pub const TOKEN_USER = extern struct {
    User: SID_AND_ATTRIBUTES,
};

pub const PTOKEN_USER = ?*TOKEN_USER;
pub const SE_TOKEN_USER = extern struct {
    u: extern union {
        TokenUser: TOKEN_USER,
        User: SID_AND_ATTRIBUTES,
    },
    u2: extern union {
        Sid: SID,
        Buffer: [68]BYTE,
    },
};

pub const PSE_TOKEN_USER = SE_TOKEN_USER;
pub const TOKEN_GROUPS = extern struct {
    GroupCount: DWORD,
    Groups: [1]SID_AND_ATTRIBUTES,
};

pub const PTOKEN_GROUPS = ?*TOKEN_GROUPS;
pub const TOKEN_PRIVILEGES = extern struct {
    PrivilegeCount: DWORD,
    Privileges: [1]LUID_AND_ATTRIBUTES,
};

pub const PTOKEN_PRIVILEGES = ?*TOKEN_PRIVILEGES;
pub const TOKEN_OWNER = extern struct {
    Owner: PSID,
};

pub const PTOKEN_OWNER = ?*TOKEN_OWNER;
pub const TOKEN_PRIMARY_GROUP = extern struct {
    PrimaryGroup: PSID,
};

pub const PTOKEN_PRIMARY_GROUP = ?*TOKEN_PRIMARY_GROUP;
pub const TOKEN_DEFAULT_DACL = extern struct {
    DefaultDacl: PACL,
};

pub const PTOKEN_DEFAULT_DACL = ?*TOKEN_DEFAULT_DACL;
pub const TOKEN_USER_CLAIMS = extern struct {
    UserClaims: PCLAIMS_BLOB,
};

pub const PTOKEN_USER_CLAIMS = ?*TOKEN_USER_CLAIMS;
pub const TOKEN_DEVICE_CLAIMS = extern struct {
    DeviceClaims: PCLAIMS_BLOB,
};

pub const PTOKEN_DEVICE_CLAIMS = ?*TOKEN_DEVICE_CLAIMS;
pub const TOKEN_GROUPS_AND_PRIVILEGES = extern struct {
    SidCount: DWORD,
    SidLength: DWORD,
    Sids: PSID_AND_ATTRIBUTES,
    RestrictedSidCount: DWORD,
    RestrictedSidLength: DWORD,
    RestrictedSids: PSID_AND_ATTRIBUTES,
    PrivilegeCount: DWORD,
    PrivilegeLength: DWORD,
    Privileges: PLUID_AND_ATTRIBUTES,
    AuthenticationId: LUID,
};

pub const PTOKEN_GROUPS_AND_PRIVILEGES = ?*TOKEN_GROUPS_AND_PRIVILEGES;
pub const TOKEN_LINKED_TOKEN = extern struct {
    LinkedToken: HANDLE,
};

pub const PTOKEN_LINKED_TOKEN = ?*TOKEN_LINKED_TOKEN;
pub const TOKEN_ELEVATION = extern struct {
    TokenIsElevated: DWORD,
};

pub const PTOKEN_ELEVATION = ?*TOKEN_ELEVATION;
pub const TOKEN_MANDATORY_LABEL = extern struct {
    Label: SID_AND_ATTRIBUTES,
};

pub const PTOKEN_MANDATORY_LABEL = ?*TOKEN_MANDATORY_LABEL;
pub const TOKEN_MANDATORY_POLICY = extern struct {
    Policy: DWORD,
};

pub const PTOKEN_MANDATORY_POLICY = ?*TOKEN_MANDATORY_POLICY;
pub const PSECURITY_ATTRIBUTES_OPAQUE = PVOID;
pub const TOKEN_ACCESS_INFORMATION = extern struct {
    SidHash: PSID_AND_ATTRIBUTES_HASH,
    RestrictedSidHash: PSID_AND_ATTRIBUTES_HASH,
    Privileges: PTOKEN_PRIVILEGES,
    AuthenticationId: LUID,
    TokenType: TOKEN_TYPE,
    ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
    MandatoryPolicy: TOKEN_MANDATORY_POLICY,
    Flags: DWORD,
    AppContainerNumber: DWORD,
    PackageSid: PSID,
    CapabilitiesHash: PSID_AND_ATTRIBUTES_HASH,
    TrustLevelSid: PSID,
    SecurityAttributes: PSECURITY_ATTRIBUTES_OPAQUE,
};

pub const PTOKEN_ACCESS_INFORMATION = ?*TOKEN_ACCESS_INFORMATION;
pub const TOKEN_AUDIT_POLICY = extern struct {
    PerUserPolicy: [30]BYTE,
};

pub const PTOKEN_AUDIT_POLICY = ?*TOKEN_AUDIT_POLICY;
pub const TOKEN_SOURCE = extern struct {
    SourceName: [8]CHAR,
    SourceIdentifier: LUID,
};

pub const PTOKEN_SOURCE = ?*TOKEN_SOURCE;
pub const TOKEN_STATISTICS = extern struct {
    TokenId: LUID,
    AuthenticationId: LUID,
    ExpirationTime: LARGE_INTEGER,
    TokenType: TOKEN_TYPE,
    ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
    DynamicCharged: DWORD,
    DynamicAvailable: DWORD,
    GroupCount: DWORD,
    PrivilegeCount: DWORD,
    ModifiedId: LUID,
};

pub const PTOKEN_STATISTICS = ?*TOKEN_STATISTICS;
pub const TOKEN_CONTROL = extern struct {
    TokenId: LUID,
    AuthenticationId: LUID,
    ModifiedId: LUID,
    TokenSource: TOKEN_SOURCE,
};

pub const PTOKEN_CONTROL = ?*TOKEN_CONTROL;
pub const TOKEN_ORIGIN = extern struct {
    OriginatingLogonSession: LUID,
};

pub const PTOKEN_ORIGIN = ?*TOKEN_ORIGIN;
pub const MANDATORY_LEVEL = c_int;

pub const PMANDATORY_LEVEL = ?*MANDATORY_LEVEL;
pub const TOKEN_APPCONTAINER_INFORMATION = extern struct {
    TokenAppContainer: PSID,
};

pub const PTOKEN_APPCONTAINER_INFORMATION = ?*TOKEN_APPCONTAINER_INFORMATION;
pub const TOKEN_SID_INFORMATION = extern struct {
    Sid: PSID,
};

pub const PTOKEN_SID_INFORMATION = ?*TOKEN_SID_INFORMATION;
pub const TOKEN_BNO_ISOLATION_INFORMATION = extern struct {
    IsolationPrefix: PWSTR,
    IsolationEnabled: BOOLEAN,
};

pub const PTOKEN_BNO_ISOLATION_INFORMATION = ?*TOKEN_BNO_ISOLATION_INFORMATION;
pub const CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE = extern struct {
    Version: DWORD64,
    Name: PWSTR,
};

pub const PCLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE = ?*CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE;
pub const CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE = extern struct {
    pValue: PVOID,
    ValueLength: DWORD,
};

pub const PCLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE = ?*CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE;
pub const CLAIM_SECURITY_ATTRIBUTE_V1 = extern struct {
    Name: PWSTR,
    ValueType: WORD,
    Reserved: WORD,
    Flags: DWORD,
    ValueCount: DWORD,
    Values: extern union {
        pInt64: PLONG64,
        pUint64: PDWORD64,
        ppString: ?*PWSTR,
        pFqbn: PCLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE,
        pOctetString: PCLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE,
    },
};

pub const PCLAIM_SECURITY_ATTRIBUTE_V1 = ?*CLAIM_SECURITY_ATTRIBUTE_V1;
pub const CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 = extern struct {
    Name: DWORD,
    ValueType: WORD,
    Reserved: WORD,
    Flags: DWORD,
    ValueCount: DWORD,
    Values: extern union {
        pInt64: [1]DWORD,
        pUint64: [1]DWORD,
        ppString: [1]DWORD,
        pFqbn: [1]DWORD,
        pOctetString: [1]DWORD,
    },
};

pub const PCLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 = ?*CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1;
pub const CLAIM_SECURITY_ATTRIBUTES_INFORMATION = extern struct {
    Version: WORD,
    Reserved: WORD,
    AttributeCount: DWORD,
    Attribute: extern union {
        pAttributeV1: PCLAIM_SECURITY_ATTRIBUTE_V1,
    },
};

pub const PCLAIM_SECURITY_ATTRIBUTES_INFORMATION = ?*CLAIM_SECURITY_ATTRIBUTES_INFORMATION;
pub const SECURITY_CONTEXT_TRACKING_MODE = BOOLEAN;
pub const PSECURITY_CONTEXT_TRACKING_MODE = ?*BOOLEAN;
pub const SECURITY_QUALITY_OF_SERVICE = extern struct {
    Length: DWORD,
    ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
    ContextTrackingMode: SECURITY_CONTEXT_TRACKING_MODE,
    EffectiveOnly: BOOLEAN,
};

pub const PSECURITY_QUALITY_OF_SERVICE = ?*SECURITY_QUALITY_OF_SERVICE;
pub const SE_IMPERSONATION_STATE = extern struct {
    Token: PACCESS_TOKEN,
    CopyOnOpen: BOOLEAN,
    EffectiveOnly: BOOLEAN,
    Level: SECURITY_IMPERSONATION_LEVEL,
};

pub const PSE_IMPERSONATION_STATE = ?*SE_IMPERSONATION_STATE;
pub const SECURITY_INFORMATION = DWORD;
pub const PSECURITY_INFORMATION = ?*DWORD;
pub const SE_SIGNING_LEVEL = BYTE;
pub const PSE_SIGNING_LEVEL = ?*BYTE;
pub const SE_IMAGE_SIGNATURE_TYPE = c_int;

pub const PSE_IMAGE_SIGNATURE_TYPE = ?*SE_IMAGE_SIGNATURE_TYPE;
pub const SE_LEARNING_MODE_DATA_TYPE = c_int;

pub const SECURITY_CAPABILITIES = extern struct {
    AppContainerSid: PSID,
    Capabilities: PSID_AND_ATTRIBUTES,
    CapabilityCount: DWORD,
    Reserved: DWORD,
};

pub const PSECURITY_CAPABILITIES = ?*SECURITY_CAPABILITIES;
pub const LPSECURITY_CAPABILITIES = ?*SECURITY_CAPABILITIES;
pub const JOB_SET_ARRAY = extern struct {
    JobHandle: HANDLE,
    MemberLevel: DWORD,
    Flags: DWORD,
};

pub const PJOB_SET_ARRAY = ?*JOB_SET_ARRAY;
pub const EXCEPTION_REGISTRATION_RECORD = extern struct {
    Next: ?*EXCEPTION_REGISTRATION_RECORD,
    Handler: PEXCEPTION_ROUTINE,
};

pub const PEXCEPTION_REGISTRATION_RECORD = ?*EXCEPTION_REGISTRATION_RECORD;
pub const NT_TIB = extern struct {
    ExceptionList: ?*EXCEPTION_REGISTRATION_RECORD,
    StackBase: PVOID,
    StackLimit: PVOID,
    SubSystemTib: PVOID,
    u: extern union {
        FiberData: PVOID,
        Version: DWORD,
    },
    ArbitraryUserPointer: PVOID,
    Self: ?*NT_TIB,
};

pub const PNT_TIB = ?*NT_TIB;
pub const NT_TIB32 = extern struct {
    ExceptionList: DWORD,
    StackBase: DWORD,
    StackLimit: DWORD,
    SubSystemTib: DWORD,
    u: extern union {
        FiberData: DWORD,
        Version: DWORD,
    },
    ArbitraryUserPointer: DWORD,
    Self: DWORD,
};

pub const PNT_TIB32 = ?*NT_TIB32;
pub const NT_TIB64 = extern struct {
    ExceptionList: DWORD64,
    StackBase: DWORD64,
    StackLimit: DWORD64,
    SubSystemTib: DWORD64,
    u: extern union {
        FiberData: DWORD64,
        Version: DWORD,
    },
    ArbitraryUserPointer: DWORD64,
    Self: DWORD64,
};

pub const PNT_TIB64 = ?*NT_TIB64;
pub const UMS_CREATE_THREAD_ATTRIBUTES = extern struct {
    UmsVersion: DWORD,
    UmsContext: PVOID,
    UmsCompletionList: PVOID,
};

pub const PUMS_CREATE_THREAD_ATTRIBUTES = ?*UMS_CREATE_THREAD_ATTRIBUTES;
pub const WOW64_ARCHITECTURE_INFORMATION = packed struct {
    Machine: @IntType(false, 16),
    KernelMode: @IntType(false, 1),
    UserMode: @IntType(false, 1),
    Native: @IntType(false, 1),
    Process: @IntType(false, 1),
    ReservedZero0: @IntType(false, 12),
};

pub const QUOTA_LIMITS = extern struct {
    PagedPoolLimit: SIZE_T,
    NonPagedPoolLimit: SIZE_T,
    MinimumWorkingSetSize: SIZE_T,
    MaximumWorkingSetSize: SIZE_T,
    PagefileLimit: SIZE_T,
    TimeLimit: LARGE_INTEGER,
};

pub const PQUOTA_LIMITS = ?*QUOTA_LIMITS;
pub const RATE_QUOTA_LIMIT = extern union {
    RateData: DWORD,
    s: packed struct {
        RatePercent: u7,
        Reserved0: @IntType(false, 25),
    },
};

pub const PRATE_QUOTA_LIMIT = ?*RATE_QUOTA_LIMIT;
pub const QUOTA_LIMITS_EX = extern struct {
    PagedPoolLimit: SIZE_T,
    NonPagedPoolLimit: SIZE_T,
    MinimumWorkingSetSize: SIZE_T,
    MaximumWorkingSetSize: SIZE_T,
    PagefileLimit: SIZE_T,
    TimeLimit: LARGE_INTEGER,
    WorkingSetLimit: SIZE_T,
    Reserved2: SIZE_T,
    Reserved3: SIZE_T,
    Reserved4: SIZE_T,
    Flags: DWORD,
    CpuRateLimit: RATE_QUOTA_LIMIT,
};

pub const PQUOTA_LIMITS_EX = ?*QUOTA_LIMITS_EX;
pub const IO_COUNTERS = extern struct {
    ReadOperationCount: ULONGLONG,
    WriteOperationCount: ULONGLONG,
    OtherOperationCount: ULONGLONG,
    ReadTransferCount: ULONGLONG,
    WriteTransferCount: ULONGLONG,
    OtherTransferCount: ULONGLONG,
};

pub const PIO_COUNTERS = ?*IO_COUNTERS;
pub const PMCCounter = HARDWARE_COUNTER_TYPE.PMCCounter;
pub const MaxHardwareCounterType = HARDWARE_COUNTER_TYPE.MaxHardwareCounterType;
pub const HARDWARE_COUNTER_TYPE = extern enum {
    PMCCounter,
    MaxHardwareCounterType,
};

pub const PHARDWARE_COUNTER_TYPE = ?*HARDWARE_COUNTER_TYPE;
pub const ProcessDEPPolicy = PROCESS_MITIGATION_POLICY.ProcessDEPPolicy;
pub const ProcessASLRPolicy = PROCESS_MITIGATION_POLICY.ProcessASLRPolicy;
pub const ProcessDynamicCodePolicy = PROCESS_MITIGATION_POLICY.ProcessDynamicCodePolicy;
pub const ProcessStrictHandleCheckPolicy = PROCESS_MITIGATION_POLICY.ProcessStrictHandleCheckPolicy;
pub const ProcessSystemCallDisablePolicy = PROCESS_MITIGATION_POLICY.ProcessSystemCallDisablePolicy;
pub const ProcessMitigationOptionsMask = PROCESS_MITIGATION_POLICY.ProcessMitigationOptionsMask;
pub const ProcessExtensionPointDisablePolicy = PROCESS_MITIGATION_POLICY.ProcessExtensionPointDisablePolicy;
pub const ProcessControlFlowGuardPolicy = PROCESS_MITIGATION_POLICY.ProcessControlFlowGuardPolicy;
pub const ProcessSignaturePolicy = PROCESS_MITIGATION_POLICY.ProcessSignaturePolicy;
pub const ProcessFontDisablePolicy = PROCESS_MITIGATION_POLICY.ProcessFontDisablePolicy;
pub const ProcessImageLoadPolicy = PROCESS_MITIGATION_POLICY.ProcessImageLoadPolicy;
pub const ProcessSystemCallFilterPolicy = PROCESS_MITIGATION_POLICY.ProcessSystemCallFilterPolicy;
pub const ProcessPayloadRestrictionPolicy = PROCESS_MITIGATION_POLICY.ProcessPayloadRestrictionPolicy;
pub const ProcessChildProcessPolicy = PROCESS_MITIGATION_POLICY.ProcessChildProcessPolicy;
pub const MaxProcessMitigationPolicy = PROCESS_MITIGATION_POLICY.MaxProcessMitigationPolicy;
pub const PROCESS_MITIGATION_POLICY = extern enum {
    ProcessDEPPolicy,
    ProcessASLRPolicy,
    ProcessDynamicCodePolicy,
    ProcessStrictHandleCheckPolicy,
    ProcessSystemCallDisablePolicy,
    ProcessMitigationOptionsMask,
    ProcessExtensionPointDisablePolicy,
    ProcessControlFlowGuardPolicy,
    ProcessSignaturePolicy,
    ProcessFontDisablePolicy,
    ProcessImageLoadPolicy,
    ProcessSystemCallFilterPolicy,
    ProcessPayloadRestrictionPolicy,
    ProcessChildProcessPolicy,
    MaxProcessMitigationPolicy,
};

pub const PPROCESS_MITIGATION_POLICY = ?*PROCESS_MITIGATION_POLICY;
pub const PROCESS_MITIGATION_ASLR_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            EnableBottomUpRandomization: @IntType(false, 1),
            EnableForceRelocateImages: @IntType(false, 1),
            EnableHighEntropy: @IntType(false, 1),
            DisallowStrippedImages: @IntType(false, 1),
            ReservedFlags: @IntType(false, 28),
        },
    },
};

pub const PPROCESS_MITIGATION_ASLR_POLICY = ?*PROCESS_MITIGATION_ASLR_POLICY;
pub const PROCESS_MITIGATION_DEP_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            Enable: @IntType(false, 1),
            DisableAtlThunkEmulation: @IntType(false, 1),
            ReservedFlags: @IntType(false, 30),
        },
    },
    Permanent: BOOLEAN,
};

pub const PPROCESS_MITIGATION_DEP_POLICY = ?*PROCESS_MITIGATION_DEP_POLICY;
pub const PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            RaiseExceptionOnInvalidHandleReference: @IntType(false, 1),
            HandleExceptionsPermanentlyEnabled: @IntType(false, 1),
            ReservedFlags: @IntType(false, 30),
        },
    },
};

pub const PPROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY = ?*PROCESS_MITIGATION_STRICT_HANDLE_CHECK_POLICY;
pub const PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            DisallowWin32kSystemCalls: @IntType(false, 1),
            AuditDisallowWin32kSystemCalls: @IntType(false, 1),
            ReservedFlags: @IntType(false, 30),
        },
    },
};

pub const PPROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY = ?*PROCESS_MITIGATION_SYSTEM_CALL_DISABLE_POLICY;
pub const PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            DisableExtensionPoints: @IntType(false, 1),
            ReservedFlags: @IntType(false, 31),
        },
    },
};

pub const PPROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY = ?*PROCESS_MITIGATION_EXTENSION_POINT_DISABLE_POLICY;
pub const PROCESS_MITIGATION_DYNAMIC_CODE_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            ProhibitDynamicCode: @IntType(false, 1),
            AllowThreadOptOut: @IntType(false, 1),
            AllowRemoteDowngrade: @IntType(false, 1),
            AuditProhibitDynamicCode: @IntType(false, 1),
            ReservedFlags: @IntType(false, 28),
        },
    },
};

pub const PPROCESS_MITIGATION_DYNAMIC_CODE_POLICY = ?*PROCESS_MITIGATION_DYNAMIC_CODE_POLICY;
pub const PROCESS_MITIGATION_CONTROL_FLOW_GUARD_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            EnableControlFlowGuard: @IntType(false, 1),
            EnableExportSuppression: @IntType(false, 1),
            StrictMode: @IntType(false, 1),
            ReservedFlags: @IntType(false, 29),
        },
    },
};

pub const PPROCESS_MITIGATION_CONTROL_FLOW_GUARD_POLICY = ?*PROCESS_MITIGATION_CONTROL_FLOW_GUARD_POLICY;
pub const PROCESS_MITIGATION_BINARY_SIGNATURE_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            MicrosoftSignedOnly: @IntType(false, 1),
            StoreSignedOnly: @IntType(false, 1),
            MitigationOptIn: @IntType(false, 1),
            AuditMicrosoftSignedOnly: @IntType(false, 1),
            AuditStoreSignedOnly: @IntType(false, 1),
            ReservedFlags : @IntType(false, 27),
        },
    },
};

pub const PPROCESS_MITIGATION_BINARY_SIGNATURE_POLICY = ?*PROCESS_MITIGATION_BINARY_SIGNATURE_POLICY;
pub const PROCESS_MITIGATION_FONT_DISABLE_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            DisableNonSystemFonts: @IntType(false, 1),
            AuditNonSystemFontLoading: @IntType(false, 1),
            ReservedFlags: @IntType(false, 30),
        },
    },
};

pub const PPROCESS_MITIGATION_FONT_DISABLE_POLICY = ?*PROCESS_MITIGATION_FONT_DISABLE_POLICY;
pub const PROCESS_MITIGATION_IMAGE_LOAD_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            NoRemoteImages: @IntType(false, 1),
            NoLowMandatoryLabelImages: @IntType(false, 1),
            PreferSystem32Images: @IntType(false, 1),
            AuditNoRemoteImages: @IntType(false, 1),
            AuditNoLowMandatoryLabelImages: @IntType(false, 1),
            ReservedFlags: @IntType(false, 27),
        },
    },
};

pub const PPROCESS_MITIGATION_IMAGE_LOAD_POLICY = ?*PROCESS_MITIGATION_IMAGE_LOAD_POLICY;
pub const PROCESS_MITIGATION_SYSTEM_CALL_FILTER_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            FilterId: @IntType(false, 4),
            ReservedFlags: @IntType(false, 28),
        },
    },
};

pub const PPROCESS_MITIGATION_SYSTEM_CALL_FILTER_POLICY = ?*PROCESS_MITIGATION_SYSTEM_CALL_FILTER_POLICY;
pub const PROCESS_MITIGATION_PAYLOAD_RESTRICTION_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            EnableExportAddressFilter: @IntType(false, 1),
            AuditExportAddressFilter: @IntType(false, 1),

            EnableExportAddressFilterPlus: @IntType(false, 1),
            AuditExportAddressFilterPlus: @IntType(false, 1),

            EnableImportAddressFilter: @IntType(false, 1),
            AuditImportAddressFilter: @IntType(false, 1),

            EnableRopStackPivot: @IntType(false, 1),
            AuditRopStackPivot: @IntType(false, 1),

            EnableRopCallerCheck: @IntType(false, 1),
            AuditRopCallerCheck: @IntType(false, 1),

            EnableRopSimExec: @IntType(false, 1),
            AuditRopSimExec: @IntType(false, 1),

            ReservedFlags: @IntType(false, 20),
        },
    },
};

pub const PPROCESS_MITIGATION_PAYLOAD_RESTRICTION_POLICY = ?*PROCESS_MITIGATION_PAYLOAD_RESTRICTION_POLICY;
pub const PROCESS_MITIGATION_CHILD_PROCESS_POLICY = extern struct {
    u: extern union {
        Flags: DWORD,
        s: packed struct {
            NoChildProcessCreation: @IntType(false, 1),
            AuditNoChildProcessCreation: @IntType(false, 1),
            AllowSecureProcessCreation: @IntType(false, 1),
            ReservedFlags: @IntType(false, 29),
        },
    },
};

pub const PPROCESS_MITIGATION_CHILD_PROCESS_POLICY = ?*PROCESS_MITIGATION_CHILD_PROCESS_POLICY;
pub const JOBOBJECT_BASIC_ACCOUNTING_INFORMATION = extern struct {
    TotalUserTime: LARGE_INTEGER,
    TotalKernelTime: LARGE_INTEGER,
    ThisPeriodTotalUserTime: LARGE_INTEGER,
    ThisPeriodTotalKernelTime: LARGE_INTEGER,
    TotalPageFaultCount: DWORD,
    TotalProcesses: DWORD,
    ActiveProcesses: DWORD,
    TotalTerminatedProcesses: DWORD,
};

pub const PJOBOBJECT_BASIC_ACCOUNTING_INFORMATION = ?*JOBOBJECT_BASIC_ACCOUNTING_INFORMATION;
pub const JOBOBJECT_BASIC_LIMIT_INFORMATION = extern struct {
    PerProcessUserTimeLimit: LARGE_INTEGER,
    PerJobUserTimeLimit: LARGE_INTEGER,
    LimitFlags: DWORD,
    MinimumWorkingSetSize: SIZE_T,
    MaximumWorkingSetSize: SIZE_T,
    ActiveProcessLimit: DWORD,
    Affinity: ULONG_PTR,
    PriorityClass: DWORD,
    SchedulingClass: DWORD,
};

pub const PJOBOBJECT_BASIC_LIMIT_INFORMATION = ?*JOBOBJECT_BASIC_LIMIT_INFORMATION;
pub const JOBOBJECT_EXTENDED_LIMIT_INFORMATION = extern struct {
    BasicLimitInformation: JOBOBJECT_BASIC_LIMIT_INFORMATION,
    IoInfo: IO_COUNTERS,
    ProcessMemoryLimit: SIZE_T,
    JobMemoryLimit: SIZE_T,
    PeakProcessMemoryUsed: SIZE_T,
    PeakJobMemoryUsed: SIZE_T,
};

pub const PJOBOBJECT_EXTENDED_LIMIT_INFORMATION = ?*JOBOBJECT_EXTENDED_LIMIT_INFORMATION;
pub const JOBOBJECT_BASIC_PROCESS_ID_LIST = extern struct {
    NumberOfAssignedProcesses: DWORD,
    NumberOfProcessIdsInList: DWORD,
    ProcessIdList: [1]ULONG_PTR,
};

pub const PJOBOBJECT_BASIC_PROCESS_ID_LIST = ?*JOBOBJECT_BASIC_PROCESS_ID_LIST;
pub const JOBOBJECT_BASIC_UI_RESTRICTIONS = extern struct {
    UIRestrictionsClass: DWORD,
};

pub const PJOBOBJECT_BASIC_UI_RESTRICTIONS = ?*JOBOBJECT_BASIC_UI_RESTRICTIONS;
pub const JOBOBJECT_SECURITY_LIMIT_INFORMATION = extern struct {
    SecurityLimitFlags: DWORD,
    JobToken: HANDLE,
    SidsToDisable: PTOKEN_GROUPS,
    PrivilegesToDelete: PTOKEN_PRIVILEGES,
    RestrictedSids: PTOKEN_GROUPS,
};

pub const PJOBOBJECT_SECURITY_LIMIT_INFORMATION = ?*JOBOBJECT_SECURITY_LIMIT_INFORMATION;
pub const JOBOBJECT_END_OF_JOB_TIME_INFORMATION = extern struct {
    EndOfJobTimeAction: DWORD,
};

pub const PJOBOBJECT_END_OF_JOB_TIME_INFORMATION = ?*JOBOBJECT_END_OF_JOB_TIME_INFORMATION;
pub const JOBOBJECT_ASSOCIATE_COMPLETION_PORT = extern struct {
    CompletionKey: PVOID,
    CompletionPort: HANDLE,
};

pub const PJOBOBJECT_ASSOCIATE_COMPLETION_PORT = ?*JOBOBJECT_ASSOCIATE_COMPLETION_PORT;
pub const JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION = extern struct {
    BasicInfo: JOBOBJECT_BASIC_ACCOUNTING_INFORMATION,
    IoInfo: IO_COUNTERS,
};

pub const PJOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION = ?*JOBOBJECT_BASIC_AND_IO_ACCOUNTING_INFORMATION;
pub const JOBOBJECT_JOBSET_INFORMATION = extern struct {
    MemberLevel: DWORD,
};

pub const PJOBOBJECT_JOBSET_INFORMATION = ?*JOBOBJECT_JOBSET_INFORMATION;
pub const JOBOBJECT_RATE_CONTROL_TOLERANCE = c_int;

pub const PJOBOBJECT_RATE_CONTROL_TOLERANCE = ?*JOBOBJECT_RATE_CONTROL_TOLERANCE;
pub const JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL = c_int;

pub const PJOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL = ?*JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL;
pub const JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION = extern struct {
    IoReadBytesLimit: DWORD64,
    IoWriteBytesLimit: DWORD64,
    PerJobUserTimeLimit: LARGE_INTEGER,
    JobMemoryLimit: DWORD64,
    RateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    RateControlToleranceInterval: JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL,
    LimitFlags: DWORD,
};

pub const PJOBOBJECT_NOTIFICATION_LIMIT_INFORMATION = ?*JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION;
pub const JOBOBJECT_NOTIFICATION_LIMIT_INFORMATION_2 = extern struct {
    IoReadBytesLimit: DWORD64,
    IoWriteBytesLimit: DWORD64,
    PerJobUserTimeLimit: LARGE_INTEGER,
    u: extern union {
        JobHighMemoryLimit: DWORD64,
        JobMemoryLimit: DWORD64,
    },
    u2: extern union {
        RateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
        CpuRateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    },
    u3: extern union {
        RateControlToleranceInterval: JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL,
        CpuRateControlToleranceInterval: JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL,
    },
    LimitFlags: DWORD,
    IoRateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    JobLowMemoryLimit: DWORD64,
    IoRateControlToleranceInterval: JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL,
    NetRateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    NetRateControlToleranceInterval: JOBOBJECT_RATE_CONTROL_TOLERANCE_INTERVAL,
};

pub const JOBOBJECT_LIMIT_VIOLATION_INFORMATION = extern struct {
    LimitFlags: DWORD,
    ViolationLimitFlags: DWORD,
    IoReadBytes: DWORD64,
    IoReadBytesLimit: DWORD64,
    IoWriteBytes: DWORD64,
    IoWriteBytesLimit: DWORD64,
    PerJobUserTime: LARGE_INTEGER,
    PerJobUserTimeLimit: LARGE_INTEGER,
    JobMemory: DWORD64,
    JobMemoryLimit: DWORD64,
    RateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    RateControlToleranceLimit: JOBOBJECT_RATE_CONTROL_TOLERANCE,
};

pub const PJOBOBJECT_LIMIT_VIOLATION_INFORMATION = ?*JOBOBJECT_LIMIT_VIOLATION_INFORMATION;
pub const JOBOBJECT_LIMIT_VIOLATION_INFORMATION_2 = extern struct {
    LimitFlags: DWORD,
    ViolationLimitFlags: DWORD,
    IoReadBytes: DWORD64,
    IoReadBytesLimit: DWORD64,
    IoWriteBytes: DWORD64,
    IoWriteBytesLimit: DWORD64,
    PerJobUserTime: LARGE_INTEGER,
    PerJobUserTimeLimit: LARGE_INTEGER,
    JobMemory: DWORD64,
    u: extern union {
        JobHighMemoryLimit: DWORD64,
        JobMemoryLimit: DWORD64,
    },
    u2: extern union {
        RateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
        CpuRateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    },
    u3: extern union {
        RateControlToleranceLimit: JOBOBJECT_RATE_CONTROL_TOLERANCE,
        CpuRateControlToleranceLimit: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    },
    JobLowMemoryLimit: DWORD64,
    IoRateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    IoRateControlToleranceLimit: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    NetRateControlTolerance: JOBOBJECT_RATE_CONTROL_TOLERANCE,
    NetRateControlToleranceLimit: JOBOBJECT_RATE_CONTROL_TOLERANCE,
};

pub const JOBOBJECT_CPU_RATE_CONTROL_INFORMATION = extern struct {
    ControlFlags: DWORD,
    u: extern union {
        CpuRate: DWORD,
        Weight: DWORD,
        s: extern struct {
            MinRate: WORD,
            MaxRate: WORD,
        },
    },
};

pub const PJOBOBJECT_CPU_RATE_CONTROL_INFORMATION = ?*JOBOBJECT_CPU_RATE_CONTROL_INFORMATION;
pub const JOB_OBJECT_NET_RATE_CONTROL_FLAGS = c_int;

pub const JOBOBJECT_NET_RATE_CONTROL_INFORMATION = extern struct {
    MaxBandwidth: DWORD64,
    ControlFlags: JOB_OBJECT_NET_RATE_CONTROL_FLAGS,
    DscpTag: BYTE,
};

pub const JOB_OBJECT_IO_RATE_CONTROL_FLAGS = c_int;

pub const JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE = extern struct {
    MaxIops: LONG64,
    MaxBandwidth: LONG64,
    ReservationIops: LONG64,
    VolumeName: PWSTR,
    BaseIoSize: DWORD,
    ControlFlags: JOB_OBJECT_IO_RATE_CONTROL_FLAGS,
    VolumeNameLength: WORD,
};

pub const JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V1 = JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE;
pub const JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V2 = extern struct {
    MaxIops: LONG64,
    MaxBandwidth: LONG64,
    ReservationIops: LONG64,
    VolumeName: PWSTR,
    BaseIoSize: DWORD,
    ControlFlags: JOB_OBJECT_IO_RATE_CONTROL_FLAGS,
    VolumeNameLength: WORD,
    CriticalReservationIops: LONG64,
    ReservationBandwidth: LONG64,
    CriticalReservationBandwidth: LONG64,
    MaxTimePercent: LONG64,
    ReservationTimePercent: LONG64,
    CriticalReservationTimePercent: LONG64,
};

pub const JOBOBJECT_IO_RATE_CONTROL_INFORMATION_NATIVE_V3 = extern struct {
    MaxIops: LONG64,
    MaxBandwidth: LONG64,
    ReservationIops: LONG64,
    VolumeName: PWSTR,
    BaseIoSize: DWORD,
    ControlFlags: JOB_OBJECT_IO_RATE_CONTROL_FLAGS,
    VolumeNameLength: WORD,
    CriticalReservationIops: LONG64,
    ReservationBandwidth: LONG64,
    CriticalReservationBandwidth: LONG64,
    MaxTimePercent: LONG64,
    ReservationTimePercent: LONG64,
    CriticalReservationTimePercent: LONG64,
    SoftMaxIops: LONG64,
    SoftMaxBandwidth: LONG64,
    SoftMaxTimePercent: LONG64,
    LimitExcessNotifyIops: LONG64,
    LimitExcessNotifyBandwidth: LONG64,
    LimitExcessNotifyTimePercent: LONG64,
};

pub const JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS = c_int;

pub const JOBOBJECT_IO_ATTRIBUTION_STATS = extern struct {
    IoCount: ULONG_PTR,
    TotalNonOverlappedQueueTime: ULONGLONG,
    TotalNonOverlappedServiceTime: ULONGLONG,
    TotalSize: ULONGLONG,
};

pub const PJOBOBJECT_IO_ATTRIBUTION_STATS = ?*JOBOBJECT_IO_ATTRIBUTION_STATS;
pub const JOBOBJECT_IO_ATTRIBUTION_INFORMATION = extern struct {
    ControlFlags: DWORD,
    ReadStats: JOBOBJECT_IO_ATTRIBUTION_STATS,
    WriteStats: JOBOBJECT_IO_ATTRIBUTION_STATS,
};

pub const PJOBOBJECT_IO_ATTRIBUTION_INFORMATION = ?*JOBOBJECT_IO_ATTRIBUTION_INFORMATION;
pub const JOBOBJECTINFOCLASS = c_int;

pub const SILOOBJECT_BASIC_INFORMATION = extern struct {
    SiloId: DWORD,
    SiloParentId: DWORD,
    NumberOfProcesses: DWORD,
    IsInServerSilo: BOOLEAN,
    Reserved: [3]BYTE,
};

pub const PSILOOBJECT_BASIC_INFORMATION = ?*SILOOBJECT_BASIC_INFORMATION;
pub const SERVERSILO_STATE = c_int;

pub const PSERVERSILO_STATE = ?*SERVERSILO_STATE;
pub const SERVERSILO_BASIC_INFORMATION = extern struct {
    ServiceSessionId: DWORD,
    State: SERVERSILO_STATE,
    ExitStatus: DWORD,
};

pub const PSERVERSILO_BASIC_INFORMATION = ?*SERVERSILO_BASIC_INFORMATION;
pub const FirmwareTypeUnknown = FIRMWARE_TYPE.FirmwareTypeUnknown;
pub const FirmwareTypeBios = FIRMWARE_TYPE.FirmwareTypeBios;
pub const FirmwareTypeUefi = FIRMWARE_TYPE.FirmwareTypeUefi;
pub const FirmwareTypeMax = FIRMWARE_TYPE.FirmwareTypeMax;
pub const FIRMWARE_TYPE = extern enum {
    FirmwareTypeUnknown,
    FirmwareTypeBios,
    FirmwareTypeUefi,
    FirmwareTypeMax,
};

pub const PFIRMWARE_TYPE = ?*FIRMWARE_TYPE;
pub const LOGICAL_PROCESSOR_RELATIONSHIP = c_int;

pub const CacheUnified = PROCESSOR_CACHE_TYPE.CacheUnified;
pub const CacheInstruction = PROCESSOR_CACHE_TYPE.CacheInstruction;
pub const CacheData = PROCESSOR_CACHE_TYPE.CacheData;
pub const CacheTrace = PROCESSOR_CACHE_TYPE.CacheTrace;
pub const PROCESSOR_CACHE_TYPE = extern enum {
    CacheUnified,
    CacheInstruction,
    CacheData,
    CacheTrace,
};

pub const CACHE_DESCRIPTOR = extern struct {
    Level: BYTE,
    Associativity: BYTE,
    LineSize: WORD,
    Size: DWORD,
    Type: PROCESSOR_CACHE_TYPE,
};

pub const PCACHE_DESCRIPTOR = ?*CACHE_DESCRIPTOR;
pub const SYSTEM_LOGICAL_PROCESSOR_INFORMATION = extern struct {
    ProcessorMask: ULONG_PTR,
    Relationship: LOGICAL_PROCESSOR_RELATIONSHIP,
    u: extern union {
        ProcessorCore: extern struct {
            Flags: BYTE,
        },
        NumaNode: extern struct {
            NodeNumber: DWORD,
        },
        Cache: CACHE_DESCRIPTOR,
        Reserved: [2]ULONGLONG,
    },
};

pub const PSYSTEM_LOGICAL_PROCESSOR_INFORMATION = ?*SYSTEM_LOGICAL_PROCESSOR_INFORMATION;
pub const PROCESSOR_RELATIONSHIP = extern struct {
    Flags: BYTE,
    EfficiencyClass: BYTE,
    Reserved: [20]BYTE,
    GroupCount: WORD,
    GroupMask: [1]GROUP_AFFINITY,
};

pub const PPROCESSOR_RELATIONSHIP = ?*PROCESSOR_RELATIONSHIP;
pub const NUMA_NODE_RELATIONSHIP = extern struct {
    NodeNumber: DWORD,
    Reserved: [20]BYTE,
    GroupMask: GROUP_AFFINITY,
};

pub const PNUMA_NODE_RELATIONSHIP = ?*NUMA_NODE_RELATIONSHIP;
pub const CACHE_RELATIONSHIP = extern struct {
    Level: BYTE,
    Associativity: BYTE,
    LineSize: WORD,
    CacheSize: DWORD,
    Type: PROCESSOR_CACHE_TYPE,
    Reserved: [20]BYTE,
    GroupMask: GROUP_AFFINITY,
};

pub const PCACHE_RELATIONSHIP = ?*CACHE_RELATIONSHIP;
pub const PROCESSOR_GROUP_INFO = extern struct {
    MaximumProcessorCount: BYTE,
    ActiveProcessorCount: BYTE,
    Reserved: [38]BYTE,
    ActiveProcessorMask: KAFFINITY,
};

pub const PPROCESSOR_GROUP_INFO = ?*PROCESSOR_GROUP_INFO;
pub const GROUP_RELATIONSHIP = extern struct {
    MaximumGroupCount: WORD,
    ActiveGroupCount: WORD,
    Reserved: [20]BYTE,
    GroupInfo: [1]PROCESSOR_GROUP_INFO,
};

pub const PGROUP_RELATIONSHIP = ?*GROUP_RELATIONSHIP;
pub const SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX = extern struct {
    Relationship: LOGICAL_PROCESSOR_RELATIONSHIP,
    Size: DWORD,
    u: extern union {
        Processor: PROCESSOR_RELATIONSHIP,
        NumaNode: NUMA_NODE_RELATIONSHIP,
        Cache: CACHE_RELATIONSHIP,
        Group: GROUP_RELATIONSHIP,
    },
};

pub const PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX = ?*SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX;
pub const CpuSetInformation = CPU_SET_INFORMATION_TYPE.CpuSetInformation;
pub const CPU_SET_INFORMATION_TYPE = extern enum {
    CpuSetInformation,
};

pub const PCPU_SET_INFORMATION_TYPE = ?*CPU_SET_INFORMATION_TYPE;
pub const SYSTEM_CPU_SET_INFORMATION = extern struct {
    Size: DWORD,
    Type: CPU_SET_INFORMATION_TYPE,
    u: extern union {
        CpuSet: extern struct {
            Id: DWORD,
            Group: WORD,
            LogicalProcessorIndex: BYTE,
            CoreIndex: BYTE,
            LastLevelCacheIndex: BYTE,
            NumaNodeIndex: BYTE,
            EfficiencyClass: BYTE,
            u: extern union {
                AllFlags: BYTE,
                s: packed struct {
                    Parked: @IntType(false, 1),
                    Allocated: @IntType(false, 1),
                    AllocatedToTargetProcess: @IntType(false, 1),
                    RealTime: @IntType(false, 1),
                    ReservedFlags: @IntType(false, 4),
                },
            },
            Reserved: DWORD,
            AllocationTag: DWORD64,
        },
    },
};

pub const PSYSTEM_CPU_SET_INFORMATION = ?*SYSTEM_CPU_SET_INFORMATION;
pub const SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION = extern struct {
    CycleTime: DWORD64,
};

pub const PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION = ?*SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION;
pub const XSTATE_FEATURE = extern struct {
    Offset: DWORD,
    Size: DWORD,
};

pub const PXSTATE_FEATURE = ?*XSTATE_FEATURE;
pub const XSTATE_CONFIGURATION = extern struct {
    EnabledFeatures: DWORD64,
    EnabledVolatileFeatures: DWORD64,
    Size: DWORD,
    u: extern union {
        ControlFlags: DWORD,
        s: packed struct {
            OptimizedSave: @IntType(false, 1),
            CompactionEnabled: @IntType(false, 1),
            Reserved: @IntType(false, 30),
        },
    },
    Features: [64]XSTATE_FEATURE,
    EnabledSupervisorFeatures: DWORD64,
    AlignedFeatures: DWORD64,
    AllFeatureSize: DWORD,
    AllFeatures: [64]DWORD,
};

pub const PXSTATE_CONFIGURATION = ?*XSTATE_CONFIGURATION;
pub const MEMORY_BASIC_INFORMATION = extern struct {
    BaseAddress: PVOID,
    AllocationBase: PVOID,
    AllocationProtect: DWORD,
    RegionSize: SIZE_T,
    State: DWORD,
    Protect: DWORD,
    Type: DWORD,
};

pub const PMEMORY_BASIC_INFORMATION = ?*MEMORY_BASIC_INFORMATION;
pub const MEMORY_BASIC_INFORMATION32 = extern struct {
    BaseAddress: DWORD,
    AllocationBase: DWORD,
    AllocationProtect: DWORD,
    RegionSize: DWORD,
    State: DWORD,
    Protect: DWORD,
    Type: DWORD,
};

pub const PMEMORY_BASIC_INFORMATION32 = ?*MEMORY_BASIC_INFORMATION32;
pub const MEMORY_BASIC_INFORMATION64 = extern struct {
    BaseAddress: ULONGLONG,
    AllocationBase: ULONGLONG,
    AllocationProtect: DWORD,
    __alignment1: DWORD,
    RegionSize: ULONGLONG,
    State: DWORD,
    Protect: DWORD,
    Type: DWORD,
    __alignment2: DWORD,
};

pub const PMEMORY_BASIC_INFORMATION64 = ?*MEMORY_BASIC_INFORMATION64;
pub const CFG_CALL_TARGET_INFO = extern struct {
    Offset: ULONG_PTR,
    Flags: ULONG_PTR,
};

pub const PCFG_CALL_TARGET_INFO = ?*CFG_CALL_TARGET_INFO;
pub const ENCLAVE_CREATE_INFO_SGX = extern struct {
    Secs: [4096]BYTE,
};

pub const PENCLAVE_CREATE_INFO_SGX = ?*ENCLAVE_CREATE_INFO_SGX;
pub const ENCLAVE_INIT_INFO_SGX = extern struct {
    SigStruct: [1808]BYTE,
    Reserved1: [240]BYTE,
    EInitToken: [304]BYTE,
    Reserved2: [1744]BYTE,
};

pub const PENCLAVE_INIT_INFO_SGX = ?*ENCLAVE_INIT_INFO_SGX;
pub const ENCLAVE_CREATE_INFO_VBS = extern struct {
    Flags: DWORD,
    OwnerID: [32]BYTE,
};

pub const PENCLAVE_CREATE_INFO_VBS = ?*ENCLAVE_CREATE_INFO_VBS;
pub const ENCLAVE_INIT_INFO_VBS = extern struct {
    Length: DWORD,
    ThreadCount: DWORD,
};

pub const PENCLAVE_INIT_INFO_VBS = ?*ENCLAVE_INIT_INFO_VBS;
pub const ENCLAVE_TARGET_FUNCTION = extern fn(PVOID) PVOID;
pub const PENCLAVE_TARGET_FUNCTION = ?*ENCLAVE_TARGET_FUNCTION;
pub const LPENCLAVE_TARGET_FUNCTION = PENCLAVE_TARGET_FUNCTION;
pub const FILE_ID_128 = extern struct {
    Identifier: [16]BYTE,
};

pub const PFILE_ID_128 = ?*FILE_ID_128;
pub const FILE_NOTIFY_INFORMATION = extern struct {
    NextEntryOffset: DWORD,
    Action: DWORD,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

pub const PFILE_NOTIFY_INFORMATION = ?*FILE_NOTIFY_INFORMATION;
pub const FILE_NOTIFY_EXTENDED_INFORMATION = extern struct {
    NextEntryOffset: DWORD,
    Action: DWORD,
    CreationTime: LARGE_INTEGER,
    LastModificationTime: LARGE_INTEGER,
    LastChangeTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    AllocatedLength: LARGE_INTEGER,
    FileSize: LARGE_INTEGER,
    FileAttributes: DWORD,
    ReparsePointTag: DWORD,
    FileId: LARGE_INTEGER,
    ParentFileId: LARGE_INTEGER,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

pub const PFILE_NOTIFY_EXTENDED_INFORMATION = ?*FILE_NOTIFY_EXTENDED_INFORMATION;
pub const FILE_SEGMENT_ELEMENT = extern union {
    Buffer: PVOID64,
    Alignment: ULONGLONG,
};

pub const PFILE_SEGMENT_ELEMENT = ?*FILE_SEGMENT_ELEMENT;
pub const REPARSE_GUID_DATA_BUFFER = extern struct {
    ReparseTag: DWORD,
    ReparseDataLength: WORD,
    Reserved: WORD,
    ReparseGuid: GUID,
    GenericReparseBuffer: extern struct {
        DataBuffer: [1]BYTE,
    },
};

pub const PREPARSE_GUID_DATA_BUFFER = ?*REPARSE_GUID_DATA_BUFFER;
pub const SCRUB_DATA_INPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    MaximumIos: DWORD,
    ObjectId: [4]DWORD,
    Reserved: [13]DWORD,
    ResumeContext: [816]BYTE,
};

pub const PSCRUB_DATA_INPUT = ?*SCRUB_DATA_INPUT;
pub const SCRUB_PARITY_EXTENT = extern struct {
    Offset: LONGLONG,
    Length: ULONGLONG,
};

pub const PSCRUB_PARITY_EXTENT = ?*SCRUB_PARITY_EXTENT;
pub const SCRUB_PARITY_EXTENT_DATA = extern struct {
    Size: WORD,
    Flags: WORD,
    NumberOfParityExtents: WORD,
    MaximumNumberOfParityExtents: WORD,
    ParityExtents: [1]SCRUB_PARITY_EXTENT,
};

pub const PSCRUB_PARITY_EXTENT_DATA = ?*SCRUB_PARITY_EXTENT_DATA;
pub const SCRUB_DATA_OUTPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    Status: DWORD,
    ErrorFileOffset: ULONGLONG,
    ErrorLength: ULONGLONG,
    NumberOfBytesRepaired: ULONGLONG,
    NumberOfBytesFailed: ULONGLONG,
    InternalFileReference: ULONGLONG,
    ResumeContextLength: WORD,
    ParityExtentDataOffset: WORD,
    Reserved: [5]DWORD,
    ResumeContext: [816]BYTE,
};

pub const PSCRUB_DATA_OUTPUT = ?*SCRUB_DATA_OUTPUT;
pub const SharedVirtualDiskSupportType = c_int;

pub const SharedVirtualDiskHandleState = c_int;

pub const SHARED_VIRTUAL_DISK_SUPPORT = extern struct {
    SharedVirtualDiskSupport: SharedVirtualDiskSupportType,
    HandleState: SharedVirtualDiskHandleState,
};

pub const PSHARED_VIRTUAL_DISK_SUPPORT = ?*SHARED_VIRTUAL_DISK_SUPPORT;
pub const NETWORK_APP_INSTANCE_EA = extern struct {
    AppInstanceID: GUID,
    CsvFlags: DWORD,
};

pub const PNETWORK_APP_INSTANCE_EA = ?*NETWORK_APP_INSTANCE_EA;


pub const SYSTEM_POWER_STATE = c_int;

pub const PSYSTEM_POWER_STATE = ?*SYSTEM_POWER_STATE;
pub const POWER_ACTION = c_int;
pub const PPOWER_ACTION = ?*c_int;
pub const DEVICE_POWER_STATE = c_int;

pub const PDEVICE_POWER_STATE = ?*DEVICE_POWER_STATE;
pub const MONITOR_DISPLAY_STATE = c_int;

pub const PMONITOR_DISPLAY_STATE = ?*MONITOR_DISPLAY_STATE;
pub const USER_ACTIVITY_PRESENCE = c_int;

pub const PUSER_ACTIVITY_PRESENCE = ?*USER_ACTIVITY_PRESENCE;
pub const EXECUTION_STATE = DWORD;
pub const PEXECUTION_STATE = ?*DWORD;
pub const LATENCY_TIME = extern enum {
    LT_DONT_CARE,
    LT_LOWEST_LATENCY,
};
pub const PowerRequestDisplayRequired = POWER_REQUEST_TYPE.PowerRequestDisplayRequired;
pub const PowerRequestSystemRequired = POWER_REQUEST_TYPE.PowerRequestSystemRequired;
pub const PowerRequestAwayModeRequired = POWER_REQUEST_TYPE.PowerRequestAwayModeRequired;
pub const PowerRequestExecutionRequired = POWER_REQUEST_TYPE.PowerRequestExecutionRequired;
pub const POWER_REQUEST_TYPE = extern enum {
    PowerRequestDisplayRequired,
    PowerRequestSystemRequired,
    PowerRequestAwayModeRequired,
    PowerRequestExecutionRequired,
};

pub const PPOWER_REQUEST_TYPE = ?*POWER_REQUEST_TYPE;
pub const CM_Power_Data_s = extern struct {
    PD_Size: DWORD,
    PD_MostRecentPowerState: DEVICE_POWER_STATE,
    PD_Capabilities: DWORD,
    PD_D1Latency: DWORD,
    PD_D2Latency: DWORD,
    PD_D3Latency: DWORD,
    PD_PowerStateMapping: [7]DEVICE_POWER_STATE,
    PD_DeepestSystemWake: SYSTEM_POWER_STATE,
};
pub const CM_POWER_DATA = CM_Power_Data_s;
pub const PCM_POWER_DATA = ?*CM_Power_Data_s;
pub const POWER_INFORMATION_LEVEL = extern enum {
    SystemPowerPolicyAc,
    SystemPowerPolicyDc,
    VerifySystemPolicyAc,
    VerifySystemPolicyDc,
    SystemPowerCapabilities,
    SystemBatteryState,
    SystemPowerStateHandler,
    ProcessorStateHandler,
    SystemPowerPolicyCurrent,
    AdministratorPowerPolicy,
    SystemReserveHiberFile,
    ProcessorInformation,
    SystemPowerInformation,
    ProcessorStateHandler2,
    LastWakeTime,
    LastSleepTime,
    SystemExecutionState,
    SystemPowerStateNotifyHandler,
    ProcessorPowerPolicyAc,
    ProcessorPowerPolicyDc,
    VerifyProcessorPowerPolicyAc,
    VerifyProcessorPowerPolicyDc,
    ProcessorPowerPolicyCurrent,
    SystemPowerStateLogging,
    SystemPowerLoggingEntry,
    SetPowerSettingValue,
    NotifyUserPowerSetting,
    PowerInformationLevelUnused0,
    SystemMonitorHiberBootPowerOff,
    SystemVideoState,
    TraceApplicationPowerMessage,
    TraceApplicationPowerMessageEnd,
    ProcessorPerfStates,
    ProcessorIdleStates,
    ProcessorCap,
    SystemWakeSource,
    SystemHiberFileInformation,
    TraceServicePowerMessage,
    ProcessorLoad,
    PowerShutdownNotification,
    MonitorCapabilities,
    SessionPowerInit,
    SessionDisplayState,
    PowerRequestCreate,
    PowerRequestAction,
    GetPowerRequestList,
    ProcessorInformationEx,
    NotifyUserModeLegacyPowerEvent,
    GroupPark,
    ProcessorIdleDomains,
    WakeTimerList,
    SystemHiberFileSize,
    ProcessorIdleStatesHv,
    ProcessorPerfStatesHv,
    ProcessorPerfCapHv,
    ProcessorSetIdle,
    LogicalProcessorIdling,
    UserPresence,
    PowerSettingNotificationName,
    GetPowerSettingValue,
    IdleResiliency,
    SessionRITState,
    SessionConnectNotification,
    SessionPowerCleanup,
    SessionLockState,
    SystemHiberbootState,
    PlatformInformation,
    PdcInvocation,
    MonitorInvocation,
    FirmwareTableInformationRegistered,
    SetShutdownSelectedTime,
    SuspendResumeInvocation,
    PlmPowerRequestCreate,
    ScreenOff,
    CsDeviceNotification,
    PlatformRole,
    LastResumePerformance,
    DisplayBurst,
    ExitLatencySamplingPercentage,
    RegisterSpmPowerSettings,
    PlatformIdleStates,
    ProcessorIdleVeto,
    PlatformIdleVeto,
    SystemBatteryStatePrecise,
    ThermalEvent,
    PowerRequestActionInternal,
    BatteryDeviceState,
    PowerInformationInternal,
    ThermalStandby,
    SystemHiberFileType,
    PhysicalPowerButtonPress,
    QueryPotentialDripsConstraint,
    EnergyTrackerCreate,
    EnergyTrackerQuery,
    UpdateBlackBoxRecorder,
    PowerInformationLevelMaximum,
};
pub const POWER_USER_PRESENCE_TYPE = c_int;
pub const PPOWER_USER_PRESENCE_TYPE = ?*c_int;
pub const POWER_USER_PRESENCE = extern struct {
    UserPresence: POWER_USER_PRESENCE_TYPE,
};

pub const PPOWER_USER_PRESENCE = ?*POWER_USER_PRESENCE;
pub const POWER_SESSION_CONNECT = extern struct {
    Connected: BOOLEAN,
    Console: BOOLEAN,
};

pub const PPOWER_SESSION_CONNECT = ?*POWER_SESSION_CONNECT;
pub const POWER_SESSION_TIMEOUTS = extern struct {
    InputTimeout: DWORD,
    DisplayTimeout: DWORD,
};

pub const PPOWER_SESSION_TIMEOUTS = ?*POWER_SESSION_TIMEOUTS;
pub const POWER_SESSION_RIT_STATE = extern struct {
    Active: BOOLEAN,
    LastInputTime: DWORD,
};

pub const PPOWER_SESSION_RIT_STATE = ?*POWER_SESSION_RIT_STATE;
pub const POWER_SESSION_WINLOGON = extern struct {
    SessionId: DWORD,
    Console: BOOLEAN,
    Locked: BOOLEAN,
};

pub const PPOWER_SESSION_WINLOGON = ?*POWER_SESSION_WINLOGON;
pub const POWER_IDLE_RESILIENCY = extern struct {
    CoalescingTimeout: DWORD,
    IdleResiliencyPeriod: DWORD,
};

pub const PPOWER_IDLE_RESILIENCY = ?*POWER_IDLE_RESILIENCY;
pub const POWER_MONITOR_REQUEST_REASON = extern enum {
    MonitorRequestReasonUnknown,
    MonitorRequestReasonPowerButton,
    MonitorRequestReasonRemoteConnection,
    MonitorRequestReasonScMonitorpower,
    MonitorRequestReasonUserInput,
    MonitorRequestReasonAcDcDisplayBurst,
    MonitorRequestReasonUserDisplayBurst,
    MonitorRequestReasonPoSetSystemState,
    MonitorRequestReasonSetThreadExecutionState,
    MonitorRequestReasonFullWake,
    MonitorRequestReasonSessionUnlock,
    MonitorRequestReasonScreenOffRequest,
    MonitorRequestReasonIdleTimeout,
    MonitorRequestReasonPolicyChange,
    MonitorRequestReasonSleepButton,
    MonitorRequestReasonLid,
    MonitorRequestReasonBatteryCountChange,
    MonitorRequestReasonGracePeriod,
    MonitorRequestReasonPnP,
    MonitorRequestReasonDP,
    MonitorRequestReasonSxTransition,
    MonitorRequestReasonSystemIdle,
    MonitorRequestReasonNearProximity,
    MonitorRequestReasonThermalStandby,
    MonitorRequestReasonResumePdc,
    MonitorRequestReasonResumeS4,
    MonitorRequestReasonTerminal,
    MonitorRequestReasonPdcSignal,
    MonitorRequestReasonAcDcDisplayBurstSuppressed,
    MonitorRequestReasonSystemStateEntered,
    MonitorRequestReasonWinrt,
    MonitorRequestReasonUserInputKeyboard,
    MonitorRequestReasonUserInputMouse,
    MonitorRequestReasonUserInputTouch,
    MonitorRequestReasonUserInputPen,
    MonitorRequestReasonUserInputAccelerometer,
    MonitorRequestReasonUserInputHid,
    MonitorRequestReasonUserInputPoUserPresent,
    MonitorRequestReasonUserInputSessionSwitch,
    MonitorRequestReasonUserInputInitialization,
    MonitorRequestReasonPdcSignalWindowsMobilePwrNotif,
    MonitorRequestReasonPdcSignalWindowsMobileShell,
    MonitorRequestReasonPdcSignalHeyCortana,
    MonitorRequestReasonPdcSignalHolographicShell,
    MonitorRequestReasonMax,
};
pub const MonitorRequestTypeOff = POWER_MONITOR_REQUEST_TYPE.MonitorRequestTypeOff;
pub const MonitorRequestTypeOnAndPresent = POWER_MONITOR_REQUEST_TYPE.MonitorRequestTypeOnAndPresent;
pub const MonitorRequestTypeToggleOn = POWER_MONITOR_REQUEST_TYPE.MonitorRequestTypeToggleOn;
pub const POWER_MONITOR_REQUEST_TYPE = extern enum {
    MonitorRequestTypeOff,
    MonitorRequestTypeOnAndPresent,
    MonitorRequestTypeToggleOn,
};

pub const POWER_MONITOR_INVOCATION = extern struct {
    Console: BOOLEAN,
    RequestReason: POWER_MONITOR_REQUEST_REASON,
};

pub const PPOWER_MONITOR_INVOCATION = ?*POWER_MONITOR_INVOCATION;
pub const RESUME_PERFORMANCE = extern struct {
    PostTimeMs: DWORD,
    TotalResumeTimeMs: ULONGLONG,
    ResumeCompleteTimestamp: ULONGLONG,
};

pub const PRESUME_PERFORMANCE = ?*RESUME_PERFORMANCE;
pub const SYSTEM_POWER_CONDITION = extern enum {
    PoAc,
    PoDc,
    PoHot,
    PoConditionMaximum,
};
pub const SET_POWER_SETTING_VALUE = extern struct {
    Version: DWORD,
    Guid: GUID,
    PowerCondition: SYSTEM_POWER_CONDITION,
    DataLength: DWORD,
    Data: [1]BYTE,
};
pub const PSET_POWER_SETTING_VALUE = ?*extern struct {
    Version: DWORD,
    Guid: GUID,
    PowerCondition: SYSTEM_POWER_CONDITION,
    DataLength: DWORD,
    Data: [1]BYTE,
};
pub const NOTIFY_USER_POWER_SETTING = extern struct {
    Guid: GUID,
};
pub const PNOTIFY_USER_POWER_SETTING = ?*extern struct {
    Guid: GUID,
};
pub const APPLICATIONLAUNCH_SETTING_VALUE = extern struct {
    ActivationTime: LARGE_INTEGER,
    Flags: DWORD,
    ButtonInstanceID: DWORD,
};

pub const PAPPLICATIONLAUNCH_SETTING_VALUE = ?*APPLICATIONLAUNCH_SETTING_VALUE;
pub const POWER_PLATFORM_ROLE = c_int;

pub const PPOWER_PLATFORM_ROLE = ?*POWER_PLATFORM_ROLE;
pub const POWER_PLATFORM_INFORMATION = extern struct {
    AoAc: BOOLEAN,
};

pub const PPOWER_PLATFORM_INFORMATION = ?*POWER_PLATFORM_INFORMATION;
pub const BATTERY_REPORTING_SCALE = extern struct {
    Granularity: DWORD,
    Capacity: DWORD,
};
pub const PBATTERY_REPORTING_SCALE = ?*extern struct {
    Granularity: DWORD,
    Capacity: DWORD,
};
pub const PPM_WMI_LEGACY_PERFSTATE = extern struct {
    Frequency: DWORD,
    Flags: DWORD,
    PercentFrequency: DWORD,
};
pub const PPPM_WMI_LEGACY_PERFSTATE = ?*extern struct {
    Frequency: DWORD,
    Flags: DWORD,
    PercentFrequency: DWORD,
};
pub const PPM_WMI_IDLE_STATE = extern struct {
    Latency: DWORD,
    Power: DWORD,
    TimeCheck: DWORD,
    PromotePercent: BYTE,
    DemotePercent: BYTE,
    StateType: BYTE,
    Reserved: BYTE,
    StateFlags: DWORD,
    Context: DWORD,
    IdleHandler: DWORD,
    Reserved1: DWORD,
};
pub const PPPM_WMI_IDLE_STATE = ?*extern struct {
    Latency: DWORD,
    Power: DWORD,
    TimeCheck: DWORD,
    PromotePercent: BYTE,
    DemotePercent: BYTE,
    StateType: BYTE,
    Reserved: BYTE,
    StateFlags: DWORD,
    Context: DWORD,
    IdleHandler: DWORD,
    Reserved1: DWORD,
};
pub const PPM_WMI_IDLE_STATES = extern struct {
    Type: DWORD,
    Count: DWORD,
    TargetState: DWORD,
    OldState: DWORD,
    TargetProcessors: DWORD64,
    State: [1]PPM_WMI_IDLE_STATE,
};
pub const PPPM_WMI_IDLE_STATES = ?*extern struct {
    Type: DWORD,
    Count: DWORD,
    TargetState: DWORD,
    OldState: DWORD,
    TargetProcessors: DWORD64,
    State: [1]PPM_WMI_IDLE_STATE,
};
pub const PPM_WMI_IDLE_STATES_EX = extern struct {
    Type: DWORD,
    Count: DWORD,
    TargetState: DWORD,
    OldState: DWORD,
    TargetProcessors: PVOID,
    State: [1]PPM_WMI_IDLE_STATE,
};
pub const PPPM_WMI_IDLE_STATES_EX = ?*extern struct {
    Type: DWORD,
    Count: DWORD,
    TargetState: DWORD,
    OldState: DWORD,
    TargetProcessors: PVOID,
    State: [1]PPM_WMI_IDLE_STATE,
};
pub const PPM_WMI_PERF_STATE = extern struct {
    Frequency: DWORD,
    Power: DWORD,
    PercentFrequency: BYTE,
    IncreaseLevel: BYTE,
    DecreaseLevel: BYTE,
    Type: BYTE,
    IncreaseTime: DWORD,
    DecreaseTime: DWORD,
    Control: DWORD64,
    Status: DWORD64,
    HitCount: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD64,
    Reserved3: DWORD64,
};
pub const PPPM_WMI_PERF_STATE = ?*extern struct {
    Frequency: DWORD,
    Power: DWORD,
    PercentFrequency: BYTE,
    IncreaseLevel: BYTE,
    DecreaseLevel: BYTE,
    Type: BYTE,
    IncreaseTime: DWORD,
    DecreaseTime: DWORD,
    Control: DWORD64,
    Status: DWORD64,
    HitCount: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD64,
    Reserved3: DWORD64,
};
pub const PPM_WMI_PERF_STATES = extern struct {
    Count: DWORD,
    MaxFrequency: DWORD,
    CurrentState: DWORD,
    MaxPerfState: DWORD,
    MinPerfState: DWORD,
    LowestPerfState: DWORD,
    ThermalConstraint: DWORD,
    BusyAdjThreshold: BYTE,
    PolicyType: BYTE,
    Type: BYTE,
    Reserved: BYTE,
    TimerInterval: DWORD,
    TargetProcessors: DWORD64,
    PStateHandler: DWORD,
    PStateContext: DWORD,
    TStateHandler: DWORD,
    TStateContext: DWORD,
    FeedbackHandler: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD64,
    State: [1]PPM_WMI_PERF_STATE,
};
pub const PPPM_WMI_PERF_STATES = ?*extern struct {
    Count: DWORD,
    MaxFrequency: DWORD,
    CurrentState: DWORD,
    MaxPerfState: DWORD,
    MinPerfState: DWORD,
    LowestPerfState: DWORD,
    ThermalConstraint: DWORD,
    BusyAdjThreshold: BYTE,
    PolicyType: BYTE,
    Type: BYTE,
    Reserved: BYTE,
    TimerInterval: DWORD,
    TargetProcessors: DWORD64,
    PStateHandler: DWORD,
    PStateContext: DWORD,
    TStateHandler: DWORD,
    TStateContext: DWORD,
    FeedbackHandler: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD64,
    State: [1]PPM_WMI_PERF_STATE,
};
pub const PPM_WMI_PERF_STATES_EX = extern struct {
    Count: DWORD,
    MaxFrequency: DWORD,
    CurrentState: DWORD,
    MaxPerfState: DWORD,
    MinPerfState: DWORD,
    LowestPerfState: DWORD,
    ThermalConstraint: DWORD,
    BusyAdjThreshold: BYTE,
    PolicyType: BYTE,
    Type: BYTE,
    Reserved: BYTE,
    TimerInterval: DWORD,
    TargetProcessors: PVOID,
    PStateHandler: DWORD,
    PStateContext: DWORD,
    TStateHandler: DWORD,
    TStateContext: DWORD,
    FeedbackHandler: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD64,
    State: [1]PPM_WMI_PERF_STATE,
};
pub const PPPM_WMI_PERF_STATES_EX = ?*extern struct {
    Count: DWORD,
    MaxFrequency: DWORD,
    CurrentState: DWORD,
    MaxPerfState: DWORD,
    MinPerfState: DWORD,
    LowestPerfState: DWORD,
    ThermalConstraint: DWORD,
    BusyAdjThreshold: BYTE,
    PolicyType: BYTE,
    Type: BYTE,
    Reserved: BYTE,
    TimerInterval: DWORD,
    TargetProcessors: PVOID,
    PStateHandler: DWORD,
    PStateContext: DWORD,
    TStateHandler: DWORD,
    TStateContext: DWORD,
    FeedbackHandler: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD64,
    State: [1]PPM_WMI_PERF_STATE,
};
pub const PPM_IDLE_STATE_ACCOUNTING = extern struct {
    IdleTransitions: DWORD,
    FailedTransitions: DWORD,
    InvalidBucketIndex: DWORD,
    TotalTime: DWORD64,
    IdleTimeBuckets: [6]DWORD,
};
pub const PPPM_IDLE_STATE_ACCOUNTING = ?*extern struct {
    IdleTransitions: DWORD,
    FailedTransitions: DWORD,
    InvalidBucketIndex: DWORD,
    TotalTime: DWORD64,
    IdleTimeBuckets: [6]DWORD,
};
pub const PPM_IDLE_ACCOUNTING = extern struct {
    StateCount: DWORD,
    TotalTransitions: DWORD,
    ResetCount: DWORD,
    StartTime: DWORD64,
    State: [1]PPM_IDLE_STATE_ACCOUNTING,
};
pub const PPPM_IDLE_ACCOUNTING = ?*extern struct {
    StateCount: DWORD,
    TotalTransitions: DWORD,
    ResetCount: DWORD,
    StartTime: DWORD64,
    State: [1]PPM_IDLE_STATE_ACCOUNTING,
};
pub const PPM_IDLE_STATE_BUCKET_EX = extern struct {
    TotalTimeUs: DWORD64,
    MinTimeUs: DWORD,
    MaxTimeUs: DWORD,
    Count: DWORD,
};
pub const PPPM_IDLE_STATE_BUCKET_EX = ?*extern struct {
    TotalTimeUs: DWORD64,
    MinTimeUs: DWORD,
    MaxTimeUs: DWORD,
    Count: DWORD,
};
pub const PPM_IDLE_STATE_ACCOUNTING_EX = extern struct {
    TotalTime: DWORD64,
    IdleTransitions: DWORD,
    FailedTransitions: DWORD,
    InvalidBucketIndex: DWORD,
    MinTimeUs: DWORD,
    MaxTimeUs: DWORD,
    CancelledTransitions: DWORD,
    IdleTimeBuckets: [16]PPM_IDLE_STATE_BUCKET_EX,
};
pub const PPPM_IDLE_STATE_ACCOUNTING_EX = ?*extern struct {
    TotalTime: DWORD64,
    IdleTransitions: DWORD,
    FailedTransitions: DWORD,
    InvalidBucketIndex: DWORD,
    MinTimeUs: DWORD,
    MaxTimeUs: DWORD,
    CancelledTransitions: DWORD,
    IdleTimeBuckets: [16]PPM_IDLE_STATE_BUCKET_EX,
};
pub const PPM_IDLE_ACCOUNTING_EX = extern struct {
    StateCount: DWORD,
    TotalTransitions: DWORD,
    ResetCount: DWORD,
    AbortCount: DWORD,
    StartTime: DWORD64,
    State: [1]PPM_IDLE_STATE_ACCOUNTING_EX,
};
pub const PPPM_IDLE_ACCOUNTING_EX = ?*extern struct {
    StateCount: DWORD,
    TotalTransitions: DWORD,
    ResetCount: DWORD,
    AbortCount: DWORD,
    StartTime: DWORD64,
    State: [1]PPM_IDLE_STATE_ACCOUNTING_EX,
};
pub const PPM_PERFSTATE_EVENT = extern struct {
    State: DWORD,
    Status: DWORD,
    Latency: DWORD,
    Speed: DWORD,
    Processor: DWORD,
};
pub const PPPM_PERFSTATE_EVENT = ?*extern struct {
    State: DWORD,
    Status: DWORD,
    Latency: DWORD,
    Speed: DWORD,
    Processor: DWORD,
};
pub const PPM_PERFSTATE_DOMAIN_EVENT = extern struct {
    State: DWORD,
    Latency: DWORD,
    Speed: DWORD,
    Processors: DWORD64,
};
pub const PPPM_PERFSTATE_DOMAIN_EVENT = ?*extern struct {
    State: DWORD,
    Latency: DWORD,
    Speed: DWORD,
    Processors: DWORD64,
};
pub const PPM_IDLESTATE_EVENT = extern struct {
    NewState: DWORD,
    OldState: DWORD,
    Processors: DWORD64,
};
pub const PPPM_IDLESTATE_EVENT = ?*extern struct {
    NewState: DWORD,
    OldState: DWORD,
    Processors: DWORD64,
};
pub const PPM_THERMALCHANGE_EVENT = extern struct {
    ThermalConstraint: DWORD,
    Processors: DWORD64,
};
pub const PPPM_THERMALCHANGE_EVENT = ?*extern struct {
    ThermalConstraint: DWORD,
    Processors: DWORD64,
};
pub const PPM_THERMAL_POLICY_EVENT = extern struct {
    Mode: BYTE,
    Processors: DWORD64,
};
pub const PPPM_THERMAL_POLICY_EVENT = ?*extern struct {
    Mode: BYTE,
    Processors: DWORD64,
};
pub const POWER_ACTION_POLICY = extern struct {
    Action: POWER_ACTION,
    Flags: DWORD,
    EventCode: DWORD,
};
pub const PPOWER_ACTION_POLICY = ?*extern struct {
    Action: POWER_ACTION,
    Flags: DWORD,
    EventCode: DWORD,
};
pub const SYSTEM_POWER_LEVEL = extern struct {
    Enable: BOOLEAN,
    Spare: [3]BYTE,
    BatteryLevel: DWORD,
    PowerPolicy: POWER_ACTION_POLICY,
    MinSystemState: SYSTEM_POWER_STATE,
};
pub const PSYSTEM_POWER_LEVEL = ?*extern struct {
    Enable: BOOLEAN,
    Spare: [3]BYTE,
    BatteryLevel: DWORD,
    PowerPolicy: POWER_ACTION_POLICY,
    MinSystemState: SYSTEM_POWER_STATE,
};
pub const SYSTEM_POWER_POLICY = extern struct {
    Revision: DWORD,
    PowerButton: POWER_ACTION_POLICY,
    SleepButton: POWER_ACTION_POLICY,
    LidClose: POWER_ACTION_POLICY,
    LidOpenWake: SYSTEM_POWER_STATE,
    Reserved: DWORD,
    Idle: POWER_ACTION_POLICY,
    IdleTimeout: DWORD,
    IdleSensitivity: BYTE,
    DynamicThrottle: BYTE,
    Spare2: [2]BYTE,
    MinSleep: SYSTEM_POWER_STATE,
    MaxSleep: SYSTEM_POWER_STATE,
    ReducedLatencySleep: SYSTEM_POWER_STATE,
    WinLogonFlags: DWORD,
    Spare3: DWORD,
    DozeS4Timeout: DWORD,
    BroadcastCapacityResolution: DWORD,
    DischargePolicy: [4]SYSTEM_POWER_LEVEL,
    VideoTimeout: DWORD,
    VideoDimDisplay: BOOLEAN,
    VideoReserved: [3]DWORD,
    SpindownTimeout: DWORD,
    OptimizeForPower: BOOLEAN,
    FanThrottleTolerance: BYTE,
    ForcedThrottle: BYTE,
    MinThrottle: BYTE,
    OverThrottled: POWER_ACTION_POLICY,
};

pub const PSYSTEM_POWER_POLICY = ?*SYSTEM_POWER_POLICY;
pub const PROCESSOR_IDLESTATE_INFO = extern struct {
    TimeCheck: DWORD,
    DemotePercent: BYTE,
    PromotePercent: BYTE,
    Spare: [2]BYTE,
};
pub const PPROCESSOR_IDLESTATE_INFO = ?*extern struct {
    TimeCheck: DWORD,
    DemotePercent: BYTE,
    PromotePercent: BYTE,
    Spare: [2]BYTE,
};
pub const PROCESSOR_IDLESTATE_POLICY = extern struct {
    Revision: WORD,
    Flags: extern union {
        AsWORD: WORD,
        s: packed struct {
            AllowScaling: @IntType(false, 1),
            Disabled: @IntType(false, 1),
            Reserved: @IntType(false, 14),
        },
    },
    PolicyCount: DWORD,
    Policy: [3]PROCESSOR_IDLESTATE_INFO,
};
pub const PPROCESSOR_IDLESTATE_POLICY = ?*PROCESSOR_IDLESTATE_POLICY;
pub const PROCESSOR_POWER_POLICY_INFO = extern struct {
    TimeCheck: DWORD,
    DemoteLimit: DWORD,
    PromoteLimit: DWORD,
    
    DemotePercent: BYTE,
    PromotePercent: BYTE,
    Spare: [2]BYTE,
    
    s: packed struct {
        AllowDemotion: @IntType(false, 1),
        AllowPromotion: @IntType(false, 1),
        Reserved: @IntType(false, 30),
    },
};

pub const PPROCESSOR_POWER_POLICY_INFO = ?*PROCESSOR_POWER_POLICY_INFO;
pub const PROCESSOR_POWER_POLICY = extern struct {
    Revision: DWORD,

    DynamicThrottle: BYTE,
    Spare: [3]BYTE,

    s: packed struct {
        DisableCStates: @IntType(false, 1),
        Reserved: @IntType(false, 31),
    },

    PolicyCount: DWORD,
    Policy: [3]PROCESSOR_POWER_POLICY_INFO,
};

pub const PPROCESSOR_POWER_POLICY = ?*PROCESSOR_POWER_POLICY;
pub const PROCESSOR_PERFSTATE_POLICY = extern struct {
    Revision: DWORD,
    MaxThrottle: BYTE,
    MinThrottle: BYTE,
    BusyAdjThreshold: BYTE,
    u: extern union {
        Spare: BYTE,
        Flags: extern union {
            AsBYTE: BYTE,
            s: packed struct {
                NoDomainAccounting: @IntType(false, 1),
                IncreasePolicy: @IntType(false, 2),
                DecreasePolicy: @IntType(false, 2),
                Reserved: @IntType(false, 3),
            }
        },
    },
    TimeCheck: DWORD,
    IncreaseTime: DWORD,
    DecreaseTime: DWORD,
    IncreasePercent: DWORD,
    DecreasePercent: DWORD,
};
pub const PPROCESSOR_PERFSTATE_POLICY = ?*PROCESSOR_PERFSTATE_POLICY;
pub const ADMINISTRATOR_POWER_POLICY = extern struct {
    MinSleep: SYSTEM_POWER_STATE,
    MaxSleep: SYSTEM_POWER_STATE,
    MinVideoTimeout: DWORD,
    MaxVideoTimeout: DWORD,
    MinSpindownTimeout: DWORD,
    MaxSpindownTimeout: DWORD,
};

pub const PADMINISTRATOR_POWER_POLICY = ?*ADMINISTRATOR_POWER_POLICY;
pub const HIBERFILE_BUCKET_SIZE = c_int;

pub const PHIBERFILE_BUCKET_SIZE = ?*HIBERFILE_BUCKET_SIZE;
pub const HIBERFILE_BUCKET = extern struct {
    MaxPhysicalMemory: DWORD64,
    PhysicalMemoryPercent: [3]DWORD,
};

pub const PHIBERFILE_BUCKET = ?*HIBERFILE_BUCKET;
pub const SYSTEM_POWER_CAPABILITIES = extern struct {
    PowerButtonPresent: BOOLEAN,
    SleepButtonPresent: BOOLEAN,
    LidPresent: BOOLEAN,
    SystemS1: BOOLEAN,
    SystemS2: BOOLEAN,
    SystemS3: BOOLEAN,
    SystemS4: BOOLEAN,
    SystemS5: BOOLEAN,
    HiberFilePresent: BOOLEAN,
    FullWake: BOOLEAN,
    VideoDimPresent: BOOLEAN,
    ApmPresent: BOOLEAN,
    UpsPresent: BOOLEAN,
    ThermalControl: BOOLEAN,
    ProcessorThrottle: BOOLEAN,
    ProcessorMinThrottle: BYTE,
    ProcessorMaxThrottle: BYTE,
    FastSystemS4: BOOLEAN,
    Hiberboot: BOOLEAN,
    WakeAlarmPresent: BOOLEAN,
    AoAc: BOOLEAN,
    DiskSpinDown: BOOLEAN,
    HiberFileType: BYTE,
    AoAcConnectivitySupported: BOOLEAN,
    spare3: [6]BYTE,
    SystemBatteriesPresent: BOOLEAN,
    BatteriesAreShortTerm: BOOLEAN,
    BatteryScale: [3]BATTERY_REPORTING_SCALE,
    AcOnLineWake: SYSTEM_POWER_STATE,
    SoftLidWake: SYSTEM_POWER_STATE,
    RtcWake: SYSTEM_POWER_STATE,
    MinDeviceWakeState: SYSTEM_POWER_STATE,
    DefaultLowLatencyWake: SYSTEM_POWER_STATE,
};
pub const PSYSTEM_POWER_CAPABILITIES = ?*extern struct {
    PowerButtonPresent: BOOLEAN,
    SleepButtonPresent: BOOLEAN,
    LidPresent: BOOLEAN,
    SystemS1: BOOLEAN,
    SystemS2: BOOLEAN,
    SystemS3: BOOLEAN,
    SystemS4: BOOLEAN,
    SystemS5: BOOLEAN,
    HiberFilePresent: BOOLEAN,
    FullWake: BOOLEAN,
    VideoDimPresent: BOOLEAN,
    ApmPresent: BOOLEAN,
    UpsPresent: BOOLEAN,
    ThermalControl: BOOLEAN,
    ProcessorThrottle: BOOLEAN,
    ProcessorMinThrottle: BYTE,
    ProcessorMaxThrottle: BYTE,
    FastSystemS4: BOOLEAN,
    Hiberboot: BOOLEAN,
    WakeAlarmPresent: BOOLEAN,
    AoAc: BOOLEAN,
    DiskSpinDown: BOOLEAN,
    HiberFileType: BYTE,
    AoAcConnectivitySupported: BOOLEAN,
    spare3: [6]BYTE,
    SystemBatteriesPresent: BOOLEAN,
    BatteriesAreShortTerm: BOOLEAN,
    BatteryScale: [3]BATTERY_REPORTING_SCALE,
    AcOnLineWake: SYSTEM_POWER_STATE,
    SoftLidWake: SYSTEM_POWER_STATE,
    RtcWake: SYSTEM_POWER_STATE,
    MinDeviceWakeState: SYSTEM_POWER_STATE,
    DefaultLowLatencyWake: SYSTEM_POWER_STATE,
};
pub const SYSTEM_BATTERY_STATE = extern struct {
    AcOnLine: BOOLEAN,
    BatteryPresent: BOOLEAN,
    Charging: BOOLEAN,
    Discharging: BOOLEAN,
    Spare1: [3]BOOLEAN,
    Tag: BYTE,
    MaxCapacity: DWORD,
    RemainingCapacity: DWORD,
    Rate: DWORD,
    EstimatedTime: DWORD,
    DefaultAlert1: DWORD,
    DefaultAlert2: DWORD,
};
pub const PSYSTEM_BATTERY_STATE = ?*extern struct {
    AcOnLine: BOOLEAN,
    BatteryPresent: BOOLEAN,
    Charging: BOOLEAN,
    Discharging: BOOLEAN,
    Spare1: [3]BOOLEAN,
    Tag: BYTE,
    MaxCapacity: DWORD,
    RemainingCapacity: DWORD,
    Rate: DWORD,
    EstimatedTime: DWORD,
    DefaultAlert1: DWORD,
    DefaultAlert2: DWORD,
};
pub const IMAGE_DOS_HEADER = extern struct {
    e_magic: WORD,
    e_cblp: WORD,
    e_cp: WORD,
    e_crlc: WORD,
    e_cparhdr: WORD,
    e_minalloc: WORD,
    e_maxalloc: WORD,
    e_ss: WORD,
    e_sp: WORD,
    e_csum: WORD,
    e_ip: WORD,
    e_cs: WORD,
    e_lfarlc: WORD,
    e_ovno: WORD,
    e_res: [4]WORD,
    e_oemid: WORD,
    e_oeminfo: WORD,
    e_res2: [10]WORD,
    e_lfanew: LONG,
};

pub const PIMAGE_DOS_HEADER = ?*IMAGE_DOS_HEADER;
pub const IMAGE_OS2_HEADER = extern struct {
    ne_magic: WORD,
    ne_ver: CHAR,
    ne_rev: CHAR,
    ne_enttab: WORD,
    ne_cbenttab: WORD,
    ne_crc: LONG,
    ne_flags: WORD,
    ne_autodata: WORD,
    ne_heap: WORD,
    ne_stack: WORD,
    ne_csip: LONG,
    ne_sssp: LONG,
    ne_cseg: WORD,
    ne_cmod: WORD,
    ne_cbnrestab: WORD,
    ne_segtab: WORD,
    ne_rsrctab: WORD,
    ne_restab: WORD,
    ne_modtab: WORD,
    ne_imptab: WORD,
    ne_nrestab: LONG,
    ne_cmovent: WORD,
    ne_align: WORD,
    ne_cres: WORD,
    ne_exetyp: BYTE,
    ne_flagsothers: BYTE,
    ne_pretthunks: WORD,
    ne_psegrefbytes: WORD,
    ne_swaparea: WORD,
    ne_expver: WORD,
};

pub const PIMAGE_OS2_HEADER = ?*IMAGE_OS2_HEADER;
pub const IMAGE_VXD_HEADER = extern struct {
    e32_magic: WORD,
    e32_border: BYTE,
    e32_worder: BYTE,
    e32_level: DWORD,
    e32_cpu: WORD,
    e32_os: WORD,
    e32_ver: DWORD,
    e32_mflags: DWORD,
    e32_mpages: DWORD,
    e32_startobj: DWORD,
    e32_eip: DWORD,
    e32_stackobj: DWORD,
    e32_esp: DWORD,
    e32_pagesize: DWORD,
    e32_lastpagesize: DWORD,
    e32_fixupsize: DWORD,
    e32_fixupsum: DWORD,
    e32_ldrsize: DWORD,
    e32_ldrsum: DWORD,
    e32_objtab: DWORD,
    e32_objcnt: DWORD,
    e32_objmap: DWORD,
    e32_itermap: DWORD,
    e32_rsrctab: DWORD,
    e32_rsrccnt: DWORD,
    e32_restab: DWORD,
    e32_enttab: DWORD,
    e32_dirtab: DWORD,
    e32_dircnt: DWORD,
    e32_fpagetab: DWORD,
    e32_frectab: DWORD,
    e32_impmod: DWORD,
    e32_impmodcnt: DWORD,
    e32_impproc: DWORD,
    e32_pagesum: DWORD,
    e32_datapage: DWORD,
    e32_preload: DWORD,
    e32_nrestab: DWORD,
    e32_cbnrestab: DWORD,
    e32_nressum: DWORD,
    e32_autodata: DWORD,
    e32_debuginfo: DWORD,
    e32_debuglen: DWORD,
    e32_instpreload: DWORD,
    e32_instdemand: DWORD,
    e32_heapsize: DWORD,
    e32_res3: [12]BYTE,
    e32_winresoff: DWORD,
    e32_winreslen: DWORD,
    e32_devid: WORD,
    e32_ddkver: WORD,
};

pub const PIMAGE_VXD_HEADER = ?*IMAGE_VXD_HEADER;
pub const IMAGE_FILE_HEADER = extern struct {
    Machine: WORD,
    NumberOfSections: WORD,
    TimeDateStamp: DWORD,
    PointerToSymbolTable: DWORD,
    NumberOfSymbols: DWORD,
    SizeOfOptionalHeader: WORD,
    Characteristics: WORD,
};

pub const PIMAGE_FILE_HEADER = ?*IMAGE_FILE_HEADER;
pub const IMAGE_DATA_DIRECTORY = extern struct {
    VirtualAddress: DWORD,
    Size: DWORD,
};

pub const PIMAGE_DATA_DIRECTORY = ?*IMAGE_DATA_DIRECTORY;
pub const IMAGE_OPTIONAL_HEADER = extern struct {
    Magic: WORD,
    MajorLinkerVersion: BYTE,
    MinorLinkerVersion: BYTE,
    SizeOfCode: DWORD,
    SizeOfInitializedData: DWORD,
    SizeOfUninitializedData: DWORD,
    AddressOfEntryPoint: DWORD,
    BaseOfCode: DWORD,
    BaseOfData: DWORD,
    ImageBase: DWORD,
    SectionAlignment: DWORD,
    FileAlignment: DWORD,
    MajorOperatingSystemVersion: WORD,
    MinorOperatingSystemVersion: WORD,
    MajorImageVersion: WORD,
    MinorImageVersion: WORD,
    MajorSubsystemVersion: WORD,
    MinorSubsystemVersion: WORD,
    Win32VersionValue: DWORD,
    SizeOfImage: DWORD,
    SizeOfHeaders: DWORD,
    CheckSum: DWORD,
    Subsystem: WORD,
    DllCharacteristics: WORD,
    SizeOfStackReserve: DWORD,
    SizeOfStackCommit: DWORD,
    SizeOfHeapReserve: DWORD,
    SizeOfHeapCommit: DWORD,
    LoaderFlags: DWORD,
    NumberOfRvaAndSizes: DWORD,
    DataDirectory: [16]IMAGE_DATA_DIRECTORY,
};
pub const IMAGE_OPTIONAL_HEADER32 = IMAGE_OPTIONAL_HEADER;
pub const PIMAGE_OPTIONAL_HEADER32 = ?*IMAGE_OPTIONAL_HEADER;
pub const IMAGE_ROM_OPTIONAL_HEADER = extern struct {
    Magic: WORD,
    MajorLinkerVersion: BYTE,
    MinorLinkerVersion: BYTE,
    SizeOfCode: DWORD,
    SizeOfInitializedData: DWORD,
    SizeOfUninitializedData: DWORD,
    AddressOfEntryPoint: DWORD,
    BaseOfCode: DWORD,
    BaseOfData: DWORD,
    BaseOfBss: DWORD,
    GprMask: DWORD,
    CprMask: [4]DWORD,
    GpValue: DWORD,
};

pub const PIMAGE_ROM_OPTIONAL_HEADER = ?*IMAGE_ROM_OPTIONAL_HEADER;
pub const IMAGE_OPTIONAL_HEADER64 = extern struct {
    Magic: WORD,
    MajorLinkerVersion: BYTE,
    MinorLinkerVersion: BYTE,
    SizeOfCode: DWORD,
    SizeOfInitializedData: DWORD,
    SizeOfUninitializedData: DWORD,
    AddressOfEntryPoint: DWORD,
    BaseOfCode: DWORD,
    ImageBase: ULONGLONG,
    SectionAlignment: DWORD,
    FileAlignment: DWORD,
    MajorOperatingSystemVersion: WORD,
    MinorOperatingSystemVersion: WORD,
    MajorImageVersion: WORD,
    MinorImageVersion: WORD,
    MajorSubsystemVersion: WORD,
    MinorSubsystemVersion: WORD,
    Win32VersionValue: DWORD,
    SizeOfImage: DWORD,
    SizeOfHeaders: DWORD,
    CheckSum: DWORD,
    Subsystem: WORD,
    DllCharacteristics: WORD,
    SizeOfStackReserve: ULONGLONG,
    SizeOfStackCommit: ULONGLONG,
    SizeOfHeapReserve: ULONGLONG,
    SizeOfHeapCommit: ULONGLONG,
    LoaderFlags: DWORD,
    NumberOfRvaAndSizes: DWORD,
    DataDirectory: [16]IMAGE_DATA_DIRECTORY,
};

pub const PIMAGE_OPTIONAL_HEADER64 = ?*IMAGE_OPTIONAL_HEADER64;
pub const PIMAGE_OPTIONAL_HEADER = PIMAGE_OPTIONAL_HEADER64;
pub const IMAGE_NT_HEADERS64 = extern struct {
    Signature: DWORD,
    FileHeader: IMAGE_FILE_HEADER,
    OptionalHeader: IMAGE_OPTIONAL_HEADER64,
};

pub const PIMAGE_NT_HEADERS64 = ?*IMAGE_NT_HEADERS64;
pub const IMAGE_NT_HEADERS = extern struct {
    Signature: DWORD,
    FileHeader: IMAGE_FILE_HEADER,
    OptionalHeader: IMAGE_OPTIONAL_HEADER32,
};
pub const IMAGE_NT_HEADERS32 = IMAGE_NT_HEADERS;
pub const PIMAGE_NT_HEADERS32 = ?*IMAGE_NT_HEADERS;
pub const IMAGE_ROM_HEADERS = extern struct {
    FileHeader: IMAGE_FILE_HEADER,
    OptionalHeader: IMAGE_ROM_OPTIONAL_HEADER,
};

pub const PIMAGE_ROM_HEADERS = ?*IMAGE_ROM_HEADERS;
pub const PIMAGE_NT_HEADERS = PIMAGE_NT_HEADERS64;
pub const ANON_OBJECT_HEADER = extern struct {
    Sig1: WORD,
    Sig2: WORD,
    Version: WORD,
    Machine: WORD,
    TimeDateStamp: DWORD,
    ClassID: CLSID,
    SizeOfData: DWORD,
};

pub const ANON_OBJECT_HEADER_V2 = extern struct {
    Sig1: WORD,
    Sig2: WORD,
    Version: WORD,
    Machine: WORD,
    TimeDateStamp: DWORD,
    ClassID: CLSID,
    SizeOfData: DWORD,
    Flags: DWORD,
    MetaDataSize: DWORD,
    MetaDataOffset: DWORD,
};

pub const ANON_OBJECT_HEADER_BIGOBJ = extern struct {
    Sig1: WORD,
    Sig2: WORD,
    Version: WORD,
    Machine: WORD,
    TimeDateStamp: DWORD,
    ClassID: CLSID,
    SizeOfData: DWORD,
    Flags: DWORD,
    MetaDataSize: DWORD,
    MetaDataOffset: DWORD,
    NumberOfSections: DWORD,
    PointerToSymbolTable: DWORD,
    NumberOfSymbols: DWORD,
};

pub const IMAGE_SECTION_HEADER = extern struct {
    Name: [8]BYTE,
    Misc: extern union {
        PhysicalAddress: DWORD,
        VirtualSize: DWORD,
    },
    VirtualAddress: DWORD,
    SizeOfRawData: DWORD,
    PointerToRawData: DWORD,
    PointerToRelocations: DWORD,
    PointerToLinenumbers: DWORD,
    NumberOfRelocations: WORD,
    NumberOfLinenumbers: WORD,
    Characteristics: DWORD,
};

pub const PIMAGE_SECTION_HEADER = ?*IMAGE_SECTION_HEADER;
pub const IMAGE_SYMBOL = extern struct {
    N: extern union {
        ShortName: [8]BYTE,
        Name: extern struct {
            Short: DWORD,
            Long: DWORD,
        },
        LongName: [2]DWORD,
    },
    Value: DWORD,
    SectionNumber: SHORT,
    Type: WORD,
    StorageClass: BYTE,
    NumberOfAuxSymbols: BYTE,
};

pub const PIMAGE_SYMBOL = ?*IMAGE_SYMBOL;
pub const IMAGE_SYMBOL_EX = extern struct {
    N: extern union {
        ShortName: [8]BYTE,
        Name: extern struct {
            Short: DWORD,
            Long: DWORD,
        },
        LongName: [2]DWORD,
    },
    Value: DWORD,
    SectionNumber: LONG,
    Type: WORD,
    StorageClass: BYTE,
    NumberOfAuxSymbols: BYTE,
};

pub const PIMAGE_SYMBOL_EX = ?*IMAGE_SYMBOL_EX;
pub const IMAGE_AUX_SYMBOL_TOKEN_DEF = extern struct {
    bAuxType: BYTE,
    bReserved: BYTE,
    SymbolTableIndex: DWORD,
    rgbReserved: [12]BYTE,
};

pub const PIMAGE_AUX_SYMBOL_TOKEN_DEF = ?*IMAGE_AUX_SYMBOL_TOKEN_DEF;
pub const IMAGE_AUX_SYMBOL = extern union {
    Sym: extern struct {
        TagIndex: DWORD,
        Misc: extern union {
            LnSz: extern struct {
                Linenumber: WORD,
                Size: WORD,
            },
            TotalSize: DWORD,
        },
        FcnAry: extern union {
            Function: extern struct {
                PointerToLinenumber: DWORD,
                PointerToNextFunction: DWORD,
            },
            Array: extern struct {
                Dimension: [4]WORD,
            },
        },
        TvIndex: WORD,
    },
    File: extern struct {
        Name: [18]BYTE,
    },
    Section: extern struct {
        Length: DWORD,
        NumberOfRelocations: WORD,
        NumberOfLinenumbers: WORD,
        CheckSum: DWORD,
        Number: SHORT,
        Selection: BYTE,
        bReserved: BYTE,
        HighNumber: SHORT,
    },
    TokenDef: IMAGE_AUX_SYMBOL_TOKEN_DEF,
    CRC: extern struct {
        crc: DWORD,
        rgbReserved: [14]BYTE,
    },
};

pub const PIMAGE_AUX_SYMBOL = ?*IMAGE_AUX_SYMBOL;
pub const IMAGE_AUX_SYMBOL_EX = extern union {
    Sym: extern struct {
        WeakDefaultSymIndex: DWORD,
        WeakSearchType: DWORD,
        rgbReserved: [12]BYTE,
    },
    File: extern struct {
        Name: [20]BYTE,
    },
    Section: extern struct {
        Length: DWORD,
        NumberOfRelocations: WORD,
        NumberOfLinenumbers: WORD,
        CheckSum: DWORD,
        Number: SHORT,
        Selection: BYTE,
        bReserved: BYTE,
        HighNumber: SHORT,
        rgbReserved: [2]BYTE,
    },
    s: extern struct {
        TokenDef: IMAGE_AUX_SYMBOL_TOKEN_DEF,
        rgbReserved: [2]BYTE,
    },
    CRC: extern struct {
        crc: DWORD,
        rgbReserved: [16]BYTE,
    },
};

pub const PIMAGE_AUX_SYMBOL_EX = ?*IMAGE_AUX_SYMBOL_EX;
pub const IMAGE_AUX_SYMBOL_TYPE = c_int;

pub const IMAGE_RELOCATION = extern struct {
    u: extern union {
        VirtualAddress: DWORD,
        RelocCount: DWORD,
    },
    SymbolTableIndex: DWORD,
    Type: WORD,
};

pub const PIMAGE_RELOCATION = ?*IMAGE_RELOCATION;
pub const IMAGE_LINENUMBER = extern struct {
    Type: extern union {
        SymbolTableIndex: DWORD,
        VirtualAddress: DWORD,
    },
    Linenumber: WORD,
};

pub const PIMAGE_LINENUMBER = ?*IMAGE_LINENUMBER;
pub const IMAGE_BASE_RELOCATION = extern struct {
    VirtualAddress: DWORD,
    SizeOfBlock: DWORD,
};

pub const PIMAGE_BASE_RELOCATION = ?*IMAGE_BASE_RELOCATION;
pub const IMAGE_ARCHIVE_MEMBER_HEADER = extern struct {
    Name: [16]BYTE,
    Date: [12]BYTE,
    UserID: [6]BYTE,
    GroupID: [6]BYTE,
    Mode: [8]BYTE,
    Size: [10]BYTE,
    EndHeader: [2]BYTE,
};

pub const PIMAGE_ARCHIVE_MEMBER_HEADER = ?*IMAGE_ARCHIVE_MEMBER_HEADER;
pub const IMAGE_EXPORT_DIRECTORY = extern struct {
    Characteristics: DWORD,
    TimeDateStamp: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    Name: DWORD,
    Base: DWORD,
    NumberOfFunctions: DWORD,
    NumberOfNames: DWORD,
    AddressOfFunctions: DWORD,
    AddressOfNames: DWORD,
    AddressOfNameOrdinals: DWORD,
};

pub const PIMAGE_EXPORT_DIRECTORY = ?*IMAGE_EXPORT_DIRECTORY;
pub const IMAGE_IMPORT_BY_NAME = extern struct {
    Hint: WORD,
    Name: [1]CHAR,
};

pub const PIMAGE_IMPORT_BY_NAME = ?*IMAGE_IMPORT_BY_NAME;
pub const IMAGE_THUNK_DATA64 = extern struct {
    u1: extern union {
        ForwarderString: ULONGLONG,
        Function: ULONGLONG,
        Ordinal: ULONGLONG,
        AddressOfData: ULONGLONG,
    },
};

pub const PIMAGE_THUNK_DATA64 = ?*IMAGE_THUNK_DATA64;
pub const IMAGE_THUNK_DATA32 = extern struct {
    u1: extern union {
        ForwarderString: DWORD,
        Function: DWORD,
        Ordinal: DWORD,
        AddressOfData: DWORD,
    },
};

pub const PIMAGE_THUNK_DATA32 = ?*IMAGE_THUNK_DATA32;
pub const PIMAGE_TLS_CALLBACK = ?extern fn(PVOID, DWORD, PVOID) void;
pub const IMAGE_TLS_DIRECTORY64 = extern struct {
    StartAddressOfRawData: ULONGLONG,
    EndAddressOfRawData: ULONGLONG,
    AddressOfIndex: ULONGLONG,
    AddressOfCallBacks: ULONGLONG,
    SizeOfZeroFill: DWORD,
    u: extern union {
        Characteristics: DWORD,
        s: packed struct {
            Reserved0: @IntType(false, 20),
            Alignment: @IntType(false, 4),
            Reserved1: @IntType(false, 8),
        },
    },
};

pub const PIMAGE_TLS_DIRECTORY64 = ?*IMAGE_TLS_DIRECTORY64;
pub const IMAGE_TLS_DIRECTORY32 = extern struct {
    StartAddressOfRawData: DWORD,
    EndAddressOfRawData: DWORD,
    AddressOfIndex: DWORD,
    AddressOfCallBacks: DWORD,
    SizeOfZeroFill: DWORD,
    u: extern union {
        Characteristics: DWORD,
        s: packed struct {
            Reserved0: @IntType(false, 20),
            Alignment: @IntType(false, 4),
            Reserved1: @IntType(false, 8),
        },
    },
};

pub const PIMAGE_TLS_DIRECTORY32 = ?*IMAGE_TLS_DIRECTORY32;
pub const IMAGE_THUNK_DATA = IMAGE_THUNK_DATA64;
pub const PIMAGE_THUNK_DATA = PIMAGE_THUNK_DATA64;
pub const IMAGE_TLS_DIRECTORY = IMAGE_TLS_DIRECTORY64;
pub const PIMAGE_TLS_DIRECTORY = PIMAGE_TLS_DIRECTORY64;
pub const IMAGE_IMPORT_DESCRIPTOR = extern struct {
    u: extern union {
        Characteristics: DWORD,
        OriginalFirstThunk: DWORD,
    },
    TimeDateStamp: DWORD,
    ForwarderChain: DWORD,
    Name: DWORD,
    FirstThunk: DWORD,
};

pub const PIMAGE_IMPORT_DESCRIPTOR = ?*IMAGE_IMPORT_DESCRIPTOR;
pub const IMAGE_BOUND_IMPORT_DESCRIPTOR = extern struct {
    TimeDateStamp: DWORD,
    OffsetModuleName: WORD,
    NumberOfModuleForwarderRefs: WORD,
};

pub const PIMAGE_BOUND_IMPORT_DESCRIPTOR = ?*IMAGE_BOUND_IMPORT_DESCRIPTOR;
pub const IMAGE_BOUND_FORWARDER_REF = extern struct {
    TimeDateStamp: DWORD,
    OffsetModuleName: WORD,
    Reserved: WORD,
};

pub const PIMAGE_BOUND_FORWARDER_REF = ?*IMAGE_BOUND_FORWARDER_REF;
pub const IMAGE_DELAYLOAD_DESCRIPTOR = extern struct {
    Attributes: extern union {
        AllAttributes: DWORD,
        s: packed struct {
            RvaBased: @IntType(false, 1),
            ReservedAttributes: @IntType(false, 31),
        },
    },
    DllNameRVA: DWORD,
    ModuleHandleRVA: DWORD,
    ImportAddressTableRVA: DWORD,
    ImportNameTableRVA: DWORD,
    BoundImportAddressTableRVA: DWORD,
    UnloadInformationTableRVA: DWORD,
    TimeDateStamp: DWORD,
};

pub const PIMAGE_DELAYLOAD_DESCRIPTOR = ?*IMAGE_DELAYLOAD_DESCRIPTOR;
pub const PCIMAGE_DELAYLOAD_DESCRIPTOR = ?*const IMAGE_DELAYLOAD_DESCRIPTOR;
pub const IMAGE_RESOURCE_DIRECTORY = extern struct {
    Characteristics: DWORD,
    TimeDateStamp: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    NumberOfNamedEntries: WORD,
    NumberOfIdEntries: WORD,
};

pub const PIMAGE_RESOURCE_DIRECTORY = ?*IMAGE_RESOURCE_DIRECTORY;
pub const IMAGE_RESOURCE_DIRECTORY_ENTRY = extern struct {
    u: extern union {
        s: packed struct {
            NameOffset: @IntType(false, 31),
            NameIsString: @IntType(false, 1),
        },
        Name: DWORD,
        Id: WORD,
    },
    u2: extern union {
        OffsetToData: DWORD,
        s: packed struct {
            OffsetToDirectory: @IntType(false, 31),
            DataIsDirectory: @IntType(false, 1),
        },
    },
};

pub const PIMAGE_RESOURCE_DIRECTORY_ENTRY = ?*IMAGE_RESOURCE_DIRECTORY_ENTRY;
pub const IMAGE_RESOURCE_DIRECTORY_STRING = extern struct {
    Length: WORD,
    NameString: [1]CHAR,
};

pub const PIMAGE_RESOURCE_DIRECTORY_STRING = ?*IMAGE_RESOURCE_DIRECTORY_STRING;
pub const IMAGE_RESOURCE_DIR_STRING_U = extern struct {
    Length: WORD,
    NameString: [1]WCHAR,
};

pub const PIMAGE_RESOURCE_DIR_STRING_U = ?*IMAGE_RESOURCE_DIR_STRING_U;
pub const IMAGE_RESOURCE_DATA_ENTRY = extern struct {
    OffsetToData: DWORD,
    Size: DWORD,
    CodePage: DWORD,
    Reserved: DWORD,
};

pub const PIMAGE_RESOURCE_DATA_ENTRY = ?*IMAGE_RESOURCE_DATA_ENTRY;
pub const IMAGE_LOAD_CONFIG_CODE_INTEGRITY = extern struct {
    Flags: WORD,
    Catalog: WORD,
    CatalogOffset: DWORD,
    Reserved: DWORD,
};

pub const PIMAGE_LOAD_CONFIG_CODE_INTEGRITY = ?*IMAGE_LOAD_CONFIG_CODE_INTEGRITY;
pub const IMAGE_DYNAMIC_RELOCATION_TABLE = extern struct {
    Version: DWORD,
    Size: DWORD,
};

pub const PIMAGE_DYNAMIC_RELOCATION_TABLE = ?*IMAGE_DYNAMIC_RELOCATION_TABLE;
pub const IMAGE_DYNAMIC_RELOCATION32 = extern struct {
    Symbol: DWORD,
    BaseRelocSize: DWORD,
};

pub const PIMAGE_DYNAMIC_RELOCATION32 = ?*IMAGE_DYNAMIC_RELOCATION32;
pub const IMAGE_DYNAMIC_RELOCATION64 = extern struct {
    Symbol: ULONGLONG,
    BaseRelocSize: DWORD,
};

pub const PIMAGE_DYNAMIC_RELOCATION64 = ?*IMAGE_DYNAMIC_RELOCATION64;
pub const IMAGE_DYNAMIC_RELOCATION32_V2 = extern struct {
    HeaderSize: DWORD,
    FixupInfoSize: DWORD,
    Symbol: DWORD,
    SymbolGroup: DWORD,
    Flags: DWORD,
};

pub const PIMAGE_DYNAMIC_RELOCATION32_V2 = ?*IMAGE_DYNAMIC_RELOCATION32_V2;
pub const IMAGE_DYNAMIC_RELOCATION64_V2 = extern struct {
    HeaderSize: DWORD,
    FixupInfoSize: DWORD,
    Symbol: ULONGLONG,
    SymbolGroup: DWORD,
    Flags: DWORD,
};

pub const PIMAGE_DYNAMIC_RELOCATION64_V2 = ?*IMAGE_DYNAMIC_RELOCATION64_V2;
pub const IMAGE_DYNAMIC_RELOCATION = IMAGE_DYNAMIC_RELOCATION64;
pub const PIMAGE_DYNAMIC_RELOCATION = PIMAGE_DYNAMIC_RELOCATION64;
pub const IMAGE_DYNAMIC_RELOCATION_V2 = IMAGE_DYNAMIC_RELOCATION64_V2;
pub const PIMAGE_DYNAMIC_RELOCATION_V2 = PIMAGE_DYNAMIC_RELOCATION64_V2;
pub const IMAGE_PROLOGUE_DYNAMIC_RELOCATION_HEADER = extern struct {
    PrologueByteCount: BYTE,
};

pub const PIMAGE_PROLOGUE_DYNAMIC_RELOCATION_HEADER = ?*IMAGE_PROLOGUE_DYNAMIC_RELOCATION_HEADER;
pub const IMAGE_EPILOGUE_DYNAMIC_RELOCATION_HEADER = extern struct {
    EpilogueCount: DWORD,
    EpilogueByteCount: BYTE,
    BranchDescriptorElementSize: BYTE,
    BranchDescriptorCount: WORD,
};

pub const PIMAGE_EPILOGUE_DYNAMIC_RELOCATION_HEADER = ?*IMAGE_EPILOGUE_DYNAMIC_RELOCATION_HEADER;
pub const IMAGE_LOAD_CONFIG_DIRECTORY32 = extern struct {
    Size: DWORD,
    TimeDateStamp: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    GlobalFlagsClear: DWORD,
    GlobalFlagsSet: DWORD,
    CriticalSectionDefaultTimeout: DWORD,
    DeCommitFreeBlockThreshold: DWORD,
    DeCommitTotalFreeThreshold: DWORD,
    LockPrefixTable: DWORD,
    MaximumAllocationSize: DWORD,
    VirtualMemoryThreshold: DWORD,
    ProcessHeapFlags: DWORD,
    ProcessAffinityMask: DWORD,
    CSDVersion: WORD,
    DependentLoadFlags: WORD,
    EditList: DWORD,
    SecurityCookie: DWORD,
    SEHandlerTable: DWORD,
    SEHandlerCount: DWORD,
    GuardCFCheckFunctionPointer: DWORD,
    GuardCFDispatchFunctionPointer: DWORD,
    GuardCFFunctionTable: DWORD,
    GuardCFFunctionCount: DWORD,
    GuardFlags: DWORD,
    CodeIntegrity: IMAGE_LOAD_CONFIG_CODE_INTEGRITY,
    GuardAddressTakenIatEntryTable: DWORD,
    GuardAddressTakenIatEntryCount: DWORD,
    GuardLongJumpTargetTable: DWORD,
    GuardLongJumpTargetCount: DWORD,
    DynamicValueRelocTable: DWORD,
    CHPEMetadataPointer: DWORD,
    GuardRFFailureRoutine: DWORD,
    GuardRFFailureRoutineFunctionPointer: DWORD,
    DynamicValueRelocTableOffset: DWORD,
    DynamicValueRelocTableSection: WORD,
    Reserved2: WORD,
    GuardRFVerifyStackPointerFunctionPointer: DWORD,
    HotPatchTableOffset: DWORD,
    Reserved3: DWORD,
    EnclaveConfigurationPointer: DWORD,
};

pub const PIMAGE_LOAD_CONFIG_DIRECTORY32 = ?*IMAGE_LOAD_CONFIG_DIRECTORY32;
pub const IMAGE_LOAD_CONFIG_DIRECTORY64 = extern struct {
    Size: DWORD,
    TimeDateStamp: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    GlobalFlagsClear: DWORD,
    GlobalFlagsSet: DWORD,
    CriticalSectionDefaultTimeout: DWORD,
    DeCommitFreeBlockThreshold: ULONGLONG,
    DeCommitTotalFreeThreshold: ULONGLONG,
    LockPrefixTable: ULONGLONG,
    MaximumAllocationSize: ULONGLONG,
    VirtualMemoryThreshold: ULONGLONG,
    ProcessAffinityMask: ULONGLONG,
    ProcessHeapFlags: DWORD,
    CSDVersion: WORD,
    DependentLoadFlags: WORD,
    EditList: ULONGLONG,
    SecurityCookie: ULONGLONG,
    SEHandlerTable: ULONGLONG,
    SEHandlerCount: ULONGLONG,
    GuardCFCheckFunctionPointer: ULONGLONG,
    GuardCFDispatchFunctionPointer: ULONGLONG,
    GuardCFFunctionTable: ULONGLONG,
    GuardCFFunctionCount: ULONGLONG,
    GuardFlags: DWORD,
    CodeIntegrity: IMAGE_LOAD_CONFIG_CODE_INTEGRITY,
    GuardAddressTakenIatEntryTable: ULONGLONG,
    GuardAddressTakenIatEntryCount: ULONGLONG,
    GuardLongJumpTargetTable: ULONGLONG,
    GuardLongJumpTargetCount: ULONGLONG,
    DynamicValueRelocTable: ULONGLONG,
    CHPEMetadataPointer: ULONGLONG,
    GuardRFFailureRoutine: ULONGLONG,
    GuardRFFailureRoutineFunctionPointer: ULONGLONG,
    DynamicValueRelocTableOffset: DWORD,
    DynamicValueRelocTableSection: WORD,
    Reserved2: WORD,
    GuardRFVerifyStackPointerFunctionPointer: ULONGLONG,
    HotPatchTableOffset: DWORD,
    Reserved3: DWORD,
    EnclaveConfigurationPointer: ULONGLONG,
};

pub const PIMAGE_LOAD_CONFIG_DIRECTORY64 = ?*IMAGE_LOAD_CONFIG_DIRECTORY64;
pub const IMAGE_LOAD_CONFIG_DIRECTORY = IMAGE_LOAD_CONFIG_DIRECTORY64;
pub const PIMAGE_LOAD_CONFIG_DIRECTORY = PIMAGE_LOAD_CONFIG_DIRECTORY64;
pub const IMAGE_HOT_PATCH_INFO = extern struct {
    Version: DWORD,
    Size: DWORD,
    SequenceNumber: DWORD,
    BaseImageList: DWORD,
    BaseImageCount: DWORD,
    BufferOffset: DWORD,
};

pub const PIMAGE_HOT_PATCH_INFO = ?*IMAGE_HOT_PATCH_INFO;
pub const IMAGE_HOT_PATCH_BASE = extern struct {
    SequenceNumber: DWORD,
    Flags: DWORD,
    OriginalTimeDateStamp: DWORD,
    OriginalCheckSum: DWORD,
    CodeIntegrityInfo: DWORD,
    CodeIntegritySize: DWORD,
    PatchTable: DWORD,
    BufferOffset: DWORD,
};

pub const PIMAGE_HOT_PATCH_BASE = ?*IMAGE_HOT_PATCH_BASE;
pub const IMAGE_HOT_PATCH_HASHES = extern struct {
    SHA256: [32]BYTE,
    SHA1: [20]BYTE,
};

pub const PIMAGE_HOT_PATCH_HASHES = ?*IMAGE_HOT_PATCH_HASHES;
pub const IMAGE_CE_RUNTIME_FUNCTION_ENTRY = extern struct {
    FuncStart: DWORD,
    s: packed struct {
        PrologLen: @IntType(false, 8),
        FuncLen: @IntType(false, 22),
        ThirtyTwoBit: @IntType(false, 1),
        ExceptionFlag: @IntType(false, 1),
    },
};

pub const PIMAGE_CE_RUNTIME_FUNCTION_ENTRY = ?*IMAGE_CE_RUNTIME_FUNCTION_ENTRY;
pub const IMAGE_ARM_RUNTIME_FUNCTION_ENTRY = extern struct {
    BeginAddress: DWORD,
    u: extern union {
        UnwindData: DWORD,
        s: packed struct {
            Flag: @IntType(false, 2),
            FunctionLength: @IntType(false, 11),
            Ret: @IntType(false, 2),
            H: @IntType(false, 1),
            Reg: @IntType(false, 3),
            R: @IntType(false, 1),
            L: @IntType(false, 1),
            C: @IntType(false, 1),
            StackAdjust: @IntType(false, 10),
        },
    },
};

pub const PIMAGE_ARM_RUNTIME_FUNCTION_ENTRY = ?*IMAGE_ARM_RUNTIME_FUNCTION_ENTRY;
pub const IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY = extern struct {
    BeginAddress: DWORD,
    u: extern union {
        UnwindData: DWORD,
        s: packed struct {
            Flag: @IntType(false, 2),
            FunctionLength: @IntType(false, 11),
            RegF: @IntType(false, 3),
            RegI: @IntType(false, 4),
            H: @IntType(false, 1),
            CR: @IntType(false, 2),
            FrameSize: @IntType(false, 9),
        },
    },
};

pub const PIMAGE_ARM64_RUNTIME_FUNCTION_ENTRY = ?*IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY;
pub const IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY = extern struct {
    BeginAddress: ULONGLONG,
    EndAddress: ULONGLONG,
    ExceptionHandler: ULONGLONG,
    HandlerData: ULONGLONG,
    PrologEndAddress: ULONGLONG,
};

pub const PIMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY = ?*IMAGE_ALPHA64_RUNTIME_FUNCTION_ENTRY;
pub const IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY = extern struct {
    BeginAddress: DWORD,
    EndAddress: DWORD,
    ExceptionHandler: DWORD,
    HandlerData: DWORD,
    PrologEndAddress: DWORD,
};

pub const PIMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY = ?*IMAGE_ALPHA_RUNTIME_FUNCTION_ENTRY;

pub const _PIMAGE_RUNTIME_FUNCTION_ENTRY = ?*IMAGE_RUNTIME_FUNCTION_ENTRY;
pub const IMAGE_IA64_RUNTIME_FUNCTION_ENTRY = _IMAGE_RUNTIME_FUNCTION_ENTRY;
pub const PIMAGE_IA64_RUNTIME_FUNCTION_ENTRY = _PIMAGE_RUNTIME_FUNCTION_ENTRY;

pub const PIMAGE_RUNTIME_FUNCTION_ENTRY = _PIMAGE_RUNTIME_FUNCTION_ENTRY;
pub const IMAGE_ENCLAVE_CONFIG32 = extern struct {
    Size: DWORD,
    MinimumRequiredConfigSize: DWORD,
    PolicyFlags: DWORD,
    NumberOfImports: DWORD,
    ImportList: DWORD,
    ImportEntrySize: DWORD,
    FamilyID: [16]BYTE,
    ImageID: [16]BYTE,
    ImageVersion: DWORD,
    SecurityVersion: DWORD,
    EnclaveSize: DWORD,
    NumberOfThreads: DWORD,
    EnclaveFlags: DWORD,
};

pub const PIMAGE_ENCLAVE_CONFIG32 = ?*IMAGE_ENCLAVE_CONFIG32;
pub const IMAGE_ENCLAVE_CONFIG64 = extern struct {
    Size: DWORD,
    MinimumRequiredConfigSize: DWORD,
    PolicyFlags: DWORD,
    NumberOfImports: DWORD,
    ImportList: DWORD,
    ImportEntrySize: DWORD,
    FamilyID: [16]BYTE,
    ImageID: [16]BYTE,
    ImageVersion: DWORD,
    SecurityVersion: DWORD,
    EnclaveSize: ULONGLONG,
    NumberOfThreads: DWORD,
    EnclaveFlags: DWORD,
};

pub const PIMAGE_ENCLAVE_CONFIG64 = ?*IMAGE_ENCLAVE_CONFIG64;
pub const IMAGE_ENCLAVE_CONFIG = IMAGE_ENCLAVE_CONFIG64;
pub const PIMAGE_ENCLAVE_CONFIG = PIMAGE_ENCLAVE_CONFIG64;
pub const IMAGE_ENCLAVE_IMPORT = extern struct {
    MatchType: DWORD,
    MinimumSecurityVersion: DWORD,
    UniqueOrAuthorID: [32]BYTE,
    FamilyID: [16]BYTE,
    ImageID: [16]BYTE,
    ImportName: DWORD,
    Reserved: DWORD,
};

pub const PIMAGE_ENCLAVE_IMPORT = ?*IMAGE_ENCLAVE_IMPORT;
pub const IMAGE_DEBUG_DIRECTORY = extern struct {
    Characteristics: DWORD,
    TimeDateStamp: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    Type: DWORD,
    SizeOfData: DWORD,
    AddressOfRawData: DWORD,
    PointerToRawData: DWORD,
};

pub const PIMAGE_DEBUG_DIRECTORY = ?*IMAGE_DEBUG_DIRECTORY;
pub const IMAGE_COFF_SYMBOLS_HEADER = extern struct {
    NumberOfSymbols: DWORD,
    LvaToFirstSymbol: DWORD,
    NumberOfLinenumbers: DWORD,
    LvaToFirstLinenumber: DWORD,
    RvaToFirstByteOfCode: DWORD,
    RvaToLastByteOfCode: DWORD,
    RvaToFirstByteOfData: DWORD,
    RvaToLastByteOfData: DWORD,
};

pub const PIMAGE_COFF_SYMBOLS_HEADER = ?*IMAGE_COFF_SYMBOLS_HEADER;
pub const FPO_DATA = extern struct {
    ulOffStart: DWORD,
    cbProcSize: DWORD,
    cdwLocals: DWORD,
    cdwParams: WORD,
    s: packed struct {
        cbProlog: @IntType(false, 8),
        cbRegs: @IntType(false, 3),
        fHasSEH: @IntType(false, 1),
        fUseBP: @IntType(false, 1),
        reserved: @IntType(false, 1),
        cbFrame: @IntType(false, 2),
    },
};

pub const PFPO_DATA = ?*FPO_DATA;
pub const IMAGE_DEBUG_MISC = extern struct {
    DataType: DWORD,
    Length: DWORD,
    Unicode: BOOLEAN,
    Reserved: [3]BYTE,
    Data: [1]BYTE,
};

pub const PIMAGE_DEBUG_MISC = ?*IMAGE_DEBUG_MISC;
pub const IMAGE_FUNCTION_ENTRY = extern struct {
    StartingAddress: DWORD,
    EndingAddress: DWORD,
    EndOfPrologue: DWORD,
};

pub const PIMAGE_FUNCTION_ENTRY = ?*IMAGE_FUNCTION_ENTRY;
pub const IMAGE_FUNCTION_ENTRY64 = extern struct {
    StartingAddress: ULONGLONG,
    EndingAddress: ULONGLONG,
    u: extern union {
        EndOfPrologue: ULONGLONG,
        UnwindInfoAddress: ULONGLONG,
    },
};

pub const PIMAGE_FUNCTION_ENTRY64 = ?*IMAGE_FUNCTION_ENTRY64;
pub const IMAGE_SEPARATE_DEBUG_HEADER = extern struct {
    Signature: WORD,
    Flags: WORD,
    Machine: WORD,
    Characteristics: WORD,
    TimeDateStamp: DWORD,
    CheckSum: DWORD,
    ImageBase: DWORD,
    SizeOfImage: DWORD,
    NumberOfSections: DWORD,
    ExportedNamesSize: DWORD,
    DebugDirectorySize: DWORD,
    SectionAlignment: DWORD,
    Reserved: [2]DWORD,
};

pub const PIMAGE_SEPARATE_DEBUG_HEADER = ?*IMAGE_SEPARATE_DEBUG_HEADER;
pub const NON_PAGED_DEBUG_INFO = extern struct {
    Signature: WORD,
    Flags: WORD,
    Size: DWORD,
    Machine: WORD,
    Characteristics: WORD,
    TimeDateStamp: DWORD,
    CheckSum: DWORD,
    SizeOfImage: DWORD,
    ImageBase: ULONGLONG,
};

pub const PNON_PAGED_DEBUG_INFO = ?*NON_PAGED_DEBUG_INFO;
pub const ImageArchitectureHeader = extern struct {
    s: packed struct {
        AmaskValue: @IntType(false, 1),
        _MBZ0: @IntType(true, 7),
        AmaskShift: @IntType(true, 8),
        _MBZ1: @IntType(true, 16),
    },
    FirstEntryRVA: DWORD,
};
pub const IMAGE_ARCHITECTURE_HEADER = ImageArchitectureHeader;
pub const PIMAGE_ARCHITECTURE_HEADER = ?*ImageArchitectureHeader;
pub const ImageArchitectureEntry = extern struct {
    FixupInstRVA: DWORD,
    NewInst: DWORD,
};
pub const IMAGE_ARCHITECTURE_ENTRY = ImageArchitectureEntry;
pub const PIMAGE_ARCHITECTURE_ENTRY = ?*ImageArchitectureEntry;
pub const IMPORT_OBJECT_HEADER = extern struct {
    Sig1: WORD,
    Sig2: WORD,
    Version: WORD,
    Machine: WORD,
    TimeDateStamp: DWORD,
    SizeOfData: DWORD,
    u: extern union {
        Ordinal: WORD,
        Hint: WORD,
    },
    s: packed struct {
        Type: @IntType(false, 2),
        NameType: @IntType(false, 3),
        Reserved: @IntType(false, 11),
    },
};

pub const IMPORT_OBJECT_TYPE = c_int;

pub const IMPORT_OBJECT_NAME_TYPE = c_int;

pub const ReplacesCorHdrNumericDefines = c_int;

pub const IMAGE_COR20_HEADER = extern struct {
    cb: DWORD,
    MajorRuntimeVersion: WORD,
    MinorRuntimeVersion: WORD,
    MetaData: IMAGE_DATA_DIRECTORY,
    Flags: DWORD,
    u: extern union {
        EntryPointToken: DWORD,
        EntryPointRVA: DWORD,
    },
    Resources: IMAGE_DATA_DIRECTORY,
    StrongNameSignature: IMAGE_DATA_DIRECTORY,
    CodeManagerTable: IMAGE_DATA_DIRECTORY,
    VTableFixups: IMAGE_DATA_DIRECTORY,
    ExportAddressTableJumps: IMAGE_DATA_DIRECTORY,
    ManagedNativeHeader: IMAGE_DATA_DIRECTORY,
};

pub const PIMAGE_COR20_HEADER = ?*IMAGE_COR20_HEADER;
pub const SLIST_ENTRY = extern struct {
    Next: ?*SLIST_ENTRY,
};

pub const PSLIST_ENTRY = ?*SLIST_ENTRY;
pub const SLIST_HEADER = extern union {
    s: extern struct {
        Alignment: ULONGLONG,
        Region: ULONGLONG,
    },
    Header8: packed struct {
        Depth: @IntType(false, 16),
        Sequence: @IntType(false, 9),
        NextEntry: @IntType(false, 39),
        HeaderType: @IntType(false, 1),
        Init: @IntType(false, 1),
        Reserved: @IntType(false, 59),
        Region: @IntType(false, 3),
    },
    Header16: packed struct {
        Depth: @IntType(false, 16),
        Sequence: @IntType(false, 48),
        HeaderType: @IntType(false, 1),
        Init: @IntType(false, 1),
        Reserved: @IntType(false, 2),
        NextEntry: @IntType(false, 60),
    },
    HeaderX64: packed struct {
        Depth: @IntType(false, 16),
        Sequence: @IntType(false, 48),
        HeaderType: @IntType(false, 1),
        Reserved: @IntType(false, 3),
        NextEntry: @IntType(false, 60),
    },
};

pub const PSLIST_HEADER = ?*SLIST_HEADER;
pub const RTL_RUN_ONCE = extern union {
    Ptr: PVOID,
};

pub const PRTL_RUN_ONCE = ?*RTL_RUN_ONCE;
pub const RTL_BARRIER = extern struct {
    Reserved1: DWORD,
    Reserved2: DWORD,
    Reserved3: [2]ULONG_PTR,
    Reserved4: DWORD,
    Reserved5: DWORD,
};

pub const PRTL_BARRIER = ?*RTL_BARRIER;
pub const MESSAGE_RESOURCE_ENTRY = extern struct {
    Length: WORD,
    Flags: WORD,
    Text: [1]BYTE,
};

pub const PMESSAGE_RESOURCE_ENTRY = ?*MESSAGE_RESOURCE_ENTRY;
pub const MESSAGE_RESOURCE_BLOCK = extern struct {
    LowId: DWORD,
    HighId: DWORD,
    OffsetToEntries: DWORD,
};

pub const PMESSAGE_RESOURCE_BLOCK = ?*MESSAGE_RESOURCE_BLOCK;
pub const MESSAGE_RESOURCE_DATA = extern struct {
    NumberOfBlocks: DWORD,
    Blocks: [1]MESSAGE_RESOURCE_BLOCK,
};

pub const PMESSAGE_RESOURCE_DATA = ?*MESSAGE_RESOURCE_DATA;
pub const OSVERSIONINFOA = extern struct {
    dwOSVersionInfoSize: DWORD,
    dwMajorVersion: DWORD,
    dwMinorVersion: DWORD,
    dwBuildNumber: DWORD,
    dwPlatformId: DWORD,
    szCSDVersion: [128]CHAR,
};

pub const POSVERSIONINFOA = ?*OSVERSIONINFOA;
pub const LPOSVERSIONINFOA = ?*OSVERSIONINFOA;
pub const OSVERSIONINFOW = extern struct {
    dwOSVersionInfoSize: DWORD,
    dwMajorVersion: DWORD,
    dwMinorVersion: DWORD,
    dwBuildNumber: DWORD,
    dwPlatformId: DWORD,
    szCSDVersion: [128]WCHAR,
};

pub const POSVERSIONINFOW = ?*OSVERSIONINFOW;
pub const LPOSVERSIONINFOW = ?*OSVERSIONINFOW;
pub const RTL_OSVERSIONINFOW = OSVERSIONINFOW;
pub const PRTL_OSVERSIONINFOW = ?*OSVERSIONINFOW;
pub const OSVERSIONINFOEXA = extern struct {
    dwOSVersionInfoSize: DWORD,
    dwMajorVersion: DWORD,
    dwMinorVersion: DWORD,
    dwBuildNumber: DWORD,
    dwPlatformId: DWORD,
    szCSDVersion: [128]CHAR,
    wServicePackMajor: WORD,
    wServicePackMinor: WORD,
    wSuiteMask: WORD,
    wProductType: BYTE,
    wReserved: BYTE,
};

pub const POSVERSIONINFOEXA = ?*OSVERSIONINFOEXA;
pub const LPOSVERSIONINFOEXA = ?*OSVERSIONINFOEXA;
pub const OSVERSIONINFOEXW = extern struct {
    dwOSVersionInfoSize: DWORD,
    dwMajorVersion: DWORD,
    dwMinorVersion: DWORD,
    dwBuildNumber: DWORD,
    dwPlatformId: DWORD,
    szCSDVersion: [128]WCHAR,
    wServicePackMajor: WORD,
    wServicePackMinor: WORD,
    wSuiteMask: WORD,
    wProductType: BYTE,
    wReserved: BYTE,
};

pub const POSVERSIONINFOEXW = ?*OSVERSIONINFOEXW;
pub const LPOSVERSIONINFOEXW = ?*OSVERSIONINFOEXW;
pub const RTL_OSVERSIONINFOEXW = OSVERSIONINFOEXW;
pub const PRTL_OSVERSIONINFOEXW = ?*OSVERSIONINFOEXW;
pub const RTL_UMS_THREAD_INFO_CLASS = c_int;

pub const PRTL_UMS_THREAD_INFO_CLASS = ?*RTL_UMS_THREAD_INFO_CLASS;
pub const RTL_UMS_SCHEDULER_REASON = c_int;

pub const PRTL_UMS_SCHEDULER_REASON = ?*RTL_UMS_SCHEDULER_REASON;
pub const RTL_UMS_SCHEDULER_ENTRY_POINT = extern fn(RTL_UMS_SCHEDULER_REASON, ULONG_PTR, PVOID) void;
pub const PRTL_UMS_SCHEDULER_ENTRY_POINT = ?*RTL_UMS_SCHEDULER_ENTRY_POINT;
pub const OS_DEPLOYEMENT_STATE_VALUES = c_int;

pub const NV_MEMORY_RANGE = extern struct {
    BaseAddress: ?*c_void,
    Length: SIZE_T,
};

pub const PNV_MEMORY_RANGE = ?*NV_MEMORY_RANGE;
pub const CORRELATION_VECTOR = extern struct {
    Version: CHAR,
    Vector: [129]CHAR,
};

pub const PCORRELATION_VECTOR = ?*CORRELATION_VECTOR;
pub const IMAGE_POLICY_ENTRY_TYPE = c_int;

pub const IMAGE_POLICY_ID = c_int;

pub const IMAGE_POLICY_ENTRY = extern struct {
    Type: IMAGE_POLICY_ENTRY_TYPE,
    PolicyId: IMAGE_POLICY_ID,
    u: extern union {
        None: ?*const c_void,
        BoolValue: BOOLEAN,
        Int8Value: INT8,
        UInt8Value: UINT8,
        Int16Value: INT16,
        UInt16Value: UINT16,
        Int32Value: INT32,
        UInt32Value: UINT32,
        Int64Value: INT64,
        UInt64Value: UINT64,
        AnsiStringValue: PCSTR,
        UnicodeStringValue: PCWSTR,
    },
};

pub const PCIMAGE_POLICY_ENTRY = ?*const IMAGE_POLICY_ENTRY;
pub const IMAGE_POLICY_METADATA = extern struct {
    Version: BYTE,
    Reserved0: [7]BYTE,
    ApplicationId: ULONGLONG,
    Policies: &IMAGE_POLICY_ENTRY,
};

pub const PCIMAGE_POLICY_METADATA = ?*const IMAGE_POLICY_METADATA;
pub const PRTL_CRITICAL_SECTION_DEBUG = ?*RTL_CRITICAL_SECTION_DEBUG;
pub const RTL_CRITICAL_SECTION = extern struct {
    DebugInfo: PRTL_CRITICAL_SECTION_DEBUG,
    LockCount: LONG,
    RecursionCount: LONG,
    OwningThread: HANDLE,
    LockSemaphore: HANDLE,
    SpinCount: ULONG_PTR,
};
pub const RTL_CRITICAL_SECTION_DEBUG = extern struct {
    Type: WORD,
    CreatorBackTraceIndex: WORD,
    CriticalSection: ?*RTL_CRITICAL_SECTION,
    ProcessLocksList: LIST_ENTRY,
    EntryCount: DWORD,
    ContentionCount: DWORD,
    Flags: DWORD,
    CreatorBackTraceIndexHigh: WORD,
    SpareWORD: WORD,
};

pub const RTL_RESOURCE_DEBUG = RTL_CRITICAL_SECTION_DEBUG;
pub const PRTL_RESOURCE_DEBUG = ?*RTL_CRITICAL_SECTION_DEBUG;

pub const PRTL_CRITICAL_SECTION = ?*RTL_CRITICAL_SECTION;
pub const RTL_SRWLOCK = extern struct {
    Ptr: PVOID,
};

pub const PRTL_SRWLOCK = ?*RTL_SRWLOCK;
pub const RTL_CONDITION_VARIABLE = extern struct {
    Ptr: PVOID,
};

pub const PRTL_CONDITION_VARIABLE = ?*RTL_CONDITION_VARIABLE;
pub const PAPCFUNC = ?extern fn(ULONG_PTR) void;
pub const PVECTORED_EXCEPTION_HANDLER = ?extern fn(?*EXCEPTION_POINTERS) LONG;
pub const HEAP_INFORMATION_CLASS = c_int;

pub const HEAP_OPTIMIZE_RESOURCES_INFORMATION = extern struct {
    Version: DWORD,
    Flags: DWORD,
};

pub const PHEAP_OPTIMIZE_RESOURCES_INFORMATION = ?*HEAP_OPTIMIZE_RESOURCES_INFORMATION;
pub const WAITORTIMERCALLBACKFUNC = ?extern fn(PVOID, BOOLEAN) void;
pub const WORKERCALLBACKFUNC = ?extern fn(PVOID) void;
pub const APC_CALLBACK_FUNCTION = ?extern fn(DWORD, PVOID, PVOID) void;
pub const WAITORTIMERCALLBACK = WAITORTIMERCALLBACKFUNC;
pub const PFLS_CALLBACK_FUNCTION = ?extern fn(PVOID) void;
pub const PSECURE_MEMORY_CACHE_CALLBACK = ?extern fn(PVOID, SIZE_T) BOOLEAN;
pub const ACTIVATION_CONTEXT_INFO_CLASS = c_int;

pub const ACTIVATION_CONTEXT_QUERY_INDEX = extern struct {
    ulAssemblyIndex: DWORD,
    ulFileIndexInAssembly: DWORD,
};

pub const PACTIVATION_CONTEXT_QUERY_INDEX = ?*ACTIVATION_CONTEXT_QUERY_INDEX;
pub const PCACTIVATION_CONTEXT_QUERY_INDEX = ?*const ACTIVATION_CONTEXT_QUERY_INDEX;
pub const ASSEMBLY_FILE_DETAILED_INFORMATION = extern struct {
    ulFlags: DWORD,
    ulFilenameLength: DWORD,
    ulPathLength: DWORD,
    lpFileName: PCWSTR,
    lpFilePath: PCWSTR,
};

pub const PASSEMBLY_FILE_DETAILED_INFORMATION = ?*ASSEMBLY_FILE_DETAILED_INFORMATION;
pub const PCASSEMBLY_FILE_DETAILED_INFORMATION = ?*const ASSEMBLY_FILE_DETAILED_INFORMATION;
pub const ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION = extern struct {
    ulFlags: DWORD,
    ulEncodedAssemblyIdentityLength: DWORD,
    ulManifestPathType: DWORD,
    ulManifestPathLength: DWORD,
    liManifestLastWriteTime: LARGE_INTEGER,
    ulPolicyPathType: DWORD,
    ulPolicyPathLength: DWORD,
    liPolicyLastWriteTime: LARGE_INTEGER,
    ulMetadataSatelliteRosterIndex: DWORD,
    ulManifestVersionMajor: DWORD,
    ulManifestVersionMinor: DWORD,
    ulPolicyVersionMajor: DWORD,
    ulPolicyVersionMinor: DWORD,
    ulAssemblyDirectoryNameLength: DWORD,
    lpAssemblyEncodedAssemblyIdentity: PCWSTR,
    lpAssemblyManifestPath: PCWSTR,
    lpAssemblyPolicyPath: PCWSTR,
    lpAssemblyDirectoryName: PCWSTR,
    ulFileCount: DWORD,
};

pub const PACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION = ?*ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION;
pub const PCACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION = ?*const ACTIVATION_CONTEXT_ASSEMBLY_DETAILED_INFORMATION;
pub const ACTCTX_REQUESTED_RUN_LEVEL = c_int;
pub const ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION = extern struct {
    ulFlags: DWORD,
    RunLevel: ACTCTX_REQUESTED_RUN_LEVEL,
    UiAccess: DWORD,
};

pub const PACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION = ?*ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION;
pub const PCACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION = ?*const ACTIVATION_CONTEXT_RUN_LEVEL_INFORMATION;
pub const ACTCTX_COMPATIBILITY_ELEMENT_TYPE = c_int;
pub const COMPATIBILITY_CONTEXT_ELEMENT = extern struct {
    Id: GUID,
    Type: ACTCTX_COMPATIBILITY_ELEMENT_TYPE,
};

pub const PCOMPATIBILITY_CONTEXT_ELEMENT = ?*COMPATIBILITY_CONTEXT_ELEMENT;
pub const PCCOMPATIBILITY_CONTEXT_ELEMENT = ?*const COMPATIBILITY_CONTEXT_ELEMENT;
pub const ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION = extern struct {
    ElementCount: DWORD,
    Elements: &COMPATIBILITY_CONTEXT_ELEMENT,
};

pub const PACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION = ?*ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION;
pub const PCACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION = ?*const ACTIVATION_CONTEXT_COMPATIBILITY_INFORMATION;
pub const SUPPORTED_OS_INFO = extern struct {
    MajorVersion: WORD,
    MinorVersion: WORD,
};

pub const PSUPPORTED_OS_INFO = ?*SUPPORTED_OS_INFO;
pub const ACTIVATION_CONTEXT_DETAILED_INFORMATION = extern struct {
    dwFlags: DWORD,
    ulFormatVersion: DWORD,
    ulAssemblyCount: DWORD,
    ulRootManifestPathType: DWORD,
    ulRootManifestPathChars: DWORD,
    ulRootConfigurationPathType: DWORD,
    ulRootConfigurationPathChars: DWORD,
    ulAppDirPathType: DWORD,
    ulAppDirPathChars: DWORD,
    lpRootManifestPath: PCWSTR,
    lpRootConfigurationPath: PCWSTR,
    lpAppDirPath: PCWSTR,
};

pub const PACTIVATION_CONTEXT_DETAILED_INFORMATION = ?*ACTIVATION_CONTEXT_DETAILED_INFORMATION;
pub const PCACTIVATION_CONTEXT_DETAILED_INFORMATION = ?*const ACTIVATION_CONTEXT_DETAILED_INFORMATION;
pub const HARDWARE_COUNTER_DATA = extern struct {
    Type: HARDWARE_COUNTER_TYPE,
    Reserved: DWORD,
    Value: DWORD64,
};

pub const PHARDWARE_COUNTER_DATA = ?*HARDWARE_COUNTER_DATA;
pub const PERFORMANCE_DATA = extern struct {
    Size: WORD,
    Version: BYTE,
    HwCountersCount: BYTE,
    ContextSwitchCount: DWORD,
    WaitReasonBitMap: DWORD64,
    CycleTime: DWORD64,
    RetryCount: DWORD,
    Reserved: DWORD,
    HwCounters: [16]HARDWARE_COUNTER_DATA,
};

pub const PPERFORMANCE_DATA = ?*PERFORMANCE_DATA;
pub const EVENTLOGRECORD = extern struct {
    Length: DWORD,
    Reserved: DWORD,
    RecordNumber: DWORD,
    TimeGenerated: DWORD,
    TimeWritten: DWORD,
    EventID: DWORD,
    EventType: WORD,
    NumStrings: WORD,
    EventCategory: WORD,
    ReservedFlags: WORD,
    ClosingRecordNumber: DWORD,
    StringOffset: DWORD,
    UserSidLength: DWORD,
    UserSidOffset: DWORD,
    DataLength: DWORD,
    DataOffset: DWORD,
};

pub const PEVENTLOGRECORD = ?*EVENTLOGRECORD;
pub const EVENTSFORLOGFILE = extern struct {
    ulSize: DWORD,
    szLogicalLogFile: [256]WCHAR,
    ulNumRecords: DWORD,
    pEventLogRecords: &EVENTLOGRECORD,
};

pub const PEVENTSFORLOGFILE = ?*EVENTSFORLOGFILE;
pub const PACKEDEVENTINFO = extern struct {
    ulSize: DWORD,
    ulNumEventsForLogFile: DWORD,
    ulOffsets: &DWORD,
};

pub const PPACKEDEVENTINFO = ?*PACKEDEVENTINFO;
pub const CM_SERVICE_NODE_TYPE = c_int;
pub const SERVICE_NODE_TYPE = CM_SERVICE_NODE_TYPE;
pub const CM_SERVICE_LOAD_TYPE = c_int;
pub const SERVICE_LOAD_TYPE = CM_SERVICE_LOAD_TYPE;
pub const CM_ERROR_CONTROL_TYPE = c_int;
pub const SERVICE_ERROR_TYPE = CM_ERROR_CONTROL_TYPE;
pub const TAPE_ERASE = extern struct {
    Type: DWORD,
    Immediate: BOOLEAN,
};

pub const PTAPE_ERASE = ?*TAPE_ERASE;
pub const TAPE_PREPARE = extern struct {
    Operation: DWORD,
    Immediate: BOOLEAN,
};

pub const PTAPE_PREPARE = ?*TAPE_PREPARE;
pub const TAPE_WRITE_MARKS = extern struct {
    Type: DWORD,
    Count: DWORD,
    Immediate: BOOLEAN,
};

pub const PTAPE_WRITE_MARKS = ?*TAPE_WRITE_MARKS;
pub const TAPE_GET_POSITION = extern struct {
    Type: DWORD,
    Partition: DWORD,
    Offset: LARGE_INTEGER,
};

pub const PTAPE_GET_POSITION = ?*TAPE_GET_POSITION;
pub const TAPE_SET_POSITION = extern struct {
    Method: DWORD,
    Partition: DWORD,
    Offset: LARGE_INTEGER,
    Immediate: BOOLEAN,
};

pub const PTAPE_SET_POSITION = ?*TAPE_SET_POSITION;
pub const TAPE_GET_DRIVE_PARAMETERS = extern struct {
    ECC: BOOLEAN,
    Compression: BOOLEAN,
    DataPadding: BOOLEAN,
    ReportSetmarks: BOOLEAN,
    DefaultBlockSize: DWORD,
    MaximumBlockSize: DWORD,
    MinimumBlockSize: DWORD,
    MaximumPartitionCount: DWORD,
    FeaturesLow: DWORD,
    FeaturesHigh: DWORD,
    EOTWarningZoneSize: DWORD,
};

pub const PTAPE_GET_DRIVE_PARAMETERS = ?*TAPE_GET_DRIVE_PARAMETERS;
pub const TAPE_SET_DRIVE_PARAMETERS = extern struct {
    ECC: BOOLEAN,
    Compression: BOOLEAN,
    DataPadding: BOOLEAN,
    ReportSetmarks: BOOLEAN,
    EOTWarningZoneSize: DWORD,
};

pub const PTAPE_SET_DRIVE_PARAMETERS = ?*TAPE_SET_DRIVE_PARAMETERS;
pub const TAPE_GET_MEDIA_PARAMETERS = extern struct {
    Capacity: LARGE_INTEGER,
    Remaining: LARGE_INTEGER,
    BlockSize: DWORD,
    PartitionCount: DWORD,
    WriteProtected: BOOLEAN,
};

pub const PTAPE_GET_MEDIA_PARAMETERS = ?*TAPE_GET_MEDIA_PARAMETERS;
pub const TAPE_SET_MEDIA_PARAMETERS = extern struct {
    BlockSize: DWORD,
};

pub const PTAPE_SET_MEDIA_PARAMETERS = ?*TAPE_SET_MEDIA_PARAMETERS;
pub const TAPE_CREATE_PARTITION = extern struct {
    Method: DWORD,
    Count: DWORD,
    Size: DWORD,
};

pub const PTAPE_CREATE_PARTITION = ?*TAPE_CREATE_PARTITION;
pub const TAPE_WMI_OPERATIONS = extern struct {
    Method: DWORD,
    DataBufferSize: DWORD,
    DataBuffer: PVOID,
};

pub const PTAPE_WMI_OPERATIONS = ?*TAPE_WMI_OPERATIONS;
pub const TapeDriveProblemNone = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveProblemNone;
pub const TapeDriveReadWriteWarning = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveReadWriteWarning;
pub const TapeDriveReadWriteError = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveReadWriteError;
pub const TapeDriveReadWarning = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveReadWarning;
pub const TapeDriveWriteWarning = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveWriteWarning;
pub const TapeDriveReadError = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveReadError;
pub const TapeDriveWriteError = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveWriteError;
pub const TapeDriveHardwareError = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveHardwareError;
pub const TapeDriveUnsupportedMedia = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveUnsupportedMedia;
pub const TapeDriveScsiConnectionError = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveScsiConnectionError;
pub const TapeDriveTimetoClean = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveTimetoClean;
pub const TapeDriveCleanDriveNow = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveCleanDriveNow;
pub const TapeDriveMediaLifeExpired = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveMediaLifeExpired;
pub const TapeDriveSnappedTape = TAPE_DRIVE_PROBLEM_TYPE.TapeDriveSnappedTape;
pub const TAPE_DRIVE_PROBLEM_TYPE = extern enum {
    TapeDriveProblemNone,
    TapeDriveReadWriteWarning,
    TapeDriveReadWriteError,
    TapeDriveReadWarning,
    TapeDriveWriteWarning,
    TapeDriveReadError,
    TapeDriveWriteError,
    TapeDriveHardwareError,
    TapeDriveUnsupportedMedia,
    TapeDriveScsiConnectionError,
    TapeDriveTimetoClean,
    TapeDriveCleanDriveNow,
    TapeDriveMediaLifeExpired,
    TapeDriveSnappedTape,
};

pub const UOW = GUID;
pub const PUOW = ?*GUID;
pub const CRM_PROTOCOL_ID = GUID;
pub const PCRM_PROTOCOL_ID = ?*GUID;
pub const NOTIFICATION_MASK = ULONG;
pub const TRANSACTION_NOTIFICATION = extern struct {
    TransactionKey: PVOID,
    TransactionNotification: ULONG,
    TmVirtualClock: LARGE_INTEGER,
    ArgumentLength: ULONG,
};

pub const PTRANSACTION_NOTIFICATION = ?*TRANSACTION_NOTIFICATION;
pub const TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT = extern struct {
    EnlistmentId: GUID,
    UOW: UOW,
};

pub const PTRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT = ?*TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT;
pub const TRANSACTION_NOTIFICATION_TM_ONLINE_ARGUMENT = extern struct {
    TmIdentity: GUID,
    Flags: ULONG,
};

pub const PTRANSACTION_NOTIFICATION_TM_ONLINE_ARGUMENT = ?*TRANSACTION_NOTIFICATION_TM_ONLINE_ARGUMENT;
pub const SAVEPOINT_ID = ULONG;
pub const PSAVEPOINT_ID = ?*ULONG;
pub const TRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT = extern struct {
    SavepointId: SAVEPOINT_ID,
};

pub const PTRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT = ?*TRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT;
pub const TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT = extern struct {
    PropagationCookie: ULONG,
    UOW: GUID,
    TmIdentity: GUID,
    BufferLength: ULONG,
};

pub const PTRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT = ?*TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT;
pub const TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT = extern struct {
    MarshalCookie: ULONG,
    UOW: GUID,
};

pub const PTRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT = ?*TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT;
pub const TRANSACTION_NOTIFICATION_PROMOTE_ARGUMENT = TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT;
pub const PTRANSACTION_NOTIFICATION_PROMOTE_ARGUMENT = ?*TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT;
pub const KCRM_MARSHAL_HEADER = extern struct {
    VersionMajor: ULONG,
    VersionMinor: ULONG,
    NumProtocols: ULONG,
    Unused: ULONG,
};

pub const PKCRM_MARSHAL_HEADER = ?*KCRM_MARSHAL_HEADER;
pub const PRKCRM_MARSHAL_HEADER = ?*KCRM_MARSHAL_HEADER;
pub const KCRM_TRANSACTION_BLOB = extern struct {
    UOW: UOW,
    TmIdentity: GUID,
    IsolationLevel: ULONG,
    IsolationFlags: ULONG,
    Timeout: ULONG,
    Description: [64]WCHAR,
};

pub const PKCRM_TRANSACTION_BLOB = ?*KCRM_TRANSACTION_BLOB;
pub const PRKCRM_TRANSACTION_BLOB = ?*KCRM_TRANSACTION_BLOB;
pub const KCRM_PROTOCOL_BLOB = extern struct {
    ProtocolId: CRM_PROTOCOL_ID,
    StaticInfoLength: ULONG,
    TransactionIdInfoLength: ULONG,
    Unused1: ULONG,
    Unused2: ULONG,
};

pub const PKCRM_PROTOCOL_BLOB = ?*KCRM_PROTOCOL_BLOB;
pub const PRKCRM_PROTOCOL_BLOB = ?*KCRM_PROTOCOL_BLOB;
pub const TRANSACTION_OUTCOME = c_int;

pub const TRANSACTION_STATE = c_int;

pub const TRANSACTION_BASIC_INFORMATION = extern struct {
    TransactionId: GUID,
    State: DWORD,
    Outcome: DWORD,
};

pub const PTRANSACTION_BASIC_INFORMATION = ?*TRANSACTION_BASIC_INFORMATION;
pub const TRANSACTIONMANAGER_BASIC_INFORMATION = extern struct {
    TmIdentity: GUID,
    VirtualClock: LARGE_INTEGER,
};

pub const PTRANSACTIONMANAGER_BASIC_INFORMATION = ?*TRANSACTIONMANAGER_BASIC_INFORMATION;
pub const TRANSACTIONMANAGER_LOG_INFORMATION = extern struct {
    LogIdentity: GUID,
};

pub const PTRANSACTIONMANAGER_LOG_INFORMATION = ?*TRANSACTIONMANAGER_LOG_INFORMATION;
pub const TRANSACTIONMANAGER_LOGPATH_INFORMATION = extern struct {
    LogPathLength: DWORD,
    LogPath: [1]WCHAR,
};

pub const PTRANSACTIONMANAGER_LOGPATH_INFORMATION = ?*TRANSACTIONMANAGER_LOGPATH_INFORMATION;
pub const TRANSACTIONMANAGER_RECOVERY_INFORMATION = extern struct {
    LastRecoveredLsn: ULONGLONG,
};

pub const PTRANSACTIONMANAGER_RECOVERY_INFORMATION = ?*TRANSACTIONMANAGER_RECOVERY_INFORMATION;
pub const TRANSACTIONMANAGER_OLDEST_INFORMATION = extern struct {
    OldestTransactionGuid: GUID,
};

pub const PTRANSACTIONMANAGER_OLDEST_INFORMATION = ?*TRANSACTIONMANAGER_OLDEST_INFORMATION;
pub const TRANSACTION_PROPERTIES_INFORMATION = extern struct {
    IsolationLevel: DWORD,
    IsolationFlags: DWORD,
    Timeout: LARGE_INTEGER,
    Outcome: DWORD,
    DescriptionLength: DWORD,
    Description: [1]WCHAR,
};

pub const PTRANSACTION_PROPERTIES_INFORMATION = ?*TRANSACTION_PROPERTIES_INFORMATION;
pub const TRANSACTION_BIND_INFORMATION = extern struct {
    TmHandle: HANDLE,
};

pub const PTRANSACTION_BIND_INFORMATION = ?*TRANSACTION_BIND_INFORMATION;
pub const TRANSACTION_ENLISTMENT_PAIR = extern struct {
    EnlistmentId: GUID,
    ResourceManagerId: GUID,
};

pub const PTRANSACTION_ENLISTMENT_PAIR = ?*TRANSACTION_ENLISTMENT_PAIR;
pub const TRANSACTION_ENLISTMENTS_INFORMATION = extern struct {
    NumberOfEnlistments: DWORD,
    EnlistmentPair: [1]TRANSACTION_ENLISTMENT_PAIR,
};

pub const PTRANSACTION_ENLISTMENTS_INFORMATION = ?*TRANSACTION_ENLISTMENTS_INFORMATION;
pub const TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION = extern struct {
    SuperiorEnlistmentPair: TRANSACTION_ENLISTMENT_PAIR,
};

pub const PTRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION = ?*TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION;
pub const RESOURCEMANAGER_BASIC_INFORMATION = extern struct {
    ResourceManagerId: GUID,
    DescriptionLength: DWORD,
    Description: [1]WCHAR,
};

pub const PRESOURCEMANAGER_BASIC_INFORMATION = ?*RESOURCEMANAGER_BASIC_INFORMATION;
pub const RESOURCEMANAGER_COMPLETION_INFORMATION = extern struct {
    IoCompletionPortHandle: HANDLE,
    CompletionKey: ULONG_PTR,
};

pub const PRESOURCEMANAGER_COMPLETION_INFORMATION = ?*RESOURCEMANAGER_COMPLETION_INFORMATION;
pub const TransactionBasicInformation = TRANSACTION_INFORMATION_CLASS.TransactionBasicInformation;
pub const TransactionPropertiesInformation = TRANSACTION_INFORMATION_CLASS.TransactionPropertiesInformation;
pub const TransactionEnlistmentInformation = TRANSACTION_INFORMATION_CLASS.TransactionEnlistmentInformation;
pub const TransactionSuperiorEnlistmentInformation = TRANSACTION_INFORMATION_CLASS.TransactionSuperiorEnlistmentInformation;
pub const TransactionBindInformation = TRANSACTION_INFORMATION_CLASS.TransactionBindInformation;
pub const TransactionDTCPrivateInformation = TRANSACTION_INFORMATION_CLASS.TransactionDTCPrivateInformation;
pub const TRANSACTION_INFORMATION_CLASS = extern enum {
    TransactionBasicInformation,
    TransactionPropertiesInformation,
    TransactionEnlistmentInformation,
    TransactionSuperiorEnlistmentInformation,
    TransactionBindInformation,
    TransactionDTCPrivateInformation,
};

pub const TRANSACTIONMANAGER_INFORMATION_CLASS = c_int;

pub const ResourceManagerBasicInformation = RESOURCEMANAGER_INFORMATION_CLASS.ResourceManagerBasicInformation;
pub const ResourceManagerCompletionInformation = RESOURCEMANAGER_INFORMATION_CLASS.ResourceManagerCompletionInformation;
pub const RESOURCEMANAGER_INFORMATION_CLASS = extern enum {
    ResourceManagerBasicInformation,
    ResourceManagerCompletionInformation,
};

pub const ENLISTMENT_BASIC_INFORMATION = extern struct {
    EnlistmentId: GUID,
    TransactionId: GUID,
    ResourceManagerId: GUID,
};

pub const PENLISTMENT_BASIC_INFORMATION = ?*ENLISTMENT_BASIC_INFORMATION;
pub const ENLISTMENT_CRM_INFORMATION = extern struct {
    CrmTransactionManagerId: GUID,
    CrmResourceManagerId: GUID,
    CrmEnlistmentId: GUID,
};

pub const PENLISTMENT_CRM_INFORMATION = ?*ENLISTMENT_CRM_INFORMATION;
pub const EnlistmentBasicInformation = ENLISTMENT_INFORMATION_CLASS.EnlistmentBasicInformation;
pub const EnlistmentRecoveryInformation = ENLISTMENT_INFORMATION_CLASS.EnlistmentRecoveryInformation;
pub const EnlistmentCrmInformation = ENLISTMENT_INFORMATION_CLASS.EnlistmentCrmInformation;
pub const ENLISTMENT_INFORMATION_CLASS = extern enum {
    EnlistmentBasicInformation,
    EnlistmentRecoveryInformation,
    EnlistmentCrmInformation,
};

pub const TRANSACTION_LIST_ENTRY = extern struct {
    UOW: UOW,
};

pub const PTRANSACTION_LIST_ENTRY = ?*TRANSACTION_LIST_ENTRY;
pub const TRANSACTION_LIST_INFORMATION = extern struct {
    NumberOfTransactions: DWORD,
    TransactionInformation: [1]TRANSACTION_LIST_ENTRY,
};

pub const PTRANSACTION_LIST_INFORMATION = ?*TRANSACTION_LIST_INFORMATION;
pub const KTMOBJECT_TRANSACTION = KTMOBJECT_TYPE.KTMOBJECT_TRANSACTION;
pub const KTMOBJECT_TRANSACTION_MANAGER = KTMOBJECT_TYPE.KTMOBJECT_TRANSACTION_MANAGER;
pub const KTMOBJECT_RESOURCE_MANAGER = KTMOBJECT_TYPE.KTMOBJECT_RESOURCE_MANAGER;
pub const KTMOBJECT_ENLISTMENT = KTMOBJECT_TYPE.KTMOBJECT_ENLISTMENT;
pub const KTMOBJECT_INVALID = KTMOBJECT_TYPE.KTMOBJECT_INVALID;
pub const KTMOBJECT_TYPE = extern enum {
    KTMOBJECT_TRANSACTION,
    KTMOBJECT_TRANSACTION_MANAGER,
    KTMOBJECT_RESOURCE_MANAGER,
    KTMOBJECT_ENLISTMENT,
    KTMOBJECT_INVALID,
};

pub const PKTMOBJECT_TYPE = ?*KTMOBJECT_TYPE;
pub const KTMOBJECT_CURSOR = extern struct {
    LastQuery: GUID,
    ObjectIdCount: DWORD,
    ObjectIds: [1]GUID,
};

pub const PKTMOBJECT_CURSOR = ?*KTMOBJECT_CURSOR;
pub const TP_VERSION = DWORD;
pub const PTP_VERSION = ?*DWORD;
pub const TP_CALLBACK_INSTANCE = @OpaqueType();

pub const PTP_CALLBACK_INSTANCE = ?*TP_CALLBACK_INSTANCE;
pub const PTP_SIMPLE_CALLBACK = ?extern fn(PTP_CALLBACK_INSTANCE, PVOID) void;
pub const TP_POOL = @OpaqueType();

pub const PTP_POOL = ?*TP_POOL;
pub const TP_CALLBACK_PRIORITY = c_int;

pub const TP_POOL_STACK_INFORMATION = extern struct {
    StackReserve: SIZE_T,
    StackCommit: SIZE_T,
};

pub const PTP_POOL_STACK_INFORMATION = ?*TP_POOL_STACK_INFORMATION;
pub const TP_CLEANUP_GROUP = @OpaqueType();

pub const PTP_CLEANUP_GROUP = ?*TP_CLEANUP_GROUP;
pub const PTP_CLEANUP_GROUP_CANCEL_CALLBACK = ?extern fn(PVOID, PVOID) void;
pub const ACTIVATION_CONTEXT = @OpaqueType();
pub const TP_CALLBACK_ENVIRON_V3 = extern struct {
    Version: TP_VERSION,
    Pool: PTP_POOL,
    CleanupGroup: PTP_CLEANUP_GROUP,
    CleanupGroupCancelCallback: PTP_CLEANUP_GROUP_CANCEL_CALLBACK,
    RaceDll: PVOID,
    ActivationContext: ?*ACTIVATION_CONTEXT,
    FinalizationCallback: PTP_SIMPLE_CALLBACK,
    u: extern union {
        Flags: DWORD,
        s: @OpaqueType(),
    },
    CallbackPriority: TP_CALLBACK_PRIORITY,
    Size: DWORD,
};

pub const TP_CALLBACK_ENVIRON = TP_CALLBACK_ENVIRON_V3;
pub const PTP_CALLBACK_ENVIRON = ?*TP_CALLBACK_ENVIRON_V3;
pub const TP_WORK = @OpaqueType();

pub const PTP_WORK = ?*TP_WORK;
pub const PTP_WORK_CALLBACK = ?extern fn(PTP_CALLBACK_INSTANCE, PVOID, PTP_WORK) void;
pub const TP_TIMER = @OpaqueType();

pub const PTP_TIMER = ?*TP_TIMER;
pub const PTP_TIMER_CALLBACK = ?extern fn(PTP_CALLBACK_INSTANCE, PVOID, PTP_TIMER) void;
pub const TP_WAIT_RESULT = DWORD;
pub const TP_WAIT = @OpaqueType();

pub const PTP_WAIT = ?*TP_WAIT;
pub const PTP_WAIT_CALLBACK = ?extern fn(PTP_CALLBACK_INSTANCE, PVOID, PTP_WAIT, TP_WAIT_RESULT) void;
pub const TP_IO = @OpaqueType();

pub const PTP_IO = ?*TP_IO;
pub const TEB = @OpaqueType();
pub const WPARAM = UINT_PTR;
pub const LPARAM = LONG_PTR;
pub const LRESULT = LONG_PTR;
pub const SPHANDLE = ?*HANDLE;
pub const LPHANDLE = ?*HANDLE;
pub const HGLOBAL = HANDLE;
pub const HLOCAL = HANDLE;
pub const GLOBALHANDLE = HANDLE;
pub const LOCALHANDLE = HANDLE;
pub const ATOM = WORD;
pub const HKEY__ = extern struct {
    unused: c_int,
};
pub const HKEY = ?*HKEY__;
pub const PHKEY = ?*HKEY;
pub const HMETAFILE__ = extern struct {
    unused: c_int,
};
pub const HMETAFILE = ?*HMETAFILE__;
pub const HINSTANCE__ = extern struct {
    unused: c_int,
};
pub const HINSTANCE = ?*HINSTANCE__;
pub const HMODULE = HINSTANCE;
pub const HRGN__ = extern struct {
    unused: c_int,
};
pub const HRGN = ?*HRGN__;
pub const HRSRC__ = extern struct {
    unused: c_int,
};
pub const HRSRC = ?*HRSRC__;
pub const HSPRITE__ = extern struct {
    unused: c_int,
};
pub const HSPRITE = ?*HSPRITE__;
pub const HLSURF__ = extern struct {
    unused: c_int,
};
pub const HLSURF = ?*HLSURF__;
pub const HSTR__ = extern struct {
    unused: c_int,
};
pub const HSTR = ?[*]HSTR__;
pub const HTASK__ = extern struct {
    unused: c_int,
};
pub const HTASK = ?*HTASK__;
pub const HWINSTA__ = extern struct {
    unused: c_int,
};
pub const HWINSTA = ?*HWINSTA__;
pub const HKL__ = extern struct {
    unused: c_int,
};
pub const HKL = ?*HKL__;
pub const HFILE = c_int;
pub const FILETIME = extern struct {
    dwLowDateTime: DWORD,
    dwHighDateTime: DWORD,
};

pub const PFILETIME = ?*FILETIME;
pub const LPFILETIME = ?*FILETIME;
pub const HWND__ = extern struct {
    unused: c_int,
};
pub const HWND = ?*HWND__;
pub const HHOOK__ = extern struct {
    unused: c_int,
};
pub const HHOOK = ?*HHOOK__;
pub const HGDIOBJ = ?*c_void;
pub const HACCEL__ = extern struct {
    unused: c_int,
};
pub const HACCEL = ?*HACCEL__;
pub const HBITMAP__ = extern struct {
    unused: c_int,
};
pub const HBITMAP = ?*HBITMAP__;
pub const HBRUSH__ = extern struct {
    unused: c_int,
};
pub const HBRUSH = ?*HBRUSH__;
pub const HCOLORSPACE__ = extern struct {
    unused: c_int,
};
pub const HCOLORSPACE = ?*HCOLORSPACE__;
pub const HDC__ = extern struct {
    unused: c_int,
};
pub const HDC = ?*HDC__;
pub const HGLRC__ = extern struct {
    unused: c_int,
};
pub const HGLRC = ?*HGLRC__;
pub const HDESK__ = extern struct {
    unused: c_int,
};
pub const HDESK = ?*HDESK__;
pub const HENHMETAFILE__ = extern struct {
    unused: c_int,
};
pub const HENHMETAFILE = ?*HENHMETAFILE__;
pub const HFONT__ = extern struct {
    unused: c_int,
};
pub const HFONT = ?*HFONT__;
pub const HICON__ = extern struct {
    unused: c_int,
};
pub const HICON = ?*HICON__;
pub const HMENU__ = extern struct {
    unused: c_int,
};
pub const HMENU = ?*HMENU__;
pub const HPALETTE__ = extern struct {
    unused: c_int,
};
pub const HPALETTE = ?*HPALETTE__;
pub const HPEN__ = extern struct {
    unused: c_int,
};
pub const HPEN = ?*HPEN__;
pub const HWINEVENTHOOK__ = extern struct {
    unused: c_int,
};
pub const HWINEVENTHOOK = ?*HWINEVENTHOOK__;
pub const HMONITOR__ = extern struct {
    unused: c_int,
};
pub const HMONITOR = ?*HMONITOR__;
pub const HUMPD__ = extern struct {
    unused: c_int,
};
pub const HUMPD = ?*HUMPD__;
pub const HCURSOR = HICON;
pub const COLORREF = DWORD;
pub const LPCOLORREF = ?*DWORD;
pub const RECT = extern struct {
    left: LONG,
    top: LONG,
    right: LONG,
    bottom: LONG,
};

pub const PRECT = ?*RECT;
pub const NPRECT = ?*RECT;
pub const LPRECT = ?*RECT;
pub const LPCRECT = ?*const RECT;
pub const RECTL = extern struct {
    left: LONG,
    top: LONG,
    right: LONG,
    bottom: LONG,
};

pub const PRECTL = ?*RECTL;
pub const LPRECTL = ?*RECTL;
pub const LPCRECTL = ?*const RECTL;
pub const POINT = extern struct {
    x: LONG,
    y: LONG,
};

pub const PPOINT = ?*POINT;
pub const NPPOINT = ?*POINT;
pub const LPPOINT = ?*POINT;
pub const POINTL = extern struct {
    x: LONG,
    y: LONG,
};

pub const PPOINTL = ?*POINTL;
pub const SIZE = extern struct {
    cx: LONG,
    cy: LONG,
};

pub const PSIZE = ?*SIZE;
pub const LPSIZE = ?*SIZE;
pub const SIZEL = SIZE;
pub const PSIZEL = ?*SIZE;
pub const LPSIZEL = ?*SIZE;
pub const POINTS = extern struct {
    x: SHORT,
    y: SHORT,
};

pub const PPOINTS = ?*POINTS;
pub const LPPOINTS = ?*POINTS;
pub const DPI_AWARENESS_CONTEXT__ = extern struct {
    unused: c_int,
};
pub const DPI_AWARENESS_CONTEXT = ?*DPI_AWARENESS_CONTEXT__;
pub const DPI_AWARENESS = c_int;

pub const SECURITY_ATTRIBUTES = extern struct {
    nLength: DWORD,
    lpSecurityDescriptor: LPVOID,
    bInheritHandle: BOOL,
};

pub const PSECURITY_ATTRIBUTES = ?*SECURITY_ATTRIBUTES;
pub const LPSECURITY_ATTRIBUTES = ?*SECURITY_ATTRIBUTES;
pub const OVERLAPPED = extern struct {
    Internal: ULONG_PTR,
    InternalHigh: ULONG_PTR,
    u: extern union {
        s: extern struct {
            Offset: DWORD,
            OffsetHigh: DWORD,
        },
        Pointer: PVOID,
    },
    hEvent: HANDLE,
};

pub const LPOVERLAPPED = ?*OVERLAPPED;
pub const OVERLAPPED_ENTRY = extern struct {
    lpCompletionKey: ULONG_PTR,
    lpOverlapped: LPOVERLAPPED,
    Internal: ULONG_PTR,
    dwNumberOfBytesTransferred: DWORD,
};

pub const LPOVERLAPPED_ENTRY = ?*OVERLAPPED_ENTRY;
pub const SYSTEMTIME = extern struct {
    wYear: WORD,
    wMonth: WORD,
    wDayOfWeek: WORD,
    wDay: WORD,
    wHour: WORD,
    wMinute: WORD,
    wSecond: WORD,
    wMilliseconds: WORD,
};

pub const PSYSTEMTIME = ?*SYSTEMTIME;
pub const LPSYSTEMTIME = ?*SYSTEMTIME;
pub const WIN32_FIND_DATAA = extern struct {
    dwFileAttributes: DWORD,
    ftCreationTime: FILETIME,
    ftLastAccessTime: FILETIME,
    ftLastWriteTime: FILETIME,
    nFileSizeHigh: DWORD,
    nFileSizeLow: DWORD,
    dwReserved0: DWORD,
    dwReserved1: DWORD,
    cFileName: [260]CHAR,
    cAlternateFileName: [14]CHAR,
};

pub const PWIN32_FIND_DATAA = ?*WIN32_FIND_DATAA;
pub const LPWIN32_FIND_DATAA = ?*WIN32_FIND_DATAA;
pub const WIN32_FIND_DATAW = extern struct {
    dwFileAttributes: DWORD,
    ftCreationTime: FILETIME,
    ftLastAccessTime: FILETIME,
    ftLastWriteTime: FILETIME,
    nFileSizeHigh: DWORD,
    nFileSizeLow: DWORD,
    dwReserved0: DWORD,
    dwReserved1: DWORD,
    cFileName: [260]WCHAR,
    cAlternateFileName: [14]WCHAR,
};

pub const PWIN32_FIND_DATAW = ?*WIN32_FIND_DATAW;
pub const LPWIN32_FIND_DATAW = ?*WIN32_FIND_DATAW;
pub const FindExInfoStandard = FINDEX_INFO_LEVELS.FindExInfoStandard;
pub const FindExInfoBasic = FINDEX_INFO_LEVELS.FindExInfoBasic;
pub const FindExInfoMaxInfoLevel = FINDEX_INFO_LEVELS.FindExInfoMaxInfoLevel;
pub const FINDEX_INFO_LEVELS = extern enum {
    FindExInfoStandard,
    FindExInfoBasic,
    FindExInfoMaxInfoLevel,
};

pub const FindExSearchNameMatch = FINDEX_SEARCH_OPS.FindExSearchNameMatch;
pub const FindExSearchLimitToDirectories = FINDEX_SEARCH_OPS.FindExSearchLimitToDirectories;
pub const FindExSearchLimitToDevices = FINDEX_SEARCH_OPS.FindExSearchLimitToDevices;
pub const FindExSearchMaxSearchOp = FINDEX_SEARCH_OPS.FindExSearchMaxSearchOp;
pub const FINDEX_SEARCH_OPS = extern enum {
    FindExSearchNameMatch,
    FindExSearchLimitToDirectories,
    FindExSearchLimitToDevices,
    FindExSearchMaxSearchOp,
};

pub const READ_DIRECTORY_NOTIFY_INFORMATION_CLASS = c_int;

pub const PREAD_DIRECTORY_NOTIFY_INFORMATION_CLASS = ?*READ_DIRECTORY_NOTIFY_INFORMATION_CLASS;
pub const GetFileExInfoStandard = GET_FILEEX_INFO_LEVELS.GetFileExInfoStandard;
pub const GetFileExMaxInfoLevel = GET_FILEEX_INFO_LEVELS.GetFileExMaxInfoLevel;
pub const GET_FILEEX_INFO_LEVELS = extern enum {
    GetFileExInfoStandard,
    GetFileExMaxInfoLevel,
};

pub const FileBasicInfo = FILE_INFO_BY_HANDLE_CLASS.FileBasicInfo;
pub const FileStandardInfo = FILE_INFO_BY_HANDLE_CLASS.FileStandardInfo;
pub const FileNameInfo = FILE_INFO_BY_HANDLE_CLASS.FileNameInfo;
pub const FileRenameInfo = FILE_INFO_BY_HANDLE_CLASS.FileRenameInfo;
pub const FileDispositionInfo = FILE_INFO_BY_HANDLE_CLASS.FileDispositionInfo;
pub const FileAllocationInfo = FILE_INFO_BY_HANDLE_CLASS.FileAllocationInfo;
pub const FileEndOfFileInfo = FILE_INFO_BY_HANDLE_CLASS.FileEndOfFileInfo;
pub const FileStreamInfo = FILE_INFO_BY_HANDLE_CLASS.FileStreamInfo;
pub const FileCompressionInfo = FILE_INFO_BY_HANDLE_CLASS.FileCompressionInfo;
pub const FileAttributeTagInfo = FILE_INFO_BY_HANDLE_CLASS.FileAttributeTagInfo;
pub const FileIdBothDirectoryInfo = FILE_INFO_BY_HANDLE_CLASS.FileIdBothDirectoryInfo;
pub const FileIdBothDirectoryRestartInfo = FILE_INFO_BY_HANDLE_CLASS.FileIdBothDirectoryRestartInfo;
pub const FileIoPriorityHintInfo = FILE_INFO_BY_HANDLE_CLASS.FileIoPriorityHintInfo;
pub const FileRemoteProtocolInfo = FILE_INFO_BY_HANDLE_CLASS.FileRemoteProtocolInfo;
pub const FileFullDirectoryInfo = FILE_INFO_BY_HANDLE_CLASS.FileFullDirectoryInfo;
pub const FileFullDirectoryRestartInfo = FILE_INFO_BY_HANDLE_CLASS.FileFullDirectoryRestartInfo;
pub const FileStorageInfo = FILE_INFO_BY_HANDLE_CLASS.FileStorageInfo;
pub const FileAlignmentInfo = FILE_INFO_BY_HANDLE_CLASS.FileAlignmentInfo;
pub const FileIdInfo = FILE_INFO_BY_HANDLE_CLASS.FileIdInfo;
pub const FileIdExtdDirectoryInfo = FILE_INFO_BY_HANDLE_CLASS.FileIdExtdDirectoryInfo;
pub const FileIdExtdDirectoryRestartInfo = FILE_INFO_BY_HANDLE_CLASS.FileIdExtdDirectoryRestartInfo;
pub const FileDispositionInfoEx = FILE_INFO_BY_HANDLE_CLASS.FileDispositionInfoEx;
pub const FileRenameInfoEx = FILE_INFO_BY_HANDLE_CLASS.FileRenameInfoEx;
pub const MaximumFileInfoByHandleClass = FILE_INFO_BY_HANDLE_CLASS.MaximumFileInfoByHandleClass;
pub const FILE_INFO_BY_HANDLE_CLASS = extern enum {
    FileBasicInfo,
    FileStandardInfo,
    FileNameInfo,
    FileRenameInfo,
    FileDispositionInfo,
    FileAllocationInfo,
    FileEndOfFileInfo,
    FileStreamInfo,
    FileCompressionInfo,
    FileAttributeTagInfo,
    FileIdBothDirectoryInfo,
    FileIdBothDirectoryRestartInfo,
    FileIoPriorityHintInfo,
    FileRemoteProtocolInfo,
    FileFullDirectoryInfo,
    FileFullDirectoryRestartInfo,
    FileStorageInfo,
    FileAlignmentInfo,
    FileIdInfo,
    FileIdExtdDirectoryInfo,
    FileIdExtdDirectoryRestartInfo,
    FileDispositionInfoEx,
    FileRenameInfoEx,
    MaximumFileInfoByHandleClass,
};

pub const PFILE_INFO_BY_HANDLE_CLASS = ?*FILE_INFO_BY_HANDLE_CLASS;
pub const CRITICAL_SECTION = RTL_CRITICAL_SECTION;
pub const PCRITICAL_SECTION = PRTL_CRITICAL_SECTION;
pub const LPCRITICAL_SECTION = PRTL_CRITICAL_SECTION;
pub const CRITICAL_SECTION_DEBUG = RTL_CRITICAL_SECTION_DEBUG;
pub const PCRITICAL_SECTION_DEBUG = PRTL_CRITICAL_SECTION_DEBUG;
pub const LPCRITICAL_SECTION_DEBUG = PRTL_CRITICAL_SECTION_DEBUG;
pub const LPOVERLAPPED_COMPLETION_ROUTINE = ?extern fn(DWORD, DWORD, LPOVERLAPPED) void;
pub const PROCESS_HEAP_ENTRY = extern struct {
    lpData: PVOID,
    cbData: DWORD,
    cbOverhead: BYTE,
    iRegionIndex: BYTE,
    wFlags: WORD,
    u: extern union {
        Block: extern struct {
            hMem: HANDLE,
            dwReserved: [3]DWORD,
        },
        Region: extern struct {
            dwCommittedSize: DWORD,
            dwUnCommittedSize: DWORD,
            lpFirstBlock: LPVOID,
            lpLastBlock: LPVOID,
        },
    },
};

pub const LPPROCESS_HEAP_ENTRY = ?*PROCESS_HEAP_ENTRY;
pub const PPROCESS_HEAP_ENTRY = ?*PROCESS_HEAP_ENTRY;
pub const REASON_CONTEXT = extern struct {
    Version: ULONG,
    Flags: DWORD,
    Reason: extern union {
        Detailed: extern struct {
            LocalizedReasonModule: HMODULE,
            LocalizedReasonId: ULONG,
            ReasonStringCount: ULONG,
            ReasonStrings: ?*LPWSTR,
        },
        SimpleReasonString: LPWSTR,
    },
};

pub const PREASON_CONTEXT = ?*REASON_CONTEXT;
pub const PTHREAD_START_ROUTINE = ?extern fn(LPVOID) DWORD;
pub const LPTHREAD_START_ROUTINE = PTHREAD_START_ROUTINE;
pub const PENCLAVE_ROUTINE = ?extern fn(LPVOID) LPVOID;
pub const LPENCLAVE_ROUTINE = PENCLAVE_ROUTINE;
pub const EXCEPTION_DEBUG_INFO = extern struct {
    ExceptionRecord: EXCEPTION_RECORD,
    dwFirstChance: DWORD,
};

pub const LPEXCEPTION_DEBUG_INFO = ?*EXCEPTION_DEBUG_INFO;
pub const CREATE_THREAD_DEBUG_INFO = extern struct {
    hThread: HANDLE,
    lpThreadLocalBase: LPVOID,
    lpStartAddress: LPTHREAD_START_ROUTINE,
};

pub const LPCREATE_THREAD_DEBUG_INFO = ?*CREATE_THREAD_DEBUG_INFO;
pub const CREATE_PROCESS_DEBUG_INFO = extern struct {
    hFile: HANDLE,
    hProcess: HANDLE,
    hThread: HANDLE,
    lpBaseOfImage: LPVOID,
    dwDebugInfoFileOffset: DWORD,
    nDebugInfoSize: DWORD,
    lpThreadLocalBase: LPVOID,
    lpStartAddress: LPTHREAD_START_ROUTINE,
    lpImageName: LPVOID,
    fUnicode: WORD,
};

pub const LPCREATE_PROCESS_DEBUG_INFO = ?*CREATE_PROCESS_DEBUG_INFO;
pub const EXIT_THREAD_DEBUG_INFO = extern struct {
    dwExitCode: DWORD,
};

pub const LPEXIT_THREAD_DEBUG_INFO = ?*EXIT_THREAD_DEBUG_INFO;
pub const EXIT_PROCESS_DEBUG_INFO = extern struct {
    dwExitCode: DWORD,
};

pub const LPEXIT_PROCESS_DEBUG_INFO = ?*EXIT_PROCESS_DEBUG_INFO;
pub const LOAD_DLL_DEBUG_INFO = extern struct {
    hFile: HANDLE,
    lpBaseOfDll: LPVOID,
    dwDebugInfoFileOffset: DWORD,
    nDebugInfoSize: DWORD,
    lpImageName: LPVOID,
    fUnicode: WORD,
};

pub const LPLOAD_DLL_DEBUG_INFO = ?*LOAD_DLL_DEBUG_INFO;
pub const UNLOAD_DLL_DEBUG_INFO = extern struct {
    lpBaseOfDll: LPVOID,
};

pub const LPUNLOAD_DLL_DEBUG_INFO = ?*UNLOAD_DLL_DEBUG_INFO;
pub const OUTPUT_DEBUG_STRING_INFO = extern struct {
    lpDebugStringData: LPSTR,
    fUnicode: WORD,
    nDebugStringLength: WORD,
};

pub const LPOUTPUT_DEBUG_STRING_INFO = ?*OUTPUT_DEBUG_STRING_INFO;
pub const RIP_INFO = extern struct {
    dwError: DWORD,
    dwType: DWORD,
};

pub const LPRIP_INFO = ?*RIP_INFO;
pub const DEBUG_EVENT = extern struct {
    dwDebugEventCode: DWORD,
    dwProcessId: DWORD,
    dwThreadId: DWORD,
    u: extern union {
        Exception: EXCEPTION_DEBUG_INFO,
        CreateThread: CREATE_THREAD_DEBUG_INFO,
        CreateProcessInfo: CREATE_PROCESS_DEBUG_INFO,
        ExitThread: EXIT_THREAD_DEBUG_INFO,
        ExitProcess: EXIT_PROCESS_DEBUG_INFO,
        LoadDll: LOAD_DLL_DEBUG_INFO,
        UnloadDll: UNLOAD_DLL_DEBUG_INFO,
        DebugString: OUTPUT_DEBUG_STRING_INFO,
        RipInfo: RIP_INFO,
    },
};

pub const LPDEBUG_EVENT = ?*DEBUG_EVENT;
pub const LPCONTEXT = PCONTEXT;
pub const WIN32_FILE_ATTRIBUTE_DATA = extern struct {
    dwFileAttributes: DWORD,
    ftCreationTime: FILETIME,
    ftLastAccessTime: FILETIME,
    ftLastWriteTime: FILETIME,
    nFileSizeHigh: DWORD,
    nFileSizeLow: DWORD,
};

pub const LPWIN32_FILE_ATTRIBUTE_DATA = ?*WIN32_FILE_ATTRIBUTE_DATA;
pub const BY_HANDLE_FILE_INFORMATION = extern struct {
    dwFileAttributes: DWORD,
    ftCreationTime: FILETIME,
    ftLastAccessTime: FILETIME,
    ftLastWriteTime: FILETIME,
    dwVolumeSerialNumber: DWORD,
    nFileSizeHigh: DWORD,
    nFileSizeLow: DWORD,
    nNumberOfLinks: DWORD,
    nFileIndexHigh: DWORD,
    nFileIndexLow: DWORD,
};

pub const PBY_HANDLE_FILE_INFORMATION = ?*BY_HANDLE_FILE_INFORMATION;
pub const LPBY_HANDLE_FILE_INFORMATION = ?*BY_HANDLE_FILE_INFORMATION;
pub const CREATEFILE2_EXTENDED_PARAMETERS = extern struct {
    dwSize: DWORD,
    dwFileAttributes: DWORD,
    dwFileFlags: DWORD,
    dwSecurityQosFlags: DWORD,
    lpSecurityAttributes: LPSECURITY_ATTRIBUTES,
    hTemplateFile: HANDLE,
};

pub const PCREATEFILE2_EXTENDED_PARAMETERS = ?*CREATEFILE2_EXTENDED_PARAMETERS;
pub const LPCREATEFILE2_EXTENDED_PARAMETERS = ?*CREATEFILE2_EXTENDED_PARAMETERS;
pub const FindStreamInfoStandard = STREAM_INFO_LEVELS.FindStreamInfoStandard;
pub const FindStreamInfoMaxInfoLevel = STREAM_INFO_LEVELS.FindStreamInfoMaxInfoLevel;
pub const STREAM_INFO_LEVELS = extern enum {
    FindStreamInfoStandard,
    FindStreamInfoMaxInfoLevel,
};

pub const WIN32_FIND_STREAM_DATA = extern struct {
    StreamSize: LARGE_INTEGER,
    cStreamName: [296]WCHAR,
};

pub const PWIN32_FIND_STREAM_DATA = ?*WIN32_FIND_STREAM_DATA;
pub const PTOP_LEVEL_EXCEPTION_FILTER = ?extern fn(?*EXCEPTION_POINTERS) LONG;
pub const LPTOP_LEVEL_EXCEPTION_FILTER = PTOP_LEVEL_EXCEPTION_FILTER;
pub const HEAP_SUMMARY = extern struct {
    cb: DWORD,
    cbAllocated: SIZE_T,
    cbCommitted: SIZE_T,
    cbReserved: SIZE_T,
    cbMaxReserve: SIZE_T,
};

pub const PHEAP_SUMMARY = ?*HEAP_SUMMARY;
pub const LPHEAP_SUMMARY = PHEAP_SUMMARY;
pub const SRWLOCK = RTL_SRWLOCK;
pub const PSRWLOCK = ?*RTL_SRWLOCK;
pub const INIT_ONCE = RTL_RUN_ONCE;
pub const PINIT_ONCE = PRTL_RUN_ONCE;
pub const LPINIT_ONCE = PRTL_RUN_ONCE;
pub const PINIT_ONCE_FN = ?extern fn(PINIT_ONCE, PVOID, ?*PVOID) BOOL;
pub const CONDITION_VARIABLE = RTL_CONDITION_VARIABLE;
pub const PCONDITION_VARIABLE = ?*RTL_CONDITION_VARIABLE;
pub const PTIMERAPCROUTINE = ?extern fn(LPVOID, DWORD, DWORD) void;
pub const SYNCHRONIZATION_BARRIER = RTL_BARRIER;
pub const PSYNCHRONIZATION_BARRIER = PRTL_BARRIER;
pub const LPSYNCHRONIZATION_BARRIER = PRTL_BARRIER;
pub const PROCESS_INFORMATION = extern struct {
    hProcess: HANDLE,
    hThread: HANDLE,
    dwProcessId: DWORD,
    dwThreadId: DWORD,
};

pub const PPROCESS_INFORMATION = ?*PROCESS_INFORMATION;
pub const LPPROCESS_INFORMATION = ?*PROCESS_INFORMATION;
pub const STARTUPINFOA = extern struct {
    cb: DWORD,
    lpReserved: LPSTR,
    lpDesktop: LPSTR,
    lpTitle: LPSTR,
    dwX: DWORD,
    dwY: DWORD,
    dwXSize: DWORD,
    dwYSize: DWORD,
    dwXCountChars: DWORD,
    dwYCountChars: DWORD,
    dwFillAttribute: DWORD,
    dwFlags: DWORD,
    wShowWindow: WORD,
    cbReserved2: WORD,
    lpReserved2: LPBYTE,
    hStdInput: HANDLE,
    hStdOutput: HANDLE,
    hStdError: HANDLE,
};

pub const LPSTARTUPINFOA = ?*STARTUPINFOA;
pub const STARTUPINFOW = extern struct {
    cb: DWORD,
    lpReserved: LPWSTR,
    lpDesktop: LPWSTR,
    lpTitle: LPWSTR,
    dwX: DWORD,
    dwY: DWORD,
    dwXSize: DWORD,
    dwYSize: DWORD,
    dwXCountChars: DWORD,
    dwYCountChars: DWORD,
    dwFillAttribute: DWORD,
    dwFlags: DWORD,
    wShowWindow: WORD,
    cbReserved2: WORD,
    lpReserved2: LPBYTE,
    hStdInput: HANDLE,
    hStdOutput: HANDLE,
    hStdError: HANDLE,
};

pub const LPSTARTUPINFOW = ?*STARTUPINFOW;
pub const PROC_THREAD_ATTRIBUTE_LIST = @OpaqueType();
pub const PPROC_THREAD_ATTRIBUTE_LIST = ?*PROC_THREAD_ATTRIBUTE_LIST;
pub const LPPROC_THREAD_ATTRIBUTE_LIST = ?*PROC_THREAD_ATTRIBUTE_LIST;
pub const ThreadMemoryPriority = THREAD_INFORMATION_CLASS.ThreadMemoryPriority;
pub const ThreadAbsoluteCpuPriority = THREAD_INFORMATION_CLASS.ThreadAbsoluteCpuPriority;
pub const ThreadDynamicCodePolicy = THREAD_INFORMATION_CLASS.ThreadDynamicCodePolicy;
pub const ThreadPowerThrottling = THREAD_INFORMATION_CLASS.ThreadPowerThrottling;
pub const ThreadInformationClassMax = THREAD_INFORMATION_CLASS.ThreadInformationClassMax;
pub const THREAD_INFORMATION_CLASS = extern enum {
    ThreadMemoryPriority,
    ThreadAbsoluteCpuPriority,
    ThreadDynamicCodePolicy,
    ThreadPowerThrottling,
    ThreadInformationClassMax,
};

pub const MEMORY_PRIORITY_INFORMATION = extern struct {
    MemoryPriority: ULONG,
};

pub const PMEMORY_PRIORITY_INFORMATION = ?*MEMORY_PRIORITY_INFORMATION;
pub const THREAD_POWER_THROTTLING_STATE = extern struct {
    Version: ULONG,
    ControlMask: ULONG,
    StateMask: ULONG,
};

pub const ProcessMemoryPriority = PROCESS_INFORMATION_CLASS.ProcessMemoryPriority;
pub const ProcessMemoryExhaustionInfo = PROCESS_INFORMATION_CLASS.ProcessMemoryExhaustionInfo;
pub const ProcessAppMemoryInfo = PROCESS_INFORMATION_CLASS.ProcessAppMemoryInfo;
pub const ProcessInPrivateInfo = PROCESS_INFORMATION_CLASS.ProcessInPrivateInfo;
pub const ProcessPowerThrottling = PROCESS_INFORMATION_CLASS.ProcessPowerThrottling;
pub const ProcessReservedValue1 = PROCESS_INFORMATION_CLASS.ProcessReservedValue1;
pub const ProcessTelemetryCoverageInfo = PROCESS_INFORMATION_CLASS.ProcessTelemetryCoverageInfo;
pub const ProcessProtectionLevelInfo = PROCESS_INFORMATION_CLASS.ProcessProtectionLevelInfo;
pub const ProcessInformationClassMax = PROCESS_INFORMATION_CLASS.ProcessInformationClassMax;
pub const PROCESS_INFORMATION_CLASS = extern enum {
    ProcessMemoryPriority,
    ProcessMemoryExhaustionInfo,
    ProcessAppMemoryInfo,
    ProcessInPrivateInfo,
    ProcessPowerThrottling,
    ProcessReservedValue1,
    ProcessTelemetryCoverageInfo,
    ProcessProtectionLevelInfo,
    ProcessInformationClassMax,
};

pub const APP_MEMORY_INFORMATION = extern struct {
    AvailableCommit: ULONG64,
    PrivateCommitUsage: ULONG64,
    PeakPrivateCommitUsage: ULONG64,
    TotalCommitUsage: ULONG64,
};

pub const PAPP_MEMORY_INFORMATION = ?*APP_MEMORY_INFORMATION;
pub const PMETypeFailFastOnCommitFailure = PROCESS_MEMORY_EXHAUSTION_TYPE.PMETypeFailFastOnCommitFailure;
pub const PMETypeMax = PROCESS_MEMORY_EXHAUSTION_TYPE.PMETypeMax;
pub const PROCESS_MEMORY_EXHAUSTION_TYPE = extern enum {
    PMETypeFailFastOnCommitFailure,
    PMETypeMax,
};

pub const PPROCESS_MEMORY_EXHAUSTION_TYPE = ?*PROCESS_MEMORY_EXHAUSTION_TYPE;
pub const PROCESS_MEMORY_EXHAUSTION_INFO = extern struct {
    Version: USHORT,
    Reserved: USHORT,
    Type: PROCESS_MEMORY_EXHAUSTION_TYPE,
    Value: ULONG_PTR,
};

pub const PPROCESS_MEMORY_EXHAUSTION_INFO = ?*PROCESS_MEMORY_EXHAUSTION_INFO;
pub const PROCESS_POWER_THROTTLING_STATE = extern struct {
    Version: ULONG,
    ControlMask: ULONG,
    StateMask: ULONG,
};

pub const PPROCESS_POWER_THROTTLING_STATE = ?*PROCESS_POWER_THROTTLING_STATE;
pub const PROCESS_PROTECTION_LEVEL_INFORMATION = extern struct {
    ProtectionLevel: DWORD,
};

pub const SYSTEM_INFO = extern struct {
    u: extern union {
        dwOemId: DWORD,
        s: extern struct {
            wProcessorArchitecture: WORD,
            wReserved: WORD,
        },
    },
    dwPageSize: DWORD,
    lpMinimumApplicationAddress: LPVOID,
    lpMaximumApplicationAddress: LPVOID,
    dwActiveProcessorMask: DWORD_PTR,
    dwNumberOfProcessors: DWORD,
    dwProcessorType: DWORD,
    dwAllocationGranularity: DWORD,
    wProcessorLevel: WORD,
    wProcessorRevision: WORD,
};

pub const LPSYSTEM_INFO = ?*SYSTEM_INFO;
pub const MEMORYSTATUSEX = extern struct {
    dwLength: DWORD,
    dwMemoryLoad: DWORD,
    ullTotalPhys: DWORDLONG,
    ullAvailPhys: DWORDLONG,
    ullTotalPageFile: DWORDLONG,
    ullAvailPageFile: DWORDLONG,
    ullTotalVirtual: DWORDLONG,
    ullAvailVirtual: DWORDLONG,
    ullAvailExtendedVirtual: DWORDLONG,
};

pub const LPMEMORYSTATUSEX = ?*MEMORYSTATUSEX;
pub const ComputerNameNetBIOS = COMPUTER_NAME_FORMAT.ComputerNameNetBIOS;
pub const ComputerNameDnsHostname = COMPUTER_NAME_FORMAT.ComputerNameDnsHostname;
pub const ComputerNameDnsDomain = COMPUTER_NAME_FORMAT.ComputerNameDnsDomain;
pub const ComputerNameDnsFullyQualified = COMPUTER_NAME_FORMAT.ComputerNameDnsFullyQualified;
pub const ComputerNamePhysicalNetBIOS = COMPUTER_NAME_FORMAT.ComputerNamePhysicalNetBIOS;
pub const ComputerNamePhysicalDnsHostname = COMPUTER_NAME_FORMAT.ComputerNamePhysicalDnsHostname;
pub const ComputerNamePhysicalDnsDomain = COMPUTER_NAME_FORMAT.ComputerNamePhysicalDnsDomain;
pub const ComputerNamePhysicalDnsFullyQualified = COMPUTER_NAME_FORMAT.ComputerNamePhysicalDnsFullyQualified;
pub const ComputerNameMax = COMPUTER_NAME_FORMAT.ComputerNameMax;
pub const COMPUTER_NAME_FORMAT = extern enum {
    ComputerNameNetBIOS,
    ComputerNameDnsHostname,
    ComputerNameDnsDomain,
    ComputerNameDnsFullyQualified,
    ComputerNamePhysicalNetBIOS,
    ComputerNamePhysicalDnsHostname,
    ComputerNamePhysicalDnsDomain,
    ComputerNamePhysicalDnsFullyQualified,
    ComputerNameMax,
};

pub const LowMemoryResourceNotification = MEMORY_RESOURCE_NOTIFICATION_TYPE.LowMemoryResourceNotification;
pub const HighMemoryResourceNotification = MEMORY_RESOURCE_NOTIFICATION_TYPE.HighMemoryResourceNotification;
pub const MEMORY_RESOURCE_NOTIFICATION_TYPE = extern enum {
    LowMemoryResourceNotification,
    HighMemoryResourceNotification,
};

pub const WIN32_MEMORY_RANGE_ENTRY = extern struct {
    VirtualAddress: PVOID,
    NumberOfBytes: SIZE_T,
};

pub const PWIN32_MEMORY_RANGE_ENTRY = ?*WIN32_MEMORY_RANGE_ENTRY;
pub const BAD_MEMORY_CALLBACK_ROUTINE = extern fn() void;
pub const PBAD_MEMORY_CALLBACK_ROUTINE = ?*BAD_MEMORY_CALLBACK_ROUTINE;
pub const OFFER_PRIORITY = c_int;

pub const MemoryRegionInfo = WIN32_MEMORY_INFORMATION_CLASS.MemoryRegionInfo;
pub const WIN32_MEMORY_INFORMATION_CLASS = extern enum {
    MemoryRegionInfo,
};

pub const WIN32_MEMORY_REGION_INFORMATION = extern struct {
    AllocationBase: PVOID,
    AllocationProtect: ULONG,
    u: extern union {
        Flags: ULONG,
        s: packed struct {
            Private: @IntType(false, 1),
            MappedDataFile: @IntType(false, 1),
            MappedImage: @IntType(false, 1),
            MappedPageFile: @IntType(false, 1),
            MappedPhysical: @IntType(false, 1),
            DirectMapped: @IntType(false, 1),
            Reserved: @IntType(false, 26),
        },
    },
    RegionSize: SIZE_T,
    CommitSize: SIZE_T,
};

pub const PTP_WIN32_IO_CALLBACK = ?extern fn(PTP_CALLBACK_INSTANCE, PVOID, PVOID, ULONG, ULONG_PTR, PTP_IO) void;
pub const JOBOBJECT_IO_RATE_CONTROL_INFORMATION = extern struct {
    MaxIops: LONG64,
    MaxBandwidth: LONG64,
    ReservationIops: LONG64,
    VolumeName: PCWSTR,
    BaseIoSize: ULONG,
    ControlFlags: ULONG,
};

pub const ENUMUILANG = extern struct {
    NumOfEnumUILang: ULONG,
    SizeOfEnumUIBuffer: ULONG,
    pEnumUIBuffer: ?*LANGID,
};

pub const PENUMUILANG = ?*ENUMUILANG;
pub const ENUMRESLANGPROCA = ?extern fn(HMODULE, LPCSTR, LPCSTR, WORD, LONG_PTR) BOOL;
pub const ENUMRESLANGPROCW = ?extern fn(HMODULE, LPCWSTR, LPCWSTR, WORD, LONG_PTR) BOOL;
pub const ENUMRESNAMEPROCA = ?extern fn(HMODULE, LPCSTR, LPSTR, LONG_PTR) BOOL;
pub const ENUMRESNAMEPROCW = ?extern fn(HMODULE, LPCWSTR, LPWSTR, LONG_PTR) BOOL;
pub const ENUMRESTYPEPROCA = ?extern fn(HMODULE, LPSTR, LONG_PTR) BOOL;
pub const ENUMRESTYPEPROCW = ?extern fn(HMODULE, LPWSTR, LONG_PTR) BOOL;
pub const PGET_MODULE_HANDLE_EXA = ?extern fn(DWORD, LPCSTR, ?*HMODULE) BOOL;
pub const PGET_MODULE_HANDLE_EXW = ?extern fn(DWORD, LPCWSTR, ?*HMODULE) BOOL;
pub const DLL_DIRECTORY_COOKIE = PVOID;
pub const PDLL_DIRECTORY_COOKIE = ?*PVOID;
pub const PFIBER_START_ROUTINE = ?extern fn(LPVOID) void;
pub const LPFIBER_START_ROUTINE = PFIBER_START_ROUTINE;
pub const PFIBER_CALLOUT_ROUTINE = ?extern fn(LPVOID) LPVOID;
pub const LPLDT_ENTRY = LPVOID;
pub const COMMPROP = extern struct {
    wPacketLength: WORD,
    wPacketVersion: WORD,
    dwServiceMask: DWORD,
    dwReserved1: DWORD,
    dwMaxTxQueue: DWORD,
    dwMaxRxQueue: DWORD,
    dwMaxBaud: DWORD,
    dwProvSubType: DWORD,
    dwProvCapabilities: DWORD,
    dwSettableParams: DWORD,
    dwSettableBaud: DWORD,
    wSettableData: WORD,
    wSettableStopParity: WORD,
    dwCurrentTxQueue: DWORD,
    dwCurrentRxQueue: DWORD,
    dwProvSpec1: DWORD,
    dwProvSpec2: DWORD,
    wcProvChar: [1]WCHAR,
};

pub const LPCOMMPROP = ?*COMMPROP;
pub const COMSTAT = @OpaqueType();

pub const LPCOMSTAT = ?*COMSTAT;
pub const DCB = @OpaqueType();

pub const LPDCB = ?*DCB;
pub const COMMTIMEOUTS = extern struct {
    ReadIntervalTimeout: DWORD,
    ReadTotalTimeoutMultiplier: DWORD,
    ReadTotalTimeoutConstant: DWORD,
    WriteTotalTimeoutMultiplier: DWORD,
    WriteTotalTimeoutConstant: DWORD,
};

pub const LPCOMMTIMEOUTS = ?*COMMTIMEOUTS;
pub const COMMCONFIG = extern struct {
    dwSize: DWORD,
    wVersion: WORD,
    wReserved: WORD,
    dcb: DCB,
    dwProviderSubType: DWORD,
    dwProviderOffset: DWORD,
    dwProviderSize: DWORD,
    wcProviderData: [1]WCHAR,
};

pub const LPCOMMCONFIG = ?*COMMCONFIG;
pub const MEMORYSTATUS = extern struct {
    dwLength: DWORD,
    dwMemoryLoad: DWORD,
    dwTotalPhys: SIZE_T,
    dwAvailPhys: SIZE_T,
    dwTotalPageFile: SIZE_T,
    dwAvailPageFile: SIZE_T,
    dwTotalVirtual: SIZE_T,
    dwAvailVirtual: SIZE_T,
};

pub const LPMEMORYSTATUS = ?*MEMORYSTATUS;
pub const JIT_DEBUG_INFO = extern struct {
    dwSize: DWORD,
    dwProcessorArchitecture: DWORD,
    dwThreadID: DWORD,
    dwReserved0: DWORD,
    lpExceptionAddress: ULONG64,
    lpExceptionRecord: ULONG64,
    lpContextRecord: ULONG64,
};

pub const LPJIT_DEBUG_INFO = ?*JIT_DEBUG_INFO;
pub const JIT_DEBUG_INFO32 = JIT_DEBUG_INFO;
pub const LPJIT_DEBUG_INFO32 = ?*JIT_DEBUG_INFO;
pub const JIT_DEBUG_INFO64 = JIT_DEBUG_INFO;
pub const LPJIT_DEBUG_INFO64 = ?*JIT_DEBUG_INFO;
pub const LPEXCEPTION_RECORD = PEXCEPTION_RECORD;
pub const LPEXCEPTION_POINTERS = PEXCEPTION_POINTERS;
pub const OFSTRUCT = extern struct {
    cBytes: BYTE,
    fFixedDisk: BYTE,
    nErrCode: WORD,
    Reserved1: WORD,
    Reserved2: WORD,
    szPathName: [128]CHAR,
};

pub const LPOFSTRUCT = ?*OFSTRUCT;
pub const POFSTRUCT = ?*OFSTRUCT;
pub const PUMS_CONTEXT = ?*c_void;
pub const PUMS_COMPLETION_LIST = ?*c_void;
pub const UMS_THREAD_INFO_CLASS = RTL_UMS_THREAD_INFO_CLASS;
pub const PUMS_THREAD_INFO_CLASS = ?*RTL_UMS_THREAD_INFO_CLASS;
pub const UMS_SCHEDULER_REASON = RTL_UMS_SCHEDULER_REASON;
pub const PUMS_SCHEDULER_ENTRY_POINT = PRTL_UMS_SCHEDULER_ENTRY_POINT;
pub const UMS_SCHEDULER_STARTUP_INFO = extern struct {
    UmsVersion: ULONG,
    CompletionList: PUMS_COMPLETION_LIST,
    SchedulerProc: PUMS_SCHEDULER_ENTRY_POINT,
    SchedulerParam: PVOID,
};

pub const PUMS_SCHEDULER_STARTUP_INFO = ?*UMS_SCHEDULER_STARTUP_INFO;
pub const UMS_SYSTEM_THREAD_INFORMATION = extern struct {
    UmsVersion: ULONG,
    u: extern union {
        s: packed struct {
            IsUmsSchedulerThread: @IntType(false, 1),
            IsUmsWorkerThread: @IntType(false, 1),
        },
        ThreadUmsFlags: ULONG,
    },
};

pub const PUMS_SYSTEM_THREAD_INFORMATION = ?*UMS_SYSTEM_THREAD_INFORMATION;
pub const POWER_REQUEST_CONTEXT = REASON_CONTEXT;
pub const PPOWER_REQUEST_CONTEXT = ?*REASON_CONTEXT;
pub const LPPOWER_REQUEST_CONTEXT = ?*REASON_CONTEXT;
pub const DEP_SYSTEM_POLICY_TYPE = c_int;

pub const PFE_EXPORT_FUNC = ?extern fn(PBYTE, PVOID, ULONG) DWORD;
pub const PFE_IMPORT_FUNC = ?extern fn(PBYTE, PVOID, PULONG) DWORD;
pub const WIN32_STREAM_ID = extern struct {
    dwStreamId: DWORD,
    dwStreamAttributes: DWORD,
    Size: LARGE_INTEGER,
    dwStreamNameSize: DWORD,
    cStreamName: [1]WCHAR,
};

pub const LPWIN32_STREAM_ID = ?*WIN32_STREAM_ID;
pub const STARTUPINFOEXA = extern struct {
    StartupInfo: STARTUPINFOA,
    lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
};

pub const LPSTARTUPINFOEXA = ?*STARTUPINFOEXA;
pub const STARTUPINFOEXW = extern struct {
    StartupInfo: STARTUPINFOW,
    lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
};

pub const LPSTARTUPINFOEXW = ?*STARTUPINFOEXW;
pub const PROC_THREAD_ATTRIBUTE_NUM = c_int;

pub const PGET_SYSTEM_WOW64_DIRECTORY_A = ?extern fn(LPSTR, UINT) UINT;
pub const PGET_SYSTEM_WOW64_DIRECTORY_W = ?extern fn(LPWSTR, UINT) UINT;
pub const LPPROGRESS_ROUTINE = ?extern fn(LARGE_INTEGER, LARGE_INTEGER, LARGE_INTEGER, LARGE_INTEGER, DWORD, DWORD, HANDLE, HANDLE, LPVOID) DWORD;
pub const COPYFILE2_MESSAGE_TYPE = c_int;

pub const COPYFILE2_MESSAGE_ACTION = c_int;

pub const COPYFILE2_COPY_PHASE = c_int;

pub const COPYFILE2_MESSAGE = extern struct {
    Type: COPYFILE2_MESSAGE_TYPE,
    dwPadding: DWORD,
    Info: extern union {
        ChunkStarted: extern struct {
            dwStreamNumber: DWORD,
            dwReserved: DWORD,
            hSourceFile: HANDLE,
            hDestinationFile: HANDLE,
            uliChunkNumber: ULARGE_INTEGER,
            uliChunkSize: ULARGE_INTEGER,
            uliStreamSize: ULARGE_INTEGER,
            uliTotalFileSize: ULARGE_INTEGER,
        },
        ChunkFinished: extern struct {
            dwStreamNumber: DWORD,
            dwFlags: DWORD,
            hSourceFile: HANDLE,
            hDestinationFile: HANDLE,
            uliChunkNumber: ULARGE_INTEGER,
            uliChunkSize: ULARGE_INTEGER,
            uliStreamSize: ULARGE_INTEGER,
            uliStreamBytesTransferred: ULARGE_INTEGER,
            uliTotalFileSize: ULARGE_INTEGER,
            uliTotalBytesTransferred: ULARGE_INTEGER,
        },
        StreamStarted: extern struct {
            dwStreamNumber: DWORD,
            dwReserved: DWORD,
            hSourceFile: HANDLE,
            hDestinationFile: HANDLE,
            uliStreamSize: ULARGE_INTEGER,
            uliTotalFileSize: ULARGE_INTEGER,
        },
        StreamFinished: extern struct {
            dwStreamNumber: DWORD,
            dwReserved: DWORD,
            hSourceFile: HANDLE,
            hDestinationFile: HANDLE,
            uliStreamSize: ULARGE_INTEGER,
            uliStreamBytesTransferred: ULARGE_INTEGER,
            uliTotalFileSize: ULARGE_INTEGER,
            uliTotalBytesTransferred: ULARGE_INTEGER,
        },
        PollContinue: extern struct {
            dwReserved: DWORD,
        },
        Error: extern struct {
            CopyPhase: COPYFILE2_COPY_PHASE,
            dwStreamNumber: DWORD,
            hrFailure: HRESULT,
            dwReserved: DWORD,
            uliChunkNumber: ULARGE_INTEGER,
            uliStreamSize: ULARGE_INTEGER,
            uliStreamBytesTransferred: ULARGE_INTEGER,
            uliTotalFileSize: ULARGE_INTEGER,
            uliTotalBytesTransferred: ULARGE_INTEGER,
        },
    },
};

pub const PCOPYFILE2_PROGRESS_ROUTINE = ?extern fn(?*const COPYFILE2_MESSAGE, PVOID) COPYFILE2_MESSAGE_ACTION;
pub const COPYFILE2_EXTENDED_PARAMETERS = extern struct {
    dwSize: DWORD,
    dwCopyFlags: DWORD,
    pfCancel: ?*BOOL,
    pProgressRoutine: PCOPYFILE2_PROGRESS_ROUTINE,
    pvCallbackContext: PVOID,
};

pub const EVENTLOG_FULL_INFORMATION = extern struct {
    dwFull: DWORD,
};

pub const LPEVENTLOG_FULL_INFORMATION = ?*EVENTLOG_FULL_INFORMATION;
pub const OPERATION_ID = ULONG;
pub const OPERATION_START_PARAMETERS = extern struct {
    Version: ULONG,
    OperationId: OPERATION_ID,
    Flags: ULONG,
};

pub const POPERATION_START_PARAMETERS = ?*OPERATION_START_PARAMETERS;
pub const OPERATION_END_PARAMETERS = extern struct {
    Version: ULONG,
    OperationId: OPERATION_ID,
    Flags: ULONG,
};

pub const POPERATION_END_PARAMETERS = ?*OPERATION_END_PARAMETERS;
pub const HW_PROFILE_INFOA = extern struct {
    dwDockInfo: DWORD,
    szHwProfileGuid: [39]CHAR,
    szHwProfileName: [80]CHAR,
};

pub const LPHW_PROFILE_INFOA = ?*HW_PROFILE_INFOA;
pub const HW_PROFILE_INFOW = extern struct {
    dwDockInfo: DWORD,
    szHwProfileGuid: [39]WCHAR,
    szHwProfileName: [80]WCHAR,
};

pub const LPHW_PROFILE_INFOW = ?*HW_PROFILE_INFOW;
pub const TIME_ZONE_INFORMATION = extern struct {
    Bias: LONG,
    StandardName: [32]WCHAR,
    StandardDate: SYSTEMTIME,
    StandardBias: LONG,
    DaylightName: [32]WCHAR,
    DaylightDate: SYSTEMTIME,
    DaylightBias: LONG,
};

pub const PTIME_ZONE_INFORMATION = ?*TIME_ZONE_INFORMATION;
pub const LPTIME_ZONE_INFORMATION = ?*TIME_ZONE_INFORMATION;
pub const TIME_DYNAMIC_ZONE_INFORMATION = extern struct {
    Bias: LONG,
    StandardName: [32]WCHAR,
    StandardDate: SYSTEMTIME,
    StandardBias: LONG,
    DaylightName: [32]WCHAR,
    DaylightDate: SYSTEMTIME,
    DaylightBias: LONG,
    TimeZoneKeyName: [128]WCHAR,
    DynamicDaylightTimeDisabled: BOOLEAN,
};
pub const DYNAMIC_TIME_ZONE_INFORMATION = TIME_DYNAMIC_ZONE_INFORMATION;
pub const PDYNAMIC_TIME_ZONE_INFORMATION = ?*TIME_DYNAMIC_ZONE_INFORMATION;
pub const SYSTEM_POWER_STATUS = extern struct {
    ACLineStatus: BYTE,
    BatteryFlag: BYTE,
    BatteryLifePercent: BYTE,
    SystemStatusFlag: BYTE,
    BatteryLifeTime: DWORD,
    BatteryFullLifeTime: DWORD,
};

pub const LPSYSTEM_POWER_STATUS = ?*SYSTEM_POWER_STATUS;
pub const ACTCTXA = extern struct {
    cbSize: ULONG,
    dwFlags: DWORD,
    lpSource: LPCSTR,
    wProcessorArchitecture: USHORT,
    wLangId: LANGID,
    lpAssemblyDirectory: LPCSTR,
    lpResourceName: LPCSTR,
    lpApplicationName: LPCSTR,
    hModule: HMODULE,
};

pub const PACTCTXA = ?*ACTCTXA;
pub const ACTCTXW = extern struct {
    cbSize: ULONG,
    dwFlags: DWORD,
    lpSource: LPCWSTR,
    wProcessorArchitecture: USHORT,
    wLangId: LANGID,
    lpAssemblyDirectory: LPCWSTR,
    lpResourceName: LPCWSTR,
    lpApplicationName: LPCWSTR,
    hModule: HMODULE,
};

pub const PACTCTXW = ?*ACTCTXW;
pub const PCACTCTXA = ?*const ACTCTXA;
pub const PCACTCTXW = ?*const ACTCTXW;
pub const ACTCTX_SECTION_KEYED_DATA_2600 = extern struct {
    cbSize: ULONG,
    ulDataFormatVersion: ULONG,
    lpData: PVOID,
    ulLength: ULONG,
    lpSectionGlobalData: PVOID,
    ulSectionGlobalDataLength: ULONG,
    lpSectionBase: PVOID,
    ulSectionTotalLength: ULONG,
    hActCtx: HANDLE,
    ulAssemblyRosterIndex: ULONG,
};

pub const PACTCTX_SECTION_KEYED_DATA_2600 = ?*ACTCTX_SECTION_KEYED_DATA_2600;
pub const PCACTCTX_SECTION_KEYED_DATA_2600 = ?*const ACTCTX_SECTION_KEYED_DATA_2600;
pub const ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA = extern struct {
    lpInformation: PVOID,
    lpSectionBase: PVOID,
    ulSectionLength: ULONG,
    lpSectionGlobalDataBase: PVOID,
    ulSectionGlobalDataLength: ULONG,
};

pub const PACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA = ?*ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA;
pub const PCACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA = ?*const ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA;
pub const ACTCTX_SECTION_KEYED_DATA = extern struct {
    cbSize: ULONG,
    ulDataFormatVersion: ULONG,
    lpData: PVOID,
    ulLength: ULONG,
    lpSectionGlobalData: PVOID,
    ulSectionGlobalDataLength: ULONG,
    lpSectionBase: PVOID,
    ulSectionTotalLength: ULONG,
    hActCtx: HANDLE,
    ulAssemblyRosterIndex: ULONG,
    ulFlags: ULONG,
    AssemblyMetadata: ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA,
};

pub const PACTCTX_SECTION_KEYED_DATA = ?*ACTCTX_SECTION_KEYED_DATA;
pub const PCACTCTX_SECTION_KEYED_DATA = ?*const ACTCTX_SECTION_KEYED_DATA;
pub const ACTIVATION_CONTEXT_BASIC_INFORMATION = extern struct {
    hActCtx: HANDLE,
    dwFlags: DWORD,
};

pub const PACTIVATION_CONTEXT_BASIC_INFORMATION = ?*ACTIVATION_CONTEXT_BASIC_INFORMATION;
pub const PCACTIVATION_CONTEXT_BASIC_INFORMATION = ?*const ACTIVATION_CONTEXT_BASIC_INFORMATION;
pub const PQUERYACTCTXW_FUNC = ?extern fn(DWORD, HANDLE, PVOID, ULONG, PVOID, SIZE_T, ?*SIZE_T) BOOL;
pub const APPLICATION_RECOVERY_CALLBACK = ?extern fn(PVOID) DWORD;
pub const FILE_BASIC_INFO = extern struct {
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    FileAttributes: DWORD,
};

pub const PFILE_BASIC_INFO = ?*FILE_BASIC_INFO;
pub const FILE_STANDARD_INFO = extern struct {
    AllocationSize: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    NumberOfLinks: DWORD,
    DeletePending: BOOLEAN,
    Directory: BOOLEAN,
};

pub const PFILE_STANDARD_INFO = ?*FILE_STANDARD_INFO;
pub const FILE_NAME_INFO = extern struct {
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

pub const PFILE_NAME_INFO = ?*FILE_NAME_INFO;
pub const FILE_RENAME_INFO = extern struct {
    u: extern union {
        ReplaceIfExists: BOOLEAN,
        Flags: DWORD,
    },
    RootDirectory: HANDLE,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};

pub const PFILE_RENAME_INFO = ?*FILE_RENAME_INFO;
pub const FILE_ALLOCATION_INFO = extern struct {
    AllocationSize: LARGE_INTEGER,
};

pub const PFILE_ALLOCATION_INFO = ?*FILE_ALLOCATION_INFO;
pub const FILE_END_OF_FILE_INFO = extern struct {
    EndOfFile: LARGE_INTEGER,
};

pub const PFILE_END_OF_FILE_INFO = ?*FILE_END_OF_FILE_INFO;
pub const FILE_STREAM_INFO = extern struct {
    NextEntryOffset: DWORD,
    StreamNameLength: DWORD,
    StreamSize: LARGE_INTEGER,
    StreamAllocationSize: LARGE_INTEGER,
    StreamName: [1]WCHAR,
};

pub const PFILE_STREAM_INFO = ?*FILE_STREAM_INFO;
pub const FILE_COMPRESSION_INFO = extern struct {
    CompressedFileSize: LARGE_INTEGER,
    CompressionFormat: WORD,
    CompressionUnitShift: UCHAR,
    ChunkShift: UCHAR,
    ClusterShift: UCHAR,
    Reserved: [3]UCHAR,
};

pub const PFILE_COMPRESSION_INFO = ?*FILE_COMPRESSION_INFO;
pub const FILE_ATTRIBUTE_TAG_INFO = extern struct {
    FileAttributes: DWORD,
    ReparseTag: DWORD,
};

pub const PFILE_ATTRIBUTE_TAG_INFO = ?*FILE_ATTRIBUTE_TAG_INFO;
pub const FILE_DISPOSITION_INFO = extern struct {
    DeleteFileA: BOOLEAN,
};

pub const PFILE_DISPOSITION_INFO = ?*FILE_DISPOSITION_INFO;
pub const FILE_DISPOSITION_INFO_EX = extern struct {
    Flags: DWORD,
};

pub const PFILE_DISPOSITION_INFO_EX = ?*FILE_DISPOSITION_INFO_EX;
pub const FILE_ID_BOTH_DIR_INFO = extern struct {
    NextEntryOffset: DWORD,
    FileIndex: DWORD,
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    AllocationSize: LARGE_INTEGER,
    FileAttributes: DWORD,
    FileNameLength: DWORD,
    EaSize: DWORD,
    ShortNameLength: CCHAR,
    ShortName: [12]WCHAR,
    FileId: LARGE_INTEGER,
    FileName: [1]WCHAR,
};

pub const PFILE_ID_BOTH_DIR_INFO = ?*FILE_ID_BOTH_DIR_INFO;
pub const FILE_FULL_DIR_INFO = extern struct {
    NextEntryOffset: ULONG,
    FileIndex: ULONG,
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    AllocationSize: LARGE_INTEGER,
    FileAttributes: ULONG,
    FileNameLength: ULONG,
    EaSize: ULONG,
    FileName: [1]WCHAR,
};

pub const PFILE_FULL_DIR_INFO = ?*FILE_FULL_DIR_INFO;
pub const PRIORITY_HINT = c_int;

pub const FILE_IO_PRIORITY_HINT_INFO = extern struct {
    PriorityHint: PRIORITY_HINT,
};

pub const PFILE_IO_PRIORITY_HINT_INFO = ?*FILE_IO_PRIORITY_HINT_INFO;
pub const FILE_ALIGNMENT_INFO = extern struct {
    AlignmentRequirement: ULONG,
};

pub const PFILE_ALIGNMENT_INFO = ?*FILE_ALIGNMENT_INFO;
pub const FILE_STORAGE_INFO = extern struct {
    LogicalBytesPerSector: ULONG,
    PhysicalBytesPerSectorForAtomicity: ULONG,
    PhysicalBytesPerSectorForPerformance: ULONG,
    FileSystemEffectivePhysicalBytesPerSectorForAtomicity: ULONG,
    Flags: ULONG,
    ByteOffsetForSectorAlignment: ULONG,
    ByteOffsetForPartitionAlignment: ULONG,
};

pub const PFILE_STORAGE_INFO = ?*FILE_STORAGE_INFO;
pub const FILE_ID_INFO = extern struct {
    VolumeSerialNumber: ULONGLONG,
    FileId: FILE_ID_128,
};

pub const PFILE_ID_INFO = ?*FILE_ID_INFO;
pub const FILE_ID_EXTD_DIR_INFO = extern struct {
    NextEntryOffset: ULONG,
    FileIndex: ULONG,
    CreationTime: LARGE_INTEGER,
    LastAccessTime: LARGE_INTEGER,
    LastWriteTime: LARGE_INTEGER,
    ChangeTime: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    AllocationSize: LARGE_INTEGER,
    FileAttributes: ULONG,
    FileNameLength: ULONG,
    EaSize: ULONG,
    ReparsePointTag: ULONG,
    FileId: FILE_ID_128,
    FileName: [1]WCHAR,
};

pub const PFILE_ID_EXTD_DIR_INFO = ?*FILE_ID_EXTD_DIR_INFO;
pub const FILE_REMOTE_PROTOCOL_INFO = extern struct {
    StructureVersion: USHORT,
    StructureSize: USHORT,
    Protocol: ULONG,
    ProtocolMajorVersion: USHORT,
    ProtocolMinorVersion: USHORT,
    ProtocolRevision: USHORT,
    Reserved: USHORT,
    Flags: ULONG,
    GenericReserved: extern struct {
        Reserved: [8]ULONG,
    },
    ProtocolSpecific: extern union {
        Smb2: extern struct {
            Server: extern struct {
                Capabilities: ULONG,
            },
            Share: extern struct {
                Capabilities: ULONG,
                CachingFlags: ULONG,
            },
        },
        Reserved: [16]ULONG,
    },
};

pub const PFILE_REMOTE_PROTOCOL_INFO = ?*FILE_REMOTE_PROTOCOL_INFO;
pub const FileIdType = FILE_ID_TYPE.FileIdType;
pub const ObjectIdType = FILE_ID_TYPE.ObjectIdType;
pub const ExtendedFileIdType = FILE_ID_TYPE.ExtendedFileIdType;
pub const MaximumFileIdType = FILE_ID_TYPE.MaximumFileIdType;
pub const FILE_ID_TYPE = extern enum {
    FileIdType,
    ObjectIdType,
    ExtendedFileIdType,
    MaximumFileIdType,
};

pub const PFILE_ID_TYPE = ?*FILE_ID_TYPE;
pub const FILE_ID_DESCRIPTOR = extern struct {
    dwSize: DWORD,
    Type: FILE_ID_TYPE,
    u: extern union {
        FileId: LARGE_INTEGER,
        ObjectId: GUID,
        ExtendedFileId: FILE_ID_128,
    },
};

pub const LPFILE_ID_DESCRIPTOR = ?*FILE_ID_DESCRIPTOR;
pub const DRAWPATRECT = extern struct {
    ptPosition: POINT,
    ptSize: POINT,
    wStyle: WORD,
    wPattern: WORD,
};

pub const PDRAWPATRECT = ?*DRAWPATRECT;
pub const PSINJECTDATA = extern struct {
    DataBytes: DWORD,
    InjectionPoint: WORD,
    PageNumber: WORD,
};

pub const PPSINJECTDATA = ?*PSINJECTDATA;
pub const PSFEATURE_OUTPUT = extern struct {
    bPageIndependent: BOOL,
    bSetPageDevice: BOOL,
};

pub const PPSFEATURE_OUTPUT = ?*PSFEATURE_OUTPUT;
pub const PSFEATURE_CUSTPAPER = extern struct {
    lOrientation: LONG,
    lWidth: LONG,
    lHeight: LONG,
    lWidthOffset: LONG,
    lHeightOffset: LONG,
};

pub const PPSFEATURE_CUSTPAPER = ?*PSFEATURE_CUSTPAPER;
pub const XFORM = extern struct {
    eM11: FLOAT,
    eM12: FLOAT,
    eM21: FLOAT,
    eM22: FLOAT,
    eDx: FLOAT,
    eDy: FLOAT,
};

pub const PXFORM = ?*XFORM;
pub const LPXFORM = ?*XFORM;
pub const BITMAP = extern struct {
    bmType: LONG,
    bmWidth: LONG,
    bmHeight: LONG,
    bmWidthBytes: LONG,
    bmPlanes: WORD,
    bmBitsPixel: WORD,
    bmBits: LPVOID,
};

pub const PBITMAP = ?*BITMAP;
pub const NPBITMAP = ?*BITMAP;
pub const LPBITMAP = ?*BITMAP;
pub const RGBTRIPLE = extern struct {
    rgbtBlue: BYTE,
    rgbtGreen: BYTE,
    rgbtRed: BYTE,
};

pub const PRGBTRIPLE = ?*RGBTRIPLE;
pub const NPRGBTRIPLE = ?*RGBTRIPLE;
pub const LPRGBTRIPLE = ?*RGBTRIPLE;
pub const RGBQUAD = extern struct {
    rgbBlue: BYTE,
    rgbGreen: BYTE,
    rgbRed: BYTE,
    rgbReserved: BYTE,
};

pub const LPRGBQUAD = ?*RGBQUAD;
pub const LCSCSTYPE = LONG;
pub const LCSGAMUTMATCH = LONG;
pub const FXPT16DOT16 = c_long;
pub const LPFXPT16DOT16 = ?*c_long;
pub const FXPT2DOT30 = c_long;
pub const LPFXPT2DOT30 = ?*c_long;
pub const CIEXYZ = extern struct {
    ciexyzX: FXPT2DOT30,
    ciexyzY: FXPT2DOT30,
    ciexyzZ: FXPT2DOT30,
};

pub const LPCIEXYZ = ?*CIEXYZ;
pub const ICEXYZTRIPLE = extern struct {
    ciexyzRed: CIEXYZ,
    ciexyzGreen: CIEXYZ,
    ciexyzBlue: CIEXYZ,
};
pub const CIEXYZTRIPLE = ICEXYZTRIPLE;
pub const LPCIEXYZTRIPLE = ?*CIEXYZTRIPLE;
pub const LOGCOLORSPACEA = extern struct {
    lcsSignature: DWORD,
    lcsVersion: DWORD,
    lcsSize: DWORD,
    lcsCSType: LCSCSTYPE,
    lcsIntent: LCSGAMUTMATCH,
    lcsEndpoints: CIEXYZTRIPLE,
    lcsGammaRed: DWORD,
    lcsGammaGreen: DWORD,
    lcsGammaBlue: DWORD,
    lcsFilename: [260]CHAR,
};

pub const LPLOGCOLORSPACEA = ?*LOGCOLORSPACEA;
pub const LOGCOLORSPACEW = extern struct {
    lcsSignature: DWORD,
    lcsVersion: DWORD,
    lcsSize: DWORD,
    lcsCSType: LCSCSTYPE,
    lcsIntent: LCSGAMUTMATCH,
    lcsEndpoints: CIEXYZTRIPLE,
    lcsGammaRed: DWORD,
    lcsGammaGreen: DWORD,
    lcsGammaBlue: DWORD,
    lcsFilename: [260]WCHAR,
};

pub const LPLOGCOLORSPACEW = ?*LOGCOLORSPACEW;
pub const BITMAPCOREHEADER = extern struct {
    bcSize: DWORD,
    bcWidth: WORD,
    bcHeight: WORD,
    bcPlanes: WORD,
    bcBitCount: WORD,
};

pub const LPBITMAPCOREHEADER = ?*BITMAPCOREHEADER;
pub const PBITMAPCOREHEADER = ?*BITMAPCOREHEADER;
pub const BITMAPINFOHEADER = extern struct {
    biSize: DWORD,
    biWidth: LONG,
    biHeight: LONG,
    biPlanes: WORD,
    biBitCount: WORD,
    biCompression: DWORD,
    biSizeImage: DWORD,
    biXPelsPerMeter: LONG,
    biYPelsPerMeter: LONG,
    biClrUsed: DWORD,
    biClrImportant: DWORD,
};

pub const LPBITMAPINFOHEADER = ?*BITMAPINFOHEADER;
pub const PBITMAPINFOHEADER = ?*BITMAPINFOHEADER;
pub const BITMAPV4HEADER = extern struct {
    bV4Size: DWORD,
    bV4Width: LONG,
    bV4Height: LONG,
    bV4Planes: WORD,
    bV4BitCount: WORD,
    bV4V4Compression: DWORD,
    bV4SizeImage: DWORD,
    bV4XPelsPerMeter: LONG,
    bV4YPelsPerMeter: LONG,
    bV4ClrUsed: DWORD,
    bV4ClrImportant: DWORD,
    bV4RedMask: DWORD,
    bV4GreenMask: DWORD,
    bV4BlueMask: DWORD,
    bV4AlphaMask: DWORD,
    bV4CSType: DWORD,
    bV4Endpoints: CIEXYZTRIPLE,
    bV4GammaRed: DWORD,
    bV4GammaGreen: DWORD,
    bV4GammaBlue: DWORD,
};
pub const LPBITMAPV4HEADER = ?*extern struct {
    bV4Size: DWORD,
    bV4Width: LONG,
    bV4Height: LONG,
    bV4Planes: WORD,
    bV4BitCount: WORD,
    bV4V4Compression: DWORD,
    bV4SizeImage: DWORD,
    bV4XPelsPerMeter: LONG,
    bV4YPelsPerMeter: LONG,
    bV4ClrUsed: DWORD,
    bV4ClrImportant: DWORD,
    bV4RedMask: DWORD,
    bV4GreenMask: DWORD,
    bV4BlueMask: DWORD,
    bV4AlphaMask: DWORD,
    bV4CSType: DWORD,
    bV4Endpoints: CIEXYZTRIPLE,
    bV4GammaRed: DWORD,
    bV4GammaGreen: DWORD,
    bV4GammaBlue: DWORD,
};
pub const PBITMAPV4HEADER = ?*extern struct {
    bV4Size: DWORD,
    bV4Width: LONG,
    bV4Height: LONG,
    bV4Planes: WORD,
    bV4BitCount: WORD,
    bV4V4Compression: DWORD,
    bV4SizeImage: DWORD,
    bV4XPelsPerMeter: LONG,
    bV4YPelsPerMeter: LONG,
    bV4ClrUsed: DWORD,
    bV4ClrImportant: DWORD,
    bV4RedMask: DWORD,
    bV4GreenMask: DWORD,
    bV4BlueMask: DWORD,
    bV4AlphaMask: DWORD,
    bV4CSType: DWORD,
    bV4Endpoints: CIEXYZTRIPLE,
    bV4GammaRed: DWORD,
    bV4GammaGreen: DWORD,
    bV4GammaBlue: DWORD,
};
pub const BITMAPV5HEADER = extern struct {
    bV5Size: DWORD,
    bV5Width: LONG,
    bV5Height: LONG,
    bV5Planes: WORD,
    bV5BitCount: WORD,
    bV5Compression: DWORD,
    bV5SizeImage: DWORD,
    bV5XPelsPerMeter: LONG,
    bV5YPelsPerMeter: LONG,
    bV5ClrUsed: DWORD,
    bV5ClrImportant: DWORD,
    bV5RedMask: DWORD,
    bV5GreenMask: DWORD,
    bV5BlueMask: DWORD,
    bV5AlphaMask: DWORD,
    bV5CSType: DWORD,
    bV5Endpoints: CIEXYZTRIPLE,
    bV5GammaRed: DWORD,
    bV5GammaGreen: DWORD,
    bV5GammaBlue: DWORD,
    bV5Intent: DWORD,
    bV5ProfileData: DWORD,
    bV5ProfileSize: DWORD,
    bV5Reserved: DWORD,
};
pub const LPBITMAPV5HEADER = ?*extern struct {
    bV5Size: DWORD,
    bV5Width: LONG,
    bV5Height: LONG,
    bV5Planes: WORD,
    bV5BitCount: WORD,
    bV5Compression: DWORD,
    bV5SizeImage: DWORD,
    bV5XPelsPerMeter: LONG,
    bV5YPelsPerMeter: LONG,
    bV5ClrUsed: DWORD,
    bV5ClrImportant: DWORD,
    bV5RedMask: DWORD,
    bV5GreenMask: DWORD,
    bV5BlueMask: DWORD,
    bV5AlphaMask: DWORD,
    bV5CSType: DWORD,
    bV5Endpoints: CIEXYZTRIPLE,
    bV5GammaRed: DWORD,
    bV5GammaGreen: DWORD,
    bV5GammaBlue: DWORD,
    bV5Intent: DWORD,
    bV5ProfileData: DWORD,
    bV5ProfileSize: DWORD,
    bV5Reserved: DWORD,
};
pub const PBITMAPV5HEADER = ?*extern struct {
    bV5Size: DWORD,
    bV5Width: LONG,
    bV5Height: LONG,
    bV5Planes: WORD,
    bV5BitCount: WORD,
    bV5Compression: DWORD,
    bV5SizeImage: DWORD,
    bV5XPelsPerMeter: LONG,
    bV5YPelsPerMeter: LONG,
    bV5ClrUsed: DWORD,
    bV5ClrImportant: DWORD,
    bV5RedMask: DWORD,
    bV5GreenMask: DWORD,
    bV5BlueMask: DWORD,
    bV5AlphaMask: DWORD,
    bV5CSType: DWORD,
    bV5Endpoints: CIEXYZTRIPLE,
    bV5GammaRed: DWORD,
    bV5GammaGreen: DWORD,
    bV5GammaBlue: DWORD,
    bV5Intent: DWORD,
    bV5ProfileData: DWORD,
    bV5ProfileSize: DWORD,
    bV5Reserved: DWORD,
};
pub const BITMAPINFO = extern struct {
    bmiHeader: BITMAPINFOHEADER,
    bmiColors: [1]RGBQUAD,
};

pub const LPBITMAPINFO = ?*BITMAPINFO;
pub const PBITMAPINFO = ?*BITMAPINFO;
pub const BITMAPCOREINFO = extern struct {
    bmciHeader: BITMAPCOREHEADER,
    bmciColors: [1]RGBTRIPLE,
};

pub const LPBITMAPCOREINFO = ?*BITMAPCOREINFO;
pub const PBITMAPCOREINFO = ?*BITMAPCOREINFO;
pub const BITMAPFILEHEADER = extern struct {
    bfType: WORD,
    bfSize: DWORD,
    bfReserved1: WORD,
    bfReserved2: WORD,
    bfOffBits: DWORD,
};

pub const LPBITMAPFILEHEADER = ?*BITMAPFILEHEADER;
pub const PBITMAPFILEHEADER = ?*BITMAPFILEHEADER;
pub const FONTSIGNATURE = extern struct {
    fsUsb: [4]DWORD,
    fsCsb: [2]DWORD,
};

pub const PFONTSIGNATURE = ?*FONTSIGNATURE;
pub const LPFONTSIGNATURE = ?*FONTSIGNATURE;
pub const CHARSETINFO = extern struct {
    ciCharset: UINT,
    ciACP: UINT,
    fs: FONTSIGNATURE,
};

pub const PCHARSETINFO = ?*CHARSETINFO;
pub const NPCHARSETINFO = ?*CHARSETINFO;
pub const LPCHARSETINFO = ?*CHARSETINFO;
pub const LOCALESIGNATURE = extern struct {
    lsUsb: [4]DWORD,
    lsCsbDefault: [2]DWORD,
    lsCsbSupported: [2]DWORD,
};

pub const PLOCALESIGNATURE = ?*LOCALESIGNATURE;
pub const LPLOCALESIGNATURE = ?*LOCALESIGNATURE;
pub const HANDLETABLE = extern struct {
    objectHandle: [1]HGDIOBJ,
};

pub const PHANDLETABLE = ?*HANDLETABLE;
pub const LPHANDLETABLE = ?*HANDLETABLE;
pub const METARECORD = extern struct {
    rdSize: DWORD,
    rdFunction: WORD,
    rdParm: [1]WORD,
};

pub const PMETARECORD = ?*METARECORD;
pub const LPMETARECORD = ?*METARECORD;
pub const METAFILEPICT = extern struct {
    mm: LONG,
    xExt: LONG,
    yExt: LONG,
    hMF: HMETAFILE,
};

pub const LPMETAFILEPICT = ?*METAFILEPICT;
pub const METAHEADER = extern struct {
    mtType: WORD,
    mtHeaderSize: WORD,
    mtVersion: WORD,
    mtSize: DWORD,
    mtNoObjects: WORD,
    mtMaxRecord: DWORD,
    mtNoParameters: WORD,
};

pub const PMETAHEADER = ?*METAHEADER;
pub const LPMETAHEADER = ?*METAHEADER;
pub const ENHMETARECORD = extern struct {
    iType: DWORD,
    nSize: DWORD,
    dParm: [1]DWORD,
};

pub const PENHMETARECORD = ?*ENHMETARECORD;
pub const LPENHMETARECORD = ?*ENHMETARECORD;
pub const ENHMETAHEADER = extern struct {
    iType: DWORD,
    nSize: DWORD,
    rclBounds: RECTL,
    rclFrame: RECTL,
    dSignature: DWORD,
    nVersion: DWORD,
    nBytes: DWORD,
    nRecords: DWORD,
    nHandles: WORD,
    sReserved: WORD,
    nDescription: DWORD,
    offDescription: DWORD,
    nPalEntries: DWORD,
    szlDevice: SIZEL,
    szlMillimeters: SIZEL,
    cbPixelFormat: DWORD,
    offPixelFormat: DWORD,
    bOpenGL: DWORD,
    szlMicrometers: SIZEL,
};

pub const PENHMETAHEADER = ?*ENHMETAHEADER;
pub const LPENHMETAHEADER = ?*ENHMETAHEADER;
pub const BCHAR = BYTE;
pub const TEXTMETRICA = extern struct {
    tmHeight: LONG,
    tmAscent: LONG,
    tmDescent: LONG,
    tmInternalLeading: LONG,
    tmExternalLeading: LONG,
    tmAveCharWidth: LONG,
    tmMaxCharWidth: LONG,
    tmWeight: LONG,
    tmOverhang: LONG,
    tmDigitizedAspectX: LONG,
    tmDigitizedAspectY: LONG,
    tmFirstChar: BYTE,
    tmLastChar: BYTE,
    tmDefaultChar: BYTE,
    tmBreakChar: BYTE,
    tmItalic: BYTE,
    tmUnderlined: BYTE,
    tmStruckOut: BYTE,
    tmPitchAndFamily: BYTE,
    tmCharSet: BYTE,
};

pub const PTEXTMETRICA = ?*TEXTMETRICA;
pub const NPTEXTMETRICA = ?*TEXTMETRICA;
pub const LPTEXTMETRICA = ?*TEXTMETRICA;
pub const TEXTMETRICW = extern struct {
    tmHeight: LONG,
    tmAscent: LONG,
    tmDescent: LONG,
    tmInternalLeading: LONG,
    tmExternalLeading: LONG,
    tmAveCharWidth: LONG,
    tmMaxCharWidth: LONG,
    tmWeight: LONG,
    tmOverhang: LONG,
    tmDigitizedAspectX: LONG,
    tmDigitizedAspectY: LONG,
    tmFirstChar: WCHAR,
    tmLastChar: WCHAR,
    tmDefaultChar: WCHAR,
    tmBreakChar: WCHAR,
    tmItalic: BYTE,
    tmUnderlined: BYTE,
    tmStruckOut: BYTE,
    tmPitchAndFamily: BYTE,
    tmCharSet: BYTE,
};

pub const PTEXTMETRICW = ?*TEXTMETRICW;
pub const NPTEXTMETRICW = ?*TEXTMETRICW;
pub const LPTEXTMETRICW = ?*TEXTMETRICW;
pub const NEWTEXTMETRICA = extern struct {
    tmHeight: LONG,
    tmAscent: LONG,
    tmDescent: LONG,
    tmInternalLeading: LONG,
    tmExternalLeading: LONG,
    tmAveCharWidth: LONG,
    tmMaxCharWidth: LONG,
    tmWeight: LONG,
    tmOverhang: LONG,
    tmDigitizedAspectX: LONG,
    tmDigitizedAspectY: LONG,
    tmFirstChar: BYTE,
    tmLastChar: BYTE,
    tmDefaultChar: BYTE,
    tmBreakChar: BYTE,
    tmItalic: BYTE,
    tmUnderlined: BYTE,
    tmStruckOut: BYTE,
    tmPitchAndFamily: BYTE,
    tmCharSet: BYTE,
    ntmFlags: DWORD,
    ntmSizeEM: UINT,
    ntmCellHeight: UINT,
    ntmAvgWidth: UINT,
};

pub const PNEWTEXTMETRICA = ?*NEWTEXTMETRICA;
pub const NPNEWTEXTMETRICA = ?*NEWTEXTMETRICA;
pub const LPNEWTEXTMETRICA = ?*NEWTEXTMETRICA;
pub const NEWTEXTMETRICW = extern struct {
    tmHeight: LONG,
    tmAscent: LONG,
    tmDescent: LONG,
    tmInternalLeading: LONG,
    tmExternalLeading: LONG,
    tmAveCharWidth: LONG,
    tmMaxCharWidth: LONG,
    tmWeight: LONG,
    tmOverhang: LONG,
    tmDigitizedAspectX: LONG,
    tmDigitizedAspectY: LONG,
    tmFirstChar: WCHAR,
    tmLastChar: WCHAR,
    tmDefaultChar: WCHAR,
    tmBreakChar: WCHAR,
    tmItalic: BYTE,
    tmUnderlined: BYTE,
    tmStruckOut: BYTE,
    tmPitchAndFamily: BYTE,
    tmCharSet: BYTE,
    ntmFlags: DWORD,
    ntmSizeEM: UINT,
    ntmCellHeight: UINT,
    ntmAvgWidth: UINT,
};

pub const PNEWTEXTMETRICW = ?*NEWTEXTMETRICW;
pub const NPNEWTEXTMETRICW = ?*NEWTEXTMETRICW;
pub const LPNEWTEXTMETRICW = ?*NEWTEXTMETRICW;
pub const NEWTEXTMETRICEXA = extern struct {
    ntmTm: NEWTEXTMETRICA,
    ntmFontSig: FONTSIGNATURE,
};

pub const NEWTEXTMETRICEXW = extern struct {
    ntmTm: NEWTEXTMETRICW,
    ntmFontSig: FONTSIGNATURE,
};

pub const PELARRAY = extern struct {
    paXCount: LONG,
    paYCount: LONG,
    paXExt: LONG,
    paYExt: LONG,
    paRGBs: BYTE,
};

pub const PPELARRAY = ?*PELARRAY;
pub const NPPELARRAY = ?*PELARRAY;
pub const LPPELARRAY = ?*PELARRAY;
pub const LOGBRUSH = extern struct {
    lbStyle: UINT,
    lbColor: COLORREF,
    lbHatch: ULONG_PTR,
};

pub const PLOGBRUSH = ?*LOGBRUSH;
pub const NPLOGBRUSH = ?*LOGBRUSH;
pub const LPLOGBRUSH = ?*LOGBRUSH;
pub const LOGBRUSH32 = extern struct {
    lbStyle: UINT,
    lbColor: COLORREF,
    lbHatch: ULONG,
};

pub const PLOGBRUSH32 = ?*LOGBRUSH32;
pub const NPLOGBRUSH32 = ?*LOGBRUSH32;
pub const LPLOGBRUSH32 = ?*LOGBRUSH32;
pub const PATTERN = LOGBRUSH;
pub const PPATTERN = ?*PATTERN;
pub const NPPATTERN = ?*PATTERN;
pub const LPPATTERN = ?*PATTERN;
pub const LOGPEN = extern struct {
    lopnStyle: UINT,
    lopnWidth: POINT,
    lopnColor: COLORREF,
};

pub const PLOGPEN = ?*LOGPEN;
pub const NPLOGPEN = ?*LOGPEN;
pub const LPLOGPEN = ?*LOGPEN;
pub const EXTLOGPEN = extern struct {
    elpPenStyle: DWORD,
    elpWidth: DWORD,
    elpBrushStyle: UINT,
    elpColor: COLORREF,
    elpHatch: ULONG_PTR,
    elpNumEntries: DWORD,
    elpStyleEntry: [1]DWORD,
};

pub const PEXTLOGPEN = ?*EXTLOGPEN;
pub const NPEXTLOGPEN = ?*EXTLOGPEN;
pub const LPEXTLOGPEN = ?*EXTLOGPEN;
pub const EXTLOGPEN32 = extern struct {
    elpPenStyle: DWORD,
    elpWidth: DWORD,
    elpBrushStyle: UINT,
    elpColor: COLORREF,
    elpHatch: ULONG,
    elpNumEntries: DWORD,
    elpStyleEntry: [1]DWORD,
};

pub const PEXTLOGPEN32 = ?*EXTLOGPEN32;
pub const NPEXTLOGPEN32 = ?*EXTLOGPEN32;
pub const LPEXTLOGPEN32 = ?*EXTLOGPEN32;
pub const PALETTEENTRY = extern struct {
    peRed: BYTE,
    peGreen: BYTE,
    peBlue: BYTE,
    peFlags: BYTE,
};

pub const PPALETTEENTRY = ?*PALETTEENTRY;
pub const LPPALETTEENTRY = ?*PALETTEENTRY;
pub const LOGPALETTE = extern struct {
    palVersion: WORD,
    palNumEntries: WORD,
    palPalEntry: [1]PALETTEENTRY,
};

pub const PLOGPALETTE = ?*LOGPALETTE;
pub const NPLOGPALETTE = ?*LOGPALETTE;
pub const LPLOGPALETTE = ?*LOGPALETTE;
pub const LOGFONTA = extern struct {
    lfHeight: LONG,
    lfWidth: LONG,
    lfEscapement: LONG,
    lfOrientation: LONG,
    lfWeight: LONG,
    lfItalic: BYTE,
    lfUnderline: BYTE,
    lfStrikeOut: BYTE,
    lfCharSet: BYTE,
    lfOutPrecision: BYTE,
    lfClipPrecision: BYTE,
    lfQuality: BYTE,
    lfPitchAndFamily: BYTE,
    lfFaceName: [32]CHAR,
};

pub const PLOGFONTA = ?*LOGFONTA;
pub const NPLOGFONTA = ?*LOGFONTA;
pub const LPLOGFONTA = ?*LOGFONTA;
pub const LOGFONTW = extern struct {
    lfHeight: LONG,
    lfWidth: LONG,
    lfEscapement: LONG,
    lfOrientation: LONG,
    lfWeight: LONG,
    lfItalic: BYTE,
    lfUnderline: BYTE,
    lfStrikeOut: BYTE,
    lfCharSet: BYTE,
    lfOutPrecision: BYTE,
    lfClipPrecision: BYTE,
    lfQuality: BYTE,
    lfPitchAndFamily: BYTE,
    lfFaceName: [32]WCHAR,
};

pub const PLOGFONTW = ?*LOGFONTW;
pub const NPLOGFONTW = ?*LOGFONTW;
pub const LPLOGFONTW = ?*LOGFONTW;
pub const ENUMLOGFONTA = extern struct {
    elfLogFont: LOGFONTA,
    elfFullName: [64]BYTE,
    elfStyle: [32]BYTE,
};

pub const LPENUMLOGFONTA = ?*ENUMLOGFONTA;
pub const ENUMLOGFONTW = extern struct {
    elfLogFont: LOGFONTW,
    elfFullName: [64]WCHAR,
    elfStyle: [32]WCHAR,
};

pub const LPENUMLOGFONTW = ?*ENUMLOGFONTW;
pub const ENUMLOGFONTEXA = extern struct {
    elfLogFont: LOGFONTA,
    elfFullName: [64]BYTE,
    elfStyle: [32]BYTE,
    elfScript: [32]BYTE,
};

pub const LPENUMLOGFONTEXA = ?*ENUMLOGFONTEXA;
pub const ENUMLOGFONTEXW = extern struct {
    elfLogFont: LOGFONTW,
    elfFullName: [64]WCHAR,
    elfStyle: [32]WCHAR,
    elfScript: [32]WCHAR,
};

pub const LPENUMLOGFONTEXW = ?*ENUMLOGFONTEXW;
pub const PANOSE = extern struct {
    bFamilyType: BYTE,
    bSerifStyle: BYTE,
    bWeight: BYTE,
    bProportion: BYTE,
    bContrast: BYTE,
    bStrokeVariation: BYTE,
    bArmStyle: BYTE,
    bLetterform: BYTE,
    bMidline: BYTE,
    bXHeight: BYTE,
};

pub const LPPANOSE = ?*PANOSE;
pub const EXTLOGFONTA = extern struct {
    elfLogFont: LOGFONTA,
    elfFullName: [64]BYTE,
    elfStyle: [32]BYTE,
    elfVersion: DWORD,
    elfStyleSize: DWORD,
    elfMatch: DWORD,
    elfReserved: DWORD,
    elfVendorId: [4]BYTE,
    elfCulture: DWORD,
    elfPanose: PANOSE,
};

pub const PEXTLOGFONTA = ?*EXTLOGFONTA;
pub const NPEXTLOGFONTA = ?*EXTLOGFONTA;
pub const LPEXTLOGFONTA = ?*EXTLOGFONTA;
pub const EXTLOGFONTW = extern struct {
    elfLogFont: LOGFONTW,
    elfFullName: [64]WCHAR,
    elfStyle: [32]WCHAR,
    elfVersion: DWORD,
    elfStyleSize: DWORD,
    elfMatch: DWORD,
    elfReserved: DWORD,
    elfVendorId: [4]BYTE,
    elfCulture: DWORD,
    elfPanose: PANOSE,
};

pub const PEXTLOGFONTW = ?*EXTLOGFONTW;
pub const NPEXTLOGFONTW = ?*EXTLOGFONTW;
pub const LPEXTLOGFONTW = ?*EXTLOGFONTW;
pub const devicemodeA = extern struct {
    dmDeviceName: [32]BYTE,
    dmSpecVersion: WORD,
    dmDriverVersion: WORD,
    dmSize: WORD,
    dmDriverExtra: WORD,
    dmFields: DWORD,
    u: extern union {
        s: extern struct {
            dmOrientation: c_short,
            dmPaperSize: c_short,
            dmPaperLength: c_short,
            dmPaperWidth: c_short,
            dmScale: c_short,
            dmCopies: c_short,
            dmDefaultSource: c_short,
            dmPrintQuality: c_short,
        },
        s2: extern struct {
            dmPosition: POINTL,
            dmDisplayOrientation: DWORD,
            dmDisplayFixedOutput: DWORD,
        },
    },
    dmColor: c_short,
    dmDuplex: c_short,
    dmYResolution: c_short,
    dmTTOption: c_short,
    dmCollate: c_short,
    dmFormName: [32]BYTE,
    dmLogPixels: WORD,
    dmBitsPerPel: DWORD,
    dmPelsWidth: DWORD,
    dmPelsHeight: DWORD,
    u2: extern union {
        dmDisplayFlags: DWORD,
        dmNup: DWORD,
    },
    dmDisplayFrequency: DWORD,
    dmICMMethod: DWORD,
    dmICMIntent: DWORD,
    dmMediaType: DWORD,
    dmDitherType: DWORD,
    dmReserved1: DWORD,
    dmReserved2: DWORD,
    dmPanningWidth: DWORD,
    dmPanningHeight: DWORD,
};
pub const DEVMODEA = devicemodeA;
pub const PDEVMODEA = ?*devicemodeA;
pub const NPDEVMODEA = ?*devicemodeA;
pub const LPDEVMODEA = ?*devicemodeA;
pub const devicemodeW = extern struct {
    dmDeviceName: [32]WCHAR,
    dmSpecVersion: WORD,
    dmDriverVersion: WORD,
    dmSize: WORD,
    dmDriverExtra: WORD,
    dmFields: DWORD,
    u: extern union {
        s: extern struct {
            dmOrientation: c_short,
            dmPaperSize: c_short,
            dmPaperLength: c_short,
            dmPaperWidth: c_short,
            dmScale: c_short,
            dmCopies: c_short,
            dmDefaultSource: c_short,
            dmPrintQuality: c_short,
        },
        s2: extern struct {
            dmPosition: POINTL,
            dmDisplayOrientation: DWORD,
            dmDisplayFixedOutput: DWORD,
        },
    },
    dmColor: c_short,
    dmDuplex: c_short,
    dmYResolution: c_short,
    dmTTOption: c_short,
    dmCollate: c_short,
    dmFormName: [32]WCHAR,
    dmLogPixels: WORD,
    dmBitsPerPel: DWORD,
    dmPelsWidth: DWORD,
    dmPelsHeight: DWORD,
    u2: extern union {
        dmDisplayFlags: DWORD,
        dmNup: DWORD,
    },
    dmDisplayFrequency: DWORD,
    dmICMMethod: DWORD,
    dmICMIntent: DWORD,
    dmMediaType: DWORD,
    dmDitherType: DWORD,
    dmReserved1: DWORD,
    dmReserved2: DWORD,
    dmPanningWidth: DWORD,
    dmPanningHeight: DWORD,
};
pub const DEVMODEW = devicemodeW;
pub const PDEVMODEW = ?*devicemodeW;
pub const NPDEVMODEW = ?*devicemodeW;
pub const LPDEVMODEW = ?*devicemodeW;
pub const DISPLAY_DEVICEA = extern struct {
    cb: DWORD,
    DeviceName: [32]CHAR,
    DeviceString: [128]CHAR,
    StateFlags: DWORD,
    DeviceID: [128]CHAR,
    DeviceKey: [128]CHAR,
};

pub const PDISPLAY_DEVICEA = ?*DISPLAY_DEVICEA;
pub const LPDISPLAY_DEVICEA = ?*DISPLAY_DEVICEA;
pub const DISPLAY_DEVICEW = extern struct {
    cb: DWORD,
    DeviceName: [32]WCHAR,
    DeviceString: [128]WCHAR,
    StateFlags: DWORD,
    DeviceID: [128]WCHAR,
    DeviceKey: [128]WCHAR,
};

pub const PDISPLAY_DEVICEW = ?*DISPLAY_DEVICEW;
pub const LPDISPLAY_DEVICEW = ?*DISPLAY_DEVICEW;
pub const DISPLAYCONFIG_RATIONAL = extern struct {
    Numerator: UINT32,
    Denominator: UINT32,
};

pub const DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY = c_int;
pub const DISPLAYCONFIG_SCANLINE_ORDERING = c_int;
pub const DISPLAYCONFIG_2DREGION = extern struct {
    cx: UINT32,
    cy: UINT32,
};

pub const DISPLAYCONFIG_VIDEO_SIGNAL_INFO = extern struct {
    pixelRate: UINT64,
    hSyncFreq: DISPLAYCONFIG_RATIONAL,
    vSyncFreq: DISPLAYCONFIG_RATIONAL,
    activeSize: DISPLAYCONFIG_2DREGION,
    totalSize: DISPLAYCONFIG_2DREGION,
    u: extern union {
        AdditionalSignalInfo: @OpaqueType(),
        videoStandard: UINT32,
    },
    scanLineOrdering: DISPLAYCONFIG_SCANLINE_ORDERING,
};

pub const DISPLAYCONFIG_SCALING = c_int;
pub const DISPLAYCONFIG_ROTATION = c_int;
pub const DISPLAYCONFIG_MODE_INFO_TYPE = c_int;
pub const DISPLAYCONFIG_PIXELFORMAT = c_int;
pub const DISPLAYCONFIG_SOURCE_MODE = extern struct {
    width: UINT32,
    height: UINT32,
    pixelFormat: DISPLAYCONFIG_PIXELFORMAT,
    position: POINTL,
};

pub const DISPLAYCONFIG_TARGET_MODE = extern struct {
    targetVideoSignalInfo: DISPLAYCONFIG_VIDEO_SIGNAL_INFO,
};

pub const DISPLAYCONFIG_DESKTOP_IMAGE_INFO = extern struct {
    PathSourceSize: POINTL,
    DesktopImageRegion: RECTL,
    DesktopImageClip: RECTL,
};

pub const DISPLAYCONFIG_MODE_INFO = extern struct {
    infoType: DISPLAYCONFIG_MODE_INFO_TYPE,
    id: UINT32,
    adapterId: LUID,
    u: extern union {
        targetMode: DISPLAYCONFIG_TARGET_MODE,
        sourceMode: DISPLAYCONFIG_SOURCE_MODE,
        desktopImageInfo: DISPLAYCONFIG_DESKTOP_IMAGE_INFO,
    },
};

pub const DISPLAYCONFIG_PATH_SOURCE_INFO = extern struct {
    adapterId: LUID,
    id: UINT32,
    u: extern union {
        modeInfoIdx: UINT32,
        s: packed struct {
            cloneGroupId: @IntType(false, 16),
            sourceModeInfoIdx: @IntType(false, 16),
        },
    },
    statusFlags: UINT32,
};

pub const DISPLAYCONFIG_PATH_TARGET_INFO = extern struct {
    adapterId: LUID,
    id: UINT32,
    u: extern union {
        modeInfoIdx: UINT32,
        s: packed struct {
            desktopModeInfoIdx: @IntType(false, 16),
            targetModeInfoIdx: @IntType(false, 16),
        },
    },
    outputTechnology: DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY,
    rotation: DISPLAYCONFIG_ROTATION,
    scaling: DISPLAYCONFIG_SCALING,
    refreshRate: DISPLAYCONFIG_RATIONAL,
    scanLineOrdering: DISPLAYCONFIG_SCANLINE_ORDERING,
    targetAvailable: BOOL,
    statusFlags: UINT32,
};

pub const DISPLAYCONFIG_PATH_INFO = extern struct {
    sourceInfo: DISPLAYCONFIG_PATH_SOURCE_INFO,
    targetInfo: DISPLAYCONFIG_PATH_TARGET_INFO,
    flags: UINT32,
};

pub const DISPLAYCONFIG_TOPOLOGY_ID = c_int;

pub const DISPLAYCONFIG_DEVICE_INFO_TYPE = c_int;
pub const DISPLAYCONFIG_DEVICE_INFO_HEADER = extern struct {
    type: DISPLAYCONFIG_DEVICE_INFO_TYPE,
    size: UINT32,
    adapterId: LUID,
    id: UINT32,
};

pub const DISPLAYCONFIG_SOURCE_DEVICE_NAME = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    viewGdiDeviceName: [32]WCHAR,
};

pub const DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS = extern struct {
    u: extern union {
        s: packed struct {
            friendlyNameFromEdid: @IntType(false, 1),
            friendlyNameForced: @IntType(false, 1),
            edidIdsValid: @IntType(false, 1),
            reserved: @IntType(false, 29),
        },
        value: UINT32,
    },
};

pub const DISPLAYCONFIG_TARGET_DEVICE_NAME = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    flags: DISPLAYCONFIG_TARGET_DEVICE_NAME_FLAGS,
    outputTechnology: DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY,
    edidManufactureId: UINT16,
    edidProductCodeId: UINT16,
    connectorInstance: UINT32,
    monitorFriendlyDeviceName: [64]WCHAR,
    monitorDevicePath: [128]WCHAR,
};

pub const DISPLAYCONFIG_TARGET_PREFERRED_MODE = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    width: UINT32,
    height: UINT32,
    targetMode: DISPLAYCONFIG_TARGET_MODE,
};

pub const DISPLAYCONFIG_ADAPTER_NAME = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    adapterDevicePath: [128]WCHAR,
};

pub const DISPLAYCONFIG_TARGET_BASE_TYPE = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    baseOutputTechnology: DISPLAYCONFIG_VIDEO_OUTPUT_TECHNOLOGY,
};

pub const DISPLAYCONFIG_SET_TARGET_PERSISTENCE = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    u: extern union {
        s: packed struct {
            bootPersistenceOn: @IntType(false, 1),
            reserved: @IntType(false, 31),
        },
        value: UINT32,
    },
};

pub const DISPLAYCONFIG_SUPPORT_VIRTUAL_RESOLUTION = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    u: extern union {
        s: packed struct {
            disableMonitorVirtualResolution: @IntType(false, 1),
            reserved: @IntType(false, 31),
        },
        value: UINT32,
    },
};

pub const DISPLAYCONFIG_COLOR_ENCODING = c_int;

pub const DISPLAYCONFIG_GET_ADVANCED_COLOR_INFO = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    u: extern union {
        s: packed struct {
            advancedColorSupported: @IntType(false, 1),
            advancedColorEnabled: @IntType(false, 1),
            wideColorEnforced: @IntType(false, 1),
            reserved: @IntType(false, 29),
        },
        value: UINT32,
    },
    colorEncoding: DISPLAYCONFIG_COLOR_ENCODING,
    bitsPerColorChannel: UINT32,
};

pub const DISPLAYCONFIG_SET_ADVANCED_COLOR_STATE = extern struct {
    header: DISPLAYCONFIG_DEVICE_INFO_HEADER,
    u: extern union {
        s: packed struct {
          enableAdvancedColor: @IntType(false, 1),
          reserved: @IntType(false, 31),
        },
        value: UINT32,
    },
};

pub const RGNDATAHEADER = extern struct {
    dwSize: DWORD,
    iType: DWORD,
    nCount: DWORD,
    nRgnSize: DWORD,
    rcBound: RECT,
};

pub const PRGNDATAHEADER = ?*RGNDATAHEADER;
pub const RGNDATA = extern struct {
    rdh: RGNDATAHEADER,
    Buffer: [1]u8,
};

pub const PRGNDATA = ?*RGNDATA;
pub const NPRGNDATA = ?*RGNDATA;
pub const LPRGNDATA = ?*RGNDATA;
pub const ABC = extern struct {
    abcA: c_int,
    abcB: UINT,
    abcC: c_int,
};

pub const PABC = ?*ABC;
pub const NPABC = ?*ABC;
pub const LPABC = ?*ABC;
pub const ABCFLOAT = extern struct {
    abcfA: FLOAT,
    abcfB: FLOAT,
    abcfC: FLOAT,
};

pub const PABCFLOAT = ?*ABCFLOAT;
pub const NPABCFLOAT = ?*ABCFLOAT;
pub const LPABCFLOAT = ?*ABCFLOAT;
pub const OUTLINETEXTMETRICA = extern struct {
    otmSize: UINT,
    otmTextMetrics: TEXTMETRICA,
    otmFiller: BYTE,
    otmPanoseNumber: PANOSE,
    otmfsSelection: UINT,
    otmfsType: UINT,
    otmsCharSlopeRise: c_int,
    otmsCharSlopeRun: c_int,
    otmItalicAngle: c_int,
    otmEMSquare: UINT,
    otmAscent: c_int,
    otmDescent: c_int,
    otmLineGap: UINT,
    otmsCapEmHeight: UINT,
    otmsXHeight: UINT,
    otmrcFontBox: RECT,
    otmMacAscent: c_int,
    otmMacDescent: c_int,
    otmMacLineGap: UINT,
    otmusMinimumPPEM: UINT,
    otmptSubscriptSize: POINT,
    otmptSubscriptOffset: POINT,
    otmptSuperscriptSize: POINT,
    otmptSuperscriptOffset: POINT,
    otmsStrikeoutSize: UINT,
    otmsStrikeoutPosition: c_int,
    otmsUnderscoreSize: c_int,
    otmsUnderscorePosition: c_int,
    otmpFamilyName: PSTR,
    otmpFaceName: PSTR,
    otmpStyleName: PSTR,
    otmpFullName: PSTR,
};

pub const POUTLINETEXTMETRICA = ?*OUTLINETEXTMETRICA;
pub const NPOUTLINETEXTMETRICA = ?*OUTLINETEXTMETRICA;
pub const LPOUTLINETEXTMETRICA = ?*OUTLINETEXTMETRICA;
pub const OUTLINETEXTMETRICW = extern struct {
    otmSize: UINT,
    otmTextMetrics: TEXTMETRICW,
    otmFiller: BYTE,
    otmPanoseNumber: PANOSE,
    otmfsSelection: UINT,
    otmfsType: UINT,
    otmsCharSlopeRise: c_int,
    otmsCharSlopeRun: c_int,
    otmItalicAngle: c_int,
    otmEMSquare: UINT,
    otmAscent: c_int,
    otmDescent: c_int,
    otmLineGap: UINT,
    otmsCapEmHeight: UINT,
    otmsXHeight: UINT,
    otmrcFontBox: RECT,
    otmMacAscent: c_int,
    otmMacDescent: c_int,
    otmMacLineGap: UINT,
    otmusMinimumPPEM: UINT,
    otmptSubscriptSize: POINT,
    otmptSubscriptOffset: POINT,
    otmptSuperscriptSize: POINT,
    otmptSuperscriptOffset: POINT,
    otmsStrikeoutSize: UINT,
    otmsStrikeoutPosition: c_int,
    otmsUnderscoreSize: c_int,
    otmsUnderscorePosition: c_int,
    otmpFamilyName: PSTR,
    otmpFaceName: PSTR,
    otmpStyleName: PSTR,
    otmpFullName: PSTR,
};

pub const POUTLINETEXTMETRICW = ?*OUTLINETEXTMETRICW;
pub const NPOUTLINETEXTMETRICW = ?*OUTLINETEXTMETRICW;
pub const LPOUTLINETEXTMETRICW = ?*OUTLINETEXTMETRICW;
pub const POLYTEXTA = extern struct {
    x: c_int,
    y: c_int,
    n: UINT,
    lpstr: LPCSTR,
    uiFlags: UINT,
    rcl: RECT,
    pdx: ?*c_int,
};

pub const PPOLYTEXTA = ?*POLYTEXTA;
pub const NPPOLYTEXTA = ?*POLYTEXTA;
pub const LPPOLYTEXTA = ?*POLYTEXTA;
pub const POLYTEXTW = extern struct {
    x: c_int,
    y: c_int,
    n: UINT,
    lpstr: LPCWSTR,
    uiFlags: UINT,
    rcl: RECT,
    pdx: ?*c_int,
};

pub const PPOLYTEXTW = ?*POLYTEXTW;
pub const NPPOLYTEXTW = ?*POLYTEXTW;
pub const LPPOLYTEXTW = ?*POLYTEXTW;
pub const FIXED = extern struct {
    fract: WORD,
    value: c_short,
};

pub const MAT2 = extern struct {
    eM11: FIXED,
    eM12: FIXED,
    eM21: FIXED,
    eM22: FIXED,
};

pub const LPMAT2 = ?*MAT2;
pub const GLYPHMETRICS = extern struct {
    gmBlackBoxX: UINT,
    gmBlackBoxY: UINT,
    gmptGlyphOrigin: POINT,
    gmCellIncX: c_short,
    gmCellIncY: c_short,
};

pub const LPGLYPHMETRICS = ?*GLYPHMETRICS;
pub const POINTFX = extern struct {
    x: FIXED,
    y: FIXED,
};

pub const LPPOINTFX = ?*POINTFX;
pub const TTPOLYCURVE = extern struct {
    wType: WORD,
    cpfx: WORD,
    apfx: [1]POINTFX,
};

pub const LPTTPOLYCURVE = ?*TTPOLYCURVE;
pub const TTPOLYGONHEADER = extern struct {
    cb: DWORD,
    dwType: DWORD,
    pfxStart: POINTFX,
};

pub const LPTTPOLYGONHEADER = ?*TTPOLYGONHEADER;
pub const GCP_RESULTSA = extern struct {
    lStructSize: DWORD,
    lpOutString: LPSTR,
    lpOrder: ?*UINT,
    lpDx: ?*c_int,
    lpCaretPos: ?*c_int,
    lpClass: LPSTR,
    lpGlyphs: LPWSTR,
    nGlyphs: UINT,
    nMaxFit: c_int,
};

pub const LPGCP_RESULTSA = ?*GCP_RESULTSA;
pub const GCP_RESULTSW = extern struct {
    lStructSize: DWORD,
    lpOutString: LPWSTR,
    lpOrder: ?*UINT,
    lpDx: ?*c_int,
    lpCaretPos: ?*c_int,
    lpClass: LPSTR,
    lpGlyphs: LPWSTR,
    nGlyphs: UINT,
    nMaxFit: c_int,
};

pub const LPGCP_RESULTSW = ?*GCP_RESULTSW;
pub const RASTERIZER_STATUS = extern struct {
    nSize: c_short,
    wFlags: c_short,
    nLanguageID: c_short,
};

pub const LPRASTERIZER_STATUS = ?*RASTERIZER_STATUS;
pub const PIXELFORMATDESCRIPTOR = extern struct {
    nSize: WORD,
    nVersion: WORD,
    dwFlags: DWORD,
    iPixelType: BYTE,
    cColorBits: BYTE,
    cRedBits: BYTE,
    cRedShift: BYTE,
    cGreenBits: BYTE,
    cGreenShift: BYTE,
    cBlueBits: BYTE,
    cBlueShift: BYTE,
    cAlphaBits: BYTE,
    cAlphaShift: BYTE,
    cAccumBits: BYTE,
    cAccumRedBits: BYTE,
    cAccumGreenBits: BYTE,
    cAccumBlueBits: BYTE,
    cAccumAlphaBits: BYTE,
    cDepthBits: BYTE,
    cStencilBits: BYTE,
    cAuxBuffers: BYTE,
    iLayerType: BYTE,
    bReserved: BYTE,
    dwLayerMask: DWORD,
    dwVisibleMask: DWORD,
    dwDamageMask: DWORD,
};

pub const PPIXELFORMATDESCRIPTOR = ?*PIXELFORMATDESCRIPTOR;
pub const LPPIXELFORMATDESCRIPTOR = ?*PIXELFORMATDESCRIPTOR;
pub const OLDFONTENUMPROCA = ?extern fn(?*const LOGFONTA, ?*const TEXTMETRICA, DWORD, LPARAM) c_int;
pub const OLDFONTENUMPROCW = ?extern fn(?*const LOGFONTW, ?*const TEXTMETRICW, DWORD, LPARAM) c_int;
pub const FONTENUMPROCA = OLDFONTENUMPROCA;
pub const FONTENUMPROCW = OLDFONTENUMPROCW;
pub const GOBJENUMPROC = ?extern fn(LPVOID, LPARAM) c_int;
pub const LINEDDAPROC = ?extern fn(c_int, c_int, LPARAM) void;
pub const LPFNDEVMODE = ?extern fn(HWND, HMODULE, LPDEVMODE, LPSTR, LPSTR, LPDEVMODE, LPSTR, UINT) UINT;
pub const LPFNDEVCAPS = ?extern fn(LPSTR, LPSTR, UINT, LPSTR, LPDEVMODE) DWORD;
pub const WCRANGE = extern struct {
    wcLow: WCHAR,
    cGlyphs: USHORT,
};

pub const PWCRANGE = ?*WCRANGE;
pub const LPWCRANGE = ?*WCRANGE;
pub const GLYPHSET = extern struct {
    cbThis: DWORD,
    flAccel: DWORD,
    cGlyphsSupported: DWORD,
    cRanges: DWORD,
    ranges: [1]WCRANGE,
};

pub const PGLYPHSET = ?*GLYPHSET;
pub const LPGLYPHSET = ?*GLYPHSET;
pub const DESIGNVECTOR = extern struct {
    dvReserved: DWORD,
    dvNumAxes: DWORD,
    dvValues: [16]LONG,
};

pub const PDESIGNVECTOR = ?*DESIGNVECTOR;
pub const LPDESIGNVECTOR = ?*DESIGNVECTOR;
pub const AXISINFOA = extern struct {
    axMinValue: LONG,
    axMaxValue: LONG,
    axAxisName: [16]BYTE,
};

pub const PAXISINFOA = ?*AXISINFOA;
pub const LPAXISINFOA = ?*AXISINFOA;
pub const AXISINFOW = extern struct {
    axMinValue: LONG,
    axMaxValue: LONG,
    axAxisName: [16]WCHAR,
};

pub const PAXISINFOW = ?*AXISINFOW;
pub const LPAXISINFOW = ?*AXISINFOW;
pub const AXESLISTA = extern struct {
    axlReserved: DWORD,
    axlNumAxes: DWORD,
    axlAxisInfo: [16]AXISINFOA,
};

pub const PAXESLISTA = ?*AXESLISTA;
pub const LPAXESLISTA = ?*AXESLISTA;
pub const AXESLISTW = extern struct {
    axlReserved: DWORD,
    axlNumAxes: DWORD,
    axlAxisInfo: [16]AXISINFOW,
};

pub const PAXESLISTW = ?*AXESLISTW;
pub const LPAXESLISTW = ?*AXESLISTW;
pub const ENUMLOGFONTEXDVA = extern struct {
    elfEnumLogfontEx: ENUMLOGFONTEXA,
    elfDesignVector: DESIGNVECTOR,
};

pub const PENUMLOGFONTEXDVA = ?*ENUMLOGFONTEXDVA;
pub const LPENUMLOGFONTEXDVA = ?*ENUMLOGFONTEXDVA;
pub const ENUMLOGFONTEXDVW = extern struct {
    elfEnumLogfontEx: ENUMLOGFONTEXW,
    elfDesignVector: DESIGNVECTOR,
};

pub const PENUMLOGFONTEXDVW = ?*ENUMLOGFONTEXDVW;
pub const LPENUMLOGFONTEXDVW = ?*ENUMLOGFONTEXDVW;
pub const ENUMTEXTMETRICA = extern struct {
    etmNewTextMetricEx: NEWTEXTMETRICEXA,
    etmAxesList: AXESLISTA,
};

pub const PENUMTEXTMETRICA = ?*ENUMTEXTMETRICA;
pub const LPENUMTEXTMETRICA = ?*ENUMTEXTMETRICA;
pub const ENUMTEXTMETRICW = extern struct {
    etmNewTextMetricEx: NEWTEXTMETRICEXW,
    etmAxesList: AXESLISTW,
};

pub const PENUMTEXTMETRICW = ?*ENUMTEXTMETRICW;
pub const LPENUMTEXTMETRICW = ?*ENUMTEXTMETRICW;
pub const COLOR16 = USHORT;
pub const TRIVERTEX = extern struct {
    x: LONG,
    y: LONG,
    Red: COLOR16,
    Green: COLOR16,
    Blue: COLOR16,
    Alpha: COLOR16,
};

pub const PTRIVERTEX = ?*TRIVERTEX;
pub const LPTRIVERTEX = ?*TRIVERTEX;
pub const GRADIENT_TRIANGLE = extern struct {
    Vertex1: ULONG,
    Vertex2: ULONG,
    Vertex3: ULONG,
};

pub const PGRADIENT_TRIANGLE = ?*GRADIENT_TRIANGLE;
pub const LPGRADIENT_TRIANGLE = ?*GRADIENT_TRIANGLE;
pub const GRADIENT_RECT = extern struct {
    UpperLeft: ULONG,
    LowerRight: ULONG,
};

pub const PGRADIENT_RECT = ?*GRADIENT_RECT;
pub const LPGRADIENT_RECT = ?*GRADIENT_RECT;
pub const BLENDFUNCTION = extern struct {
    BlendOp: BYTE,
    BlendFlags: BYTE,
    SourceConstantAlpha: BYTE,
    AlphaFormat: BYTE,
};

pub const PBLENDFUNCTION = ?*BLENDFUNCTION;
pub const MFENUMPROC = ?extern fn(HDC, ?*HANDLETABLE, ?*METARECORD, c_int, LPARAM) c_int;
pub const ENHMFENUMPROC = ?extern fn(HDC, ?*HANDLETABLE, ?*const ENHMETARECORD, c_int, LPARAM) c_int;
pub const DIBSECTION = extern struct {
    dsBm: BITMAP,
    dsBmih: BITMAPINFOHEADER,
    dsBitfields: [3]DWORD,
    dshSection: HANDLE,
    dsOffset: DWORD,
};

pub const LPDIBSECTION = ?*DIBSECTION;
pub const PDIBSECTION = ?*DIBSECTION;
pub const COLORADJUSTMENT = extern struct {
    caSize: WORD,
    caFlags: WORD,
    caIlluminantIndex: WORD,
    caRedGamma: WORD,
    caGreenGamma: WORD,
    caBlueGamma: WORD,
    caReferenceBlack: WORD,
    caReferenceWhite: WORD,
    caContrast: SHORT,
    caBrightness: SHORT,
    caColorfulness: SHORT,
    caRedGreenTint: SHORT,
};

pub const PCOLORADJUSTMENT = ?*COLORADJUSTMENT;
pub const LPCOLORADJUSTMENT = ?*COLORADJUSTMENT;
pub const ABORTPROC = ?extern fn(HDC, c_int) BOOL;
pub const DOCINFOA = extern struct {
    cbSize: c_int,
    lpszDocName: LPCSTR,
    lpszOutput: LPCSTR,
    lpszDatatype: LPCSTR,
    fwType: DWORD,
};

pub const LPDOCINFOA = ?*DOCINFOA;
pub const DOCINFOW = extern struct {
    cbSize: c_int,
    lpszDocName: LPCWSTR,
    lpszOutput: LPCWSTR,
    lpszDatatype: LPCWSTR,
    fwType: DWORD,
};

pub const LPDOCINFOW = ?*DOCINFOW;
pub const KERNINGPAIR = extern struct {
    wFirst: WORD,
    wSecond: WORD,
    iKernAmount: c_int,
};

pub const LPKERNINGPAIR = ?*KERNINGPAIR;
pub const ICMENUMPROCA = ?extern fn(LPSTR, LPARAM) c_int;
pub const ICMENUMPROCW = ?extern fn(LPWSTR, LPARAM) c_int;
pub const EMR = extern struct {
    iType: DWORD,
    nSize: DWORD,
};

pub const PEMR = ?*EMR;
pub const EMRTEXT = extern struct {
    ptlReference: POINTL,
    nChars: DWORD,
    offString: DWORD,
    fOptions: DWORD,
    rcl: RECTL,
    offDx: DWORD,
};

pub const PEMRTEXT = ?*EMRTEXT;
pub const ABORTPATH = extern struct {
    emr: EMR,
};
pub const EMRABORTPATH = ABORTPATH;
pub const PEMRABORTPATH = ?*ABORTPATH;
pub const EMRBEGINPATH = ABORTPATH;
pub const PEMRBEGINPATH = ?*ABORTPATH;
pub const EMRENDPATH = ABORTPATH;
pub const PEMRENDPATH = ?*ABORTPATH;
pub const EMRCLOSEFIGURE = ABORTPATH;
pub const PEMRCLOSEFIGURE = ?*ABORTPATH;
pub const EMRFLATTENPATH = ABORTPATH;
pub const PEMRFLATTENPATH = ?*ABORTPATH;
pub const EMRWIDENPATH = ABORTPATH;
pub const PEMRWIDENPATH = ?*ABORTPATH;
pub const EMRSETMETARGN = ABORTPATH;
pub const PEMRSETMETARGN = ?*ABORTPATH;
pub const EMRSAVEDC = ABORTPATH;
pub const PEMRSAVEDC = ?*ABORTPATH;
pub const EMRREALIZEPALETTE = ABORTPATH;
pub const PEMRREALIZEPALETTE = ?*ABORTPATH;
pub const EMRSELECTCLIPPATH = extern struct {
    emr: EMR,
    iMode: DWORD,
};

pub const PEMRSELECTCLIPPATH = ?*EMRSELECTCLIPPATH;
pub const EMRSETBKMODE = EMRSELECTCLIPPATH;
pub const PEMRSETBKMODE = ?*EMRSELECTCLIPPATH;
pub const EMRSETMAPMODE = EMRSELECTCLIPPATH;
pub const PEMRSETMAPMODE = ?*EMRSELECTCLIPPATH;
pub const EMRSETLAYOUT = EMRSELECTCLIPPATH;
pub const PEMRSETLAYOUT = ?*EMRSELECTCLIPPATH;
pub const EMRSETPOLYFILLMODE = EMRSELECTCLIPPATH;
pub const PEMRSETPOLYFILLMODE = ?*EMRSELECTCLIPPATH;
pub const EMRSETROP2 = EMRSELECTCLIPPATH;
pub const PEMRSETROP2 = ?*EMRSELECTCLIPPATH;
pub const EMRSETSTRETCHBLTMODE = EMRSELECTCLIPPATH;
pub const PEMRSETSTRETCHBLTMODE = ?*EMRSELECTCLIPPATH;
pub const EMRSETICMMODE = EMRSELECTCLIPPATH;
pub const PEMRSETICMMODE = ?*EMRSELECTCLIPPATH;
pub const EMRSETTEXTALIGN = EMRSELECTCLIPPATH;
pub const PEMRSETTEXTALIGN = ?*EMRSELECTCLIPPATH;
pub const EMRSETMITERLIMIT = extern struct {
    emr: EMR,
    eMiterLimit: FLOAT,
};

pub const PEMRSETMITERLIMIT = ?*EMRSETMITERLIMIT;
pub const EMRRESTOREDC = extern struct {
    emr: EMR,
    iRelative: LONG,
};

pub const PEMRRESTOREDC = ?*EMRRESTOREDC;
pub const EMRSETARCDIRECTION = extern struct {
    emr: EMR,
    iArcDirection: DWORD,
};

pub const PEMRSETARCDIRECTION = ?*EMRSETARCDIRECTION;
pub const EMRSETMAPPERFLAGS = extern struct {
    emr: EMR,
    dwFlags: DWORD,
};

pub const PEMRSETMAPPERFLAGS = ?*EMRSETMAPPERFLAGS;
pub const EMRSETTEXTCOLOR = extern struct {
    emr: EMR,
    crColor: COLORREF,
};
pub const EMRSETBKCOLOR = EMRSETTEXTCOLOR;
pub const PEMRSETBKCOLOR = ?*EMRSETTEXTCOLOR;

pub const PEMRSETTEXTCOLOR = ?*EMRSETTEXTCOLOR;
pub const EMRSELECTOBJECT = extern struct {
    emr: EMR,
    ihObject: DWORD,
};

pub const PEMRSELECTOBJECT = ?*EMRSELECTOBJECT;
pub const EMRDELETEOBJECT = EMRSELECTOBJECT;
pub const PEMRDELETEOBJECT = ?*EMRSELECTOBJECT;
pub const EMRSELECTPALETTE = extern struct {
    emr: EMR,
    ihPal: DWORD,
};

pub const PEMRSELECTPALETTE = ?*EMRSELECTPALETTE;
pub const EMRRESIZEPALETTE = extern struct {
    emr: EMR,
    ihPal: DWORD,
    cEntries: DWORD,
};

pub const PEMRRESIZEPALETTE = ?*EMRRESIZEPALETTE;
pub const EMRSETPALETTEENTRIES = extern struct {
    emr: EMR,
    ihPal: DWORD,
    iStart: DWORD,
    cEntries: DWORD,
    aPalEntries: [1]PALETTEENTRY,
};

pub const PEMRSETPALETTEENTRIES = ?*EMRSETPALETTEENTRIES;
pub const EMRSETCOLORADJUSTMENT = extern struct {
    emr: EMR,
    ColorAdjustment: COLORADJUSTMENT,
};

pub const PEMRSETCOLORADJUSTMENT = ?*EMRSETCOLORADJUSTMENT;
pub const EMRGDICOMMENT = extern struct {
    emr: EMR,
    cbData: DWORD,
    Data: [1]BYTE,
};

pub const PEMRGDICOMMENT = ?*EMRGDICOMMENT;
pub const EMREOF = extern struct {
    emr: EMR,
    nPalEntries: DWORD,
    offPalEntries: DWORD,
    nSizeLast: DWORD,
};

pub const PEMREOF = ?*EMREOF;
pub const EMRLINETO = extern struct {
    emr: EMR,
    ptl: POINTL,
};

pub const PEMRLINETO = ?*EMRLINETO;
pub const EMRMOVETOEX = EMRLINETO;
pub const PEMRMOVETOEX = ?*EMRLINETO;
pub const EMROFFSETCLIPRGN = extern struct {
    emr: EMR,
    ptlOffset: POINTL,
};

pub const PEMROFFSETCLIPRGN = ?*EMROFFSETCLIPRGN;
pub const EMRFILLPATH = extern struct {
    emr: EMR,
    rclBounds: RECTL,
};

pub const PEMRFILLPATH = ?*EMRFILLPATH;
pub const EMRSTROKEANDFILLPATH = EMRFILLPATH;
pub const PEMRSTROKEANDFILLPATH = ?*EMRFILLPATH;
pub const EMRSTROKEPATH = EMRFILLPATH;
pub const PEMRSTROKEPATH = ?*EMRFILLPATH;
pub const EMREXCLUDECLIPRECT = extern struct {
    emr: EMR,
    rclClip: RECTL,
};

pub const PEMREXCLUDECLIPRECT = ?*EMREXCLUDECLIPRECT;
pub const EMRINTERSECTCLIPRECT = EMREXCLUDECLIPRECT;
pub const PEMRINTERSECTCLIPRECT = ?*EMREXCLUDECLIPRECT;
pub const EMRSETVIEWPORTORGEX = extern struct {
    emr: EMR,
    ptlOrigin: POINTL,
};

pub const PEMRSETVIEWPORTORGEX = ?*EMRSETVIEWPORTORGEX;
pub const EMRSETWINDOWORGEX = EMRSETVIEWPORTORGEX;
pub const PEMRSETWINDOWORGEX = ?*EMRSETVIEWPORTORGEX;
pub const EMRSETBRUSHORGEX = EMRSETVIEWPORTORGEX;
pub const PEMRSETBRUSHORGEX = ?*EMRSETVIEWPORTORGEX;
pub const EMRSETVIEWPORTEXTEX = extern struct {
    emr: EMR,
    szlExtent: SIZEL,
};

pub const PEMRSETVIEWPORTEXTEX = ?*EMRSETVIEWPORTEXTEX;
pub const EMRSETWINDOWEXTEX = EMRSETVIEWPORTEXTEX;
pub const PEMRSETWINDOWEXTEX = ?*EMRSETVIEWPORTEXTEX;
pub const EMRSCALEVIEWPORTEXTEX = extern struct {
    emr: EMR,
    xNum: LONG,
    xDenom: LONG,
    yNum: LONG,
    yDenom: LONG,
};

pub const PEMRSCALEVIEWPORTEXTEX = ?*EMRSCALEVIEWPORTEXTEX;
pub const EMRSCALEWINDOWEXTEX = EMRSCALEVIEWPORTEXTEX;
pub const PEMRSCALEWINDOWEXTEX = ?*EMRSCALEVIEWPORTEXTEX;
pub const EMRSETWORLDTRANSFORM = extern struct {
    emr: EMR,
    xform: XFORM,
};

pub const PEMRSETWORLDTRANSFORM = ?*EMRSETWORLDTRANSFORM;
pub const EMRMODIFYWORLDTRANSFORM = extern struct {
    emr: EMR,
    xform: XFORM,
    iMode: DWORD,
};

pub const PEMRMODIFYWORLDTRANSFORM = ?*EMRMODIFYWORLDTRANSFORM;
pub const EMRSETPIXELV = extern struct {
    emr: EMR,
    ptlPixel: POINTL,
    crColor: COLORREF,
};

pub const PEMRSETPIXELV = ?*EMRSETPIXELV;
pub const EMREXTFLOODFILL = extern struct {
    emr: EMR,
    ptlStart: POINTL,
    crColor: COLORREF,
    iMode: DWORD,
};

pub const PEMREXTFLOODFILL = ?*EMREXTFLOODFILL;
pub const EMRELLIPSE = extern struct {
    emr: EMR,
    rclBox: RECTL,
};

pub const PEMRELLIPSE = ?*EMRELLIPSE;
pub const EMRRECTANGLE = EMRELLIPSE;
pub const PEMRRECTANGLE = ?*EMRELLIPSE;
pub const EMRROUNDRECT = extern struct {
    emr: EMR,
    rclBox: RECTL,
    szlCorner: SIZEL,
};

pub const PEMRROUNDRECT = ?*EMRROUNDRECT;
pub const EMRARC = extern struct {
    emr: EMR,
    rclBox: RECTL,
    ptlStart: POINTL,
    ptlEnd: POINTL,
};

pub const PEMRARC = ?*EMRARC;
pub const EMRARCTO = EMRARC;
pub const PEMRARCTO = ?*EMRARC;
pub const EMRCHORD = EMRARC;
pub const PEMRCHORD = ?*EMRARC;
pub const EMRPIE = EMRARC;
pub const PEMRPIE = ?*EMRARC;
pub const EMRANGLEARC = extern struct {
    emr: EMR,
    ptlCenter: POINTL,
    nRadius: DWORD,
    eStartAngle: FLOAT,
    eSweepAngle: FLOAT,
};

pub const PEMRANGLEARC = ?*EMRANGLEARC;
pub const EMRPOLYLINE = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cptl: DWORD,
    aptl: [1]POINTL,
};

pub const PEMRPOLYLINE = ?*EMRPOLYLINE;
pub const EMRPOLYBEZIER = EMRPOLYLINE;
pub const PEMRPOLYBEZIER = ?*EMRPOLYLINE;
pub const EMRPOLYGON = EMRPOLYLINE;
pub const PEMRPOLYGON = ?*EMRPOLYLINE;
pub const EMRPOLYBEZIERTO = EMRPOLYLINE;
pub const PEMRPOLYBEZIERTO = ?*EMRPOLYLINE;
pub const EMRPOLYLINETO = EMRPOLYLINE;
pub const PEMRPOLYLINETO = ?*EMRPOLYLINE;
pub const EMRPOLYLINE16 = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cpts: DWORD,
    apts: [1]POINTS,
};

pub const PEMRPOLYLINE16 = ?*EMRPOLYLINE16;
pub const EMRPOLYBEZIER16 = EMRPOLYLINE16;
pub const PEMRPOLYBEZIER16 = ?*EMRPOLYLINE16;
pub const EMRPOLYGON16 = EMRPOLYLINE16;
pub const PEMRPOLYGON16 = ?*EMRPOLYLINE16;
pub const EMRPOLYBEZIERTO16 = EMRPOLYLINE16;
pub const PEMRPOLYBEZIERTO16 = ?*EMRPOLYLINE16;
pub const EMRPOLYLINETO16 = EMRPOLYLINE16;
pub const PEMRPOLYLINETO16 = ?*EMRPOLYLINE16;
pub const EMRPOLYDRAW = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cptl: DWORD,
    aptl: [1]POINTL,
    abTypes: [1]BYTE,
};

pub const PEMRPOLYDRAW = ?*EMRPOLYDRAW;
pub const EMRPOLYDRAW16 = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cpts: DWORD,
    apts: [1]POINTS,
    abTypes: [1]BYTE,
};

pub const PEMRPOLYDRAW16 = ?*EMRPOLYDRAW16;
pub const EMRPOLYPOLYLINE = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    nPolys: DWORD,
    cptl: DWORD,
    aPolyCounts: [1]DWORD,
    aptl: [1]POINTL,
};

pub const PEMRPOLYPOLYLINE = ?*EMRPOLYPOLYLINE;
pub const EMRPOLYPOLYGON = EMRPOLYPOLYLINE;
pub const PEMRPOLYPOLYGON = ?*EMRPOLYPOLYLINE;
pub const EMRPOLYPOLYLINE16 = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    nPolys: DWORD,
    cpts: DWORD,
    aPolyCounts: [1]DWORD,
    apts: [1]POINTS,
};

pub const PEMRPOLYPOLYLINE16 = ?*EMRPOLYPOLYLINE16;
pub const EMRPOLYPOLYGON16 = EMRPOLYPOLYLINE16;
pub const PEMRPOLYPOLYGON16 = ?*EMRPOLYPOLYLINE16;
pub const EMRINVERTRGN = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cbRgnData: DWORD,
    RgnData: [1]BYTE,
};

pub const PEMRINVERTRGN = ?*EMRINVERTRGN;
pub const EMRPAINTRGN = EMRINVERTRGN;
pub const PEMRPAINTRGN = ?*EMRINVERTRGN;
pub const EMRFILLRGN = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cbRgnData: DWORD,
    ihBrush: DWORD,
    RgnData: [1]BYTE,
};

pub const PEMRFILLRGN = ?*EMRFILLRGN;
pub const EMRFRAMERGN = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cbRgnData: DWORD,
    ihBrush: DWORD,
    szlStroke: SIZEL,
    RgnData: [1]BYTE,
};

pub const PEMRFRAMERGN = ?*EMRFRAMERGN;
pub const EMREXTSELECTCLIPRGN = extern struct {
    emr: EMR,
    cbRgnData: DWORD,
    iMode: DWORD,
    RgnData: [1]BYTE,
};

pub const PEMREXTSELECTCLIPRGN = ?*EMREXTSELECTCLIPRGN;
pub const EMREXTTEXTOUTA = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    iGraphicsMode: DWORD,
    exScale: FLOAT,
    eyScale: FLOAT,
    emrtext: EMRTEXT,
};

pub const PEMREXTTEXTOUTA = ?*EMREXTTEXTOUTA;
pub const EMREXTTEXTOUTW = EMREXTTEXTOUTA;
pub const PEMREXTTEXTOUTW = ?*EMREXTTEXTOUTA;
pub const EMRPOLYTEXTOUTA = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    iGraphicsMode: DWORD,
    exScale: FLOAT,
    eyScale: FLOAT,
    cStrings: LONG,
    aemrtext: [1]EMRTEXT,
};

pub const PEMRPOLYTEXTOUTA = ?*EMRPOLYTEXTOUTA;
pub const EMRPOLYTEXTOUTW = EMRPOLYTEXTOUTA;
pub const PEMRPOLYTEXTOUTW = ?*EMRPOLYTEXTOUTA;
pub const EMRBITBLT = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    cxDest: LONG,
    cyDest: LONG,
    dwRop: DWORD,
    xSrc: LONG,
    ySrc: LONG,
    xformSrc: XFORM,
    crBkColorSrc: COLORREF,
    iUsageSrc: DWORD,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
};

pub const PEMRBITBLT = ?*EMRBITBLT;
pub const EMRSTRETCHBLT = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    cxDest: LONG,
    cyDest: LONG,
    dwRop: DWORD,
    xSrc: LONG,
    ySrc: LONG,
    xformSrc: XFORM,
    crBkColorSrc: COLORREF,
    iUsageSrc: DWORD,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    cxSrc: LONG,
    cySrc: LONG,
};

pub const PEMRSTRETCHBLT = ?*EMRSTRETCHBLT;
pub const EMRMASKBLT = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    cxDest: LONG,
    cyDest: LONG,
    dwRop: DWORD,
    xSrc: LONG,
    ySrc: LONG,
    xformSrc: XFORM,
    crBkColorSrc: COLORREF,
    iUsageSrc: DWORD,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    xMask: LONG,
    yMask: LONG,
    iUsageMask: DWORD,
    offBmiMask: DWORD,
    cbBmiMask: DWORD,
    offBitsMask: DWORD,
    cbBitsMask: DWORD,
};

pub const PEMRMASKBLT = ?*EMRMASKBLT;
pub const EMRPLGBLT = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    aptlDest: [3]POINTL,
    xSrc: LONG,
    ySrc: LONG,
    cxSrc: LONG,
    cySrc: LONG,
    xformSrc: XFORM,
    crBkColorSrc: COLORREF,
    iUsageSrc: DWORD,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    xMask: LONG,
    yMask: LONG,
    iUsageMask: DWORD,
    offBmiMask: DWORD,
    cbBmiMask: DWORD,
    offBitsMask: DWORD,
    cbBitsMask: DWORD,
};

pub const PEMRPLGBLT = ?*EMRPLGBLT;
pub const EMRSETDIBITSTODEVICE = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    xSrc: LONG,
    ySrc: LONG,
    cxSrc: LONG,
    cySrc: LONG,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    iUsageSrc: DWORD,
    iStartScan: DWORD,
    cScans: DWORD,
};

pub const PEMRSETDIBITSTODEVICE = ?*EMRSETDIBITSTODEVICE;
pub const EMRSTRETCHDIBITS = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    xSrc: LONG,
    ySrc: LONG,
    cxSrc: LONG,
    cySrc: LONG,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    iUsageSrc: DWORD,
    dwRop: DWORD,
    cxDest: LONG,
    cyDest: LONG,
};

pub const PEMRSTRETCHDIBITS = ?*EMRSTRETCHDIBITS;
pub const EMREXTCREATEFONTINDIRECTW = extern struct {
    emr: EMR,
    ihFont: DWORD,
    elfw: EXTLOGFONTW,
};

pub const PEMREXTCREATEFONTINDIRECTW = ?*EMREXTCREATEFONTINDIRECTW;
pub const EMRCREATEPALETTE = extern struct {
    emr: EMR,
    ihPal: DWORD,
    lgpl: LOGPALETTE,
};

pub const PEMRCREATEPALETTE = ?*EMRCREATEPALETTE;
pub const EMRCREATEPEN = extern struct {
    emr: EMR,
    ihPen: DWORD,
    lopn: LOGPEN,
};

pub const PEMRCREATEPEN = ?*EMRCREATEPEN;
pub const EMREXTCREATEPEN = extern struct {
    emr: EMR,
    ihPen: DWORD,
    offBmi: DWORD,
    cbBmi: DWORD,
    offBits: DWORD,
    cbBits: DWORD,
    elp: EXTLOGPEN32,
};

pub const PEMREXTCREATEPEN = ?*EMREXTCREATEPEN;
pub const EMRCREATEBRUSHINDIRECT = extern struct {
    emr: EMR,
    ihBrush: DWORD,
    lb: LOGBRUSH32,
};

pub const PEMRCREATEBRUSHINDIRECT = ?*EMRCREATEBRUSHINDIRECT;
pub const EMRCREATEMONOBRUSH = extern struct {
    emr: EMR,
    ihBrush: DWORD,
    iUsage: DWORD,
    offBmi: DWORD,
    cbBmi: DWORD,
    offBits: DWORD,
    cbBits: DWORD,
};

pub const PEMRCREATEMONOBRUSH = ?*EMRCREATEMONOBRUSH;
pub const EMRCREATEDIBPATTERNBRUSHPT = extern struct {
    emr: EMR,
    ihBrush: DWORD,
    iUsage: DWORD,
    offBmi: DWORD,
    cbBmi: DWORD,
    offBits: DWORD,
    cbBits: DWORD,
};

pub const PEMRCREATEDIBPATTERNBRUSHPT = ?*EMRCREATEDIBPATTERNBRUSHPT;
pub const EMRFORMAT = extern struct {
    dSignature: DWORD,
    nVersion: DWORD,
    cbData: DWORD,
    offData: DWORD,
};

pub const PEMRFORMAT = ?*EMRFORMAT;
pub const EMRGLSRECORD = extern struct {
    emr: EMR,
    cbData: DWORD,
    Data: [1]BYTE,
};

pub const PEMRGLSRECORD = ?*EMRGLSRECORD;
pub const EMRGLSBOUNDEDRECORD = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    cbData: DWORD,
    Data: [1]BYTE,
};

pub const PEMRGLSBOUNDEDRECORD = ?*EMRGLSBOUNDEDRECORD;
pub const EMRPIXELFORMAT = extern struct {
    emr: EMR,
    pfd: PIXELFORMATDESCRIPTOR,
};

pub const PEMRPIXELFORMAT = ?*EMRPIXELFORMAT;
pub const EMRCREATECOLORSPACE = extern struct {
    emr: EMR,
    ihCS: DWORD,
    lcs: LOGCOLORSPACEA,
};

pub const PEMRCREATECOLORSPACE = ?*EMRCREATECOLORSPACE;
pub const EMRSETCOLORSPACE = extern struct {
    emr: EMR,
    ihCS: DWORD,
};

pub const PEMRSETCOLORSPACE = ?*EMRSETCOLORSPACE;
pub const EMRSELECTCOLORSPACE = EMRSETCOLORSPACE;
pub const PEMRSELECTCOLORSPACE = ?*EMRSETCOLORSPACE;
pub const EMRDELETECOLORSPACE = EMRSETCOLORSPACE;
pub const PEMRDELETECOLORSPACE = ?*EMRSETCOLORSPACE;
pub const EMREXTESCAPE = extern struct {
    emr: EMR,
    iEscape: INT,
    cbEscData: INT,
    EscData: [1]BYTE,
};

pub const PEMREXTESCAPE = ?*EMREXTESCAPE;
pub const EMRDRAWESCAPE = EMREXTESCAPE;
pub const PEMRDRAWESCAPE = ?*EMREXTESCAPE;
pub const EMRNAMEDESCAPE = extern struct {
    emr: EMR,
    iEscape: INT,
    cbDriver: INT,
    cbEscData: INT,
    EscData: [1]BYTE,
};

pub const PEMRNAMEDESCAPE = ?*EMRNAMEDESCAPE;
pub const EMRSETICMPROFILE = extern struct {
    emr: EMR,
    dwFlags: DWORD,
    cbName: DWORD,
    cbData: DWORD,
    Data: [1]BYTE,
};

pub const PEMRSETICMPROFILE = ?*EMRSETICMPROFILE;
pub const EMRSETICMPROFILEA = EMRSETICMPROFILE;
pub const PEMRSETICMPROFILEA = ?*EMRSETICMPROFILE;
pub const EMRSETICMPROFILEW = EMRSETICMPROFILE;
pub const PEMRSETICMPROFILEW = ?*EMRSETICMPROFILE;
pub const EMRCREATECOLORSPACEW = extern struct {
    emr: EMR,
    ihCS: DWORD,
    lcs: LOGCOLORSPACEW,
    dwFlags: DWORD,
    cbData: DWORD,
    Data: [1]BYTE,
};

pub const PEMRCREATECOLORSPACEW = ?*EMRCREATECOLORSPACEW;
pub const COLORMATCHTOTARGET = extern struct {
    emr: EMR,
    dwAction: DWORD,
    dwFlags: DWORD,
    cbName: DWORD,
    cbData: DWORD,
    Data: [1]BYTE,
};
pub const EMRCOLORMATCHTOTARGET = COLORMATCHTOTARGET;
pub const PEMRCOLORMATCHTOTARGET = ?*COLORMATCHTOTARGET;
pub const COLORCORRECTPALETTE = extern struct {
    emr: EMR,
    ihPalette: DWORD,
    nFirstEntry: DWORD,
    nPalEntries: DWORD,
    nReserved: DWORD,
};
pub const EMRCOLORCORRECTPALETTE = COLORCORRECTPALETTE;
pub const PEMRCOLORCORRECTPALETTE = ?*COLORCORRECTPALETTE;
pub const EMRALPHABLEND = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    cxDest: LONG,
    cyDest: LONG,
    dwRop: DWORD,
    xSrc: LONG,
    ySrc: LONG,
    xformSrc: XFORM,
    crBkColorSrc: COLORREF,
    iUsageSrc: DWORD,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    cxSrc: LONG,
    cySrc: LONG,
};

pub const PEMRALPHABLEND = ?*EMRALPHABLEND;
pub const EMRGRADIENTFILL = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    nVer: DWORD,
    nTri: DWORD,
    ulMode: ULONG,
    Ver: [1]TRIVERTEX,
};

pub const PEMRGRADIENTFILL = ?*EMRGRADIENTFILL;
pub const EMRTRANSPARENTBLT = extern struct {
    emr: EMR,
    rclBounds: RECTL,
    xDest: LONG,
    yDest: LONG,
    cxDest: LONG,
    cyDest: LONG,
    dwRop: DWORD,
    xSrc: LONG,
    ySrc: LONG,
    xformSrc: XFORM,
    crBkColorSrc: COLORREF,
    iUsageSrc: DWORD,
    offBmiSrc: DWORD,
    cbBmiSrc: DWORD,
    offBitsSrc: DWORD,
    cbBitsSrc: DWORD,
    cxSrc: LONG,
    cySrc: LONG,
};
pub const PROC = ?*c_void;

pub const PEMRTRANSPARENTBLT = ?*EMRTRANSPARENTBLT;
pub const POINTFLOAT = extern struct {
    x: FLOAT,
    y: FLOAT,
};

pub const PPOINTFLOAT = ?*POINTFLOAT;
pub const GLYPHMETRICSFLOAT = extern struct {
    gmfBlackBoxX: FLOAT,
    gmfBlackBoxY: FLOAT,
    gmfptGlyphOrigin: POINTFLOAT,
    gmfCellIncX: FLOAT,
    gmfCellIncY: FLOAT,
};

pub const PGLYPHMETRICSFLOAT = ?*GLYPHMETRICSFLOAT;
pub const LPGLYPHMETRICSFLOAT = ?*GLYPHMETRICSFLOAT;
pub const LAYERPLANEDESCRIPTOR = extern struct {
    nSize: WORD,
    nVersion: WORD,
    dwFlags: DWORD,
    iPixelType: BYTE,
    cColorBits: BYTE,
    cRedBits: BYTE,
    cRedShift: BYTE,
    cGreenBits: BYTE,
    cGreenShift: BYTE,
    cBlueBits: BYTE,
    cBlueShift: BYTE,
    cAlphaBits: BYTE,
    cAlphaShift: BYTE,
    cAccumBits: BYTE,
    cAccumRedBits: BYTE,
    cAccumGreenBits: BYTE,
    cAccumBlueBits: BYTE,
    cAccumAlphaBits: BYTE,
    cDepthBits: BYTE,
    cStencilBits: BYTE,
    cAuxBuffers: BYTE,
    iLayerPlane: BYTE,
    bReserved: BYTE,
    crTransparent: COLORREF,
};

pub const PLAYERPLANEDESCRIPTOR = ?*LAYERPLANEDESCRIPTOR;
pub const LPLAYERPLANEDESCRIPTOR = ?*LAYERPLANEDESCRIPTOR;
pub const WGLSWAP = extern struct {
    hdc: HDC,
    uiFlags: UINT,
};

pub const PWGLSWAP = ?*WGLSWAP;
pub const LPWGLSWAP = ?*WGLSWAP;
pub const HDWP = HANDLE;
pub const MENUTEMPLATEA = c_void;
pub const MENUTEMPLATEW = c_void;
pub const LPMENUTEMPLATEA = PVOID;
pub const LPMENUTEMPLATEW = PVOID;
pub const WNDPROC = ?stdcallcc fn(HWND, UINT, WPARAM, LPARAM) LRESULT;
pub const DLGPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) INT_PTR;
pub const TIMERPROC = ?extern fn(HWND, UINT, UINT_PTR, DWORD) void;
pub const GRAYSTRINGPROC = ?extern fn(HDC, LPARAM, c_int) BOOL;
pub const WNDENUMPROC = ?extern fn(HWND, LPARAM) BOOL;
pub const HOOKPROC = ?extern fn(c_int, WPARAM, LPARAM) LRESULT;
pub const SENDASYNCPROC = ?extern fn(HWND, UINT, ULONG_PTR, LRESULT) void;
pub const PROPENUMPROCA = ?extern fn(HWND, LPCSTR, HANDLE) BOOL;
pub const PROPENUMPROCW = ?extern fn(HWND, LPCWSTR, HANDLE) BOOL;
pub const PROPENUMPROCEXA = ?extern fn(HWND, LPSTR, HANDLE, ULONG_PTR) BOOL;
pub const PROPENUMPROCEXW = ?extern fn(HWND, LPWSTR, HANDLE, ULONG_PTR) BOOL;
pub const EDITWORDBREAKPROCA = ?extern fn(LPSTR, c_int, c_int, c_int) c_int;
pub const EDITWORDBREAKPROCW = ?extern fn(LPWSTR, c_int, c_int, c_int) c_int;
pub const DRAWSTATEPROC = ?extern fn(HDC, LPARAM, WPARAM, c_int, c_int) BOOL;
pub const NAMEENUMPROCA = ?extern fn(LPSTR, LPARAM) BOOL;
pub const NAMEENUMPROCW = ?extern fn(LPWSTR, LPARAM) BOOL;
pub const WINSTAENUMPROCA = NAMEENUMPROCA;
pub const DESKTOPENUMPROCA = NAMEENUMPROCA;
pub const WINSTAENUMPROCW = NAMEENUMPROCW;
pub const DESKTOPENUMPROCW = NAMEENUMPROCW;
pub const CREATESTRUCTA = extern struct {
    lpCreateParams: LPVOID,
    hInstance: HINSTANCE,
    hMenu: HMENU,
    hwndParent: HWND,
    cy: c_int,
    cx: c_int,
    y: c_int,
    x: c_int,
    style: LONG,
    lpszName: LPCSTR,
    lpszClass: LPCSTR,
    dwExStyle: DWORD,
};
pub const CBT_CREATEWNDA = extern struct {
    lpcs: ?*CREATESTRUCTA,
    hwndInsertAfter: HWND,
};

pub const LPCBT_CREATEWNDA = ?*CBT_CREATEWNDA;
pub const CREATESTRUCTW = extern struct {
    lpCreateParams: LPVOID,
    hInstance: HINSTANCE,
    hMenu: HMENU,
    hwndParent: HWND,
    cy: c_int,
    cx: c_int,
    y: c_int,
    x: c_int,
    style: LONG,
    lpszName: LPCWSTR,
    lpszClass: LPCWSTR,
    dwExStyle: DWORD,
};
pub const CBT_CREATEWNDW = extern struct {
    lpcs: ?*CREATESTRUCTW,
    hwndInsertAfter: HWND,
};

pub const LPCBT_CREATEWNDW = ?*CBT_CREATEWNDW;
pub const CBTACTIVATESTRUCT = extern struct {
    fMouse: BOOL,
    hWndActive: HWND,
};

pub const LPCBTACTIVATESTRUCT = ?*CBTACTIVATESTRUCT;
pub const WTSSESSION_NOTIFICATION = extern struct {
    cbSize: DWORD,
    dwSessionId: DWORD,
};

pub const PWTSSESSION_NOTIFICATION = ?*WTSSESSION_NOTIFICATION;
pub const SHELLHOOKINFO = extern struct {
    hwnd: HWND,
    rc: RECT,
};
pub const LPSHELLHOOKINFO = ?*extern struct {
    hwnd: HWND,
    rc: RECT,
};
pub const EVENTMSG = extern struct {
    message: UINT,
    paramL: UINT,
    paramH: UINT,
    time: DWORD,
    hwnd: HWND,
};

pub const PEVENTMSGMSG = ?*EVENTMSG;
pub const NPEVENTMSGMSG = ?*EVENTMSG;
pub const LPEVENTMSGMSG = ?*EVENTMSG;
pub const PEVENTMSG = ?*EVENTMSG;
pub const NPEVENTMSG = ?*EVENTMSG;
pub const LPEVENTMSG = ?*EVENTMSG;
pub const CWPSTRUCT = extern struct {
    lParam: LPARAM,
    wParam: WPARAM,
    message: UINT,
    hwnd: HWND,
};

pub const PCWPSTRUCT = ?*CWPSTRUCT;
pub const NPCWPSTRUCT = ?*CWPSTRUCT;
pub const LPCWPSTRUCT = ?*CWPSTRUCT;
pub const CWPRETSTRUCT = extern struct {
    lResult: LRESULT,
    lParam: LPARAM,
    wParam: WPARAM,
    message: UINT,
    hwnd: HWND,
};

pub const PCWPRETSTRUCT = ?*CWPRETSTRUCT;
pub const NPCWPRETSTRUCT = ?*CWPRETSTRUCT;
pub const LPCWPRETSTRUCT = ?*CWPRETSTRUCT;
pub const KBDLLHOOKSTRUCT = extern struct {
    vkCode: DWORD,
    scanCode: DWORD,
    flags: DWORD,
    time: DWORD,
    dwExtraInfo: ULONG_PTR,
};

pub const LPKBDLLHOOKSTRUCT = ?*KBDLLHOOKSTRUCT;
pub const PKBDLLHOOKSTRUCT = ?*KBDLLHOOKSTRUCT;
pub const MSLLHOOKSTRUCT = extern struct {
    pt: POINT,
    mouseData: DWORD,
    flags: DWORD,
    time: DWORD,
    dwExtraInfo: ULONG_PTR,
};

pub const LPMSLLHOOKSTRUCT = ?*MSLLHOOKSTRUCT;
pub const PMSLLHOOKSTRUCT = ?*MSLLHOOKSTRUCT;
pub const DEBUGHOOKINFO = extern struct {
    idThread: DWORD,
    idThreadInstaller: DWORD,
    lParam: LPARAM,
    wParam: WPARAM,
    code: c_int,
};

pub const PDEBUGHOOKINFO = ?*DEBUGHOOKINFO;
pub const NPDEBUGHOOKINFO = ?*DEBUGHOOKINFO;
pub const LPDEBUGHOOKINFO = ?*DEBUGHOOKINFO;
pub const MOUSEHOOKSTRUCT = extern struct {
    pt: POINT,
    hwnd: HWND,
    wHitTestCode: UINT,
    dwExtraInfo: ULONG_PTR,
};

pub const LPMOUSEHOOKSTRUCT = ?*MOUSEHOOKSTRUCT;
pub const PMOUSEHOOKSTRUCT = ?*MOUSEHOOKSTRUCT;
pub const MOUSEHOOKSTRUCTEX = extern struct {
    s: MOUSEHOOKSTRUCT,
    mouseData: DWORD,
};

pub const LPMOUSEHOOKSTRUCTEX = ?*MOUSEHOOKSTRUCTEX;
pub const PMOUSEHOOKSTRUCTEX = ?*MOUSEHOOKSTRUCTEX;
pub const HARDWAREHOOKSTRUCT = extern struct {
    hwnd: HWND,
    message: UINT,
    wParam: WPARAM,
    lParam: LPARAM,
};

pub const LPHARDWAREHOOKSTRUCT = ?*HARDWAREHOOKSTRUCT;
pub const PHARDWAREHOOKSTRUCT = ?*HARDWAREHOOKSTRUCT;
pub const MOUSEMOVEPOINT = extern struct {
    x: c_int,
    y: c_int,
    time: DWORD,
    dwExtraInfo: ULONG_PTR,
};

pub const PMOUSEMOVEPOINT = ?*MOUSEMOVEPOINT;
pub const LPMOUSEMOVEPOINT = ?*MOUSEMOVEPOINT;
pub const USEROBJECTFLAGS = extern struct {
    fInherit: BOOL,
    fReserved: BOOL,
    dwFlags: DWORD,
};

pub const PUSEROBJECTFLAGS = ?*USEROBJECTFLAGS;
pub const WNDCLASSEXA = extern struct {
    cbSize: UINT,
    style: UINT,
    lpfnWndProc: WNDPROC,
    cbClsExtra: c_int,
    cbWndExtra: c_int,
    hInstance: HINSTANCE,
    hIcon: HICON,
    hCursor: HCURSOR,
    hbrBackground: HBRUSH,
    lpszMenuName: LPCSTR,
    lpszClassName: LPCSTR,
    hIconSm: HICON,
};

pub const PWNDCLASSEXA = ?*WNDCLASSEXA;
pub const NPWNDCLASSEXA = ?*WNDCLASSEXA;
pub const LPWNDCLASSEXA = ?*WNDCLASSEXA;
pub const WNDCLASSEXW = extern struct {
    cbSize: UINT,
    style: UINT,
    lpfnWndProc: WNDPROC,
    cbClsExtra: c_int,
    cbWndExtra: c_int,
    hInstance: HINSTANCE,
    hIcon: HICON,
    hCursor: HCURSOR,
    hbrBackground: HBRUSH,
    lpszMenuName: LPCWSTR,
    lpszClassName: LPCWSTR,
    hIconSm: HICON,
};

pub const PWNDCLASSEXW = ?*WNDCLASSEXW;
pub const NPWNDCLASSEXW = ?*WNDCLASSEXW;
pub const LPWNDCLASSEXW = ?*WNDCLASSEXW;
pub const WNDCLASSA = extern struct {
    style: UINT,
    lpfnWndProc: WNDPROC,
    cbClsExtra: c_int,
    cbWndExtra: c_int,
    hInstance: HINSTANCE,
    hIcon: HICON,
    hCursor: HCURSOR,
    hbrBackground: HBRUSH,
    lpszMenuName: LPCSTR,
    lpszClassName: LPCSTR,
};

pub const PWNDCLASSA = ?*WNDCLASSA;
pub const NPWNDCLASSA = ?*WNDCLASSA;
pub const LPWNDCLASSA = ?*WNDCLASSA;
pub const WNDCLASSW = extern struct {
    style: UINT,
    lpfnWndProc: WNDPROC,
    cbClsExtra: c_int,
    cbWndExtra: c_int,
    hInstance: HINSTANCE,
    hIcon: HICON,
    hCursor: HCURSOR,
    hbrBackground: HBRUSH,
    lpszMenuName: LPCWSTR,
    lpszClassName: LPCWSTR,
};

pub const PWNDCLASSW = ?*WNDCLASSW;
pub const NPWNDCLASSW = ?*WNDCLASSW;
pub const LPWNDCLASSW = ?*WNDCLASSW;
pub const MSG = extern struct {
    hwnd: HWND,
    message: UINT,
    wParam: WPARAM,
    lParam: LPARAM,
    time: DWORD,
    pt: POINT,
};

pub const PMSG = ?*MSG;
pub const NPMSG = ?*MSG;
pub const LPMSG = ?*MSG;
pub const MINMAXINFO = extern struct {
    ptReserved: POINT,
    ptMaxSize: POINT,
    ptMaxPosition: POINT,
    ptMinTrackSize: POINT,
    ptMaxTrackSize: POINT,
};

pub const PMINMAXINFO = ?*MINMAXINFO;
pub const LPMINMAXINFO = ?*MINMAXINFO;
pub const COPYDATASTRUCT = extern struct {
    dwData: ULONG_PTR,
    cbData: DWORD,
    lpData: PVOID,
};

pub const PCOPYDATASTRUCT = ?*COPYDATASTRUCT;
pub const MDINEXTMENU = extern struct {
    hmenuIn: HMENU,
    hmenuNext: HMENU,
    hwndNext: HWND,
};

pub const PMDINEXTMENU = ?*MDINEXTMENU;
pub const LPMDINEXTMENU = ?*MDINEXTMENU;
pub const POWERBROADCAST_SETTING = extern struct {
    PowerSetting: GUID,
    DataLength: DWORD,
    Data: [1]UCHAR,
};
pub const PPOWERBROADCAST_SETTING = ?*extern struct {
    PowerSetting: GUID,
    DataLength: DWORD,
    Data: [1]UCHAR,
};
pub const WINDOWPOS = extern struct {
    hwnd: HWND,
    hwndInsertAfter: HWND,
    x: c_int,
    y: c_int,
    cx: c_int,
    cy: c_int,
    flags: UINT,
};

pub const LPWINDOWPOS = ?*WINDOWPOS;
pub const PWINDOWPOS = ?*WINDOWPOS;
pub const NCCALCSIZE_PARAMS = extern struct {
    rgrc: [3]RECT,
    lppos: PWINDOWPOS,
};

pub const LPNCCALCSIZE_PARAMS = ?*NCCALCSIZE_PARAMS;
pub const TRACKMOUSEEVENT = extern struct {
    cbSize: DWORD,
    dwFlags: DWORD,
    hwndTrack: HWND,
    dwHoverTime: DWORD,
};

pub const LPTRACKMOUSEEVENT = ?*TRACKMOUSEEVENT;
pub const ACCEL = extern struct {
    fVirt: BYTE,
    key: WORD,
    cmd: WORD,
};

pub const LPACCEL = ?*ACCEL;
pub const PAINTSTRUCT = extern struct {
    hdc: HDC,
    fErase: BOOL,
    rcPaint: RECT,
    fRestore: BOOL,
    fIncUpdate: BOOL,
    rgbReserved: [32]BYTE,
};

pub const PPAINTSTRUCT = ?*PAINTSTRUCT;
pub const NPPAINTSTRUCT = ?*PAINTSTRUCT;
pub const LPPAINTSTRUCT = ?*PAINTSTRUCT;

pub const LPCREATESTRUCTA = ?*CREATESTRUCTA;

pub const LPCREATESTRUCTW = ?*CREATESTRUCTW;
pub const WINDOWPLACEMENT = extern struct {
    length: UINT,
    flags: UINT,
    showCmd: UINT,
    ptMinPosition: POINT,
    ptMaxPosition: POINT,
    rcNormalPosition: RECT,
};

pub const PWINDOWPLACEMENT = ?*WINDOWPLACEMENT;
pub const LPWINDOWPLACEMENT = ?*WINDOWPLACEMENT;
pub const NMHDR = extern struct {
    hwndFrom: HWND,
    idFrom: UINT_PTR,
    code: UINT,
};

pub const LPNMHDR = ?*NMHDR;
pub const STYLESTRUCT = extern struct {
    styleOld: DWORD,
    styleNew: DWORD,
};

pub const LPSTYLESTRUCT = ?*STYLESTRUCT;
pub const MEASUREITEMSTRUCT = extern struct {
    CtlType: UINT,
    CtlID: UINT,
    itemID: UINT,
    itemWidth: UINT,
    itemHeight: UINT,
    itemData: ULONG_PTR,
};

pub const PMEASUREITEMSTRUCT = ?*MEASUREITEMSTRUCT;
pub const LPMEASUREITEMSTRUCT = ?*MEASUREITEMSTRUCT;
pub const DRAWITEMSTRUCT = extern struct {
    CtlType: UINT,
    CtlID: UINT,
    itemID: UINT,
    itemAction: UINT,
    itemState: UINT,
    hwndItem: HWND,
    hDC: HDC,
    rcItem: RECT,
    itemData: ULONG_PTR,
};

pub const PDRAWITEMSTRUCT = ?*DRAWITEMSTRUCT;
pub const LPDRAWITEMSTRUCT = ?*DRAWITEMSTRUCT;
pub const DELETEITEMSTRUCT = extern struct {
    CtlType: UINT,
    CtlID: UINT,
    itemID: UINT,
    hwndItem: HWND,
    itemData: ULONG_PTR,
};

pub const PDELETEITEMSTRUCT = ?*DELETEITEMSTRUCT;
pub const LPDELETEITEMSTRUCT = ?*DELETEITEMSTRUCT;
pub const COMPAREITEMSTRUCT = extern struct {
    CtlType: UINT,
    CtlID: UINT,
    hwndItem: HWND,
    itemID1: UINT,
    itemData1: ULONG_PTR,
    itemID2: UINT,
    itemData2: ULONG_PTR,
    dwLocaleId: DWORD,
};

pub const PCOMPAREITEMSTRUCT = ?*COMPAREITEMSTRUCT;
pub const LPCOMPAREITEMSTRUCT = ?*COMPAREITEMSTRUCT;
pub const BSMINFO = extern struct {
    cbSize: UINT,
    hdesk: HDESK,
    hwnd: HWND,
    luid: LUID,
};
pub const PBSMINFO = ?*extern struct {
    cbSize: UINT,
    hdesk: HDESK,
    hwnd: HWND,
    luid: LUID,
};
pub const HDEVNOTIFY = PVOID;
pub const PHDEVNOTIFY = ?*HDEVNOTIFY;
pub const HPOWERNOTIFY = PVOID;
pub const PHPOWERNOTIFY = ?*HPOWERNOTIFY;
pub const PREGISTERCLASSNAMEW = ?extern fn(LPCWSTR) BOOLEAN;
pub const UPDATELAYEREDWINDOWINFO = extern struct {
    cbSize: DWORD,
    hdcDst: HDC,
    pptDst: ?*const POINT,
    psize: ?*const SIZE,
    hdcSrc: HDC,
    pptSrc: ?*const POINT,
    crKey: COLORREF,
    pblend: ?*const BLENDFUNCTION,
    dwFlags: DWORD,
    prcDirty: ?*const RECT,
};

pub const PUPDATELAYEREDWINDOWINFO = ?*UPDATELAYEREDWINDOWINFO;
pub const FLASHWINFO = extern struct {
    cbSize: UINT,
    hwnd: HWND,
    dwFlags: DWORD,
    uCount: UINT,
    dwTimeout: DWORD,
};
pub const PFLASHWINFO = ?*extern struct {
    cbSize: UINT,
    hwnd: HWND,
    dwFlags: DWORD,
    uCount: UINT,
    dwTimeout: DWORD,
};
pub const DLGTEMPLATE = extern struct {
    style: DWORD,
    dwExtendedStyle: DWORD,
    cdit: WORD,
    x: c_short,
    y: c_short,
    cx: c_short,
    cy: c_short,
};
pub const LPDLGTEMPLATEA = ?*DLGTEMPLATE;
pub const LPDLGTEMPLATEW = ?*DLGTEMPLATE;
pub const LPCDLGTEMPLATEA = ?*const DLGTEMPLATE;
pub const LPCDLGTEMPLATEW = ?*const DLGTEMPLATE;
pub const DLGITEMTEMPLATE = extern struct {
    style: DWORD,
    dwExtendedStyle: DWORD,
    x: c_short,
    y: c_short,
    cx: c_short,
    cy: c_short,
    id: WORD,
};
pub const PDLGITEMTEMPLATEA = ?*DLGITEMTEMPLATE;
pub const PDLGITEMTEMPLATEW = ?*DLGITEMTEMPLATE;
pub const LPDLGITEMTEMPLATEA = ?*DLGITEMTEMPLATE;
pub const LPDLGITEMTEMPLATEW = ?*DLGITEMTEMPLATE;
pub const DIALOG_CONTROL_DPI_CHANGE_BEHAVIORS = c_int;

pub const DIALOG_DPI_CHANGE_BEHAVIORS = c_int;

pub const MOUSEINPUT = extern struct {
    dx: LONG,
    dy: LONG,
    mouseData: DWORD,
    dwFlags: DWORD,
    time: DWORD,
    dwExtraInfo: ULONG_PTR,
};

pub const PMOUSEINPUT = ?*MOUSEINPUT;
pub const LPMOUSEINPUT = ?*MOUSEINPUT;
pub const KEYBDINPUT = extern struct {
    wVk: WORD,
    wScan: WORD,
    dwFlags: DWORD,
    time: DWORD,
    dwExtraInfo: ULONG_PTR,
};

pub const PKEYBDINPUT = ?*KEYBDINPUT;
pub const LPKEYBDINPUT = ?*KEYBDINPUT;
pub const HARDWAREINPUT = extern struct {
    uMsg: DWORD,
    wParamL: WORD,
    wParamH: WORD,
};

pub const PHARDWAREINPUT = ?*HARDWAREINPUT;
pub const LPHARDWAREINPUT = ?*HARDWAREINPUT;
pub const INPUT = extern struct {
    type: DWORD,
    u: extern union {
        mi: MOUSEINPUT,
        ki: KEYBDINPUT,
        hi: HARDWAREINPUT,
    },
};

pub const PINPUT = ?*INPUT;
pub const LPINPUT = ?*INPUT;
pub const HTOUCHINPUT__ = extern struct {
    unused: c_int,
};
pub const HTOUCHINPUT = ?*HTOUCHINPUT__;
pub const TOUCHINPUT = extern struct {
    x: LONG,
    y: LONG,
    hSource: HANDLE,
    dwID: DWORD,
    dwFlags: DWORD,
    dwMask: DWORD,
    dwTime: DWORD,
    dwExtraInfo: ULONG_PTR,
    cxContact: DWORD,
    cyContact: DWORD,
};

pub const PTOUCHINPUT = ?*TOUCHINPUT;
pub const PCTOUCHINPUT = ?*const TOUCHINPUT;
pub const POINTER_INPUT_TYPE = DWORD;
pub const POINTER_FLAGS = UINT32;
pub const POINTER_CHANGE_NONE = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_NONE;
pub const POINTER_CHANGE_FIRSTBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_FIRSTBUTTON_DOWN;
pub const POINTER_CHANGE_FIRSTBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_FIRSTBUTTON_UP;
pub const POINTER_CHANGE_SECONDBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_SECONDBUTTON_DOWN;
pub const POINTER_CHANGE_SECONDBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_SECONDBUTTON_UP;
pub const POINTER_CHANGE_THIRDBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_THIRDBUTTON_DOWN;
pub const POINTER_CHANGE_THIRDBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_THIRDBUTTON_UP;
pub const POINTER_CHANGE_FOURTHBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_FOURTHBUTTON_DOWN;
pub const POINTER_CHANGE_FOURTHBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_FOURTHBUTTON_UP;
pub const POINTER_CHANGE_FIFTHBUTTON_DOWN = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_FIFTHBUTTON_DOWN;
pub const POINTER_CHANGE_FIFTHBUTTON_UP = POINTER_BUTTON_CHANGE_TYPE.POINTER_CHANGE_FIFTHBUTTON_UP;
pub const POINTER_BUTTON_CHANGE_TYPE = extern enum {
    POINTER_CHANGE_NONE,
    POINTER_CHANGE_FIRSTBUTTON_DOWN,
    POINTER_CHANGE_FIRSTBUTTON_UP,
    POINTER_CHANGE_SECONDBUTTON_DOWN,
    POINTER_CHANGE_SECONDBUTTON_UP,
    POINTER_CHANGE_THIRDBUTTON_DOWN,
    POINTER_CHANGE_THIRDBUTTON_UP,
    POINTER_CHANGE_FOURTHBUTTON_DOWN,
    POINTER_CHANGE_FOURTHBUTTON_UP,
    POINTER_CHANGE_FIFTHBUTTON_DOWN,
    POINTER_CHANGE_FIFTHBUTTON_UP,
};

pub const POINTER_INFO = extern struct {
    pointerType: POINTER_INPUT_TYPE,
    pointerId: UINT32,
    frameId: UINT32,
    pointerFlags: POINTER_FLAGS,
    sourceDevice: HANDLE,
    hwndTarget: HWND,
    ptPixelLocation: POINT,
    ptHimetricLocation: POINT,
    ptPixelLocationRaw: POINT,
    ptHimetricLocationRaw: POINT,
    dwTime: DWORD,
    historyCount: UINT32,
    InputData: INT32,
    dwKeyStates: DWORD,
    PerformanceCount: UINT64,
    ButtonChangeType: POINTER_BUTTON_CHANGE_TYPE,
};

pub const TOUCH_FLAGS = UINT32;
pub const TOUCH_MASK = UINT32;
pub const POINTER_TOUCH_INFO = extern struct {
    pointerInfo: POINTER_INFO,
    touchFlags: TOUCH_FLAGS,
    touchMask: TOUCH_MASK,
    rcContact: RECT,
    rcContactRaw: RECT,
    orientation: UINT32,
    pressure: UINT32,
};

pub const PEN_FLAGS = UINT32;
pub const PEN_MASK = UINT32;
pub const POINTER_PEN_INFO = extern struct {
    pointerInfo: POINTER_INFO,
    penFlags: PEN_FLAGS,
    penMask: PEN_MASK,
    pressure: UINT32,
    rotation: UINT32,
    tiltX: INT32,
    tiltY: INT32,
};

pub const USAGE_PROPERTIES = extern struct {
    level: USHORT,
    page: USHORT,
    usage: USHORT,
    logicalMinimum: INT32,
    logicalMaximum: INT32,
    unit: USHORT,
    exponent: USHORT,
    count: BYTE,
    physicalMinimum: INT32,
    physicalMaximum: INT32,
};

pub const PUSAGE_PROPERTIES = ?*USAGE_PROPERTIES;
pub const POINTER_TYPE_INFO = extern struct {
    type: POINTER_INPUT_TYPE,
    u: extern union {
        touchInfo: POINTER_TOUCH_INFO,
        penInfo: POINTER_PEN_INFO,
    },
};

pub const PPOINTER_TYPE_INFO = ?*POINTER_TYPE_INFO;
pub const INPUT_INJECTION_VALUE = extern struct {
    page: USHORT,
    usage: USHORT,
    value: INT32,
    index: USHORT,
};

pub const PINPUT_INJECTION_VALUE = ?*INPUT_INJECTION_VALUE;
pub const TOUCH_HIT_TESTING_PROXIMITY_EVALUATION = extern struct {
    score: UINT16,
    adjustedPoint: POINT,
};

pub const PTOUCH_HIT_TESTING_PROXIMITY_EVALUATION = ?*TOUCH_HIT_TESTING_PROXIMITY_EVALUATION;
pub const TOUCH_HIT_TESTING_INPUT = extern struct {
    pointerId: UINT32,
    point: POINT,
    boundingBox: RECT,
    nonOccludedBoundingBox: RECT,
    orientation: UINT32,
};

pub const PTOUCH_HIT_TESTING_INPUT = ?*TOUCH_HIT_TESTING_INPUT;
pub const FEEDBACK_TYPE = c_int;

pub const INPUT_TRANSFORM = extern struct {
    u: extern union {
        s: extern struct {
            _11: f32,
            _12: f32,
            _13: f32,
            _14: f32,
            _21: f32,
            _22: f32,
            _23: f32,
            _24: f32,
            _31: f32,
            _32: f32,
            _33: f32,
            _34: f32,
            _41: f32,
            _42: f32,
            _43: f32,
            _44: f32,
        },
        m: [4][4]f32,
    },
};

pub const LASTINPUTINFO = extern struct {
    cbSize: UINT,
    dwTime: DWORD,
};

pub const PLASTINPUTINFO = ?*LASTINPUTINFO;
pub const TPMPARAMS = extern struct {
    cbSize: UINT,
    rcExclude: RECT,
};

pub const LPTPMPARAMS = ?*TPMPARAMS;
pub const MENUINFO = extern struct {
    cbSize: DWORD,
    fMask: DWORD,
    dwStyle: DWORD,
    cyMax: UINT,
    hbrBack: HBRUSH,
    dwContextHelpID: DWORD,
    dwMenuData: ULONG_PTR,
};

pub const LPMENUINFO = ?*MENUINFO;
pub const LPCMENUINFO = ?*const MENUINFO;
pub const MENUGETOBJECTINFO = extern struct {
    dwFlags: DWORD,
    uPos: UINT,
    hmenu: HMENU,
    riid: PVOID,
    pvObj: PVOID,
};

pub const PMENUGETOBJECTINFO = ?*MENUGETOBJECTINFO;
pub const MENUITEMINFOA = extern struct {
    cbSize: UINT,
    fMask: UINT,
    fType: UINT,
    fState: UINT,
    wID: UINT,
    hSubMenu: HMENU,
    hbmpChecked: HBITMAP,
    hbmpUnchecked: HBITMAP,
    dwItemData: ULONG_PTR,
    dwTypeData: LPSTR,
    cch: UINT,
    hbmpItem: HBITMAP,
};

pub const LPMENUITEMINFOA = ?*MENUITEMINFOA;
pub const MENUITEMINFOW = extern struct {
    cbSize: UINT,
    fMask: UINT,
    fType: UINT,
    fState: UINT,
    wID: UINT,
    hSubMenu: HMENU,
    hbmpChecked: HBITMAP,
    hbmpUnchecked: HBITMAP,
    dwItemData: ULONG_PTR,
    dwTypeData: LPWSTR,
    cch: UINT,
    hbmpItem: HBITMAP,
};

pub const LPMENUITEMINFOW = ?*MENUITEMINFOW;
pub const LPCMENUITEMINFOA = ?*const MENUITEMINFOA;
pub const LPCMENUITEMINFOW = ?*const MENUITEMINFOW;
pub const DROPSTRUCT = extern struct {
    hwndSource: HWND,
    hwndSink: HWND,
    wFmt: DWORD,
    dwData: ULONG_PTR,
    ptDrop: POINT,
    dwControlData: DWORD,
};

pub const PDROPSTRUCT = ?*DROPSTRUCT;
pub const LPDROPSTRUCT = ?*DROPSTRUCT;
pub const DRAWTEXTPARAMS = extern struct {
    cbSize: UINT,
    iTabLength: c_int,
    iLeftMargin: c_int,
    iRightMargin: c_int,
    uiLengthDrawn: UINT,
};

pub const LPDRAWTEXTPARAMS = ?*DRAWTEXTPARAMS;
pub const HELPINFO = extern struct {
    cbSize: UINT,
    iContextType: c_int,
    iCtrlId: c_int,
    hItemHandle: HANDLE,
    dwContextId: DWORD_PTR,
    MousePos: POINT,
};

pub const LPHELPINFO = ?*HELPINFO;
pub const MSGBOXCALLBACK = ?extern fn(LPHELPINFO) void;
pub const MSGBOXPARAMSA = extern struct {
    cbSize: UINT,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    lpszText: LPCSTR,
    lpszCaption: LPCSTR,
    dwStyle: DWORD,
    lpszIcon: LPCSTR,
    dwContextHelpId: DWORD_PTR,
    lpfnMsgBoxCallback: MSGBOXCALLBACK,
    dwLanguageId: DWORD,
};

pub const PMSGBOXPARAMSA = ?*MSGBOXPARAMSA;
pub const LPMSGBOXPARAMSA = ?*MSGBOXPARAMSA;
pub const MSGBOXPARAMSW = extern struct {
    cbSize: UINT,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    lpszText: LPCWSTR,
    lpszCaption: LPCWSTR,
    dwStyle: DWORD,
    lpszIcon: LPCWSTR,
    dwContextHelpId: DWORD_PTR,
    lpfnMsgBoxCallback: MSGBOXCALLBACK,
    dwLanguageId: DWORD,
};

pub const PMSGBOXPARAMSW = ?*MSGBOXPARAMSW;
pub const LPMSGBOXPARAMSW = ?*MSGBOXPARAMSW;
pub const MENUITEMTEMPLATEHEADER = extern struct {
    versionNumber: WORD,
    offset: WORD,
};
pub const PMENUITEMTEMPLATEHEADER = ?*extern struct {
    versionNumber: WORD,
    offset: WORD,
};
pub const MENUITEMTEMPLATE = extern struct {
    mtOption: WORD,
    mtID: WORD,
    mtString: [1]WCHAR,
};
pub const PMENUITEMTEMPLATE = ?*extern struct {
    mtOption: WORD,
    mtID: WORD,
    mtString: [1]WCHAR,
};
pub const ICONINFO = extern struct {
    fIcon: BOOL,
    xHotspot: DWORD,
    yHotspot: DWORD,
    hbmMask: HBITMAP,
    hbmColor: HBITMAP,
};

pub const PICONINFO = ?*ICONINFO;
pub const CURSORSHAPE = extern struct {
    xHotSpot: c_int,
    yHotSpot: c_int,
    cx: c_int,
    cy: c_int,
    cbWidth: c_int,
    Planes: BYTE,
    BitsPixel: BYTE,
};

pub const LPCURSORSHAPE = ?*CURSORSHAPE;
pub const ICONINFOEXA = extern struct {
    cbSize: DWORD,
    fIcon: BOOL,
    xHotspot: DWORD,
    yHotspot: DWORD,
    hbmMask: HBITMAP,
    hbmColor: HBITMAP,
    wResID: WORD,
    szModName: [260]CHAR,
    szResName: [260]CHAR,
};

pub const PICONINFOEXA = ?*ICONINFOEXA;
pub const ICONINFOEXW = extern struct {
    cbSize: DWORD,
    fIcon: BOOL,
    xHotspot: DWORD,
    yHotspot: DWORD,
    hbmMask: HBITMAP,
    hbmColor: HBITMAP,
    wResID: WORD,
    szModName: [260]WCHAR,
    szResName: [260]WCHAR,
};

pub const PICONINFOEXW = ?*ICONINFOEXW;
pub const EDIT_CONTROL_FEATURE = c_int;
pub const SCROLLINFO = extern struct {
    cbSize: UINT,
    fMask: UINT,
    nMin: c_int,
    nMax: c_int,
    nPage: UINT,
    nPos: c_int,
    nTrackPos: c_int,
};

pub const LPSCROLLINFO = ?*SCROLLINFO;
pub const LPCSCROLLINFO = ?*const SCROLLINFO;
pub const MDICREATESTRUCTA = extern struct {
    szClass: LPCSTR,
    szTitle: LPCSTR,
    hOwner: HANDLE,
    x: c_int,
    y: c_int,
    cx: c_int,
    cy: c_int,
    style: DWORD,
    lParam: LPARAM,
};

pub const LPMDICREATESTRUCTA = ?*MDICREATESTRUCTA;
pub const MDICREATESTRUCTW = extern struct {
    szClass: LPCWSTR,
    szTitle: LPCWSTR,
    hOwner: HANDLE,
    x: c_int,
    y: c_int,
    cx: c_int,
    cy: c_int,
    style: DWORD,
    lParam: LPARAM,
};

pub const LPMDICREATESTRUCTW = ?*MDICREATESTRUCTW;
pub const CLIENTCREATESTRUCT = extern struct {
    hWindowMenu: HANDLE,
    idFirstChild: UINT,
};

pub const LPCLIENTCREATESTRUCT = ?*CLIENTCREATESTRUCT;
pub const HELPPOLY = DWORD;
pub const MULTIKEYHELPA = extern struct {
    mkSize: DWORD,
    mkKeylist: CHAR,
    szKeyphrase: [1]CHAR,
};

pub const PMULTIKEYHELPA = ?*MULTIKEYHELPA;
pub const LPMULTIKEYHELPA = ?*MULTIKEYHELPA;
pub const MULTIKEYHELPW = extern struct {
    mkSize: DWORD,
    mkKeylist: WCHAR,
    szKeyphrase: [1]WCHAR,
};

pub const PMULTIKEYHELPW = ?*MULTIKEYHELPW;
pub const LPMULTIKEYHELPW = ?*MULTIKEYHELPW;
pub const HELPWININFOA = extern struct {
    wStructSize: c_int,
    x: c_int,
    y: c_int,
    dx: c_int,
    dy: c_int,
    wMax: c_int,
    rgchMember: [2]CHAR,
};

pub const PHELPWININFOA = ?*HELPWININFOA;
pub const LPHELPWININFOA = ?*HELPWININFOA;
pub const HELPWININFOW = extern struct {
    wStructSize: c_int,
    x: c_int,
    y: c_int,
    dx: c_int,
    dy: c_int,
    wMax: c_int,
    rgchMember: [2]WCHAR,
};

pub const PHELPWININFOW = ?*HELPWININFOW;
pub const LPHELPWININFOW = ?*HELPWININFOW;
pub const TouchPredictionParameters = extern struct {
    cbSize: UINT,
    dwLatency: UINT,
    dwSampleTime: UINT,
    bUseHWTimeStamp: UINT,
};
pub const TOUCHPREDICTIONPARAMETERS = TouchPredictionParameters;
pub const PTOUCHPREDICTIONPARAMETERS = ?*TouchPredictionParameters;
pub const NONCLIENTMETRICSA = extern struct {
    cbSize: UINT,
    iBorderWidth: c_int,
    iScrollWidth: c_int,
    iScrollHeight: c_int,
    iCaptionWidth: c_int,
    iCaptionHeight: c_int,
    lfCaptionFont: LOGFONTA,
    iSmCaptionWidth: c_int,
    iSmCaptionHeight: c_int,
    lfSmCaptionFont: LOGFONTA,
    iMenuWidth: c_int,
    iMenuHeight: c_int,
    lfMenuFont: LOGFONTA,
    lfStatusFont: LOGFONTA,
    lfMessageFont: LOGFONTA,
    iPaddedBorderWidth: c_int,
};

pub const PNONCLIENTMETRICSA = ?*NONCLIENTMETRICSA;
pub const LPNONCLIENTMETRICSA = ?*NONCLIENTMETRICSA;
pub const NONCLIENTMETRICSW = extern struct {
    cbSize: UINT,
    iBorderWidth: c_int,
    iScrollWidth: c_int,
    iScrollHeight: c_int,
    iCaptionWidth: c_int,
    iCaptionHeight: c_int,
    lfCaptionFont: LOGFONTW,
    iSmCaptionWidth: c_int,
    iSmCaptionHeight: c_int,
    lfSmCaptionFont: LOGFONTW,
    iMenuWidth: c_int,
    iMenuHeight: c_int,
    lfMenuFont: LOGFONTW,
    lfStatusFont: LOGFONTW,
    lfMessageFont: LOGFONTW,
    iPaddedBorderWidth: c_int,
};

pub const PNONCLIENTMETRICSW = ?*NONCLIENTMETRICSW;
pub const LPNONCLIENTMETRICSW = ?*NONCLIENTMETRICSW;
pub const MINIMIZEDMETRICS = extern struct {
    cbSize: UINT,
    iWidth: c_int,
    iHorzGap: c_int,
    iVertGap: c_int,
    iArrange: c_int,
};

pub const PMINIMIZEDMETRICS = ?*MINIMIZEDMETRICS;
pub const LPMINIMIZEDMETRICS = ?*MINIMIZEDMETRICS;
pub const ICONMETRICSA = extern struct {
    cbSize: UINT,
    iHorzSpacing: c_int,
    iVertSpacing: c_int,
    iTitleWrap: c_int,
    lfFont: LOGFONTA,
};

pub const PICONMETRICSA = ?*ICONMETRICSA;
pub const LPICONMETRICSA = ?*ICONMETRICSA;
pub const ICONMETRICSW = extern struct {
    cbSize: UINT,
    iHorzSpacing: c_int,
    iVertSpacing: c_int,
    iTitleWrap: c_int,
    lfFont: LOGFONTW,
};

pub const PICONMETRICSW = ?*ICONMETRICSW;
pub const LPICONMETRICSW = ?*ICONMETRICSW;
pub const ANIMATIONINFO = extern struct {
    cbSize: UINT,
    iMinAnimate: c_int,
};

pub const LPANIMATIONINFO = ?*ANIMATIONINFO;
pub const SERIALKEYSA = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    lpszActivePort: LPSTR,
    lpszPort: LPSTR,
    iBaudRate: UINT,
    iPortState: UINT,
    iActive: UINT,
};

pub const LPSERIALKEYSA = ?*SERIALKEYSA;
pub const SERIALKEYSW = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    lpszActivePort: LPWSTR,
    lpszPort: LPWSTR,
    iBaudRate: UINT,
    iPortState: UINT,
    iActive: UINT,
};

pub const LPSERIALKEYSW = ?*SERIALKEYSW;
pub const HIGHCONTRASTA = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    lpszDefaultScheme: LPSTR,
};

pub const LPHIGHCONTRASTA = ?*HIGHCONTRASTA;
pub const HIGHCONTRASTW = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    lpszDefaultScheme: LPWSTR,
};

pub const LPHIGHCONTRASTW = ?*HIGHCONTRASTW;
pub const VIDEOPARAMETERS = extern struct {
    Guid: GUID,
    dwOffset: ULONG,
    dwCommand: ULONG,
    dwFlags: ULONG,
    dwMode: ULONG,
    dwTVStandard: ULONG,
    dwAvailableModes: ULONG,
    dwAvailableTVStandard: ULONG,
    dwFlickerFilter: ULONG,
    dwOverScanX: ULONG,
    dwOverScanY: ULONG,
    dwMaxUnscaledX: ULONG,
    dwMaxUnscaledY: ULONG,
    dwPositionX: ULONG,
    dwPositionY: ULONG,
    dwBrightness: ULONG,
    dwContrast: ULONG,
    dwCPType: ULONG,
    dwCPCommand: ULONG,
    dwCPStandard: ULONG,
    dwCPKey: ULONG,
    bCP_APSTriggerBits: ULONG,
    bOEMCopyProtection: [256]UCHAR,
};

pub const PVIDEOPARAMETERS = ?*VIDEOPARAMETERS;
pub const LPVIDEOPARAMETERS = ?*VIDEOPARAMETERS;
pub const FILTERKEYS = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    iWaitMSec: DWORD,
    iDelayMSec: DWORD,
    iRepeatMSec: DWORD,
    iBounceMSec: DWORD,
};

pub const LPFILTERKEYS = ?*FILTERKEYS;
pub const STICKYKEYS = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
};

pub const LPSTICKYKEYS = ?*STICKYKEYS;
pub const MOUSEKEYS = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    iMaxSpeed: DWORD,
    iTimeToMaxSpeed: DWORD,
    iCtrlSpeed: DWORD,
    dwReserved1: DWORD,
    dwReserved2: DWORD,
};

pub const LPMOUSEKEYS = ?*MOUSEKEYS;
pub const ACCESSTIMEOUT = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    iTimeOutMSec: DWORD,
};

pub const LPACCESSTIMEOUT = ?*ACCESSTIMEOUT;
pub const SOUNDSENTRYA = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    iFSTextEffect: DWORD,
    iFSTextEffectMSec: DWORD,
    iFSTextEffectColorBits: DWORD,
    iFSGrafEffect: DWORD,
    iFSGrafEffectMSec: DWORD,
    iFSGrafEffectColor: DWORD,
    iWindowsEffect: DWORD,
    iWindowsEffectMSec: DWORD,
    lpszWindowsEffectDLL: LPSTR,
    iWindowsEffectOrdinal: DWORD,
};

pub const LPSOUNDSENTRYA = ?*SOUNDSENTRYA;
pub const SOUNDSENTRYW = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    iFSTextEffect: DWORD,
    iFSTextEffectMSec: DWORD,
    iFSTextEffectColorBits: DWORD,
    iFSGrafEffect: DWORD,
    iFSGrafEffectMSec: DWORD,
    iFSGrafEffectColor: DWORD,
    iWindowsEffect: DWORD,
    iWindowsEffectMSec: DWORD,
    lpszWindowsEffectDLL: LPWSTR,
    iWindowsEffectOrdinal: DWORD,
};

pub const LPSOUNDSENTRYW = ?*SOUNDSENTRYW;
pub const TOGGLEKEYS = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
};

pub const LPTOGGLEKEYS = ?*TOGGLEKEYS;
pub const AUDIODESCRIPTION = extern struct {
    cbSize: UINT,
    Enabled: BOOL,
    Locale: LCID,
};

pub const LPAUDIODESCRIPTION = ?*AUDIODESCRIPTION;
pub const MONITORINFO = extern struct {
    cbSize: DWORD,
    rcMonitor: RECT,
    rcWork: RECT,
    dwFlags: DWORD,
};

pub const LPMONITORINFO = ?*MONITORINFO;
pub const MONITORINFOEXA = extern struct {
    s: MONITORINFO,
    szDevice: [32]CHAR,
};

pub const LPMONITORINFOEXA = ?*MONITORINFOEXA;
pub const MONITORINFOEXW = extern struct {
    s: MONITORINFO,
    szDevice: [32]WCHAR,
};

pub const LPMONITORINFOEXW = ?*MONITORINFOEXW;
pub const MONITORENUMPROC = ?extern fn(HMONITOR, HDC, LPRECT, LPARAM) BOOL;
pub const WINEVENTPROC = ?extern fn(HWINEVENTHOOK, DWORD, HWND, LONG, LONG, DWORD, DWORD) void;
pub const GUITHREADINFO = extern struct {
    cbSize: DWORD,
    flags: DWORD,
    hwndActive: HWND,
    hwndFocus: HWND,
    hwndCapture: HWND,
    hwndMenuOwner: HWND,
    hwndMoveSize: HWND,
    hwndCaret: HWND,
    rcCaret: RECT,
};

pub const PGUITHREADINFO = ?*GUITHREADINFO;
pub const LPGUITHREADINFO = ?*GUITHREADINFO;
pub const CURSORINFO = extern struct {
    cbSize: DWORD,
    flags: DWORD,
    hCursor: HCURSOR,
    ptScreenPos: POINT,
};

pub const PCURSORINFO = ?*CURSORINFO;
pub const LPCURSORINFO = ?*CURSORINFO;
pub const WINDOWINFO = extern struct {
    cbSize: DWORD,
    rcWindow: RECT,
    rcClient: RECT,
    dwStyle: DWORD,
    dwExStyle: DWORD,
    dwWindowStatus: DWORD,
    cxWindowBorders: UINT,
    cyWindowBorders: UINT,
    atomWindowType: ATOM,
    wCreatorVersion: WORD,
};

pub const PWINDOWINFO = ?*WINDOWINFO;
pub const LPWINDOWINFO = ?*WINDOWINFO;
pub const TITLEBARINFO = extern struct {
    cbSize: DWORD,
    rcTitleBar: RECT,
    rgstate: [6]DWORD,
};

pub const PTITLEBARINFO = ?*TITLEBARINFO;
pub const LPTITLEBARINFO = ?*TITLEBARINFO;
pub const TITLEBARINFOEX = extern struct {
    cbSize: DWORD,
    rcTitleBar: RECT,
    rgstate: [6]DWORD,
    rgrect: [6]RECT,
};

pub const PTITLEBARINFOEX = ?*TITLEBARINFOEX;
pub const LPTITLEBARINFOEX = ?*TITLEBARINFOEX;
pub const MENUBARINFO = @OpaqueType();

pub const PMENUBARINFO = ?*MENUBARINFO;
pub const LPMENUBARINFO = ?*MENUBARINFO;
pub const SCROLLBARINFO = extern struct {
    cbSize: DWORD,
    rcScrollBar: RECT,
    dxyLineButton: c_int,
    xyThumbTop: c_int,
    xyThumbBottom: c_int,
    reserved: c_int,
    rgstate: [6]DWORD,
};

pub const PSCROLLBARINFO = ?*SCROLLBARINFO;
pub const LPSCROLLBARINFO = ?*SCROLLBARINFO;
pub const COMBOBOXINFO = extern struct {
    cbSize: DWORD,
    rcItem: RECT,
    rcButton: RECT,
    stateButton: DWORD,
    hwndCombo: HWND,
    hwndItem: HWND,
    hwndList: HWND,
};

pub const PCOMBOBOXINFO = ?*COMBOBOXINFO;
pub const LPCOMBOBOXINFO = ?*COMBOBOXINFO;
pub const ALTTABINFO = extern struct {
    cbSize: DWORD,
    cItems: c_int,
    cColumns: c_int,
    cRows: c_int,
    iColFocus: c_int,
    iRowFocus: c_int,
    cxItem: c_int,
    cyItem: c_int,
    ptStart: POINT,
};

pub const PALTTABINFO = ?*ALTTABINFO;
pub const LPALTTABINFO = ?*ALTTABINFO;
pub const HRAWINPUT__ = extern struct {
    unused: c_int,
};
pub const HRAWINPUT = ?*HRAWINPUT__;
pub const RAWINPUTHEADER = extern struct {
    dwType: DWORD,
    dwSize: DWORD,
    hDevice: HANDLE,
    wParam: WPARAM,
};

pub const PRAWINPUTHEADER = ?*RAWINPUTHEADER;
pub const LPRAWINPUTHEADER = ?*RAWINPUTHEADER;
pub const RAWMOUSE = extern struct {
    usFlags: USHORT,
    u: extern union {
        ulButtons: ULONG,
        s: extern struct {
            usButtonFlags: USHORT,
            usButtonData: USHORT,
        },
    },
    ulRawButtons: ULONG,
    lLastX: LONG,
    lLastY: LONG,
    ulExtraInformation: ULONG,
};

pub const PRAWMOUSE = ?*RAWMOUSE;
pub const LPRAWMOUSE = ?*RAWMOUSE;
pub const RAWKEYBOARD = extern struct {
    MakeCode: USHORT,
    Flags: USHORT,
    Reserved: USHORT,
    VKey: USHORT,
    Message: UINT,
    ExtraInformation: ULONG,
};

pub const PRAWKEYBOARD = ?*RAWKEYBOARD;
pub const LPRAWKEYBOARD = ?*RAWKEYBOARD;
pub const RAWHID = extern struct {
    dwSizeHid: DWORD,
    dwCount: DWORD,
    bRawData: [1]BYTE,
};

pub const PRAWHID = ?*RAWHID;
pub const LPRAWHID = ?*RAWHID;
pub const RAWINPUT = extern struct {
    header: RAWINPUTHEADER,
    data: extern union {
        mouse: RAWMOUSE,
        keyboard: RAWKEYBOARD,
        hid: RAWHID,
    },
};

pub const PRAWINPUT = ?*RAWINPUT;
pub const LPRAWINPUT = ?*RAWINPUT;
pub const RID_DEVICE_INFO_MOUSE = extern struct {
    dwId: DWORD,
    dwNumberOfButtons: DWORD,
    dwSampleRate: DWORD,
    fHasHorizontalWheel: BOOL,
};

pub const PRID_DEVICE_INFO_MOUSE = ?*RID_DEVICE_INFO_MOUSE;
pub const RID_DEVICE_INFO_KEYBOARD = extern struct {
    dwType: DWORD,
    dwSubType: DWORD,
    dwKeyboardMode: DWORD,
    dwNumberOfFunctionKeys: DWORD,
    dwNumberOfIndicators: DWORD,
    dwNumberOfKeysTotal: DWORD,
};

pub const PRID_DEVICE_INFO_KEYBOARD = ?*RID_DEVICE_INFO_KEYBOARD;
pub const RID_DEVICE_INFO_HID = extern struct {
    dwVendorId: DWORD,
    dwProductId: DWORD,
    dwVersionNumber: DWORD,
    usUsagePage: USHORT,
    usUsage: USHORT,
};

pub const PRID_DEVICE_INFO_HID = ?*RID_DEVICE_INFO_HID;
pub const RID_DEVICE_INFO = extern struct {
    cbSize: DWORD,
    dwType: DWORD,
    u: extern union {
        mouse: RID_DEVICE_INFO_MOUSE,
        keyboard: RID_DEVICE_INFO_KEYBOARD,
        hid: RID_DEVICE_INFO_HID,
    },
};

pub const PRID_DEVICE_INFO = ?*RID_DEVICE_INFO;
pub const LPRID_DEVICE_INFO = ?*RID_DEVICE_INFO;
pub const RAWINPUTDEVICE = extern struct {
    usUsagePage: USHORT,
    usUsage: USHORT,
    dwFlags: DWORD,
    hwndTarget: HWND,
};

pub const PRAWINPUTDEVICE = ?*RAWINPUTDEVICE;
pub const LPRAWINPUTDEVICE = ?*RAWINPUTDEVICE;
pub const PCRAWINPUTDEVICE = ?*const RAWINPUTDEVICE;
pub const RAWINPUTDEVICELIST = extern struct {
    hDevice: HANDLE,
    dwType: DWORD,
};

pub const PRAWINPUTDEVICELIST = ?*RAWINPUTDEVICELIST;
pub const POINTER_DEVICE_TYPE = c_int;

pub const POINTER_DEVICE_INFO = extern struct {
    displayOrientation: DWORD,
    device: HANDLE,
    pointerDeviceType: POINTER_DEVICE_TYPE,
    monitor: HMONITOR,
    startingCursorId: ULONG,
    maxActiveContacts: USHORT,
    productString: [520]WCHAR,
};

pub const POINTER_DEVICE_PROPERTY = extern struct {
    logicalMin: INT32,
    logicalMax: INT32,
    physicalMin: INT32,
    physicalMax: INT32,
    unit: UINT32,
    unitExponent: UINT32,
    usagePageId: USHORT,
    usageId: USHORT,
};

pub const POINTER_DEVICE_CURSOR_TYPE = c_int;

pub const POINTER_DEVICE_CURSOR_INFO = extern struct {
    cursorId: UINT32,
    cursor: POINTER_DEVICE_CURSOR_TYPE,
};

pub const CHANGEFILTERSTRUCT = extern struct {
    cbSize: DWORD,
    ExtStatus: DWORD,
};

pub const PCHANGEFILTERSTRUCT = ?*CHANGEFILTERSTRUCT;
pub const HGESTUREINFO__ = extern struct {
    unused: c_int,
};
pub const HGESTUREINFO = ?*HGESTUREINFO__;
pub const GESTUREINFO = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    dwID: DWORD,
    hwndTarget: HWND,
    ptsLocation: POINTS,
    dwInstanceID: DWORD,
    dwSequenceID: DWORD,
    ullArguments: ULONGLONG,
    cbExtraArgs: UINT,
};

pub const PGESTUREINFO = ?*GESTUREINFO;
pub const PCGESTUREINFO = ?*const GESTUREINFO;
pub const GESTURENOTIFYSTRUCT = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
    hwndTarget: HWND,
    ptsLocation: POINTS,
    dwInstanceID: DWORD,
};

pub const PGESTURENOTIFYSTRUCT = ?*GESTURENOTIFYSTRUCT;
pub const GESTURECONFIG = extern struct {
    dwID: DWORD,
    dwWant: DWORD,
    dwBlock: DWORD,
};

pub const PGESTURECONFIG = ?*GESTURECONFIG;
pub const INPUT_MESSAGE_DEVICE_TYPE = c_int;

pub const INPUT_MESSAGE_ORIGIN_ID = c_int;

pub const INPUT_MESSAGE_SOURCE = extern struct {
    deviceType: INPUT_MESSAGE_DEVICE_TYPE,
    originId: INPUT_MESSAGE_ORIGIN_ID,
};

pub const AR_STATE = c_int;

pub const PAR_STATE = ?*AR_STATE;
pub const ORIENTATION_PREFERENCE = c_int;

pub const LGRPID = DWORD;
pub const LCTYPE = DWORD;
pub const CALTYPE = DWORD;
pub const CALID = DWORD;
pub const cpinfo = extern struct {
    MaxCharSize: UINT,
    DefaultChar: [2]BYTE,
    LeadByte: [12]BYTE,
};
pub const CPINFO = cpinfo;
pub const LPCPINFO = ?*cpinfo;
pub const cpinfoexA = extern struct {
    MaxCharSize: UINT,
    DefaultChar: [2]BYTE,
    LeadByte: [12]BYTE,
    UnicodeDefaultChar: WCHAR,
    CodePage: UINT,
    CodePageName: [260]CHAR,
};
pub const CPINFOEXA = cpinfoexA;
pub const LPCPINFOEXA = ?*cpinfoexA;
pub const cpinfoexW = extern struct {
    MaxCharSize: UINT,
    DefaultChar: [2]BYTE,
    LeadByte: [12]BYTE,
    UnicodeDefaultChar: WCHAR,
    CodePage: UINT,
    CodePageName: [260]WCHAR,
};
pub const CPINFOEXW = cpinfoexW;
pub const LPCPINFOEXW = ?*cpinfoexW;
pub const numberfmtA = extern struct {
    NumDigits: UINT,
    LeadingZero: UINT,
    Grouping: UINT,
    lpDecimalSep: LPSTR,
    lpThousandSep: LPSTR,
    NegativeOrder: UINT,
};
pub const NUMBERFMTA = numberfmtA;
pub const LPNUMBERFMTA = ?*numberfmtA;
pub const numberfmtW = extern struct {
    NumDigits: UINT,
    LeadingZero: UINT,
    Grouping: UINT,
    lpDecimalSep: LPWSTR,
    lpThousandSep: LPWSTR,
    NegativeOrder: UINT,
};
pub const NUMBERFMTW = numberfmtW;
pub const LPNUMBERFMTW = ?*numberfmtW;
pub const currencyfmtA = extern struct {
    NumDigits: UINT,
    LeadingZero: UINT,
    Grouping: UINT,
    lpDecimalSep: LPSTR,
    lpThousandSep: LPSTR,
    NegativeOrder: UINT,
    PositiveOrder: UINT,
    lpCurrencySymbol: LPSTR,
};
pub const CURRENCYFMTA = currencyfmtA;
pub const LPCURRENCYFMTA = ?*currencyfmtA;
pub const currencyfmtW = extern struct {
    NumDigits: UINT,
    LeadingZero: UINT,
    Grouping: UINT,
    lpDecimalSep: LPWSTR,
    lpThousandSep: LPWSTR,
    NegativeOrder: UINT,
    PositiveOrder: UINT,
    lpCurrencySymbol: LPWSTR,
};
pub const CURRENCYFMTW = currencyfmtW;
pub const LPCURRENCYFMTW = ?*currencyfmtW;
pub const SYSNLS_FUNCTION = c_int;
pub const NLS_FUNCTION = DWORD;
pub const nlsversioninfo = extern struct {
    dwNLSVersionInfoSize: DWORD,
    dwNLSVersion: DWORD,
    dwDefinedVersion: DWORD,
    dwEffectiveId: DWORD,
    guidCustomVersion: GUID,
};
pub const NLSVERSIONINFO = nlsversioninfo;
pub const LPNLSVERSIONINFO = ?*nlsversioninfo;
pub const nlsversioninfoex = extern struct {
    dwNLSVersionInfoSize: DWORD,
    dwNLSVersion: DWORD,
    dwDefinedVersion: DWORD,
    dwEffectiveId: DWORD,
    guidCustomVersion: GUID,
};
pub const NLSVERSIONINFOEX = nlsversioninfoex;
pub const LPNLSVERSIONINFOEX = ?*nlsversioninfoex;
pub const GEOTYPE = DWORD;
pub const GEOCLASS = DWORD;
pub const GEOID = LONG;
pub const SYSGEOTYPE = c_int;
pub const SYSGEOCLASS = c_int;
pub const NORM_FORM = c_int;

pub const LANGUAGEGROUP_ENUMPROCA = ?extern fn(LGRPID, LPSTR, LPSTR, DWORD, LONG_PTR) BOOL;
pub const LANGGROUPLOCALE_ENUMPROCA = ?extern fn(LGRPID, LCID, LPSTR, LONG_PTR) BOOL;
pub const UILANGUAGE_ENUMPROCA = ?extern fn(LPSTR, LONG_PTR) BOOL;
pub const CODEPAGE_ENUMPROCA = ?extern fn(LPSTR) BOOL;
pub const DATEFMT_ENUMPROCA = ?extern fn(LPSTR) BOOL;
pub const DATEFMT_ENUMPROCEXA = ?extern fn(LPSTR, CALID) BOOL;
pub const TIMEFMT_ENUMPROCA = ?extern fn(LPSTR) BOOL;
pub const CALINFO_ENUMPROCA = ?extern fn(LPSTR) BOOL;
pub const CALINFO_ENUMPROCEXA = ?extern fn(LPSTR, CALID) BOOL;
pub const LOCALE_ENUMPROCA = ?extern fn(LPSTR) BOOL;
pub const LOCALE_ENUMPROCW = ?extern fn(LPWSTR) BOOL;
pub const LANGUAGEGROUP_ENUMPROCW = ?extern fn(LGRPID, LPWSTR, LPWSTR, DWORD, LONG_PTR) BOOL;
pub const LANGGROUPLOCALE_ENUMPROCW = ?extern fn(LGRPID, LCID, LPWSTR, LONG_PTR) BOOL;
pub const UILANGUAGE_ENUMPROCW = ?extern fn(LPWSTR, LONG_PTR) BOOL;
pub const CODEPAGE_ENUMPROCW = ?extern fn(LPWSTR) BOOL;
pub const DATEFMT_ENUMPROCW = ?extern fn(LPWSTR) BOOL;
pub const DATEFMT_ENUMPROCEXW = ?extern fn(LPWSTR, CALID) BOOL;
pub const TIMEFMT_ENUMPROCW = ?extern fn(LPWSTR) BOOL;
pub const CALINFO_ENUMPROCW = ?extern fn(LPWSTR) BOOL;
pub const CALINFO_ENUMPROCEXW = ?extern fn(LPWSTR, CALID) BOOL;
pub const GEO_ENUMPROC = ?extern fn(GEOID) BOOL;
pub const GEO_ENUMNAMEPROC = ?extern fn(PWSTR, LPARAM) BOOL;
pub const FILEMUIINFO = extern struct {
    dwSize: DWORD,
    dwVersion: DWORD,
    dwFileType: DWORD,
    pChecksum: [16]BYTE,
    pServiceChecksum: [16]BYTE,
    dwLanguageNameOffset: DWORD,
    dwTypeIDMainSize: DWORD,
    dwTypeIDMainOffset: DWORD,
    dwTypeNameMainOffset: DWORD,
    dwTypeIDMUISize: DWORD,
    dwTypeIDMUIOffset: DWORD,
    dwTypeNameMUIOffset: DWORD,
    abBuffer: [8]BYTE,
};

pub const PFILEMUIINFO = ?*FILEMUIINFO;
pub const CALINFO_ENUMPROCEXEX = ?extern fn(LPWSTR, CALID, LPWSTR, LPARAM) BOOL;
pub const DATEFMT_ENUMPROCEXEX = ?extern fn(LPWSTR, CALID, LPARAM) BOOL;
pub const TIMEFMT_ENUMPROCEX = ?extern fn(LPWSTR, LPARAM) BOOL;
pub const LOCALE_ENUMPROCEX = ?extern fn(LPWSTR, DWORD, LPARAM) BOOL;
pub const COORD = extern struct {
    X: SHORT,
    Y: SHORT,
};

pub const PCOORD = ?*COORD;
pub const SMALL_RECT = extern struct {
    Left: SHORT,
    Top: SHORT,
    Right: SHORT,
    Bottom: SHORT,
};

pub const PSMALL_RECT = ?*SMALL_RECT;
pub const KEY_EVENT_RECORD = extern struct {
    bKeyDown: BOOL,
    wRepeatCount: WORD,
    wVirtualKeyCode: WORD,
    wVirtualScanCode: WORD,
    uChar: extern union {
        UnicodeChar: WCHAR,
        AsciiChar: CHAR,
    },
    dwControlKeyState: DWORD,
};

pub const PKEY_EVENT_RECORD = ?*KEY_EVENT_RECORD;
pub const MOUSE_EVENT_RECORD = extern struct {
    dwMousePosition: COORD,
    dwButtonState: DWORD,
    dwControlKeyState: DWORD,
    dwEventFlags: DWORD,
};

pub const PMOUSE_EVENT_RECORD = ?*MOUSE_EVENT_RECORD;
pub const WINDOW_BUFFER_SIZE_RECORD = extern struct {
    dwSize: COORD,
};

pub const PWINDOW_BUFFER_SIZE_RECORD = ?*WINDOW_BUFFER_SIZE_RECORD;
pub const MENU_EVENT_RECORD = extern struct {
    dwCommandId: UINT,
};

pub const PMENU_EVENT_RECORD = ?*MENU_EVENT_RECORD;
pub const FOCUS_EVENT_RECORD = extern struct {
    bSetFocus: BOOL,
};

pub const PFOCUS_EVENT_RECORD = ?*FOCUS_EVENT_RECORD;
pub const INPUT_RECORD = extern struct {
    EventType: WORD,
    Event: extern union {
        KeyEvent: KEY_EVENT_RECORD,
        MouseEvent: MOUSE_EVENT_RECORD,
        WindowBufferSizeEvent: WINDOW_BUFFER_SIZE_RECORD,
        MenuEvent: MENU_EVENT_RECORD,
        FocusEvent: FOCUS_EVENT_RECORD,
    },
};

pub const PINPUT_RECORD = ?*INPUT_RECORD;
pub const CHAR_INFO = extern struct {
    Char: extern union {
        UnicodeChar: WCHAR,
        AsciiChar: CHAR,
    },
    Attributes: WORD,
};

pub const PCHAR_INFO = ?*CHAR_INFO;
pub const CONSOLE_SCREEN_BUFFER_INFO = extern struct {
    dwSize: COORD,
    dwCursorPosition: COORD,
    wAttributes: WORD,
    srWindow: SMALL_RECT,
    dwMaximumWindowSize: COORD,
};

pub const PCONSOLE_SCREEN_BUFFER_INFO = ?*CONSOLE_SCREEN_BUFFER_INFO;
pub const CONSOLE_SCREEN_BUFFER_INFOEX = extern struct {
    cbSize: ULONG,
    dwSize: COORD,
    dwCursorPosition: COORD,
    wAttributes: WORD,
    srWindow: SMALL_RECT,
    dwMaximumWindowSize: COORD,
    wPopupAttributes: WORD,
    bFullscreenSupported: BOOL,
    ColorTable: [16]COLORREF,
};

pub const PCONSOLE_SCREEN_BUFFER_INFOEX = ?*CONSOLE_SCREEN_BUFFER_INFOEX;
pub const CONSOLE_CURSOR_INFO = extern struct {
    dwSize: DWORD,
    bVisible: BOOL,
};

pub const PCONSOLE_CURSOR_INFO = ?*CONSOLE_CURSOR_INFO;
pub const CONSOLE_FONT_INFO = extern struct {
    nFont: DWORD,
    dwFontSize: COORD,
};

pub const PCONSOLE_FONT_INFO = ?*CONSOLE_FONT_INFO;
pub const CONSOLE_FONT_INFOEX = extern struct {
    cbSize: ULONG,
    nFont: DWORD,
    dwFontSize: COORD,
    FontFamily: UINT,
    FontWeight: UINT,
    FaceName: [32]WCHAR,
};

pub const PCONSOLE_FONT_INFOEX = ?*CONSOLE_FONT_INFOEX;
pub const CONSOLE_HISTORY_INFO = extern struct {
    cbSize: UINT,
    HistoryBufferSize: UINT,
    NumberOfHistoryBuffers: UINT,
    dwFlags: DWORD,
};

pub const PCONSOLE_HISTORY_INFO = ?*CONSOLE_HISTORY_INFO;
pub const CONSOLE_SELECTION_INFO = extern struct {
    dwFlags: DWORD,
    dwSelectionAnchor: COORD,
    srSelection: SMALL_RECT,
};

pub const PCONSOLE_SELECTION_INFO = ?*CONSOLE_SELECTION_INFO;
pub const PHANDLER_ROUTINE = ?extern fn(DWORD) BOOL;
pub const CONSOLE_READCONSOLE_CONTROL = extern struct {
    nLength: ULONG,
    nInitialChars: ULONG,
    dwCtrlWakeupMask: ULONG,
    dwControlKeyState: ULONG,
};

pub const PCONSOLE_READCONSOLE_CONTROL = ?*CONSOLE_READCONSOLE_CONTROL;
pub const VS_FIXEDFILEINFO = extern struct {
    dwSignature: DWORD,
    dwStrucVersion: DWORD,
    dwFileVersionMS: DWORD,
    dwFileVersionLS: DWORD,
    dwProductVersionMS: DWORD,
    dwProductVersionLS: DWORD,
    dwFileFlagsMask: DWORD,
    dwFileFlags: DWORD,
    dwFileOS: DWORD,
    dwFileType: DWORD,
    dwFileSubtype: DWORD,
    dwFileDateMS: DWORD,
    dwFileDateLS: DWORD,
};

pub const LSTATUS = LONG;
pub const REGSAM = ACCESS_MASK;
pub const val_context = extern struct {
    valuelen: c_int,
    value_context: LPVOID,
    val_buff_ptr: LPVOID,
};
pub const PVALCONTEXT = ?*val_context;
pub const pvalueA = extern struct {
    pv_valuename: LPSTR,
    pv_valuelen: c_int,
    pv_value_context: LPVOID,
    pv_type: DWORD,
};
pub const PVALUEA = pvalueA;
pub const PPVALUEA = ?*pvalueA;
pub const pvalueW = extern struct {
    pv_valuename: LPWSTR,
    pv_valuelen: c_int,
    pv_value_context: LPVOID,
    pv_type: DWORD,
};
pub const PVALUEW = pvalueW;
pub const PPVALUEW = ?*pvalueW;
pub const QUERYHANDLER = extern fn(LPVOID, PVALCONTEXT, DWORD, LPVOID, ?*DWORD, DWORD) DWORD;
pub const PQUERYHANDLER = ?*QUERYHANDLER;
pub const provider_info = extern struct {
    pi_R0_1val: PQUERYHANDLER,
    pi_R0_allvals: PQUERYHANDLER,
    pi_R3_1val: PQUERYHANDLER,
    pi_R3_allvals: PQUERYHANDLER,
    pi_flags: DWORD,
    pi_key_context: LPVOID,
};
pub const REG_PROVIDER = provider_info;
pub const PPROVIDER = ?*provider_info;
pub const value_entA = extern struct {
    ve_valuename: LPSTR,
    ve_valuelen: DWORD,
    ve_valueptr: DWORD_PTR,
    ve_type: DWORD,
};
pub const VALENTA = value_entA;
pub const PVALENTA = ?*value_entA;
pub const value_entW = extern struct {
    ve_valuename: LPWSTR,
    ve_valuelen: DWORD,
    ve_valueptr: DWORD_PTR,
    ve_type: DWORD,
};
pub const VALENTW = value_entW;
pub const PVALENTW = ?*value_entW;
pub const NETRESOURCEA = extern struct {
    dwScope: DWORD,
    dwType: DWORD,
    dwDisplayType: DWORD,
    dwUsage: DWORD,
    lpLocalName: LPSTR,
    lpRemoteName: LPSTR,
    lpComment: LPSTR,
    lpProvider: LPSTR,
};

pub const LPNETRESOURCEA = ?*NETRESOURCEA;
pub const NETRESOURCEW = extern struct {
    dwScope: DWORD,
    dwType: DWORD,
    dwDisplayType: DWORD,
    dwUsage: DWORD,
    lpLocalName: LPWSTR,
    lpRemoteName: LPWSTR,
    lpComment: LPWSTR,
    lpProvider: LPWSTR,
};

pub const LPNETRESOURCEW = ?*NETRESOURCEW;
pub const CONNECTDLGSTRUCTA = extern struct {
    cbStructure: DWORD,
    hwndOwner: HWND,
    lpConnRes: LPNETRESOURCEA,
    dwFlags: DWORD,
    dwDevNum: DWORD,
};

pub const LPCONNECTDLGSTRUCTA = ?*CONNECTDLGSTRUCTA;
pub const CONNECTDLGSTRUCTW = extern struct {
    cbStructure: DWORD,
    hwndOwner: HWND,
    lpConnRes: LPNETRESOURCEW,
    dwFlags: DWORD,
    dwDevNum: DWORD,
};

pub const LPCONNECTDLGSTRUCTW = ?*CONNECTDLGSTRUCTW;
pub const DISCDLGSTRUCTA = extern struct {
    cbStructure: DWORD,
    hwndOwner: HWND,
    lpLocalName: LPSTR,
    lpRemoteName: LPSTR,
    dwFlags: DWORD,
};

pub const LPDISCDLGSTRUCTA = ?*DISCDLGSTRUCTA;
pub const DISCDLGSTRUCTW = extern struct {
    cbStructure: DWORD,
    hwndOwner: HWND,
    lpLocalName: LPWSTR,
    lpRemoteName: LPWSTR,
    dwFlags: DWORD,
};

pub const LPDISCDLGSTRUCTW = ?*DISCDLGSTRUCTW;
pub const UNIVERSAL_NAME_INFOA = extern struct {
    lpUniversalName: LPSTR,
};

pub const LPUNIVERSAL_NAME_INFOA = ?*UNIVERSAL_NAME_INFOA;
pub const UNIVERSAL_NAME_INFOW = extern struct {
    lpUniversalName: LPWSTR,
};

pub const LPUNIVERSAL_NAME_INFOW = ?*UNIVERSAL_NAME_INFOW;
pub const REMOTE_NAME_INFOA = extern struct {
    lpUniversalName: LPSTR,
    lpConnectionName: LPSTR,
    lpRemainingPath: LPSTR,
};

pub const LPREMOTE_NAME_INFOA = ?*REMOTE_NAME_INFOA;
pub const REMOTE_NAME_INFOW = extern struct {
    lpUniversalName: LPWSTR,
    lpConnectionName: LPWSTR,
    lpRemainingPath: LPWSTR,
};

pub const LPREMOTE_NAME_INFOW = ?*REMOTE_NAME_INFOW;
pub const NETINFOSTRUCT = extern struct {
    cbStructure: DWORD,
    dwProviderVersion: DWORD,
    dwStatus: DWORD,
    dwCharacteristics: DWORD,
    dwHandle: ULONG_PTR,
    wNetType: WORD,
    dwPrinters: DWORD,
    dwDrives: DWORD,
};

pub const LPNETINFOSTRUCT = ?*NETINFOSTRUCT;
pub const NETCONNECTINFOSTRUCT = extern struct {
    cbStructure: DWORD,
    dwFlags: DWORD,
    dwSpeed: DWORD,
    dwDelay: DWORD,
    dwOptDataSize: DWORD,
};

pub const LPNETCONNECTINFOSTRUCT = ?*NETCONNECTINFOSTRUCT;
pub const DDEACK = @OpaqueType();
pub const DDEADVISE = @OpaqueType();
pub const DDEDATA = @OpaqueType();
pub const DDEPOKE = @OpaqueType();
pub const DDELN = @OpaqueType();
pub const DDEUP = @OpaqueType();
pub const HCONVLIST__ = extern struct {
    unused: c_int,
};
pub const HCONVLIST = ?*HCONVLIST__;
pub const HCONV__ = extern struct {
    unused: c_int,
};
pub const HCONV = ?*HCONV__;
pub const HSZ__ = extern struct {
    unused: c_int,
};
pub const HSZ = ?*HSZ__;
pub const HDDEDATA__ = extern struct {
    unused: c_int,
};
pub const HDDEDATA = ?*HDDEDATA__;
pub const HSZPAIR = extern struct {
    hszSvc: HSZ,
    hszTopic: HSZ,
};

pub const PHSZPAIR = ?*HSZPAIR;
pub const CONVCONTEXT = extern struct {
    cb: UINT,
    wFlags: UINT,
    wCountryID: UINT,
    iCodePage: c_int,
    dwLangID: DWORD,
    dwSecurity: DWORD,
    qos: SECURITY_QUALITY_OF_SERVICE,
};

pub const PCONVCONTEXT = ?*CONVCONTEXT;
pub const CONVINFO = extern struct {
    cb: DWORD,
    hUser: DWORD_PTR,
    hConvPartner: HCONV,
    hszSvcPartner: HSZ,
    hszServiceReq: HSZ,
    hszTopic: HSZ,
    hszItem: HSZ,
    wFmt: UINT,
    wType: UINT,
    wStatus: UINT,
    wConvst: UINT,
    wLastError: UINT,
    hConvList: HCONVLIST,
    ConvCtxt: CONVCONTEXT,
    hwnd: HWND,
    hwndPartner: HWND,
};

pub const PCONVINFO = ?*CONVINFO;
pub const FNCALLBACK = extern fn(UINT, UINT, HCONV, HSZ, HSZ, HDDEDATA, ULONG_PTR, ULONG_PTR) HDDEDATA;
pub const PFNCALLBACK = ?extern fn(UINT, UINT, HCONV, HSZ, HSZ, HDDEDATA, ULONG_PTR, ULONG_PTR) HDDEDATA;
pub const DDEML_MSG_HOOK_DATA = extern struct {
    uiLo: UINT_PTR,
    uiHi: UINT_PTR,
    cbData: DWORD,
    Data: [8]DWORD,
};

pub const PDDEML_MSG_HOOK_DATA = ?*DDEML_MSG_HOOK_DATA;
pub const MONMSGSTRUCT = extern struct {
    cb: UINT,
    hwndTo: HWND,
    dwTime: DWORD,
    hTask: HANDLE,
    wMsg: UINT,
    wParam: WPARAM,
    lParam: LPARAM,
    dmhd: DDEML_MSG_HOOK_DATA,
};

pub const PMONMSGSTRUCT = ?*MONMSGSTRUCT;
pub const MONCBSTRUCT = extern struct {
    cb: UINT,
    dwTime: DWORD,
    hTask: HANDLE,
    dwRet: DWORD,
    wType: UINT,
    wFmt: UINT,
    hConv: HCONV,
    hsz1: HSZ,
    hsz2: HSZ,
    hData: HDDEDATA,
    dwData1: ULONG_PTR,
    dwData2: ULONG_PTR,
    cc: CONVCONTEXT,
    cbData: DWORD,
    Data: [8]DWORD,
};

pub const PMONCBSTRUCT = ?*MONCBSTRUCT;
pub const MONHSZSTRUCTA = extern struct {
    cb: UINT,
    fsAction: BOOL,
    dwTime: DWORD,
    hsz: HSZ,
    hTask: HANDLE,
    str: [1]CHAR,
};

pub const PMONHSZSTRUCTA = ?*MONHSZSTRUCTA;
pub const MONHSZSTRUCTW = extern struct {
    cb: UINT,
    fsAction: BOOL,
    dwTime: DWORD,
    hsz: HSZ,
    hTask: HANDLE,
    str: [1]WCHAR,
};

pub const PMONHSZSTRUCTW = ?*MONHSZSTRUCTW;
pub const MONERRSTRUCT = extern struct {
    cb: UINT,
    wLastError: UINT,
    dwTime: DWORD,
    hTask: HANDLE,
};

pub const PMONERRSTRUCT = ?*MONERRSTRUCT;
pub const MONLINKSTRUCT = extern struct {
    cb: UINT,
    dwTime: DWORD,
    hTask: HANDLE,
    fEstablished: BOOL,
    fNoData: BOOL,
    hszSvc: HSZ,
    hszTopic: HSZ,
    hszItem: HSZ,
    wFmt: UINT,
    fServer: BOOL,
    hConvServer: HCONV,
    hConvClient: HCONV,
};

pub const PMONLINKSTRUCT = ?*MONLINKSTRUCT;
pub const MONCONVSTRUCT = extern struct {
    cb: UINT,
    fConnect: BOOL,
    dwTime: DWORD,
    hTask: HANDLE,
    hszSvc: HSZ,
    hszTopic: HSZ,
    hConvClient: HCONV,
    hConvServer: HCONV,
};

pub const PMONCONVSTRUCT = ?*MONCONVSTRUCT;
pub const CRGB = extern struct {
    bRed: BYTE,
    bGreen: BYTE,
    bBlue: BYTE,
    bExtra: BYTE,
};

pub const MMVERSION = UINT;
pub const MMRESULT = UINT;
pub const LPUINT = ?*UINT;
pub const mmtime_tag = extern struct {
    wType: UINT,
    u: extern union {
        ms: DWORD,
        sample: DWORD,
        cb: DWORD,
        ticks: DWORD,
        smpte: extern struct {
            hour: BYTE,
            min: BYTE,
            sec: BYTE,
            frame: BYTE,
            fps: BYTE,
            dummy: BYTE,
            pad: [2]BYTE,
        },
        midi: extern struct {
            songptrpos: DWORD,
        },
    },
};
pub const MMTIME = mmtime_tag;
pub const PMMTIME = ?*mmtime_tag;
pub const NPMMTIME = ?*mmtime_tag;
pub const LPMMTIME = ?*mmtime_tag;
pub const HDRVR__ = extern struct {
    unused: c_int,
};
pub const HDRVR = ?*HDRVR__;
pub const DRVCALLBACK = extern fn(HDRVR, UINT, DWORD_PTR, DWORD_PTR, DWORD_PTR) void;
pub const LPDRVCALLBACK = ?*DRVCALLBACK;
pub const PDRVCALLBACK = ?*DRVCALLBACK;
pub const MCIERROR = DWORD;
pub const MCIDEVICEID = UINT;
pub const YIELDPROC = ?extern fn(MCIDEVICEID, DWORD) UINT;
pub const MCI_GENERIC_PARMS = extern struct {
    dwCallback: DWORD_PTR,
};

pub const PMCI_GENERIC_PARMS = ?*MCI_GENERIC_PARMS;
pub const LPMCI_GENERIC_PARMS = ?*MCI_GENERIC_PARMS;
pub const MCI_OPEN_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCSTR,
    lpstrElementName: LPCSTR,
    lpstrAlias: LPCSTR,
};

pub const PMCI_OPEN_PARMSA = ?*MCI_OPEN_PARMSA;
pub const LPMCI_OPEN_PARMSA = ?*MCI_OPEN_PARMSA;
pub const MCI_OPEN_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCWSTR,
    lpstrElementName: LPCWSTR,
    lpstrAlias: LPCWSTR,
};

pub const PMCI_OPEN_PARMSW = ?*MCI_OPEN_PARMSW;
pub const LPMCI_OPEN_PARMSW = ?*MCI_OPEN_PARMSW;
pub const MCI_PLAY_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrom: DWORD,
    dwTo: DWORD,
};

pub const PMCI_PLAY_PARMS = ?*MCI_PLAY_PARMS;
pub const LPMCI_PLAY_PARMS = ?*MCI_PLAY_PARMS;
pub const MCI_SEEK_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwTo: DWORD,
};

pub const PMCI_SEEK_PARMS = ?*MCI_SEEK_PARMS;
pub const LPMCI_SEEK_PARMS = ?*MCI_SEEK_PARMS;
pub const MCI_STATUS_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwReturn: DWORD_PTR,
    dwItem: DWORD,
    dwTrack: DWORD,
};

pub const PMCI_STATUS_PARMS = ?*MCI_STATUS_PARMS;
pub const LPMCI_STATUS_PARMS = ?*MCI_STATUS_PARMS;
pub const MCI_INFO_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpstrReturn: LPSTR,
    dwRetSize: DWORD,
};

pub const LPMCI_INFO_PARMSA = ?*MCI_INFO_PARMSA;
pub const MCI_INFO_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpstrReturn: LPWSTR,
    dwRetSize: DWORD,
};

pub const LPMCI_INFO_PARMSW = ?*MCI_INFO_PARMSW;
pub const MCI_GETDEVCAPS_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwReturn: DWORD,
    dwItem: DWORD,
};

pub const PMCI_GETDEVCAPS_PARMS = ?*MCI_GETDEVCAPS_PARMS;
pub const LPMCI_GETDEVCAPS_PARMS = ?*MCI_GETDEVCAPS_PARMS;
pub const MCI_SYSINFO_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpstrReturn: LPSTR,
    dwRetSize: DWORD,
    dwNumber: DWORD,
    wDeviceType: UINT,
};

pub const PMCI_SYSINFO_PARMSA = ?*MCI_SYSINFO_PARMSA;
pub const LPMCI_SYSINFO_PARMSA = ?*MCI_SYSINFO_PARMSA;
pub const MCI_SYSINFO_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpstrReturn: LPWSTR,
    dwRetSize: DWORD,
    dwNumber: DWORD,
    wDeviceType: UINT,
};

pub const PMCI_SYSINFO_PARMSW = ?*MCI_SYSINFO_PARMSW;
pub const LPMCI_SYSINFO_PARMSW = ?*MCI_SYSINFO_PARMSW;
pub const MCI_SET_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwTimeFormat: DWORD,
    dwAudio: DWORD,
};

pub const PMCI_SET_PARMS = ?*MCI_SET_PARMS;
pub const LPMCI_SET_PARMS = ?*MCI_SET_PARMS;
pub const MCI_BREAK_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    nVirtKey: c_int,
    hwndBreak: HWND,
};

pub const PMCI_BREAK_PARMS = ?*MCI_BREAK_PARMS;
pub const LPMCI_BREAK_PARMS = ?*MCI_BREAK_PARMS;
pub const MCI_SAVE_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCSTR,
};

pub const PMCI_SAVE_PARMSA = ?*MCI_SAVE_PARMSA;
pub const LPMCI_SAVE_PARMSA = ?*MCI_SAVE_PARMSA;
pub const MCI_SAVE_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCWSTR,
};

pub const PMCI_SAVE_PARMSW = ?*MCI_SAVE_PARMSW;
pub const LPMCI_SAVE_PARMSW = ?*MCI_SAVE_PARMSW;
pub const MCI_LOAD_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCSTR,
};

pub const PMCI_LOAD_PARMSA = ?*MCI_LOAD_PARMSA;
pub const LPMCI_LOAD_PARMSA = ?*MCI_LOAD_PARMSA;
pub const MCI_LOAD_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCWSTR,
};

pub const PMCI_LOAD_PARMSW = ?*MCI_LOAD_PARMSW;
pub const LPMCI_LOAD_PARMSW = ?*MCI_LOAD_PARMSW;
pub const MCI_RECORD_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrom: DWORD,
    dwTo: DWORD,
};

pub const LPMCI_RECORD_PARMS = ?*MCI_RECORD_PARMS;
pub const MCI_VD_PLAY_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrom: DWORD,
    dwTo: DWORD,
    dwSpeed: DWORD,
};

pub const PMCI_VD_PLAY_PARMS = ?*MCI_VD_PLAY_PARMS;
pub const LPMCI_VD_PLAY_PARMS = ?*MCI_VD_PLAY_PARMS;
pub const MCI_VD_STEP_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrames: DWORD,
};

pub const PMCI_VD_STEP_PARMS = ?*MCI_VD_STEP_PARMS;
pub const LPMCI_VD_STEP_PARMS = ?*MCI_VD_STEP_PARMS;
pub const MCI_VD_ESCAPE_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpstrCommand: LPCSTR,
};

pub const PMCI_VD_ESCAPE_PARMSA = ?*MCI_VD_ESCAPE_PARMSA;
pub const LPMCI_VD_ESCAPE_PARMSA = ?*MCI_VD_ESCAPE_PARMSA;
pub const MCI_VD_ESCAPE_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpstrCommand: LPCWSTR,
};

pub const PMCI_VD_ESCAPE_PARMSW = ?*MCI_VD_ESCAPE_PARMSW;
pub const LPMCI_VD_ESCAPE_PARMSW = ?*MCI_VD_ESCAPE_PARMSW;
pub const MCI_WAVE_OPEN_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCSTR,
    lpstrElementName: LPCSTR,
    lpstrAlias: LPCSTR,
    dwBufferSeconds: DWORD,
};

pub const PMCI_WAVE_OPEN_PARMSA = ?*MCI_WAVE_OPEN_PARMSA;
pub const LPMCI_WAVE_OPEN_PARMSA = ?*MCI_WAVE_OPEN_PARMSA;
pub const MCI_WAVE_OPEN_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCWSTR,
    lpstrElementName: LPCWSTR,
    lpstrAlias: LPCWSTR,
    dwBufferSeconds: DWORD,
};

pub const PMCI_WAVE_OPEN_PARMSW = ?*MCI_WAVE_OPEN_PARMSW;
pub const LPMCI_WAVE_OPEN_PARMSW = ?*MCI_WAVE_OPEN_PARMSW;
pub const MCI_WAVE_DELETE_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrom: DWORD,
    dwTo: DWORD,
};

pub const PMCI_WAVE_DELETE_PARMS = ?*MCI_WAVE_DELETE_PARMS;
pub const LPMCI_WAVE_DELETE_PARMS = ?*MCI_WAVE_DELETE_PARMS;
pub const MCI_WAVE_SET_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwTimeFormat: DWORD,
    dwAudio: DWORD,
    wInput: UINT,
    wOutput: UINT,
    wFormatTag: WORD,
    wReserved2: WORD,
    nChannels: WORD,
    wReserved3: WORD,
    nSamplesPerSec: DWORD,
    nAvgBytesPerSec: DWORD,
    nBlockAlign: WORD,
    wReserved4: WORD,
    wBitsPerSample: WORD,
    wReserved5: WORD,
};

pub const PMCI_WAVE_SET_PARMS = ?*MCI_WAVE_SET_PARMS;
pub const LPMCI_WAVE_SET_PARMS = ?*MCI_WAVE_SET_PARMS;
pub const MCI_SEQ_SET_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwTimeFormat: DWORD,
    dwAudio: DWORD,
    dwTempo: DWORD,
    dwPort: DWORD,
    dwSlave: DWORD,
    dwMaster: DWORD,
    dwOffset: DWORD,
};

pub const PMCI_SEQ_SET_PARMS = ?*MCI_SEQ_SET_PARMS;
pub const LPMCI_SEQ_SET_PARMS = ?*MCI_SEQ_SET_PARMS;
pub const MCI_ANIM_OPEN_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCSTR,
    lpstrElementName: LPCSTR,
    lpstrAlias: LPCSTR,
    dwStyle: DWORD,
    hWndParent: HWND,
};

pub const PMCI_ANIM_OPEN_PARMSA = ?*MCI_ANIM_OPEN_PARMSA;
pub const LPMCI_ANIM_OPEN_PARMSA = ?*MCI_ANIM_OPEN_PARMSA;
pub const MCI_ANIM_OPEN_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCWSTR,
    lpstrElementName: LPCWSTR,
    lpstrAlias: LPCWSTR,
    dwStyle: DWORD,
    hWndParent: HWND,
};

pub const PMCI_ANIM_OPEN_PARMSW = ?*MCI_ANIM_OPEN_PARMSW;
pub const LPMCI_ANIM_OPEN_PARMSW = ?*MCI_ANIM_OPEN_PARMSW;
pub const MCI_ANIM_PLAY_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrom: DWORD,
    dwTo: DWORD,
    dwSpeed: DWORD,
};

pub const PMCI_ANIM_PLAY_PARMS = ?*MCI_ANIM_PLAY_PARMS;
pub const LPMCI_ANIM_PLAY_PARMS = ?*MCI_ANIM_PLAY_PARMS;
pub const MCI_ANIM_STEP_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    dwFrames: DWORD,
};

pub const PMCI_ANIM_STEP_PARMS = ?*MCI_ANIM_STEP_PARMS;
pub const LPMCI_ANIM_STEP_PARMS = ?*MCI_ANIM_STEP_PARMS;
pub const MCI_ANIM_WINDOW_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    hWnd: HWND,
    nCmdShow: UINT,
    lpstrText: LPCSTR,
};

pub const PMCI_ANIM_WINDOW_PARMSA = ?*MCI_ANIM_WINDOW_PARMSA;
pub const LPMCI_ANIM_WINDOW_PARMSA = ?*MCI_ANIM_WINDOW_PARMSA;
pub const MCI_ANIM_WINDOW_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    hWnd: HWND,
    nCmdShow: UINT,
    lpstrText: LPCWSTR,
};

pub const PMCI_ANIM_WINDOW_PARMSW = ?*MCI_ANIM_WINDOW_PARMSW;
pub const LPMCI_ANIM_WINDOW_PARMSW = ?*MCI_ANIM_WINDOW_PARMSW;
pub const MCI_ANIM_RECT_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    rc: RECT,
};

pub const PMCI_ANIM_RECT_PARMS = ?*MCI_ANIM_RECT_PARMS;
pub const LPMCI_ANIM_RECT_PARMS = ?*MCI_ANIM_RECT_PARMS;
pub const MCI_ANIM_UPDATE_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    rc: RECT,
    hDC: HDC,
};

pub const PMCI_ANIM_UPDATE_PARMS = ?*MCI_ANIM_UPDATE_PARMS;
pub const LPMCI_ANIM_UPDATE_PARMS = ?*MCI_ANIM_UPDATE_PARMS;
pub const MCI_OVLY_OPEN_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCSTR,
    lpstrElementName: LPCSTR,
    lpstrAlias: LPCSTR,
    dwStyle: DWORD,
    hWndParent: HWND,
};

pub const PMCI_OVLY_OPEN_PARMSA = ?*MCI_OVLY_OPEN_PARMSA;
pub const LPMCI_OVLY_OPEN_PARMSA = ?*MCI_OVLY_OPEN_PARMSA;
pub const MCI_OVLY_OPEN_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    wDeviceID: MCIDEVICEID,
    lpstrDeviceType: LPCWSTR,
    lpstrElementName: LPCWSTR,
    lpstrAlias: LPCWSTR,
    dwStyle: DWORD,
    hWndParent: HWND,
};

pub const PMCI_OVLY_OPEN_PARMSW = ?*MCI_OVLY_OPEN_PARMSW;
pub const LPMCI_OVLY_OPEN_PARMSW = ?*MCI_OVLY_OPEN_PARMSW;
pub const MCI_OVLY_WINDOW_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    hWnd: HWND,
    nCmdShow: UINT,
    lpstrText: LPCSTR,
};

pub const PMCI_OVLY_WINDOW_PARMSA = ?*MCI_OVLY_WINDOW_PARMSA;
pub const LPMCI_OVLY_WINDOW_PARMSA = ?*MCI_OVLY_WINDOW_PARMSA;
pub const MCI_OVLY_WINDOW_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    hWnd: HWND,
    nCmdShow: UINT,
    lpstrText: LPCWSTR,
};

pub const PMCI_OVLY_WINDOW_PARMSW = ?*MCI_OVLY_WINDOW_PARMSW;
pub const LPMCI_OVLY_WINDOW_PARMSW = ?*MCI_OVLY_WINDOW_PARMSW;
pub const MCI_OVLY_RECT_PARMS = extern struct {
    dwCallback: DWORD_PTR,
    rc: RECT,
};

pub const PMCI_OVLY_RECT_PARMS = ?*MCI_OVLY_RECT_PARMS;
pub const LPMCI_OVLY_RECT_PARMS = ?*MCI_OVLY_RECT_PARMS;
pub const MCI_OVLY_SAVE_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCSTR,
    rc: RECT,
};

pub const PMCI_OVLY_SAVE_PARMSA = ?*MCI_OVLY_SAVE_PARMSA;
pub const LPMCI_OVLY_SAVE_PARMSA = ?*MCI_OVLY_SAVE_PARMSA;
pub const MCI_OVLY_SAVE_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCWSTR,
    rc: RECT,
};

pub const PMCI_OVLY_SAVE_PARMSW = ?*MCI_OVLY_SAVE_PARMSW;
pub const LPMCI_OVLY_SAVE_PARMSW = ?*MCI_OVLY_SAVE_PARMSW;
pub const MCI_OVLY_LOAD_PARMSA = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCSTR,
    rc: RECT,
};

pub const PMCI_OVLY_LOAD_PARMSA = ?*MCI_OVLY_LOAD_PARMSA;
pub const LPMCI_OVLY_LOAD_PARMSA = ?*MCI_OVLY_LOAD_PARMSA;
pub const MCI_OVLY_LOAD_PARMSW = extern struct {
    dwCallback: DWORD_PTR,
    lpfilename: LPCWSTR,
    rc: RECT,
};

pub const PMCI_OVLY_LOAD_PARMSW = ?*MCI_OVLY_LOAD_PARMSW;
pub const LPMCI_OVLY_LOAD_PARMSW = ?*MCI_OVLY_LOAD_PARMSW;
pub const DRVCONFIGINFOEX = extern struct {
    dwDCISize: DWORD,
    lpszDCISectionName: LPCWSTR,
    lpszDCIAliasName: LPCWSTR,
    dnDevNode: DWORD,
};

pub const PDRVCONFIGINFOEX = ?*DRVCONFIGINFOEX;
pub const NPDRVCONFIGINFOEX = ?*DRVCONFIGINFOEX;
pub const LPDRVCONFIGINFOEX = ?*DRVCONFIGINFOEX;
pub const DRVCONFIGINFO = extern struct {
    dwDCISize: DWORD,
    lpszDCISectionName: LPCWSTR,
    lpszDCIAliasName: LPCWSTR,
};

pub const PDRVCONFIGINFO = ?*DRVCONFIGINFO;
pub const NPDRVCONFIGINFO = ?*DRVCONFIGINFO;
pub const LPDRVCONFIGINFO = ?*DRVCONFIGINFO;
pub const DRIVERPROC = ?extern fn(DWORD_PTR, HDRVR, UINT, LPARAM, LPARAM) LRESULT;
pub const DRIVERMSGPROC = ?extern fn(DWORD, DWORD, DWORD_PTR, DWORD_PTR, DWORD_PTR) DWORD;
pub const FOURCC = DWORD;
pub const HPSTR = ?[*]u8;
pub const HMMIO__ = extern struct {
    unused: c_int,
};
pub const HMMIO = ?*HMMIO__;
pub const MMIOPROC = extern fn(LPSTR, UINT, LPARAM, LPARAM) LRESULT;
pub const LPMMIOPROC = ?*MMIOPROC;
pub const MMIOINFO = extern struct {
    dwFlags: DWORD,
    fccIOProc: FOURCC,
    pIOProc: LPMMIOPROC,
    wErrorRet: UINT,
    htask: HTASK,
    cchBuffer: LONG,
    pchBuffer: HPSTR,
    pchNext: HPSTR,
    pchEndRead: HPSTR,
    pchEndWrite: HPSTR,
    lBufOffset: LONG,
    lDiskOffset: LONG,
    adwInfo: [3]DWORD,
    dwReserved1: DWORD,
    dwReserved2: DWORD,
    hmmio: HMMIO,
};

pub const PMMIOINFO = ?*MMIOINFO;
pub const NPMMIOINFO = ?*MMIOINFO;
pub const LPMMIOINFO = ?*MMIOINFO;
pub const LPCMMIOINFO = ?*const MMIOINFO;
pub const MMCKINFO = extern struct {
    ckid: FOURCC,
    cksize: DWORD,
    fccType: FOURCC,
    dwDataOffset: DWORD,
    dwFlags: DWORD,
};

pub const PMMCKINFO = ?*MMCKINFO;
pub const NPMMCKINFO = ?*MMCKINFO;
pub const LPMMCKINFO = ?*MMCKINFO;
pub const LPCMMCKINFO = ?*const MMCKINFO;
pub const TIMECALLBACK = extern fn(UINT, UINT, DWORD_PTR, DWORD_PTR, DWORD_PTR) void;
pub const LPTIMECALLBACK = ?*TIMECALLBACK;
pub const HWAVE__ = extern struct {
    unused: c_int,
};
pub const HWAVE = ?*HWAVE__;
pub const HWAVEIN__ = extern struct {
    unused: c_int,
};
pub const HWAVEIN = ?*HWAVEIN__;
pub const HWAVEOUT__ = extern struct {
    unused: c_int,
};
pub const HWAVEOUT = ?*HWAVEOUT__;
pub const LPHWAVEIN = ?*HWAVEIN;
pub const LPHWAVEOUT = ?*HWAVEOUT;
pub const WAVECALLBACK = DRVCALLBACK;
pub const LPWAVECALLBACK = ?*WAVECALLBACK;
pub const wavehdr_tag = extern struct {
    lpData: LPSTR,
    dwBufferLength: DWORD,
    dwBytesRecorded: DWORD,
    dwUser: DWORD_PTR,
    dwFlags: DWORD,
    dwLoops: DWORD,
    lpNext: ?*wavehdr_tag,
    reserved: DWORD_PTR,
};
pub const WAVEHDR = wavehdr_tag;
pub const PWAVEHDR = ?*wavehdr_tag;
pub const NPWAVEHDR = ?*wavehdr_tag;
pub const LPWAVEHDR = ?*wavehdr_tag;
pub const WAVEOUTCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
};

pub const PWAVEOUTCAPSA = ?*WAVEOUTCAPSA;
pub const NPWAVEOUTCAPSA = ?*WAVEOUTCAPSA;
pub const LPWAVEOUTCAPSA = ?*WAVEOUTCAPSA;
pub const WAVEOUTCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
};

pub const PWAVEOUTCAPSW = ?*WAVEOUTCAPSW;
pub const NPWAVEOUTCAPSW = ?*WAVEOUTCAPSW;
pub const LPWAVEOUTCAPSW = ?*WAVEOUTCAPSW;
pub const WAVEOUTCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PWAVEOUTCAPS2A = ?*WAVEOUTCAPS2A;
pub const NPWAVEOUTCAPS2A = ?*WAVEOUTCAPS2A;
pub const LPWAVEOUTCAPS2A = ?*WAVEOUTCAPS2A;
pub const WAVEOUTCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PWAVEOUTCAPS2W = ?*WAVEOUTCAPS2W;
pub const NPWAVEOUTCAPS2W = ?*WAVEOUTCAPS2W;
pub const LPWAVEOUTCAPS2W = ?*WAVEOUTCAPS2W;
pub const WAVEINCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
};

pub const PWAVEINCAPSA = ?*WAVEINCAPSA;
pub const NPWAVEINCAPSA = ?*WAVEINCAPSA;
pub const LPWAVEINCAPSA = ?*WAVEINCAPSA;
pub const WAVEINCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
};

pub const PWAVEINCAPSW = ?*WAVEINCAPSW;
pub const NPWAVEINCAPSW = ?*WAVEINCAPSW;
pub const LPWAVEINCAPSW = ?*WAVEINCAPSW;
pub const WAVEINCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PWAVEINCAPS2A = ?*WAVEINCAPS2A;
pub const NPWAVEINCAPS2A = ?*WAVEINCAPS2A;
pub const LPWAVEINCAPS2A = ?*WAVEINCAPS2A;
pub const WAVEINCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    dwFormats: DWORD,
    wChannels: WORD,
    wReserved1: WORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PWAVEINCAPS2W = ?*WAVEINCAPS2W;
pub const NPWAVEINCAPS2W = ?*WAVEINCAPS2W;
pub const LPWAVEINCAPS2W = ?*WAVEINCAPS2W;
pub const waveformat_tag = extern struct {
    wFormatTag: WORD,
    nChannels: WORD,
    nSamplesPerSec: DWORD,
    nAvgBytesPerSec: DWORD,
    nBlockAlign: WORD,
};
pub const WAVEFORMAT = waveformat_tag;
pub const PWAVEFORMAT = ?*waveformat_tag;
pub const NPWAVEFORMAT = ?*waveformat_tag;
pub const LPWAVEFORMAT = ?*waveformat_tag;
pub const pcmwaveformat_tag = extern struct {
    wf: WAVEFORMAT,
    wBitsPerSample: WORD,
};
pub const PCMWAVEFORMAT = pcmwaveformat_tag;
pub const PPCMWAVEFORMAT = ?*pcmwaveformat_tag;
pub const NPPCMWAVEFORMAT = ?*pcmwaveformat_tag;
pub const LPPCMWAVEFORMAT = ?*pcmwaveformat_tag;
pub const tWAVEFORMATEX = extern struct {
    wFormatTag: WORD,
    nChannels: WORD,
    nSamplesPerSec: DWORD,
    nAvgBytesPerSec: DWORD,
    nBlockAlign: WORD,
    wBitsPerSample: WORD,
    cbSize: WORD,
};
pub const WAVEFORMATEX = tWAVEFORMATEX;
pub const PWAVEFORMATEX = ?*tWAVEFORMATEX;
pub const NPWAVEFORMATEX = ?*tWAVEFORMATEX;
pub const LPWAVEFORMATEX = ?*tWAVEFORMATEX;
pub const LPCWAVEFORMATEX = ?*const WAVEFORMATEX;
pub const HMIDI__ = extern struct {
    unused: c_int,
};
pub const HMIDI = ?*HMIDI__;
pub const HMIDIIN__ = extern struct {
    unused: c_int,
};
pub const HMIDIIN = ?*HMIDIIN__;
pub const HMIDIOUT__ = extern struct {
    unused: c_int,
};
pub const HMIDIOUT = ?*HMIDIOUT__;
pub const HMIDISTRM__ = extern struct {
    unused: c_int,
};
pub const HMIDISTRM = ?*HMIDISTRM__;
pub const LPHMIDI = ?*HMIDI;
pub const LPHMIDIIN = ?*HMIDIIN;
pub const LPHMIDIOUT = ?*HMIDIOUT;
pub const LPHMIDISTRM = ?*HMIDISTRM;
pub const MIDICALLBACK = DRVCALLBACK;
pub const LPMIDICALLBACK = ?*MIDICALLBACK;
pub const PATCHARRAY = [128]WORD;
pub const LPPATCHARRAY = ?*WORD;
pub const KEYARRAY = [128]WORD;
pub const LPKEYARRAY = ?*WORD;
pub const MIDIOUTCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    wTechnology: WORD,
    wVoices: WORD,
    wNotes: WORD,
    wChannelMask: WORD,
    dwSupport: DWORD,
};

pub const PMIDIOUTCAPSA = ?*MIDIOUTCAPSA;
pub const NPMIDIOUTCAPSA = ?*MIDIOUTCAPSA;
pub const LPMIDIOUTCAPSA = ?*MIDIOUTCAPSA;
pub const MIDIOUTCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    wTechnology: WORD,
    wVoices: WORD,
    wNotes: WORD,
    wChannelMask: WORD,
    dwSupport: DWORD,
};

pub const PMIDIOUTCAPSW = ?*MIDIOUTCAPSW;
pub const NPMIDIOUTCAPSW = ?*MIDIOUTCAPSW;
pub const LPMIDIOUTCAPSW = ?*MIDIOUTCAPSW;
pub const MIDIOUTCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    wTechnology: WORD,
    wVoices: WORD,
    wNotes: WORD,
    wChannelMask: WORD,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PMIDIOUTCAPS2A = ?*MIDIOUTCAPS2A;
pub const NPMIDIOUTCAPS2A = ?*MIDIOUTCAPS2A;
pub const LPMIDIOUTCAPS2A = ?*MIDIOUTCAPS2A;
pub const MIDIOUTCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    wTechnology: WORD,
    wVoices: WORD,
    wNotes: WORD,
    wChannelMask: WORD,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PMIDIOUTCAPS2W = ?*MIDIOUTCAPS2W;
pub const NPMIDIOUTCAPS2W = ?*MIDIOUTCAPS2W;
pub const LPMIDIOUTCAPS2W = ?*MIDIOUTCAPS2W;
pub const MIDIINCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    dwSupport: DWORD,
};

pub const PMIDIINCAPSA = ?*MIDIINCAPSA;
pub const NPMIDIINCAPSA = ?*MIDIINCAPSA;
pub const LPMIDIINCAPSA = ?*MIDIINCAPSA;
pub const MIDIINCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    dwSupport: DWORD,
};

pub const PMIDIINCAPSW = ?*MIDIINCAPSW;
pub const NPMIDIINCAPSW = ?*MIDIINCAPSW;
pub const LPMIDIINCAPSW = ?*MIDIINCAPSW;
pub const MIDIINCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PMIDIINCAPS2A = ?*MIDIINCAPS2A;
pub const NPMIDIINCAPS2A = ?*MIDIINCAPS2A;
pub const LPMIDIINCAPS2A = ?*MIDIINCAPS2A;
pub const MIDIINCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PMIDIINCAPS2W = ?*MIDIINCAPS2W;
pub const NPMIDIINCAPS2W = ?*MIDIINCAPS2W;
pub const LPMIDIINCAPS2W = ?*MIDIINCAPS2W;
pub const midihdr_tag = extern struct {
    lpData: LPSTR,
    dwBufferLength: DWORD,
    dwBytesRecorded: DWORD,
    dwUser: DWORD_PTR,
    dwFlags: DWORD,
    lpNext: ?*midihdr_tag,
    reserved: DWORD_PTR,
    dwOffset: DWORD,
    dwReserved: [8]DWORD_PTR,
};
pub const MIDIHDR = midihdr_tag;
pub const PMIDIHDR = ?*midihdr_tag;
pub const NPMIDIHDR = ?*midihdr_tag;
pub const LPMIDIHDR = ?*midihdr_tag;
pub const midievent_tag = extern struct {
    dwDeltaTime: DWORD,
    dwStreamID: DWORD,
    dwEvent: DWORD,
    dwParms: [1]DWORD,
};
pub const MIDIEVENT = midievent_tag;
pub const midistrmbuffver_tag = extern struct {
    dwVersion: DWORD,
    dwMid: DWORD,
    dwOEMVersion: DWORD,
};
pub const MIDISTRMBUFFVER = midistrmbuffver_tag;
pub const midiproptimediv_tag = extern struct {
    cbStruct: DWORD,
    dwTimeDiv: DWORD,
};
pub const MIDIPROPTIMEDIV = midiproptimediv_tag;
pub const LPMIDIPROPTIMEDIV = ?*midiproptimediv_tag;
pub const midiproptempo_tag = extern struct {
    cbStruct: DWORD,
    dwTempo: DWORD,
};
pub const MIDIPROPTEMPO = midiproptempo_tag;
pub const LPMIDIPROPTEMPO = ?*midiproptempo_tag;
pub const AUXCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    wTechnology: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
};

pub const PAUXCAPSA = ?*AUXCAPSA;
pub const NPAUXCAPSA = ?*AUXCAPSA;
pub const LPAUXCAPSA = ?*AUXCAPSA;
pub const AUXCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    wTechnology: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
};

pub const PAUXCAPSW = ?*AUXCAPSW;
pub const NPAUXCAPSW = ?*AUXCAPSW;
pub const LPAUXCAPSW = ?*AUXCAPSW;
pub const AUXCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    wTechnology: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PAUXCAPS2A = ?*AUXCAPS2A;
pub const NPAUXCAPS2A = ?*AUXCAPS2A;
pub const LPAUXCAPS2A = ?*AUXCAPS2A;
pub const AUXCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    wTechnology: WORD,
    wReserved1: WORD,
    dwSupport: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PAUXCAPS2W = ?*AUXCAPS2W;
pub const NPAUXCAPS2W = ?*AUXCAPS2W;
pub const LPAUXCAPS2W = ?*AUXCAPS2W;
pub const HMIXEROBJ__ = extern struct {
    unused: c_int,
};
pub const HMIXEROBJ = ?*HMIXEROBJ__;
pub const LPHMIXEROBJ = ?*HMIXEROBJ;
pub const HMIXER__ = extern struct {
    unused: c_int,
};
pub const HMIXER = ?*HMIXER__;
pub const LPHMIXER = ?*HMIXER;
pub const MIXERCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    fdwSupport: DWORD,
    cDestinations: DWORD,
};

pub const PMIXERCAPSA = ?*MIXERCAPSA;
pub const LPMIXERCAPSA = ?*MIXERCAPSA;
pub const MIXERCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    fdwSupport: DWORD,
    cDestinations: DWORD,
};

pub const PMIXERCAPSW = ?*MIXERCAPSW;
pub const LPMIXERCAPSW = ?*MIXERCAPSW;
pub const MIXERCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]CHAR,
    fdwSupport: DWORD,
    cDestinations: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PMIXERCAPS2A = ?*MIXERCAPS2A;
pub const LPMIXERCAPS2A = ?*MIXERCAPS2A;
pub const MIXERCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    vDriverVersion: MMVERSION,
    szPname: [32]WCHAR,
    fdwSupport: DWORD,
    cDestinations: DWORD,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PMIXERCAPS2W = ?*MIXERCAPS2W;
pub const LPMIXERCAPS2W = ?*MIXERCAPS2W;
pub const MIXERLINEA = extern struct {
    cbStruct: DWORD,
    dwDestination: DWORD,
    dwSource: DWORD,
    dwLineID: DWORD,
    fdwLine: DWORD,
    dwUser: DWORD_PTR,
    dwComponentType: DWORD,
    cChannels: DWORD,
    cConnections: DWORD,
    cControls: DWORD,
    szShortName: [16]CHAR,
    szName: [64]CHAR,
    Target: extern struct {
        dwType: DWORD,
        dwDeviceID: DWORD,
        wMid: WORD,
        wPid: WORD,
        vDriverVersion: MMVERSION,
        szPname: [32]CHAR,
    },
};

pub const PMIXERLINEA = ?*MIXERLINEA;
pub const LPMIXERLINEA = ?*MIXERLINEA;
pub const MIXERLINEW = extern struct {
    cbStruct: DWORD,
    dwDestination: DWORD,
    dwSource: DWORD,
    dwLineID: DWORD,
    fdwLine: DWORD,
    dwUser: DWORD_PTR,
    dwComponentType: DWORD,
    cChannels: DWORD,
    cConnections: DWORD,
    cControls: DWORD,
    szShortName: [16]WCHAR,
    szName: [64]WCHAR,
    Target: extern struct {
        dwType: DWORD,
        dwDeviceID: DWORD,
        wMid: WORD,
        wPid: WORD,
        vDriverVersion: MMVERSION,
        szPname: [32]WCHAR,
    },
};

pub const PMIXERLINEW = ?*MIXERLINEW;
pub const LPMIXERLINEW = ?*MIXERLINEW;
pub const MIXERCONTROLA = extern struct {
    cbStruct: DWORD,
    dwControlID: DWORD,
    dwControlType: DWORD,
    fdwControl: DWORD,
    cMultipleItems: DWORD,
    szShortName: [16]CHAR,
    szName: [64]CHAR,
    Bounds: extern union {
        s: extern struct {
            lMinimum: LONG,
            lMaximum: LONG,
        },
        s2: extern struct {
            dwMinimum: DWORD,
            dwMaximum: DWORD,
        },
        dwReserved: [6]DWORD,
    },
    Metrics: extern union {
        cSteps: DWORD,
        cbCustomData: DWORD,
        dwReserved: [6]DWORD,
    },
};

pub const PMIXERCONTROLA = ?*MIXERCONTROLA;
pub const LPMIXERCONTROLA = ?*MIXERCONTROLA;
pub const MIXERCONTROLW = extern struct {
    cbStruct: DWORD,
    dwControlID: DWORD,
    dwControlType: DWORD,
    fdwControl: DWORD,
    cMultipleItems: DWORD,
    szShortName: [16]WCHAR,
    szName: [64]WCHAR,
    Bounds: extern union {
        s: extern struct {
            lMinimum: LONG,
            lMaximum: LONG,
        },
        s2: extern struct {
            dwMinimum: DWORD,
            dwMaximum: DWORD,
        },
        dwReserved: [6]DWORD,
    },
    Metrics: extern union {
        cSteps: DWORD,
        cbCustomData: DWORD,
        dwReserved: [6]DWORD,
    },
};

pub const PMIXERCONTROLW = ?*MIXERCONTROLW;
pub const LPMIXERCONTROLW = ?*MIXERCONTROLW;
pub const MIXERLINECONTROLSA = extern struct {
    cbStruct: DWORD,
    dwLineID: DWORD,
    u: extern union {
        dwControlID: DWORD,
        dwControlType: DWORD,
    },
    cControls: DWORD,
    cbmxctrl: DWORD,
    pamxctrl: LPMIXERCONTROLA,
};

pub const PMIXERLINECONTROLSA = ?*MIXERLINECONTROLSA;
pub const LPMIXERLINECONTROLSA = ?*MIXERLINECONTROLSA;
pub const MIXERLINECONTROLSW = extern struct {
    cbStruct: DWORD,
    dwLineID: DWORD,
    u: extern union {
        dwControlID: DWORD,
        dwControlType: DWORD,
    },
    cControls: DWORD,
    cbmxctrl: DWORD,
    pamxctrl: LPMIXERCONTROLW,
};

pub const PMIXERLINECONTROLSW = ?*MIXERLINECONTROLSW;
pub const LPMIXERLINECONTROLSW = ?*MIXERLINECONTROLSW;
pub const tMIXERCONTROLDETAILS = extern struct {
    cbStruct: DWORD,
    dwControlID: DWORD,
    cChannels: DWORD,
    u: extern union {
        hwndOwner: HWND,
        cMultipleItems: DWORD,
    },
    cbDetails: DWORD,
    paDetails: LPVOID,
};
pub const MIXERCONTROLDETAILS = tMIXERCONTROLDETAILS;
pub const PMIXERCONTROLDETAILS = ?*tMIXERCONTROLDETAILS;
pub const LPMIXERCONTROLDETAILS = ?*tMIXERCONTROLDETAILS;
pub const MIXERCONTROLDETAILS_LISTTEXTA = extern struct {
    dwParam1: DWORD,
    dwParam2: DWORD,
    szName: [64]CHAR,
};

pub const PMIXERCONTROLDETAILS_LISTTEXTA = ?*MIXERCONTROLDETAILS_LISTTEXTA;
pub const LPMIXERCONTROLDETAILS_LISTTEXTA = ?*MIXERCONTROLDETAILS_LISTTEXTA;
pub const MIXERCONTROLDETAILS_LISTTEXTW = extern struct {
    dwParam1: DWORD,
    dwParam2: DWORD,
    szName: [64]WCHAR,
};

pub const PMIXERCONTROLDETAILS_LISTTEXTW = ?*MIXERCONTROLDETAILS_LISTTEXTW;
pub const LPMIXERCONTROLDETAILS_LISTTEXTW = ?*MIXERCONTROLDETAILS_LISTTEXTW;
pub const tMIXERCONTROLDETAILS_BOOLEAN = extern struct {
    fValue: LONG,
};
pub const MIXERCONTROLDETAILS_BOOLEAN = tMIXERCONTROLDETAILS_BOOLEAN;
pub const PMIXERCONTROLDETAILS_BOOLEAN = ?*tMIXERCONTROLDETAILS_BOOLEAN;
pub const LPMIXERCONTROLDETAILS_BOOLEAN = ?*tMIXERCONTROLDETAILS_BOOLEAN;
pub const tMIXERCONTROLDETAILS_SIGNED = extern struct {
    lValue: LONG,
};
pub const MIXERCONTROLDETAILS_SIGNED = tMIXERCONTROLDETAILS_SIGNED;
pub const PMIXERCONTROLDETAILS_SIGNED = ?*tMIXERCONTROLDETAILS_SIGNED;
pub const LPMIXERCONTROLDETAILS_SIGNED = ?*tMIXERCONTROLDETAILS_SIGNED;
pub const tMIXERCONTROLDETAILS_UNSIGNED = extern struct {
    dwValue: DWORD,
};
pub const MIXERCONTROLDETAILS_UNSIGNED = tMIXERCONTROLDETAILS_UNSIGNED;
pub const PMIXERCONTROLDETAILS_UNSIGNED = ?*tMIXERCONTROLDETAILS_UNSIGNED;
pub const LPMIXERCONTROLDETAILS_UNSIGNED = ?*tMIXERCONTROLDETAILS_UNSIGNED;
pub const timecaps_tag = extern struct {
    wPeriodMin: UINT,
    wPeriodMax: UINT,
};
pub const TIMECAPS = timecaps_tag;
pub const PTIMECAPS = ?*timecaps_tag;
pub const NPTIMECAPS = ?*timecaps_tag;
pub const LPTIMECAPS = ?*timecaps_tag;
pub const JOYCAPSA = extern struct {
    wMid: WORD,
    wPid: WORD,
    szPname: [32]CHAR,
    wXmin: UINT,
    wXmax: UINT,
    wYmin: UINT,
    wYmax: UINT,
    wZmin: UINT,
    wZmax: UINT,
    wNumButtons: UINT,
    wPeriodMin: UINT,
    wPeriodMax: UINT,
    wRmin: UINT,
    wRmax: UINT,
    wUmin: UINT,
    wUmax: UINT,
    wVmin: UINT,
    wVmax: UINT,
    wCaps: UINT,
    wMaxAxes: UINT,
    wNumAxes: UINT,
    wMaxButtons: UINT,
    szRegKey: [32]CHAR,
    szOEMVxD: [260]CHAR,
};

pub const PJOYCAPSA = ?*JOYCAPSA;
pub const NPJOYCAPSA = ?*JOYCAPSA;
pub const LPJOYCAPSA = ?*JOYCAPSA;
pub const JOYCAPSW = extern struct {
    wMid: WORD,
    wPid: WORD,
    szPname: [32]WCHAR,
    wXmin: UINT,
    wXmax: UINT,
    wYmin: UINT,
    wYmax: UINT,
    wZmin: UINT,
    wZmax: UINT,
    wNumButtons: UINT,
    wPeriodMin: UINT,
    wPeriodMax: UINT,
    wRmin: UINT,
    wRmax: UINT,
    wUmin: UINT,
    wUmax: UINT,
    wVmin: UINT,
    wVmax: UINT,
    wCaps: UINT,
    wMaxAxes: UINT,
    wNumAxes: UINT,
    wMaxButtons: UINT,
    szRegKey: [32]WCHAR,
    szOEMVxD: [260]WCHAR,
};

pub const PJOYCAPSW = ?*JOYCAPSW;
pub const NPJOYCAPSW = ?*JOYCAPSW;
pub const LPJOYCAPSW = ?*JOYCAPSW;
pub const JOYCAPS2A = extern struct {
    wMid: WORD,
    wPid: WORD,
    szPname: [32]CHAR,
    wXmin: UINT,
    wXmax: UINT,
    wYmin: UINT,
    wYmax: UINT,
    wZmin: UINT,
    wZmax: UINT,
    wNumButtons: UINT,
    wPeriodMin: UINT,
    wPeriodMax: UINT,
    wRmin: UINT,
    wRmax: UINT,
    wUmin: UINT,
    wUmax: UINT,
    wVmin: UINT,
    wVmax: UINT,
    wCaps: UINT,
    wMaxAxes: UINT,
    wNumAxes: UINT,
    wMaxButtons: UINT,
    szRegKey: [32]CHAR,
    szOEMVxD: [260]CHAR,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PJOYCAPS2A = ?*JOYCAPS2A;
pub const NPJOYCAPS2A = ?*JOYCAPS2A;
pub const LPJOYCAPS2A = ?*JOYCAPS2A;
pub const JOYCAPS2W = extern struct {
    wMid: WORD,
    wPid: WORD,
    szPname: [32]WCHAR,
    wXmin: UINT,
    wXmax: UINT,
    wYmin: UINT,
    wYmax: UINT,
    wZmin: UINT,
    wZmax: UINT,
    wNumButtons: UINT,
    wPeriodMin: UINT,
    wPeriodMax: UINT,
    wRmin: UINT,
    wRmax: UINT,
    wUmin: UINT,
    wUmax: UINT,
    wVmin: UINT,
    wVmax: UINT,
    wCaps: UINT,
    wMaxAxes: UINT,
    wNumAxes: UINT,
    wMaxButtons: UINT,
    szRegKey: [32]WCHAR,
    szOEMVxD: [260]WCHAR,
    ManufacturerGuid: GUID,
    ProductGuid: GUID,
    NameGuid: GUID,
};

pub const PJOYCAPS2W = ?*JOYCAPS2W;
pub const NPJOYCAPS2W = ?*JOYCAPS2W;
pub const LPJOYCAPS2W = ?*JOYCAPS2W;
pub const joyinfo_tag = extern struct {
    wXpos: UINT,
    wYpos: UINT,
    wZpos: UINT,
    wButtons: UINT,
};
pub const JOYINFO = joyinfo_tag;
pub const PJOYINFO = ?*joyinfo_tag;
pub const NPJOYINFO = ?*joyinfo_tag;
pub const LPJOYINFO = ?*joyinfo_tag;
pub const joyinfoex_tag = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    dwXpos: DWORD,
    dwYpos: DWORD,
    dwZpos: DWORD,
    dwRpos: DWORD,
    dwUpos: DWORD,
    dwVpos: DWORD,
    dwButtons: DWORD,
    dwButtonNumber: DWORD,
    dwPOV: DWORD,
    dwReserved1: DWORD,
    dwReserved2: DWORD,
};
pub const JOYINFOEX = joyinfoex_tag;
pub const PJOYINFOEX = ?*joyinfoex_tag;
pub const NPJOYINFOEX = ?*joyinfoex_tag;
pub const LPJOYINFOEX = ?*joyinfoex_tag;
pub const NCB = extern struct {
    ncb_command: UCHAR,
    ncb_retcode: UCHAR,
    ncb_lsn: UCHAR,
    ncb_num: UCHAR,
    ncb_buffer: PUCHAR,
    ncb_length: WORD,
    ncb_callname: [16]UCHAR,
    ncb_name: [16]UCHAR,
    ncb_rto: UCHAR,
    ncb_sto: UCHAR,
    ncb_post: ?extern fn(?*NCB) void,
    ncb_lana_num: UCHAR,
    ncb_cmd_cplt: UCHAR,
    ncb_reserve: [18]UCHAR,
    ncb_event: HANDLE,
};

pub const PNCB = ?*NCB;
pub const ADAPTER_STATUS = extern struct {
    adapter_address: [6]UCHAR,
    rev_major: UCHAR,
    reserved0: UCHAR,
    adapter_type: UCHAR,
    rev_minor: UCHAR,
    duration: WORD,
    frmr_recv: WORD,
    frmr_xmit: WORD,
    iframe_recv_err: WORD,
    xmit_aborts: WORD,
    xmit_success: DWORD,
    recv_success: DWORD,
    iframe_xmit_err: WORD,
    recv_buff_unavail: WORD,
    t1_timeouts: WORD,
    ti_timeouts: WORD,
    reserved1: DWORD,
    free_ncbs: WORD,
    max_cfg_ncbs: WORD,
    max_ncbs: WORD,
    xmit_buf_unavail: WORD,
    max_dgram_size: WORD,
    pending_sess: WORD,
    max_cfg_sess: WORD,
    max_sess: WORD,
    max_sess_pkt_size: WORD,
    name_count: WORD,
};

pub const PADAPTER_STATUS = ?*ADAPTER_STATUS;
pub const NAME_BUFFER = extern struct {
    name: [16]UCHAR,
    name_num: UCHAR,
    name_flags: UCHAR,
};

pub const PNAME_BUFFER = ?*NAME_BUFFER;
pub const SESSION_HEADER = extern struct {
    sess_name: UCHAR,
    num_sess: UCHAR,
    rcv_dg_outstanding: UCHAR,
    rcv_any_outstanding: UCHAR,
};

pub const PSESSION_HEADER = ?*SESSION_HEADER;
pub const SESSION_BUFFER = extern struct {
    lsn: UCHAR,
    state: UCHAR,
    local_name: [16]UCHAR,
    remote_name: [16]UCHAR,
    rcvs_outstanding: UCHAR,
    sends_outstanding: UCHAR,
};

pub const PSESSION_BUFFER = ?*SESSION_BUFFER;
pub const LANA_ENUM = extern struct {
    length: UCHAR,
    lana: [255]UCHAR,
};

pub const PLANA_ENUM = ?*LANA_ENUM;
pub const FIND_NAME_HEADER = extern struct {
    node_count: WORD,
    reserved: UCHAR,
    unique_group: UCHAR,
};

pub const PFIND_NAME_HEADER = ?*FIND_NAME_HEADER;
pub const FIND_NAME_BUFFER = extern struct {
    length: UCHAR,
    access_control: UCHAR,
    frame_control: UCHAR,
    destination_addr: [6]UCHAR,
    source_addr: [6]UCHAR,
    routing_info: [18]UCHAR,
};

pub const PFIND_NAME_BUFFER = ?*FIND_NAME_BUFFER;
pub const ACTION_HEADER = extern struct {
    transport_id: ULONG,
    action_code: USHORT,
    reserved: USHORT,
};

pub const PACTION_HEADER = ?*ACTION_HEADER;
pub const I_RPC_HANDLE = ?*c_void;
pub const RPC_STATUS = c_long;
pub const RPC_CSTR = ?[*]u8;
pub const RPC_WSTR = ?[*]c_ushort;
pub const RPC_CWSTR = ?[*]const c_ushort;
pub const RPC_BINDING_HANDLE = I_RPC_HANDLE;
pub const handle_t = RPC_BINDING_HANDLE;
pub const UUID = GUID;
pub const RPC_BINDING_VECTOR = extern struct {
    Count: c_ulong,
    BindingH: [1]RPC_BINDING_HANDLE,
};

pub const UUID_VECTOR = extern struct {
    Count: c_ulong,
    Uuid: [1](?*UUID),
};

pub const RPC_IF_HANDLE = ?*c_void;
pub const RPC_IF_ID = extern struct {
    Uuid: UUID,
    VersMajor: c_ushort,
    VersMinor: c_ushort,
};

pub const RPC_PROTSEQ_VECTORA = extern struct {
    Count: c_uint,
    Protseq: [1](?[*]u8),
};

pub const RPC_PROTSEQ_VECTORW = extern struct {
    Count: c_uint,
    Protseq: [1](?*c_ushort),
};

pub const RPC_POLICY = extern struct {
    Length: c_uint,
    EndpointFlags: c_ulong,
    NICFlags: c_ulong,
};

pub const PRPC_POLICY = ?*RPC_POLICY;
pub const RPC_OBJECT_INQ_FN = extern fn(?*UUID, ?*UUID, ?*RPC_STATUS) void;
pub const RPC_IF_CALLBACK_FN = extern fn(RPC_IF_HANDLE, ?*c_void) RPC_STATUS;
pub const RPC_SECURITY_CALLBACK_FN = extern fn(?*c_void) void;
pub const RPC_STATS_VECTOR = extern struct {
    Count: c_uint,
    Stats: [1]c_ulong,
};
pub const RPC_IF_ID_VECTOR = extern struct {
    Count: c_ulong,
    IfId: [1](?*RPC_IF_ID),
};
pub const RPC_AUTH_IDENTITY_HANDLE = ?*c_void;
pub const RPC_AUTHZ_HANDLE = ?*c_void;
pub const RPC_SECURITY_QOS = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
};

pub const PRPC_SECURITY_QOS = ?*RPC_SECURITY_QOS;
pub const SEC_WINNT_AUTH_IDENTITY_W = extern struct {
    User: ?*c_ushort,
    UserLength: c_ulong,
    Domain: ?*c_ushort,
    DomainLength: c_ulong,
    Password: ?*c_ushort,
    PasswordLength: c_ulong,
    Flags: c_ulong,
};

pub const PSEC_WINNT_AUTH_IDENTITY_W = ?*SEC_WINNT_AUTH_IDENTITY_W;
pub const SEC_WINNT_AUTH_IDENTITY_A = extern struct {
    User: ?[*]u8,
    UserLength: c_ulong,
    Domain: ?[*]u8,
    DomainLength: c_ulong,
    Password: ?[*]u8,
    PasswordLength: c_ulong,
    Flags: c_ulong,
};

pub const PSEC_WINNT_AUTH_IDENTITY_A = ?*SEC_WINNT_AUTH_IDENTITY_A;
pub const RPC_HTTP_TRANSPORT_CREDENTIALS_W = extern struct {
    TransportCredentials: ?*SEC_WINNT_AUTH_IDENTITY_W,
    Flags: c_ulong,
    AuthenticationTarget: c_ulong,
    NumberOfAuthnSchemes: c_ulong,
    AuthnSchemes: ?*c_ulong,
    ServerCertificateSubject: ?*c_ushort,
};

pub const PRPC_HTTP_TRANSPORT_CREDENTIALS_W = ?*RPC_HTTP_TRANSPORT_CREDENTIALS_W;
pub const RPC_HTTP_TRANSPORT_CREDENTIALS_A = extern struct {
    TransportCredentials: ?*SEC_WINNT_AUTH_IDENTITY_A,
    Flags: c_ulong,
    AuthenticationTarget: c_ulong,
    NumberOfAuthnSchemes: c_ulong,
    AuthnSchemes: ?*c_ulong,
    ServerCertificateSubject: ?[*]u8,
};

pub const PRPC_HTTP_TRANSPORT_CREDENTIALS_A = ?*RPC_HTTP_TRANSPORT_CREDENTIALS_A;
pub const RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W = extern struct {
    TransportCredentials: ?*SEC_WINNT_AUTH_IDENTITY_W,
    Flags: c_ulong,
    AuthenticationTarget: c_ulong,
    NumberOfAuthnSchemes: c_ulong,
    AuthnSchemes: ?*c_ulong,
    ServerCertificateSubject: ?*c_ushort,
    ProxyCredentials: ?*SEC_WINNT_AUTH_IDENTITY_W,
    NumberOfProxyAuthnSchemes: c_ulong,
    ProxyAuthnSchemes: ?*c_ulong,
};

pub const PRPC_HTTP_TRANSPORT_CREDENTIALS_V2_W = ?*RPC_HTTP_TRANSPORT_CREDENTIALS_V2_W;
pub const RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A = extern struct {
    TransportCredentials: ?*SEC_WINNT_AUTH_IDENTITY_A,
    Flags: c_ulong,
    AuthenticationTarget: c_ulong,
    NumberOfAuthnSchemes: c_ulong,
    AuthnSchemes: ?*c_ulong,
    ServerCertificateSubject: ?[*]u8,
    ProxyCredentials: ?*SEC_WINNT_AUTH_IDENTITY_A,
    NumberOfProxyAuthnSchemes: c_ulong,
    ProxyAuthnSchemes: ?*c_ulong,
};

pub const PRPC_HTTP_TRANSPORT_CREDENTIALS_V2_A = ?*RPC_HTTP_TRANSPORT_CREDENTIALS_V2_A;
pub const RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W = extern struct {
    TransportCredentials: RPC_AUTH_IDENTITY_HANDLE,
    Flags: c_ulong,
    AuthenticationTarget: c_ulong,
    NumberOfAuthnSchemes: c_ulong,
    AuthnSchemes: ?*c_ulong,
    ServerCertificateSubject: ?*c_ushort,
    ProxyCredentials: RPC_AUTH_IDENTITY_HANDLE,
    NumberOfProxyAuthnSchemes: c_ulong,
    ProxyAuthnSchemes: ?*c_ulong,
};

pub const PRPC_HTTP_TRANSPORT_CREDENTIALS_V3_W = ?*RPC_HTTP_TRANSPORT_CREDENTIALS_V3_W;
pub const RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A = extern struct {
    TransportCredentials: RPC_AUTH_IDENTITY_HANDLE,
    Flags: c_ulong,
    AuthenticationTarget: c_ulong,
    NumberOfAuthnSchemes: c_ulong,
    AuthnSchemes: ?*c_ulong,
    ServerCertificateSubject: ?[*]u8,
    ProxyCredentials: RPC_AUTH_IDENTITY_HANDLE,
    NumberOfProxyAuthnSchemes: c_ulong,
    ProxyAuthnSchemes: ?*c_ulong,
};

pub const PRPC_HTTP_TRANSPORT_CREDENTIALS_V3_A = ?*RPC_HTTP_TRANSPORT_CREDENTIALS_V3_A;
pub const RPC_SECURITY_QOS_V2_W = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_W,
    },
};

pub const PRPC_SECURITY_QOS_V2_W = ?*RPC_SECURITY_QOS_V2_W;
pub const RPC_SECURITY_QOS_V2_A = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_A,
    },
};

pub const PRPC_SECURITY_QOS_V2_A = ?*RPC_SECURITY_QOS_V2_A;
pub const RPC_SECURITY_QOS_V3_W = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_W,
    },
    Sid: ?*c_void,
};

pub const PRPC_SECURITY_QOS_V3_W = ?*RPC_SECURITY_QOS_V3_W;
pub const RPC_SECURITY_QOS_V3_A = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_A,
    },
    Sid: ?*c_void,
};

pub const PRPC_SECURITY_QOS_V3_A = ?*RPC_SECURITY_QOS_V3_A;
pub const RPC_SECURITY_QOS_V4_W = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_W,
    },
    Sid: ?*c_void,
    EffectiveOnly: c_uint,
};

pub const PRPC_SECURITY_QOS_V4_W = ?*RPC_SECURITY_QOS_V4_W;
pub const RPC_SECURITY_QOS_V4_A = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_A,
    },
    Sid: ?*c_void,
    EffectiveOnly: c_uint,
};

pub const PRPC_SECURITY_QOS_V4_A = ?*RPC_SECURITY_QOS_V4_A;
pub const RPC_SECURITY_QOS_V5_W = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_W,
    },
    Sid: ?*c_void,
    EffectiveOnly: c_uint,
    ServerSecurityDescriptor: ?*c_void,
};

pub const PRPC_SECURITY_QOS_V5_W = ?*RPC_SECURITY_QOS_V5_W;
pub const RPC_SECURITY_QOS_V5_A = extern struct {
    Version: c_ulong,
    Capabilities: c_ulong,
    IdentityTracking: c_ulong,
    ImpersonationType: c_ulong,
    AdditionalSecurityInfoType: c_ulong,
    u: extern union {
        HttpCredentials: ?*RPC_HTTP_TRANSPORT_CREDENTIALS_A,
    },
    Sid: ?*c_void,
    EffectiveOnly: c_uint,
    ServerSecurityDescriptor: ?*c_void,
};

pub const PRPC_SECURITY_QOS_V5_A = ?*RPC_SECURITY_QOS_V5_A;
pub const RPC_BINDING_HANDLE_TEMPLATE_V1_W = extern struct {
    Version: c_ulong,
    Flags: c_ulong,
    ProtocolSequence: c_ulong,
    NetworkAddress: ?*c_ushort,
    StringEndpoint: ?*c_ushort,
    u1: extern union {
        Reserved: ?*c_ushort,
    },
    ObjectUuid: UUID,
};

pub const PRPC_BINDING_HANDLE_TEMPLATE_V1_W = ?*RPC_BINDING_HANDLE_TEMPLATE_V1_W;
pub const RPC_BINDING_HANDLE_TEMPLATE_V1_A = extern struct {
    Version: c_ulong,
    Flags: c_ulong,
    ProtocolSequence: c_ulong,
    NetworkAddress: ?[*]u8,
    StringEndpoint: ?[*]u8,
    u1: extern union {
        Reserved: ?[*]u8,
    },
    ObjectUuid: UUID,
};

pub const PRPC_BINDING_HANDLE_TEMPLATE_V1_A = ?*RPC_BINDING_HANDLE_TEMPLATE_V1_A;
pub const RPC_BINDING_HANDLE_SECURITY_V1_W = extern struct {
    Version: c_ulong,
    ServerPrincName: ?*c_ushort,
    AuthnLevel: c_ulong,
    AuthnSvc: c_ulong,
    AuthIdentity: ?*SEC_WINNT_AUTH_IDENTITY_W,
    SecurityQos: ?*RPC_SECURITY_QOS,
};

pub const PRPC_BINDING_HANDLE_SECURITY_V1_W = ?*RPC_BINDING_HANDLE_SECURITY_V1_W;
pub const RPC_BINDING_HANDLE_SECURITY_V1_A = extern struct {
    Version: c_ulong,
    ServerPrincName: ?[*]u8,
    AuthnLevel: c_ulong,
    AuthnSvc: c_ulong,
    AuthIdentity: ?*SEC_WINNT_AUTH_IDENTITY_A,
    SecurityQos: ?*RPC_SECURITY_QOS,
};

pub const PRPC_BINDING_HANDLE_SECURITY_V1_A = ?*RPC_BINDING_HANDLE_SECURITY_V1_A;
pub const RPC_BINDING_HANDLE_OPTIONS_V1 = extern struct {
    Version: c_ulong,
    Flags: c_ulong,
    ComTimeout: c_ulong,
    CallTimeout: c_ulong,
};

pub const PRPC_BINDING_HANDLE_OPTIONS_V1 = ?*RPC_BINDING_HANDLE_OPTIONS_V1;
pub const RPC_HTTP_REDIRECTOR_STAGE = c_int;

pub const RPC_NEW_HTTP_PROXY_CHANNEL = ?extern fn(RPC_HTTP_REDIRECTOR_STAGE, RPC_WSTR, RPC_WSTR, RPC_WSTR, RPC_WSTR, ?*c_void, ?*c_void, ?*c_void, ?*c_void, c_ulong, ?*RPC_WSTR, ?*RPC_WSTR) RPC_STATUS;
pub const RPC_HTTP_PROXY_FREE_STRING = ?extern fn(RPC_WSTR) void;
pub const RPC_AUTH_KEY_RETRIEVAL_FN = ?extern fn(?*c_void, RPC_WSTR, c_ulong, ?*(?*c_void), ?*RPC_STATUS) void;
pub const RPC_CLIENT_INFORMATION1 = extern struct {
    UserName: ?[*]u8,
    ComputerName: ?[*]u8,
    Privilege: c_ushort,
    AuthFlags: c_ulong,
};
pub const PRPC_CLIENT_INFORMATION1 = ?*extern struct {
    UserName: ?[*]u8,
    ComputerName: ?[*]u8,
    Privilege: c_ushort,
    AuthFlags: c_ulong,
};
pub const RPC_EP_INQ_HANDLE = ?*I_RPC_HANDLE;
pub const RPC_MGMT_AUTHORIZATION_FN = ?extern fn(RPC_BINDING_HANDLE, c_ulong, ?*RPC_STATUS) c_int;
pub const RPC_INTERFACE_GROUP = ?*c_void;
pub const PRPC_INTERFACE_GROUP = ?*(?*c_void);
pub const RPC_ENDPOINT_TEMPLATEW = extern struct {
    Version: c_ulong,
    ProtSeq: RPC_WSTR,
    Endpoint: RPC_WSTR,
    SecurityDescriptor: ?*c_void,
    Backlog: c_ulong,
};
pub const PRPC_ENDPOINT_TEMPLATEW = ?*extern struct {
    Version: c_ulong,
    ProtSeq: RPC_WSTR,
    Endpoint: RPC_WSTR,
    SecurityDescriptor: ?*c_void,
    Backlog: c_ulong,
};
pub const RPC_ENDPOINT_TEMPLATEA = extern struct {
    Version: c_ulong,
    ProtSeq: RPC_CSTR,
    Endpoint: RPC_CSTR,
    SecurityDescriptor: ?*c_void,
    Backlog: c_ulong,
};
pub const PRPC_ENDPOINT_TEMPLATEA = ?*extern struct {
    Version: c_ulong,
    ProtSeq: RPC_CSTR,
    Endpoint: RPC_CSTR,
    SecurityDescriptor: ?*c_void,
    Backlog: c_ulong,
};
pub const RPC_INTERFACE_TEMPLATEA = extern struct {
    Version: c_ulong,
    IfSpec: RPC_IF_HANDLE,
    MgrTypeUuid: ?*UUID,
    MgrEpv: ?*c_void,
    Flags: c_uint,
    MaxCalls: c_uint,
    MaxRpcSize: c_uint,
    IfCallback: ?*RPC_IF_CALLBACK_FN,
    UuidVector: ?*UUID_VECTOR,
    Annotation: RPC_CSTR,
    SecurityDescriptor: ?*c_void,
};
pub const PRPC_INTERFACE_TEMPLATEA = ?*extern struct {
    Version: c_ulong,
    IfSpec: RPC_IF_HANDLE,
    MgrTypeUuid: ?*UUID,
    MgrEpv: ?*c_void,
    Flags: c_uint,
    MaxCalls: c_uint,
    MaxRpcSize: c_uint,
    IfCallback: ?*RPC_IF_CALLBACK_FN,
    UuidVector: ?*UUID_VECTOR,
    Annotation: RPC_CSTR,
    SecurityDescriptor: ?*c_void,
};
pub const RPC_INTERFACE_TEMPLATEW = extern struct {
    Version: c_ulong,
    IfSpec: RPC_IF_HANDLE,
    MgrTypeUuid: ?*UUID,
    MgrEpv: ?*c_void,
    Flags: c_uint,
    MaxCalls: c_uint,
    MaxRpcSize: c_uint,
    IfCallback: ?*RPC_IF_CALLBACK_FN,
    UuidVector: ?*UUID_VECTOR,
    Annotation: RPC_WSTR,
    SecurityDescriptor: ?*c_void,
};
pub const PRPC_INTERFACE_TEMPLATEW = ?*extern struct {
    Version: c_ulong,
    IfSpec: RPC_IF_HANDLE,
    MgrTypeUuid: ?*UUID,
    MgrEpv: ?*c_void,
    Flags: c_uint,
    MaxCalls: c_uint,
    MaxRpcSize: c_uint,
    IfCallback: ?*RPC_IF_CALLBACK_FN,
    UuidVector: ?*UUID_VECTOR,
    Annotation: RPC_WSTR,
    SecurityDescriptor: ?*c_void,
};
pub const RPC_INTERFACE_GROUP_IDLE_CALLBACK_FN = extern fn(RPC_INTERFACE_GROUP, ?*c_void, c_ulong) void;
pub const RPC_VERSION = extern struct {
    MajorVersion: c_ushort,
    MinorVersion: c_ushort,
};

pub const RPC_SYNTAX_IDENTIFIER = extern struct {
    SyntaxGUID: GUID,
    SyntaxVersion: RPC_VERSION,
};

pub const PRPC_SYNTAX_IDENTIFIER = ?*RPC_SYNTAX_IDENTIFIER;
pub const RPC_MESSAGE = extern struct {
    Handle: RPC_BINDING_HANDLE,
    DataRepresentation: c_ulong,
    Buffer: ?*c_void,
    BufferLength: c_uint,
    ProcNum: c_uint,
    TransferSyntax: PRPC_SYNTAX_IDENTIFIER,
    RpcInterfaceInformation: ?*c_void,
    ReservedForRuntime: ?*c_void,
    ManagerEpv: ?*c_void,
    ImportContext: ?*c_void,
    RpcFlags: c_ulong,
};

pub const PRPC_MESSAGE = ?*RPC_MESSAGE;
pub const RPC_FORWARD_FUNCTION = extern fn(?*UUID, ?*RPC_VERSION, ?*UUID, ?[*]u8, ?*(?*c_void)) RPC_STATUS;
pub const RPC_ADDRESS_CHANGE_TYPE = c_int;
pub const RPC_ADDRESS_CHANGE_FN = extern fn(?*c_void) void;
pub const RPC_DISPATCH_FUNCTION = ?extern fn(PRPC_MESSAGE) void;
pub const RPC_DISPATCH_TABLE = extern struct {
    DispatchTableCount: c_uint,
    DispatchTable: ?*RPC_DISPATCH_FUNCTION,
    Reserved: LONG_PTR,
};
pub const PRPC_DISPATCH_TABLE = ?*extern struct {
    DispatchTableCount: c_uint,
    DispatchTable: ?*RPC_DISPATCH_FUNCTION,
    Reserved: LONG_PTR,
};
pub const RPC_PROTSEQ_ENDPOINT = extern struct {
    RpcProtocolSequence: ?[*]u8,
    Endpoint: ?[*]u8,
};

pub const PRPC_PROTSEQ_ENDPOINT = ?*RPC_PROTSEQ_ENDPOINT;
pub const RPC_SERVER_INTERFACE = extern struct {
    Length: c_uint,
    InterfaceId: RPC_SYNTAX_IDENTIFIER,
    TransferSyntax: RPC_SYNTAX_IDENTIFIER,
    DispatchTable: PRPC_DISPATCH_TABLE,
    RpcProtseqEndpointCount: c_uint,
    RpcProtseqEndpoint: PRPC_PROTSEQ_ENDPOINT,
    DefaultManagerEpv: ?*c_void,
    InterpreterInfo: ?*const c_void,
    Flags: c_uint,
};

pub const PRPC_SERVER_INTERFACE = ?*RPC_SERVER_INTERFACE;
pub const RPC_CLIENT_INTERFACE = extern struct {
    Length: c_uint,
    InterfaceId: RPC_SYNTAX_IDENTIFIER,
    TransferSyntax: RPC_SYNTAX_IDENTIFIER,
    DispatchTable: PRPC_DISPATCH_TABLE,
    RpcProtseqEndpointCount: c_uint,
    RpcProtseqEndpoint: PRPC_PROTSEQ_ENDPOINT,
    Reserved: ULONG_PTR,
    InterpreterInfo: ?*const c_void,
    Flags: c_uint,
};

pub const PRPC_CLIENT_INTERFACE = ?*RPC_CLIENT_INTERFACE;
pub const I_RPC_MUTEX = ?*c_void;
pub const MarshalDirectionMarshal = LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION.MarshalDirectionMarshal;
pub const MarshalDirectionUnmarshal = LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION.MarshalDirectionUnmarshal;
pub const LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION = extern enum {
    MarshalDirectionMarshal,
    MarshalDirectionUnmarshal,
};

pub const PRPC_RUNDOWN = ?extern fn(?*c_void) void;
pub const RPC_SEC_CONTEXT_KEY_INFO = extern struct {
    EncryptAlgorithm: c_ulong,
    KeySize: c_ulong,
    SignatureAlgorithm: c_ulong,
};

pub const PRPC_SEC_CONTEXT_KEY_INFO = ?*RPC_SEC_CONTEXT_KEY_INFO;
pub const RPC_TRANSFER_SYNTAX = extern struct {
    Uuid: UUID,
    VersMajor: c_ushort,
    VersMinor: c_ushort,
};

pub const RPCLT_PDU_FILTER_FUNC = ?extern fn(?*c_void, c_uint, c_int) void;
pub const RPC_SETFILTER_FUNC = ?extern fn(RPCLT_PDU_FILTER_FUNC) void;
pub const RPC_BLOCKING_FN = ?extern fn(?*c_void, ?*c_void, ?*c_void) RPC_STATUS;
pub const RPC_C_OPT_COOKIE_AUTH_DESCRIPTOR = extern struct {
    BufferSize: c_ulong,
    Buffer: ?[*]u8,
};

pub const RDR_CALLOUT_STATE = extern struct {
    LastError: RPC_STATUS,
    LastEEInfo: ?*c_void,
    LastCalledStage: RPC_HTTP_REDIRECTOR_STAGE,
    ServerName: ?*c_ushort,
    ServerPort: ?*c_ushort,
    RemoteUser: ?*c_ushort,
    AuthType: ?*c_ushort,
    ResourceTypePresent: u8,
    SessionIdPresent: u8,
    InterfacePresent: u8,
    ResourceType: UUID,
    SessionId: UUID,
    Interface: RPC_SYNTAX_IDENTIFIER,
    CertContext: ?*c_void,
};

pub const I_RpcProxyIsValidMachineFn = ?extern fn(RPC_WSTR, RPC_WSTR, c_ulong) RPC_STATUS;
pub const I_RpcProxyGetClientAddressFn = ?extern fn(?*c_void, ?[*]u8, ?*c_ulong) RPC_STATUS;
pub const I_RpcProxyGetConnectionTimeoutFn = ?extern fn(?*c_ulong) RPC_STATUS;
pub const I_RpcPerformCalloutFn = ?extern fn(?*c_void, ?*RDR_CALLOUT_STATE, RPC_HTTP_REDIRECTOR_STAGE) RPC_STATUS;
pub const I_RpcFreeCalloutStateFn = ?extern fn(?*RDR_CALLOUT_STATE) void;
pub const I_RpcProxyGetClientSessionAndResourceUUID = ?extern fn(?*c_void, ?*c_int, ?*UUID, ?*c_int, ?*UUID) RPC_STATUS;
pub const I_RpcProxyFilterIfFn = ?extern fn(?*c_void, ?*UUID, c_ushort, ?*c_int) RPC_STATUS;
pub const RpcProxyPerfCounters = c_int;
pub const RpcPerfCounters = RpcProxyPerfCounters;
pub const I_RpcProxyUpdatePerfCounterFn = ?extern fn(RpcPerfCounters, c_int, c_ulong) void;
pub const I_RpcProxyUpdatePerfCounterBackendServerFn = ?extern fn(?*c_ushort, c_int) void;
pub const I_RpcProxyCallbackInterface = extern struct {
    IsValidMachineFn: I_RpcProxyIsValidMachineFn,
    GetClientAddressFn: I_RpcProxyGetClientAddressFn,
    GetConnectionTimeoutFn: I_RpcProxyGetConnectionTimeoutFn,
    PerformCalloutFn: I_RpcPerformCalloutFn,
    FreeCalloutStateFn: I_RpcFreeCalloutStateFn,
    GetClientSessionAndResourceUUIDFn: I_RpcProxyGetClientSessionAndResourceUUID,
    ProxyFilterIfFn: I_RpcProxyFilterIfFn,
    RpcProxyUpdatePerfCounterFn: I_RpcProxyUpdatePerfCounterFn,
    RpcProxyUpdatePerfCounterBackendServerFn: I_RpcProxyUpdatePerfCounterBackendServerFn,
};

pub const RPC_NS_HANDLE = ?*c_void;
pub const RpcNotificationTypeNone = RPC_NOTIFICATION_TYPES.RpcNotificationTypeNone;
pub const RpcNotificationTypeEvent = RPC_NOTIFICATION_TYPES.RpcNotificationTypeEvent;
pub const RpcNotificationTypeApc = RPC_NOTIFICATION_TYPES.RpcNotificationTypeApc;
pub const RpcNotificationTypeIoc = RPC_NOTIFICATION_TYPES.RpcNotificationTypeIoc;
pub const RpcNotificationTypeHwnd = RPC_NOTIFICATION_TYPES.RpcNotificationTypeHwnd;
pub const RpcNotificationTypeCallback = RPC_NOTIFICATION_TYPES.RpcNotificationTypeCallback;
pub const RPC_NOTIFICATION_TYPES = extern enum {
    RpcNotificationTypeNone,
    RpcNotificationTypeEvent,
    RpcNotificationTypeApc,
    RpcNotificationTypeIoc,
    RpcNotificationTypeHwnd,
    RpcNotificationTypeCallback,
};

pub const RpcCallComplete = RPC_ASYNC_EVENT.RpcCallComplete;
pub const RpcSendComplete = RPC_ASYNC_EVENT.RpcSendComplete;
pub const RpcReceiveComplete = RPC_ASYNC_EVENT.RpcReceiveComplete;
pub const RpcClientDisconnect = RPC_ASYNC_EVENT.RpcClientDisconnect;
pub const RpcClientCancel = RPC_ASYNC_EVENT.RpcClientCancel;
pub const RPC_ASYNC_EVENT = extern enum {
    RpcCallComplete,
    RpcSendComplete,
    RpcReceiveComplete,
    RpcClientDisconnect,
    RpcClientCancel,
};

pub const RPCNOTIFICATION_ROUTINE = extern fn(?*RPC_ASYNC_STATE, ?*c_void, RPC_ASYNC_EVENT) void;
pub const PFN_RPCNOTIFICATION_ROUTINE = ?*RPCNOTIFICATION_ROUTINE;
pub const RPC_ASYNC_NOTIFICATION_INFO = extern union {
    APC: extern struct {
        NotificationRoutine: PFN_RPCNOTIFICATION_ROUTINE,
        hThread: HANDLE,
    },
    IOC: extern struct {
        hIOPort: HANDLE,
        dwNumberOfBytesTransferred: DWORD,
        dwCompletionKey: DWORD_PTR,
        lpOverlapped: LPOVERLAPPED,
    },
    HWND: extern struct {
        hWnd: HWND,
        Msg: UINT,
    },
    hEvent: HANDLE,
    NotificationRoutine: PFN_RPCNOTIFICATION_ROUTINE,
};

pub const RPC_ASYNC_STATE = extern struct {
    Size: c_uint,
    Signature: c_ulong,
    Lock: c_long,
    Flags: c_ulong,
    StubInfo: ?*c_void,
    UserInfo: ?*c_void,
    RuntimeInfo: ?*c_void,
    Event: RPC_ASYNC_EVENT,
    NotificationType: RPC_NOTIFICATION_TYPES,
    u: RPC_ASYNC_NOTIFICATION_INFO,
    Reserved: [4]LONG_PTR,
};
pub const PRPC_ASYNC_NOTIFICATION_INFO = ?*RPC_ASYNC_NOTIFICATION_INFO;

pub const PRPC_ASYNC_STATE = ?*RPC_ASYNC_STATE;
pub const ExtendedErrorParamTypes = c_int;

pub const BinaryParam = extern struct {
    Buffer: ?*c_void,
    Size: c_short,
};

pub const RPC_EE_INFO_PARAM = extern struct {
    ParameterType: ExtendedErrorParamTypes,
    u: extern union {
        AnsiString: LPSTR,
        UnicodeString: LPWSTR,
        LVal: c_long,
        SVal: c_short,
        PVal: ULONGLONG,
        BVal: BinaryParam,
    },
};

pub const RPC_EXTENDED_ERROR_INFO = extern struct {
    Version: ULONG,
    ComputerName: LPWSTR,
    ProcessID: ULONG,
    u: extern union {
        SystemTime: SYSTEMTIME,
        FileTime: FILETIME,
    },
    GeneratingComponent: ULONG,
    Status: ULONG,
    DetectionLocation: USHORT,
    Flags: USHORT,
    NumberOfParameters: c_int,
    Parameters: [4]RPC_EE_INFO_PARAM,
};

pub const RPC_ERROR_ENUM_HANDLE = extern struct {
    Signature: ULONG,
    CurrentPos: ?*c_void,
    Head: ?*c_void,
};

pub const RpcLocalAddressFormat = c_int;

pub const RPC_CALL_LOCAL_ADDRESS_V1 = extern struct {
    Version: c_uint,
    Buffer: ?*c_void,
    BufferSize: c_ulong,
    AddressFormat: RpcLocalAddressFormat,
};

pub const PRPC_CALL_LOCAL_ADDRESS_V1 = ?*RPC_CALL_LOCAL_ADDRESS_V1;
pub const RPC_CALL_ATTRIBUTES_V1_W = extern struct {
    Version: c_uint,
    Flags: c_ulong,
    ServerPrincipalNameBufferLength: c_ulong,
    ServerPrincipalName: ?*c_ushort,
    ClientPrincipalNameBufferLength: c_ulong,
    ClientPrincipalName: ?*c_ushort,
    AuthenticationLevel: c_ulong,
    AuthenticationService: c_ulong,
    NullSession: BOOL,
};

pub const RPC_CALL_ATTRIBUTES_V1_A = extern struct {
    Version: c_uint,
    Flags: c_ulong,
    ServerPrincipalNameBufferLength: c_ulong,
    ServerPrincipalName: ?[*]u8,
    ClientPrincipalNameBufferLength: c_ulong,
    ClientPrincipalName: ?[*]u8,
    AuthenticationLevel: c_ulong,
    AuthenticationService: c_ulong,
    NullSession: BOOL,
};

pub const RpcCallType = c_int;

pub const RpcCallClientLocality = c_int;

pub const RPC_CALL_ATTRIBUTES_V2_W = extern struct {
    Version: c_uint,
    Flags: c_ulong,
    ServerPrincipalNameBufferLength: c_ulong,
    ServerPrincipalName: ?*c_ushort,
    ClientPrincipalNameBufferLength: c_ulong,
    ClientPrincipalName: ?*c_ushort,
    AuthenticationLevel: c_ulong,
    AuthenticationService: c_ulong,
    NullSession: BOOL,
    KernelModeCaller: BOOL,
    ProtocolSequence: c_ulong,
    IsClientLocal: RpcCallClientLocality,
    ClientPID: HANDLE,
    CallStatus: c_ulong,
    CallType: RpcCallType,
    CallLocalAddress: ?*RPC_CALL_LOCAL_ADDRESS_V1,
    OpNum: c_ushort,
    InterfaceUuid: UUID,
};

pub const RPC_CALL_ATTRIBUTES_V2_A = extern struct {
    Version: c_uint,
    Flags: c_ulong,
    ServerPrincipalNameBufferLength: c_ulong,
    ServerPrincipalName: ?[*]u8,
    ClientPrincipalNameBufferLength: c_ulong,
    ClientPrincipalName: ?[*]u8,
    AuthenticationLevel: c_ulong,
    AuthenticationService: c_ulong,
    NullSession: BOOL,
    KernelModeCaller: BOOL,
    ProtocolSequence: c_ulong,
    IsClientLocal: c_ulong,
    ClientPID: HANDLE,
    CallStatus: c_ulong,
    CallType: RpcCallType,
    CallLocalAddress: ?*RPC_CALL_LOCAL_ADDRESS_V1,
    OpNum: c_ushort,
    InterfaceUuid: UUID,
};

pub const RPC_CALL_ATTRIBUTES_V3_W = extern struct {
    Version: c_uint,
    Flags: c_ulong,
    ServerPrincipalNameBufferLength: c_ulong,
    ServerPrincipalName: ?*c_ushort,
    ClientPrincipalNameBufferLength: c_ulong,
    ClientPrincipalName: ?*c_ushort,
    AuthenticationLevel: c_ulong,
    AuthenticationService: c_ulong,
    NullSession: BOOL,
    KernelModeCaller: BOOL,
    ProtocolSequence: c_ulong,
    IsClientLocal: RpcCallClientLocality,
    ClientPID: HANDLE,
    CallStatus: c_ulong,
    CallType: RpcCallType,
    CallLocalAddress: ?*RPC_CALL_LOCAL_ADDRESS_V1,
    OpNum: c_ushort,
    InterfaceUuid: UUID,
    ClientIdentifierBufferLength: c_ulong,
    ClientIdentifier: ?[*]u8,
};

pub const RPC_CALL_ATTRIBUTES_V3_A = extern struct {
    Version: c_uint,
    Flags: c_ulong,
    ServerPrincipalNameBufferLength: c_ulong,
    ServerPrincipalName: ?[*]u8,
    ClientPrincipalNameBufferLength: c_ulong,
    ClientPrincipalName: ?[*]u8,
    AuthenticationLevel: c_ulong,
    AuthenticationService: c_ulong,
    NullSession: BOOL,
    KernelModeCaller: BOOL,
    ProtocolSequence: c_ulong,
    IsClientLocal: c_ulong,
    ClientPID: HANDLE,
    CallStatus: c_ulong,
    CallType: RpcCallType,
    CallLocalAddress: ?*RPC_CALL_LOCAL_ADDRESS_V1,
    OpNum: c_ushort,
    InterfaceUuid: UUID,
    ClientIdentifierBufferLength: c_ulong,
    ClientIdentifier: ?[*]u8,
};

pub const RPC_CALL_ATTRIBUTES = RPC_CALL_ATTRIBUTES_V3_A;
pub const RPC_NOTIFICATIONS = c_int;

pub const HDROP__ = extern struct {
    unused: c_int,
};
pub const HDROP = ?*HDROP__;
pub const DRAGINFOA = extern struct {
    uSize: UINT,
    pt: POINT,
    fNC: BOOL,
    lpFileList: PZZSTR,
    grfKeyState: DWORD,
};

pub const LPDRAGINFOA = ?*DRAGINFOA;
pub const DRAGINFOW = extern struct {
    uSize: UINT,
    pt: POINT,
    fNC: BOOL,
    lpFileList: PZZWSTR,
    grfKeyState: DWORD,
};

pub const LPDRAGINFOW = ?*DRAGINFOW;
pub const AppBarData = extern struct {
    cbSize: DWORD,
    hWnd: HWND,
    uCallbackMessage: UINT,
    uEdge: UINT,
    rc: RECT,
    lParam: LPARAM,
};
pub const APPBARDATA = AppBarData;
pub const PAPPBARDATA = ?*AppBarData;
pub const FILEOP_FLAGS = WORD;
pub const PRINTEROP_FLAGS = WORD;
pub const SHFILEOPSTRUCTA = extern struct {
    hwnd: HWND,
    wFunc: UINT,
    pFrom: PCZZSTR,
    pTo: PCZZSTR,
    fFlags: FILEOP_FLAGS,
    fAnyOperationsAborted: BOOL,
    hNameMappings: LPVOID,
    lpszProgressTitle: PCSTR,
};

pub const LPSHFILEOPSTRUCTA = ?*SHFILEOPSTRUCTA;
pub const SHFILEOPSTRUCTW = extern struct {
    hwnd: HWND,
    wFunc: UINT,
    pFrom: PCZZWSTR,
    pTo: PCZZWSTR,
    fFlags: FILEOP_FLAGS,
    fAnyOperationsAborted: BOOL,
    hNameMappings: LPVOID,
    lpszProgressTitle: PCWSTR,
};

pub const LPSHFILEOPSTRUCTW = ?*SHFILEOPSTRUCTW;
pub const SHNAMEMAPPINGA = extern struct {
    pszOldPath: LPSTR,
    pszNewPath: LPSTR,
    cchOldPath: c_int,
    cchNewPath: c_int,
};

pub const LPSHNAMEMAPPINGA = ?*SHNAMEMAPPINGA;
pub const SHNAMEMAPPINGW = extern struct {
    pszOldPath: LPWSTR,
    pszNewPath: LPWSTR,
    cchOldPath: c_int,
    cchNewPath: c_int,
};

pub const LPSHNAMEMAPPINGW = ?*SHNAMEMAPPINGW;
pub const SHELLEXECUTEINFOA = extern struct {
    cbSize: DWORD,
    fMask: ULONG,
    hwnd: HWND,
    lpVerb: LPCSTR,
    lpFile: LPCSTR,
    lpParameters: LPCSTR,
    lpDirectory: LPCSTR,
    nShow: c_int,
    hInstApp: HINSTANCE,
    lpIDList: ?*c_void,
    lpClass: LPCSTR,
    hkeyClass: HKEY,
    dwHotKey: DWORD,
    u: extern union {
        hIcon: HANDLE,
        hMonitor: HANDLE,
    },
    hProcess: HANDLE,
};

pub const LPSHELLEXECUTEINFOA = ?*SHELLEXECUTEINFOA;
pub const SHELLEXECUTEINFOW = extern struct {
    cbSize: DWORD,
    fMask: ULONG,
    hwnd: HWND,
    lpVerb: LPCWSTR,
    lpFile: LPCWSTR,
    lpParameters: LPCWSTR,
    lpDirectory: LPCWSTR,
    nShow: c_int,
    hInstApp: HINSTANCE,
    lpIDList: ?*c_void,
    lpClass: LPCWSTR,
    hkeyClass: HKEY,
    dwHotKey: DWORD,
    u: extern union {
        hIcon: HANDLE,
        hMonitor: HANDLE,
    },
    hProcess: HANDLE,
};

pub const LPSHELLEXECUTEINFOW = ?*SHELLEXECUTEINFOW;
pub const SHCREATEPROCESSINFOW = extern struct {
    cbSize: DWORD,
    fMask: ULONG,
    hwnd: HWND,
    pszFile: LPCWSTR,
    pszParameters: LPCWSTR,
    pszCurrentDirectory: LPCWSTR,
    hUserToken: HANDLE,
    lpProcessAttributes: LPSECURITY_ATTRIBUTES,
    lpThreadAttributes: LPSECURITY_ATTRIBUTES,
    bInheritHandles: BOOL,
    dwCreationFlags: DWORD,
    lpStartupInfo: LPSTARTUPINFOW,
    lpProcessInformation: LPPROCESS_INFORMATION,
};

pub const PSHCREATEPROCESSINFOW = ?*SHCREATEPROCESSINFOW;
pub const ASSOCCLASS = c_int;

pub const ASSOCIATIONELEMENT = extern struct {
    ac: ASSOCCLASS,
    hkClass: HKEY,
    pszClass: PCWSTR,
};

pub const SHQUERYRBINFO = extern struct {
    cbSize: DWORD,
    i64Size: c_longlong,
    i64NumItems: c_longlong,
};

pub const LPSHQUERYRBINFO = ?*SHQUERYRBINFO;
pub const QUERY_USER_NOTIFICATION_STATE = c_int;
pub const NOTIFYICONDATAA = extern struct {
    cbSize: DWORD,
    hWnd: HWND,
    uID: UINT,
    uFlags: UINT,
    uCallbackMessage: UINT,
    hIcon: HICON,
    szTip: [128]CHAR,
    dwState: DWORD,
    dwStateMask: DWORD,
    szInfo: [256]CHAR,
    u: extern union {
        uTimeout: UINT,
        uVersion: UINT,
    },
    szInfoTitle: [64]CHAR,
    dwInfoFlags: DWORD,
    guidItem: GUID,
    hBalloonIcon: HICON,
};

pub const PNOTIFYICONDATAA = ?*NOTIFYICONDATAA;
pub const NOTIFYICONDATAW = extern struct {
    cbSize: DWORD,
    hWnd: HWND,
    uID: UINT,
    uFlags: UINT,
    uCallbackMessage: UINT,
    hIcon: HICON,
    szTip: [128]WCHAR,
    dwState: DWORD,
    dwStateMask: DWORD,
    szInfo: [256]WCHAR,
    u: extern union {
        uTimeout: UINT,
        uVersion: UINT,
    },
    szInfoTitle: [64]WCHAR,
    dwInfoFlags: DWORD,
    guidItem: GUID,
    hBalloonIcon: HICON,
};

pub const PNOTIFYICONDATAW = ?*NOTIFYICONDATAW;
pub const NOTIFYICONIDENTIFIER = extern struct {
    cbSize: DWORD,
    hWnd: HWND,
    uID: UINT,
    guidItem: GUID,
};

pub const PNOTIFYICONIDENTIFIER = ?*NOTIFYICONIDENTIFIER;
pub const SHFILEINFOA = extern struct {
    hIcon: HICON,
    iIcon: c_int,
    dwAttributes: DWORD,
    szDisplayName: [260]CHAR,
    szTypeName: [80]CHAR,
};

pub const SHFILEINFOW = extern struct {
    hIcon: HICON,
    iIcon: c_int,
    dwAttributes: DWORD,
    szDisplayName: [260]WCHAR,
    szTypeName: [80]WCHAR,
};

pub const SHSTOCKICONINFO = extern struct {
    cbSize: DWORD,
    hIcon: HICON,
    iSysImageIndex: c_int,
    iIcon: c_int,
    szPath: [260]WCHAR,
};

pub const SHSTOCKICONID = c_int;

pub const OPEN_PRINTER_PROPS_INFOA = extern struct {
    dwSize: DWORD,
    pszSheetName: LPSTR,
    uSheetIndex: UINT,
    dwFlags: DWORD,
    bModal: BOOL,
};

pub const POPEN_PRINTER_PROPS_INFOA = ?*OPEN_PRINTER_PROPS_INFOA;
pub const OPEN_PRINTER_PROPS_INFOW = extern struct {
    dwSize: DWORD,
    pszSheetName: LPWSTR,
    uSheetIndex: UINT,
    dwFlags: DWORD,
    bModal: BOOL,
};

pub const POPEN_PRINTER_PROPS_INFOW = ?*OPEN_PRINTER_PROPS_INFOW;
pub const PFNCANSHAREFOLDERW = ?extern fn(PCWSTR) HRESULT;
pub const PFNSHOWSHAREFOLDERUIW = ?extern fn(HWND, PCWSTR) HRESULT;
pub const NET_ADDRESS_INFO_ = @OpaqueType();
pub const NC_ADDRESS = extern struct {
    pAddrInfo: ?*NET_ADDRESS_INFO_,
    PortNumber: USHORT,
    PrefixLength: BYTE,
};

pub const PNC_ADDRESS = ?*NC_ADDRESS;
pub const PERF_DATA_BLOCK = extern struct {
    Signature: [4]WCHAR,
    LittleEndian: DWORD,
    Version: DWORD,
    Revision: DWORD,
    TotalByteLength: DWORD,
    HeaderLength: DWORD,
    NumObjectTypes: DWORD,
    DefaultObject: LONG,
    SystemTime: SYSTEMTIME,
    PerfTime: LARGE_INTEGER,
    PerfFreq: LARGE_INTEGER,
    PerfTime100nSec: LARGE_INTEGER,
    SystemNameLength: DWORD,
    SystemNameOffset: DWORD,
};

pub const PPERF_DATA_BLOCK = ?*PERF_DATA_BLOCK;
pub const PERF_OBJECT_TYPE = extern struct {
    TotalByteLength: DWORD,
    DefinitionLength: DWORD,
    HeaderLength: DWORD,
    ObjectNameTitleIndex: DWORD,
    ObjectNameTitle: DWORD,
    ObjectHelpTitleIndex: DWORD,
    ObjectHelpTitle: DWORD,
    DetailLevel: DWORD,
    NumCounters: DWORD,
    DefaultCounter: LONG,
    NumInstances: LONG,
    CodePage: DWORD,
    PerfTime: LARGE_INTEGER,
    PerfFreq: LARGE_INTEGER,
};

pub const PPERF_OBJECT_TYPE = ?*PERF_OBJECT_TYPE;
pub const PERF_COUNTER_DEFINITION = extern struct {
    ByteLength: DWORD,
    CounterNameTitleIndex: DWORD,
    CounterNameTitle: DWORD,
    CounterHelpTitleIndex: DWORD,
    CounterHelpTitle: DWORD,
    DefaultScale: LONG,
    DetailLevel: DWORD,
    CounterType: DWORD,
    CounterSize: DWORD,
    CounterOffset: DWORD,
};

pub const PPERF_COUNTER_DEFINITION = ?*PERF_COUNTER_DEFINITION;
pub const PERF_INSTANCE_DEFINITION = extern struct {
    ByteLength: DWORD,
    ParentObjectTitleIndex: DWORD,
    ParentObjectInstance: DWORD,
    UniqueID: LONG,
    NameOffset: DWORD,
    NameLength: DWORD,
};

pub const PPERF_INSTANCE_DEFINITION = ?*PERF_INSTANCE_DEFINITION;
pub const PERF_COUNTER_BLOCK = extern struct {
    ByteLength: DWORD,
};

pub const PPERF_COUNTER_BLOCK = ?*PERF_COUNTER_BLOCK;
pub const PM_OPEN_PROC = extern fn(LPWSTR) DWORD;
pub const PM_COLLECT_PROC = extern fn(LPWSTR, ?*LPVOID, LPDWORD, LPDWORD) DWORD;
pub const PM_CLOSE_PROC = extern fn() DWORD;
pub const PM_QUERY_PROC = extern fn(LPDWORD, ?*LPVOID, LPDWORD, LPDWORD) DWORD;
pub const u_char = u8;
pub const u_short = c_ushort;
pub const u_int = c_uint;
pub const u_long = c_ulong;
pub const SOCKET = UINT_PTR;
pub const fd_set = extern struct {
    fd_count: u_int,
    fd_array: [64]SOCKET,
};

pub const timeval = extern struct {
    tv_sec: c_long,
    tv_usec: c_long,
};
pub const hostent = extern struct {
    h_name: ?[*]u8,
    h_aliases: ?*(?[*]u8),
    h_addrtype: c_short,
    h_length: c_short,
    h_addr_list: ?*(?[*]u8),
};
pub const netent = extern struct {
    n_name: ?[*]u8,
    n_aliases: ?*(?[*]u8),
    n_addrtype: c_short,
    n_net: u_long,
};
pub const servent = extern struct {
    s_name: ?[*]u8,
    s_aliases: ?*(?[*]u8),
    s_proto: ?[*]u8,
    s_port: c_short,
};
pub const protoent = extern struct {
    p_name: ?[*]u8,
    p_aliases: ?*(?[*]u8),
    p_proto: c_short,
};
pub const in_addr = extern struct {
    S_un: extern union {
        S_un_b: extern struct {
            s_b1: UCHAR,
            s_b2: UCHAR,
            s_b3: UCHAR,
            s_b4: UCHAR,
        },
        S_un_w: extern struct {
            s_w1: USHORT,
            s_w2: USHORT,
        },
        S_addr: ULONG,
    },
};
pub const IN_ADDR = in_addr;
pub const PIN_ADDR = ?*in_addr;
pub const LPIN_ADDR = ?*in_addr;
pub const sockaddr_in = extern struct {
    sin_family: c_short,
    sin_port: u_short,
    sin_addr: in_addr,
    sin_zero: [8]u8,
};
pub const WSAData = extern struct {
    wVersion: WORD,
    wHighVersion: WORD,
    iMaxSockets: c_ushort,
    iMaxUdpDg: c_ushort,
    lpVendorInfo: ?[*]u8,
    szDescription: [257]u8,
    szSystemStatus: [129]u8,
};
pub const WSADATA = WSAData;
pub const LPWSADATA = ?*WSADATA;
pub const ip_mreq = extern struct {
    imr_multiaddr: in_addr,
    imr_interface: in_addr,
};
pub const sockaddr = extern struct {
    sa_family: u_short,
    sa_data: [14]u8,
};
pub const sockproto = extern struct {
    sp_family: u_short,
    sp_protocol: u_short,
};
pub const linger = extern struct {
    l_onoff: u_short,
    l_linger: u_short,
};
pub const TRANSMIT_FILE_BUFFERS = extern struct {
    Head: PVOID,
    HeadLength: DWORD,
    Tail: PVOID,
    TailLength: DWORD,
};

pub const PTRANSMIT_FILE_BUFFERS = ?*TRANSMIT_FILE_BUFFERS;
pub const LPTRANSMIT_FILE_BUFFERS = ?*TRANSMIT_FILE_BUFFERS;
pub const SOCKADDR = sockaddr;
pub const PSOCKADDR = ?*sockaddr;
pub const LPSOCKADDR = ?*sockaddr;
pub const SOCKADDR_IN = sockaddr_in;
pub const PSOCKADDR_IN = ?*sockaddr_in;
pub const LPSOCKADDR_IN = ?*sockaddr_in;
pub const LINGER = linger;
pub const PLINGER = ?*linger;
pub const LPLINGER = ?*linger;
pub const FD_SET = fd_set;
pub const PFD_SET = ?*fd_set;
pub const LPFD_SET = ?*fd_set;
pub const HOSTENT = hostent;
pub const PHOSTENT = ?*hostent;
pub const LPHOSTENT = ?*hostent;
pub const SERVENT = servent;
pub const PSERVENT = ?*servent;
pub const LPSERVENT = ?*servent;
pub const PROTOENT = protoent;
pub const PPROTOENT = ?*protoent;
pub const LPPROTOENT = ?*protoent;
pub const TIMEVAL = timeval;
pub const PTIMEVAL = ?*timeval;
pub const LPTIMEVAL = ?*timeval;
pub const ALG_ID = c_uint;
pub const HCRYPTPROV = ULONG_PTR;
pub const HCRYPTKEY = ULONG_PTR;
pub const HCRYPTHASH = ULONG_PTR;
pub const CMS_KEY_INFO = extern struct {
    dwVersion: DWORD,
    Algid: ALG_ID,
    pbOID: ?*BYTE,
    cbOID: DWORD,
};

pub const PCMS_KEY_INFO = ?*CMS_KEY_INFO;
pub const HMAC_Info = extern struct {
    HashAlgid: ALG_ID,
    pbInnerString: ?*BYTE,
    cbInnerString: DWORD,
    pbOuterString: ?*BYTE,
    cbOuterString: DWORD,
};
pub const HMAC_INFO = HMAC_Info;
pub const PHMAC_INFO = ?*HMAC_Info;
pub const SCHANNEL_ALG = extern struct {
    dwUse: DWORD,
    Algid: ALG_ID,
    cBits: DWORD,
    dwFlags: DWORD,
    dwReserved: DWORD,
};

pub const PSCHANNEL_ALG = ?*SCHANNEL_ALG;
pub const PROV_ENUMALGS = extern struct {
    aiAlgid: ALG_ID,
    dwBitLen: DWORD,
    dwNameLen: DWORD,
    szName: [20]CHAR,
};

pub const PROV_ENUMALGS_EX = extern struct {
    aiAlgid: ALG_ID,
    dwDefaultLen: DWORD,
    dwMinLen: DWORD,
    dwMaxLen: DWORD,
    dwProtocols: DWORD,
    dwNameLen: DWORD,
    szName: [20]CHAR,
    dwLongNameLen: DWORD,
    szLongName: [40]CHAR,
};

pub const PUBLICKEYSTRUC = extern struct {
    bType: BYTE,
    bVersion: BYTE,
    reserved: WORD,
    aiKeyAlg: ALG_ID,
};
pub const BLOBHEADER = PUBLICKEYSTRUC;

pub const RSAPUBKEY = extern struct {
    magic: DWORD,
    bitlen: DWORD,
    pubexp: DWORD,
};

pub const PUBKEY = extern struct {
    magic: DWORD,
    bitlen: DWORD,
};
pub const DHPUBKEY = PUBKEY;
pub const DSSPUBKEY = PUBKEY;
pub const KEAPUBKEY = PUBKEY;
pub const TEKPUBKEY = PUBKEY;
pub const DSSSEED = extern struct {
    counter: DWORD,
    seed: [20]BYTE,
};

pub const PUBKEYVER3 = extern struct {
    magic: DWORD,
    bitlenP: DWORD,
    bitlenQ: DWORD,
    bitlenJ: DWORD,
    DSSSeed: DSSSEED,
};
pub const DHPUBKEY_VER3 = PUBKEYVER3;
pub const DSSPUBKEY_VER3 = PUBKEYVER3;
pub const PRIVKEYVER3 = extern struct {
    magic: DWORD,
    bitlenP: DWORD,
    bitlenQ: DWORD,
    bitlenJ: DWORD,
    bitlenX: DWORD,
    DSSSeed: DSSSEED,
};
pub const DHPRIVKEY_VER3 = PRIVKEYVER3;
pub const DSSPRIVKEY_VER3 = PRIVKEYVER3;
pub const KEY_TYPE_SUBTYPE = extern struct {
    dwKeySpec: DWORD,
    Type: GUID,
    Subtype: GUID,
};

pub const PKEY_TYPE_SUBTYPE = ?*KEY_TYPE_SUBTYPE;
pub const CERT_FORTEZZA_DATA_PROP = extern struct {
    SerialNumber: [8]u8,
    CertIndex: c_int,
    CertLabel: [36]u8,
};

pub const CRYPT_RC4_KEY_STATE = extern struct {
    Key: [16]u8,
    SBox: [256]u8,
    i: u8,
    j: u8,
};

pub const PCRYPT_RC4_KEY_STATE = ?*CRYPT_RC4_KEY_STATE;
pub const CRYPT_DES_KEY_STATE = extern struct {
    Key: [8]u8,
    IV: [8]u8,
    Feedback: [8]u8,
};

pub const PCRYPT_DES_KEY_STATE = ?*CRYPT_DES_KEY_STATE;
pub const CRYPT_3DES_KEY_STATE = extern struct {
    Key: [24]u8,
    IV: [8]u8,
    Feedback: [8]u8,
};

pub const PCRYPT_3DES_KEY_STATE = ?*CRYPT_3DES_KEY_STATE;
pub const CRYPT_AES_128_KEY_STATE = extern struct {
    Key: [16]u8,
    IV: [16]u8,
    EncryptionState: [11][16]u8,
    DecryptionState: [11][16]u8,
    Feedback: [16]u8,
};

pub const PCRYPT_AES_128_KEY_STATE = ?*CRYPT_AES_128_KEY_STATE;
pub const CRYPT_AES_256_KEY_STATE = extern struct {
    Key: [32]u8,
    IV: [16]u8,
    EncryptionState: [15][16]u8,
    DecryptionState: [15][16]u8,
    Feedback: [16]u8,
};

pub const PCRYPT_AES_256_KEY_STATE = ?*CRYPT_AES_256_KEY_STATE;
pub const CRYPTOAPI_BLOB = extern struct {
    cbData: DWORD,
    pbData: ?*BYTE,
};
pub const CRYPT_INTEGER_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_INTEGER_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_UINT_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_UINT_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_OBJID_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_OBJID_BLOB = ?*CRYPTOAPI_BLOB;
pub const CERT_NAME_BLOB = CRYPTOAPI_BLOB;
pub const PCERT_NAME_BLOB = ?*CRYPTOAPI_BLOB;
pub const CERT_RDN_VALUE_BLOB = CRYPTOAPI_BLOB;
pub const PCERT_RDN_VALUE_BLOB = ?*CRYPTOAPI_BLOB;
pub const CERT_BLOB = CRYPTOAPI_BLOB;
pub const PCERT_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRL_BLOB = CRYPTOAPI_BLOB;
pub const PCRL_BLOB = ?*CRYPTOAPI_BLOB;
pub const DATA_BLOB = CRYPTOAPI_BLOB;
pub const PDATA_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_DATA_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_DATA_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_HASH_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_HASH_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_DIGEST_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_DIGEST_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_DER_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_DER_BLOB = ?*CRYPTOAPI_BLOB;
pub const CRYPT_ATTR_BLOB = CRYPTOAPI_BLOB;
pub const PCRYPT_ATTR_BLOB = ?*CRYPTOAPI_BLOB;
pub const CMS_DH_KEY_INFO = extern struct {
    dwVersion: DWORD,
    Algid: ALG_ID,
    pszContentEncObjId: LPSTR,
    PubInfo: CRYPT_DATA_BLOB,
    pReserved: ?*c_void,
};

pub const PCMS_DH_KEY_INFO = ?*CMS_DH_KEY_INFO;
pub const NTSTATUS = LONG;
pub const PNTSTATUS = ?*NTSTATUS;
pub const _BCRYPT_KEY_LENGTHS_STRUCT = extern struct {
    dwMinLength: ULONG,
    dwMaxLength: ULONG,
    dwIncrement: ULONG,
};
pub const BCRYPT_KEY_LENGTHS_STRUCT = _BCRYPT_KEY_LENGTHS_STRUCT;
pub const BCRYPT_AUTH_TAG_LENGTHS_STRUCT = BCRYPT_KEY_LENGTHS_STRUCT;
pub const BCRYPT_OID = extern struct {
    cbOID: ULONG,
    pbOID: PUCHAR,
};

pub const BCRYPT_OID_LIST = extern struct {
    dwOIDCount: ULONG,
    pOIDs: ?*BCRYPT_OID,
};

pub const BCRYPT_PKCS1_PADDING_INFO = extern struct {
    pszAlgId: LPCWSTR,
};

pub const BCRYPT_PSS_PADDING_INFO = extern struct {
    pszAlgId: LPCWSTR,
    cbSalt: ULONG,
};

pub const BCRYPT_OAEP_PADDING_INFO = extern struct {
    pszAlgId: LPCWSTR,
    pbLabel: PUCHAR,
    cbLabel: ULONG,
};

pub const BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO = extern struct {
    cbSize: ULONG,
    dwInfoVersion: ULONG,
    pbNonce: PUCHAR,
    cbNonce: ULONG,
    pbAuthData: PUCHAR,
    cbAuthData: ULONG,
    pbTag: PUCHAR,
    cbTag: ULONG,
    pbMacContext: PUCHAR,
    cbMacContext: ULONG,
    cbAAD: ULONG,
    cbData: ULONGLONG,
    dwFlags: ULONG,
};

pub const PBCRYPT_AUTHENTICATED_CIPHER_MODE_INFO = ?*BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO;
pub const BCryptBuffer = extern struct {
    cbBuffer: ULONG,
    BufferType: ULONG,
    pvBuffer: PVOID,
};

pub const PBCryptBuffer = ?*BCryptBuffer;
pub const BCryptBufferDesc = extern struct {
    ulVersion: ULONG,
    cBuffers: ULONG,
    pBuffers: PBCryptBuffer,
};

pub const PBCryptBufferDesc = ?*BCryptBufferDesc;
pub const BCRYPT_HANDLE = PVOID;
pub const BCRYPT_ALG_HANDLE = PVOID;
pub const BCRYPT_KEY_HANDLE = PVOID;
pub const BCRYPT_HASH_HANDLE = PVOID;
pub const BCRYPT_SECRET_HANDLE = PVOID;
pub const BCRYPT_KEY_BLOB = extern struct {
    Magic: ULONG,
};

pub const BCRYPT_RSAKEY_BLOB = extern struct {
    Magic: ULONG,
    BitLength: ULONG,
    cbPublicExp: ULONG,
    cbModulus: ULONG,
    cbPrime1: ULONG,
    cbPrime2: ULONG,
};

pub const BCRYPT_ECCKEY_BLOB = extern struct {
    dwMagic: ULONG,
    cbKey: ULONG,
};

pub const PBCRYPT_ECCKEY_BLOB = ?*BCRYPT_ECCKEY_BLOB;
pub const SSL_ECCKEY_BLOB = extern struct {
    dwCurveType: ULONG,
    cbKey: ULONG,
};

pub const PSSL_ECCKEY_BLOB = ?*SSL_ECCKEY_BLOB;
pub const ECC_CURVE_TYPE_ENUM = c_int;
pub const ECC_CURVE_ALG_ID_ENUM = c_int;
pub const BCRYPT_ECCFULLKEY_BLOB = extern struct {
    dwMagic: ULONG,
    dwVersion: ULONG,
    dwCurveType: ECC_CURVE_TYPE_ENUM,
    dwCurveGenerationAlgId: ECC_CURVE_ALG_ID_ENUM,
    cbFieldLength: ULONG,
    cbSubgroupOrder: ULONG,
    cbCofactor: ULONG,
    cbSeed: ULONG,
};

pub const PBCRYPT_ECCFULLKEY_BLOB = ?*BCRYPT_ECCFULLKEY_BLOB;
pub const BCRYPT_DH_KEY_BLOB = extern struct {
    dwMagic: ULONG,
    cbKey: ULONG,
};

pub const PBCRYPT_DH_KEY_BLOB = ?*BCRYPT_DH_KEY_BLOB;
pub const BCRYPT_DH_PARAMETER_HEADER = extern struct {
    cbLength: ULONG,
    dwMagic: ULONG,
    cbKeyLength: ULONG,
};

pub const BCRYPT_DSA_KEY_BLOB = extern struct {
    dwMagic: ULONG,
    cbKey: ULONG,
    Count: [4]UCHAR,
    Seed: [20]UCHAR,
    q: [20]UCHAR,
};

pub const PBCRYPT_DSA_KEY_BLOB = ?*BCRYPT_DSA_KEY_BLOB;
pub const HASHALGORITHM_ENUM = extern enum {
    DSA_HASH_ALGORITHM_SHA1,
    DSA_HASH_ALGORITHM_SHA256,
    DSA_HASH_ALGORITHM_SHA512,
};
pub const DSAFIPSVERSION_ENUM = extern enum {
    DSA_FIPS186_2,
    DSA_FIPS186_3,
};
pub const BCRYPT_DSA_KEY_BLOB_V2 = extern struct {
    dwMagic: ULONG,
    cbKey: ULONG,
    hashAlgorithm: HASHALGORITHM_ENUM,
    standardVersion: DSAFIPSVERSION_ENUM,
    cbSeedLength: ULONG,
    cbGroupSize: ULONG,
    Count: [4]UCHAR,
};

pub const PBCRYPT_DSA_KEY_BLOB_V2 = ?*BCRYPT_DSA_KEY_BLOB_V2;
pub const BCRYPT_KEY_DATA_BLOB_HEADER = extern struct {
    dwMagic: ULONG,
    dwVersion: ULONG,
    cbKeyData: ULONG,
};

pub const PBCRYPT_KEY_DATA_BLOB_HEADER = ?*BCRYPT_KEY_DATA_BLOB_HEADER;
pub const BCRYPT_DSA_PARAMETER_HEADER = extern struct {
    cbLength: ULONG,
    dwMagic: ULONG,
    cbKeyLength: ULONG,
    Count: [4]UCHAR,
    Seed: [20]UCHAR,
    q: [20]UCHAR,
};

pub const BCRYPT_DSA_PARAMETER_HEADER_V2 = extern struct {
    cbLength: ULONG,
    dwMagic: ULONG,
    cbKeyLength: ULONG,
    hashAlgorithm: HASHALGORITHM_ENUM,
    standardVersion: DSAFIPSVERSION_ENUM,
    cbSeedLength: ULONG,
    cbGroupSize: ULONG,
    Count: [4]UCHAR,
};

pub const BCRYPT_ECC_CURVE_NAMES = extern struct {
    dwEccCurveNames: ULONG,
    pEccCurveNames: ?*LPWSTR,
};

pub const BCRYPT_HASH_OPERATION_TYPE = c_int;
pub const BCRYPT_MULTI_HASH_OPERATION = extern struct {
    iHash: ULONG,
    hashOperation: BCRYPT_HASH_OPERATION_TYPE,
    pbBuffer: PUCHAR,
    cbBuffer: ULONG,
};

pub const BCRYPT_MULTI_OPERATION_TYPE = c_int;
pub const BCRYPT_MULTI_OBJECT_LENGTH_STRUCT = extern struct {
    cbPerObject: ULONG,
    cbPerElement: ULONG,
};

pub const BCRYPT_ALGORITHM_IDENTIFIER = extern struct {
    pszName: LPWSTR,
    dwClass: ULONG,
    dwFlags: ULONG,
};

pub const BCRYPT_PROVIDER_NAME = extern struct {
    pszProviderName: LPWSTR,
};

pub const BCRYPT_INTERFACE_VERSION = extern struct {
    MajorVersion: USHORT,
    MinorVersion: USHORT,
};

pub const PBCRYPT_INTERFACE_VERSION = ?*BCRYPT_INTERFACE_VERSION;
pub const CRYPT_INTERFACE_REG = extern struct {
    dwInterface: ULONG,
    dwFlags: ULONG,
    cFunctions: ULONG,
    rgpszFunctions: ?*PWSTR,
};

pub const PCRYPT_INTERFACE_REG = ?*CRYPT_INTERFACE_REG;
pub const CRYPT_IMAGE_REG = extern struct {
    pszImage: PWSTR,
    cInterfaces: ULONG,
    rgpInterfaces: ?*PCRYPT_INTERFACE_REG,
};

pub const PCRYPT_IMAGE_REG = ?*CRYPT_IMAGE_REG;
pub const CRYPT_PROVIDER_REG = extern struct {
    cAliases: ULONG,
    rgpszAliases: ?*PWSTR,
    pUM: PCRYPT_IMAGE_REG,
    pKM: PCRYPT_IMAGE_REG,
};

pub const PCRYPT_PROVIDER_REG = ?*CRYPT_PROVIDER_REG;
pub const CRYPT_PROVIDERS = extern struct {
    cProviders: ULONG,
    rgpszProviders: ?*PWSTR,
};

pub const PCRYPT_PROVIDERS = ?*CRYPT_PROVIDERS;
pub const CRYPT_CONTEXT_CONFIG = extern struct {
    dwFlags: ULONG,
    dwReserved: ULONG,
};

pub const PCRYPT_CONTEXT_CONFIG = ?*CRYPT_CONTEXT_CONFIG;
pub const CRYPT_CONTEXT_FUNCTION_CONFIG = extern struct {
    dwFlags: ULONG,
    dwReserved: ULONG,
};

pub const PCRYPT_CONTEXT_FUNCTION_CONFIG = ?*CRYPT_CONTEXT_FUNCTION_CONFIG;
pub const CRYPT_CONTEXTS = extern struct {
    cContexts: ULONG,
    rgpszContexts: ?*PWSTR,
};

pub const PCRYPT_CONTEXTS = ?*CRYPT_CONTEXTS;
pub const CRYPT_CONTEXT_FUNCTIONS = extern struct {
    cFunctions: ULONG,
    rgpszFunctions: ?*PWSTR,
};

pub const PCRYPT_CONTEXT_FUNCTIONS = ?*CRYPT_CONTEXT_FUNCTIONS;
pub const CRYPT_CONTEXT_FUNCTION_PROVIDERS = extern struct {
    cProviders: ULONG,
    rgpszProviders: ?*PWSTR,
};

pub const PCRYPT_CONTEXT_FUNCTION_PROVIDERS = ?*CRYPT_CONTEXT_FUNCTION_PROVIDERS;
pub const CRYPT_PROPERTY_REF = extern struct {
    pszProperty: PWSTR,
    cbValue: ULONG,
    pbValue: PUCHAR,
};

pub const PCRYPT_PROPERTY_REF = ?*CRYPT_PROPERTY_REF;
pub const CRYPT_IMAGE_REF = extern struct {
    pszImage: PWSTR,
    dwFlags: ULONG,
};

pub const PCRYPT_IMAGE_REF = ?*CRYPT_IMAGE_REF;
pub const CRYPT_PROVIDER_REF = extern struct {
    dwInterface: ULONG,
    pszFunction: PWSTR,
    pszProvider: PWSTR,
    cProperties: ULONG,
    rgpProperties: ?*PCRYPT_PROPERTY_REF,
    pUM: PCRYPT_IMAGE_REF,
    pKM: PCRYPT_IMAGE_REF,
};

pub const PCRYPT_PROVIDER_REF = ?*CRYPT_PROVIDER_REF;
pub const CRYPT_PROVIDER_REFS = extern struct {
    cProviders: ULONG,
    rgpProviders: ?*PCRYPT_PROVIDER_REF,
};

pub const PCRYPT_PROVIDER_REFS = ?*CRYPT_PROVIDER_REFS;
pub const SECURITY_STATUS = LONG;
pub const PFN_NCRYPT_ALLOC = ?extern fn(SIZE_T) LPVOID;
pub const PFN_NCRYPT_FREE = ?extern fn(LPVOID) void;
pub const NCRYPT_ALLOC_PARA = extern struct {
    cbSize: DWORD,
    pfnAlloc: PFN_NCRYPT_ALLOC,
    pfnFree: PFN_NCRYPT_FREE,
};

pub const NCryptBuffer = BCryptBuffer;
pub const PNCryptBuffer = ?*BCryptBuffer;
pub const NCryptBufferDesc = BCryptBufferDesc;
pub const PNCryptBufferDesc = ?*BCryptBufferDesc;
pub const NCRYPT_HANDLE = ULONG_PTR;
pub const NCRYPT_PROV_HANDLE = ULONG_PTR;
pub const NCRYPT_KEY_HANDLE = ULONG_PTR;
pub const NCRYPT_HASH_HANDLE = ULONG_PTR;
pub const NCRYPT_SECRET_HANDLE = ULONG_PTR;
pub const NCRYPT_CIPHER_PADDING_INFO = extern struct {
    cbSize: ULONG,
    dwFlags: DWORD,
    pbIV: PUCHAR,
    cbIV: ULONG,
    pbOtherInfo: PUCHAR,
    cbOtherInfo: ULONG,
};

pub const PNCRYPT_CIPHER_PADDING_INFO = ?*NCRYPT_CIPHER_PADDING_INFO;
pub const NCRYPT_PLATFORM_ATTEST_PADDING_INFO = extern struct {
    magic: ULONG,
    pcrMask: ULONG,
};

pub const NCRYPT_KEY_ATTEST_PADDING_INFO = extern struct {
    magic: ULONG,
    pbKeyBlob: PUCHAR,
    cbKeyBlob: ULONG,
    pbKeyAuth: PUCHAR,
    cbKeyAuth: ULONG,
};

pub const NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES = extern struct {
    Version: ULONG,
    Flags: ULONG,
    cbPublicKeyBlob: ULONG,
};

pub const PNCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES = ?*NCRYPT_ISOLATED_KEY_ATTESTED_ATTRIBUTES;
pub const NCRYPT_VSM_KEY_ATTESTATION_STATEMENT = extern struct {
    Magic: ULONG,
    Version: ULONG,
    cbSignature: ULONG,
    cbReport: ULONG,
    cbAttributes: ULONG,
};

pub const PNCRYPT_VSM_KEY_ATTESTATION_STATEMENT = ?*NCRYPT_VSM_KEY_ATTESTATION_STATEMENT;
pub const NCRYPT_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS = @OpaqueType();

pub const PNCRYPT_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS = ?*NCRYPT_VSM_KEY_ATTESTATION_CLAIM_RESTRICTIONS;
pub const NCRYPT_EXPORTED_ISOLATED_KEY_HEADER = @OpaqueType();

pub const PNCRYPT_EXPORTED_ISOLATED_KEY_HEADER = ?*NCRYPT_EXPORTED_ISOLATED_KEY_HEADER;
pub const NCRYPT_EXPORTED_ISOLATED_KEY_ENVELOPE = extern struct {
    Header: NCRYPT_EXPORTED_ISOLATED_KEY_HEADER,
};

pub const PNCRYPT_EXPORTED_ISOLATED_KEY_ENVELOPE = ?*NCRYPT_EXPORTED_ISOLATED_KEY_ENVELOPE;
pub const _NCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT = extern struct {
    Magic: UINT32,
    Version: UINT32,
    HeaderSize: UINT32,
    cbCertifyInfo: UINT32,
    cbSignature: UINT32,
    cbTpmPublic: UINT32,
};
pub const NCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT = _NCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT;
pub const PNCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT = ?*_NCRYPT_PCP_TPM_WEB_AUTHN_ATTESTATION_STATEMENT;
pub const NCryptAlgorithmName = extern struct {
    pszName: LPWSTR,
    dwClass: DWORD,
    dwAlgOperations: DWORD,
    dwFlags: DWORD,
};

pub const NCryptKeyName = extern struct {
    pszName: LPWSTR,
    pszAlgid: LPWSTR,
    dwLegacyKeySpec: DWORD,
    dwFlags: DWORD,
};

pub const NCryptProviderName = extern struct {
    pszName: LPWSTR,
    pszComment: LPWSTR,
};

pub const _NCRYPT_UI_POLICY = extern struct {
    dwVersion: DWORD,
    dwFlags: DWORD,
    pszCreationTitle: LPCWSTR,
    pszFriendlyName: LPCWSTR,
    pszDescription: LPCWSTR,
};
pub const NCRYPT_UI_POLICY = _NCRYPT_UI_POLICY;
pub const _NCRYPT_KEY_ACCESS_POLICY_BLOB = extern struct {
    dwVersion: DWORD,
    dwPolicyFlags: DWORD,
    cbUserSid: DWORD,
    cbApplicationSid: DWORD,
};
pub const NCRYPT_KEY_ACCESS_POLICY_BLOB = _NCRYPT_KEY_ACCESS_POLICY_BLOB;
pub const _NCRYPT_SUPPORTED_LENGTHS = extern struct {
    dwMinLength: DWORD,
    dwMaxLength: DWORD,
    dwIncrement: DWORD,
    dwDefaultLength: DWORD,
};
pub const NCRYPT_SUPPORTED_LENGTHS = _NCRYPT_SUPPORTED_LENGTHS;
pub const _NCRYPT_PCP_HMAC_AUTH_SIGNATURE_INFO = extern struct {
    dwVersion: DWORD,
    iExpiration: INT32,
    pabNonce: [32]BYTE,
    pabPolicyRef: [32]BYTE,
    pabHMAC: [32]BYTE,
};
pub const NCRYPT_PCP_HMAC_AUTH_SIGNATURE_INFO = _NCRYPT_PCP_HMAC_AUTH_SIGNATURE_INFO;
pub const _NCRYPT_PCP_TPM_FW_VERSION_INFO = extern struct {
    major1: UINT16,
    major2: UINT16,
    minor1: UINT16,
    minor2: UINT16,
};
pub const NCRYPT_PCP_TPM_FW_VERSION_INFO = _NCRYPT_PCP_TPM_FW_VERSION_INFO;
pub const NCRYPT_KEY_BLOB_HEADER = extern struct {
    cbSize: ULONG,
    dwMagic: ULONG,
    cbAlgName: ULONG,
    cbKeyData: ULONG,
};

pub const PNCRYPT_KEY_BLOB_HEADER = ?*NCRYPT_KEY_BLOB_HEADER;
pub const NCRYPT_TPM_LOADABLE_KEY_BLOB_HEADER = extern struct {
    magic: DWORD,
    cbHeader: DWORD,
    cbPublic: DWORD,
    cbPrivate: DWORD,
    cbName: DWORD,
};

pub const PNCRYPT_TPM_LOADABLE_KEY_BLOB_HEADER = ?*NCRYPT_TPM_LOADABLE_KEY_BLOB_HEADER;
pub const HCRYPTPROV_OR_NCRYPT_KEY_HANDLE = ULONG_PTR;
pub const HCRYPTPROV_LEGACY = ULONG_PTR;
pub const CRYPT_BIT_BLOB = extern struct {
    cbData: DWORD,
    pbData: ?*BYTE,
    cUnusedBits: DWORD,
};

pub const PCRYPT_BIT_BLOB = ?*CRYPT_BIT_BLOB;
pub const CRYPT_ALGORITHM_IDENTIFIER = extern struct {
    pszObjId: LPSTR,
    Parameters: CRYPT_OBJID_BLOB,
};

pub const PCRYPT_ALGORITHM_IDENTIFIER = ?*CRYPT_ALGORITHM_IDENTIFIER;
pub const CRYPT_OBJID_TABLE = extern struct {
    dwAlgId: DWORD,
    pszObjId: LPCSTR,
};

pub const PCRYPT_OBJID_TABLE = ?*CRYPT_OBJID_TABLE;
pub const CRYPT_HASH_INFO = extern struct {
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    Hash: CRYPT_HASH_BLOB,
};

pub const PCRYPT_HASH_INFO = ?*CRYPT_HASH_INFO;
pub const CERT_EXTENSION = extern struct {
    pszObjId: LPSTR,
    fCritical: BOOL,
    Value: CRYPT_OBJID_BLOB,
};

pub const PCERT_EXTENSION = ?*CERT_EXTENSION;
pub const PCCERT_EXTENSION = ?*const CERT_EXTENSION;
pub const CRYPT_ATTRIBUTE_TYPE_VALUE = extern struct {
    pszObjId: LPSTR,
    Value: CRYPT_OBJID_BLOB,
};

pub const PCRYPT_ATTRIBUTE_TYPE_VALUE = ?*CRYPT_ATTRIBUTE_TYPE_VALUE;
pub const CRYPT_ATTRIBUTE = extern struct {
    pszObjId: LPSTR,
    cValue: DWORD,
    rgValue: PCRYPT_ATTR_BLOB,
};

pub const PCRYPT_ATTRIBUTE = ?*CRYPT_ATTRIBUTE;
pub const CRYPT_ATTRIBUTES = extern struct {
    cAttr: DWORD,
    rgAttr: PCRYPT_ATTRIBUTE,
};

pub const PCRYPT_ATTRIBUTES = ?*CRYPT_ATTRIBUTES;
pub const CERT_RDN_ATTR = extern struct {
    pszObjId: LPSTR,
    dwValueType: DWORD,
    Value: CERT_RDN_VALUE_BLOB,
};

pub const PCERT_RDN_ATTR = ?*CERT_RDN_ATTR;
pub const CERT_RDN = extern struct {
    cRDNAttr: DWORD,
    rgRDNAttr: PCERT_RDN_ATTR,
};

pub const PCERT_RDN = ?*CERT_RDN;
pub const CERT_NAME_INFO = extern struct {
    cRDN: DWORD,
    rgRDN: PCERT_RDN,
};

pub const PCERT_NAME_INFO = ?*CERT_NAME_INFO;
pub const CERT_NAME_VALUE = extern struct {
    dwValueType: DWORD,
    Value: CERT_RDN_VALUE_BLOB,
};

pub const PCERT_NAME_VALUE = ?*CERT_NAME_VALUE;
pub const CERT_PUBLIC_KEY_INFO = extern struct {
    Algorithm: CRYPT_ALGORITHM_IDENTIFIER,
    PublicKey: CRYPT_BIT_BLOB,
};

pub const PCERT_PUBLIC_KEY_INFO = ?*CERT_PUBLIC_KEY_INFO;
pub const CRYPT_ECC_PRIVATE_KEY_INFO = extern struct {
    dwVersion: DWORD,
    PrivateKey: CRYPT_DER_BLOB,
    szCurveOid: LPSTR,
    PublicKey: CRYPT_BIT_BLOB,
};

pub const PCRYPT_ECC_PRIVATE_KEY_INFO = ?*CRYPT_ECC_PRIVATE_KEY_INFO;
pub const CRYPT_PRIVATE_KEY_INFO = extern struct {
    Version: DWORD,
    Algorithm: CRYPT_ALGORITHM_IDENTIFIER,
    PrivateKey: CRYPT_DER_BLOB,
    pAttributes: PCRYPT_ATTRIBUTES,
};

pub const PCRYPT_PRIVATE_KEY_INFO = ?*CRYPT_PRIVATE_KEY_INFO;
pub const CRYPT_ENCRYPTED_PRIVATE_KEY_INFO = extern struct {
    EncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedPrivateKey: CRYPT_DATA_BLOB,
};

pub const PCRYPT_ENCRYPTED_PRIVATE_KEY_INFO = ?*CRYPT_ENCRYPTED_PRIVATE_KEY_INFO;
pub const PCRYPT_DECRYPT_PRIVATE_KEY_FUNC = ?extern fn(CRYPT_ALGORITHM_IDENTIFIER, CRYPT_DATA_BLOB, ?*BYTE, ?*DWORD, LPVOID) BOOL;
pub const PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC = ?extern fn(?*CRYPT_ALGORITHM_IDENTIFIER, ?*CRYPT_DATA_BLOB, ?*BYTE, ?*DWORD, LPVOID) BOOL;
pub const PCRYPT_RESOLVE_HCRYPTPROV_FUNC = ?extern fn(?*CRYPT_PRIVATE_KEY_INFO, ?*HCRYPTPROV, LPVOID) BOOL;
pub const CRYPT_PKCS8_IMPORT_PARAMS = extern struct {
    PrivateKey: CRYPT_DIGEST_BLOB,
    pResolvehCryptProvFunc: PCRYPT_RESOLVE_HCRYPTPROV_FUNC,
    pVoidResolveFunc: LPVOID,
    pDecryptPrivateKeyFunc: PCRYPT_DECRYPT_PRIVATE_KEY_FUNC,
    pVoidDecryptFunc: LPVOID,
};

pub const PCRYPT_PKCS8_IMPORT_PARAMS = ?*CRYPT_PKCS8_IMPORT_PARAMS;
pub const CRYPT_PRIVATE_KEY_BLOB_AND_PARAMS = CRYPT_PKCS8_IMPORT_PARAMS;
pub const PCRYPT_PRIVATE_KEY_BLOB_AND_PARAMS = ?*CRYPT_PKCS8_IMPORT_PARAMS;
pub const CRYPT_PKCS8_EXPORT_PARAMS = extern struct {
    hCryptProv: HCRYPTPROV,
    dwKeySpec: DWORD,
    pszPrivateKeyObjId: LPSTR,
    pEncryptPrivateKeyFunc: PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC,
    pVoidEncryptFunc: LPVOID,
};

pub const PCRYPT_PKCS8_EXPORT_PARAMS = ?*CRYPT_PKCS8_EXPORT_PARAMS;
pub const CERT_INFO = extern struct {
    dwVersion: DWORD,
    SerialNumber: CRYPT_INTEGER_BLOB,
    SignatureAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    Issuer: CERT_NAME_BLOB,
    NotBefore: FILETIME,
    NotAfter: FILETIME,
    Subject: CERT_NAME_BLOB,
    SubjectPublicKeyInfo: CERT_PUBLIC_KEY_INFO,
    IssuerUniqueId: CRYPT_BIT_BLOB,
    SubjectUniqueId: CRYPT_BIT_BLOB,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCERT_INFO = ?*CERT_INFO;
pub const CRL_ENTRY = extern struct {
    SerialNumber: CRYPT_INTEGER_BLOB,
    RevocationDate: FILETIME,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCRL_ENTRY = ?*CRL_ENTRY;
pub const CRL_INFO = extern struct {
    dwVersion: DWORD,
    SignatureAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    Issuer: CERT_NAME_BLOB,
    ThisUpdate: FILETIME,
    NextUpdate: FILETIME,
    cCRLEntry: DWORD,
    rgCRLEntry: PCRL_ENTRY,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCRL_INFO = ?*CRL_INFO;
pub const CERT_OR_CRL_BLOB = extern struct {
    dwChoice: DWORD,
    cbEncoded: DWORD,
    pbEncoded: ?*BYTE,
};

pub const PCERT_OR_CRL_BLOB = ?*CERT_OR_CRL_BLOB;
pub const CERT_OR_CRL_BUNDLE = extern struct {
    cItem: DWORD,
    rgItem: PCERT_OR_CRL_BLOB,
};

pub const PCERT_OR_CRL_BUNDLE = ?*CERT_OR_CRL_BUNDLE;
pub const CERT_REQUEST_INFO = extern struct {
    dwVersion: DWORD,
    Subject: CERT_NAME_BLOB,
    SubjectPublicKeyInfo: CERT_PUBLIC_KEY_INFO,
    cAttribute: DWORD,
    rgAttribute: PCRYPT_ATTRIBUTE,
};

pub const PCERT_REQUEST_INFO = ?*CERT_REQUEST_INFO;
pub const CERT_KEYGEN_REQUEST_INFO = extern struct {
    dwVersion: DWORD,
    SubjectPublicKeyInfo: CERT_PUBLIC_KEY_INFO,
    pwszChallengeString: LPWSTR,
};

pub const PCERT_KEYGEN_REQUEST_INFO = ?*CERT_KEYGEN_REQUEST_INFO;
pub const CERT_SIGNED_CONTENT_INFO = extern struct {
    ToBeSigned: CRYPT_DER_BLOB,
    SignatureAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    Signature: CRYPT_BIT_BLOB,
};

pub const PCERT_SIGNED_CONTENT_INFO = ?*CERT_SIGNED_CONTENT_INFO;
pub const CTL_USAGE = extern struct {
    cUsageIdentifier: DWORD,
    rgpszUsageIdentifier: ?*LPSTR,
};

pub const PCTL_USAGE = ?*CTL_USAGE;
pub const CERT_ENHKEY_USAGE = CTL_USAGE;
pub const PCERT_ENHKEY_USAGE = ?*CTL_USAGE;
pub const PCCTL_USAGE = ?*const CTL_USAGE;
pub const PCCERT_ENHKEY_USAGE = ?*const CERT_ENHKEY_USAGE;
pub const CTL_ENTRY = extern struct {
    SubjectIdentifier: CRYPT_DATA_BLOB,
    cAttribute: DWORD,
    rgAttribute: PCRYPT_ATTRIBUTE,
};

pub const PCTL_ENTRY = ?*CTL_ENTRY;
pub const CTL_INFO = extern struct {
    dwVersion: DWORD,
    SubjectUsage: CTL_USAGE,
    ListIdentifier: CRYPT_DATA_BLOB,
    SequenceNumber: CRYPT_INTEGER_BLOB,
    ThisUpdate: FILETIME,
    NextUpdate: FILETIME,
    SubjectAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    cCTLEntry: DWORD,
    rgCTLEntry: PCTL_ENTRY,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCTL_INFO = ?*CTL_INFO;
pub const CRYPT_TIME_STAMP_REQUEST_INFO = extern struct {
    pszTimeStampAlgorithm: LPSTR,
    pszContentType: LPSTR,
    Content: CRYPT_OBJID_BLOB,
    cAttribute: DWORD,
    rgAttribute: PCRYPT_ATTRIBUTE,
};

pub const PCRYPT_TIME_STAMP_REQUEST_INFO = ?*CRYPT_TIME_STAMP_REQUEST_INFO;
pub const CRYPT_ENROLLMENT_NAME_VALUE_PAIR = extern struct {
    pwszName: LPWSTR,
    pwszValue: LPWSTR,
};

pub const PCRYPT_ENROLLMENT_NAME_VALUE_PAIR = ?*CRYPT_ENROLLMENT_NAME_VALUE_PAIR;
pub const CRYPT_CSP_PROVIDER = extern struct {
    dwKeySpec: DWORD,
    pwszProviderName: LPWSTR,
    Signature: CRYPT_BIT_BLOB,
};

pub const PCRYPT_CSP_PROVIDER = ?*CRYPT_CSP_PROVIDER;
pub const PFN_CRYPT_ALLOC = ?extern fn(usize) LPVOID;
pub const PFN_CRYPT_FREE = ?extern fn(LPVOID) void;
pub const CRYPT_ENCODE_PARA = extern struct {
    cbSize: DWORD,
    pfnAlloc: PFN_CRYPT_ALLOC,
    pfnFree: PFN_CRYPT_FREE,
};

pub const PCRYPT_ENCODE_PARA = ?*CRYPT_ENCODE_PARA;
pub const CRYPT_DECODE_PARA = extern struct {
    cbSize: DWORD,
    pfnAlloc: PFN_CRYPT_ALLOC,
    pfnFree: PFN_CRYPT_FREE,
};

pub const PCRYPT_DECODE_PARA = ?*CRYPT_DECODE_PARA;
pub const CERT_EXTENSIONS = extern struct {
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCERT_EXTENSIONS = ?*CERT_EXTENSIONS;
pub const CERT_AUTHORITY_KEY_ID_INFO = extern struct {
    KeyId: CRYPT_DATA_BLOB,
    CertIssuer: CERT_NAME_BLOB,
    CertSerialNumber: CRYPT_INTEGER_BLOB,
};

pub const PCERT_AUTHORITY_KEY_ID_INFO = ?*CERT_AUTHORITY_KEY_ID_INFO;
pub const CERT_PRIVATE_KEY_VALIDITY = extern struct {
    NotBefore: FILETIME,
    NotAfter: FILETIME,
};

pub const PCERT_PRIVATE_KEY_VALIDITY = ?*CERT_PRIVATE_KEY_VALIDITY;
pub const CERT_KEY_ATTRIBUTES_INFO = extern struct {
    KeyId: CRYPT_DATA_BLOB,
    IntendedKeyUsage: CRYPT_BIT_BLOB,
    pPrivateKeyUsagePeriod: PCERT_PRIVATE_KEY_VALIDITY,
};

pub const PCERT_KEY_ATTRIBUTES_INFO = ?*CERT_KEY_ATTRIBUTES_INFO;
pub const CERT_POLICY_ID = extern struct {
    cCertPolicyElementId: DWORD,
    rgpszCertPolicyElementId: ?*LPSTR,
};

pub const PCERT_POLICY_ID = ?*CERT_POLICY_ID;
pub const CERT_KEY_USAGE_RESTRICTION_INFO = extern struct {
    cCertPolicyId: DWORD,
    rgCertPolicyId: PCERT_POLICY_ID,
    RestrictedKeyUsage: CRYPT_BIT_BLOB,
};

pub const PCERT_KEY_USAGE_RESTRICTION_INFO = ?*CERT_KEY_USAGE_RESTRICTION_INFO;
pub const CERT_OTHER_NAME = extern struct {
    pszObjId: LPSTR,
    Value: CRYPT_OBJID_BLOB,
};

pub const PCERT_OTHER_NAME = ?*CERT_OTHER_NAME;
pub const CERT_ALT_NAME_ENTRY = extern struct {
    dwAltNameChoice: DWORD,
    u: extern union {
        pOtherName: PCERT_OTHER_NAME,
        pwszRfc822Name: LPWSTR,
        pwszDNSName: LPWSTR,
        DirectoryName: CERT_NAME_BLOB,
        pwszURL: LPWSTR,
        IPAddress: CRYPT_DATA_BLOB,
        pszRegisteredID: LPSTR,
    },
};

pub const PCERT_ALT_NAME_ENTRY = ?*CERT_ALT_NAME_ENTRY;
pub const CERT_ALT_NAME_INFO = extern struct {
    cAltEntry: DWORD,
    rgAltEntry: PCERT_ALT_NAME_ENTRY,
};

pub const PCERT_ALT_NAME_INFO = ?*CERT_ALT_NAME_INFO;
pub const CERT_BASIC_CONSTRAINTS_INFO = extern struct {
    SubjectType: CRYPT_BIT_BLOB,
    fPathLenConstraint: BOOL,
    dwPathLenConstraint: DWORD,
    cSubtreesConstraint: DWORD,
    rgSubtreesConstraint: ?*CERT_NAME_BLOB,
};

pub const PCERT_BASIC_CONSTRAINTS_INFO = ?*CERT_BASIC_CONSTRAINTS_INFO;
pub const CERT_BASIC_CONSTRAINTS2_INFO = extern struct {
    fCA: BOOL,
    fPathLenConstraint: BOOL,
    dwPathLenConstraint: DWORD,
};

pub const PCERT_BASIC_CONSTRAINTS2_INFO = ?*CERT_BASIC_CONSTRAINTS2_INFO;
pub const CERT_POLICY_QUALIFIER_INFO = extern struct {
    pszPolicyQualifierId: LPSTR,
    Qualifier: CRYPT_OBJID_BLOB,
};

pub const PCERT_POLICY_QUALIFIER_INFO = ?*CERT_POLICY_QUALIFIER_INFO;
pub const CERT_POLICY_INFO = extern struct {
    pszPolicyIdentifier: LPSTR,
    cPolicyQualifier: DWORD,
    rgPolicyQualifier: ?*CERT_POLICY_QUALIFIER_INFO,
};

pub const PCERT_POLICY_INFO = ?*CERT_POLICY_INFO;
pub const CERT_POLICIES_INFO = extern struct {
    cPolicyInfo: DWORD,
    rgPolicyInfo: ?*CERT_POLICY_INFO,
};

pub const PCERT_POLICIES_INFO = ?*CERT_POLICIES_INFO;
pub const CERT_POLICY_QUALIFIER_NOTICE_REFERENCE = extern struct {
    pszOrganization: LPSTR,
    cNoticeNumbers: DWORD,
    rgNoticeNumbers: ?*c_int,
};

pub const PCERT_POLICY_QUALIFIER_NOTICE_REFERENCE = ?*CERT_POLICY_QUALIFIER_NOTICE_REFERENCE;
pub const CERT_POLICY_QUALIFIER_USER_NOTICE = extern struct {
    pNoticeReference: ?*CERT_POLICY_QUALIFIER_NOTICE_REFERENCE,
    pszDisplayText: LPWSTR,
};

pub const PCERT_POLICY_QUALIFIER_USER_NOTICE = ?*CERT_POLICY_QUALIFIER_USER_NOTICE;
pub const CPS_URLS = extern struct {
    pszURL: LPWSTR,
    pAlgorithm: ?*CRYPT_ALGORITHM_IDENTIFIER,
    pDigest: ?*CRYPT_DATA_BLOB,
};

pub const PCPS_URLS = ?*CPS_URLS;
pub const CERT_POLICY95_QUALIFIER1 = extern struct {
    pszPracticesReference: LPWSTR,
    pszNoticeIdentifier: LPSTR,
    pszNSINoticeIdentifier: LPSTR,
    cCPSURLs: DWORD,
    rgCPSURLs: ?*CPS_URLS,
};

pub const PCERT_POLICY95_QUALIFIER1 = ?*CERT_POLICY95_QUALIFIER1;
pub const CERT_POLICY_MAPPING = extern struct {
    pszIssuerDomainPolicy: LPSTR,
    pszSubjectDomainPolicy: LPSTR,
};

pub const PCERT_POLICY_MAPPING = ?*CERT_POLICY_MAPPING;
pub const CERT_POLICY_MAPPINGS_INFO = extern struct {
    cPolicyMapping: DWORD,
    rgPolicyMapping: PCERT_POLICY_MAPPING,
};

pub const PCERT_POLICY_MAPPINGS_INFO = ?*CERT_POLICY_MAPPINGS_INFO;
pub const CERT_POLICY_CONSTRAINTS_INFO = extern struct {
    fRequireExplicitPolicy: BOOL,
    dwRequireExplicitPolicySkipCerts: DWORD,
    fInhibitPolicyMapping: BOOL,
    dwInhibitPolicyMappingSkipCerts: DWORD,
};

pub const PCERT_POLICY_CONSTRAINTS_INFO = ?*CERT_POLICY_CONSTRAINTS_INFO;
pub const CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY = extern struct {
    pszObjId: LPSTR,
    cValue: DWORD,
    rgValue: PCRYPT_DER_BLOB,
};

pub const PCRYPT_CONTENT_INFO_SEQUENCE_OF_ANY = ?*CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY;
pub const CRYPT_CONTENT_INFO = extern struct {
    pszObjId: LPSTR,
    Content: CRYPT_DER_BLOB,
};

pub const PCRYPT_CONTENT_INFO = ?*CRYPT_CONTENT_INFO;
pub const CRYPT_SEQUENCE_OF_ANY = extern struct {
    cValue: DWORD,
    rgValue: PCRYPT_DER_BLOB,
};

pub const PCRYPT_SEQUENCE_OF_ANY = ?*CRYPT_SEQUENCE_OF_ANY;
pub const CERT_AUTHORITY_KEY_ID2_INFO = extern struct {
    KeyId: CRYPT_DATA_BLOB,
    AuthorityCertIssuer: CERT_ALT_NAME_INFO,
    AuthorityCertSerialNumber: CRYPT_INTEGER_BLOB,
};

pub const PCERT_AUTHORITY_KEY_ID2_INFO = ?*CERT_AUTHORITY_KEY_ID2_INFO;
pub const CERT_ACCESS_DESCRIPTION = extern struct {
    pszAccessMethod: LPSTR,
    AccessLocation: CERT_ALT_NAME_ENTRY,
};

pub const PCERT_ACCESS_DESCRIPTION = ?*CERT_ACCESS_DESCRIPTION;
pub const CERT_AUTHORITY_INFO_ACCESS = extern struct {
    cAccDescr: DWORD,
    rgAccDescr: PCERT_ACCESS_DESCRIPTION,
};

pub const PCERT_AUTHORITY_INFO_ACCESS = ?*CERT_AUTHORITY_INFO_ACCESS;
pub const CERT_SUBJECT_INFO_ACCESS = CERT_AUTHORITY_INFO_ACCESS;
pub const PCERT_SUBJECT_INFO_ACCESS = ?*CERT_AUTHORITY_INFO_ACCESS;
pub const CRL_DIST_POINT_NAME = extern struct {
    dwDistPointNameChoice: DWORD,
    u: extern union {
        FullName: CERT_ALT_NAME_INFO,
    },
};

pub const PCRL_DIST_POINT_NAME = ?*CRL_DIST_POINT_NAME;
pub const CRL_DIST_POINT = extern struct {
    DistPointName: CRL_DIST_POINT_NAME,
    ReasonFlags: CRYPT_BIT_BLOB,
    CRLIssuer: CERT_ALT_NAME_INFO,
};

pub const PCRL_DIST_POINT = ?*CRL_DIST_POINT;
pub const CRL_DIST_POINTS_INFO = extern struct {
    cDistPoint: DWORD,
    rgDistPoint: PCRL_DIST_POINT,
};

pub const PCRL_DIST_POINTS_INFO = ?*CRL_DIST_POINTS_INFO;
pub const CROSS_CERT_DIST_POINTS_INFO = extern struct {
    dwSyncDeltaTime: DWORD,
    cDistPoint: DWORD,
    rgDistPoint: PCERT_ALT_NAME_INFO,
};

pub const PCROSS_CERT_DIST_POINTS_INFO = ?*CROSS_CERT_DIST_POINTS_INFO;
pub const CERT_PAIR = extern struct {
    Forward: CERT_BLOB,
    Reverse: CERT_BLOB,
};

pub const PCERT_PAIR = ?*CERT_PAIR;
pub const CRL_ISSUING_DIST_POINT = extern struct {
    DistPointName: CRL_DIST_POINT_NAME,
    fOnlyContainsUserCerts: BOOL,
    fOnlyContainsCACerts: BOOL,
    OnlySomeReasonFlags: CRYPT_BIT_BLOB,
    fIndirectCRL: BOOL,
};

pub const PCRL_ISSUING_DIST_POINT = ?*CRL_ISSUING_DIST_POINT;
pub const CERT_GENERAL_SUBTREE = extern struct {
    Base: CERT_ALT_NAME_ENTRY,
    dwMinimum: DWORD,
    fMaximum: BOOL,
    dwMaximum: DWORD,
};

pub const PCERT_GENERAL_SUBTREE = ?*CERT_GENERAL_SUBTREE;
pub const CERT_NAME_CONSTRAINTS_INFO = extern struct {
    cPermittedSubtree: DWORD,
    rgPermittedSubtree: PCERT_GENERAL_SUBTREE,
    cExcludedSubtree: DWORD,
    rgExcludedSubtree: PCERT_GENERAL_SUBTREE,
};

pub const PCERT_NAME_CONSTRAINTS_INFO = ?*CERT_NAME_CONSTRAINTS_INFO;
pub const CERT_DSS_PARAMETERS = extern struct {
    p: CRYPT_UINT_BLOB,
    q: CRYPT_UINT_BLOB,
    g: CRYPT_UINT_BLOB,
};

pub const PCERT_DSS_PARAMETERS = ?*CERT_DSS_PARAMETERS;
pub const CERT_DH_PARAMETERS = extern struct {
    p: CRYPT_UINT_BLOB,
    g: CRYPT_UINT_BLOB,
};

pub const PCERT_DH_PARAMETERS = ?*CERT_DH_PARAMETERS;
pub const CERT_ECC_SIGNATURE = extern struct {
    r: CRYPT_UINT_BLOB,
    s: CRYPT_UINT_BLOB,
};

pub const PCERT_ECC_SIGNATURE = ?*CERT_ECC_SIGNATURE;
pub const CERT_X942_DH_VALIDATION_PARAMS = extern struct {
    seed: CRYPT_BIT_BLOB,
    pgenCounter: DWORD,
};

pub const PCERT_X942_DH_VALIDATION_PARAMS = ?*CERT_X942_DH_VALIDATION_PARAMS;
pub const CERT_X942_DH_PARAMETERS = extern struct {
    p: CRYPT_UINT_BLOB,
    g: CRYPT_UINT_BLOB,
    q: CRYPT_UINT_BLOB,
    j: CRYPT_UINT_BLOB,
    pValidationParams: PCERT_X942_DH_VALIDATION_PARAMS,
};

pub const PCERT_X942_DH_PARAMETERS = ?*CERT_X942_DH_PARAMETERS;
pub const CRYPT_X942_OTHER_INFO = extern struct {
    pszContentEncryptionObjId: LPSTR,
    rgbCounter: [4]BYTE,
    rgbKeyLength: [4]BYTE,
    PubInfo: CRYPT_DATA_BLOB,
};

pub const PCRYPT_X942_OTHER_INFO = ?*CRYPT_X942_OTHER_INFO;
pub const CRYPT_ECC_CMS_SHARED_INFO = extern struct {
    Algorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EntityUInfo: CRYPT_DATA_BLOB,
    rgbSuppPubInfo: [4]BYTE,
};

pub const PCRYPT_ECC_CMS_SHARED_INFO = ?*CRYPT_ECC_CMS_SHARED_INFO;
pub const CRYPT_RC2_CBC_PARAMETERS = extern struct {
    dwVersion: DWORD,
    fIV: BOOL,
    rgbIV: [8]BYTE,
};

pub const PCRYPT_RC2_CBC_PARAMETERS = ?*CRYPT_RC2_CBC_PARAMETERS;
pub const CRYPT_SMIME_CAPABILITY = extern struct {
    pszObjId: LPSTR,
    Parameters: CRYPT_OBJID_BLOB,
};

pub const PCRYPT_SMIME_CAPABILITY = ?*CRYPT_SMIME_CAPABILITY;
pub const CRYPT_SMIME_CAPABILITIES = extern struct {
    cCapability: DWORD,
    rgCapability: PCRYPT_SMIME_CAPABILITY,
};

pub const PCRYPT_SMIME_CAPABILITIES = ?*CRYPT_SMIME_CAPABILITIES;
pub const CERT_QC_STATEMENT = extern struct {
    pszStatementId: LPSTR,
    StatementInfo: CRYPT_OBJID_BLOB,
};

pub const PCERT_QC_STATEMENT = ?*CERT_QC_STATEMENT;
pub const CERT_QC_STATEMENTS_EXT_INFO = extern struct {
    cStatement: DWORD,
    rgStatement: PCERT_QC_STATEMENT,
};

pub const PCERT_QC_STATEMENTS_EXT_INFO = ?*CERT_QC_STATEMENTS_EXT_INFO;
pub const CRYPT_MASK_GEN_ALGORITHM = extern struct {
    pszObjId: LPSTR,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
};

pub const PCRYPT_MASK_GEN_ALGORITHM = ?*CRYPT_MASK_GEN_ALGORITHM;
pub const CRYPT_RSA_SSA_PSS_PARAMETERS = extern struct {
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    MaskGenAlgorithm: CRYPT_MASK_GEN_ALGORITHM,
    dwSaltLength: DWORD,
    dwTrailerField: DWORD,
};

pub const PCRYPT_RSA_SSA_PSS_PARAMETERS = ?*CRYPT_RSA_SSA_PSS_PARAMETERS;
pub const CRYPT_PSOURCE_ALGORITHM = extern struct {
    pszObjId: LPSTR,
    EncodingParameters: CRYPT_DATA_BLOB,
};

pub const PCRYPT_PSOURCE_ALGORITHM = ?*CRYPT_PSOURCE_ALGORITHM;
pub const CRYPT_RSAES_OAEP_PARAMETERS = extern struct {
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    MaskGenAlgorithm: CRYPT_MASK_GEN_ALGORITHM,
    PSourceAlgorithm: CRYPT_PSOURCE_ALGORITHM,
};

pub const PCRYPT_RSAES_OAEP_PARAMETERS = ?*CRYPT_RSAES_OAEP_PARAMETERS;
pub const CMC_TAGGED_ATTRIBUTE = extern struct {
    dwBodyPartID: DWORD,
    Attribute: CRYPT_ATTRIBUTE,
};

pub const PCMC_TAGGED_ATTRIBUTE = ?*CMC_TAGGED_ATTRIBUTE;
pub const CMC_TAGGED_CERT_REQUEST = extern struct {
    dwBodyPartID: DWORD,
    SignedCertRequest: CRYPT_DER_BLOB,
};

pub const PCMC_TAGGED_CERT_REQUEST = ?*CMC_TAGGED_CERT_REQUEST;
pub const CMC_TAGGED_REQUEST = extern struct {
    dwTaggedRequestChoice: DWORD,
    u: extern union {
        pTaggedCertRequest: PCMC_TAGGED_CERT_REQUEST,
    },
};

pub const PCMC_TAGGED_REQUEST = ?*CMC_TAGGED_REQUEST;
pub const CMC_TAGGED_CONTENT_INFO = extern struct {
    dwBodyPartID: DWORD,
    EncodedContentInfo: CRYPT_DER_BLOB,
};

pub const PCMC_TAGGED_CONTENT_INFO = ?*CMC_TAGGED_CONTENT_INFO;
pub const CMC_TAGGED_OTHER_MSG = extern struct {
    dwBodyPartID: DWORD,
    pszObjId: LPSTR,
    Value: CRYPT_OBJID_BLOB,
};

pub const PCMC_TAGGED_OTHER_MSG = ?*CMC_TAGGED_OTHER_MSG;
pub const CMC_DATA_INFO = extern struct {
    cTaggedAttribute: DWORD,
    rgTaggedAttribute: PCMC_TAGGED_ATTRIBUTE,
    cTaggedRequest: DWORD,
    rgTaggedRequest: PCMC_TAGGED_REQUEST,
    cTaggedContentInfo: DWORD,
    rgTaggedContentInfo: PCMC_TAGGED_CONTENT_INFO,
    cTaggedOtherMsg: DWORD,
    rgTaggedOtherMsg: PCMC_TAGGED_OTHER_MSG,
};

pub const PCMC_DATA_INFO = ?*CMC_DATA_INFO;
pub const CMC_RESPONSE_INFO = extern struct {
    cTaggedAttribute: DWORD,
    rgTaggedAttribute: PCMC_TAGGED_ATTRIBUTE,
    cTaggedContentInfo: DWORD,
    rgTaggedContentInfo: PCMC_TAGGED_CONTENT_INFO,
    cTaggedOtherMsg: DWORD,
    rgTaggedOtherMsg: PCMC_TAGGED_OTHER_MSG,
};

pub const PCMC_RESPONSE_INFO = ?*CMC_RESPONSE_INFO;
pub const CMC_PEND_INFO = extern struct {
    PendToken: CRYPT_DATA_BLOB,
    PendTime: FILETIME,
};

pub const PCMC_PEND_INFO = ?*CMC_PEND_INFO;
pub const CMC_STATUS_INFO = extern struct {
    dwStatus: DWORD,
    cBodyList: DWORD,
    rgdwBodyList: ?*DWORD,
    pwszStatusString: LPWSTR,
    dwOtherInfoChoice: DWORD,
    u: extern union {
        dwFailInfo: DWORD,
        pPendInfo: PCMC_PEND_INFO,
    },
};

pub const PCMC_STATUS_INFO = ?*CMC_STATUS_INFO;
pub const CMC_ADD_EXTENSIONS_INFO = extern struct {
    dwCmcDataReference: DWORD,
    cCertReference: DWORD,
    rgdwCertReference: ?*DWORD,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCMC_ADD_EXTENSIONS_INFO = ?*CMC_ADD_EXTENSIONS_INFO;
pub const CMC_ADD_ATTRIBUTES_INFO = extern struct {
    dwCmcDataReference: DWORD,
    cCertReference: DWORD,
    rgdwCertReference: ?*DWORD,
    cAttribute: DWORD,
    rgAttribute: PCRYPT_ATTRIBUTE,
};

pub const PCMC_ADD_ATTRIBUTES_INFO = ?*CMC_ADD_ATTRIBUTES_INFO;
pub const CERT_TEMPLATE_EXT = extern struct {
    pszObjId: LPSTR,
    dwMajorVersion: DWORD,
    fMinorVersion: BOOL,
    dwMinorVersion: DWORD,
};

pub const PCERT_TEMPLATE_EXT = ?*CERT_TEMPLATE_EXT;
pub const CERT_HASHED_URL = extern struct {
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    Hash: CRYPT_HASH_BLOB,
    pwszUrl: LPWSTR,
};

pub const PCERT_HASHED_URL = ?*CERT_HASHED_URL;
pub const CERT_LOGOTYPE_DETAILS = extern struct {
    pwszMimeType: LPWSTR,
    cHashedUrl: DWORD,
    rgHashedUrl: PCERT_HASHED_URL,
};

pub const PCERT_LOGOTYPE_DETAILS = ?*CERT_LOGOTYPE_DETAILS;
pub const CERT_LOGOTYPE_REFERENCE = extern struct {
    cHashedUrl: DWORD,
    rgHashedUrl: PCERT_HASHED_URL,
};

pub const PCERT_LOGOTYPE_REFERENCE = ?*CERT_LOGOTYPE_REFERENCE;
pub const CERT_LOGOTYPE_IMAGE_INFO = extern struct {
    dwLogotypeImageInfoChoice: DWORD,
    dwFileSize: DWORD,
    dwXSize: DWORD,
    dwYSize: DWORD,
    dwLogotypeImageResolutionChoice: DWORD,
    u: extern union {
        dwNumBits: DWORD,
        dwTableSize: DWORD,
    },
    pwszLanguage: LPWSTR,
};

pub const PCERT_LOGOTYPE_IMAGE_INFO = ?*CERT_LOGOTYPE_IMAGE_INFO;
pub const CERT_LOGOTYPE_IMAGE = extern struct {
    LogotypeDetails: CERT_LOGOTYPE_DETAILS,
    pLogotypeImageInfo: PCERT_LOGOTYPE_IMAGE_INFO,
};

pub const PCERT_LOGOTYPE_IMAGE = ?*CERT_LOGOTYPE_IMAGE;
pub const CERT_LOGOTYPE_AUDIO_INFO = extern struct {
    dwFileSize: DWORD,
    dwPlayTime: DWORD,
    dwChannels: DWORD,
    dwSampleRate: DWORD,
    pwszLanguage: LPWSTR,
};

pub const PCERT_LOGOTYPE_AUDIO_INFO = ?*CERT_LOGOTYPE_AUDIO_INFO;
pub const CERT_LOGOTYPE_AUDIO = extern struct {
    LogotypeDetails: CERT_LOGOTYPE_DETAILS,
    pLogotypeAudioInfo: PCERT_LOGOTYPE_AUDIO_INFO,
};

pub const PCERT_LOGOTYPE_AUDIO = ?*CERT_LOGOTYPE_AUDIO;
pub const CERT_LOGOTYPE_DATA = extern struct {
    cLogotypeImage: DWORD,
    rgLogotypeImage: PCERT_LOGOTYPE_IMAGE,
    cLogotypeAudio: DWORD,
    rgLogotypeAudio: PCERT_LOGOTYPE_AUDIO,
};

pub const PCERT_LOGOTYPE_DATA = ?*CERT_LOGOTYPE_DATA;
pub const CERT_LOGOTYPE_INFO = extern struct {
    dwLogotypeInfoChoice: DWORD,
    u: extern union {
        pLogotypeDirectInfo: PCERT_LOGOTYPE_DATA,
        pLogotypeIndirectInfo: PCERT_LOGOTYPE_REFERENCE,
    },
};

pub const PCERT_LOGOTYPE_INFO = ?*CERT_LOGOTYPE_INFO;
pub const CERT_OTHER_LOGOTYPE_INFO = extern struct {
    pszObjId: LPSTR,
    LogotypeInfo: CERT_LOGOTYPE_INFO,
};

pub const PCERT_OTHER_LOGOTYPE_INFO = ?*CERT_OTHER_LOGOTYPE_INFO;
pub const CERT_LOGOTYPE_EXT_INFO = extern struct {
    cCommunityLogo: DWORD,
    rgCommunityLogo: PCERT_LOGOTYPE_INFO,
    pIssuerLogo: PCERT_LOGOTYPE_INFO,
    pSubjectLogo: PCERT_LOGOTYPE_INFO,
    cOtherLogo: DWORD,
    rgOtherLogo: PCERT_OTHER_LOGOTYPE_INFO,
};

pub const PCERT_LOGOTYPE_EXT_INFO = ?*CERT_LOGOTYPE_EXT_INFO;
pub const CERT_BIOMETRIC_DATA = extern struct {
    dwTypeOfBiometricDataChoice: DWORD,
    u: extern union {
        dwPredefined: DWORD,
        pszObjId: LPSTR,
    },
    HashedUrl: CERT_HASHED_URL,
};

pub const PCERT_BIOMETRIC_DATA = ?*CERT_BIOMETRIC_DATA;
pub const CERT_BIOMETRIC_EXT_INFO = extern struct {
    cBiometricData: DWORD,
    rgBiometricData: PCERT_BIOMETRIC_DATA,
};

pub const PCERT_BIOMETRIC_EXT_INFO = ?*CERT_BIOMETRIC_EXT_INFO;
pub const OCSP_SIGNATURE_INFO = extern struct {
    SignatureAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    Signature: CRYPT_BIT_BLOB,
    cCertEncoded: DWORD,
    rgCertEncoded: PCERT_BLOB,
};

pub const POCSP_SIGNATURE_INFO = ?*OCSP_SIGNATURE_INFO;
pub const OCSP_SIGNED_REQUEST_INFO = extern struct {
    ToBeSigned: CRYPT_DER_BLOB,
    pOptionalSignatureInfo: POCSP_SIGNATURE_INFO,
};

pub const POCSP_SIGNED_REQUEST_INFO = ?*OCSP_SIGNED_REQUEST_INFO;
pub const OCSP_CERT_ID = extern struct {
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    IssuerNameHash: CRYPT_HASH_BLOB,
    IssuerKeyHash: CRYPT_HASH_BLOB,
    SerialNumber: CRYPT_INTEGER_BLOB,
};

pub const POCSP_CERT_ID = ?*OCSP_CERT_ID;
pub const OCSP_REQUEST_ENTRY = extern struct {
    CertId: OCSP_CERT_ID,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const POCSP_REQUEST_ENTRY = ?*OCSP_REQUEST_ENTRY;
pub const OCSP_REQUEST_INFO = extern struct {
    dwVersion: DWORD,
    pRequestorName: PCERT_ALT_NAME_ENTRY,
    cRequestEntry: DWORD,
    rgRequestEntry: POCSP_REQUEST_ENTRY,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const POCSP_REQUEST_INFO = ?*OCSP_REQUEST_INFO;
pub const OCSP_RESPONSE_INFO = extern struct {
    dwStatus: DWORD,
    pszObjId: LPSTR,
    Value: CRYPT_OBJID_BLOB,
};

pub const POCSP_RESPONSE_INFO = ?*OCSP_RESPONSE_INFO;
pub const OCSP_BASIC_SIGNED_RESPONSE_INFO = extern struct {
    ToBeSigned: CRYPT_DER_BLOB,
    SignatureInfo: OCSP_SIGNATURE_INFO,
};

pub const POCSP_BASIC_SIGNED_RESPONSE_INFO = ?*OCSP_BASIC_SIGNED_RESPONSE_INFO;
pub const OCSP_BASIC_REVOKED_INFO = extern struct {
    RevocationDate: FILETIME,
    dwCrlReasonCode: DWORD,
};

pub const POCSP_BASIC_REVOKED_INFO = ?*OCSP_BASIC_REVOKED_INFO;
pub const OCSP_BASIC_RESPONSE_ENTRY = extern struct {
    CertId: OCSP_CERT_ID,
    dwCertStatus: DWORD,
    u: extern union {
        pRevokedInfo: POCSP_BASIC_REVOKED_INFO,
    },
    ThisUpdate: FILETIME,
    NextUpdate: FILETIME,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const POCSP_BASIC_RESPONSE_ENTRY = ?*OCSP_BASIC_RESPONSE_ENTRY;
pub const OCSP_BASIC_RESPONSE_INFO = extern struct {
    dwVersion: DWORD,
    dwResponderIdChoice: DWORD,
    u: extern union {
        ByNameResponderId: CERT_NAME_BLOB,
        ByKeyResponderId: CRYPT_HASH_BLOB,
    },
    ProducedAt: FILETIME,
    cResponseEntry: DWORD,
    rgResponseEntry: POCSP_BASIC_RESPONSE_ENTRY,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const POCSP_BASIC_RESPONSE_INFO = ?*OCSP_BASIC_RESPONSE_INFO;
pub const CERT_SUPPORTED_ALGORITHM_INFO = extern struct {
    Algorithm: CRYPT_ALGORITHM_IDENTIFIER,
    IntendedKeyUsage: CRYPT_BIT_BLOB,
    IntendedCertPolicies: CERT_POLICIES_INFO,
};

pub const PCERT_SUPPORTED_ALGORITHM_INFO = ?*CERT_SUPPORTED_ALGORITHM_INFO;
pub const CERT_TPM_SPECIFICATION_INFO = extern struct {
    pwszFamily: LPWSTR,
    dwLevel: DWORD,
    dwRevision: DWORD,
};

pub const PCERT_TPM_SPECIFICATION_INFO = ?*CERT_TPM_SPECIFICATION_INFO;
pub const HCRYPTOIDFUNCSET = ?*c_void;
pub const HCRYPTOIDFUNCADDR = ?*c_void;
pub const CRYPT_OID_FUNC_ENTRY = extern struct {
    pszOID: LPCSTR,
    pvFuncAddr: ?*c_void,
};

pub const PCRYPT_OID_FUNC_ENTRY = ?*CRYPT_OID_FUNC_ENTRY;
pub const PFN_CRYPT_ENUM_OID_FUNC = ?extern fn(DWORD, LPCSTR, LPCSTR, DWORD, ?*const DWORD, ?*const LPCWSTR, ?*const (?*const BYTE), ?*const DWORD, ?*c_void) BOOL;
pub const CRYPT_OID_INFO = extern struct {
    cbSize: DWORD,
    pszOID: LPCSTR,
    pwszName: LPCWSTR,
    dwGroupId: DWORD,
    u: extern union {
        dwValue: DWORD,
        Algid: ALG_ID,
        dwLength: DWORD,
    },
    ExtraInfo: CRYPT_DATA_BLOB,
};

pub const PCRYPT_OID_INFO = ?*CRYPT_OID_INFO;
pub const CCRYPT_OID_INFO = CRYPT_OID_INFO;
pub const PCCRYPT_OID_INFO = ?*const CRYPT_OID_INFO;
pub const PFN_CRYPT_ENUM_OID_INFO = ?extern fn(PCCRYPT_OID_INFO, ?*c_void) BOOL;
pub const CERT_STRONG_SIGN_SERIALIZED_INFO = extern struct {
    dwFlags: DWORD,
    pwszCNGSignHashAlgids: LPWSTR,
    pwszCNGPubKeyMinBitLengths: LPWSTR,
};

pub const PCERT_STRONG_SIGN_SERIALIZED_INFO = ?*CERT_STRONG_SIGN_SERIALIZED_INFO;
pub const CERT_STRONG_SIGN_PARA = extern struct {
    cbSize: DWORD,
    dwInfoChoice: DWORD,
    u: extern union {
        pvInfo: ?*c_void,
        pSerializedInfo: PCERT_STRONG_SIGN_SERIALIZED_INFO,
        pszOID: LPSTR,
    },
};

pub const PCERT_STRONG_SIGN_PARA = ?*CERT_STRONG_SIGN_PARA;
pub const PCCERT_STRONG_SIGN_PARA = ?*const CERT_STRONG_SIGN_PARA;
pub const HCRYPTMSG = ?*c_void;
pub const CERT_ISSUER_SERIAL_NUMBER = extern struct {
    Issuer: CERT_NAME_BLOB,
    SerialNumber: CRYPT_INTEGER_BLOB,
};

pub const PCERT_ISSUER_SERIAL_NUMBER = ?*CERT_ISSUER_SERIAL_NUMBER;
pub const CERT_ID = extern struct {
    dwIdChoice: DWORD,
    u: extern union {
        IssuerSerialNumber: CERT_ISSUER_SERIAL_NUMBER,
        KeyId: CRYPT_HASH_BLOB,
        HashId: CRYPT_HASH_BLOB,
    },
};

pub const PCERT_ID = ?*CERT_ID;
pub const CMSG_SIGNER_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    pCertInfo: PCERT_INFO,
    u: extern union {
        hCryptProv: HCRYPTPROV,
        hNCryptKey: NCRYPT_KEY_HANDLE,
    },
    dwKeySpec: DWORD,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvHashAuxInfo: ?*c_void,
    cAuthAttr: DWORD,
    rgAuthAttr: PCRYPT_ATTRIBUTE,
    cUnauthAttr: DWORD,
    rgUnauthAttr: PCRYPT_ATTRIBUTE,
};

pub const PCMSG_SIGNER_ENCODE_INFO = ?*CMSG_SIGNER_ENCODE_INFO;
pub const CMSG_SIGNED_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    cSigners: DWORD,
    rgSigners: PCMSG_SIGNER_ENCODE_INFO,
    cCertEncoded: DWORD,
    rgCertEncoded: PCERT_BLOB,
    cCrlEncoded: DWORD,
    rgCrlEncoded: PCRL_BLOB,
};

pub const PCMSG_SIGNED_ENCODE_INFO = ?*CMSG_SIGNED_ENCODE_INFO;
pub const CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvKeyEncryptionAuxInfo: ?*c_void,
    hCryptProv: HCRYPTPROV_LEGACY,
    RecipientPublicKey: CRYPT_BIT_BLOB,
    RecipientId: CERT_ID,
};
pub const PCMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO = ?*CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO;
pub const CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    RecipientPublicKey: CRYPT_BIT_BLOB,
    RecipientId: CERT_ID,
    Date: FILETIME,
    pOtherAttr: PCRYPT_ATTRIBUTE_TYPE_VALUE,
};
pub const PCMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO = ?*CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO;
pub const CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvKeyEncryptionAuxInfo: ?*c_void,
    KeyWrapAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvKeyWrapAuxInfo: ?*c_void,
    hCryptProv: HCRYPTPROV_LEGACY,
    dwKeySpec: DWORD,
    dwKeyChoice: DWORD,
    u: extern union {
        pEphemeralAlgorithm: PCRYPT_ALGORITHM_IDENTIFIER,
        pSenderId: PCERT_ID,
    },
    UserKeyingMaterial: CRYPT_DATA_BLOB,
    cRecipientEncryptedKeys: DWORD,
    rgpRecipientEncryptedKeys: ?*PCMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO,
};
pub const PCMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO = ?*CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO;
pub const CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvKeyEncryptionAuxInfo: ?*c_void,
    hCryptProv: HCRYPTPROV,
    dwKeyChoice: DWORD,
    u: extern union {
        hKeyEncryptionKey: HCRYPTKEY,
        pvKeyEncryptionKey: ?*c_void,
    },
    KeyId: CRYPT_DATA_BLOB,
    Date: FILETIME,
    pOtherAttr: PCRYPT_ATTRIBUTE_TYPE_VALUE,
};
pub const PCMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO = ?*CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO;
pub const CMSG_RECIPIENT_ENCODE_INFO = extern struct {
    dwRecipientChoice: DWORD,
    u: extern union {
        pKeyTrans: PCMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO,
        pKeyAgree: PCMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO,
        pMailList: PCMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO,
    },
};

pub const PCMSG_RECIPIENT_ENCODE_INFO = ?*CMSG_RECIPIENT_ENCODE_INFO;
pub const CMSG_ENVELOPED_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    ContentEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvEncryptionAuxInfo: ?*c_void,
    cRecipients: DWORD,
    rgpRecipients: ?*PCERT_INFO,
};

pub const PCMSG_ENVELOPED_ENCODE_INFO = ?*CMSG_ENVELOPED_ENCODE_INFO;




pub const CMSG_RC2_AUX_INFO = extern struct {
    cbSize: DWORD,
    dwBitLen: DWORD,
};

pub const PCMSG_RC2_AUX_INFO = ?*CMSG_RC2_AUX_INFO;
pub const CMSG_SP3_COMPATIBLE_AUX_INFO = extern struct {
    cbSize: DWORD,
    dwFlags: DWORD,
};

pub const PCMSG_SP3_COMPATIBLE_AUX_INFO = ?*CMSG_SP3_COMPATIBLE_AUX_INFO;
pub const CMSG_RC4_AUX_INFO = extern struct {
    cbSize: DWORD,
    dwBitLen: DWORD,
};

pub const PCMSG_RC4_AUX_INFO = ?*CMSG_RC4_AUX_INFO;
pub const CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    SignedInfo: CMSG_SIGNED_ENCODE_INFO,
    EnvelopedInfo: CMSG_ENVELOPED_ENCODE_INFO,
};

pub const PCMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO = ?*CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO;
pub const CMSG_HASHED_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvHashAuxInfo: ?*c_void,
};

pub const PCMSG_HASHED_ENCODE_INFO = ?*CMSG_HASHED_ENCODE_INFO;
pub const CMSG_ENCRYPTED_ENCODE_INFO = extern struct {
    cbSize: DWORD,
    ContentEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvEncryptionAuxInfo: ?*c_void,
};

pub const PCMSG_ENCRYPTED_ENCODE_INFO = ?*CMSG_ENCRYPTED_ENCODE_INFO;
pub const PFN_CMSG_STREAM_OUTPUT = ?extern fn(?*const c_void, ?*BYTE, DWORD, BOOL) BOOL;
pub const CMSG_STREAM_INFO = extern struct {
    cbContent: DWORD,
    pfnStreamOutput: PFN_CMSG_STREAM_OUTPUT,
    pvArg: ?*c_void,
};

pub const PCMSG_STREAM_INFO = ?*CMSG_STREAM_INFO;
pub const CMSG_SIGNER_INFO = extern struct {
    dwVersion: DWORD,
    Issuer: CERT_NAME_BLOB,
    SerialNumber: CRYPT_INTEGER_BLOB,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    HashEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedHash: CRYPT_DATA_BLOB,
    AuthAttrs: CRYPT_ATTRIBUTES,
    UnauthAttrs: CRYPT_ATTRIBUTES,
};

pub const PCMSG_SIGNER_INFO = ?*CMSG_SIGNER_INFO;
pub const CMSG_CMS_SIGNER_INFO = extern struct {
    dwVersion: DWORD,
    SignerId: CERT_ID,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    HashEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedHash: CRYPT_DATA_BLOB,
    AuthAttrs: CRYPT_ATTRIBUTES,
    UnauthAttrs: CRYPT_ATTRIBUTES,
};

pub const PCMSG_CMS_SIGNER_INFO = ?*CMSG_CMS_SIGNER_INFO;
pub const CMSG_ATTR = CRYPT_ATTRIBUTES;
pub const PCMSG_ATTR = ?*CRYPT_ATTRIBUTES;
pub const CMSG_KEY_TRANS_RECIPIENT_INFO = extern struct {
    dwVersion: DWORD,
    RecipientId: CERT_ID,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedKey: CRYPT_DATA_BLOB,
};

pub const PCMSG_KEY_TRANS_RECIPIENT_INFO = ?*CMSG_KEY_TRANS_RECIPIENT_INFO;
pub const CMSG_RECIPIENT_ENCRYPTED_KEY_INFO = extern struct {
    RecipientId: CERT_ID,
    EncryptedKey: CRYPT_DATA_BLOB,
    Date: FILETIME,
    pOtherAttr: PCRYPT_ATTRIBUTE_TYPE_VALUE,
};

pub const PCMSG_RECIPIENT_ENCRYPTED_KEY_INFO = ?*CMSG_RECIPIENT_ENCRYPTED_KEY_INFO;
pub const CMSG_KEY_AGREE_RECIPIENT_INFO = extern struct {
    dwVersion: DWORD,
    dwOriginatorChoice: DWORD,
    u: extern union {
        OriginatorCertId: CERT_ID,
        OriginatorPublicKeyInfo: CERT_PUBLIC_KEY_INFO,
    },
    UserKeyingMaterial: CRYPT_DATA_BLOB,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    cRecipientEncryptedKeys: DWORD,
    rgpRecipientEncryptedKeys: ?*PCMSG_RECIPIENT_ENCRYPTED_KEY_INFO,
};

pub const PCMSG_KEY_AGREE_RECIPIENT_INFO = ?*CMSG_KEY_AGREE_RECIPIENT_INFO;
pub const CMSG_MAIL_LIST_RECIPIENT_INFO = extern struct {
    dwVersion: DWORD,
    KeyId: CRYPT_DATA_BLOB,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedKey: CRYPT_DATA_BLOB,
    Date: FILETIME,
    pOtherAttr: PCRYPT_ATTRIBUTE_TYPE_VALUE,
};

pub const PCMSG_MAIL_LIST_RECIPIENT_INFO = ?*CMSG_MAIL_LIST_RECIPIENT_INFO;
pub const CMSG_CMS_RECIPIENT_INFO = extern struct {
    dwRecipientChoice: DWORD,
    u: extern union {
        pKeyTrans: PCMSG_KEY_TRANS_RECIPIENT_INFO,
        pKeyAgree: PCMSG_KEY_AGREE_RECIPIENT_INFO,
        pMailList: PCMSG_MAIL_LIST_RECIPIENT_INFO,
    },
};

pub const PCMSG_CMS_RECIPIENT_INFO = ?*CMSG_CMS_RECIPIENT_INFO;
pub const CMSG_CTRL_VERIFY_SIGNATURE_EX_PARA = extern struct {
    cbSize: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    dwSignerIndex: DWORD,
    dwSignerType: DWORD,
    pvSigner: ?*c_void,
};

pub const PCMSG_CTRL_VERIFY_SIGNATURE_EX_PARA = ?*CMSG_CTRL_VERIFY_SIGNATURE_EX_PARA;
pub const CMSG_CTRL_DECRYPT_PARA = extern struct {
    cbSize: DWORD,
    u: extern union {
        hCryptProv: HCRYPTPROV,
        hNCryptKey: NCRYPT_KEY_HANDLE,
    },
    dwKeySpec: DWORD,
    dwRecipientIndex: DWORD,
};

pub const PCMSG_CTRL_DECRYPT_PARA = ?*CMSG_CTRL_DECRYPT_PARA;
pub const CMSG_CTRL_KEY_TRANS_DECRYPT_PARA = extern struct {
    cbSize: DWORD,
    u: extern union {
        hCryptProv: HCRYPTPROV,
        hNCryptKey: NCRYPT_KEY_HANDLE,
    },
    dwKeySpec: DWORD,
    pKeyTrans: PCMSG_KEY_TRANS_RECIPIENT_INFO,
    dwRecipientIndex: DWORD,
};

pub const PCMSG_CTRL_KEY_TRANS_DECRYPT_PARA = ?*CMSG_CTRL_KEY_TRANS_DECRYPT_PARA;
pub const CMSG_CTRL_KEY_AGREE_DECRYPT_PARA = extern struct {
    cbSize: DWORD,
    u: extern union {
        hCryptProv: HCRYPTPROV,
        hNCryptKey: NCRYPT_KEY_HANDLE,
    },
    dwKeySpec: DWORD,
    pKeyAgree: PCMSG_KEY_AGREE_RECIPIENT_INFO,
    dwRecipientIndex: DWORD,
    dwRecipientEncryptedKeyIndex: DWORD,
    OriginatorPublicKey: CRYPT_BIT_BLOB,
};

pub const PCMSG_CTRL_KEY_AGREE_DECRYPT_PARA = ?*CMSG_CTRL_KEY_AGREE_DECRYPT_PARA;
pub const CMSG_CTRL_MAIL_LIST_DECRYPT_PARA = extern struct {
    cbSize: DWORD,
    hCryptProv: HCRYPTPROV,
    pMailList: PCMSG_MAIL_LIST_RECIPIENT_INFO,
    dwRecipientIndex: DWORD,
    dwKeyChoice: DWORD,
    u: extern union {
        hKeyEncryptionKey: HCRYPTKEY,
        pvKeyEncryptionKey: ?*c_void,
    },
};

pub const PCMSG_CTRL_MAIL_LIST_DECRYPT_PARA = ?*CMSG_CTRL_MAIL_LIST_DECRYPT_PARA;
pub const CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA = extern struct {
    cbSize: DWORD,
    dwSignerIndex: DWORD,
    blob: CRYPT_DATA_BLOB,
};

pub const PCMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA = ?*CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA;
pub const CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA = extern struct {
    cbSize: DWORD,
    dwSignerIndex: DWORD,
    dwUnauthAttrIndex: DWORD,
};

pub const PCMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA = ?*CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA;
pub const PFN_CMSG_ALLOC = ?extern fn(usize) ?*c_void;
pub const PFN_CMSG_FREE = ?extern fn(?*c_void) void;
pub const PFN_CMSG_GEN_ENCRYPT_KEY = ?extern fn(?*HCRYPTPROV, PCRYPT_ALGORITHM_IDENTIFIER, PVOID, PCERT_PUBLIC_KEY_INFO, PFN_CMSG_ALLOC, ?*HCRYPTKEY, ?*PBYTE, PDWORD) BOOL;
pub const PFN_CMSG_EXPORT_ENCRYPT_KEY = ?extern fn(HCRYPTPROV, HCRYPTKEY, PCERT_PUBLIC_KEY_INFO, PBYTE, PDWORD) BOOL;
pub const PFN_CMSG_IMPORT_ENCRYPT_KEY = ?extern fn(HCRYPTPROV, DWORD, PCRYPT_ALGORITHM_IDENTIFIER, PCRYPT_ALGORITHM_IDENTIFIER, PBYTE, DWORD, ?*HCRYPTKEY) BOOL;
pub const CMSG_CONTENT_ENCRYPT_INFO = extern struct {
    cbSize: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    ContentEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvEncryptionAuxInfo: ?*c_void,
    cRecipients: DWORD,
    rgCmsRecipients: PCMSG_RECIPIENT_ENCODE_INFO,
    pfnAlloc: PFN_CMSG_ALLOC,
    pfnFree: PFN_CMSG_FREE,
    dwEncryptFlags: DWORD,
    u: extern union {
        hContentEncryptKey: HCRYPTKEY,
        hCNGContentEncryptKey: BCRYPT_KEY_HANDLE,
    },
    dwFlags: DWORD,
    fCNG: BOOL,
    pbCNGContentEncryptKeyObject: ?*BYTE,
    pbContentEncryptKey: ?*BYTE,
    cbContentEncryptKey: DWORD,
};

pub const PCMSG_CONTENT_ENCRYPT_INFO = ?*CMSG_CONTENT_ENCRYPT_INFO;
pub const PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY = ?extern fn(PCMSG_CONTENT_ENCRYPT_INFO, DWORD, ?*c_void) BOOL;
pub const CMSG_KEY_TRANS_ENCRYPT_INFO = extern struct {
    cbSize: DWORD,
    dwRecipientIndex: DWORD,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedKey: CRYPT_DATA_BLOB,
    dwFlags: DWORD,
};

pub const PCMSG_KEY_TRANS_ENCRYPT_INFO = ?*CMSG_KEY_TRANS_ENCRYPT_INFO;
pub const PFN_CMSG_EXPORT_KEY_TRANS = ?extern fn(PCMSG_CONTENT_ENCRYPT_INFO, PCMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO, PCMSG_KEY_TRANS_ENCRYPT_INFO, DWORD, ?*c_void) BOOL;
pub const CMSG_KEY_AGREE_KEY_ENCRYPT_INFO = extern struct {
    cbSize: DWORD,
    EncryptedKey: CRYPT_DATA_BLOB,
};

pub const PCMSG_KEY_AGREE_KEY_ENCRYPT_INFO = ?*CMSG_KEY_AGREE_KEY_ENCRYPT_INFO;
pub const CMSG_KEY_AGREE_ENCRYPT_INFO = extern struct {
    cbSize: DWORD,
    dwRecipientIndex: DWORD,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    UserKeyingMaterial: CRYPT_DATA_BLOB,
    dwOriginatorChoice: DWORD,
    u: extern union {
        OriginatorCertId: CERT_ID,
        OriginatorPublicKeyInfo: CERT_PUBLIC_KEY_INFO,
    },
    cKeyAgreeKeyEncryptInfo: DWORD,
    rgpKeyAgreeKeyEncryptInfo: ?*PCMSG_KEY_AGREE_KEY_ENCRYPT_INFO,
    dwFlags: DWORD,
};

pub const PCMSG_KEY_AGREE_ENCRYPT_INFO = ?*CMSG_KEY_AGREE_ENCRYPT_INFO;
pub const PFN_CMSG_EXPORT_KEY_AGREE = ?extern fn(PCMSG_CONTENT_ENCRYPT_INFO, PCMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO, PCMSG_KEY_AGREE_ENCRYPT_INFO, DWORD, ?*c_void) BOOL;
pub const CMSG_MAIL_LIST_ENCRYPT_INFO = extern struct {
    cbSize: DWORD,
    dwRecipientIndex: DWORD,
    KeyEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    EncryptedKey: CRYPT_DATA_BLOB,
    dwFlags: DWORD,
};

pub const PCMSG_MAIL_LIST_ENCRYPT_INFO = ?*CMSG_MAIL_LIST_ENCRYPT_INFO;
pub const PFN_CMSG_EXPORT_MAIL_LIST = ?extern fn(PCMSG_CONTENT_ENCRYPT_INFO, PCMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO, PCMSG_MAIL_LIST_ENCRYPT_INFO, DWORD, ?*c_void) BOOL;
pub const PFN_CMSG_IMPORT_KEY_TRANS = ?extern fn(PCRYPT_ALGORITHM_IDENTIFIER, PCMSG_CTRL_KEY_TRANS_DECRYPT_PARA, DWORD, ?*c_void, ?*HCRYPTKEY) BOOL;
pub const PFN_CMSG_IMPORT_KEY_AGREE = ?extern fn(PCRYPT_ALGORITHM_IDENTIFIER, PCMSG_CTRL_KEY_AGREE_DECRYPT_PARA, DWORD, ?*c_void, ?*HCRYPTKEY) BOOL;
pub const PFN_CMSG_IMPORT_MAIL_LIST = ?extern fn(PCRYPT_ALGORITHM_IDENTIFIER, PCMSG_CTRL_MAIL_LIST_DECRYPT_PARA, DWORD, ?*c_void, ?*HCRYPTKEY) BOOL;
pub const CMSG_CNG_CONTENT_DECRYPT_INFO = extern struct {
    cbSize: DWORD,
    ContentEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pfnAlloc: PFN_CMSG_ALLOC,
    pfnFree: PFN_CMSG_FREE,
    hNCryptKey: NCRYPT_KEY_HANDLE,
    pbContentEncryptKey: ?*BYTE,
    cbContentEncryptKey: DWORD,
    hCNGContentEncryptKey: BCRYPT_KEY_HANDLE,
    pbCNGContentEncryptKeyObject: ?*BYTE,
};

pub const PCMSG_CNG_CONTENT_DECRYPT_INFO = ?*CMSG_CNG_CONTENT_DECRYPT_INFO;
pub const PFN_CMSG_CNG_IMPORT_KEY_TRANS = ?extern fn(PCMSG_CNG_CONTENT_DECRYPT_INFO, PCMSG_CTRL_KEY_TRANS_DECRYPT_PARA, DWORD, ?*c_void) BOOL;
pub const PFN_CMSG_CNG_IMPORT_KEY_AGREE = ?extern fn(PCMSG_CNG_CONTENT_DECRYPT_INFO, PCMSG_CTRL_KEY_AGREE_DECRYPT_PARA, DWORD, ?*c_void) BOOL;
pub const PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY = ?extern fn(PCMSG_CNG_CONTENT_DECRYPT_INFO, DWORD, ?*c_void) BOOL;
pub const HCERTSTORE = ?*c_void;
pub const CERT_CONTEXT = extern struct {
    dwCertEncodingType: DWORD,
    pbCertEncoded: ?*BYTE,
    cbCertEncoded: DWORD,
    pCertInfo: PCERT_INFO,
    hCertStore: HCERTSTORE,
};

pub const PCERT_CONTEXT = ?*CERT_CONTEXT;
pub const PCCERT_CONTEXT = ?*const CERT_CONTEXT;
pub const CRL_CONTEXT = extern struct {
    dwCertEncodingType: DWORD,
    pbCrlEncoded: ?*BYTE,
    cbCrlEncoded: DWORD,
    pCrlInfo: PCRL_INFO,
    hCertStore: HCERTSTORE,
};

pub const PCRL_CONTEXT = ?*CRL_CONTEXT;
pub const PCCRL_CONTEXT = ?*const CRL_CONTEXT;
pub const CTL_CONTEXT = extern struct {
    dwMsgAndCertEncodingType: DWORD,
    pbCtlEncoded: ?*BYTE,
    cbCtlEncoded: DWORD,
    pCtlInfo: PCTL_INFO,
    hCertStore: HCERTSTORE,
    hCryptMsg: HCRYPTMSG,
    pbCtlContent: ?*BYTE,
    cbCtlContent: DWORD,
};

pub const PCTL_CONTEXT = ?*CTL_CONTEXT;
pub const PCCTL_CONTEXT = ?*const CTL_CONTEXT;
pub const CertKeyType = c_int;

pub const CRYPT_KEY_PROV_PARAM = extern struct {
    dwParam: DWORD,
    pbData: ?*BYTE,
    cbData: DWORD,
    dwFlags: DWORD,
};

pub const PCRYPT_KEY_PROV_PARAM = ?*CRYPT_KEY_PROV_PARAM;
pub const CRYPT_KEY_PROV_INFO = extern struct {
    pwszContainerName: LPWSTR,
    pwszProvName: LPWSTR,
    dwProvType: DWORD,
    dwFlags: DWORD,
    cProvParam: DWORD,
    rgProvParam: PCRYPT_KEY_PROV_PARAM,
    dwKeySpec: DWORD,
};

pub const PCRYPT_KEY_PROV_INFO = ?*CRYPT_KEY_PROV_INFO;
pub const CERT_KEY_CONTEXT = extern struct {
    cbSize: DWORD,
    u: extern union {
        hCryptProv: HCRYPTPROV,
        hNCryptKey: NCRYPT_KEY_HANDLE,
    },
    dwKeySpec: DWORD,
};

pub const PCERT_KEY_CONTEXT = ?*CERT_KEY_CONTEXT;
pub const ROOT_INFO_LUID = extern struct {
    LowPart: DWORD,
    HighPart: LONG,
};

pub const PROOT_INFO_LUID = ?*ROOT_INFO_LUID;
pub const CRYPT_SMART_CARD_ROOT_INFO = extern struct {
    rgbCardID: [16]BYTE,
    luid: ROOT_INFO_LUID,
};

pub const PCRYPT_SMART_CARD_ROOT_INFO = ?*CRYPT_SMART_CARD_ROOT_INFO;
pub const CERT_SYSTEM_STORE_RELOCATE_PARA = extern struct {
    u: extern union {
        hKeyBase: HKEY,
        pvBase: ?*c_void,
    },
    u2: extern union {
        pvSystemStore: ?*c_void,
        pszSystemStore: LPCSTR,
        pwszSystemStore: LPCWSTR,
    },
};

pub const PCERT_SYSTEM_STORE_RELOCATE_PARA = ?*CERT_SYSTEM_STORE_RELOCATE_PARA;
pub const CERT_REGISTRY_STORE_CLIENT_GPT_PARA = extern struct {
    hKeyBase: HKEY,
    pwszRegPath: LPWSTR,
};

pub const PCERT_REGISTRY_STORE_CLIENT_GPT_PARA = ?*CERT_REGISTRY_STORE_CLIENT_GPT_PARA;
pub const CERT_REGISTRY_STORE_ROAMING_PARA = extern struct {
    hKey: HKEY,
    pwszStoreDirectory: LPWSTR,
};

pub const PCERT_REGISTRY_STORE_ROAMING_PARA = ?*CERT_REGISTRY_STORE_ROAMING_PARA;
pub const CERT_LDAP_STORE_OPENED_PARA = extern struct {
    pvLdapSessionHandle: ?*c_void,
    pwszLdapUrl: LPCWSTR,
};

pub const PCERT_LDAP_STORE_OPENED_PARA = ?*CERT_LDAP_STORE_OPENED_PARA;
pub const HCERTSTOREPROV = ?*c_void;
pub const CERT_STORE_PROV_INFO = extern struct {
    cbSize: DWORD,
    cStoreProvFunc: DWORD,
    rgpvStoreProvFunc: ?*(?*c_void),
    hStoreProv: HCERTSTOREPROV,
    dwStoreProvFlags: DWORD,
    hStoreProvFuncAddr2: HCRYPTOIDFUNCADDR,
};

pub const PCERT_STORE_PROV_INFO = ?*CERT_STORE_PROV_INFO;
pub const PFN_CERT_DLL_OPEN_STORE_PROV_FUNC = ?extern fn(LPCSTR, DWORD, HCRYPTPROV_LEGACY, DWORD, ?*const c_void, HCERTSTORE, PCERT_STORE_PROV_INFO) BOOL;
pub const PFN_CERT_STORE_PROV_CLOSE = ?extern fn(HCERTSTOREPROV, DWORD) void;
pub const PFN_CERT_STORE_PROV_READ_CERT = ?extern fn(HCERTSTOREPROV, PCCERT_CONTEXT, DWORD, ?*PCCERT_CONTEXT) BOOL;
pub const PFN_CERT_STORE_PROV_WRITE_CERT = ?extern fn(HCERTSTOREPROV, PCCERT_CONTEXT, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_DELETE_CERT = ?extern fn(HCERTSTOREPROV, PCCERT_CONTEXT, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_SET_CERT_PROPERTY = ?extern fn(HCERTSTOREPROV, PCCERT_CONTEXT, DWORD, DWORD, ?*const c_void) BOOL;
pub const PFN_CERT_STORE_PROV_READ_CRL = ?extern fn(HCERTSTOREPROV, PCCRL_CONTEXT, DWORD, ?*PCCRL_CONTEXT) BOOL;
pub const PFN_CERT_STORE_PROV_WRITE_CRL = ?extern fn(HCERTSTOREPROV, PCCRL_CONTEXT, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_DELETE_CRL = ?extern fn(HCERTSTOREPROV, PCCRL_CONTEXT, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_SET_CRL_PROPERTY = ?extern fn(HCERTSTOREPROV, PCCRL_CONTEXT, DWORD, DWORD, ?*const c_void) BOOL;
pub const PFN_CERT_STORE_PROV_READ_CTL = ?extern fn(HCERTSTOREPROV, PCCTL_CONTEXT, DWORD, ?*PCCTL_CONTEXT) BOOL;
pub const PFN_CERT_STORE_PROV_WRITE_CTL = ?extern fn(HCERTSTOREPROV, PCCTL_CONTEXT, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_DELETE_CTL = ?extern fn(HCERTSTOREPROV, PCCTL_CONTEXT, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_SET_CTL_PROPERTY = ?extern fn(HCERTSTOREPROV, PCCTL_CONTEXT, DWORD, DWORD, ?*const c_void) BOOL;
pub const PFN_CERT_STORE_PROV_CONTROL = ?extern fn(HCERTSTOREPROV, DWORD, DWORD, ?*const c_void) BOOL;
pub const CERT_STORE_PROV_FIND_INFO = extern struct {
    cbSize: DWORD,
    dwMsgAndCertEncodingType: DWORD,
    dwFindFlags: DWORD,
    dwFindType: DWORD,
    pvFindPara: ?*const c_void,
};

pub const PCERT_STORE_PROV_FIND_INFO = ?*CERT_STORE_PROV_FIND_INFO;
pub const CCERT_STORE_PROV_FIND_INFO = CERT_STORE_PROV_FIND_INFO;
pub const PCCERT_STORE_PROV_FIND_INFO = ?*const CERT_STORE_PROV_FIND_INFO;
pub const PFN_CERT_STORE_PROV_FIND_CERT = ?extern fn(HCERTSTOREPROV, PCCERT_STORE_PROV_FIND_INFO, PCCERT_CONTEXT, DWORD, ?*(?*c_void), ?*PCCERT_CONTEXT) BOOL;
pub const PFN_CERT_STORE_PROV_FREE_FIND_CERT = ?extern fn(HCERTSTOREPROV, PCCERT_CONTEXT, ?*c_void, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_GET_CERT_PROPERTY = ?extern fn(HCERTSTOREPROV, PCCERT_CONTEXT, DWORD, DWORD, ?*c_void, ?*DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_FIND_CRL = ?extern fn(HCERTSTOREPROV, PCCERT_STORE_PROV_FIND_INFO, PCCRL_CONTEXT, DWORD, ?*(?*c_void), ?*PCCRL_CONTEXT) BOOL;
pub const PFN_CERT_STORE_PROV_FREE_FIND_CRL = ?extern fn(HCERTSTOREPROV, PCCRL_CONTEXT, ?*c_void, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_GET_CRL_PROPERTY = ?extern fn(HCERTSTOREPROV, PCCRL_CONTEXT, DWORD, DWORD, ?*c_void, ?*DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_FIND_CTL = ?extern fn(HCERTSTOREPROV, PCCERT_STORE_PROV_FIND_INFO, PCCTL_CONTEXT, DWORD, ?*(?*c_void), ?*PCCTL_CONTEXT) BOOL;
pub const PFN_CERT_STORE_PROV_FREE_FIND_CTL = ?extern fn(HCERTSTOREPROV, PCCTL_CONTEXT, ?*c_void, DWORD) BOOL;
pub const PFN_CERT_STORE_PROV_GET_CTL_PROPERTY = ?extern fn(HCERTSTOREPROV, PCCTL_CONTEXT, DWORD, DWORD, ?*c_void, ?*DWORD) BOOL;
pub const CRL_FIND_ISSUED_FOR_PARA = extern struct {
    pSubjectCert: PCCERT_CONTEXT,
    pIssuerCert: PCCERT_CONTEXT,
};

pub const PCRL_FIND_ISSUED_FOR_PARA = ?*CRL_FIND_ISSUED_FOR_PARA;
pub const CTL_ANY_SUBJECT_INFO = extern struct {
    SubjectAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    SubjectIdentifier: CRYPT_DATA_BLOB,
};

pub const PCTL_ANY_SUBJECT_INFO = ?*CTL_ANY_SUBJECT_INFO;
pub const CTL_FIND_USAGE_PARA = extern struct {
    cbSize: DWORD,
    SubjectUsage: CTL_USAGE,
    ListIdentifier: CRYPT_DATA_BLOB,
    pSigner: PCERT_INFO,
};

pub const PCTL_FIND_USAGE_PARA = ?*CTL_FIND_USAGE_PARA;
pub const CTL_FIND_SUBJECT_PARA = extern struct {
    cbSize: DWORD,
    pUsagePara: PCTL_FIND_USAGE_PARA,
    dwSubjectType: DWORD,
    pvSubject: ?*c_void,
};

pub const PCTL_FIND_SUBJECT_PARA = ?*CTL_FIND_SUBJECT_PARA;
pub const PFN_CERT_CREATE_CONTEXT_SORT_FUNC = ?extern fn(DWORD, DWORD, DWORD, ?*c_void) BOOL;
pub const CERT_CREATE_CONTEXT_PARA = extern struct {
    cbSize: DWORD,
    pfnFree: PFN_CRYPT_FREE,
    pvFree: ?*c_void,
    pfnSort: PFN_CERT_CREATE_CONTEXT_SORT_FUNC,
    pvSort: ?*c_void,
};

pub const PCERT_CREATE_CONTEXT_PARA = ?*CERT_CREATE_CONTEXT_PARA;
pub const CERT_SYSTEM_STORE_INFO = extern struct {
    cbSize: DWORD,
};

pub const PCERT_SYSTEM_STORE_INFO = ?*CERT_SYSTEM_STORE_INFO;
pub const CERT_PHYSICAL_STORE_INFO = extern struct {
    cbSize: DWORD,
    pszOpenStoreProvider: LPSTR,
    dwOpenEncodingType: DWORD,
    dwOpenFlags: DWORD,
    OpenParameters: CRYPT_DATA_BLOB,
    dwFlags: DWORD,
    dwPriority: DWORD,
};

pub const PCERT_PHYSICAL_STORE_INFO = ?*CERT_PHYSICAL_STORE_INFO;
pub const PFN_CERT_ENUM_SYSTEM_STORE_LOCATION = ?extern fn(LPCWSTR, DWORD, ?*c_void, ?*c_void) BOOL;
pub const PFN_CERT_ENUM_SYSTEM_STORE = ?extern fn(?*const c_void, DWORD, PCERT_SYSTEM_STORE_INFO, ?*c_void, ?*c_void) BOOL;
pub const PFN_CERT_ENUM_PHYSICAL_STORE = ?extern fn(?*const c_void, DWORD, LPCWSTR, PCERT_PHYSICAL_STORE_INFO, ?*c_void, ?*c_void) BOOL;
pub const CTL_VERIFY_USAGE_PARA = extern struct {
    cbSize: DWORD,
    ListIdentifier: CRYPT_DATA_BLOB,
    cCtlStore: DWORD,
    rghCtlStore: ?*HCERTSTORE,
    cSignerStore: DWORD,
    rghSignerStore: ?*HCERTSTORE,
};

pub const PCTL_VERIFY_USAGE_PARA = ?*CTL_VERIFY_USAGE_PARA;
pub const CTL_VERIFY_USAGE_STATUS = extern struct {
    cbSize: DWORD,
    dwError: DWORD,
    dwFlags: DWORD,
    ppCtl: ?*PCCTL_CONTEXT,
    dwCtlEntryIndex: DWORD,
    ppSigner: ?*PCCERT_CONTEXT,
    dwSignerIndex: DWORD,
};

pub const PCTL_VERIFY_USAGE_STATUS = ?*CTL_VERIFY_USAGE_STATUS;
pub const CERT_REVOCATION_CRL_INFO = extern struct {
    cbSize: DWORD,
    pBaseCrlContext: PCCRL_CONTEXT,
    pDeltaCrlContext: PCCRL_CONTEXT,
    pCrlEntry: PCRL_ENTRY,
    fDeltaCrlEntry: BOOL,
};

pub const PCERT_REVOCATION_CRL_INFO = ?*CERT_REVOCATION_CRL_INFO;
pub const HCERTCHAINENGINE = HANDLE;
pub const CERT_REVOCATION_CHAIN_PARA = extern struct {
    cbSize: DWORD,
    hChainEngine: HCERTCHAINENGINE,
    hAdditionalStore: HCERTSTORE,
    dwChainFlags: DWORD,
    dwUrlRetrievalTimeout: DWORD,
    pftCurrentTime: LPFILETIME,
    pftCacheResync: LPFILETIME,
    cbMaxUrlRetrievalByteCount: DWORD,
};

pub const PCERT_REVOCATION_CHAIN_PARA = ?*CERT_REVOCATION_CHAIN_PARA;
pub const CERT_REVOCATION_PARA = extern struct {
    cbSize: DWORD,
    pIssuerCert: PCCERT_CONTEXT,
    cCertStore: DWORD,
    rgCertStore: ?*HCERTSTORE,
    hCrlStore: HCERTSTORE,
    pftTimeToUse: LPFILETIME,
};

pub const PCERT_REVOCATION_PARA = ?*CERT_REVOCATION_PARA;
pub const CERT_REVOCATION_STATUS = extern struct {
    cbSize: DWORD,
    dwIndex: DWORD,
    dwError: DWORD,
    dwReason: DWORD,
    fHasFreshnessTime: BOOL,
    dwFreshnessTime: DWORD,
};

pub const PCERT_REVOCATION_STATUS = ?*CERT_REVOCATION_STATUS;
pub const CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO = extern struct {
    CertSignHashCNGAlgPropData: CRYPT_DATA_BLOB,
    CertIssuerPubKeyBitLengthPropData: CRYPT_DATA_BLOB,
};

pub const PCRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO = ?*CRYPT_VERIFY_CERT_SIGN_STRONG_PROPERTIES_INFO;
pub const CRYPT_VERIFY_CERT_SIGN_WEAK_HASH_INFO = extern struct {
    cCNGHashAlgid: DWORD,
    rgpwszCNGHashAlgid: ?*PCWSTR,
    dwWeakIndex: DWORD,
};

pub const PCRYPT_VERIFY_CERT_SIGN_WEAK_HASH_INFO = ?*CRYPT_VERIFY_CERT_SIGN_WEAK_HASH_INFO;
pub const PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC = ?extern fn(DWORD, PCRYPT_ALGORITHM_IDENTIFIER, ?*(?*c_void), ?*LPWSTR) BOOL;
pub const PFN_CRYPT_SIGN_AND_ENCODE_HASH_FUNC = ?extern fn(NCRYPT_KEY_HANDLE, DWORD, PCRYPT_ALGORITHM_IDENTIFIER, ?*c_void, LPCWSTR, LPCWSTR, ?*BYTE, DWORD, ?*BYTE, ?*DWORD) BOOL;
pub const PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC = ?extern fn(DWORD, PCERT_PUBLIC_KEY_INFO, PCRYPT_ALGORITHM_IDENTIFIER, ?*c_void, LPCWSTR, LPCWSTR, ?*BYTE, DWORD, ?*BYTE, DWORD) BOOL;
pub const HCRYPTDEFAULTCONTEXT = ?*c_void;
pub const CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA = extern struct {
    cOID: DWORD,
    rgpszOID: ?*LPSTR,
};

pub const PCRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA = ?*CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA;
pub const PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC = ?extern fn(NCRYPT_KEY_HANDLE, DWORD, LPSTR, DWORD, ?*c_void, PCERT_PUBLIC_KEY_INFO, ?*DWORD) BOOL;
pub const PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC = ?extern fn(BCRYPT_KEY_HANDLE, DWORD, LPSTR, DWORD, ?*c_void, PCERT_PUBLIC_KEY_INFO, ?*DWORD) BOOL;
pub const PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC = ?extern fn(DWORD, PCERT_PUBLIC_KEY_INFO, DWORD, ?*c_void, ?*BCRYPT_KEY_HANDLE) BOOL;
pub const PFN_IMPORT_PRIV_KEY_FUNC = ?extern fn(HCRYPTPROV, ?*CRYPT_PRIVATE_KEY_INFO, DWORD, ?*c_void) BOOL;
pub const PFN_EXPORT_PRIV_KEY_FUNC = ?extern fn(HCRYPTPROV, DWORD, LPSTR, DWORD, ?*c_void, ?*CRYPT_PRIVATE_KEY_INFO, ?*DWORD) BOOL;
pub const PFN_CRYPT_GET_SIGNER_CERTIFICATE = ?extern fn(?*c_void, DWORD, PCERT_INFO, HCERTSTORE) PCCERT_CONTEXT;
pub const CRYPT_SIGN_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgEncodingType: DWORD,
    pSigningCert: PCCERT_CONTEXT,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvHashAuxInfo: ?*c_void,
    cMsgCert: DWORD,
    rgpMsgCert: ?*PCCERT_CONTEXT,
    cMsgCrl: DWORD,
    rgpMsgCrl: ?*PCCRL_CONTEXT,
    cAuthAttr: DWORD,
    rgAuthAttr: PCRYPT_ATTRIBUTE,
    cUnauthAttr: DWORD,
    rgUnauthAttr: PCRYPT_ATTRIBUTE,
    dwFlags: DWORD,
    dwInnerContentType: DWORD,
};

pub const PCRYPT_SIGN_MESSAGE_PARA = ?*CRYPT_SIGN_MESSAGE_PARA;
pub const CRYPT_VERIFY_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgAndCertEncodingType: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    pfnGetSignerCertificate: PFN_CRYPT_GET_SIGNER_CERTIFICATE,
    pvGetArg: ?*c_void,
};

pub const PCRYPT_VERIFY_MESSAGE_PARA = ?*CRYPT_VERIFY_MESSAGE_PARA;
pub const CRYPT_ENCRYPT_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgEncodingType: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    ContentEncryptionAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvEncryptionAuxInfo: ?*c_void,
    dwFlags: DWORD,
    dwInnerContentType: DWORD,
};

pub const PCRYPT_ENCRYPT_MESSAGE_PARA = ?*CRYPT_ENCRYPT_MESSAGE_PARA;
pub const CRYPT_DECRYPT_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgAndCertEncodingType: DWORD,
    cCertStore: DWORD,
    rghCertStore: ?*HCERTSTORE,
};

pub const PCRYPT_DECRYPT_MESSAGE_PARA = ?*CRYPT_DECRYPT_MESSAGE_PARA;
pub const CRYPT_HASH_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgEncodingType: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvHashAuxInfo: ?*c_void,
};

pub const PCRYPT_HASH_MESSAGE_PARA = ?*CRYPT_HASH_MESSAGE_PARA;
pub const CRYPT_KEY_SIGN_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgAndCertEncodingType: DWORD,
    u: extern union {
        hCryptProv: HCRYPTPROV,
        hNCryptKey: NCRYPT_KEY_HANDLE,
    },
    dwKeySpec: DWORD,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    pvHashAuxInfo: ?*c_void,
    PubKeyAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
};

pub const PCRYPT_KEY_SIGN_MESSAGE_PARA = ?*CRYPT_KEY_SIGN_MESSAGE_PARA;
pub const CRYPT_KEY_VERIFY_MESSAGE_PARA = extern struct {
    cbSize: DWORD,
    dwMsgEncodingType: DWORD,
    hCryptProv: HCRYPTPROV_LEGACY,
};

pub const PCRYPT_KEY_VERIFY_MESSAGE_PARA = ?*CRYPT_KEY_VERIFY_MESSAGE_PARA;
pub const CERT_CHAIN = extern struct {
    cCerts: DWORD,
    certs: PCERT_BLOB,
    keyLocatorInfo: CRYPT_KEY_PROV_INFO,
};

pub const PCERT_CHAIN = ?*CERT_CHAIN;
pub const HCRYPTASYNC = HANDLE;
pub const PHCRYPTASYNC = ?*HANDLE;
pub const PFN_CRYPT_ASYNC_PARAM_FREE_FUNC = ?extern fn(LPSTR, LPVOID) void;
pub const CRYPT_BLOB_ARRAY = extern struct {
    cBlob: DWORD,
    rgBlob: PCRYPT_DATA_BLOB,
};

pub const PCRYPT_BLOB_ARRAY = ?*CRYPT_BLOB_ARRAY;
pub const CRYPT_CREDENTIALS = extern struct {
    cbSize: DWORD,
    pszCredentialsOid: LPCSTR,
    pvCredentials: LPVOID,
};

pub const PCRYPT_CREDENTIALS = ?*CRYPT_CREDENTIALS;
pub const CRYPT_PASSWORD_CREDENTIALSA = extern struct {
    cbSize: DWORD,
    pszUsername: LPSTR,
    pszPassword: LPSTR,
};

pub const PCRYPT_PASSWORD_CREDENTIALSA = ?*CRYPT_PASSWORD_CREDENTIALSA;
pub const CRYPT_PASSWORD_CREDENTIALSW = extern struct {
    cbSize: DWORD,
    pszUsername: LPWSTR,
    pszPassword: LPWSTR,
};

pub const PCRYPT_PASSWORD_CREDENTIALSW = ?*CRYPT_PASSWORD_CREDENTIALSW;
pub const PFN_FREE_ENCODED_OBJECT_FUNC = ?extern fn(LPCSTR, PCRYPT_BLOB_ARRAY, LPVOID) void;
pub const CRYPTNET_URL_CACHE_PRE_FETCH_INFO = extern struct {
    cbSize: DWORD,
    dwObjectType: DWORD,
    dwError: DWORD,
    dwReserved: DWORD,
    ThisUpdateTime: FILETIME,
    NextUpdateTime: FILETIME,
    PublishTime: FILETIME,
};

pub const PCRYPTNET_URL_CACHE_PRE_FETCH_INFO = ?*CRYPTNET_URL_CACHE_PRE_FETCH_INFO;
pub const CRYPTNET_URL_CACHE_FLUSH_INFO = extern struct {
    cbSize: DWORD,
    dwExemptSeconds: DWORD,
    ExpireTime: FILETIME,
};

pub const PCRYPTNET_URL_CACHE_FLUSH_INFO = ?*CRYPTNET_URL_CACHE_FLUSH_INFO;
pub const CRYPTNET_URL_CACHE_RESPONSE_INFO = extern struct {
    cbSize: DWORD,
    wResponseType: WORD,
    wResponseFlags: WORD,
    LastModifiedTime: FILETIME,
    dwMaxAge: DWORD,
    pwszETag: LPCWSTR,
    dwProxyId: DWORD,
};

pub const PCRYPTNET_URL_CACHE_RESPONSE_INFO = ?*CRYPTNET_URL_CACHE_RESPONSE_INFO;
pub const CRYPT_RETRIEVE_AUX_INFO = extern struct {
    cbSize: DWORD,
    pLastSyncTime: ?*FILETIME,
    dwMaxUrlRetrievalByteCount: DWORD,
    pPreFetchInfo: PCRYPTNET_URL_CACHE_PRE_FETCH_INFO,
    pFlushInfo: PCRYPTNET_URL_CACHE_FLUSH_INFO,
    ppResponseInfo: ?*PCRYPTNET_URL_CACHE_RESPONSE_INFO,
    pwszCacheFileNamePrefix: LPWSTR,
    pftCacheResync: LPFILETIME,
    fProxyCacheRetrieval: BOOL,
    dwHttpStatusCode: DWORD,
    ppwszErrorResponseHeaders: ?*LPWSTR,
    ppErrorContentBlob: ?*PCRYPT_DATA_BLOB,
};

pub const PCRYPT_RETRIEVE_AUX_INFO = ?*CRYPT_RETRIEVE_AUX_INFO;
pub const PFN_CRYPT_CANCEL_RETRIEVAL = ?extern fn(DWORD, ?*c_void) BOOL;
pub const PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC = ?extern fn(LPVOID, DWORD, LPCSTR, LPSTR, LPVOID) void;
pub const CRYPT_ASYNC_RETRIEVAL_COMPLETION = extern struct {
    pfnCompletion: PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC,
    pvCompletion: LPVOID,
};

pub const PCRYPT_ASYNC_RETRIEVAL_COMPLETION = ?*CRYPT_ASYNC_RETRIEVAL_COMPLETION;
pub const PFN_CANCEL_ASYNC_RETRIEVAL_FUNC = ?extern fn(HCRYPTASYNC) BOOL;
pub const CRYPT_URL_ARRAY = extern struct {
    cUrl: DWORD,
    rgwszUrl: ?*LPWSTR,
};

pub const PCRYPT_URL_ARRAY = ?*CRYPT_URL_ARRAY;
pub const CRYPT_URL_INFO = extern struct {
    cbSize: DWORD,
    dwSyncDeltaTime: DWORD,
    cGroup: DWORD,
    rgcGroupEntry: ?*DWORD,
};

pub const PCRYPT_URL_INFO = ?*CRYPT_URL_INFO;
pub const CERT_CRL_CONTEXT_PAIR = extern struct {
    pCertContext: PCCERT_CONTEXT,
    pCrlContext: PCCRL_CONTEXT,
};

pub const PCERT_CRL_CONTEXT_PAIR = ?*CERT_CRL_CONTEXT_PAIR;
pub const PCCERT_CRL_CONTEXT_PAIR = ?*const CERT_CRL_CONTEXT_PAIR;
pub const CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO = extern struct {
    cbSize: DWORD,
    iDeltaCrlIndicator: c_int,
    pftCacheResync: LPFILETIME,
    pLastSyncTime: LPFILETIME,
    pMaxAgeTime: LPFILETIME,
    pChainPara: PCERT_REVOCATION_CHAIN_PARA,
    pDeltaCrlIndicator: PCRYPT_INTEGER_BLOB,
};

pub const PCRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO = ?*CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO;
pub const PFN_CRYPT_ENUM_KEYID_PROP = ?extern fn(?*const CRYPT_HASH_BLOB, DWORD, ?*c_void, ?*c_void, DWORD, ?*DWORD, ?*(?*c_void), ?*DWORD) BOOL;
pub const CERT_CHAIN_ENGINE_CONFIG = extern struct {
    cbSize: DWORD,
    hRestrictedRoot: HCERTSTORE,
    hRestrictedTrust: HCERTSTORE,
    hRestrictedOther: HCERTSTORE,
    cAdditionalStore: DWORD,
    rghAdditionalStore: ?*HCERTSTORE,
    dwFlags: DWORD,
    dwUrlRetrievalTimeout: DWORD,
    MaximumCachedCertificates: DWORD,
    CycleDetectionModulus: DWORD,
    hExclusiveRoot: HCERTSTORE,
    hExclusiveTrustedPeople: HCERTSTORE,
    dwExclusiveFlags: DWORD,
};

pub const PCERT_CHAIN_ENGINE_CONFIG = ?*CERT_CHAIN_ENGINE_CONFIG;
pub const CERT_TRUST_STATUS = extern struct {
    dwErrorStatus: DWORD,
    dwInfoStatus: DWORD,
};

pub const PCERT_TRUST_STATUS = ?*CERT_TRUST_STATUS;
pub const CERT_REVOCATION_INFO = extern struct {
    cbSize: DWORD,
    dwRevocationResult: DWORD,
    pszRevocationOid: LPCSTR,
    pvOidSpecificInfo: LPVOID,
    fHasFreshnessTime: BOOL,
    dwFreshnessTime: DWORD,
    pCrlInfo: PCERT_REVOCATION_CRL_INFO,
};

pub const PCERT_REVOCATION_INFO = ?*CERT_REVOCATION_INFO;
pub const CERT_TRUST_LIST_INFO = extern struct {
    cbSize: DWORD,
    pCtlEntry: PCTL_ENTRY,
    pCtlContext: PCCTL_CONTEXT,
};

pub const PCERT_TRUST_LIST_INFO = ?*CERT_TRUST_LIST_INFO;
pub const CERT_CHAIN_ELEMENT = extern struct {
    cbSize: DWORD,
    pCertContext: PCCERT_CONTEXT,
    TrustStatus: CERT_TRUST_STATUS,
    pRevocationInfo: PCERT_REVOCATION_INFO,
    pIssuanceUsage: PCERT_ENHKEY_USAGE,
    pApplicationUsage: PCERT_ENHKEY_USAGE,
    pwszExtendedErrorInfo: LPCWSTR,
};

pub const PCERT_CHAIN_ELEMENT = ?*CERT_CHAIN_ELEMENT;
pub const PCCERT_CHAIN_ELEMENT = ?*const CERT_CHAIN_ELEMENT;
pub const CERT_SIMPLE_CHAIN = extern struct {
    cbSize: DWORD,
    TrustStatus: CERT_TRUST_STATUS,
    cElement: DWORD,
    rgpElement: ?*PCERT_CHAIN_ELEMENT,
    pTrustListInfo: PCERT_TRUST_LIST_INFO,
    fHasRevocationFreshnessTime: BOOL,
    dwRevocationFreshnessTime: DWORD,
};

pub const PCERT_SIMPLE_CHAIN = ?*CERT_SIMPLE_CHAIN;
pub const PCCERT_SIMPLE_CHAIN = ?*const CERT_SIMPLE_CHAIN;

pub const PCCERT_CHAIN_CONTEXT = ?*const CERT_CHAIN_CONTEXT;
pub const CERT_CHAIN_CONTEXT = extern struct {
    cbSize: DWORD,
    TrustStatus: CERT_TRUST_STATUS,
    cChain: DWORD,
    rgpChain: ?*PCERT_SIMPLE_CHAIN,
    cLowerQualityChainContext: DWORD,
    rgpLowerQualityChainContext: ?*PCCERT_CHAIN_CONTEXT,
    fHasRevocationFreshnessTime: BOOL,
    dwRevocationFreshnessTime: DWORD,
    dwCreateFlags: DWORD,
    ChainId: GUID,
};
pub const PCERT_CHAIN_CONTEXT = ?*CERT_CHAIN_CONTEXT;
pub const CERT_USAGE_MATCH = extern struct {
    dwType: DWORD,
    Usage: CERT_ENHKEY_USAGE,
};

pub const PCERT_USAGE_MATCH = ?*CERT_USAGE_MATCH;
pub const CTL_USAGE_MATCH = extern struct {
    dwType: DWORD,
    Usage: CTL_USAGE,
};

pub const PCTL_USAGE_MATCH = ?*CTL_USAGE_MATCH;
pub const CERT_CHAIN_PARA = extern struct {
    cbSize: DWORD,
    RequestedUsage: CERT_USAGE_MATCH,
};

pub const PCERT_CHAIN_PARA = ?*CERT_CHAIN_PARA;
pub const CRL_REVOCATION_INFO = extern struct {
    pCrlEntry: PCRL_ENTRY,
    pCrlContext: PCCRL_CONTEXT,
    pCrlIssuerChain: PCCERT_CHAIN_CONTEXT,
};

pub const PCRL_REVOCATION_INFO = ?*CRL_REVOCATION_INFO;
pub const PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK = ?extern fn(PCCERT_CONTEXT, ?*c_void) BOOL;
pub const CERT_CHAIN_FIND_BY_ISSUER_PARA = extern struct {
    cbSize: DWORD,
    pszUsageIdentifier: LPCSTR,
    dwKeySpec: DWORD,
    dwAcquirePrivateKeyFlags: DWORD,
    cIssuer: DWORD,
    rgIssuer: ?*CERT_NAME_BLOB,
    pfnFindCallback: PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK,
    pvFindArg: ?*c_void,
};
pub const CERT_CHAIN_FIND_ISSUER_PARA = CERT_CHAIN_FIND_BY_ISSUER_PARA;
pub const PCERT_CHAIN_FIND_ISSUER_PARA = ?*CERT_CHAIN_FIND_BY_ISSUER_PARA;

pub const PCERT_CHAIN_FIND_BY_ISSUER_PARA = ?*CERT_CHAIN_FIND_BY_ISSUER_PARA;
pub const CERT_CHAIN_POLICY_PARA = extern struct {
    cbSize: DWORD,
    dwFlags: DWORD,
    pvExtraPolicyPara: ?*c_void,
};

pub const PCERT_CHAIN_POLICY_PARA = ?*CERT_CHAIN_POLICY_PARA;
pub const CERT_CHAIN_POLICY_STATUS = extern struct {
    cbSize: DWORD,
    dwError: DWORD,
    lChainIndex: LONG,
    lElementIndex: LONG,
    pvExtraPolicyStatus: ?*c_void,
};

pub const PCERT_CHAIN_POLICY_STATUS = ?*CERT_CHAIN_POLICY_STATUS;
pub const AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA = extern struct {
    cbSize: DWORD,
    dwRegPolicySettings: DWORD,
    pSignerInfo: PCMSG_SIGNER_INFO,
};

pub const PAUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA = ?*AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA;
pub const AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS = extern struct {
    cbSize: DWORD,
    fCommercial: BOOL,
};

pub const PAUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS = ?*AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS;
pub const AUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA = extern struct {
    cbSize: DWORD,
    dwRegPolicySettings: DWORD,
    fCommercial: BOOL,
};

pub const PAUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA = ?*AUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA;
pub const HTTPSPolicyCallbackData = extern struct {
    u: extern union {
        cbStruct: DWORD,
        cbSize: DWORD,
    },
    dwAuthType: DWORD,
    fdwChecks: DWORD,
    pwszServerName: ?*WCHAR,
};

pub const PHTTPSPolicyCallbackData = ?*HTTPSPolicyCallbackData;
pub const SSL_EXTRA_CERT_CHAIN_POLICY_PARA = HTTPSPolicyCallbackData;
pub const PSSL_EXTRA_CERT_CHAIN_POLICY_PARA = ?*HTTPSPolicyCallbackData;
pub const EV_EXTRA_CERT_CHAIN_POLICY_PARA = extern struct {
    cbSize: DWORD,
    dwRootProgramQualifierFlags: DWORD,
};

pub const PEV_EXTRA_CERT_CHAIN_POLICY_PARA = ?*EV_EXTRA_CERT_CHAIN_POLICY_PARA;
pub const EV_EXTRA_CERT_CHAIN_POLICY_STATUS = extern struct {
    cbSize: DWORD,
    dwQualifiers: DWORD,
    dwIssuanceUsageIndex: DWORD,
};

pub const PEV_EXTRA_CERT_CHAIN_POLICY_STATUS = ?*EV_EXTRA_CERT_CHAIN_POLICY_STATUS;
pub const SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS = extern struct {
    cbSize: DWORD,
    dwErrorLevel: DWORD,
    dwErrorCategory: DWORD,
    dwReserved: DWORD,
    wszErrorText: [256]WCHAR,
};

pub const PSSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS = ?*SSL_F12_EXTRA_CERT_CHAIN_POLICY_STATUS;
pub const SSL_HPKP_HEADER_EXTRA_CERT_CHAIN_POLICY_PARA = extern struct {
    cbSize: DWORD,
    dwReserved: DWORD,
    pwszServerName: LPWSTR,
    rgpszHpkpValue: [2]LPSTR,
};

pub const PSSL_HPKP_HEADER_EXTRA_CERT_CHAIN_POLICY_PARA = ?*SSL_HPKP_HEADER_EXTRA_CERT_CHAIN_POLICY_PARA;
pub const SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_PARA = extern struct {
    cbSize: DWORD,
    dwReserved: DWORD,
    pwszServerName: PCWSTR,
};

pub const PSSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_PARA = ?*SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_PARA;
pub const SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_STATUS = extern struct {
    cbSize: DWORD,
    lError: LONG,
    wszErrorText: [512]WCHAR,
};

pub const PSSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_STATUS = ?*SSL_KEY_PIN_EXTRA_CERT_CHAIN_POLICY_STATUS;
pub const CRYPT_PKCS12_PBE_PARAMS = extern struct {
    iIterations: c_int,
    cbSalt: ULONG,
};

pub const HCERT_SERVER_OCSP_RESPONSE = ?*c_void;
pub const CERT_SERVER_OCSP_RESPONSE_CONTEXT = extern struct {
    cbSize: DWORD,
    pbEncodedOcspResponse: ?*BYTE,
    cbEncodedOcspResponse: DWORD,
};

pub const PCERT_SERVER_OCSP_RESPONSE_CONTEXT = ?*CERT_SERVER_OCSP_RESPONSE_CONTEXT;
pub const PCCERT_SERVER_OCSP_RESPONSE_CONTEXT = ?*const CERT_SERVER_OCSP_RESPONSE_CONTEXT;
pub const PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK = ?extern fn(PCCERT_CHAIN_CONTEXT, PCCERT_SERVER_OCSP_RESPONSE_CONTEXT, PCCRL_CONTEXT, PCCRL_CONTEXT, PVOID, DWORD) void;
pub const CERT_SERVER_OCSP_RESPONSE_OPEN_PARA = extern struct {
    cbSize: DWORD,
    dwFlags: DWORD,
    pcbUsedSize: ?*DWORD,
    pwszOcspDirectory: PWSTR,
    pfnUpdateCallback: PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK,
    pvUpdateCallbackArg: PVOID,
};

pub const PCERT_SERVER_OCSP_RESPONSE_OPEN_PARA = ?*CERT_SERVER_OCSP_RESPONSE_OPEN_PARA;
pub const CERT_SELECT_CHAIN_PARA = extern struct {
    hChainEngine: HCERTCHAINENGINE,
    pTime: PFILETIME,
    hAdditionalStore: HCERTSTORE,
    pChainPara: PCERT_CHAIN_PARA,
    dwFlags: DWORD,
};

pub const PCERT_SELECT_CHAIN_PARA = ?*CERT_SELECT_CHAIN_PARA;
pub const PCCERT_SELECT_CHAIN_PARA = ?*const CERT_SELECT_CHAIN_PARA;
pub const CERT_SELECT_CRITERIA = extern struct {
    dwType: DWORD,
    cPara: DWORD,
    ppPara: ?*(?*c_void),
};

pub const PCERT_SELECT_CRITERIA = ?*CERT_SELECT_CRITERIA;
pub const PCCERT_SELECT_CRITERIA = ?*const CERT_SELECT_CRITERIA;
pub const CRYPT_TIMESTAMP_REQUEST = extern struct {
    dwVersion: DWORD,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    HashedMessage: CRYPT_DER_BLOB,
    pszTSAPolicyId: LPSTR,
    Nonce: CRYPT_INTEGER_BLOB,
    fCertReq: BOOL,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCRYPT_TIMESTAMP_REQUEST = ?*CRYPT_TIMESTAMP_REQUEST;
pub const CRYPT_TIMESTAMP_RESPONSE = extern struct {
    dwStatus: DWORD,
    cFreeText: DWORD,
    rgFreeText: ?*LPWSTR,
    FailureInfo: CRYPT_BIT_BLOB,
    ContentInfo: CRYPT_DER_BLOB,
};

pub const PCRYPT_TIMESTAMP_RESPONSE = ?*CRYPT_TIMESTAMP_RESPONSE;
pub const CRYPT_TIMESTAMP_ACCURACY = extern struct {
    dwSeconds: DWORD,
    dwMillis: DWORD,
    dwMicros: DWORD,
};

pub const PCRYPT_TIMESTAMP_ACCURACY = ?*CRYPT_TIMESTAMP_ACCURACY;
pub const CRYPT_TIMESTAMP_INFO = extern struct {
    dwVersion: DWORD,
    pszTSAPolicyId: LPSTR,
    HashAlgorithm: CRYPT_ALGORITHM_IDENTIFIER,
    HashedMessage: CRYPT_DER_BLOB,
    SerialNumber: CRYPT_INTEGER_BLOB,
    ftTime: FILETIME,
    pvAccuracy: PCRYPT_TIMESTAMP_ACCURACY,
    fOrdering: BOOL,
    Nonce: CRYPT_DER_BLOB,
    Tsa: CRYPT_DER_BLOB,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCRYPT_TIMESTAMP_INFO = ?*CRYPT_TIMESTAMP_INFO;
pub const CRYPT_TIMESTAMP_CONTEXT = extern struct {
    cbEncoded: DWORD,
    pbEncoded: ?*BYTE,
    pTimeStamp: PCRYPT_TIMESTAMP_INFO,
};

pub const PCRYPT_TIMESTAMP_CONTEXT = ?*CRYPT_TIMESTAMP_CONTEXT;
pub const CRYPT_TIMESTAMP_PARA = extern struct {
    pszTSAPolicyId: LPCSTR,
    fRequestCerts: BOOL,
    Nonce: CRYPT_INTEGER_BLOB,
    cExtension: DWORD,
    rgExtension: PCERT_EXTENSION,
};

pub const PCRYPT_TIMESTAMP_PARA = ?*CRYPT_TIMESTAMP_PARA;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH = ?extern fn(LPVOID, ?*PCERT_NAME_BLOB, DWORD) BOOL;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET = ?extern fn(LPVOID, PCRYPT_DATA_BLOB, DWORD, PCERT_NAME_BLOB, ?*PBYTE, ?*DWORD, ?*PCWSTR, ?*PCRYPT_DATA_BLOB) BOOL;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE = ?extern fn(DWORD, LPVOID) void;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD = ?extern fn(LPVOID, PCWSTR) void;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE = ?extern fn(LPVOID, PBYTE) void;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER = ?extern fn(LPVOID, PCRYPT_DATA_BLOB) void;
pub const CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE = extern struct {
    cbSize: DWORD,
    pfnGet: PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_GET,
    pfnRelease: PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_RELEASE,
    pfnFreePassword: PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_PASSWORD,
    pfnFree: PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE,
    pfnFreeIdentifier: PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FREE_IDENTIFIER,
};

pub const PCRYPT_OBJECT_LOCATOR_PROVIDER_TABLE = ?*CRYPT_OBJECT_LOCATOR_PROVIDER_TABLE;
pub const PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_INITIALIZE = ?extern fn(PFN_CRYPT_OBJECT_LOCATOR_PROVIDER_FLUSH, LPVOID, ?*DWORD, ?*PCRYPT_OBJECT_LOCATOR_PROVIDER_TABLE, ?*(?*c_void)) BOOL;
pub const PFN_CERT_IS_WEAK_HASH = ?extern fn(DWORD, LPCWSTR, DWORD, PCCERT_CHAIN_CONTEXT, LPFILETIME, LPCWSTR) BOOL;
pub const CRYPTPROTECT_PROMPTSTRUCT = extern struct {
    cbSize: DWORD,
    dwPromptFlags: DWORD,
    hwndApp: HWND,
    szPrompt: LPCWSTR,
};

pub const PCRYPTPROTECT_PROMPTSTRUCT = ?*CRYPTPROTECT_PROMPTSTRUCT;
pub const CERTIFICATE_BLOB = extern struct {
    dwCertEncodingType: DWORD,
    cbData: DWORD,
    pbData: PBYTE,
};
pub const EFS_CERTIFICATE_BLOB = CERTIFICATE_BLOB;
pub const PEFS_CERTIFICATE_BLOB = ?*CERTIFICATE_BLOB;
pub const EFS_HASH_BLOB = extern struct {
    cbData: DWORD,
    pbData: PBYTE,
};

pub const PEFS_HASH_BLOB = ?*EFS_HASH_BLOB;
pub const EFS_RPC_BLOB = extern struct {
    cbData: DWORD,
    pbData: PBYTE,
};

pub const PEFS_RPC_BLOB = ?*EFS_RPC_BLOB;
pub const EFS_PIN_BLOB = extern struct {
    cbPadding: DWORD,
    cbData: DWORD,
    pbData: PBYTE,
};

pub const PEFS_PIN_BLOB = ?*EFS_PIN_BLOB;
pub const EFS_KEY_INFO = extern struct {
    dwVersion: DWORD,
    Entropy: ULONG,
    Algorithm: ALG_ID,
    KeyLength: ULONG,
};

pub const PEFS_KEY_INFO = ?*EFS_KEY_INFO;
pub const EFS_COMPATIBILITY_INFO = extern struct {
    EfsVersion: DWORD,
};

pub const PEFS_COMPATIBILITY_INFO = ?*EFS_COMPATIBILITY_INFO;
pub const EFS_VERSION_INFO = extern struct {
    EfsVersion: DWORD,
    SubVersion: DWORD,
};

pub const PEFS_VERSION_INFO = ?*EFS_VERSION_INFO;
pub const EFS_DECRYPTION_STATUS_INFO = extern struct {
    dwDecryptionError: DWORD,
    dwHashOffset: DWORD,
    cbHash: DWORD,
};

pub const PEFS_DECRYPTION_STATUS_INFO = ?*EFS_DECRYPTION_STATUS_INFO;
pub const EFS_ENCRYPTION_STATUS_INFO = extern struct {
    bHasCurrentKey: BOOL,
    dwEncryptionError: DWORD,
};

pub const PEFS_ENCRYPTION_STATUS_INFO = ?*EFS_ENCRYPTION_STATUS_INFO;
pub const ENCRYPTION_CERTIFICATE = extern struct {
    cbTotalLength: DWORD,
    pUserSid: ?*SID,
    pCertBlob: PEFS_CERTIFICATE_BLOB,
};

pub const PENCRYPTION_CERTIFICATE = ?*ENCRYPTION_CERTIFICATE;
pub const ENCRYPTION_CERTIFICATE_HASH = extern struct {
    cbTotalLength: DWORD,
    pUserSid: ?*SID,
    pHash: PEFS_HASH_BLOB,
    lpDisplayInformation: LPWSTR,
};

pub const PENCRYPTION_CERTIFICATE_HASH = ?*ENCRYPTION_CERTIFICATE_HASH;
pub const ENCRYPTION_CERTIFICATE_HASH_LIST = extern struct {
    nCert_Hash: DWORD,
    pUsers: ?*PENCRYPTION_CERTIFICATE_HASH,
};

pub const PENCRYPTION_CERTIFICATE_HASH_LIST = ?*ENCRYPTION_CERTIFICATE_HASH_LIST;
pub const ENCRYPTION_CERTIFICATE_LIST = extern struct {
    nUsers: DWORD,
    pUsers: ?*PENCRYPTION_CERTIFICATE,
};

pub const PENCRYPTION_CERTIFICATE_LIST = ?*ENCRYPTION_CERTIFICATE_LIST;
pub const ENCRYPTED_FILE_METADATA_SIGNATURE = extern struct {
    dwEfsAccessType: DWORD,
    pCertificatesAdded: PENCRYPTION_CERTIFICATE_HASH_LIST,
    pEncryptionCertificate: PENCRYPTION_CERTIFICATE,
    pEfsStreamSignature: PEFS_RPC_BLOB,
};

pub const PENCRYPTED_FILE_METADATA_SIGNATURE = ?*ENCRYPTED_FILE_METADATA_SIGNATURE;
pub const ENCRYPTION_PROTECTOR = extern struct {
    cbTotalLength: DWORD,
    pUserSid: ?*SID,
    lpProtectorDescriptor: LPWSTR,
};

pub const PENCRYPTION_PROTECTOR = ?*ENCRYPTION_PROTECTOR;
pub const ENCRYPTION_PROTECTOR_LIST = extern struct {
    nProtectors: DWORD,
    pProtectors: ?*PENCRYPTION_PROTECTOR,
};

pub const PENCRYPTION_PROTECTOR_LIST = ?*ENCRYPTION_PROTECTOR_LIST;
pub const RPC_IMPORT_CONTEXT_P = extern struct {
    LookupContext: RPC_NS_HANDLE,
    ProposedHandle: RPC_BINDING_HANDLE,
    Bindings: ?*RPC_BINDING_VECTOR,
};
pub const PRPC_IMPORT_CONTEXT_P = ?*extern struct {
    LookupContext: RPC_NS_HANDLE,
    ProposedHandle: RPC_BINDING_HANDLE,
    Bindings: ?*RPC_BINDING_VECTOR,
};
pub const byte = u8;
pub const cs_byte = byte;
pub const boolean = u8;
pub const NDR_CCONTEXT = ?*c_void;
pub const NDR_SCONTEXT = ?*extern struct {
    pad: [2](?*c_void),
    userContext: ?*c_void,
};
pub const NDR_RUNDOWN = ?extern fn(?*c_void) void;
pub const NDR_NOTIFY_ROUTINE = ?extern fn() void;
pub const NDR_NOTIFY2_ROUTINE = ?extern fn(boolean) void;
pub const SCONTEXT_QUEUE = extern struct {
    NumberOfObjects: c_ulong,
    ArrayOfObjects: ?*NDR_SCONTEXT,
};

pub const PSCONTEXT_QUEUE = ?*SCONTEXT_QUEUE;
pub const error_status_t = c_ulong;
pub const MIDL_STUB_MESSAGE = @OpaqueType();
pub const GENERIC_BINDING_ROUTINE = ?extern fn(?*c_void) ?*c_void;
pub const GENERIC_UNBIND_ROUTINE = ?extern fn(?*c_void, ?[*]u8) void;
pub const _GENERIC_BINDING_INFO = extern struct {
    pObj: ?*c_void,
    Size: c_uint,
    pfnBind: GENERIC_BINDING_ROUTINE,
    pfnUnbind: GENERIC_UNBIND_ROUTINE,
};
pub const PGENERIC_BINDING_INFO = ?*_GENERIC_BINDING_INFO;
pub const GENERIC_BINDING_ROUTINE_PAIR = extern struct {
    pfnBind: GENERIC_BINDING_ROUTINE,
    pfnUnbind: GENERIC_UNBIND_ROUTINE,
};

pub const EXPR_EVAL = ?extern fn(?*MIDL_STUB_MESSAGE) void;
pub const PMIDL_STUB_MESSAGE = ?*MIDL_STUB_MESSAGE;
pub const XMIT_HELPER_ROUTINE = ?extern fn(PMIDL_STUB_MESSAGE) void;
pub const XMIT_ROUTINE_QUINTUPLE = extern struct {
    pfnTranslateToXmit: XMIT_HELPER_ROUTINE,
    pfnTranslateFromXmit: XMIT_HELPER_ROUTINE,
    pfnFreeXmit: XMIT_HELPER_ROUTINE,
    pfnFreeInst: XMIT_HELPER_ROUTINE,
};

pub const MALLOC_FREE_STRUCT = extern struct {
    pfnAllocate: ?extern fn(usize) ?*c_void,
    pfnFree: ?extern fn(?*c_void) void,
};

pub const COMM_FAULT_OFFSETS = extern struct {
    CommOffset: c_short,
    FaultOffset: c_short,
};

pub const USER_MARSHAL_SIZING_ROUTINE = ?extern fn(?*c_ulong, c_ulong, ?*c_void) c_ulong;
pub const USER_MARSHAL_MARSHALLING_ROUTINE = ?extern fn(?*c_ulong, ?[*]u8, ?*c_void) ?[*]u8;
pub const USER_MARSHAL_UNMARSHALLING_ROUTINE = ?extern fn(?*c_ulong, ?[*]u8, ?*c_void) ?[*]u8;
pub const USER_MARSHAL_FREEING_ROUTINE = ?extern fn(?*c_ulong, ?*c_void) void;
pub const USER_MARSHAL_ROUTINE_QUADRUPLE = extern struct {
    pfnBufferSize: USER_MARSHAL_SIZING_ROUTINE,
    pfnMarshall: USER_MARSHAL_MARSHALLING_ROUTINE,
    pfnUnmarshall: USER_MARSHAL_UNMARSHALLING_ROUTINE,
    pfnFree: USER_MARSHAL_FREEING_ROUTINE,
};

pub const IDL_CS_NO_CONVERT = IDL_CS_CONVERT.IDL_CS_NO_CONVERT;
pub const IDL_CS_IN_PLACE_CONVERT = IDL_CS_CONVERT.IDL_CS_IN_PLACE_CONVERT;
pub const IDL_CS_NEW_BUFFER_CONVERT = IDL_CS_CONVERT.IDL_CS_NEW_BUFFER_CONVERT;
pub const IDL_CS_CONVERT = extern enum {
    IDL_CS_NO_CONVERT,
    IDL_CS_IN_PLACE_CONVERT,
    IDL_CS_NEW_BUFFER_CONVERT,
};
pub const CS_TYPE_NET_SIZE_ROUTINE = ?extern fn(RPC_BINDING_HANDLE, c_ulong, c_ulong, ?*IDL_CS_CONVERT, ?*c_ulong, ?*error_status_t) void;
pub const CS_TYPE_TO_NETCS_ROUTINE = ?extern fn(RPC_BINDING_HANDLE, c_ulong, ?*c_void, c_ulong, ?*byte, ?*c_ulong, ?*error_status_t) void;
pub const CS_TYPE_LOCAL_SIZE_ROUTINE = ?extern fn(RPC_BINDING_HANDLE, c_ulong, c_ulong, ?*IDL_CS_CONVERT, ?*c_ulong, ?*error_status_t) void;
pub const CS_TYPE_FROM_NETCS_ROUTINE = ?extern fn(RPC_BINDING_HANDLE, c_ulong, ?*byte, c_ulong, c_ulong, ?*c_void, ?*c_ulong, ?*error_status_t) void;
pub const NDR_CS_SIZE_CONVERT_ROUTINES = extern struct {
    pfnNetSize: CS_TYPE_NET_SIZE_ROUTINE,
    pfnToNetCs: CS_TYPE_TO_NETCS_ROUTINE,
    pfnLocalSize: CS_TYPE_LOCAL_SIZE_ROUTINE,
    pfnFromNetCs: CS_TYPE_FROM_NETCS_ROUTINE,
};

pub const CS_TAG_GETTING_ROUTINE = ?extern fn(RPC_BINDING_HANDLE, c_int, ?*c_ulong, ?*c_ulong, ?*c_ulong, ?*error_status_t) void;
pub const NDR_CS_ROUTINES = extern struct {
    pSizeConvertRoutines: ?*NDR_CS_SIZE_CONVERT_ROUTINES,
    pTagGettingRoutines: ?*CS_TAG_GETTING_ROUTINE,
};

pub const PFORMAT_STRING = ?[*]const u8;
pub const NDR_EXPR_DESC = extern struct {
    pOffset: ?*const c_ushort,
    pFormatExpr: PFORMAT_STRING,
};

pub const MIDL_STUB_DESC = extern struct {
    RpcInterfaceInformation: ?*c_void,
    pfnAllocate: ?extern fn(usize) ?*c_void,
    pfnFree: ?extern fn(?*c_void) void,
    IMPLICIT_HANDLE_INFO: extern union {
        pAutoHandle: ?*handle_t,
        pPrimitiveHandle: ?*handle_t,
        pGenericBindingInfo: PGENERIC_BINDING_INFO,
    },
    apfnNdrRundownRoutines: ?*const NDR_RUNDOWN,
    aGenericBindingRoutinePairs: ?*const GENERIC_BINDING_ROUTINE_PAIR,
    apfnExprEval: ?*const EXPR_EVAL,
    aXmitQuintuple: ?*const XMIT_ROUTINE_QUINTUPLE,
    pFormatTypes: ?[*]const u8,
    fCheckBounds: c_int,
    Version: c_ulong,
    pMallocFreeStruct: ?*MALLOC_FREE_STRUCT,
    MIDLVersion: c_long,
    CommFaultOffsets: ?*const COMM_FAULT_OFFSETS,
    aUserMarshalQuadruple: ?*const USER_MARSHAL_ROUTINE_QUADRUPLE,
    NotifyRoutineTable: ?*const NDR_NOTIFY_ROUTINE,
    mFlags: ULONG_PTR,
    CsRoutineTables: ?*const NDR_CS_ROUTINES,
    ProxyServerInfo: ?*c_void,
    pExprInfo: ?*const NDR_EXPR_DESC,
};
pub const XLAT_SIDE = c_int;
pub const FULL_PTR_XLAT_TABLES = extern struct {
    RefIdToPointer: ?*c_void,
    PointerToRefId: ?*c_void,
    NextRefId: c_ulong,
    XlatSide: XLAT_SIDE,
};
pub const RPC_BUFPTR = ?[*]u8;
pub const RPC_LENGTH = c_ulong;
pub const ARRAY_INFO = extern struct {
    Dimension: c_long,
    BufferConformanceMark: ?*c_ulong,
    BufferVarianceMark: ?*c_ulong,
    MaxCountArray: ?*c_ulong,
    OffsetArray: ?*c_ulong,
    ActualCountArray: ?*c_ulong,
};
pub const PARRAY_INFO = ?*extern struct {
    Dimension: c_long,
    BufferConformanceMark: ?*c_ulong,
    BufferVarianceMark: ?*c_ulong,
    MaxCountArray: ?*c_ulong,
    OffsetArray: ?*c_ulong,
    ActualCountArray: ?*c_ulong,
};
pub const NDR_ASYNC_MESSAGE = @OpaqueType();
pub const PNDR_ASYNC_MESSAGE = ?*NDR_ASYNC_MESSAGE;
pub const NDR_CORRELATION_INFO = @OpaqueType();
pub const PNDR_CORRELATION_INFO = ?*NDR_CORRELATION_INFO;
pub const MIDL_METHOD_PROPERTY = extern struct {
    Id: c_ulong,
    Value: ULONG_PTR,
};

pub const MIDL_METHOD_PROPERTY_MAP = extern struct {
    Count: c_ulong,
    Properties: ?*const MIDL_METHOD_PROPERTY,
};

pub const MIDL_INTERFACE_METHOD_PROPERTIES = extern struct {
    MethodCount: c_ushort,
    MethodProperties: ?*const (?*const MIDL_METHOD_PROPERTY_MAP),
};

pub const MIDL_SYNTAX_INFO = extern struct {
    TransferSyntax: RPC_SYNTAX_IDENTIFIER,
    DispatchTable: ?*RPC_DISPATCH_TABLE,
    ProcString: PFORMAT_STRING,
    FmtStringOffset: ?*const c_ushort,
    TypeString: PFORMAT_STRING,
    aUserMarshalQuadruple: ?*const c_void,
    pMethodProperties: ?*const MIDL_INTERFACE_METHOD_PROPERTIES,
    pReserved2: ULONG_PTR,
};

pub const PMIDL_SYNTAX_INFO = ?*MIDL_SYNTAX_INFO;
pub const NDR_ALLOC_ALL_NODES_CONTEXT = @OpaqueType();
pub const NDR_POINTER_QUEUE_STATE = @OpaqueType();
pub const NDR_PROC_CONTEXT = @OpaqueType();

pub const PGENERIC_BINDING_ROUTINE_PAIR = ?*GENERIC_BINDING_ROUTINE_PAIR;
pub const GENERIC_BINDING_INFO = _GENERIC_BINDING_INFO;
pub const PXMIT_ROUTINE_QUINTUPLE = ?*XMIT_ROUTINE_QUINTUPLE;
pub const USER_MARSHAL_CB_BUFFER_SIZE = USER_MARSHAL_CB_TYPE.USER_MARSHAL_CB_BUFFER_SIZE;
pub const USER_MARSHAL_CB_MARSHALL = USER_MARSHAL_CB_TYPE.USER_MARSHAL_CB_MARSHALL;
pub const USER_MARSHAL_CB_UNMARSHALL = USER_MARSHAL_CB_TYPE.USER_MARSHAL_CB_UNMARSHALL;
pub const USER_MARSHAL_CB_FREE = USER_MARSHAL_CB_TYPE.USER_MARSHAL_CB_FREE;
pub const USER_MARSHAL_CB_TYPE = extern enum {
    USER_MARSHAL_CB_BUFFER_SIZE,
    USER_MARSHAL_CB_MARSHALL,
    USER_MARSHAL_CB_UNMARSHALL,
    USER_MARSHAL_CB_FREE,
};

pub const USER_MARSHAL_CB = extern struct {
    Flags: c_ulong,
    pStubMsg: PMIDL_STUB_MESSAGE,
    pReserve: PFORMAT_STRING,
    Signature: c_ulong,
    CBType: USER_MARSHAL_CB_TYPE,
    pFormat: PFORMAT_STRING,
    pTypeFormat: PFORMAT_STRING,
};


pub const PMIDL_STUB_DESC = ?*const MIDL_STUB_DESC;
pub const PMIDL_XMIT_TYPE = ?*c_void;
pub const MIDL_FORMAT_STRING = extern struct {
    Pad: c_short,
    Format: &u8,
};

pub const STUB_THUNK = ?extern fn(PMIDL_STUB_MESSAGE) void;
pub const PMIDL_METHOD_PROPERTY = ?*MIDL_METHOD_PROPERTY;
pub const PMIDL_METHOD_PROPERTY_MAP = ?*MIDL_METHOD_PROPERTY_MAP;
pub const MIDL_SERVER_INFO_ = @OpaqueType();
pub const MIDL_SERVER_INFO = MIDL_SERVER_INFO_;
pub const PMIDL_SERVER_INFO = ?*MIDL_SERVER_INFO_;
pub const MIDL_STUBLESS_PROXY_INFO = extern struct {
    pStubDesc: PMIDL_STUB_DESC,
    ProcFormatString: PFORMAT_STRING,
    FormatStringOffset: ?*const c_ushort,
    pTransferSyntax: PRPC_SYNTAX_IDENTIFIER,
    nCount: ULONG_PTR,
    pSyntaxInfo: PMIDL_SYNTAX_INFO,
};

pub const PMIDL_STUBLESS_PROXY_INFO = ?*MIDL_STUBLESS_PROXY_INFO;
pub const PARAM_OFFSETTABLE = ?*c_ushort;
pub const PPARAM_OFFSETTABLE = ?*c_ushort;
pub const CLIENT_CALL_RETURN = extern union {
    Pointer: ?*c_void,
    Simple: LONG_PTR,
};


pub const PFULL_PTR_XLAT_TABLES = ?*FULL_PTR_XLAT_TABLES;
pub const system_handle_t = c_int;

pub const MIDL_INTERCEPTION_INFO = extern struct {
    Version: c_ulong,
    ProcString: PFORMAT_STRING,
    ProcFormatOffsetTable: ?*const c_ushort,
    ProcCount: c_ulong,
    TypeString: PFORMAT_STRING,
};

pub const PMIDL_INTERCEPTION_INFO = ?*MIDL_INTERCEPTION_INFO;
pub const MIDL_WINRT_TYPE_SERIALIZATION_INFO = extern struct {
    Version: c_ulong,
    TypeFormatString: PFORMAT_STRING,
    FormatStringSize: c_ushort,
    TypeOffset: c_ushort,
    StubDesc: PMIDL_STUB_DESC,
};

pub const PMIDL_WINRT_TYPE_SERIALIZATION_INFO = ?*MIDL_WINRT_TYPE_SERIALIZATION_INFO;
pub const STUB_PHASE = extern enum {
    STUB_UNMARSHAL,
    STUB_CALL_SERVER,
    STUB_MARSHAL,
    STUB_CALL_SERVER_NO_HRESULT,
};
pub const PROXY_PHASE = extern enum {
    PROXY_CALCSIZE,
    PROXY_GETBUFFER,
    PROXY_MARSHAL,
    PROXY_SENDRECEIVE,
    PROXY_UNMARSHAL,
};


pub const IUnknownVtbl = extern struct {
    QueryInterface: ?extern fn(?*IUnknown, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IUnknown) ULONG,
    Release: ?extern fn(?*IUnknown) ULONG,
};
pub const IUnknown = extern struct {
    lpVtbl: ?*IUnknownVtbl,
};
pub const RPCOLEDATAREP = ULONG;
pub const RPCOLEMESSAGE = extern struct {
    reserved1: ?*c_void,
    dataRepresentation: RPCOLEDATAREP,
    Buffer: ?*c_void,
    cbBuffer: ULONG,
    iMethod: ULONG,
    reserved2: [5](?*c_void),
    rpcFlags: ULONG,
};


pub const IRpcChannelBufferVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcChannelBuffer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcChannelBuffer) ULONG,
    Release: ?extern fn(?*IRpcChannelBuffer) ULONG,
    GetBuffer: ?extern fn(?*IRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*const IID) HRESULT,
    SendReceive: ?extern fn(?*IRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*ULONG) HRESULT,
    FreeBuffer: ?extern fn(?*IRpcChannelBuffer, ?*RPCOLEMESSAGE) HRESULT,
    GetDestCtx: ?extern fn(?*IRpcChannelBuffer, ?*DWORD, ?*(?*c_void)) HRESULT,
    IsConnected: ?extern fn(?*IRpcChannelBuffer) HRESULT,
};
pub const IRpcChannelBuffer = extern struct {
    lpVtbl: ?*IRpcChannelBufferVtbl,
};
pub const IRpcStubBufferVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcStubBuffer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcStubBuffer) ULONG,
    Release: ?extern fn(?*IRpcStubBuffer) ULONG,
    Connect: ?extern fn(?*IRpcStubBuffer, ?*IUnknown) HRESULT,
    Disconnect: ?extern fn(?*IRpcStubBuffer) void,
    Invoke: ?extern fn(?*IRpcStubBuffer, ?*RPCOLEMESSAGE, ?*IRpcChannelBuffer) HRESULT,
    IsIIDSupported: ?extern fn(?*IRpcStubBuffer, ?*const IID) ?*IRpcStubBuffer,
    CountRefs: ?extern fn(?*IRpcStubBuffer) ULONG,
    DebugServerQueryInterface: ?extern fn(?*IRpcStubBuffer, ?*(?*c_void)) HRESULT,
    DebugServerRelease: ?extern fn(?*IRpcStubBuffer, ?*c_void) void,
};
pub const IRpcStubBuffer = extern struct {
    lpVtbl: ?*IRpcStubBufferVtbl,
};
pub const RPC_SS_THREAD_HANDLE = ?*c_void;
pub const RPC_CLIENT_ALLOC = extern fn(usize) ?*c_void;
pub const RPC_CLIENT_FREE = extern fn(?*c_void) void;
pub const NDR_USER_MARSHAL_INFO_LEVEL1 = extern struct {
    Buffer: ?*c_void,
    BufferSize: c_ulong,
    pfnAllocate: ?extern fn(usize) ?*c_void,
    pfnFree: ?extern fn(?*c_void) void,
    pRpcChannelBuffer: ?*IRpcChannelBuffer,
    Reserved: [5]ULONG_PTR,
};

pub const NDR_USER_MARSHAL_INFO = extern struct {
    InformationLevel: c_ulong,
    u: extern union {
        Level1: NDR_USER_MARSHAL_INFO_LEVEL1,
    },
};

pub const OLECHAR = WCHAR;
pub const LPOLESTR = ?[*]OLECHAR;
pub const LPCOLESTR = ?[*]const OLECHAR;
pub const DOUBLE = f64;
pub const COAUTHIDENTITY = extern struct {
    User: ?*USHORT,
    UserLength: ULONG,
    Domain: ?*USHORT,
    DomainLength: ULONG,
    Password: ?*USHORT,
    PasswordLength: ULONG,
    Flags: ULONG,
};

pub const COAUTHINFO = extern struct {
    dwAuthnSvc: DWORD,
    dwAuthzSvc: DWORD,
    pwszServerPrincName: LPWSTR,
    dwAuthnLevel: DWORD,
    dwImpersonationLevel: DWORD,
    pAuthIdentityData: ?*COAUTHIDENTITY,
    dwCapabilities: DWORD,
};

pub const SCODE = LONG;
pub const PSCODE = ?*SCODE;
pub const MEMCTX = c_int;

pub const CLSCTX = c_int;

pub const MSHLFLAGS = c_int;

pub const MSHCTX = c_int;

pub const BYTE_BLOB = extern struct {
    clSize: ULONG,
    abData: [1]byte,
};

pub const UP_BYTE_BLOB = ?*BYTE_BLOB;
pub const WORD_BLOB = extern struct {
    clSize: ULONG,
    asData: [1]c_ushort,
};

pub const UP_WORD_BLOB = ?*WORD_BLOB;
pub const DWORD_BLOB = extern struct {
    clSize: ULONG,
    alData: [1]ULONG,
};

pub const UP_DWORD_BLOB = ?*DWORD_BLOB;
pub const FLAGGED_BYTE_BLOB = extern struct {
    fFlags: ULONG,
    clSize: ULONG,
    abData: [1]byte,
};

pub const UP_FLAGGED_BYTE_BLOB = ?*FLAGGED_BYTE_BLOB;
pub const FLAGGED_WORD_BLOB = extern struct {
    fFlags: ULONG,
    clSize: ULONG,
    asData: [1]c_ushort,
};

pub const UP_FLAGGED_WORD_BLOB = ?*FLAGGED_WORD_BLOB;
pub const BYTE_SIZEDARR = extern struct {
    clSize: ULONG,
    pData: ?*byte,
};

pub const SHORT_SIZEDARR = extern struct {
    clSize: ULONG,
    pData: ?*c_ushort,
};
pub const WORD_SIZEDARR = SHORT_SIZEDARR;
pub const LONG_SIZEDARR = extern struct {
    clSize: ULONG,
    pData: ?*ULONG,
};
pub const DWORD_SIZEDARR = LONG_SIZEDARR;
pub const HYPER_SIZEDARR = extern struct {
    clSize: ULONG,
    pData: ?*c_longlong,
};

pub const BLOB = extern struct {
    cbSize: ULONG,
    pBlobData: ?*BYTE,
};

pub const LPBLOB = ?*BLOB;
pub const RemHGLOBAL = extern struct {
    fNullHGlobal: LONG,
    cbData: ULONG,
    data: [1]byte,
};

pub const RemHMETAFILEPICT = extern struct {
    mm: LONG,
    xExt: LONG,
    yExt: LONG,
    cbData: ULONG,
    data: [1]byte,
};

pub const RemHENHMETAFILE = extern struct {
    cbData: ULONG,
    data: [1]byte,
};

pub const RemHBITMAP = extern struct {
    cbData: ULONG,
    data: [1]byte,
};

pub const RemHPALETTE = extern struct {
    cbData: ULONG,
    data: [1]byte,
};

pub const RemBRUSH = extern struct {
    cbData: ULONG,
    data: [1]byte,
};
pub const RemHBRUSH = RemBRUSH;
pub const DVASPECT = c_int;

pub const STGC = c_int;

pub const STGMOVE = c_int;

pub const STATFLAG = c_int;

pub const HCONTEXT = ?*c_void;
pub const _MIDL_IWinTypes_0001 = extern union {
    dwValue: DWORD,
    pwszName: ?*wchar_t,
};
pub const userCLIPFORMAT = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0001,
};

pub const wireCLIPFORMAT = ?*userCLIPFORMAT;
pub const CLIPFORMAT = WORD;
pub const _MIDL_IWinTypes_0002 = extern union {
    hInproc: LONG,
    hRemote: ?*DWORD_BLOB,
};
pub const GDI_NONREMOTE = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0002,
};

pub const _MIDL_IWinTypes_0003 = extern union {
    hInproc: LONG,
    hRemote: ?*FLAGGED_BYTE_BLOB,
    hInproc64: c_longlong,
};
pub const userHGLOBAL = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0003,
};

pub const wireHGLOBAL = ?*userHGLOBAL;
pub const _MIDL_IWinTypes_0004 = extern union {
    hInproc: LONG,
    hRemote: ?*BYTE_BLOB,
    hInproc64: c_longlong,
};
pub const userHMETAFILE = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0004,
};

pub const remoteMETAFILEPICT = extern struct {
    mm: LONG,
    xExt: LONG,
    yExt: LONG,
    hMF: ?*userHMETAFILE,
};

pub const _MIDL_IWinTypes_0005 = extern union {
    hInproc: LONG,
    hRemote: ?*remoteMETAFILEPICT,
    hInproc64: c_longlong,
};
pub const userHMETAFILEPICT = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0005,
};

pub const _MIDL_IWinTypes_0006 = extern union {
    hInproc: LONG,
    hRemote: ?*BYTE_BLOB,
    hInproc64: c_longlong,
};
pub const userHENHMETAFILE = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0006,
};

pub const userBITMAP = extern struct {
    bmType: LONG,
    bmWidth: LONG,
    bmHeight: LONG,
    bmWidthBytes: LONG,
    bmPlanes: WORD,
    bmBitsPixel: WORD,
    cbSize: ULONG,
    pBuffer: [1]byte,
};

pub const _MIDL_IWinTypes_0007 = extern union {
    hInproc: LONG,
    hRemote: ?*userBITMAP,
    hInproc64: c_longlong,
};
pub const userHBITMAP = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0007,
};

pub const _MIDL_IWinTypes_0008 = extern union {
    hInproc: LONG,
    hRemote: ?*LOGPALETTE,
    hInproc64: c_longlong,
};
pub const userHPALETTE = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0008,
};

pub const _MIDL_IWinTypes_0009 = extern union {
    hInproc: LONG,
    hRemote: LONG,
};
pub const RemotableHandle = extern struct {
    fContext: LONG,
    u: _MIDL_IWinTypes_0009,
};

pub const wireHWND = ?*RemotableHandle;
pub const wireHMENU = ?*RemotableHandle;
pub const wireHACCEL = ?*RemotableHandle;
pub const wireHBRUSH = ?*RemotableHandle;
pub const wireHFONT = ?*RemotableHandle;
pub const wireHDC = ?*RemotableHandle;
pub const wireHICON = ?*RemotableHandle;
pub const wireHRGN = ?*RemotableHandle;
pub const wireHMONITOR = ?*RemotableHandle;
pub const wireHBITMAP = ?*userHBITMAP;
pub const wireHPALETTE = ?*userHPALETTE;
pub const wireHENHMETAFILE = ?*userHENHMETAFILE;
pub const wireHMETAFILE = ?*userHMETAFILE;
pub const wireHMETAFILEPICT = ?*userHMETAFILEPICT;
pub const HMETAFILEPICT = ?*c_void;
pub const DATE = f64;
pub const CY = extern union {
    s: extern struct {
        Lo: ULONG,
        Hi: LONG,
    },
    int64: LONGLONG,
};

pub const LPCY = ?*CY;
pub const DEC = extern struct {
    wReserved: USHORT,
    u: extern union {
        s: extern struct {
            scale: BYTE,
            sign: BYTE,
        },
        signscale: USHORT,
    },
    Hi32: ULONG,
    u2: extern union {
        s: extern struct {
            Lo32: ULONG,
            Mid32: ULONG,
        },
        Lo64: ULONGLONG,
    },
};
pub const DECIMAL = DEC;
pub const LPDECIMAL = ?*DECIMAL;
pub const wireBSTR = ?[*]FLAGGED_WORD_BLOB;
pub const BSTR = ?[*]OLECHAR;
pub const LPBSTR = ?[*]BSTR;
pub const VARIANT_BOOL = c_short;
pub const BSTRBLOB = extern struct {
    cbSize: ULONG,
    pData: ?*BYTE,
};

pub const LPBSTRBLOB = ?*BSTRBLOB;
pub const CLIPDATA = extern struct {
    cbSize: ULONG,
    ulClipFmt: LONG,
    pClipData: ?*BYTE,
};

pub const VARTYPE = c_ushort;
pub const VARENUM = c_int;
pub const PROPID = ULONG;
pub const propertykey = extern struct {
    fmtid: GUID,
    pid: DWORD,
};
pub const PROPERTYKEY = propertykey;
pub const CSPLATFORM = extern struct {
    dwPlatformId: DWORD,
    dwVersionHi: DWORD,
    dwVersionLo: DWORD,
    dwProcessorArch: DWORD,
};

pub const QUERYCONTEXT = extern struct {
    dwContext: DWORD,
    Platform: CSPLATFORM,
    Locale: LCID,
    dwVersionHi: DWORD,
    dwVersionLo: DWORD,
};

pub const TYSPEC = c_int;

pub const _MIDL___MIDL_itf_wtypes_0000_0001_0005 = extern union {
    clsid: CLSID,
    pFileExt: LPOLESTR,
    pMimeType: LPOLESTR,
    pProgId: LPOLESTR,
    pFileName: LPOLESTR,
    ByName: extern struct {
        pPackageName: LPOLESTR,
        PolicyId: GUID,
    },
    ByObjectId: extern struct {
        ObjectId: GUID,
        PolicyId: GUID,
    },
};
pub const _MIDL___MIDL_itf_wtypes_0000_0001_0001 = extern struct {
    tyspec: DWORD,
    ged_union: _MIDL___MIDL_itf_wtypes_0000_0001_0005,
};
pub const uCLSSPEC = _MIDL___MIDL_itf_wtypes_0000_0001_0001;
pub const STORAGE_HOTPLUG_INFO = extern struct {
    Size: DWORD,
    MediaRemovable: BOOLEAN,
    MediaHotplug: BOOLEAN,
    DeviceHotplug: BOOLEAN,
    WriteCacheEnableOverride: BOOLEAN,
};

pub const PSTORAGE_HOTPLUG_INFO = ?*STORAGE_HOTPLUG_INFO;
pub const STORAGE_DEVICE_NUMBER = extern struct {
    DeviceType: DWORD,
    DeviceNumber: DWORD,
    PartitionNumber: DWORD,
};

pub const PSTORAGE_DEVICE_NUMBER = ?*STORAGE_DEVICE_NUMBER;
pub const STORAGE_DEVICE_NUMBERS = extern struct {
    NumberOfDevices: DWORD,
    Devices: [1]STORAGE_DEVICE_NUMBER,
};

pub const PSTORAGE_DEVICE_NUMBERS = ?*STORAGE_DEVICE_NUMBERS;
pub const STORAGE_DEVICE_NUMBER_EX = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    DeviceType: DWORD,
    DeviceNumber: DWORD,
    DeviceGuid: GUID,
    PartitionNumber: DWORD,
};

pub const PSTORAGE_DEVICE_NUMBER_EX = ?*STORAGE_DEVICE_NUMBER_EX;
pub const STORAGE_BUS_RESET_REQUEST = extern struct {
    PathId: BYTE,
};

pub const PSTORAGE_BUS_RESET_REQUEST = ?*STORAGE_BUS_RESET_REQUEST;
pub const STORAGE_BREAK_RESERVATION_REQUEST = extern struct {
    Length: DWORD,
    _unused: BYTE,
    PathId: BYTE,
    TargetId: BYTE,
    Lun: BYTE,
};

pub const PSTORAGE_BREAK_RESERVATION_REQUEST = ?*STORAGE_BREAK_RESERVATION_REQUEST;
pub const PREVENT_MEDIA_REMOVAL = extern struct {
    PreventMediaRemoval: BOOLEAN,
};

pub const PPREVENT_MEDIA_REMOVAL = ?*PREVENT_MEDIA_REMOVAL;
pub const CLASS_MEDIA_CHANGE_CONTEXT = extern struct {
    MediaChangeCount: DWORD,
    NewState: DWORD,
};

pub const PCLASS_MEDIA_CHANGE_CONTEXT = ?*CLASS_MEDIA_CHANGE_CONTEXT;
pub const TAPE_STATISTICS = extern struct {
    Version: DWORD,
    Flags: DWORD,
    RecoveredWrites: LARGE_INTEGER,
    UnrecoveredWrites: LARGE_INTEGER,
    RecoveredReads: LARGE_INTEGER,
    UnrecoveredReads: LARGE_INTEGER,
    CompressionRatioReads: BYTE,
    CompressionRatioWrites: BYTE,
};

pub const PTAPE_STATISTICS = ?*TAPE_STATISTICS;
pub const TAPE_GET_STATISTICS = extern struct {
    Operation: DWORD,
};

pub const PTAPE_GET_STATISTICS = ?*TAPE_GET_STATISTICS;
pub const STORAGE_MEDIA_TYPE = c_int;

pub const PSTORAGE_MEDIA_TYPE = ?*STORAGE_MEDIA_TYPE;
pub const STORAGE_BUS_TYPE = c_int;

pub const PSTORAGE_BUS_TYPE = ?*STORAGE_BUS_TYPE;
pub const DEVICE_MEDIA_INFO = extern struct {
    DeviceSpecific: extern union {
        DiskInfo: extern struct {
            Cylinders: LARGE_INTEGER,
            MediaType: STORAGE_MEDIA_TYPE,
            TracksPerCylinder: DWORD,
            SectorsPerTrack: DWORD,
            BytesPerSector: DWORD,
            NumberMediaSides: DWORD,
            MediaCharacteristics: DWORD,
        },
        RemovableDiskInfo: extern struct {
            Cylinders: LARGE_INTEGER,
            MediaType: STORAGE_MEDIA_TYPE,
            TracksPerCylinder: DWORD,
            SectorsPerTrack: DWORD,
            BytesPerSector: DWORD,
            NumberMediaSides: DWORD,
            MediaCharacteristics: DWORD,
        },
        TapeInfo: extern struct {
            MediaType: STORAGE_MEDIA_TYPE,
            MediaCharacteristics: DWORD,
            CurrentBlockSize: DWORD,
            BusType: STORAGE_BUS_TYPE,
            BusSpecificData: extern union {
                ScsiInformation: extern struct {
                    MediumType: BYTE,
                    DensityCode: BYTE,
                },
            },
        },
    },
};

pub const PDEVICE_MEDIA_INFO = ?*DEVICE_MEDIA_INFO;
pub const GET_MEDIA_TYPES = extern struct {
    DeviceType: DWORD,
    MediaInfoCount: DWORD,
    MediaInfo: [1]DEVICE_MEDIA_INFO,
};

pub const PGET_MEDIA_TYPES = ?*GET_MEDIA_TYPES;
pub const STORAGE_PREDICT_FAILURE = extern struct {
    PredictFailure: DWORD,
    VendorSpecific: [512]BYTE,
};

pub const PSTORAGE_PREDICT_FAILURE = ?*STORAGE_PREDICT_FAILURE;
pub const STORAGE_FAILURE_PREDICTION_CONFIG = extern struct {
    Version: DWORD,
    Size: DWORD,
    Set: BOOLEAN,
    Enabled: BOOLEAN,
    Reserved: WORD,
};

pub const PSTORAGE_FAILURE_PREDICTION_CONFIG = ?*STORAGE_FAILURE_PREDICTION_CONFIG;
pub const STORAGE_QUERY_TYPE = c_int;

pub const PSTORAGE_QUERY_TYPE = ?*STORAGE_QUERY_TYPE;
pub const STORAGE_PROPERTY_ID = c_int;

pub const PSTORAGE_PROPERTY_ID = ?*STORAGE_PROPERTY_ID;
pub const STORAGE_PROPERTY_QUERY = extern struct {
    PropertyId: STORAGE_PROPERTY_ID,
    QueryType: STORAGE_QUERY_TYPE,
    AdditionalParameters: [1]BYTE,
};

pub const PSTORAGE_PROPERTY_QUERY = ?*STORAGE_PROPERTY_QUERY;
pub const STORAGE_DESCRIPTOR_HEADER = extern struct {
    Version: DWORD,
    Size: DWORD,
};

pub const PSTORAGE_DESCRIPTOR_HEADER = ?*STORAGE_DESCRIPTOR_HEADER;
pub const STORAGE_DEVICE_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    DeviceType: BYTE,
    DeviceTypeModifier: BYTE,
    RemovableMedia: BOOLEAN,
    CommandQueueing: BOOLEAN,
    VendorIdOffset: DWORD,
    ProductIdOffset: DWORD,
    ProductRevisionOffset: DWORD,
    SerialNumberOffset: DWORD,
    BusType: STORAGE_BUS_TYPE,
    RawPropertiesLength: DWORD,
    RawDeviceProperties: [1]BYTE,
};

pub const PSTORAGE_DEVICE_DESCRIPTOR = ?*STORAGE_DEVICE_DESCRIPTOR;
pub const STORAGE_ADAPTER_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    MaximumTransferLength: DWORD,
    MaximumPhysicalPages: DWORD,
    AlignmentMask: DWORD,
    AdapterUsesPio: BOOLEAN,
    AdapterScansDown: BOOLEAN,
    CommandQueueing: BOOLEAN,
    AcceleratedTransfer: BOOLEAN,
    BusType: BYTE,
    BusMajorVersion: WORD,
    BusMinorVersion: WORD,
    SrbType: BYTE,
    AddressType: BYTE,
};

pub const PSTORAGE_ADAPTER_DESCRIPTOR = ?*STORAGE_ADAPTER_DESCRIPTOR;
pub const STORAGE_ACCESS_ALIGNMENT_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    BytesPerCacheLine: DWORD,
    BytesOffsetForCacheAlignment: DWORD,
    BytesPerLogicalSector: DWORD,
    BytesPerPhysicalSector: DWORD,
    BytesOffsetForSectorAlignment: DWORD,
};

pub const PSTORAGE_ACCESS_ALIGNMENT_DESCRIPTOR = ?*STORAGE_ACCESS_ALIGNMENT_DESCRIPTOR;
pub const STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    MediumProductType: DWORD,
};

pub const PSTORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR = ?*STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR;
pub const STORAGE_PORT_CODE_SET = c_int;

pub const PSTORAGE_PORT_CODE_SET = ?*STORAGE_PORT_CODE_SET;
pub const STORAGE_MINIPORT_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    Portdriver: STORAGE_PORT_CODE_SET,
    LUNResetSupported: BOOLEAN,
    TargetResetSupported: BOOLEAN,
    IoTimeoutValue: WORD,
    ExtraIoInfoSupported: BOOLEAN,
    Reserved0: [3]BYTE,
    Reserved1: DWORD,
};

pub const PSTORAGE_MINIPORT_DESCRIPTOR = ?*STORAGE_MINIPORT_DESCRIPTOR;
pub const STORAGE_IDENTIFIER_CODE_SET = c_int;

pub const PSTORAGE_IDENTIFIER_CODE_SET = ?*STORAGE_IDENTIFIER_CODE_SET;
pub const STORAGE_IDENTIFIER_TYPE = c_int;

pub const PSTORAGE_IDENTIFIER_TYPE = ?*STORAGE_IDENTIFIER_TYPE;
pub const STORAGE_ID_NAA_FORMAT = c_int;

pub const PSTORAGE_ID_NAA_FORMAT = ?*STORAGE_ID_NAA_FORMAT;
pub const STORAGE_ASSOCIATION_TYPE = c_int;

pub const PSTORAGE_ASSOCIATION_TYPE = ?*STORAGE_ASSOCIATION_TYPE;
pub const STORAGE_IDENTIFIER = extern struct {
    CodeSet: STORAGE_IDENTIFIER_CODE_SET,
    Type: STORAGE_IDENTIFIER_TYPE,
    IdentifierSize: WORD,
    NextOffset: WORD,
    Association: STORAGE_ASSOCIATION_TYPE,
    Identifier: [1]BYTE,
};

pub const PSTORAGE_IDENTIFIER = ?*STORAGE_IDENTIFIER;
pub const STORAGE_DEVICE_ID_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    NumberOfIdentifiers: DWORD,
    Identifiers: [1]BYTE,
};

pub const PSTORAGE_DEVICE_ID_DESCRIPTOR = ?*STORAGE_DEVICE_ID_DESCRIPTOR;
pub const DEVICE_SEEK_PENALTY_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    IncursSeekPenalty: BOOLEAN,
};

pub const PDEVICE_SEEK_PENALTY_DESCRIPTOR = ?*DEVICE_SEEK_PENALTY_DESCRIPTOR;
pub const DEVICE_WRITE_AGGREGATION_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    BenefitsFromWriteAggregation: BOOLEAN,
};

pub const PDEVICE_WRITE_AGGREGATION_DESCRIPTOR = ?*DEVICE_WRITE_AGGREGATION_DESCRIPTOR;
pub const DEVICE_TRIM_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    TrimEnabled: BOOLEAN,
};

pub const PDEVICE_TRIM_DESCRIPTOR = ?*DEVICE_TRIM_DESCRIPTOR;
pub const DEVICE_LB_PROVISIONING_DESCRIPTOR = @OpaqueType();

pub const PDEVICE_LB_PROVISIONING_DESCRIPTOR = ?*DEVICE_LB_PROVISIONING_DESCRIPTOR;
pub const STORAGE_LB_PROVISIONING_MAP_RESOURCES = @OpaqueType();

pub const PSTORAGE_LB_PROVISIONING_MAP_RESOURCES = ?*STORAGE_LB_PROVISIONING_MAP_RESOURCES;
pub const DEVICE_POWER_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    DeviceAttentionSupported: BOOLEAN,
    AsynchronousNotificationSupported: BOOLEAN,
    IdlePowerManagementEnabled: BOOLEAN,
    D3ColdEnabled: BOOLEAN,
    D3ColdSupported: BOOLEAN,
    NoVerifyDuringIdlePower: BOOLEAN,
    Reserved: [2]BYTE,
    IdleTimeoutInMS: DWORD,
};

pub const PDEVICE_POWER_DESCRIPTOR = ?*DEVICE_POWER_DESCRIPTOR;
pub const DEVICE_COPY_OFFLOAD_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    MaximumTokenLifetime: DWORD,
    DefaultTokenLifetime: DWORD,
    MaximumTransferSize: DWORDLONG,
    OptimalTransferCount: DWORDLONG,
    MaximumDataDescriptors: DWORD,
    MaximumTransferLengthPerDescriptor: DWORD,
    OptimalTransferLengthPerDescriptor: DWORD,
    OptimalTransferLengthGranularity: WORD,
    Reserved: [2]BYTE,
};

pub const PDEVICE_COPY_OFFLOAD_DESCRIPTOR = ?*DEVICE_COPY_OFFLOAD_DESCRIPTOR;
pub const STORAGE_DEVICE_RESILIENCY_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    NameOffset: DWORD,
    NumberOfLogicalCopies: DWORD,
    NumberOfPhysicalCopies: DWORD,
    PhysicalDiskRedundancy: DWORD,
    NumberOfColumns: DWORD,
    Interleave: DWORD,
};

pub const PSTORAGE_DEVICE_RESILIENCY_DESCRIPTOR = ?*STORAGE_DEVICE_RESILIENCY_DESCRIPTOR;
pub const STORAGE_RPMB_FRAME_TYPE = c_int;

pub const PSTORAGE_RPMB_FRAME_TYPE = ?*STORAGE_RPMB_FRAME_TYPE;
pub const STORAGE_RPMB_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    SizeInBytes: DWORD,
    MaxReliableWriteSizeInBytes: DWORD,
    FrameFormat: STORAGE_RPMB_FRAME_TYPE,
};

pub const PSTORAGE_RPMB_DESCRIPTOR = ?*STORAGE_RPMB_DESCRIPTOR;
pub const STORAGE_CRYPTO_ALGORITHM_ID = c_int;

pub const PSTORAGE_CRYPTO_ALGORITHM_ID = ?*STORAGE_CRYPTO_ALGORITHM_ID;
pub const STORAGE_CRYPTO_KEY_SIZE = c_int;

pub const PSTORAGE_CRYPTO_KEY_SIZE = ?*STORAGE_CRYPTO_KEY_SIZE;
pub const STORAGE_CRYPTO_CAPABILITY = extern struct {
    Version: DWORD,
    Size: DWORD,
    CryptoCapabilityIndex: DWORD,
    AlgorithmId: STORAGE_CRYPTO_ALGORITHM_ID,
    KeySize: STORAGE_CRYPTO_KEY_SIZE,
    DataUnitSizeBitmask: DWORD,
};

pub const PSTORAGE_CRYPTO_CAPABILITY = ?*STORAGE_CRYPTO_CAPABILITY;
pub const STORAGE_CRYPTO_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    NumKeysSupported: DWORD,
    NumCryptoCapabilities: DWORD,
    CryptoCapabilities: [1]STORAGE_CRYPTO_CAPABILITY,
};

pub const PSTORAGE_CRYPTO_DESCRIPTOR = ?*STORAGE_CRYPTO_DESCRIPTOR;
pub const STORAGE_TIER_MEDIA_TYPE = c_int;

pub const PSTORAGE_TIER_MEDIA_TYPE = ?*STORAGE_TIER_MEDIA_TYPE;
pub const STORAGE_TIER_CLASS = c_int;

pub const PSTORAGE_TIER_CLASS = ?*STORAGE_TIER_CLASS;
pub const STORAGE_TIER = extern struct {
    Id: GUID,
    Name: [256]WCHAR,
    Description: [256]WCHAR,
    Flags: DWORDLONG,
    ProvisionedCapacity: DWORDLONG,
    MediaType: STORAGE_TIER_MEDIA_TYPE,
    Class: STORAGE_TIER_CLASS,
};

pub const PSTORAGE_TIER = ?*STORAGE_TIER;
pub const STORAGE_DEVICE_TIERING_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    TotalNumberOfTiers: DWORD,
    NumberOfTiersReturned: DWORD,
    Tiers: [1]STORAGE_TIER,
};

pub const PSTORAGE_DEVICE_TIERING_DESCRIPTOR = ?*STORAGE_DEVICE_TIERING_DESCRIPTOR;
pub const STORAGE_DEVICE_FAULT_DOMAIN_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    NumberOfFaultDomains: DWORD,
    FaultDomainIds: [1]GUID,
};

pub const PSTORAGE_DEVICE_FAULT_DOMAIN_DESCRIPTOR = ?*STORAGE_DEVICE_FAULT_DOMAIN_DESCRIPTOR;
pub const STORAGE_PROTOCOL_TYPE = c_int;

pub const PSTORAGE_PROTOCOL_TYPE = ?*STORAGE_PROTOCOL_TYPE;
pub const STORAGE_PROTOCOL_NVME_DATA_TYPE = c_int;

pub const PSTORAGE_PROTOCOL_NVME_DATA_TYPE = ?*STORAGE_PROTOCOL_NVME_DATA_TYPE;
pub const STORAGE_PROTOCOL_ATA_DATA_TYPE = c_int;

pub const PSTORAGE_PROTOCOL_ATA_DATA_TYPE = ?*STORAGE_PROTOCOL_ATA_DATA_TYPE;
pub const STORAGE_PROTOCOL_UFS_DATA_TYPE = c_int;

pub const PSTORAGE_PROTOCOL_UFS_DATA_TYPE = ?*STORAGE_PROTOCOL_UFS_DATA_TYPE;
pub const STORAGE_PROTOCOL_SPECIFIC_DATA = extern struct {
    ProtocolType: STORAGE_PROTOCOL_TYPE,
    DataType: DWORD,
    ProtocolDataRequestValue: DWORD,
    ProtocolDataRequestSubValue: DWORD,
    ProtocolDataOffset: DWORD,
    ProtocolDataLength: DWORD,
    FixedProtocolReturnData: DWORD,
    Reserved: [3]DWORD,
};

pub const PSTORAGE_PROTOCOL_SPECIFIC_DATA = ?*STORAGE_PROTOCOL_SPECIFIC_DATA;
pub const STORAGE_PROTOCOL_DATA_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    ProtocolSpecificData: STORAGE_PROTOCOL_SPECIFIC_DATA,
};

pub const PSTORAGE_PROTOCOL_DATA_DESCRIPTOR = ?*STORAGE_PROTOCOL_DATA_DESCRIPTOR;
pub const STORAGE_TEMPERATURE_INFO = extern struct {
    Index: WORD,
    Temperature: SHORT,
    OverThreshold: SHORT,
    UnderThreshold: SHORT,
    OverThresholdChangable: BOOLEAN,
    UnderThresholdChangable: BOOLEAN,
    EventGenerated: BOOLEAN,
    Reserved0: BYTE,
    Reserved1: DWORD,
};

pub const PSTORAGE_TEMPERATURE_INFO = ?*STORAGE_TEMPERATURE_INFO;
pub const STORAGE_TEMPERATURE_DATA_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    CriticalTemperature: SHORT,
    WarningTemperature: SHORT,
    InfoCount: WORD,
    Reserved0: [2]BYTE,
    Reserved1: [2]DWORD,
    TemperatureInfo: [1]STORAGE_TEMPERATURE_INFO,
};

pub const PSTORAGE_TEMPERATURE_DATA_DESCRIPTOR = ?*STORAGE_TEMPERATURE_DATA_DESCRIPTOR;
pub const STORAGE_TEMPERATURE_THRESHOLD = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: WORD,
    Index: WORD,
    Threshold: SHORT,
    OverThreshold: BOOLEAN,
    Reserved: BYTE,
};

pub const PSTORAGE_TEMPERATURE_THRESHOLD = ?*STORAGE_TEMPERATURE_THRESHOLD;
pub const STORAGE_DEVICE_FORM_FACTOR = c_int;

pub const PSTORAGE_DEVICE_FORM_FACTOR = ?*STORAGE_DEVICE_FORM_FACTOR;
pub const STORAGE_COMPONENT_HEALTH_STATUS = c_int;

pub const PSTORAGE_COMPONENT_HEALTH_STATUS = ?*STORAGE_COMPONENT_HEALTH_STATUS;
pub const STORAGE_SPEC_VERSION = extern union {
    s: extern struct {
        MinorVersion: extern union {
            s: extern struct {
                SubMinor: BYTE,
                Minor: BYTE,
            },
            AsUshort: WORD,
        },
        MajorVersion: WORD,
    },
    AsUlong: DWORD,
};

pub const PSTORAGE_SPEC_VERSION = ?*STORAGE_SPEC_VERSION;
pub const STORAGE_PHYSICAL_DEVICE_DATA = extern struct {
    DeviceId: DWORD,
    Role: DWORD,
    HealthStatus: STORAGE_COMPONENT_HEALTH_STATUS,
    CommandProtocol: STORAGE_PROTOCOL_TYPE,
    SpecVersion: STORAGE_SPEC_VERSION,
    FormFactor: STORAGE_DEVICE_FORM_FACTOR,
    Vendor: [8]BYTE,
    Model: [40]BYTE,
    FirmwareRevision: [16]BYTE,
    Capacity: DWORDLONG,
    PhysicalLocation: [32]BYTE,
    Reserved: [2]DWORD,
};

pub const PSTORAGE_PHYSICAL_DEVICE_DATA = ?*STORAGE_PHYSICAL_DEVICE_DATA;
pub const STORAGE_PHYSICAL_ADAPTER_DATA = extern struct {
    AdapterId: DWORD,
    HealthStatus: STORAGE_COMPONENT_HEALTH_STATUS,
    CommandProtocol: STORAGE_PROTOCOL_TYPE,
    SpecVersion: STORAGE_SPEC_VERSION,
    Vendor: [8]BYTE,
    Model: [40]BYTE,
    FirmwareRevision: [16]BYTE,
    PhysicalLocation: [32]BYTE,
    ExpanderConnected: BOOLEAN,
    Reserved0: [3]BYTE,
    Reserved1: [3]DWORD,
};

pub const PSTORAGE_PHYSICAL_ADAPTER_DATA = ?*STORAGE_PHYSICAL_ADAPTER_DATA;
pub const STORAGE_PHYSICAL_NODE_DATA = extern struct {
    NodeId: DWORD,
    AdapterCount: DWORD,
    AdapterDataLength: DWORD,
    AdapterDataOffset: DWORD,
    DeviceCount: DWORD,
    DeviceDataLength: DWORD,
    DeviceDataOffset: DWORD,
    Reserved: [3]DWORD,
};

pub const PSTORAGE_PHYSICAL_NODE_DATA = ?*STORAGE_PHYSICAL_NODE_DATA;
pub const STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    NodeCount: DWORD,
    Reserved: DWORD,
    Node: [1]STORAGE_PHYSICAL_NODE_DATA,
};

pub const PSTORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR = ?*STORAGE_PHYSICAL_TOPOLOGY_DESCRIPTOR;
pub const STORAGE_DEVICE_IO_CAPABILITY_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    LunMaxIoCount: DWORD,
    AdapterMaxIoCount: DWORD,
};

pub const PSTORAGE_DEVICE_IO_CAPABILITY_DESCRIPTOR = ?*STORAGE_DEVICE_IO_CAPABILITY_DESCRIPTOR;
pub const STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    Attributes: DWORD64,
};

pub const PSTORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR = ?*STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR;
pub const STORAGE_DISK_HEALTH_STATUS = c_int;

pub const PSTORAGE_DISK_HEALTH_STATUS = ?*STORAGE_DISK_HEALTH_STATUS;
pub const STORAGE_DISK_OPERATIONAL_STATUS = c_int;

pub const PSTORAGE_DISK_OPERATIONAL_STATUS = ?*STORAGE_DISK_OPERATIONAL_STATUS;
pub const STORAGE_OPERATIONAL_STATUS_REASON = c_int;

pub const PSTORAGE_OPERATIONAL_STATUS_REASON = ?*STORAGE_OPERATIONAL_STATUS_REASON;
pub const STORAGE_OPERATIONAL_REASON = extern struct {
    Version: DWORD,
    Size: DWORD,
    Reason: STORAGE_OPERATIONAL_STATUS_REASON,
    RawBytes: extern union {
        ScsiSenseKey: extern struct {
            SenseKey: BYTE,
            ASC: BYTE,
            ASCQ: BYTE,
            Reserved: BYTE,
        },
        NVDIMM_N: extern struct {
            CriticalHealth: BYTE,
            ModuleHealth: [2]BYTE,
            ErrorThresholdStatus: BYTE,
        },
        AsUlong: DWORD,
    },
};

pub const PSTORAGE_OPERATIONAL_REASON = ?*STORAGE_OPERATIONAL_REASON;
pub const STORAGE_DEVICE_MANAGEMENT_STATUS = extern struct {
    Version: DWORD,
    Size: DWORD,
    Health: STORAGE_DISK_HEALTH_STATUS,
    NumberOfOperationalStatus: DWORD,
    NumberOfAdditionalReasons: DWORD,
    OperationalStatus: [16]STORAGE_DISK_OPERATIONAL_STATUS,
    AdditionalReasons: [1]STORAGE_OPERATIONAL_REASON,
};

pub const PSTORAGE_DEVICE_MANAGEMENT_STATUS = ?*STORAGE_DEVICE_MANAGEMENT_STATUS;
pub const STORAGE_ADAPTER_SERIAL_NUMBER = extern struct {
    Version: DWORD,
    Size: DWORD,
    SerialNumber: [128]WCHAR,
};

pub const PSTORAGE_ADAPTER_SERIAL_NUMBER = ?*STORAGE_ADAPTER_SERIAL_NUMBER;
pub const STORAGE_ZONED_DEVICE_TYPES = c_int;

pub const PSTORAGE_ZONED_DEVICE_TYPES = ?*STORAGE_ZONED_DEVICE_TYPES;
pub const STORAGE_ZONE_TYPES = c_int;

pub const PSTORAGE_ZONE_TYPES = ?*STORAGE_ZONE_TYPES;
pub const STORAGE_ZONE_GROUP = extern struct {
    ZoneCount: DWORD,
    ZoneType: STORAGE_ZONE_TYPES,
    ZoneSize: DWORDLONG,
};

pub const PSTORAGE_ZONE_GROUP = ?*STORAGE_ZONE_GROUP;
pub const STORAGE_ZONED_DEVICE_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    DeviceType: STORAGE_ZONED_DEVICE_TYPES,
    ZoneCount: DWORD,
    ZoneAttributes: extern union {
        SequentialRequiredZone: extern struct {
            MaxOpenZoneCount: DWORD,
            UnrestrictedRead: BOOLEAN,
            Reserved: [3]BYTE,
        },
        SequentialPreferredZone: extern struct {
            OptimalOpenZoneCount: DWORD,
            Reserved: DWORD,
        },
    },
    ZoneGroupCount: DWORD,
    ZoneGroup: [1]STORAGE_ZONE_GROUP,
};

pub const PSTORAGE_ZONED_DEVICE_DESCRIPTOR = ?*STORAGE_ZONED_DEVICE_DESCRIPTOR;
pub const DEVICE_LOCATION = extern struct {
    Socket: DWORD,
    Slot: DWORD,
    Adapter: DWORD,
    Port: DWORD,
    u: extern union {
        s: extern struct {
            Channel: DWORD,
            Device: DWORD,
        },
        s2: extern struct {
            Target: DWORD,
            Lun: DWORD,
        },
    },
};

pub const PDEVICE_LOCATION = ?*DEVICE_LOCATION;
pub const STORAGE_DEVICE_LOCATION_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    Location: DEVICE_LOCATION,
    StringOffset: DWORD,
};

pub const PSTORAGE_DEVICE_LOCATION_DESCRIPTOR = ?*STORAGE_DEVICE_LOCATION_DESCRIPTOR;
pub const STORAGE_DEVICE_NUMA_PROPERTY = extern struct {
    Version: DWORD,
    Size: DWORD,
    NumaNode: DWORD,
};

pub const PSTORAGE_DEVICE_NUMA_PROPERTY = ?*STORAGE_DEVICE_NUMA_PROPERTY;
pub const STORAGE_DEVICE_UNSAFE_SHUTDOWN_COUNT = extern struct {
    Version: DWORD,
    Size: DWORD,
    UnsafeShutdownCount: DWORD,
};

pub const PSTORAGE_DEVICE_UNSAFE_SHUTDOWN_COUNT = ?*STORAGE_DEVICE_UNSAFE_SHUTDOWN_COUNT;
pub const DEVICE_DATA_MANAGEMENT_SET_ACTION = DWORD;
pub const DEVICE_DATA_SET_RANGE = extern struct {
    StartingOffset: LONGLONG,
    LengthInBytes: DWORDLONG,
};

pub const PDEVICE_DATA_SET_RANGE = ?*DEVICE_DATA_SET_RANGE;
pub const DEVICE_MANAGE_DATA_SET_ATTRIBUTES = extern struct {
    Size: DWORD,
    Action: DEVICE_DATA_MANAGEMENT_SET_ACTION,
    Flags: DWORD,
    ParameterBlockOffset: DWORD,
    ParameterBlockLength: DWORD,
    DataSetRangesOffset: DWORD,
    DataSetRangesLength: DWORD,
};

pub const PDEVICE_MANAGE_DATA_SET_ATTRIBUTES = ?*DEVICE_MANAGE_DATA_SET_ATTRIBUTES;
pub const DEVICE_DSM_NOTIFICATION_PARAMETERS = extern struct {
    Size: DWORD,
    Flags: DWORD,
    NumFileTypeIDs: DWORD,
    FileTypeID: [1]GUID,
};

pub const PDEVICE_DSM_NOTIFICATION_PARAMETERS = ?*DEVICE_DSM_NOTIFICATION_PARAMETERS;
pub const DEVICE_DSM_NVCACHE_CHANGE_PRIORITY_PARAMETERS = extern struct {
    Size: DWORD,
    TargetPriority: BYTE,
    Reserved: [3]BYTE,
};

pub const PDEVICE_DSM_NVCACHE_CHANGE_PRIORITY_PARAMETERS = ?*DEVICE_DSM_NVCACHE_CHANGE_PRIORITY_PARAMETERS;
pub const STORAGE_OFFLOAD_TOKEN = extern struct {
    TokenType: [4]BYTE,
    Reserved: [2]BYTE,
    TokenIdLength: [2]BYTE,
    u: extern union {
        StorageOffloadZeroDataToken: extern struct {
            Reserved2: [504]BYTE,
        },
        Token: [504]BYTE,
    },
};

pub const PSTORAGE_OFFLOAD_TOKEN = ?*STORAGE_OFFLOAD_TOKEN;
pub const DEVICE_DSM_OFFLOAD_READ_PARAMETERS = extern struct {
    Flags: DWORD,
    TimeToLive: DWORD,
    Reserved: [2]DWORD,
};

pub const PDEVICE_DSM_OFFLOAD_READ_PARAMETERS = ?*DEVICE_DSM_OFFLOAD_READ_PARAMETERS;
pub const DEVICE_DSM_OFFLOAD_WRITE_PARAMETERS = extern struct {
    Flags: DWORD,
    Reserved: DWORD,
    TokenOffset: DWORDLONG,
    Token: STORAGE_OFFLOAD_TOKEN,
};

pub const PDEVICE_DSM_OFFLOAD_WRITE_PARAMETERS = ?*DEVICE_DSM_OFFLOAD_WRITE_PARAMETERS;
pub const DEVICE_DATA_SET_REPAIR_PARAMETERS = extern struct {
    NumberOfRepairCopies: DWORD,
    SourceCopy: DWORD,
    RepairCopies: [1]DWORD,
};

pub const PDEVICE_DATA_SET_REPAIR_PARAMETERS = ?*DEVICE_DATA_SET_REPAIR_PARAMETERS;
pub const DEVICE_DATA_SET_LBP_STATE_PARAMETERS = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    OutputVersion: DWORD,
};

pub const PDEVICE_DATA_SET_LBP_STATE_PARAMETERS = ?*DEVICE_DATA_SET_LBP_STATE_PARAMETERS;
pub const DEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT = extern struct {
    Size: DWORD,
    Action: DEVICE_DATA_MANAGEMENT_SET_ACTION,
    Flags: DWORD,
    OperationStatus: DWORD,
    ExtendedError: DWORD,
    TargetDetailedError: DWORD,
    ReservedStatus: DWORD,
    OutputBlockOffset: DWORD,
    OutputBlockLength: DWORD,
};

pub const PDEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT = ?*DEVICE_MANAGE_DATA_SET_ATTRIBUTES_OUTPUT;
pub const DEVICE_DATA_SET_LB_PROVISIONING_STATE = extern struct {
    Size: DWORD,
    Version: DWORD,
    SlabSizeInBytes: DWORDLONG,
    SlabOffsetDeltaInBytes: DWORD,
    SlabAllocationBitMapBitCount: DWORD,
    SlabAllocationBitMapLength: DWORD,
    SlabAllocationBitMap: [1]DWORD,
};

pub const PDEVICE_DATA_SET_LB_PROVISIONING_STATE = ?*DEVICE_DATA_SET_LB_PROVISIONING_STATE;
pub const DEVICE_DATA_SET_LB_PROVISIONING_STATE_V2 = extern struct {
    Size: DWORD,
    Version: DWORD,
    SlabSizeInBytes: DWORDLONG,
    SlabOffsetDeltaInBytes: DWORDLONG,
    SlabAllocationBitMapBitCount: DWORD,
    SlabAllocationBitMapLength: DWORD,
    SlabAllocationBitMap: [1]DWORD,
};

pub const PDEVICE_DATA_SET_LB_PROVISIONING_STATE_V2 = ?*DEVICE_DATA_SET_LB_PROVISIONING_STATE_V2;
pub const STORAGE_OFFLOAD_READ_OUTPUT = extern struct {
    OffloadReadFlags: DWORD,
    Reserved: DWORD,
    LengthProtected: DWORDLONG,
    TokenLength: DWORD,
    Token: STORAGE_OFFLOAD_TOKEN,
};

pub const PSTORAGE_OFFLOAD_READ_OUTPUT = ?*STORAGE_OFFLOAD_READ_OUTPUT;
pub const STORAGE_OFFLOAD_WRITE_OUTPUT = extern struct {
    OffloadWriteFlags: DWORD,
    Reserved: DWORD,
    LengthCopied: DWORDLONG,
};

pub const PSTORAGE_OFFLOAD_WRITE_OUTPUT = ?*STORAGE_OFFLOAD_WRITE_OUTPUT;
pub const DEVICE_DATA_SET_SCRUB_OUTPUT = extern struct {
    BytesProcessed: DWORDLONG,
    BytesRepaired: DWORDLONG,
    BytesFailed: DWORDLONG,
};

pub const PDEVICE_DATA_SET_SCRUB_OUTPUT = ?*DEVICE_DATA_SET_SCRUB_OUTPUT;
pub const DEVICE_DATA_SET_SCRUB_EX_OUTPUT = extern struct {
    BytesProcessed: DWORDLONG,
    BytesRepaired: DWORDLONG,
    BytesFailed: DWORDLONG,
    ParityExtent: DEVICE_DATA_SET_RANGE,
};

pub const PDEVICE_DATA_SET_SCRUB_EX_OUTPUT = ?*DEVICE_DATA_SET_SCRUB_EX_OUTPUT;
pub const DEVICE_DATA_SET_REPAIR_OUTPUT = extern struct {
    ParityExtent: DEVICE_DATA_SET_RANGE,
};

pub const PDEVICE_DATA_SET_REPAIR_OUTPUT = ?*DEVICE_DATA_SET_REPAIR_OUTPUT;
pub const DEVICE_DSM_TIERING_QUERY_INPUT = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    NumberOfTierIds: DWORD,
    TierIds: [1]GUID,
};

pub const PDEVICE_DSM_TIERING_QUERY_INPUT = ?*DEVICE_DSM_TIERING_QUERY_INPUT;
pub const STORAGE_TIER_REGION = extern struct {
    TierId: GUID,
    Offset: DWORDLONG,
    Length: DWORDLONG,
};

pub const PSTORAGE_TIER_REGION = ?*STORAGE_TIER_REGION;
pub const DEVICE_DSM_TIERING_QUERY_OUTPUT = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    Reserved: DWORD,
    Alignment: DWORDLONG,
    TotalNumberOfRegions: DWORD,
    NumberOfRegionsReturned: DWORD,
    Regions: [1]STORAGE_TIER_REGION,
};

pub const PDEVICE_DSM_TIERING_QUERY_OUTPUT = ?*DEVICE_DSM_TIERING_QUERY_OUTPUT;
pub const DEVICE_DATA_SET_TOPOLOGY_ID_QUERY_OUTPUT = extern struct {
    TopologyRangeBytes: DWORDLONG,
    TopologyId: [16]BYTE,
};

pub const PDEVICE_DATA_SET_TOPOLOGY_ID_QUERY_OUTPUT = ?*DEVICE_DATA_SET_TOPOLOGY_ID_QUERY_OUTPUT;
pub const DEVICE_STORAGE_ADDRESS_RANGE = extern struct {
    StartAddress: LONGLONG,
    LengthInBytes: DWORDLONG,
};

pub const PDEVICE_STORAGE_ADDRESS_RANGE = ?*DEVICE_STORAGE_ADDRESS_RANGE;
pub const DEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT = extern struct {
    Version: DWORD,
    Flags: DWORD,
    TotalNumberOfRanges: DWORD,
    NumberOfRangesReturned: DWORD,
    Ranges: [1]DEVICE_STORAGE_ADDRESS_RANGE,
};

pub const PDEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT = ?*DEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT;
pub const STORAGE_ZONE_CONDITION = c_int;

pub const PSTORAGE_ZONE_CONDITION = ?*STORAGE_ZONE_CONDITION;
pub const DEVICE_DSM_REPORT_ZONES_PARAMETERS = extern struct {
    Size: DWORD,
    ReportOption: BYTE,
    Partial: BYTE,
    Reserved: [2]BYTE,
};

pub const PDEVICE_DSM_REPORT_ZONES_PARAMETERS = ?*DEVICE_DSM_REPORT_ZONES_PARAMETERS;
pub const STORAGE_ZONES_ATTRIBUTES = c_int;

pub const PSTORAGE_ZONES_ATTRIBUTES = ?*STORAGE_ZONES_ATTRIBUTES;
pub const STORAGE_ZONE_DESCRIPTOR = extern struct {
    Size: DWORD,
    ZoneType: STORAGE_ZONE_TYPES,
    ZoneCondition: STORAGE_ZONE_CONDITION,
    ResetWritePointerRecommend: BOOLEAN,
    Reserved0: [3]BYTE,
    ZoneSize: DWORDLONG,
    WritePointerOffset: DWORDLONG,
};

pub const PSTORAGE_ZONE_DESCRIPTOR = ?*STORAGE_ZONE_DESCRIPTOR;
pub const DEVICE_DSM_REPORT_ZONES_DATA = extern struct {
    Size: DWORD,
    ZoneCount: DWORD,
    Attributes: STORAGE_ZONES_ATTRIBUTES,
    Reserved0: DWORD,
    ZoneDescriptors: [1]STORAGE_ZONE_DESCRIPTOR,
};

pub const PDEVICE_DSM_REPORT_ZONES_DATA = ?*DEVICE_DSM_REPORT_ZONES_DATA;
pub const DEVICE_STORAGE_RANGE_ATTRIBUTES = extern struct {
    LengthInBytes: DWORDLONG,
    u: extern union {
        AllFlags: DWORD,
        s: packed struct {
            IsRangeBad: @IntType(false, 1),
            Reserved: @IntType(false, 31),
        },
    },
    Reserved: DWORD,
};

pub const PDEVICE_STORAGE_RANGE_ATTRIBUTES = ?*DEVICE_STORAGE_RANGE_ATTRIBUTES;
pub const DEVICE_DSM_RANGE_ERROR_INFO = extern struct {
    Version: DWORD,
    Flags: DWORD,
    TotalNumberOfRanges: DWORD,
    NumberOfRangesReturned: DWORD,
    Ranges: [1]DEVICE_STORAGE_RANGE_ATTRIBUTES,
};

pub const PDEVICE_DSM_RANGE_ERROR_INFO = ?*DEVICE_DSM_RANGE_ERROR_INFO;
pub const STORAGE_GET_BC_PROPERTIES_OUTPUT = extern struct {
    MaximumRequestsPerPeriod: DWORD,
    MinimumPeriod: DWORD,
    MaximumRequestSize: DWORDLONG,
    EstimatedTimePerRequest: DWORD,
    NumOutStandingRequests: DWORD,
    RequestSize: DWORDLONG,
};

pub const PSTORAGE_GET_BC_PROPERTIES_OUTPUT = ?*STORAGE_GET_BC_PROPERTIES_OUTPUT;
pub const STORAGE_ALLOCATE_BC_STREAM_INPUT = extern struct {
    Version: DWORD,
    RequestsPerPeriod: DWORD,
    Period: DWORD,
    RetryFailures: BOOLEAN,
    Discardable: BOOLEAN,
    Reserved1: [2]BOOLEAN,
    AccessType: DWORD,
    AccessMode: DWORD,
};

pub const PSTORAGE_ALLOCATE_BC_STREAM_INPUT = ?*STORAGE_ALLOCATE_BC_STREAM_INPUT;
pub const STORAGE_ALLOCATE_BC_STREAM_OUTPUT = extern struct {
    RequestSize: DWORDLONG,
    NumOutStandingRequests: DWORD,
};

pub const PSTORAGE_ALLOCATE_BC_STREAM_OUTPUT = ?*STORAGE_ALLOCATE_BC_STREAM_OUTPUT;
pub const STORAGE_PRIORITY_HINT_SUPPORT = extern struct {
    SupportFlags: DWORD,
};

pub const PSTORAGE_PRIORITY_HINT_SUPPORT = ?*STORAGE_PRIORITY_HINT_SUPPORT;
pub const STORAGE_DIAGNOSTIC_LEVEL = c_int;

pub const PSTORAGE_DIAGNOSTIC_LEVEL = ?*STORAGE_DIAGNOSTIC_LEVEL;
pub const STORAGE_DIAGNOSTIC_TARGET_TYPE = c_int;

pub const PSTORAGE_DIAGNOSTIC_TARGET_TYPE = ?*STORAGE_DIAGNOSTIC_TARGET_TYPE;
pub const STORAGE_DIAGNOSTIC_REQUEST = extern struct {
    Version: DWORD,
    Size: DWORD,
    Reserved: DWORD,
    TargetType: STORAGE_DIAGNOSTIC_TARGET_TYPE,
    Level: STORAGE_DIAGNOSTIC_LEVEL,
};

pub const PSTORAGE_DIAGNOSTIC_REQUEST = ?*STORAGE_DIAGNOSTIC_REQUEST;
pub const STORAGE_DIAGNOSTIC_DATA = extern struct {
    Version: DWORD,
    Size: DWORD,
    ProviderId: GUID,
    BufferSize: DWORD,
    Reserved: DWORD,
    DiagnosticDataBuffer: [1]BYTE,
};

pub const PSTORAGE_DIAGNOSTIC_DATA = ?*STORAGE_DIAGNOSTIC_DATA;
pub const PHYSICAL_ELEMENT_STATUS_REQUEST = extern struct {
    Version: DWORD,
    Size: DWORD,
    StartingElement: DWORD,
    Filter: BYTE,
    ReportType: BYTE,
    Reserved: [2]BYTE,
};

pub const PPHYSICAL_ELEMENT_STATUS_REQUEST = ?*PHYSICAL_ELEMENT_STATUS_REQUEST;
pub const PHYSICAL_ELEMENT_STATUS_DESCRIPTOR = extern struct {
    Version: DWORD,
    Size: DWORD,
    ElementIdentifier: DWORD,
    PhysicalElementType: BYTE,
    PhysicalElementHealth: BYTE,
    Reserved1: [2]BYTE,
    AssociatedCapacity: DWORDLONG,
    Reserved2: [4]DWORD,
};

pub const PPHYSICAL_ELEMENT_STATUS_DESCRIPTOR = ?*PHYSICAL_ELEMENT_STATUS_DESCRIPTOR;
pub const PHYSICAL_ELEMENT_STATUS = extern struct {
    Version: DWORD,
    Size: DWORD,
    DescriptorCount: DWORD,
    ReturnedDescriptorCount: DWORD,
    ElementIdentifierBeingDepoped: DWORD,
    Reserved: DWORD,
    Descriptors: [1]PHYSICAL_ELEMENT_STATUS_DESCRIPTOR,
};

pub const PPHYSICAL_ELEMENT_STATUS = ?*PHYSICAL_ELEMENT_STATUS;
pub const REMOVE_ELEMENT_AND_TRUNCATE_REQUEST = extern struct {
    Version: DWORD,
    Size: DWORD,
    RequestCapacity: DWORDLONG,
    ElementIdentifier: DWORD,
    Reserved: DWORD,
};

pub const PREMOVE_ELEMENT_AND_TRUNCATE_REQUEST = ?*REMOVE_ELEMENT_AND_TRUNCATE_REQUEST;
pub const STORAGE_MEDIA_SERIAL_NUMBER_DATA = extern struct {
    Reserved: WORD,
    SerialNumberLength: WORD,
    SerialNumber: [0]BYTE,
};

pub const PSTORAGE_MEDIA_SERIAL_NUMBER_DATA = ?*STORAGE_MEDIA_SERIAL_NUMBER_DATA;
pub const STORAGE_READ_CAPACITY = extern struct {
    Version: DWORD,
    Size: DWORD,
    BlockLength: DWORD,
    NumberOfBlocks: LARGE_INTEGER,
    DiskLength: LARGE_INTEGER,
};

pub const PSTORAGE_READ_CAPACITY = ?*STORAGE_READ_CAPACITY;
pub const WriteCacheTypeUnknown = WRITE_CACHE_TYPE.WriteCacheTypeUnknown;
pub const WriteCacheTypeNone = WRITE_CACHE_TYPE.WriteCacheTypeNone;
pub const WriteCacheTypeWriteBack = WRITE_CACHE_TYPE.WriteCacheTypeWriteBack;
pub const WriteCacheTypeWriteThrough = WRITE_CACHE_TYPE.WriteCacheTypeWriteThrough;
pub const WRITE_CACHE_TYPE = extern enum {
    WriteCacheTypeUnknown,
    WriteCacheTypeNone,
    WriteCacheTypeWriteBack,
    WriteCacheTypeWriteThrough,
};

pub const WriteCacheEnableUnknown = WRITE_CACHE_ENABLE.WriteCacheEnableUnknown;
pub const WriteCacheDisabled = WRITE_CACHE_ENABLE.WriteCacheDisabled;
pub const WriteCacheEnabled = WRITE_CACHE_ENABLE.WriteCacheEnabled;
pub const WRITE_CACHE_ENABLE = extern enum {
    WriteCacheEnableUnknown,
    WriteCacheDisabled,
    WriteCacheEnabled,
};

pub const WriteCacheChangeUnknown = WRITE_CACHE_CHANGE.WriteCacheChangeUnknown;
pub const WriteCacheNotChangeable = WRITE_CACHE_CHANGE.WriteCacheNotChangeable;
pub const WriteCacheChangeable = WRITE_CACHE_CHANGE.WriteCacheChangeable;
pub const WRITE_CACHE_CHANGE = extern enum {
    WriteCacheChangeUnknown,
    WriteCacheNotChangeable,
    WriteCacheChangeable,
};

pub const WriteThroughUnknown = WRITE_THROUGH.WriteThroughUnknown;
pub const WriteThroughNotSupported = WRITE_THROUGH.WriteThroughNotSupported;
pub const WriteThroughSupported = WRITE_THROUGH.WriteThroughSupported;
pub const WRITE_THROUGH = extern enum {
    WriteThroughUnknown,
    WriteThroughNotSupported,
    WriteThroughSupported,
};

pub const STORAGE_WRITE_CACHE_PROPERTY = extern struct {
    Version: DWORD,
    Size: DWORD,
    WriteCacheType: WRITE_CACHE_TYPE,
    WriteCacheEnabled: WRITE_CACHE_ENABLE,
    WriteCacheChangeable: WRITE_CACHE_CHANGE,
    WriteThroughSupported: WRITE_THROUGH,
    FlushCacheSupported: BOOLEAN,
    UserDefinedPowerProtection: BOOLEAN,
    NVCacheEnabled: BOOLEAN,
};

pub const PSTORAGE_WRITE_CACHE_PROPERTY = ?*STORAGE_WRITE_CACHE_PROPERTY;
pub const PERSISTENT_RESERVE_COMMAND = extern struct {
    Version: DWORD,
    Size: DWORD,
    u: extern union {
        PR_IN: packed struct {
            ServiceAction: @IntType(false, 5),
            Reserved1: @IntType(false, 3),
            Reserved2: UCHAR,
            AllocationLength: USHORT,
        },
        PR_OUT: packed struct {
            ServiceAction: @IntType(false, 5),
            Reserved1: @IntType(false, 3),
            Type: @IntType(false, 4),
            Scope: @IntType(false, 4),
            ParameterList: [0]UCHAR,
        },
    },
};

pub const PPERSISTENT_RESERVE_COMMAND = ?*PERSISTENT_RESERVE_COMMAND;
pub const DEVICEDUMP_COLLECTION_TYPE = c_int;
pub const DEVICEDUMP_COLLECTION_TYPEIDE_NOTIFICATION_TYPE = DEVICEDUMP_COLLECTION_TYPE;
pub const PDEVICEDUMP_COLLECTION_TYPE = ?*DEVICEDUMP_COLLECTION_TYPE;
pub const DEVICEDUMP_SUBSECTION_POINTER = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    dwOffset: DWORD,
};

pub const PDEVICEDUMP_SUBSECTION_POINTER = ?*DEVICEDUMP_SUBSECTION_POINTER;
pub const DEVICEDUMP_STRUCTURE_VERSION = extern struct {
    dwSignature: DWORD,
    dwVersion: DWORD,
    dwSize: DWORD,
};

pub const PDEVICEDUMP_STRUCTURE_VERSION = ?*DEVICEDUMP_STRUCTURE_VERSION;
pub const DEVICEDUMP_SECTION_HEADER = extern struct {
    guidDeviceDataId: GUID,
    sOrganizationID: [16]BYTE,
    dwFirmwareRevision: DWORD,
    sModelNumber: [32]BYTE,
    szDeviceManufacturingID: [32]BYTE,
    dwFlags: DWORD,
    bRestrictedPrivateDataVersion: DWORD,
    dwFirmwareIssueId: DWORD,
    szIssueDescriptionString: [132]BYTE,
};

pub const PDEVICEDUMP_SECTION_HEADER = ?*DEVICEDUMP_SECTION_HEADER;
pub const GP_LOG_PAGE_DESCRIPTOR = extern struct {
    LogAddress: WORD,
    LogSectors: WORD,
};

pub const PGP_LOG_PAGE_DESCRIPTOR = ?*GP_LOG_PAGE_DESCRIPTOR;
pub const DEVICEDUMP_PUBLIC_SUBSECTION = extern struct {
    dwFlags: DWORD,
    GPLogTable: [16]GP_LOG_PAGE_DESCRIPTOR,
    szDescription: [16]CHAR,
    bData: [1]BYTE,
};

pub const PDEVICEDUMP_PUBLIC_SUBSECTION = ?*DEVICEDUMP_PUBLIC_SUBSECTION;
pub const DEVICEDUMP_RESTRICTED_SUBSECTION = extern struct {
    bData: [1]BYTE,
};

pub const PDEVICEDUMP_RESTRICTED_SUBSECTION = ?*DEVICEDUMP_RESTRICTED_SUBSECTION;
pub const DEVICEDUMP_PRIVATE_SUBSECTION = extern struct {
    dwFlags: DWORD,
    GPLogId: GP_LOG_PAGE_DESCRIPTOR,
    bData: [1]BYTE,
};

pub const PDEVICEDUMP_PRIVATE_SUBSECTION = ?*DEVICEDUMP_PRIVATE_SUBSECTION;
pub const DEVICEDUMP_STORAGEDEVICE_DATA = extern struct {
    Descriptor: DEVICEDUMP_STRUCTURE_VERSION,
    SectionHeader: DEVICEDUMP_SECTION_HEADER,
    dwBufferSize: DWORD,
    dwReasonForCollection: DWORD,
    PublicData: DEVICEDUMP_SUBSECTION_POINTER,
    RestrictedData: DEVICEDUMP_SUBSECTION_POINTER,
    PrivateData: DEVICEDUMP_SUBSECTION_POINTER,
};

pub const PDEVICEDUMP_STORAGEDEVICE_DATA = ?*DEVICEDUMP_STORAGEDEVICE_DATA;
pub const DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD = extern struct {
    Cdb: [16]BYTE,
    Command: [16]BYTE,
    StartTime: DWORDLONG,
    EndTime: DWORDLONG,
    OperationStatus: DWORD,
    OperationError: DWORD,
    StackSpecific: extern union {
        ExternalStack: extern struct {
            dwReserved: DWORD,
        },
        AtaPort: extern struct {
            dwAtaPortSpecific: DWORD,
        },
        StorPort: extern struct {
            SrbTag: DWORD,
        },
    },
};

pub const PDEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD = ?*DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD;
pub const DEVICEDUMP_STORAGESTACK_PUBLIC_DUMP = extern struct {
    Descriptor: DEVICEDUMP_STRUCTURE_VERSION,
    dwReasonForCollection: DWORD,
    cDriverName: [16]BYTE,
    uiNumRecords: DWORD,
    RecordArray: [1]DEVICEDUMP_STORAGESTACK_PUBLIC_STATE_RECORD,
};

pub const PDEVICEDUMP_STORAGESTACK_PUBLIC_DUMP = ?*DEVICEDUMP_STORAGESTACK_PUBLIC_DUMP;
pub const STORAGE_IDLE_POWER = extern struct {
    Version: ULONG,
    Size: ULONG,
    s: packed struct {
        WakeCapableHint: @IntType(false, 1),
        D3ColdSupported: @IntType(false, 1),
        Reserved: @IntType(false, 30),
    },
    D3IdleTimeout: ULONG,
};

pub const PSTORAGE_IDLE_POWER = ?*STORAGE_IDLE_POWER;
pub const STORAGE_POWERUP_REASON_TYPE = c_int;

pub const PSTORAGE_POWERUP_REASON_TYPE = ?*STORAGE_POWERUP_REASON_TYPE;
pub const STORAGE_IDLE_POWERUP_REASON = extern struct {
    Version: DWORD,
    Size: DWORD,
    PowerupReason: STORAGE_POWERUP_REASON_TYPE,
};

pub const PSTORAGE_IDLE_POWERUP_REASON = ?*STORAGE_IDLE_POWERUP_REASON;
pub const StorageDevicePowerCapUnitsPercent = STORAGE_DEVICE_POWER_CAP_UNITS.StorageDevicePowerCapUnitsPercent;
pub const StorageDevicePowerCapUnitsMilliwatts = STORAGE_DEVICE_POWER_CAP_UNITS.StorageDevicePowerCapUnitsMilliwatts;
pub const STORAGE_DEVICE_POWER_CAP_UNITS = extern enum {
    StorageDevicePowerCapUnitsPercent,
    StorageDevicePowerCapUnitsMilliwatts,
};

pub const PSTORAGE_DEVICE_POWER_CAP_UNITS = ?*STORAGE_DEVICE_POWER_CAP_UNITS;
pub const STORAGE_DEVICE_POWER_CAP = extern struct {
    Version: DWORD,
    Size: DWORD,
    Units: STORAGE_DEVICE_POWER_CAP_UNITS,
    MaxPower: DWORDLONG,
};

pub const PSTORAGE_DEVICE_POWER_CAP = ?*STORAGE_DEVICE_POWER_CAP;
pub const STORAGE_RPMB_DATA_FRAME = extern struct {
    Stuff: [196]BYTE,
    KeyOrMAC: [32]BYTE,
    Data: [256]BYTE,
    Nonce: [16]BYTE,
    WriteCounter: [4]BYTE,
    Address: [2]BYTE,
    BlockCount: [2]BYTE,
    OperationResult: [2]BYTE,
    RequestOrResponseType: [2]BYTE,
};

pub const PSTORAGE_RPMB_DATA_FRAME = ?*STORAGE_RPMB_DATA_FRAME;
pub const STORAGE_RPMB_COMMAND_TYPE = c_int;

pub const PSTORAGE_RPMB_COMMAND_TYPE = ?*STORAGE_RPMB_COMMAND_TYPE;
pub const STORAGE_EVENT_NOTIFICATION = extern struct {
    Version: DWORD,
    Size: DWORD,
    Events: DWORDLONG,
};

pub const PSTORAGE_EVENT_NOTIFICATION = ?*STORAGE_EVENT_NOTIFICATION;
pub const STORAGE_COUNTER_TYPE = c_int;

pub const PSTORAGE_COUNTER_TYPE = ?*STORAGE_COUNTER_TYPE;
pub const STORAGE_COUNTER = extern struct {
    Type: STORAGE_COUNTER_TYPE,
    Value: extern union {
        ManufactureDate: extern struct {
            Week: DWORD,
            Year: DWORD,
        },
        AsUlonglong: DWORDLONG,
    },
};

pub const PSTORAGE_COUNTER = ?*STORAGE_COUNTER;
pub const STORAGE_COUNTERS = extern struct {
    Version: DWORD,
    Size: DWORD,
    NumberOfCounters: DWORD,
    Counters: [1]STORAGE_COUNTER,
};

pub const PSTORAGE_COUNTERS = ?*STORAGE_COUNTERS;
pub const STORAGE_HW_FIRMWARE_INFO_QUERY = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    Reserved: DWORD,
};

pub const PSTORAGE_HW_FIRMWARE_INFO_QUERY = ?*STORAGE_HW_FIRMWARE_INFO_QUERY;
pub const STORAGE_HW_FIRMWARE_SLOT_INFO = extern struct {
    Version: ULONG,
    Size: ULONG,
    SlotNumber: UCHAR,
    s: packed struct {
        ReadOnly: @IntType(false, 1),
        Reserved0: @IntType(false, 7),
    },
    Reserved1: [6]UCHAR,
    Revision: [STORAGE_HW_FIRMWARE_REVISION_LENGTH]UCHAR,
};

pub const PSTORAGE_HW_FIRMWARE_SLOT_INFO = ?*STORAGE_HW_FIRMWARE_SLOT_INFO;
pub const STORAGE_HW_FIRMWARE_INFO = extern struct {
    Version: ULONG,
    Size: ULONG,
    s: packed struct {
        SupportUpgrade: @IntType(false, 1),
        Reserved0: @IntType(false, 7),
    },
    SlotCount: UCHAR,
    ActiveSlot: UCHAR,
    PendingActivateSlot: UCHAR,
    FirmwareShared: BOOLEAN,
    Reserved: [3]UCHAR,
    ImagePayloadAlignment: ULONG,
    ImagePayloadMaxSize: ULONG,
    Slot: [ANYSIZE_ARRAY]STORAGE_HW_FIRMWARE_SLOT_INFO,
};

pub const PSTORAGE_HW_FIRMWARE_INFO = ?*STORAGE_HW_FIRMWARE_INFO;
pub const STORAGE_HW_FIRMWARE_DOWNLOAD = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    Slot: BYTE,
    Reserved: [3]BYTE,
    Offset: DWORDLONG,
    BufferSize: DWORDLONG,
    ImageBuffer: [1]BYTE,
};

pub const PSTORAGE_HW_FIRMWARE_DOWNLOAD = ?*STORAGE_HW_FIRMWARE_DOWNLOAD;
pub const STORAGE_HW_FIRMWARE_DOWNLOAD_V2 = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    Slot: BYTE,
    Reserved: [3]BYTE,
    Offset: DWORDLONG,
    BufferSize: DWORDLONG,
    ImageSize: DWORD,
    Reserved2: DWORD,
    ImageBuffer: [1]BYTE,
};

pub const PSTORAGE_HW_FIRMWARE_DOWNLOAD_V2 = ?*STORAGE_HW_FIRMWARE_DOWNLOAD_V2;
pub const STORAGE_HW_FIRMWARE_ACTIVATE = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    Slot: BYTE,
    Reserved0: [3]BYTE,
};

pub const PSTORAGE_HW_FIRMWARE_ACTIVATE = ?*STORAGE_HW_FIRMWARE_ACTIVATE;
pub const STORAGE_PROTOCOL_COMMAND = extern struct {
    Version: DWORD,
    Length: DWORD,
    ProtocolType: STORAGE_PROTOCOL_TYPE,
    Flags: DWORD,
    ReturnStatus: DWORD,
    ErrorCode: DWORD,
    CommandLength: DWORD,
    ErrorInfoLength: DWORD,
    DataToDeviceTransferLength: DWORD,
    DataFromDeviceTransferLength: DWORD,
    TimeOutValue: DWORD,
    ErrorInfoOffset: DWORD,
    DataToDeviceBufferOffset: DWORD,
    DataFromDeviceBufferOffset: DWORD,
    CommandSpecific: DWORD,
    Reserved0: DWORD,
    FixedProtocolReturnData: DWORD,
    Reserved1: [3]DWORD,
    Command: [1]BYTE,
};

pub const PSTORAGE_PROTOCOL_COMMAND = ?*STORAGE_PROTOCOL_COMMAND;
pub const STORAGE_ATTRIBUTE_MGMT_ACTION = c_int;

pub const PSTORAGE_ATTRIBUTE_MGMT_ACTION = ?*STORAGE_ATTRIBUTE_MGMT_ACTION;
pub const STORAGE_ATTRIBUTE_MGMT = extern struct {
    Version: DWORD,
    Size: DWORD,
    Action: STORAGE_ATTRIBUTE_MGMT_ACTION,
    Attribute: DWORD,
};

pub const PSTORAGE_ATTRIBUTE_MGMT = ?*STORAGE_ATTRIBUTE_MGMT;
pub const Unknown = MEDIA_TYPE.Unknown;
pub const F5_1Pt2_512 = MEDIA_TYPE.F5_1Pt2_512;
pub const F3_1Pt44_512 = MEDIA_TYPE.F3_1Pt44_512;
pub const F3_2Pt88_512 = MEDIA_TYPE.F3_2Pt88_512;
pub const F3_20Pt8_512 = MEDIA_TYPE.F3_20Pt8_512;
pub const F3_720_512 = MEDIA_TYPE.F3_720_512;
pub const F5_360_512 = MEDIA_TYPE.F5_360_512;
pub const F5_320_512 = MEDIA_TYPE.F5_320_512;
pub const F5_320_1024 = MEDIA_TYPE.F5_320_1024;
pub const F5_180_512 = MEDIA_TYPE.F5_180_512;
pub const F5_160_512 = MEDIA_TYPE.F5_160_512;
pub const RemovableMedia = MEDIA_TYPE.RemovableMedia;
pub const FixedMedia = MEDIA_TYPE.FixedMedia;
pub const F3_120M_512 = MEDIA_TYPE.F3_120M_512;
pub const F3_640_512 = MEDIA_TYPE.F3_640_512;
pub const F5_640_512 = MEDIA_TYPE.F5_640_512;
pub const F5_720_512 = MEDIA_TYPE.F5_720_512;
pub const F3_1Pt2_512 = MEDIA_TYPE.F3_1Pt2_512;
pub const F3_1Pt23_1024 = MEDIA_TYPE.F3_1Pt23_1024;
pub const F5_1Pt23_1024 = MEDIA_TYPE.F5_1Pt23_1024;
pub const F3_128Mb_512 = MEDIA_TYPE.F3_128Mb_512;
pub const F3_230Mb_512 = MEDIA_TYPE.F3_230Mb_512;
pub const F8_256_128 = MEDIA_TYPE.F8_256_128;
pub const F3_200Mb_512 = MEDIA_TYPE.F3_200Mb_512;
pub const F3_240M_512 = MEDIA_TYPE.F3_240M_512;
pub const F3_32M_512 = MEDIA_TYPE.F3_32M_512;
pub const MEDIA_TYPE = extern enum {
    Unknown,
    F5_1Pt2_512,
    F3_1Pt44_512,
    F3_2Pt88_512,
    F3_20Pt8_512,
    F3_720_512,
    F5_360_512,
    F5_320_512,
    F5_320_1024,
    F5_180_512,
    F5_160_512,
    RemovableMedia,
    FixedMedia,
    F3_120M_512,
    F3_640_512,
    F5_640_512,
    F5_720_512,
    F3_1Pt2_512,
    F3_1Pt23_1024,
    F5_1Pt23_1024,
    F3_128Mb_512,
    F3_230Mb_512,
    F8_256_128,
    F3_200Mb_512,
    F3_240M_512,
    F3_32M_512,
};

pub const PMEDIA_TYPE = ?*MEDIA_TYPE;
pub const FORMAT_PARAMETERS = extern struct {
    MediaType: MEDIA_TYPE,
    StartCylinderNumber: DWORD,
    EndCylinderNumber: DWORD,
    StartHeadNumber: DWORD,
    EndHeadNumber: DWORD,
};

pub const PFORMAT_PARAMETERS = ?*FORMAT_PARAMETERS;
pub const BAD_TRACK_NUMBER = WORD;
pub const PBAD_TRACK_NUMBER = ?*WORD;
pub const FORMAT_EX_PARAMETERS = extern struct {
    MediaType: MEDIA_TYPE,
    StartCylinderNumber: DWORD,
    EndCylinderNumber: DWORD,
    StartHeadNumber: DWORD,
    EndHeadNumber: DWORD,
    FormatGapLength: WORD,
    SectorsPerTrack: WORD,
    SectorNumber: [1]WORD,
};

pub const PFORMAT_EX_PARAMETERS = ?*FORMAT_EX_PARAMETERS;
pub const DISK_GEOMETRY = extern struct {
    Cylinders: LARGE_INTEGER,
    MediaType: MEDIA_TYPE,
    TracksPerCylinder: DWORD,
    SectorsPerTrack: DWORD,
    BytesPerSector: DWORD,
};

pub const PDISK_GEOMETRY = ?*DISK_GEOMETRY;
pub const PARTITION_INFORMATION = extern struct {
    StartingOffset: LARGE_INTEGER,
    PartitionLength: LARGE_INTEGER,
    HiddenSectors: DWORD,
    PartitionNumber: DWORD,
    PartitionType: BYTE,
    BootIndicator: BOOLEAN,
    RecognizedPartition: BOOLEAN,
    RewritePartition: BOOLEAN,
};

pub const PPARTITION_INFORMATION = ?*PARTITION_INFORMATION;
pub const SET_PARTITION_INFORMATION = extern struct {
    PartitionType: BYTE,
};

pub const PSET_PARTITION_INFORMATION = ?*SET_PARTITION_INFORMATION;
pub const DRIVE_LAYOUT_INFORMATION = extern struct {
    PartitionCount: DWORD,
    Signature: DWORD,
    PartitionEntry: [1]PARTITION_INFORMATION,
};

pub const PDRIVE_LAYOUT_INFORMATION = ?*DRIVE_LAYOUT_INFORMATION;
pub const VERIFY_INFORMATION = extern struct {
    StartingOffset: LARGE_INTEGER,
    Length: DWORD,
};

pub const PVERIFY_INFORMATION = ?*VERIFY_INFORMATION;
pub const REASSIGN_BLOCKS = extern struct {
    Reserved: WORD,
    Count: WORD,
    BlockNumber: [1]DWORD,
};

pub const PREASSIGN_BLOCKS = ?*REASSIGN_BLOCKS;
pub const REASSIGN_BLOCKS_EX = extern struct {
    Reserved: WORD,
    Count: WORD,
    BlockNumber: [1]LARGE_INTEGER,
};

pub const PREASSIGN_BLOCKS_EX = ?*REASSIGN_BLOCKS_EX;
pub const PARTITION_STYLE_MBR = PARTITION_STYLE.PARTITION_STYLE_MBR;
pub const PARTITION_STYLE_GPT = PARTITION_STYLE.PARTITION_STYLE_GPT;
pub const PARTITION_STYLE_RAW = PARTITION_STYLE.PARTITION_STYLE_RAW;
pub const PARTITION_STYLE = extern enum {
    PARTITION_STYLE_MBR,
    PARTITION_STYLE_GPT,
    PARTITION_STYLE_RAW,
};

pub const PARTITION_INFORMATION_GPT = extern struct {
    PartitionType: GUID,
    PartitionId: GUID,
    Attributes: DWORD64,
    Name: [36]WCHAR,
};

pub const PPARTITION_INFORMATION_GPT = ?*PARTITION_INFORMATION_GPT;
pub const PARTITION_INFORMATION_MBR = extern struct {
    PartitionType: BYTE,
    BootIndicator: BOOLEAN,
    RecognizedPartition: BOOLEAN,
    HiddenSectors: DWORD,
    PartitionId: GUID,
};

pub const PPARTITION_INFORMATION_MBR = ?*PARTITION_INFORMATION_MBR;
pub const SET_PARTITION_INFORMATION_MBR = SET_PARTITION_INFORMATION;
pub const SET_PARTITION_INFORMATION_GPT = PARTITION_INFORMATION_GPT;
pub const SET_PARTITION_INFORMATION_EX = extern struct {
    PartitionStyle: PARTITION_STYLE,
    u: extern union {
        Mbr: SET_PARTITION_INFORMATION_MBR,
        Gpt: SET_PARTITION_INFORMATION_GPT,
    },
};

pub const PSET_PARTITION_INFORMATION_EX = ?*SET_PARTITION_INFORMATION_EX;
pub const CREATE_DISK_GPT = extern struct {
    DiskId: GUID,
    MaxPartitionCount: DWORD,
};

pub const PCREATE_DISK_GPT = ?*CREATE_DISK_GPT;
pub const CREATE_DISK_MBR = extern struct {
    Signature: DWORD,
};

pub const PCREATE_DISK_MBR = ?*CREATE_DISK_MBR;
pub const CREATE_DISK = extern struct {
    PartitionStyle: PARTITION_STYLE,
    u: extern union {
        Mbr: CREATE_DISK_MBR,
        Gpt: CREATE_DISK_GPT,
    },
};

pub const PCREATE_DISK = ?*CREATE_DISK;
pub const GET_LENGTH_INFORMATION = extern struct {
    Length: LARGE_INTEGER,
};

pub const PGET_LENGTH_INFORMATION = ?*GET_LENGTH_INFORMATION;
pub const PARTITION_INFORMATION_EX = extern struct {
    PartitionStyle: PARTITION_STYLE,
    StartingOffset: LARGE_INTEGER,
    PartitionLength: LARGE_INTEGER,
    PartitionNumber: DWORD,
    RewritePartition: BOOLEAN,
    IsServicePartition: BOOLEAN,
    u: extern union {
        Mbr: PARTITION_INFORMATION_MBR,
        Gpt: PARTITION_INFORMATION_GPT,
    },
};

pub const PPARTITION_INFORMATION_EX = ?*PARTITION_INFORMATION_EX;
pub const DRIVE_LAYOUT_INFORMATION_GPT = extern struct {
    DiskId: GUID,
    StartingUsableOffset: LARGE_INTEGER,
    UsableLength: LARGE_INTEGER,
    MaxPartitionCount: DWORD,
};

pub const PDRIVE_LAYOUT_INFORMATION_GPT = ?*DRIVE_LAYOUT_INFORMATION_GPT;
pub const DRIVE_LAYOUT_INFORMATION_MBR = extern struct {
    Signature: DWORD,
    CheckSum: DWORD,
};

pub const PDRIVE_LAYOUT_INFORMATION_MBR = ?*DRIVE_LAYOUT_INFORMATION_MBR;
pub const DRIVE_LAYOUT_INFORMATION_EX = extern struct {
    PartitionStyle: DWORD,
    PartitionCount: DWORD,
    u: extern union {
        Mbr: DRIVE_LAYOUT_INFORMATION_MBR,
        Gpt: DRIVE_LAYOUT_INFORMATION_GPT,
    },
    PartitionEntry: [1]PARTITION_INFORMATION_EX,
};

pub const PDRIVE_LAYOUT_INFORMATION_EX = ?*DRIVE_LAYOUT_INFORMATION_EX;
pub const DetectNone = DETECTION_TYPE.DetectNone;
pub const DetectInt13 = DETECTION_TYPE.DetectInt13;
pub const DetectExInt13 = DETECTION_TYPE.DetectExInt13;
pub const DETECTION_TYPE = extern enum {
    DetectNone,
    DetectInt13,
    DetectExInt13,
};

pub const DISK_INT13_INFO = extern struct {
    DriveSelect: WORD,
    MaxCylinders: DWORD,
    SectorsPerTrack: WORD,
    MaxHeads: WORD,
    NumberDrives: WORD,
};

pub const PDISK_INT13_INFO = ?*DISK_INT13_INFO;
pub const DISK_EX_INT13_INFO = extern struct {
    ExBufferSize: WORD,
    ExFlags: WORD,
    ExCylinders: DWORD,
    ExHeads: DWORD,
    ExSectorsPerTrack: DWORD,
    ExSectorsPerDrive: DWORD64,
    ExSectorSize: WORD,
    ExReserved: WORD,
};

pub const PDISK_EX_INT13_INFO = ?*DISK_EX_INT13_INFO;
pub const DISK_DETECTION_INFO = extern struct {
    SizeOfDetectInfo: DWORD,
    DetectionType: DETECTION_TYPE,
    u: extern union {
        s: extern struct {
            Int13: DISK_INT13_INFO,
            ExInt13: DISK_EX_INT13_INFO,
        },
    },
};

pub const PDISK_DETECTION_INFO = ?*DISK_DETECTION_INFO;
pub const DISK_PARTITION_INFO = extern struct {
    SizeOfPartitionInfo: DWORD,
    PartitionStyle: PARTITION_STYLE,
    u: extern union {
        Mbr: extern struct {
            Signature: DWORD,
            CheckSum: DWORD,
        },
        Gpt: extern struct {
            DiskId: GUID,
        },
    },
};

pub const PDISK_PARTITION_INFO = ?*DISK_PARTITION_INFO;
pub const DISK_GEOMETRY_EX = extern struct {
    Geometry: DISK_GEOMETRY,
    DiskSize: LARGE_INTEGER,
    Data: [1]BYTE,
};

pub const PDISK_GEOMETRY_EX = ?*DISK_GEOMETRY_EX;
pub const DISK_CONTROLLER_NUMBER = extern struct {
    ControllerNumber: DWORD,
    DiskNumber: DWORD,
};

pub const PDISK_CONTROLLER_NUMBER = ?*DISK_CONTROLLER_NUMBER;
pub const DISK_CACHE_RETENTION_PRIORITY = extern enum {
    EqualPriority,
    KeepPrefetchedData,
    KeepReadData,
};
pub const DISK_CACHE_INFORMATION = extern struct {
    ParametersSavable: BOOLEAN,
    ReadCacheEnabled: BOOLEAN,
    WriteCacheEnabled: BOOLEAN,
    ReadRetentionPriority: DISK_CACHE_RETENTION_PRIORITY,
    WriteRetentionPriority: DISK_CACHE_RETENTION_PRIORITY,
    DisablePrefetchTransferLength: WORD,
    PrefetchScalar: BOOLEAN,
    u: extern union {
        ScalarPrefetch: extern struct {
            Minimum: WORD,
            Maximum: WORD,
            MaximumBlocks: WORD,
        },
        BlockPrefetch: extern struct {
            Minimum: WORD,
            Maximum: WORD,
        },
    },
};

pub const PDISK_CACHE_INFORMATION = ?*DISK_CACHE_INFORMATION;
pub const DISK_GROW_PARTITION = extern struct {
    PartitionNumber: DWORD,
    BytesToGrow: LARGE_INTEGER,
};

pub const PDISK_GROW_PARTITION = ?*DISK_GROW_PARTITION;
pub const HISTOGRAM_BUCKET = extern struct {
    Reads: DWORD,
    Writes: DWORD,
};

pub const PHISTOGRAM_BUCKET = ?*HISTOGRAM_BUCKET;
pub const DISK_HISTOGRAM = extern struct {
    DiskSize: LARGE_INTEGER,
    Start: LARGE_INTEGER,
    End: LARGE_INTEGER,
    Average: LARGE_INTEGER,
    AverageRead: LARGE_INTEGER,
    AverageWrite: LARGE_INTEGER,
    Granularity: DWORD,
    Size: DWORD,
    ReadCount: DWORD,
    WriteCount: DWORD,
    Histogram: PHISTOGRAM_BUCKET,
};

pub const PDISK_HISTOGRAM = ?*DISK_HISTOGRAM;
pub const DISK_PERFORMANCE = extern struct {
    BytesRead: LARGE_INTEGER,
    BytesWritten: LARGE_INTEGER,
    ReadTime: LARGE_INTEGER,
    WriteTime: LARGE_INTEGER,
    IdleTime: LARGE_INTEGER,
    ReadCount: DWORD,
    WriteCount: DWORD,
    QueueDepth: DWORD,
    SplitCount: DWORD,
    QueryTime: LARGE_INTEGER,
    StorageDeviceNumber: DWORD,
    StorageManagerName: [8]WCHAR,
};

pub const PDISK_PERFORMANCE = ?*DISK_PERFORMANCE;
pub const DISK_RECORD = extern struct {
    ByteOffset: LARGE_INTEGER,
    StartTime: LARGE_INTEGER,
    EndTime: LARGE_INTEGER,
    VirtualAddress: PVOID,
    NumberOfBytes: DWORD,
    DeviceNumber: BYTE,
    ReadRequest: BOOLEAN,
};

pub const PDISK_RECORD = ?*DISK_RECORD;
pub const DISK_LOGGING = extern struct {
    Function: BYTE,
    BufferAddress: PVOID,
    BufferSize: DWORD,
};

pub const PDISK_LOGGING = ?*DISK_LOGGING;
pub const RequestSize = BIN_TYPES.RequestSize;
pub const RequestLocation = BIN_TYPES.RequestLocation;
pub const BIN_TYPES = extern enum {
    RequestSize,
    RequestLocation,
};

pub const BIN_RANGE = extern struct {
    StartValue: LARGE_INTEGER,
    Length: LARGE_INTEGER,
};

pub const PBIN_RANGE = ?*BIN_RANGE;
pub const PERF_BIN = extern struct {
    NumberOfBins: DWORD,
    TypeOfBin: DWORD,
    BinsRanges: [1]BIN_RANGE,
};

pub const PPERF_BIN = ?*PERF_BIN;
pub const BIN_COUNT = extern struct {
    BinRange: BIN_RANGE,
    BinCount: DWORD,
};

pub const PBIN_COUNT = ?*BIN_COUNT;
pub const BIN_RESULTS = extern struct {
    NumberOfBins: DWORD,
    BinCounts: [1]BIN_COUNT,
};

pub const PBIN_RESULTS = ?*BIN_RESULTS;
pub const GETVERSIONINPARAMS = extern struct {
    bVersion: BYTE,
    bRevision: BYTE,
    bReserved: BYTE,
    bIDEDeviceMap: BYTE,
    fCapabilities: DWORD,
    dwReserved: [4]DWORD,
};

pub const PGETVERSIONINPARAMS = ?*GETVERSIONINPARAMS;
pub const LPGETVERSIONINPARAMS = ?*GETVERSIONINPARAMS;
pub const IDEREGS = extern struct {
    bFeaturesReg: BYTE,
    bSectorCountReg: BYTE,
    bSectorNumberReg: BYTE,
    bCylLowReg: BYTE,
    bCylHighReg: BYTE,
    bDriveHeadReg: BYTE,
    bCommandReg: BYTE,
    bReserved: BYTE,
};

pub const PIDEREGS = ?*IDEREGS;
pub const LPIDEREGS = ?*IDEREGS;
pub const SENDCMDINPARAMS = extern struct {
    cBufferSize: DWORD,
    irDriveRegs: IDEREGS,
    bDriveNumber: BYTE,
    bReserved: [3]BYTE,
    dwReserved: [4]DWORD,
    bBuffer: [1]BYTE,
};

pub const PSENDCMDINPARAMS = ?*SENDCMDINPARAMS;
pub const LPSENDCMDINPARAMS = ?*SENDCMDINPARAMS;
pub const DRIVERSTATUS = extern struct {
    bDriverError: BYTE,
    bIDEError: BYTE,
    bReserved: [2]BYTE,
    dwReserved: [2]DWORD,
};

pub const PDRIVERSTATUS = ?*DRIVERSTATUS;
pub const LPDRIVERSTATUS = ?*DRIVERSTATUS;
pub const SENDCMDOUTPARAMS = extern struct {
    cBufferSize: DWORD,
    DriverStatus: DRIVERSTATUS,
    bBuffer: [1]BYTE,
};

pub const PSENDCMDOUTPARAMS = ?*SENDCMDOUTPARAMS;
pub const LPSENDCMDOUTPARAMS = ?*SENDCMDOUTPARAMS;
pub const GET_DISK_ATTRIBUTES = extern struct {
    Version: DWORD,
    Reserved1: DWORD,
    Attributes: DWORDLONG,
};

pub const PGET_DISK_ATTRIBUTES = ?*GET_DISK_ATTRIBUTES;
pub const SET_DISK_ATTRIBUTES = extern struct {
    Version: DWORD,
    Persist: BOOLEAN,
    Reserved1: [3]BYTE,
    Attributes: DWORDLONG,
    AttributesMask: DWORDLONG,
    Reserved2: [4]DWORD,
};

pub const PSET_DISK_ATTRIBUTES = ?*SET_DISK_ATTRIBUTES;
pub const AllElements = ELEMENT_TYPE.AllElements;
pub const ChangerTransport = ELEMENT_TYPE.ChangerTransport;
pub const ChangerSlot = ELEMENT_TYPE.ChangerSlot;
pub const ChangerIEPort = ELEMENT_TYPE.ChangerIEPort;
pub const ChangerDrive = ELEMENT_TYPE.ChangerDrive;
pub const ChangerDoor = ELEMENT_TYPE.ChangerDoor;
pub const ChangerKeypad = ELEMENT_TYPE.ChangerKeypad;
pub const ChangerMaxElement = ELEMENT_TYPE.ChangerMaxElement;
pub const ELEMENT_TYPE = extern enum {
    AllElements,
    ChangerTransport,
    ChangerSlot,
    ChangerIEPort,
    ChangerDrive,
    ChangerDoor,
    ChangerKeypad,
    ChangerMaxElement,
};

pub const PELEMENT_TYPE = ?*ELEMENT_TYPE;
pub const CHANGER_ELEMENT = extern struct {
    ElementType: ELEMENT_TYPE,
    ElementAddress: DWORD,
};

pub const PCHANGER_ELEMENT = ?*CHANGER_ELEMENT;
pub const CHANGER_ELEMENT_LIST = extern struct {
    Element: CHANGER_ELEMENT,
    NumberOfElements: DWORD,
};

pub const PCHANGER_ELEMENT_LIST = ?*CHANGER_ELEMENT_LIST;
pub const GET_CHANGER_PARAMETERS = extern struct {
    Size: DWORD,
    NumberTransportElements: WORD,
    NumberStorageElements: WORD,
    NumberCleanerSlots: WORD,
    NumberIEElements: WORD,
    NumberDataTransferElements: WORD,
    NumberOfDoors: WORD,
    FirstSlotNumber: WORD,
    FirstDriveNumber: WORD,
    FirstTransportNumber: WORD,
    FirstIEPortNumber: WORD,
    FirstCleanerSlotAddress: WORD,
    MagazineSize: WORD,
    DriveCleanTimeout: DWORD,
    Features0: DWORD,
    Features1: DWORD,
    MoveFromTransport: BYTE,
    MoveFromSlot: BYTE,
    MoveFromIePort: BYTE,
    MoveFromDrive: BYTE,
    ExchangeFromTransport: BYTE,
    ExchangeFromSlot: BYTE,
    ExchangeFromIePort: BYTE,
    ExchangeFromDrive: BYTE,
    LockUnlockCapabilities: BYTE,
    PositionCapabilities: BYTE,
    Reserved1: [2]BYTE,
    Reserved2: [2]DWORD,
};

pub const PGET_CHANGER_PARAMETERS = ?*GET_CHANGER_PARAMETERS;
pub const CHANGER_PRODUCT_DATA = extern struct {
    VendorId: [8]BYTE,
    ProductId: [16]BYTE,
    Revision: [4]BYTE,
    SerialNumber: [32]BYTE,
    DeviceType: BYTE,
};

pub const PCHANGER_PRODUCT_DATA = ?*CHANGER_PRODUCT_DATA;
pub const CHANGER_SET_ACCESS = extern struct {
    Element: CHANGER_ELEMENT,
    Control: DWORD,
};

pub const PCHANGER_SET_ACCESS = ?*CHANGER_SET_ACCESS;
pub const CHANGER_READ_ELEMENT_STATUS = extern struct {
    ElementList: CHANGER_ELEMENT_LIST,
    VolumeTagInfo: BOOLEAN,
};

pub const PCHANGER_READ_ELEMENT_STATUS = ?*CHANGER_READ_ELEMENT_STATUS;
pub const CHANGER_ELEMENT_STATUS = extern struct {
    Element: CHANGER_ELEMENT,
    SrcElementAddress: CHANGER_ELEMENT,
    Flags: DWORD,
    ExceptionCode: DWORD,
    TargetId: BYTE,
    Lun: BYTE,
    Reserved: WORD,
    PrimaryVolumeID: [36]BYTE,
    AlternateVolumeID: [36]BYTE,
};

pub const PCHANGER_ELEMENT_STATUS = ?*CHANGER_ELEMENT_STATUS;
pub const CHANGER_ELEMENT_STATUS_EX = extern struct {
    Element: CHANGER_ELEMENT,
    SrcElementAddress: CHANGER_ELEMENT,
    Flags: DWORD,
    ExceptionCode: DWORD,
    TargetId: BYTE,
    Lun: BYTE,
    Reserved: WORD,
    PrimaryVolumeID: [36]BYTE,
    AlternateVolumeID: [36]BYTE,
    VendorIdentification: [8]BYTE,
    ProductIdentification: [16]BYTE,
    SerialNumber: [32]BYTE,
};

pub const PCHANGER_ELEMENT_STATUS_EX = ?*CHANGER_ELEMENT_STATUS_EX;
pub const CHANGER_INITIALIZE_ELEMENT_STATUS = extern struct {
    ElementList: CHANGER_ELEMENT_LIST,
    BarCodeScan: BOOLEAN,
};

pub const PCHANGER_INITIALIZE_ELEMENT_STATUS = ?*CHANGER_INITIALIZE_ELEMENT_STATUS;
pub const CHANGER_SET_POSITION = extern struct {
    Transport: CHANGER_ELEMENT,
    Destination: CHANGER_ELEMENT,
    Flip: BOOLEAN,
};

pub const PCHANGER_SET_POSITION = ?*CHANGER_SET_POSITION;
pub const CHANGER_EXCHANGE_MEDIUM = extern struct {
    Transport: CHANGER_ELEMENT,
    Source: CHANGER_ELEMENT,
    Destination1: CHANGER_ELEMENT,
    Destination2: CHANGER_ELEMENT,
    Flip1: BOOLEAN,
    Flip2: BOOLEAN,
};

pub const PCHANGER_EXCHANGE_MEDIUM = ?*CHANGER_EXCHANGE_MEDIUM;
pub const CHANGER_MOVE_MEDIUM = extern struct {
    Transport: CHANGER_ELEMENT,
    Source: CHANGER_ELEMENT,
    Destination: CHANGER_ELEMENT,
    Flip: BOOLEAN,
};

pub const PCHANGER_MOVE_MEDIUM = ?*CHANGER_MOVE_MEDIUM;
pub const CHANGER_SEND_VOLUME_TAG_INFORMATION = extern struct {
    StartingElement: CHANGER_ELEMENT,
    ActionCode: DWORD,
    VolumeIDTemplate: [40]BYTE,
};

pub const PCHANGER_SEND_VOLUME_TAG_INFORMATION = ?*CHANGER_SEND_VOLUME_TAG_INFORMATION;
pub const READ_ELEMENT_ADDRESS_INFO = extern struct {
    NumberOfElements: DWORD,
    ElementStatus: [1]CHANGER_ELEMENT_STATUS,
};

pub const PREAD_ELEMENT_ADDRESS_INFO = ?*READ_ELEMENT_ADDRESS_INFO;
pub const DeviceProblemNone = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemNone;
pub const DeviceProblemHardware = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemHardware;
pub const DeviceProblemCHMError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemCHMError;
pub const DeviceProblemDoorOpen = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemDoorOpen;
pub const DeviceProblemCalibrationError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemCalibrationError;
pub const DeviceProblemTargetFailure = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemTargetFailure;
pub const DeviceProblemCHMMoveError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemCHMMoveError;
pub const DeviceProblemCHMZeroError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemCHMZeroError;
pub const DeviceProblemCartridgeInsertError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemCartridgeInsertError;
pub const DeviceProblemPositionError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemPositionError;
pub const DeviceProblemSensorError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemSensorError;
pub const DeviceProblemCartridgeEjectError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemCartridgeEjectError;
pub const DeviceProblemGripperError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemGripperError;
pub const DeviceProblemDriveError = CHANGER_DEVICE_PROBLEM_TYPE.DeviceProblemDriveError;
pub const CHANGER_DEVICE_PROBLEM_TYPE = extern enum {
    DeviceProblemNone,
    DeviceProblemHardware,
    DeviceProblemCHMError,
    DeviceProblemDoorOpen,
    DeviceProblemCalibrationError,
    DeviceProblemTargetFailure,
    DeviceProblemCHMMoveError,
    DeviceProblemCHMZeroError,
    DeviceProblemCartridgeInsertError,
    DeviceProblemPositionError,
    DeviceProblemSensorError,
    DeviceProblemCartridgeEjectError,
    DeviceProblemGripperError,
    DeviceProblemDriveError,
};

pub const PCHANGER_DEVICE_PROBLEM_TYPE = ?*CHANGER_DEVICE_PROBLEM_TYPE;
pub const PATHNAME_BUFFER = extern struct {
    PathNameLength: DWORD,
    Name: [1]WCHAR,
};

pub const PPATHNAME_BUFFER = ?*PATHNAME_BUFFER;
pub const FSCTL_QUERY_FAT_BPB_BUFFER = extern struct {
    First0x24BytesOfBootSector: [36]BYTE,
};

pub const PFSCTL_QUERY_FAT_BPB_BUFFER = ?*FSCTL_QUERY_FAT_BPB_BUFFER;
pub const NTFS_VOLUME_DATA_BUFFER = extern struct {
    VolumeSerialNumber: LARGE_INTEGER,
    NumberSectors: LARGE_INTEGER,
    TotalClusters: LARGE_INTEGER,
    FreeClusters: LARGE_INTEGER,
    TotalReserved: LARGE_INTEGER,
    BytesPerSector: DWORD,
    BytesPerCluster: DWORD,
    BytesPerFileRecordSegment: DWORD,
    ClustersPerFileRecordSegment: DWORD,
    MftValidDataLength: LARGE_INTEGER,
    MftStartLcn: LARGE_INTEGER,
    Mft2StartLcn: LARGE_INTEGER,
    MftZoneStart: LARGE_INTEGER,
    MftZoneEnd: LARGE_INTEGER,
};
pub const PNTFS_VOLUME_DATA_BUFFER = ?*extern struct {
    VolumeSerialNumber: LARGE_INTEGER,
    NumberSectors: LARGE_INTEGER,
    TotalClusters: LARGE_INTEGER,
    FreeClusters: LARGE_INTEGER,
    TotalReserved: LARGE_INTEGER,
    BytesPerSector: DWORD,
    BytesPerCluster: DWORD,
    BytesPerFileRecordSegment: DWORD,
    ClustersPerFileRecordSegment: DWORD,
    MftValidDataLength: LARGE_INTEGER,
    MftStartLcn: LARGE_INTEGER,
    Mft2StartLcn: LARGE_INTEGER,
    MftZoneStart: LARGE_INTEGER,
    MftZoneEnd: LARGE_INTEGER,
};
pub const NTFS_EXTENDED_VOLUME_DATA = extern struct {
    ByteCount: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    BytesPerPhysicalSector: DWORD,
    LfsMajorVersion: WORD,
    LfsMinorVersion: WORD,
    MaxDeviceTrimExtentCount: DWORD,
    MaxDeviceTrimByteCount: DWORD,
    MaxVolumeTrimExtentCount: DWORD,
    MaxVolumeTrimByteCount: DWORD,
};
pub const PNTFS_EXTENDED_VOLUME_DATA = ?*extern struct {
    ByteCount: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    BytesPerPhysicalSector: DWORD,
    LfsMajorVersion: WORD,
    LfsMinorVersion: WORD,
    MaxDeviceTrimExtentCount: DWORD,
    MaxDeviceTrimByteCount: DWORD,
    MaxVolumeTrimExtentCount: DWORD,
    MaxVolumeTrimByteCount: DWORD,
};
pub const REFS_VOLUME_DATA_BUFFER = extern struct {
    ByteCount: DWORD,
    MajorVersion: DWORD,
    MinorVersion: DWORD,
    BytesPerPhysicalSector: DWORD,
    VolumeSerialNumber: LARGE_INTEGER,
    NumberSectors: LARGE_INTEGER,
    TotalClusters: LARGE_INTEGER,
    FreeClusters: LARGE_INTEGER,
    TotalReserved: LARGE_INTEGER,
    BytesPerSector: DWORD,
    BytesPerCluster: DWORD,
    MaximumSizeOfResidentFile: LARGE_INTEGER,
    Reserved: [10]LARGE_INTEGER,
};
pub const PREFS_VOLUME_DATA_BUFFER = ?*extern struct {
    ByteCount: DWORD,
    MajorVersion: DWORD,
    MinorVersion: DWORD,
    BytesPerPhysicalSector: DWORD,
    VolumeSerialNumber: LARGE_INTEGER,
    NumberSectors: LARGE_INTEGER,
    TotalClusters: LARGE_INTEGER,
    FreeClusters: LARGE_INTEGER,
    TotalReserved: LARGE_INTEGER,
    BytesPerSector: DWORD,
    BytesPerCluster: DWORD,
    MaximumSizeOfResidentFile: LARGE_INTEGER,
    Reserved: [10]LARGE_INTEGER,
};
pub const STARTING_LCN_INPUT_BUFFER = extern struct {
    StartingLcn: LARGE_INTEGER,
};
pub const PSTARTING_LCN_INPUT_BUFFER = ?*extern struct {
    StartingLcn: LARGE_INTEGER,
};
pub const STARTING_LCN_INPUT_BUFFER_EX = extern struct {
    StartingLcn: LARGE_INTEGER,
    Flags: DWORD,
};
pub const PSTARTING_LCN_INPUT_BUFFER_EX = ?*extern struct {
    StartingLcn: LARGE_INTEGER,
    Flags: DWORD,
};
pub const VOLUME_BITMAP_BUFFER = extern struct {
    StartingLcn: LARGE_INTEGER,
    BitmapSize: LARGE_INTEGER,
    Buffer: [1]BYTE,
};
pub const PVOLUME_BITMAP_BUFFER = ?*extern struct {
    StartingLcn: LARGE_INTEGER,
    BitmapSize: LARGE_INTEGER,
    Buffer: [1]BYTE,
};
pub const STARTING_VCN_INPUT_BUFFER = extern struct {
    StartingVcn: LARGE_INTEGER,
};
pub const PSTARTING_VCN_INPUT_BUFFER = ?*extern struct {
    StartingVcn: LARGE_INTEGER,
};
pub const RETRIEVAL_POINTERS_BUFFER = extern struct {
    ExtentCount: DWORD,
    StartingVcn: LARGE_INTEGER,
    Extents: [1]extern struct {
        NextVcn: LARGE_INTEGER,
        Lcn: LARGE_INTEGER,
    },
};

pub const PRETRIEVAL_POINTERS_BUFFER = ?*RETRIEVAL_POINTERS_BUFFER;
pub const RETRIEVAL_POINTERS_AND_REFCOUNT_BUFFER = extern struct {
    ExtentCount: DWORD,
    StartingVcn: LARGE_INTEGER,
    Extents: [1]extern struct {
        NextVcn: LARGE_INTEGER,
        Lcn: LARGE_INTEGER,
        ReferenceCount: DWORD,
    },
};

pub const PRETRIEVAL_POINTERS_AND_REFCOUNT_BUFFER = ?*RETRIEVAL_POINTERS_AND_REFCOUNT_BUFFER;
pub const NTFS_FILE_RECORD_INPUT_BUFFER = extern struct {
    FileReferenceNumber: LARGE_INTEGER,
};
pub const PNTFS_FILE_RECORD_INPUT_BUFFER = ?*extern struct {
    FileReferenceNumber: LARGE_INTEGER,
};
pub const NTFS_FILE_RECORD_OUTPUT_BUFFER = extern struct {
    FileReferenceNumber: LARGE_INTEGER,
    FileRecordLength: DWORD,
    FileRecordBuffer: [1]BYTE,
};
pub const PNTFS_FILE_RECORD_OUTPUT_BUFFER = ?*extern struct {
    FileReferenceNumber: LARGE_INTEGER,
    FileRecordLength: DWORD,
    FileRecordBuffer: [1]BYTE,
};
pub const MOVE_FILE_DATA = extern struct {
    FileHandle: HANDLE,
    StartingVcn: LARGE_INTEGER,
    StartingLcn: LARGE_INTEGER,
    ClusterCount: DWORD,
};
pub const PMOVE_FILE_DATA = ?*extern struct {
    FileHandle: HANDLE,
    StartingVcn: LARGE_INTEGER,
    StartingLcn: LARGE_INTEGER,
    ClusterCount: DWORD,
};
pub const MOVE_FILE_RECORD_DATA = extern struct {
    FileHandle: HANDLE,
    SourceFileRecord: LARGE_INTEGER,
    TargetFileRecord: LARGE_INTEGER,
};
pub const PMOVE_FILE_RECORD_DATA = ?*extern struct {
    FileHandle: HANDLE,
    SourceFileRecord: LARGE_INTEGER,
    TargetFileRecord: LARGE_INTEGER,
};
pub const MOVE_FILE_DATA32 = extern struct {
    FileHandle: UINT32,
    StartingVcn: LARGE_INTEGER,
    StartingLcn: LARGE_INTEGER,
    ClusterCount: DWORD,
};

pub const PMOVE_FILE_DATA32 = ?*MOVE_FILE_DATA32;
pub const FIND_BY_SID_DATA = extern struct {
    Restart: DWORD,
    Sid: SID,
};
pub const PFIND_BY_SID_DATA = ?*extern struct {
    Restart: DWORD,
    Sid: SID,
};
pub const FIND_BY_SID_OUTPUT = extern struct {
    NextEntryOffset: DWORD,
    FileIndex: DWORD,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};
pub const PFIND_BY_SID_OUTPUT = ?*extern struct {
    NextEntryOffset: DWORD,
    FileIndex: DWORD,
    FileNameLength: DWORD,
    FileName: [1]WCHAR,
};
pub const MFT_ENUM_DATA_V0 = extern struct {
    StartFileReferenceNumber: DWORDLONG,
    LowUsn: USN,
    HighUsn: USN,
};
pub const PMFT_ENUM_DATA_V0 = ?*extern struct {
    StartFileReferenceNumber: DWORDLONG,
    LowUsn: USN,
    HighUsn: USN,
};
pub const MFT_ENUM_DATA_V1 = extern struct {
    StartFileReferenceNumber: DWORDLONG,
    LowUsn: USN,
    HighUsn: USN,
    MinMajorVersion: WORD,
    MaxMajorVersion: WORD,
};
pub const PMFT_ENUM_DATA_V1 = ?*extern struct {
    StartFileReferenceNumber: DWORDLONG,
    LowUsn: USN,
    HighUsn: USN,
    MinMajorVersion: WORD,
    MaxMajorVersion: WORD,
};
pub const MFT_ENUM_DATA = MFT_ENUM_DATA_V1;
pub const PMFT_ENUM_DATA = ?*MFT_ENUM_DATA_V1;
pub const CREATE_USN_JOURNAL_DATA = extern struct {
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
};
pub const PCREATE_USN_JOURNAL_DATA = ?*extern struct {
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
};
pub const READ_FILE_USN_DATA = extern struct {
    MinMajorVersion: WORD,
    MaxMajorVersion: WORD,
};
pub const PREAD_FILE_USN_DATA = ?*extern struct {
    MinMajorVersion: WORD,
    MaxMajorVersion: WORD,
};
pub const READ_USN_JOURNAL_DATA_V0 = extern struct {
    StartUsn: USN,
    ReasonMask: DWORD,
    ReturnOnlyOnClose: DWORD,
    Timeout: DWORDLONG,
    BytesToWaitFor: DWORDLONG,
    UsnJournalID: DWORDLONG,
};
pub const PREAD_USN_JOURNAL_DATA_V0 = ?*extern struct {
    StartUsn: USN,
    ReasonMask: DWORD,
    ReturnOnlyOnClose: DWORD,
    Timeout: DWORDLONG,
    BytesToWaitFor: DWORDLONG,
    UsnJournalID: DWORDLONG,
};
pub const READ_USN_JOURNAL_DATA_V1 = extern struct {
    StartUsn: USN,
    ReasonMask: DWORD,
    ReturnOnlyOnClose: DWORD,
    Timeout: DWORDLONG,
    BytesToWaitFor: DWORDLONG,
    UsnJournalID: DWORDLONG,
    MinMajorVersion: WORD,
    MaxMajorVersion: WORD,
};
pub const PREAD_USN_JOURNAL_DATA_V1 = ?*extern struct {
    StartUsn: USN,
    ReasonMask: DWORD,
    ReturnOnlyOnClose: DWORD,
    Timeout: DWORDLONG,
    BytesToWaitFor: DWORDLONG,
    UsnJournalID: DWORDLONG,
    MinMajorVersion: WORD,
    MaxMajorVersion: WORD,
};
pub const READ_USN_JOURNAL_DATA = READ_USN_JOURNAL_DATA_V1;
pub const PREAD_USN_JOURNAL_DATA = ?*READ_USN_JOURNAL_DATA_V1;
pub const USN_TRACK_MODIFIED_RANGES = extern struct {
    Flags: DWORD,
    Unused: DWORD,
    ChunkSize: DWORDLONG,
    FileSizeThreshold: LONGLONG,
};
pub const PUSN_TRACK_MODIFIED_RANGES = ?*extern struct {
    Flags: DWORD,
    Unused: DWORD,
    ChunkSize: DWORDLONG,
    FileSizeThreshold: LONGLONG,
};
pub const USN_RANGE_TRACK_OUTPUT = extern struct {
    Usn: USN,
};
pub const PUSN_RANGE_TRACK_OUTPUT = ?*extern struct {
    Usn: USN,
};
pub const USN_RECORD_V2 = extern struct {
    RecordLength: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    FileReferenceNumber: DWORDLONG,
    ParentFileReferenceNumber: DWORDLONG,
    Usn: USN,
    TimeStamp: LARGE_INTEGER,
    Reason: DWORD,
    SourceInfo: DWORD,
    SecurityId: DWORD,
    FileAttributes: DWORD,
    FileNameLength: WORD,
    FileNameOffset: WORD,
    FileName: [1]WCHAR,
};
pub const PUSN_RECORD_V2 = ?*extern struct {
    RecordLength: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    FileReferenceNumber: DWORDLONG,
    ParentFileReferenceNumber: DWORDLONG,
    Usn: USN,
    TimeStamp: LARGE_INTEGER,
    Reason: DWORD,
    SourceInfo: DWORD,
    SecurityId: DWORD,
    FileAttributes: DWORD,
    FileNameLength: WORD,
    FileNameOffset: WORD,
    FileName: [1]WCHAR,
};
pub const USN_RECORD_V3 = extern struct {
    RecordLength: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    FileReferenceNumber: FILE_ID_128,
    ParentFileReferenceNumber: FILE_ID_128,
    Usn: USN,
    TimeStamp: LARGE_INTEGER,
    Reason: DWORD,
    SourceInfo: DWORD,
    SecurityId: DWORD,
    FileAttributes: DWORD,
    FileNameLength: WORD,
    FileNameOffset: WORD,
    FileName: [1]WCHAR,
};
pub const PUSN_RECORD_V3 = ?*extern struct {
    RecordLength: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
    FileReferenceNumber: FILE_ID_128,
    ParentFileReferenceNumber: FILE_ID_128,
    Usn: USN,
    TimeStamp: LARGE_INTEGER,
    Reason: DWORD,
    SourceInfo: DWORD,
    SecurityId: DWORD,
    FileAttributes: DWORD,
    FileNameLength: WORD,
    FileNameOffset: WORD,
    FileName: [1]WCHAR,
};
pub const USN_RECORD = USN_RECORD_V2;
pub const PUSN_RECORD = ?*USN_RECORD_V2;
pub const USN_RECORD_COMMON_HEADER = extern struct {
    RecordLength: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
};
pub const PUSN_RECORD_COMMON_HEADER = ?*extern struct {
    RecordLength: DWORD,
    MajorVersion: WORD,
    MinorVersion: WORD,
};
pub const USN_RECORD_EXTENT = extern struct {
    Offset: LONGLONG,
    Length: LONGLONG,
};
pub const PUSN_RECORD_EXTENT = ?*extern struct {
    Offset: LONGLONG,
    Length: LONGLONG,
};
pub const USN_RECORD_V4 = extern struct {
    Header: USN_RECORD_COMMON_HEADER,
    FileReferenceNumber: FILE_ID_128,
    ParentFileReferenceNumber: FILE_ID_128,
    Usn: USN,
    Reason: DWORD,
    SourceInfo: DWORD,
    RemainingExtents: DWORD,
    NumberOfExtents: WORD,
    ExtentSize: WORD,
    Extents: [1]USN_RECORD_EXTENT,
};
pub const PUSN_RECORD_V4 = ?*extern struct {
    Header: USN_RECORD_COMMON_HEADER,
    FileReferenceNumber: FILE_ID_128,
    ParentFileReferenceNumber: FILE_ID_128,
    Usn: USN,
    Reason: DWORD,
    SourceInfo: DWORD,
    RemainingExtents: DWORD,
    NumberOfExtents: WORD,
    ExtentSize: WORD,
    Extents: [1]USN_RECORD_EXTENT,
};
pub const USN_RECORD_UNION = extern union {
    Header: USN_RECORD_COMMON_HEADER,
    V2: USN_RECORD_V2,
    V3: USN_RECORD_V3,
    V4: USN_RECORD_V4,
};
pub const PUSN_RECORD_UNION = ?*extern union {
    Header: USN_RECORD_COMMON_HEADER,
    V2: USN_RECORD_V2,
    V3: USN_RECORD_V3,
    V4: USN_RECORD_V4,
};
pub const USN_JOURNAL_DATA_V0 = extern struct {
    UsnJournalID: DWORDLONG,
    FirstUsn: USN,
    NextUsn: USN,
    LowestValidUsn: USN,
    MaxUsn: USN,
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
};
pub const PUSN_JOURNAL_DATA_V0 = ?*extern struct {
    UsnJournalID: DWORDLONG,
    FirstUsn: USN,
    NextUsn: USN,
    LowestValidUsn: USN,
    MaxUsn: USN,
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
};
pub const USN_JOURNAL_DATA_V1 = extern struct {
    UsnJournalID: DWORDLONG,
    FirstUsn: USN,
    NextUsn: USN,
    LowestValidUsn: USN,
    MaxUsn: USN,
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
    MinSupportedMajorVersion: WORD,
    MaxSupportedMajorVersion: WORD,
};
pub const PUSN_JOURNAL_DATA_V1 = ?*extern struct {
    UsnJournalID: DWORDLONG,
    FirstUsn: USN,
    NextUsn: USN,
    LowestValidUsn: USN,
    MaxUsn: USN,
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
    MinSupportedMajorVersion: WORD,
    MaxSupportedMajorVersion: WORD,
};
pub const USN_JOURNAL_DATA_V2 = extern struct {
    UsnJournalID: DWORDLONG,
    FirstUsn: USN,
    NextUsn: USN,
    LowestValidUsn: USN,
    MaxUsn: USN,
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
    MinSupportedMajorVersion: WORD,
    MaxSupportedMajorVersion: WORD,
    Flags: DWORD,
    RangeTrackChunkSize: DWORDLONG,
    RangeTrackFileSizeThreshold: LONGLONG,
};
pub const PUSN_JOURNAL_DATA_V2 = ?*extern struct {
    UsnJournalID: DWORDLONG,
    FirstUsn: USN,
    NextUsn: USN,
    LowestValidUsn: USN,
    MaxUsn: USN,
    MaximumSize: DWORDLONG,
    AllocationDelta: DWORDLONG,
    MinSupportedMajorVersion: WORD,
    MaxSupportedMajorVersion: WORD,
    Flags: DWORD,
    RangeTrackChunkSize: DWORDLONG,
    RangeTrackFileSizeThreshold: LONGLONG,
};
pub const USN_JOURNAL_DATA = USN_JOURNAL_DATA_V1;
pub const PUSN_JOURNAL_DATA = ?*USN_JOURNAL_DATA_V1;
pub const DELETE_USN_JOURNAL_DATA = extern struct {
    UsnJournalID: DWORDLONG,
    DeleteFlags: DWORD,
};
pub const PDELETE_USN_JOURNAL_DATA = ?*extern struct {
    UsnJournalID: DWORDLONG,
    DeleteFlags: DWORD,
};
pub const MARK_HANDLE_INFO = extern struct {
    u: extern union {
        UsnSourceInfo: DWORD,
        CopyNumber: DWORD,
    },
    VolumeHandle: HANDLE,
    HandleInfo: DWORD,
};
pub const PMARK_HANDLE_INFO = ?*extern struct {
    u: extern union {
        UsnSourceInfo: DWORD,
        CopyNumber: DWORD,
    },
    VolumeHandle: HANDLE,
    HandleInfo: DWORD,
};
pub const MARK_HANDLE_INFO32 = extern struct {
    u: extern union {
        UsnSourceInfo: DWORD,
        CopyNumber: DWORD,
    },
    VolumeHandle: UINT32,
    HandleInfo: DWORD,
};
pub const PMARK_HANDLE_INFO32 = ?*extern struct {
    u: extern union {
        UsnSourceInfo: DWORD,
        CopyNumber: DWORD,
    },
    VolumeHandle: UINT32,
    HandleInfo: DWORD,
};
pub const BULK_SECURITY_TEST_DATA = extern struct {
    DesiredAccess: ACCESS_MASK,
    SecurityIds: [1]DWORD,
};
pub const PBULK_SECURITY_TEST_DATA = ?*extern struct {
    DesiredAccess: ACCESS_MASK,
    SecurityIds: [1]DWORD,
};
pub const FILE_PREFETCH = extern struct {
    Type: DWORD,
    Count: DWORD,
    Prefetch: [1]DWORDLONG,
};

pub const PFILE_PREFETCH = ?*FILE_PREFETCH;
pub const FILE_PREFETCH_EX = extern struct {
    Type: DWORD,
    Count: DWORD,
    Context: PVOID,
    Prefetch: [1]DWORDLONG,
};

pub const PFILE_PREFETCH_EX = ?*FILE_PREFETCH_EX;
pub const FILESYSTEM_STATISTICS = extern struct {
    FileSystemType: WORD,
    Version: WORD,
    SizeOfCompleteStructure: DWORD,
    UserFileReads: DWORD,
    UserFileReadBytes: DWORD,
    UserDiskReads: DWORD,
    UserFileWrites: DWORD,
    UserFileWriteBytes: DWORD,
    UserDiskWrites: DWORD,
    MetaDataReads: DWORD,
    MetaDataReadBytes: DWORD,
    MetaDataDiskReads: DWORD,
    MetaDataWrites: DWORD,
    MetaDataWriteBytes: DWORD,
    MetaDataDiskWrites: DWORD,
};

pub const PFILESYSTEM_STATISTICS = ?*FILESYSTEM_STATISTICS;
pub const FAT_STATISTICS = extern struct {
    CreateHits: DWORD,
    SuccessfulCreates: DWORD,
    FailedCreates: DWORD,
    NonCachedReads: DWORD,
    NonCachedReadBytes: DWORD,
    NonCachedWrites: DWORD,
    NonCachedWriteBytes: DWORD,
    NonCachedDiskReads: DWORD,
    NonCachedDiskWrites: DWORD,
};

pub const PFAT_STATISTICS = ?*FAT_STATISTICS;
pub const EXFAT_STATISTICS = extern struct {
    CreateHits: DWORD,
    SuccessfulCreates: DWORD,
    FailedCreates: DWORD,
    NonCachedReads: DWORD,
    NonCachedReadBytes: DWORD,
    NonCachedWrites: DWORD,
    NonCachedWriteBytes: DWORD,
    NonCachedDiskReads: DWORD,
    NonCachedDiskWrites: DWORD,
};

pub const PEXFAT_STATISTICS = ?*EXFAT_STATISTICS;
pub const NTFS_STATISTICS = extern struct {
    LogFileFullExceptions: DWORD,
    OtherExceptions: DWORD,
    MftReads: DWORD,
    MftReadBytes: DWORD,
    MftWrites: DWORD,
    MftWriteBytes: DWORD,
    MftWritesUserLevel: extern struct {
        Write: WORD,
        Create: WORD,
        SetInfo: WORD,
        Flush: WORD,
    },
    MftWritesFlushForLogFileFull: WORD,
    MftWritesLazyWriter: WORD,
    MftWritesUserRequest: WORD,
    Mft2Writes: DWORD,
    Mft2WriteBytes: DWORD,
    Mft2WritesUserLevel: extern struct {
        Write: WORD,
        Create: WORD,
        SetInfo: WORD,
        Flush: WORD,
    },
    Mft2WritesFlushForLogFileFull: WORD,
    Mft2WritesLazyWriter: WORD,
    Mft2WritesUserRequest: WORD,
    RootIndexReads: DWORD,
    RootIndexReadBytes: DWORD,
    RootIndexWrites: DWORD,
    RootIndexWriteBytes: DWORD,
    BitmapReads: DWORD,
    BitmapReadBytes: DWORD,
    BitmapWrites: DWORD,
    BitmapWriteBytes: DWORD,
    BitmapWritesFlushForLogFileFull: WORD,
    BitmapWritesLazyWriter: WORD,
    BitmapWritesUserRequest: WORD,
    BitmapWritesUserLevel: extern struct {
        Write: WORD,
        Create: WORD,
        SetInfo: WORD,
    },
    MftBitmapReads: DWORD,
    MftBitmapReadBytes: DWORD,
    MftBitmapWrites: DWORD,
    MftBitmapWriteBytes: DWORD,
    MftBitmapWritesFlushForLogFileFull: WORD,
    MftBitmapWritesLazyWriter: WORD,
    MftBitmapWritesUserRequest: WORD,
    MftBitmapWritesUserLevel: extern struct {
        Write: WORD,
        Create: WORD,
        SetInfo: WORD,
        Flush: WORD,
    },
    UserIndexReads: DWORD,
    UserIndexReadBytes: DWORD,
    UserIndexWrites: DWORD,
    UserIndexWriteBytes: DWORD,
    LogFileReads: DWORD,
    LogFileReadBytes: DWORD,
    LogFileWrites: DWORD,
    LogFileWriteBytes: DWORD,
    Allocate: extern struct {
        Calls: DWORD,
        Clusters: DWORD,
        Hints: DWORD,
        RunsReturned: DWORD,
        HintsHonored: DWORD,
        HintsClusters: DWORD,
        Cache: DWORD,
        CacheClusters: DWORD,
        CacheMiss: DWORD,
        CacheMissClusters: DWORD,
    },
    DiskResourcesExhausted: DWORD,
};

pub const PNTFS_STATISTICS = ?*NTFS_STATISTICS;
pub const FILESYSTEM_STATISTICS_EX = extern struct {
    FileSystemType: WORD,
    Version: WORD,
    SizeOfCompleteStructure: DWORD,
    UserFileReads: DWORDLONG,
    UserFileReadBytes: DWORDLONG,
    UserDiskReads: DWORDLONG,
    UserFileWrites: DWORDLONG,
    UserFileWriteBytes: DWORDLONG,
    UserDiskWrites: DWORDLONG,
    MetaDataReads: DWORDLONG,
    MetaDataReadBytes: DWORDLONG,
    MetaDataDiskReads: DWORDLONG,
    MetaDataWrites: DWORDLONG,
    MetaDataWriteBytes: DWORDLONG,
    MetaDataDiskWrites: DWORDLONG,
};

pub const PFILESYSTEM_STATISTICS_EX = ?*FILESYSTEM_STATISTICS_EX;
pub const NTFS_STATISTICS_EX = extern struct {
    LogFileFullExceptions: DWORD,
    OtherExceptions: DWORD,
    MftReads: DWORDLONG,
    MftReadBytes: DWORDLONG,
    MftWrites: DWORDLONG,
    MftWriteBytes: DWORDLONG,
    MftWritesUserLevel: extern struct {
        Write: DWORD,
        Create: DWORD,
        SetInfo: DWORD,
        Flush: DWORD,
    },
    MftWritesFlushForLogFileFull: DWORD,
    MftWritesLazyWriter: DWORD,
    MftWritesUserRequest: DWORD,
    Mft2Writes: DWORDLONG,
    Mft2WriteBytes: DWORDLONG,
    Mft2WritesUserLevel: extern struct {
        Write: DWORD,
        Create: DWORD,
        SetInfo: DWORD,
        Flush: DWORD,
    },
    Mft2WritesFlushForLogFileFull: DWORD,
    Mft2WritesLazyWriter: DWORD,
    Mft2WritesUserRequest: DWORD,
    RootIndexReads: DWORDLONG,
    RootIndexReadBytes: DWORDLONG,
    RootIndexWrites: DWORDLONG,
    RootIndexWriteBytes: DWORDLONG,
    BitmapReads: DWORDLONG,
    BitmapReadBytes: DWORDLONG,
    BitmapWrites: DWORDLONG,
    BitmapWriteBytes: DWORDLONG,
    BitmapWritesFlushForLogFileFull: DWORD,
    BitmapWritesLazyWriter: DWORD,
    BitmapWritesUserRequest: DWORD,
    BitmapWritesUserLevel: extern struct {
        Write: DWORD,
        Create: DWORD,
        SetInfo: DWORD,
        Flush: DWORD,
    },
    MftBitmapReads: DWORDLONG,
    MftBitmapReadBytes: DWORDLONG,
    MftBitmapWrites: DWORDLONG,
    MftBitmapWriteBytes: DWORDLONG,
    MftBitmapWritesFlushForLogFileFull: DWORD,
    MftBitmapWritesLazyWriter: DWORD,
    MftBitmapWritesUserRequest: DWORD,
    MftBitmapWritesUserLevel: extern struct {
        Write: DWORD,
        Create: DWORD,
        SetInfo: DWORD,
        Flush: DWORD,
    },
    UserIndexReads: DWORDLONG,
    UserIndexReadBytes: DWORDLONG,
    UserIndexWrites: DWORDLONG,
    UserIndexWriteBytes: DWORDLONG,
    LogFileReads: DWORDLONG,
    LogFileReadBytes: DWORDLONG,
    LogFileWrites: DWORDLONG,
    LogFileWriteBytes: DWORDLONG,
    Allocate: extern struct {
        Calls: DWORD,
        RunsReturned: DWORD,
        Hints: DWORD,
        HintsHonored: DWORD,
        Cache: DWORD,
        CacheMiss: DWORD,
        Clusters: DWORDLONG,
        HintsClusters: DWORDLONG,
        CacheClusters: DWORDLONG,
        CacheMissClusters: DWORDLONG,
    },
    DiskResourcesExhausted: DWORD,
    VolumeTrimCount: DWORDLONG,
    VolumeTrimTime: DWORDLONG,
    VolumeTrimByteCount: DWORDLONG,
    FileLevelTrimCount: DWORDLONG,
    FileLevelTrimTime: DWORDLONG,
    FileLevelTrimByteCount: DWORDLONG,
    VolumeTrimSkippedCount: DWORDLONG,
    VolumeTrimSkippedByteCount: DWORDLONG,
    NtfsFillStatInfoFromMftRecordCalledCount: DWORDLONG,
    NtfsFillStatInfoFromMftRecordBailedBecauseOfAttributeListCount: DWORDLONG,
    NtfsFillStatInfoFromMftRecordBailedBecauseOfNonResReparsePointCount: DWORDLONG,
};

pub const PNTFS_STATISTICS_EX = ?*NTFS_STATISTICS_EX;
pub const FILE_OBJECTID_BUFFER = extern struct {
    ObjectId: [16]BYTE,
    u: extern union {
        s: extern struct {
            BirthVolumeId: [16]BYTE,
            BirthObjectId: [16]BYTE,
            DomainId: [16]BYTE,
        },
        ExtendedInfo: [48]BYTE,
    },
};

pub const PFILE_OBJECTID_BUFFER = ?*FILE_OBJECTID_BUFFER;
pub const FILE_SET_SPARSE_BUFFER = extern struct {
    SetSparse: BOOLEAN,
};

pub const PFILE_SET_SPARSE_BUFFER = ?*FILE_SET_SPARSE_BUFFER;
pub const FILE_ZERO_DATA_INFORMATION = extern struct {
    FileOffset: LARGE_INTEGER,
    BeyondFinalZero: LARGE_INTEGER,
};

pub const PFILE_ZERO_DATA_INFORMATION = ?*FILE_ZERO_DATA_INFORMATION;
pub const FILE_ZERO_DATA_INFORMATION_EX = extern struct {
    FileOffset: LARGE_INTEGER,
    BeyondFinalZero: LARGE_INTEGER,
    Flags: DWORD,
};

pub const PFILE_ZERO_DATA_INFORMATION_EX = ?*FILE_ZERO_DATA_INFORMATION_EX;
pub const FILE_ALLOCATED_RANGE_BUFFER = extern struct {
    FileOffset: LARGE_INTEGER,
    Length: LARGE_INTEGER,
};

pub const PFILE_ALLOCATED_RANGE_BUFFER = ?*FILE_ALLOCATED_RANGE_BUFFER;
pub const ENCRYPTION_BUFFER = extern struct {
    EncryptionOperation: DWORD,
    Private: [1]BYTE,
};

pub const PENCRYPTION_BUFFER = ?*ENCRYPTION_BUFFER;
pub const DECRYPTION_STATUS_BUFFER = extern struct {
    NoEncryptedStreams: BOOLEAN,
};

pub const PDECRYPTION_STATUS_BUFFER = ?*DECRYPTION_STATUS_BUFFER;
pub const REQUEST_RAW_ENCRYPTED_DATA = extern struct {
    FileOffset: LONGLONG,
    Length: DWORD,
};

pub const PREQUEST_RAW_ENCRYPTED_DATA = ?*REQUEST_RAW_ENCRYPTED_DATA;
pub const ENCRYPTED_DATA_INFO = extern struct {
    StartingFileOffset: DWORDLONG,
    OutputBufferOffset: DWORD,
    BytesWithinFileSize: DWORD,
    BytesWithinValidDataLength: DWORD,
    CompressionFormat: WORD,
    DataUnitShift: BYTE,
    ChunkShift: BYTE,
    ClusterShift: BYTE,
    EncryptionFormat: BYTE,
    NumberOfDataBlocks: WORD,
    DataBlockSize: [1]DWORD,
};

pub const PENCRYPTED_DATA_INFO = ?*ENCRYPTED_DATA_INFO;
pub const EXTENDED_ENCRYPTED_DATA_INFO = extern struct {
    ExtendedCode: DWORD,
    Length: DWORD,
    Flags: DWORD,
    Reserved: DWORD,
};

pub const PEXTENDED_ENCRYPTED_DATA_INFO = ?*EXTENDED_ENCRYPTED_DATA_INFO;
pub const PLEX_READ_DATA_REQUEST = extern struct {
    ByteOffset: LARGE_INTEGER,
    ByteLength: DWORD,
    PlexNumber: DWORD,
};

pub const PPLEX_READ_DATA_REQUEST = ?*PLEX_READ_DATA_REQUEST;
pub const SI_COPYFILE = extern struct {
    SourceFileNameLength: DWORD,
    DestinationFileNameLength: DWORD,
    Flags: DWORD,
    FileNameBuffer: [1]WCHAR,
};

pub const PSI_COPYFILE = ?*SI_COPYFILE;
pub const FILE_MAKE_COMPATIBLE_BUFFER = extern struct {
    CloseDisc: BOOLEAN,
};

pub const PFILE_MAKE_COMPATIBLE_BUFFER = ?*FILE_MAKE_COMPATIBLE_BUFFER;
pub const FILE_SET_DEFECT_MGMT_BUFFER = extern struct {
    Disable: BOOLEAN,
};

pub const PFILE_SET_DEFECT_MGMT_BUFFER = ?*FILE_SET_DEFECT_MGMT_BUFFER;
pub const FILE_QUERY_SPARING_BUFFER = extern struct {
    SparingUnitBytes: DWORD,
    SoftwareSparing: BOOLEAN,
    TotalSpareBlocks: DWORD,
    FreeSpareBlocks: DWORD,
};

pub const PFILE_QUERY_SPARING_BUFFER = ?*FILE_QUERY_SPARING_BUFFER;
pub const FILE_QUERY_ON_DISK_VOL_INFO_BUFFER = extern struct {
    DirectoryCount: LARGE_INTEGER,
    FileCount: LARGE_INTEGER,
    FsFormatMajVersion: WORD,
    FsFormatMinVersion: WORD,
    FsFormatName: [12]WCHAR,
    FormatTime: LARGE_INTEGER,
    LastUpdateTime: LARGE_INTEGER,
    CopyrightInfo: [34]WCHAR,
    AbstractInfo: [34]WCHAR,
    FormattingImplementationInfo: [34]WCHAR,
    LastModifyingImplementationInfo: [34]WCHAR,
};

pub const PFILE_QUERY_ON_DISK_VOL_INFO_BUFFER = ?*FILE_QUERY_ON_DISK_VOL_INFO_BUFFER;
pub const CLSN = DWORDLONG;
pub const FILE_INITIATE_REPAIR_OUTPUT_BUFFER = extern struct {
    Hint1: DWORDLONG,
    Hint2: DWORDLONG,
    Clsn: CLSN,
    Status: DWORD,
};

pub const PFILE_INITIATE_REPAIR_OUTPUT_BUFFER = ?*FILE_INITIATE_REPAIR_OUTPUT_BUFFER;
pub const SHRINK_VOLUME_REQUEST_TYPES = c_int;

pub const PSHRINK_VOLUME_REQUEST_TYPES = ?*SHRINK_VOLUME_REQUEST_TYPES;
pub const SHRINK_VOLUME_INFORMATION = extern struct {
    ShrinkRequestType: SHRINK_VOLUME_REQUEST_TYPES,
    Flags: DWORDLONG,
    NewNumberOfSectors: LONGLONG,
};

pub const PSHRINK_VOLUME_INFORMATION = ?*SHRINK_VOLUME_INFORMATION;
pub const TXFS_MODIFY_RM = extern struct {
    Flags: DWORD,
    LogContainerCountMax: DWORD,
    LogContainerCountMin: DWORD,
    LogContainerCount: DWORD,
    LogGrowthIncrement: DWORD,
    LogAutoShrinkPercentage: DWORD,
    Reserved: DWORDLONG,
    LoggingMode: WORD,
};

pub const PTXFS_MODIFY_RM = ?*TXFS_MODIFY_RM;
pub const TXFS_QUERY_RM_INFORMATION = extern struct {
    BytesRequired: DWORD,
    TailLsn: DWORDLONG,
    CurrentLsn: DWORDLONG,
    ArchiveTailLsn: DWORDLONG,
    LogContainerSize: DWORDLONG,
    HighestVirtualClock: LARGE_INTEGER,
    LogContainerCount: DWORD,
    LogContainerCountMax: DWORD,
    LogContainerCountMin: DWORD,
    LogGrowthIncrement: DWORD,
    LogAutoShrinkPercentage: DWORD,
    Flags: DWORD,
    LoggingMode: WORD,
    Reserved: WORD,
    RmState: DWORD,
    LogCapacity: DWORDLONG,
    LogFree: DWORDLONG,
    TopsSize: DWORDLONG,
    TopsUsed: DWORDLONG,
    TransactionCount: DWORDLONG,
    OnePCCount: DWORDLONG,
    TwoPCCount: DWORDLONG,
    NumberLogFileFull: DWORDLONG,
    OldestTransactionAge: DWORDLONG,
    RMName: GUID,
    TmLogPathOffset: DWORD,
};

pub const PTXFS_QUERY_RM_INFORMATION = ?*TXFS_QUERY_RM_INFORMATION;
pub const TXFS_ROLLFORWARD_REDO_INFORMATION = extern struct {
    LastVirtualClock: LARGE_INTEGER,
    LastRedoLsn: DWORDLONG,
    HighestRecoveryLsn: DWORDLONG,
    Flags: DWORD,
};

pub const PTXFS_ROLLFORWARD_REDO_INFORMATION = ?*TXFS_ROLLFORWARD_REDO_INFORMATION;
pub const TXFS_START_RM_INFORMATION = extern struct {
    Flags: DWORD,
    LogContainerSize: DWORDLONG,
    LogContainerCountMin: DWORD,
    LogContainerCountMax: DWORD,
    LogGrowthIncrement: DWORD,
    LogAutoShrinkPercentage: DWORD,
    TmLogPathOffset: DWORD,
    TmLogPathLength: WORD,
    LoggingMode: WORD,
    LogPathLength: WORD,
    Reserved: WORD,
    LogPath: [1]WCHAR,
};

pub const PTXFS_START_RM_INFORMATION = ?*TXFS_START_RM_INFORMATION;
pub const TXFS_GET_METADATA_INFO_OUT = extern struct {
    TxfFileId: extern struct {
        LowPart: LONGLONG,
        HighPart: LONGLONG,
    },
    LockingTransaction: GUID,
    LastLsn: DWORDLONG,
    TransactionState: DWORD,
};

pub const PTXFS_GET_METADATA_INFO_OUT = ?*TXFS_GET_METADATA_INFO_OUT;
pub const TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY = extern struct {
    Offset: DWORDLONG,
    NameFlags: DWORD,
    FileId: LONGLONG,
    Reserved1: DWORD,
    Reserved2: DWORD,
    Reserved3: LONGLONG,
    FileName: [1]WCHAR,
};

pub const PTXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY = ?*TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY;
pub const TXFS_LIST_TRANSACTION_LOCKED_FILES = extern struct {
    KtmTransaction: GUID,
    NumberOfFiles: DWORDLONG,
    BufferSizeRequired: DWORDLONG,
    Offset: DWORDLONG,
};

pub const PTXFS_LIST_TRANSACTION_LOCKED_FILES = ?*TXFS_LIST_TRANSACTION_LOCKED_FILES;
pub const TXFS_LIST_TRANSACTIONS_ENTRY = extern struct {
    TransactionId: GUID,
    TransactionState: DWORD,
    Reserved1: DWORD,
    Reserved2: DWORD,
    Reserved3: LONGLONG,
};

pub const PTXFS_LIST_TRANSACTIONS_ENTRY = ?*TXFS_LIST_TRANSACTIONS_ENTRY;
pub const TXFS_LIST_TRANSACTIONS = extern struct {
    NumberOfTransactions: DWORDLONG,
    BufferSizeRequired: DWORDLONG,
};

pub const PTXFS_LIST_TRANSACTIONS = ?*TXFS_LIST_TRANSACTIONS;
pub const TXFS_READ_BACKUP_INFORMATION_OUT = extern struct {
    u: extern union {
        BufferLength: DWORD,
        Buffer: [1]BYTE,
    },
};

pub const PTXFS_READ_BACKUP_INFORMATION_OUT = ?*TXFS_READ_BACKUP_INFORMATION_OUT;
pub const TXFS_WRITE_BACKUP_INFORMATION = extern struct {
    Buffer: [1]BYTE,
};

pub const PTXFS_WRITE_BACKUP_INFORMATION = ?*TXFS_WRITE_BACKUP_INFORMATION;
pub const TXFS_GET_TRANSACTED_VERSION = extern struct {
    ThisBaseVersion: DWORD,
    LatestVersion: DWORD,
    ThisMiniVersion: WORD,
    FirstMiniVersion: WORD,
    LatestMiniVersion: WORD,
};

pub const PTXFS_GET_TRANSACTED_VERSION = ?*TXFS_GET_TRANSACTED_VERSION;
pub const TXFS_SAVEPOINT_INFORMATION = extern struct {
    KtmTransaction: HANDLE,
    ActionCode: DWORD,
    SavepointId: DWORD,
};

pub const PTXFS_SAVEPOINT_INFORMATION = ?*TXFS_SAVEPOINT_INFORMATION;
pub const TXFS_CREATE_MINIVERSION_INFO = extern struct {
    StructureVersion: WORD,
    StructureLength: WORD,
    BaseVersion: DWORD,
    MiniVersion: WORD,
};

pub const PTXFS_CREATE_MINIVERSION_INFO = ?*TXFS_CREATE_MINIVERSION_INFO;
pub const TXFS_TRANSACTION_ACTIVE_INFO = extern struct {
    TransactionsActiveAtSnapshot: BOOLEAN,
};

pub const PTXFS_TRANSACTION_ACTIVE_INFO = ?*TXFS_TRANSACTION_ACTIVE_INFO;
pub const BOOT_AREA_INFO = extern struct {
    BootSectorCount: DWORD,
    BootSectors: [2]extern struct {
        Offset: LARGE_INTEGER,
    },
};

pub const PBOOT_AREA_INFO = ?*BOOT_AREA_INFO;
pub const RETRIEVAL_POINTER_BASE = extern struct {
    FileAreaOffset: LARGE_INTEGER,
};

pub const PRETRIEVAL_POINTER_BASE = ?*RETRIEVAL_POINTER_BASE;
pub const FILE_FS_PERSISTENT_VOLUME_INFORMATION = extern struct {
    VolumeFlags: DWORD,
    FlagMask: DWORD,
    Version: DWORD,
    Reserved: DWORD,
};

pub const PFILE_FS_PERSISTENT_VOLUME_INFORMATION = ?*FILE_FS_PERSISTENT_VOLUME_INFORMATION;
pub const FILE_SYSTEM_RECOGNITION_INFORMATION = extern struct {
    FileSystem: [9]CHAR,
};

pub const PFILE_SYSTEM_RECOGNITION_INFORMATION = ?*FILE_SYSTEM_RECOGNITION_INFORMATION;
pub const REQUEST_OPLOCK_INPUT_BUFFER = extern struct {
    StructureVersion: WORD,
    StructureLength: WORD,
    RequestedOplockLevel: DWORD,
    Flags: DWORD,
};

pub const PREQUEST_OPLOCK_INPUT_BUFFER = ?*REQUEST_OPLOCK_INPUT_BUFFER;
pub const REQUEST_OPLOCK_OUTPUT_BUFFER = extern struct {
    StructureVersion: WORD,
    StructureLength: WORD,
    OriginalOplockLevel: DWORD,
    NewOplockLevel: DWORD,
    Flags: DWORD,
    AccessMode: ACCESS_MASK,
    ShareMode: WORD,
};

pub const PREQUEST_OPLOCK_OUTPUT_BUFFER = ?*REQUEST_OPLOCK_OUTPUT_BUFFER;
pub const VIRTUAL_STORAGE_TYPE = extern struct {
    DeviceId: DWORD,
    VendorId: GUID,
};

pub const PVIRTUAL_STORAGE_TYPE = ?*VIRTUAL_STORAGE_TYPE;
pub const STORAGE_QUERY_DEPENDENT_VOLUME_REQUEST = extern struct {
    RequestLevel: DWORD,
    RequestFlags: DWORD,
};

pub const PSTORAGE_QUERY_DEPENDENT_VOLUME_REQUEST = ?*STORAGE_QUERY_DEPENDENT_VOLUME_REQUEST;
pub const STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY = extern struct {
    EntryLength: DWORD,
    DependencyTypeFlags: DWORD,
    ProviderSpecificFlags: DWORD,
    VirtualStorageType: VIRTUAL_STORAGE_TYPE,
};

pub const PSTORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY = ?*STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY;
pub const STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY = extern struct {
    EntryLength: DWORD,
    DependencyTypeFlags: DWORD,
    ProviderSpecificFlags: DWORD,
    VirtualStorageType: VIRTUAL_STORAGE_TYPE,
    AncestorLevel: DWORD,
    HostVolumeNameOffset: DWORD,
    HostVolumeNameSize: DWORD,
    DependentVolumeNameOffset: DWORD,
    DependentVolumeNameSize: DWORD,
    RelativePathOffset: DWORD,
    RelativePathSize: DWORD,
    DependentDeviceNameOffset: DWORD,
    DependentDeviceNameSize: DWORD,
};

pub const PSTORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY = ?*STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY;
pub const STORAGE_QUERY_DEPENDENT_VOLUME_RESPONSE = extern struct {
    ResponseLevel: DWORD,
    NumberEntries: DWORD,
    u: extern union {
        Lev1Depends: &STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY,
        Lev2Depends: &STORAGE_QUERY_DEPENDENT_VOLUME_LEV2_ENTRY,
    },
};

pub const PSTORAGE_QUERY_DEPENDENT_VOLUME_RESPONSE = ?*STORAGE_QUERY_DEPENDENT_VOLUME_RESPONSE;
pub const SD_CHANGE_MACHINE_SID_INPUT = extern struct {
    CurrentMachineSIDOffset: WORD,
    CurrentMachineSIDLength: WORD,
    NewMachineSIDOffset: WORD,
    NewMachineSIDLength: WORD,
};

pub const PSD_CHANGE_MACHINE_SID_INPUT = ?*SD_CHANGE_MACHINE_SID_INPUT;
pub const SD_CHANGE_MACHINE_SID_OUTPUT = extern struct {
    NumSDChangedSuccess: DWORDLONG,
    NumSDChangedFail: DWORDLONG,
    NumSDUnused: DWORDLONG,
    NumSDTotal: DWORDLONG,
    NumMftSDChangedSuccess: DWORDLONG,
    NumMftSDChangedFail: DWORDLONG,
    NumMftSDTotal: DWORDLONG,
};

pub const PSD_CHANGE_MACHINE_SID_OUTPUT = ?*SD_CHANGE_MACHINE_SID_OUTPUT;
pub const SD_QUERY_STATS_INPUT = extern struct {
    Reserved: DWORD,
};

pub const PSD_QUERY_STATS_INPUT = ?*SD_QUERY_STATS_INPUT;
pub const SD_QUERY_STATS_OUTPUT = extern struct {
    SdsStreamSize: DWORDLONG,
    SdsAllocationSize: DWORDLONG,
    SiiStreamSize: DWORDLONG,
    SiiAllocationSize: DWORDLONG,
    SdhStreamSize: DWORDLONG,
    SdhAllocationSize: DWORDLONG,
    NumSDTotal: DWORDLONG,
    NumSDUnused: DWORDLONG,
};

pub const PSD_QUERY_STATS_OUTPUT = ?*SD_QUERY_STATS_OUTPUT;
pub const SD_ENUM_SDS_INPUT = extern struct {
    StartingOffset: DWORDLONG,
    MaxSDEntriesToReturn: DWORDLONG,
};

pub const PSD_ENUM_SDS_INPUT = ?*SD_ENUM_SDS_INPUT;
pub const SD_ENUM_SDS_ENTRY = extern struct {
    Hash: DWORD,
    SecurityId: DWORD,
    Offset: DWORDLONG,
    Length: DWORD,
    Descriptor: [1]BYTE,
};

pub const PSD_ENUM_SDS_ENTRY = ?*SD_ENUM_SDS_ENTRY;
pub const SD_ENUM_SDS_OUTPUT = extern struct {
    NextOffset: DWORDLONG,
    NumSDEntriesReturned: DWORDLONG,
    NumSDBytesReturned: DWORDLONG,
    SDEntry: [1]SD_ENUM_SDS_ENTRY,
};

pub const PSD_ENUM_SDS_OUTPUT = ?*SD_ENUM_SDS_OUTPUT;
pub const SD_GLOBAL_CHANGE_INPUT = extern struct {
    Flags: DWORD,
    ChangeType: DWORD,
    u: extern union {
        SdChange: SD_CHANGE_MACHINE_SID_INPUT,
        SdQueryStats: SD_QUERY_STATS_INPUT,
        SdEnumSds: SD_ENUM_SDS_INPUT,
    },
};

pub const PSD_GLOBAL_CHANGE_INPUT = ?*SD_GLOBAL_CHANGE_INPUT;
pub const SD_GLOBAL_CHANGE_OUTPUT = extern struct {
    Flags: DWORD,
    ChangeType: DWORD,
    u: extern union {
        SdChange: SD_CHANGE_MACHINE_SID_OUTPUT,
        SdQueryStats: SD_QUERY_STATS_OUTPUT,
        SdEnumSds: SD_ENUM_SDS_OUTPUT,
    },
};

pub const PSD_GLOBAL_CHANGE_OUTPUT = ?*SD_GLOBAL_CHANGE_OUTPUT;
pub const LOOKUP_STREAM_FROM_CLUSTER_INPUT = extern struct {
    Flags: DWORD,
    NumberOfClusters: DWORD,
    Cluster: [1]LARGE_INTEGER,
};

pub const PLOOKUP_STREAM_FROM_CLUSTER_INPUT = ?*LOOKUP_STREAM_FROM_CLUSTER_INPUT;
pub const LOOKUP_STREAM_FROM_CLUSTER_OUTPUT = extern struct {
    Offset: DWORD,
    NumberOfMatches: DWORD,
    BufferSizeRequired: DWORD,
};

pub const PLOOKUP_STREAM_FROM_CLUSTER_OUTPUT = ?*LOOKUP_STREAM_FROM_CLUSTER_OUTPUT;
pub const LOOKUP_STREAM_FROM_CLUSTER_ENTRY = extern struct {
    OffsetToNext: DWORD,
    Flags: DWORD,
    Reserved: LARGE_INTEGER,
    Cluster: LARGE_INTEGER,
    FileName: [1]WCHAR,
};

pub const PLOOKUP_STREAM_FROM_CLUSTER_ENTRY = ?*LOOKUP_STREAM_FROM_CLUSTER_ENTRY;
pub const FILE_TYPE_NOTIFICATION_INPUT = extern struct {
    Flags: DWORD,
    NumFileTypeIDs: DWORD,
    FileTypeID: [1]GUID,
};

pub const PFILE_TYPE_NOTIFICATION_INPUT = ?*FILE_TYPE_NOTIFICATION_INPUT;
pub const CSV_MGMT_LOCK = extern struct {
    Flags: DWORD,
};

pub const PCSV_MGMT_LOCK = ?*CSV_MGMT_LOCK;
pub const CSV_NAMESPACE_INFO = extern struct {
    Version: DWORD,
    DeviceNumber: DWORD,
    StartingOffset: LARGE_INTEGER,
    SectorSize: DWORD,
};

pub const PCSV_NAMESPACE_INFO = ?*CSV_NAMESPACE_INFO;
pub const CSV_CONTROL_OP = c_int;

pub const PCSV_CONTROL_OP = ?*CSV_CONTROL_OP;
pub const CSV_CONTROL_PARAM = extern struct {
    Operation: CSV_CONTROL_OP,
    Unused: LONGLONG,
};

pub const PCSV_CONTROL_PARAM = ?*CSV_CONTROL_PARAM;
pub const CSV_QUERY_REDIRECT_STATE = extern struct {
    MdsNodeId: DWORD,
    DsNodeId: DWORD,
    FileRedirected: BOOLEAN,
};

pub const PCSV_QUERY_REDIRECT_STATE = ?*CSV_QUERY_REDIRECT_STATE;
pub const CSV_QUERY_FILE_REVISION = extern struct {
    FileId: LONGLONG,
    FileRevision: [3]LONGLONG,
};

pub const PCSV_QUERY_FILE_REVISION = ?*CSV_QUERY_FILE_REVISION;
pub const CSV_QUERY_FILE_REVISION_FILE_ID_128 = extern struct {
    FileId: FILE_ID_128,
    FileRevision: [3]LONGLONG,
};

pub const PCSV_QUERY_FILE_REVISION_FILE_ID_128 = ?*CSV_QUERY_FILE_REVISION_FILE_ID_128;
pub const CSV_QUERY_MDS_PATH = extern struct {
    MdsNodeId: DWORD,
    DsNodeId: DWORD,
    PathLength: DWORD,
    Path: [1]WCHAR,
};

pub const PCSV_QUERY_MDS_PATH = ?*CSV_QUERY_MDS_PATH;
pub const CSVFS_DISK_CONNECTIVITY = c_int;

pub const PCSVFS_DISK_CONNECTIVITY = ?*CSVFS_DISK_CONNECTIVITY;
pub const CSV_QUERY_VOLUME_REDIRECT_STATE = extern struct {
    MdsNodeId: DWORD,
    DsNodeId: DWORD,
    IsDiskConnected: BOOLEAN,
    ClusterEnableDirectIo: BOOLEAN,
    DiskConnectivity: CSVFS_DISK_CONNECTIVITY,
};

pub const PCSV_QUERY_VOLUME_REDIRECT_STATE = ?*CSV_QUERY_VOLUME_REDIRECT_STATE;
pub const CSV_QUERY_MDS_PATH_V2 = extern struct {
    Version: LONGLONG,
    RequiredSize: DWORD,
    MdsNodeId: DWORD,
    DsNodeId: DWORD,
    Flags: DWORD,
    DiskConnectivity: CSVFS_DISK_CONNECTIVITY,
    VolumeId: GUID,
    IpAddressOffset: DWORD,
    IpAddressLength: DWORD,
    PathOffset: DWORD,
    PathLength: DWORD,
};

pub const PCSV_QUERY_MDS_PATH_V2 = ?*CSV_QUERY_MDS_PATH_V2;
pub const CSV_QUERY_VETO_FILE_DIRECT_IO_OUTPUT = extern struct {
    VetoedFromAltitudeIntegral: DWORDLONG,
    VetoedFromAltitudeDecimal: DWORDLONG,
    Reason: [256]WCHAR,
};

pub const PCSV_QUERY_VETO_FILE_DIRECT_IO_OUTPUT = ?*CSV_QUERY_VETO_FILE_DIRECT_IO_OUTPUT;
pub const CSV_IS_OWNED_BY_CSVFS = extern struct {
    OwnedByCSVFS: BOOLEAN,
};

pub const PCSV_IS_OWNED_BY_CSVFS = ?*CSV_IS_OWNED_BY_CSVFS;
pub const FILE_LEVEL_TRIM_RANGE = extern struct {
    Offset: DWORDLONG,
    Length: DWORDLONG,
};

pub const PFILE_LEVEL_TRIM_RANGE = ?*FILE_LEVEL_TRIM_RANGE;
pub const FILE_LEVEL_TRIM = extern struct {
    Key: DWORD,
    NumRanges: DWORD,
    Ranges: [1]FILE_LEVEL_TRIM_RANGE,
};

pub const PFILE_LEVEL_TRIM = ?*FILE_LEVEL_TRIM;
pub const FILE_LEVEL_TRIM_OUTPUT = extern struct {
    NumRangesProcessed: DWORD,
};

pub const PFILE_LEVEL_TRIM_OUTPUT = ?*FILE_LEVEL_TRIM_OUTPUT;
pub const QUERY_FILE_LAYOUT_FILTER_TYPE = c_int;

pub const CLUSTER_RANGE = extern struct {
    StartingCluster: LARGE_INTEGER,
    ClusterCount: LARGE_INTEGER,
};

pub const PCLUSTER_RANGE = ?*CLUSTER_RANGE;
pub const FILE_REFERENCE_RANGE = extern struct {
    StartingFileReferenceNumber: DWORDLONG,
    EndingFileReferenceNumber: DWORDLONG,
};

pub const PFILE_REFERENCE_RANGE = ?*FILE_REFERENCE_RANGE;
pub const QUERY_FILE_LAYOUT_INPUT = extern struct {
    NumberOfPairs: DWORD,
    Flags: DWORD,
    FilterType: QUERY_FILE_LAYOUT_FILTER_TYPE,
    Reserved: DWORD,
    Filter: extern union {
        ClusterRanges: [1]CLUSTER_RANGE,
        FileReferenceRanges: [1]FILE_REFERENCE_RANGE,
    },
};

pub const PQUERY_FILE_LAYOUT_INPUT = ?*QUERY_FILE_LAYOUT_INPUT;
pub const QUERY_FILE_LAYOUT_OUTPUT = extern struct {
    FileEntryCount: DWORD,
    FirstFileOffset: DWORD,
    Flags: DWORD,
    Reserved: DWORD,
};

pub const PQUERY_FILE_LAYOUT_OUTPUT = ?*QUERY_FILE_LAYOUT_OUTPUT;
pub const FILE_LAYOUT_ENTRY = extern struct {
    Version: DWORD,
    NextFileOffset: DWORD,
    Flags: DWORD,
    FileAttributes: DWORD,
    FileReferenceNumber: DWORDLONG,
    FirstNameOffset: DWORD,
    FirstStreamOffset: DWORD,
    ExtraInfoOffset: DWORD,
    Reserved: DWORD,
};

pub const PFILE_LAYOUT_ENTRY = ?*FILE_LAYOUT_ENTRY;
pub const FILE_LAYOUT_NAME_ENTRY = extern struct {
    NextNameOffset: DWORD,
    Flags: DWORD,
    ParentFileReferenceNumber: DWORDLONG,
    FileNameLength: DWORD,
    Reserved: DWORD,
    FileName: [1]WCHAR,
};

pub const PFILE_LAYOUT_NAME_ENTRY = ?*FILE_LAYOUT_NAME_ENTRY;
pub const FILE_LAYOUT_INFO_ENTRY = extern struct {
    BasicInformation: extern struct {
        CreationTime: LARGE_INTEGER,
        LastAccessTime: LARGE_INTEGER,
        LastWriteTime: LARGE_INTEGER,
        ChangeTime: LARGE_INTEGER,
        FileAttributes: DWORD,
    },
    OwnerId: DWORD,
    SecurityId: DWORD,
    Usn: USN,
};

pub const PFILE_LAYOUT_INFO_ENTRY = ?*FILE_LAYOUT_INFO_ENTRY;
pub const STREAM_LAYOUT_ENTRY = extern struct {
    Version: DWORD,
    NextStreamOffset: DWORD,
    Flags: DWORD,
    ExtentInformationOffset: DWORD,
    AllocationSize: LARGE_INTEGER,
    EndOfFile: LARGE_INTEGER,
    StreamInformationOffset: DWORD,
    AttributeTypeCode: DWORD,
    AttributeFlags: DWORD,
    StreamIdentifierLength: DWORD,
    StreamIdentifier: [1]WCHAR,
};

pub const PSTREAM_LAYOUT_ENTRY = ?*STREAM_LAYOUT_ENTRY;
pub const STREAM_EXTENT_ENTRY = extern struct {
    Flags: DWORD,
    ExtentInformation: extern union {
        RetrievalPointers: RETRIEVAL_POINTERS_BUFFER,
    },
};

pub const PSTREAM_EXTENT_ENTRY = ?*STREAM_EXTENT_ENTRY;
pub const FSCTL_GET_INTEGRITY_INFORMATION_BUFFER = extern struct {
    ChecksumAlgorithm: WORD,
    Reserved: WORD,
    Flags: DWORD,
    ChecksumChunkSizeInBytes: DWORD,
    ClusterSizeInBytes: DWORD,
};

pub const PFSCTL_GET_INTEGRITY_INFORMATION_BUFFER = ?*FSCTL_GET_INTEGRITY_INFORMATION_BUFFER;
pub const FSCTL_SET_INTEGRITY_INFORMATION_BUFFER = extern struct {
    ChecksumAlgorithm: WORD,
    Reserved: WORD,
    Flags: DWORD,
};

pub const PFSCTL_SET_INTEGRITY_INFORMATION_BUFFER = ?*FSCTL_SET_INTEGRITY_INFORMATION_BUFFER;
pub const FSCTL_SET_INTEGRITY_INFORMATION_BUFFER_EX = extern struct {
    EnableIntegrity: BYTE,
    KeepIntegrityStateUnchanged: BYTE,
    Reserved: WORD,
    Flags: DWORD,
    Version: BYTE,
    Reserved2: [7]BYTE,
};

pub const PFSCTL_SET_INTEGRITY_INFORMATION_BUFFER_EX = ?*FSCTL_SET_INTEGRITY_INFORMATION_BUFFER_EX;
pub const FSCTL_OFFLOAD_READ_INPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    TokenTimeToLive: DWORD,
    Reserved: DWORD,
    FileOffset: DWORDLONG,
    CopyLength: DWORDLONG,
};

pub const PFSCTL_OFFLOAD_READ_INPUT = ?*FSCTL_OFFLOAD_READ_INPUT;
pub const FSCTL_OFFLOAD_READ_OUTPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    TransferLength: DWORDLONG,
    Token: [512]BYTE,
};

pub const PFSCTL_OFFLOAD_READ_OUTPUT = ?*FSCTL_OFFLOAD_READ_OUTPUT;
pub const FSCTL_OFFLOAD_WRITE_INPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    FileOffset: DWORDLONG,
    CopyLength: DWORDLONG,
    TransferOffset: DWORDLONG,
    Token: [512]BYTE,
};

pub const PFSCTL_OFFLOAD_WRITE_INPUT = ?*FSCTL_OFFLOAD_WRITE_INPUT;
pub const FSCTL_OFFLOAD_WRITE_OUTPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    LengthWritten: DWORDLONG,
};

pub const PFSCTL_OFFLOAD_WRITE_OUTPUT = ?*FSCTL_OFFLOAD_WRITE_OUTPUT;
pub const SET_PURGE_FAILURE_MODE_INPUT = extern struct {
    Flags: DWORD,
};

pub const PSET_PURGE_FAILURE_MODE_INPUT = ?*SET_PURGE_FAILURE_MODE_INPUT;
pub const REPAIR_COPIES_INPUT = extern struct {
    Size: DWORD,
    Flags: DWORD,
    FileOffset: LARGE_INTEGER,
    Length: DWORD,
    SourceCopy: DWORD,
    NumberOfRepairCopies: DWORD,
    RepairCopies: [1]DWORD,
};

pub const PREPAIR_COPIES_INPUT = ?*REPAIR_COPIES_INPUT;
pub const REPAIR_COPIES_OUTPUT = extern struct {
    Size: DWORD,
    Status: DWORD,
    ResumeFileOffset: LARGE_INTEGER,
};

pub const PREPAIR_COPIES_OUTPUT = ?*REPAIR_COPIES_OUTPUT;
pub const FILE_REGION_INFO = extern struct {
    FileOffset: LONGLONG,
    Length: LONGLONG,
    Usage: DWORD,
    Reserved: DWORD,
};

pub const PFILE_REGION_INFO = ?*FILE_REGION_INFO;
pub const FILE_REGION_OUTPUT = extern struct {
    Flags: DWORD,
    TotalRegionEntryCount: DWORD,
    RegionEntryCount: DWORD,
    Reserved: DWORD,
    Region: [1]FILE_REGION_INFO,
};

pub const PFILE_REGION_OUTPUT = ?*FILE_REGION_OUTPUT;
pub const FILE_REGION_INPUT = extern struct {
    FileOffset: LONGLONG,
    Length: LONGLONG,
    DesiredUsage: DWORD,
};

pub const PFILE_REGION_INPUT = ?*FILE_REGION_INPUT;
pub const WRITE_USN_REASON_INPUT = extern struct {
    Flags: DWORD,
    UsnReasonToWrite: DWORD,
};

pub const PWRITE_USN_REASON_INPUT = ?*WRITE_USN_REASON_INPUT;
pub const FILE_STORAGE_TIER_MEDIA_TYPE = c_int;

pub const PFILE_STORAGE_TIER_MEDIA_TYPE = ?*FILE_STORAGE_TIER_MEDIA_TYPE;
pub const FILE_STORAGE_TIER_CLASS = c_int;

pub const PFILE_STORAGE_TIER_CLASS = ?*FILE_STORAGE_TIER_CLASS;
pub const FILE_STORAGE_TIER = extern struct {
    Id: GUID,
    Name: [256]WCHAR,
    Description: [256]WCHAR,
    Flags: DWORDLONG,
    ProvisionedCapacity: DWORDLONG,
    MediaType: FILE_STORAGE_TIER_MEDIA_TYPE,
    Class: FILE_STORAGE_TIER_CLASS,
};

pub const PFILE_STORAGE_TIER = ?*FILE_STORAGE_TIER;
pub const FSCTL_QUERY_STORAGE_CLASSES_OUTPUT = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    TotalNumberOfTiers: DWORD,
    NumberOfTiersReturned: DWORD,
    Tiers: [1]FILE_STORAGE_TIER,
};

pub const PFSCTL_QUERY_STORAGE_CLASSES_OUTPUT = ?*FSCTL_QUERY_STORAGE_CLASSES_OUTPUT;
pub const DesiredStorageClass = extern struct {
    Class: FILE_STORAGE_TIER_CLASS,
    Flags: DWORD,
};
pub const StreamInformation = extern union {
    DesiredStorageClass: DesiredStorageClass,
};
pub const STREAM_INFORMATION_ENTRY = extern struct {
    Version: DWORD,
    Flags: DWORD,
    StreamInformation: StreamInformation,
};

pub const PSTREAM_INFORMATION_ENTRY = ?*STREAM_INFORMATION_ENTRY;
pub const FSCTL_QUERY_REGION_INFO_INPUT = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    NumberOfTierIds: DWORD,
    TierIds: [1]GUID,
};

pub const PFSCTL_QUERY_REGION_INFO_INPUT = ?*FSCTL_QUERY_REGION_INFO_INPUT;
pub const FILE_STORAGE_TIER_REGION = extern struct {
    TierId: GUID,
    Offset: DWORDLONG,
    Length: DWORDLONG,
};

pub const PFILE_STORAGE_TIER_REGION = ?*FILE_STORAGE_TIER_REGION;
pub const FSCTL_QUERY_REGION_INFO_OUTPUT = extern struct {
    Version: DWORD,
    Size: DWORD,
    Flags: DWORD,
    Reserved: DWORD,
    Alignment: DWORDLONG,
    TotalNumberOfRegions: DWORD,
    NumberOfRegionsReturned: DWORD,
    Regions: [1]FILE_STORAGE_TIER_REGION,
};

pub const PFSCTL_QUERY_REGION_INFO_OUTPUT = ?*FSCTL_QUERY_REGION_INFO_OUTPUT;
pub const FILE_DESIRED_STORAGE_CLASS_INFORMATION = extern struct {
    Class: FILE_STORAGE_TIER_CLASS,
    Flags: DWORD,
};

pub const PFILE_DESIRED_STORAGE_CLASS_INFORMATION = ?*FILE_DESIRED_STORAGE_CLASS_INFORMATION;
pub const DUPLICATE_EXTENTS_DATA = extern struct {
    FileHandle: HANDLE,
    SourceFileOffset: LARGE_INTEGER,
    TargetFileOffset: LARGE_INTEGER,
    ByteCount: LARGE_INTEGER,
};

pub const PDUPLICATE_EXTENTS_DATA = ?*DUPLICATE_EXTENTS_DATA;
pub const DUPLICATE_EXTENTS_DATA32 = extern struct {
    FileHandle: UINT32,
    SourceFileOffset: LARGE_INTEGER,
    TargetFileOffset: LARGE_INTEGER,
    ByteCount: LARGE_INTEGER,
};

pub const PDUPLICATE_EXTENTS_DATA32 = ?*DUPLICATE_EXTENTS_DATA32;
pub const DUPLICATE_EXTENTS_DATA_EX = extern struct {
    Size: SIZE_T,
    FileHandle: HANDLE,
    SourceFileOffset: LARGE_INTEGER,
    TargetFileOffset: LARGE_INTEGER,
    ByteCount: LARGE_INTEGER,
    Flags: DWORD,
};

pub const PDUPLICATE_EXTENTS_DATA_EX = ?*DUPLICATE_EXTENTS_DATA_EX;
pub const DUPLICATE_EXTENTS_DATA_EX32 = extern struct {
    Size: DWORD32,
    FileHandle: DWORD32,
    SourceFileOffset: LARGE_INTEGER,
    TargetFileOffset: LARGE_INTEGER,
    ByteCount: LARGE_INTEGER,
    Flags: DWORD,
};

pub const PDUPLICATE_EXTENTS_DATA_EX32 = ?*DUPLICATE_EXTENTS_DATA_EX32;
pub const REFS_SMR_VOLUME_GC_STATE = c_int;

pub const PREFS_SMR_VOLUME_GC_STATE = ?*REFS_SMR_VOLUME_GC_STATE;
pub const REFS_SMR_VOLUME_INFO_OUTPUT = extern struct {
    Version: DWORD,
    Flags: DWORD,
    SizeOfRandomlyWritableTier: LARGE_INTEGER,
    FreeSpaceInRandomlyWritableTier: LARGE_INTEGER,
    SizeofSMRTier: LARGE_INTEGER,
    FreeSpaceInSMRTier: LARGE_INTEGER,
    UsableFreeSpaceInSMRTier: LARGE_INTEGER,
    VolumeGcState: REFS_SMR_VOLUME_GC_STATE,
    VolumeGcLastStatus: DWORD,
    Unused: [7]DWORDLONG,
};

pub const PREFS_SMR_VOLUME_INFO_OUTPUT = ?*REFS_SMR_VOLUME_INFO_OUTPUT;
pub const REFS_SMR_VOLUME_GC_ACTION = c_int;

pub const PREFS_SMR_VOLUME_GC_ACTION = ?*REFS_SMR_VOLUME_GC_ACTION;
pub const REFS_SMR_VOLUME_GC_METHOD = c_int;

pub const PREFS_SMR_VOLUME_GC_METHOD = ?*REFS_SMR_VOLUME_GC_METHOD;
pub const REFS_SMR_VOLUME_GC_PARAMETERS = extern struct {
    Version: DWORD,
    Flags: DWORD,
    Action: REFS_SMR_VOLUME_GC_ACTION,
    Method: REFS_SMR_VOLUME_GC_METHOD,
    IoGranularity: DWORD,
    CompressionFormat: DWORD,
    Unused: [8]DWORDLONG,
};

pub const PREFS_SMR_VOLUME_GC_PARAMETERS = ?*REFS_SMR_VOLUME_GC_PARAMETERS;
pub const STREAMS_QUERY_PARAMETERS_OUTPUT_BUFFER = extern struct {
    OptimalWriteSize: DWORD,
    StreamGranularitySize: DWORD,
    StreamIdMin: DWORD,
    StreamIdMax: DWORD,
};

pub const PSTREAMS_QUERY_PARAMETERS_OUTPUT_BUFFER = ?*STREAMS_QUERY_PARAMETERS_OUTPUT_BUFFER;
pub const STREAMS_ASSOCIATE_ID_INPUT_BUFFER = extern struct {
    Flags: DWORD,
    StreamId: DWORD,
};

pub const PSTREAMS_ASSOCIATE_ID_INPUT_BUFFER = ?*STREAMS_ASSOCIATE_ID_INPUT_BUFFER;
pub const STREAMS_QUERY_ID_OUTPUT_BUFFER = extern struct {
    StreamId: DWORD,
};

pub const PSTREAMS_QUERY_ID_OUTPUT_BUFFER = ?*STREAMS_QUERY_ID_OUTPUT_BUFFER;
pub const QUERY_BAD_RANGES_INPUT_RANGE = extern struct {
    StartOffset: DWORDLONG,
    LengthInBytes: DWORDLONG,
};

pub const PQUERY_BAD_RANGES_INPUT_RANGE = ?*QUERY_BAD_RANGES_INPUT_RANGE;
pub const QUERY_BAD_RANGES_INPUT = extern struct {
    Flags: DWORD,
    NumRanges: DWORD,
    Ranges: [1]QUERY_BAD_RANGES_INPUT_RANGE,
};

pub const PQUERY_BAD_RANGES_INPUT = ?*QUERY_BAD_RANGES_INPUT;
pub const QUERY_BAD_RANGES_OUTPUT_RANGE = extern struct {
    Flags: DWORD,
    Reserved: DWORD,
    StartOffset: DWORDLONG,
    LengthInBytes: DWORDLONG,
};

pub const PQUERY_BAD_RANGES_OUTPUT_RANGE = ?*QUERY_BAD_RANGES_OUTPUT_RANGE;
pub const QUERY_BAD_RANGES_OUTPUT = extern struct {
    Flags: DWORD,
    NumBadRanges: DWORD,
    NextOffsetToLookUp: DWORDLONG,
    BadRanges: [1]QUERY_BAD_RANGES_OUTPUT_RANGE,
};

pub const PQUERY_BAD_RANGES_OUTPUT = ?*QUERY_BAD_RANGES_OUTPUT;
pub const SET_DAX_ALLOC_ALIGNMENT_HINT_INPUT = extern struct {
    Flags: DWORD,
    AlignmentShift: DWORD,
    FileOffsetToAlign: DWORDLONG,
};

pub const PSET_DAX_ALLOC_ALIGNMENT_HINT_INPUT = ?*SET_DAX_ALLOC_ALIGNMENT_HINT_INPUT;
pub const WOF_EXTERNAL_INFO = extern struct {
    Version: DWORD,
    Provider: DWORD,
};

pub const PWOF_EXTERNAL_INFO = ?*WOF_EXTERNAL_INFO;
pub const WOF_EXTERNAL_FILE_ID = extern struct {
    FileId: FILE_ID_128,
};

pub const PWOF_EXTERNAL_FILE_ID = ?*WOF_EXTERNAL_FILE_ID;
pub const WOF_VERSION_INFO = extern struct {
    WofVersion: DWORD,
};

pub const PWOF_VERSION_INFO = ?*WOF_VERSION_INFO;
pub const WIM_PROVIDER_EXTERNAL_INFO = extern struct {
    Version: DWORD,
    Flags: DWORD,
    DataSourceId: LARGE_INTEGER,
    ResourceHash: [20]BYTE,
};

pub const PWIM_PROVIDER_EXTERNAL_INFO = ?*WIM_PROVIDER_EXTERNAL_INFO;
pub const WIM_PROVIDER_ADD_OVERLAY_INPUT = extern struct {
    WimType: DWORD,
    WimIndex: DWORD,
    WimFileNameOffset: DWORD,
    WimFileNameLength: DWORD,
};

pub const PWIM_PROVIDER_ADD_OVERLAY_INPUT = ?*WIM_PROVIDER_ADD_OVERLAY_INPUT;
pub const WIM_PROVIDER_UPDATE_OVERLAY_INPUT = extern struct {
    DataSourceId: LARGE_INTEGER,
    WimFileNameOffset: DWORD,
    WimFileNameLength: DWORD,
};

pub const PWIM_PROVIDER_UPDATE_OVERLAY_INPUT = ?*WIM_PROVIDER_UPDATE_OVERLAY_INPUT;
pub const WIM_PROVIDER_REMOVE_OVERLAY_INPUT = extern struct {
    DataSourceId: LARGE_INTEGER,
};

pub const PWIM_PROVIDER_REMOVE_OVERLAY_INPUT = ?*WIM_PROVIDER_REMOVE_OVERLAY_INPUT;
pub const WIM_PROVIDER_SUSPEND_OVERLAY_INPUT = extern struct {
    DataSourceId: LARGE_INTEGER,
};

pub const PWIM_PROVIDER_SUSPEND_OVERLAY_INPUT = ?*WIM_PROVIDER_SUSPEND_OVERLAY_INPUT;
pub const WIM_PROVIDER_OVERLAY_ENTRY = extern struct {
    NextEntryOffset: DWORD,
    DataSourceId: LARGE_INTEGER,
    WimGuid: GUID,
    WimFileNameOffset: DWORD,
    WimType: DWORD,
    WimIndex: DWORD,
    Flags: DWORD,
};

pub const PWIM_PROVIDER_OVERLAY_ENTRY = ?*WIM_PROVIDER_OVERLAY_ENTRY;
pub const FILE_PROVIDER_EXTERNAL_INFO_V0 = extern struct {
    Version: DWORD,
    Algorithm: DWORD,
};

pub const PFILE_PROVIDER_EXTERNAL_INFO_V0 = ?*FILE_PROVIDER_EXTERNAL_INFO_V0;
pub const FILE_PROVIDER_EXTERNAL_INFO_V1 = extern struct {
    Version: DWORD,
    Algorithm: DWORD,
    Flags: DWORD,
};

pub const PFILE_PROVIDER_EXTERNAL_INFO_V1 = ?*FILE_PROVIDER_EXTERNAL_INFO_V1;
pub const FILE_PROVIDER_EXTERNAL_INFO = FILE_PROVIDER_EXTERNAL_INFO_V1;
pub const PFILE_PROVIDER_EXTERNAL_INFO = PFILE_PROVIDER_EXTERNAL_INFO_V1;
pub const CONTAINER_VOLUME_STATE = extern struct {
    Flags: DWORD,
};

pub const PCONTAINER_VOLUME_STATE = ?*CONTAINER_VOLUME_STATE;
pub const CONTAINER_ROOT_INFO_INPUT = extern struct {
    Flags: DWORD,
};

pub const PCONTAINER_ROOT_INFO_INPUT = ?*CONTAINER_ROOT_INFO_INPUT;
pub const CONTAINER_ROOT_INFO_OUTPUT = extern struct {
    ContainerRootIdLength: WORD,
    ContainerRootId: [1]BYTE,
};

pub const PCONTAINER_ROOT_INFO_OUTPUT = ?*CONTAINER_ROOT_INFO_OUTPUT;
pub const VIRTUALIZATION_INSTANCE_INFO_INPUT = extern struct {
    NumberOfWorkerThreads: DWORD,
    Flags: DWORD,
};

pub const PVIRTUALIZATION_INSTANCE_INFO_INPUT = ?*VIRTUALIZATION_INSTANCE_INFO_INPUT;
pub const VIRTUALIZATION_INSTANCE_INFO_OUTPUT = extern struct {
    VirtualizationInstanceID: GUID,
};

pub const PVIRTUALIZATION_INSTANCE_INFO_OUTPUT = ?*VIRTUALIZATION_INSTANCE_INFO_OUTPUT;
pub const GET_FILTER_FILE_IDENTIFIER_INPUT = extern struct {
    AltitudeLength: WORD,
    Altitude: [1]WCHAR,
};

pub const PGET_FILTER_FILE_IDENTIFIER_INPUT = ?*GET_FILTER_FILE_IDENTIFIER_INPUT;
pub const GET_FILTER_FILE_IDENTIFIER_OUTPUT = extern struct {
    FilterFileIdentifierLength: WORD,
    FilterFileIdentifier: [1]BYTE,
};

pub const PGET_FILTER_FILE_IDENTIFIER_OUTPUT = ?*GET_FILTER_FILE_IDENTIFIER_OUTPUT;
pub const DISK_EXTENT = extern struct {
    DiskNumber: DWORD,
    StartingOffset: LARGE_INTEGER,
    ExtentLength: LARGE_INTEGER,
};

pub const PDISK_EXTENT = ?*DISK_EXTENT;
pub const VOLUME_DISK_EXTENTS = extern struct {
    NumberOfDiskExtents: DWORD,
    Extents: [1]DISK_EXTENT,
};

pub const PVOLUME_DISK_EXTENTS = ?*VOLUME_DISK_EXTENTS;
pub const VOLUME_GET_GPT_ATTRIBUTES_INFORMATION = extern struct {
    GptAttributes: DWORDLONG,
};

pub const PVOLUME_GET_GPT_ATTRIBUTES_INFORMATION = ?*VOLUME_GET_GPT_ATTRIBUTES_INFORMATION;
pub const PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK = ?extern fn(?*IO_IRP_EXT_TRACK_OFFSET_HEADER, ?*IO_IRP_EXT_TRACK_OFFSET_HEADER, LONGLONG) void;
pub const IO_IRP_EXT_TRACK_OFFSET_HEADER = extern struct {
    Validation: WORD,
    Flags: WORD,
    TrackedOffsetCallback: PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK,
};

pub const PIO_IRP_EXT_TRACK_OFFSET_HEADER = ?*IO_IRP_EXT_TRACK_OFFSET_HEADER;
pub const UWORD = WORD;
pub const SCARD_IO_REQUEST = extern struct {
    dwProtocol: DWORD,
    cbPciLength: DWORD,
};

pub const PSCARD_IO_REQUEST = ?*SCARD_IO_REQUEST;
pub const LPSCARD_IO_REQUEST = ?*SCARD_IO_REQUEST;
pub const LPCSCARD_IO_REQUEST = ?*const SCARD_IO_REQUEST;
pub const SCARD_T0_COMMAND = extern struct {
    bCla: BYTE,
    bIns: BYTE,
    bP1: BYTE,
    bP2: BYTE,
    bP3: BYTE,
};

pub const LPSCARD_T0_COMMAND = ?*SCARD_T0_COMMAND;
pub const SCARD_T0_REQUEST = extern struct {
    ioRequest: SCARD_IO_REQUEST,
    bSw1: BYTE,
    bSw2: BYTE,
    u: extern union {
        CmdBytes: SCARD_T0_COMMAND,
        rgbHeader: [5]BYTE,
    },
};

pub const PSCARD_T0_REQUEST = ?*SCARD_T0_REQUEST;
pub const LPSCARD_T0_REQUEST = ?*SCARD_T0_REQUEST;
pub const SCARD_T1_REQUEST = extern struct {
    ioRequest: SCARD_IO_REQUEST,
};

pub const PSCARD_T1_REQUEST = ?*SCARD_T1_REQUEST;
pub const LPSCARD_T1_REQUEST = ?*SCARD_T1_REQUEST;
pub const LPCBYTE = ?*const BYTE;
pub const SCARDCONTEXT = ULONG_PTR;
pub const PSCARDCONTEXT = ?*SCARDCONTEXT;
pub const LPSCARDCONTEXT = ?*SCARDCONTEXT;
pub const SCARDHANDLE = ULONG_PTR;
pub const PSCARDHANDLE = ?*SCARDHANDLE;
pub const LPSCARDHANDLE = ?*SCARDHANDLE;
pub const SCARD_READERSTATEA = extern struct {
    szReader: LPCSTR,
    pvUserData: LPVOID,
    dwCurrentState: DWORD,
    dwEventState: DWORD,
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
};
pub const PSCARD_READERSTATEA = ?*extern struct {
    szReader: LPCSTR,
    pvUserData: LPVOID,
    dwCurrentState: DWORD,
    dwEventState: DWORD,
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
};
pub const LPSCARD_READERSTATEA = ?*extern struct {
    szReader: LPCSTR,
    pvUserData: LPVOID,
    dwCurrentState: DWORD,
    dwEventState: DWORD,
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
};
pub const SCARD_READERSTATEW = extern struct {
    szReader: LPCWSTR,
    pvUserData: LPVOID,
    dwCurrentState: DWORD,
    dwEventState: DWORD,
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
};
pub const PSCARD_READERSTATEW = ?*extern struct {
    szReader: LPCWSTR,
    pvUserData: LPVOID,
    dwCurrentState: DWORD,
    dwEventState: DWORD,
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
};
pub const LPSCARD_READERSTATEW = ?*extern struct {
    szReader: LPCWSTR,
    pvUserData: LPVOID,
    dwCurrentState: DWORD,
    dwEventState: DWORD,
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
};
pub const SCARD_ATRMASK = extern struct {
    cbAtr: DWORD,
    rgbAtr: [36]BYTE,
    rgbMask: [36]BYTE,
};

pub const PSCARD_ATRMASK = ?*SCARD_ATRMASK;
pub const LPSCARD_ATRMASK = ?*SCARD_ATRMASK;
pub const LPOCNCONNPROCA = ?extern fn(SCARDCONTEXT, LPSTR, LPSTR, PVOID) SCARDHANDLE;
pub const LPOCNCONNPROCW = ?extern fn(SCARDCONTEXT, LPWSTR, LPWSTR, PVOID) SCARDHANDLE;
pub const LPOCNCHKPROC = ?extern fn(SCARDCONTEXT, SCARDHANDLE, PVOID) BOOL;
pub const LPOCNDSCPROC = ?extern fn(SCARDCONTEXT, SCARDHANDLE, PVOID) void;
pub const OPENCARD_SEARCH_CRITERIAA = extern struct {
    dwStructSize: DWORD,
    lpstrGroupNames: LPSTR,
    nMaxGroupNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrCardNames: LPSTR,
    nMaxCardNames: DWORD,
    lpfnCheck: LPOCNCHKPROC,
    lpfnConnect: LPOCNCONNPROCA,
    lpfnDisconnect: LPOCNDSCPROC,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
};
pub const POPENCARD_SEARCH_CRITERIAA = ?*extern struct {
    dwStructSize: DWORD,
    lpstrGroupNames: LPSTR,
    nMaxGroupNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrCardNames: LPSTR,
    nMaxCardNames: DWORD,
    lpfnCheck: LPOCNCHKPROC,
    lpfnConnect: LPOCNCONNPROCA,
    lpfnDisconnect: LPOCNDSCPROC,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
};
pub const LPOPENCARD_SEARCH_CRITERIAA = ?*extern struct {
    dwStructSize: DWORD,
    lpstrGroupNames: LPSTR,
    nMaxGroupNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrCardNames: LPSTR,
    nMaxCardNames: DWORD,
    lpfnCheck: LPOCNCHKPROC,
    lpfnConnect: LPOCNCONNPROCA,
    lpfnDisconnect: LPOCNDSCPROC,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
};
pub const OPENCARD_SEARCH_CRITERIAW = extern struct {
    dwStructSize: DWORD,
    lpstrGroupNames: LPWSTR,
    nMaxGroupNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrCardNames: LPWSTR,
    nMaxCardNames: DWORD,
    lpfnCheck: LPOCNCHKPROC,
    lpfnConnect: LPOCNCONNPROCW,
    lpfnDisconnect: LPOCNDSCPROC,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
};
pub const POPENCARD_SEARCH_CRITERIAW = ?*extern struct {
    dwStructSize: DWORD,
    lpstrGroupNames: LPWSTR,
    nMaxGroupNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrCardNames: LPWSTR,
    nMaxCardNames: DWORD,
    lpfnCheck: LPOCNCHKPROC,
    lpfnConnect: LPOCNCONNPROCW,
    lpfnDisconnect: LPOCNDSCPROC,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
};
pub const LPOPENCARD_SEARCH_CRITERIAW = ?*extern struct {
    dwStructSize: DWORD,
    lpstrGroupNames: LPWSTR,
    nMaxGroupNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrCardNames: LPWSTR,
    nMaxCardNames: DWORD,
    lpfnCheck: LPOCNCHKPROC,
    lpfnConnect: LPOCNCONNPROCW,
    lpfnDisconnect: LPOCNDSCPROC,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
};
pub const OPENCARDNAME_EXA = extern struct {
    dwStructSize: DWORD,
    hSCardContext: SCARDCONTEXT,
    hwndOwner: HWND,
    dwFlags: DWORD,
    lpstrTitle: LPCSTR,
    lpstrSearchDesc: LPCSTR,
    hIcon: HICON,
    pOpenCardSearchCriteria: POPENCARD_SEARCH_CRITERIAA,
    lpfnConnect: LPOCNCONNPROCA,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    lpstrRdr: LPSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPSTR,
    nMaxCard: DWORD,
    dwActiveProtocol: DWORD,
    hCardHandle: SCARDHANDLE,
};
pub const POPENCARDNAME_EXA = ?*extern struct {
    dwStructSize: DWORD,
    hSCardContext: SCARDCONTEXT,
    hwndOwner: HWND,
    dwFlags: DWORD,
    lpstrTitle: LPCSTR,
    lpstrSearchDesc: LPCSTR,
    hIcon: HICON,
    pOpenCardSearchCriteria: POPENCARD_SEARCH_CRITERIAA,
    lpfnConnect: LPOCNCONNPROCA,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    lpstrRdr: LPSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPSTR,
    nMaxCard: DWORD,
    dwActiveProtocol: DWORD,
    hCardHandle: SCARDHANDLE,
};
pub const LPOPENCARDNAME_EXA = ?*extern struct {
    dwStructSize: DWORD,
    hSCardContext: SCARDCONTEXT,
    hwndOwner: HWND,
    dwFlags: DWORD,
    lpstrTitle: LPCSTR,
    lpstrSearchDesc: LPCSTR,
    hIcon: HICON,
    pOpenCardSearchCriteria: POPENCARD_SEARCH_CRITERIAA,
    lpfnConnect: LPOCNCONNPROCA,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    lpstrRdr: LPSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPSTR,
    nMaxCard: DWORD,
    dwActiveProtocol: DWORD,
    hCardHandle: SCARDHANDLE,
};
pub const OPENCARDNAME_EXW = extern struct {
    dwStructSize: DWORD,
    hSCardContext: SCARDCONTEXT,
    hwndOwner: HWND,
    dwFlags: DWORD,
    lpstrTitle: LPCWSTR,
    lpstrSearchDesc: LPCWSTR,
    hIcon: HICON,
    pOpenCardSearchCriteria: POPENCARD_SEARCH_CRITERIAW,
    lpfnConnect: LPOCNCONNPROCW,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    lpstrRdr: LPWSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPWSTR,
    nMaxCard: DWORD,
    dwActiveProtocol: DWORD,
    hCardHandle: SCARDHANDLE,
};
pub const POPENCARDNAME_EXW = ?*extern struct {
    dwStructSize: DWORD,
    hSCardContext: SCARDCONTEXT,
    hwndOwner: HWND,
    dwFlags: DWORD,
    lpstrTitle: LPCWSTR,
    lpstrSearchDesc: LPCWSTR,
    hIcon: HICON,
    pOpenCardSearchCriteria: POPENCARD_SEARCH_CRITERIAW,
    lpfnConnect: LPOCNCONNPROCW,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    lpstrRdr: LPWSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPWSTR,
    nMaxCard: DWORD,
    dwActiveProtocol: DWORD,
    hCardHandle: SCARDHANDLE,
};
pub const LPOPENCARDNAME_EXW = ?*extern struct {
    dwStructSize: DWORD,
    hSCardContext: SCARDCONTEXT,
    hwndOwner: HWND,
    dwFlags: DWORD,
    lpstrTitle: LPCWSTR,
    lpstrSearchDesc: LPCWSTR,
    hIcon: HICON,
    pOpenCardSearchCriteria: POPENCARD_SEARCH_CRITERIAW,
    lpfnConnect: LPOCNCONNPROCW,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    lpstrRdr: LPWSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPWSTR,
    nMaxCard: DWORD,
    dwActiveProtocol: DWORD,
    hCardHandle: SCARDHANDLE,
};
pub const READER_SEL_REQUEST_MATCH_TYPE = c_int;
pub const READER_SEL_REQUEST = extern struct {
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    MatchType: READER_SEL_REQUEST_MATCH_TYPE,
    u: extern union {
        ReaderAndContainerParameter: extern struct {
            cbReaderNameOffset: DWORD,
            cchReaderNameLength: DWORD,
            cbContainerNameOffset: DWORD,
            cchContainerNameLength: DWORD,
            dwDesiredCardModuleVersion: DWORD,
            dwCspFlags: DWORD,
        },
        SerialNumberParameter: extern struct {
            cbSerialNumberOffset: DWORD,
            cbSerialNumberLength: DWORD,
            dwDesiredCardModuleVersion: DWORD,
        },
    },
};
pub const PREADER_SEL_REQUEST = ?*extern struct {
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    MatchType: READER_SEL_REQUEST_MATCH_TYPE,
    u: extern union {
        ReaderAndContainerParameter: extern struct {
            cbReaderNameOffset: DWORD,
            cchReaderNameLength: DWORD,
            cbContainerNameOffset: DWORD,
            cchContainerNameLength: DWORD,
            dwDesiredCardModuleVersion: DWORD,
            dwCspFlags: DWORD,
        },
        SerialNumberParameter: extern struct {
            cbSerialNumberOffset: DWORD,
            cbSerialNumberLength: DWORD,
            dwDesiredCardModuleVersion: DWORD,
        },
    },
};
pub const READER_SEL_RESPONSE = extern struct {
    cbReaderNameOffset: DWORD,
    cchReaderNameLength: DWORD,
    cbCardNameOffset: DWORD,
    cchCardNameLength: DWORD,
};
pub const PREADER_SEL_RESPONSE = ?*extern struct {
    cbReaderNameOffset: DWORD,
    cchReaderNameLength: DWORD,
    cbCardNameOffset: DWORD,
    cchCardNameLength: DWORD,
};
pub const OPENCARDNAMEA = extern struct {
    dwStructSize: DWORD,
    hwndOwner: HWND,
    hSCardContext: SCARDCONTEXT,
    lpstrGroupNames: LPSTR,
    nMaxGroupNames: DWORD,
    lpstrCardNames: LPSTR,
    nMaxCardNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrRdr: LPSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPSTR,
    nMaxCard: DWORD,
    lpstrTitle: LPCSTR,
    dwFlags: DWORD,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    dwActiveProtocol: DWORD,
    lpfnConnect: LPOCNCONNPROCA,
    lpfnCheck: LPOCNCHKPROC,
    lpfnDisconnect: LPOCNDSCPROC,
    hCardHandle: SCARDHANDLE,
};
pub const POPENCARDNAMEA = ?*extern struct {
    dwStructSize: DWORD,
    hwndOwner: HWND,
    hSCardContext: SCARDCONTEXT,
    lpstrGroupNames: LPSTR,
    nMaxGroupNames: DWORD,
    lpstrCardNames: LPSTR,
    nMaxCardNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrRdr: LPSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPSTR,
    nMaxCard: DWORD,
    lpstrTitle: LPCSTR,
    dwFlags: DWORD,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    dwActiveProtocol: DWORD,
    lpfnConnect: LPOCNCONNPROCA,
    lpfnCheck: LPOCNCHKPROC,
    lpfnDisconnect: LPOCNDSCPROC,
    hCardHandle: SCARDHANDLE,
};
pub const LPOPENCARDNAMEA = ?*extern struct {
    dwStructSize: DWORD,
    hwndOwner: HWND,
    hSCardContext: SCARDCONTEXT,
    lpstrGroupNames: LPSTR,
    nMaxGroupNames: DWORD,
    lpstrCardNames: LPSTR,
    nMaxCardNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrRdr: LPSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPSTR,
    nMaxCard: DWORD,
    lpstrTitle: LPCSTR,
    dwFlags: DWORD,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    dwActiveProtocol: DWORD,
    lpfnConnect: LPOCNCONNPROCA,
    lpfnCheck: LPOCNCHKPROC,
    lpfnDisconnect: LPOCNDSCPROC,
    hCardHandle: SCARDHANDLE,
};
pub const OPENCARDNAMEW = extern struct {
    dwStructSize: DWORD,
    hwndOwner: HWND,
    hSCardContext: SCARDCONTEXT,
    lpstrGroupNames: LPWSTR,
    nMaxGroupNames: DWORD,
    lpstrCardNames: LPWSTR,
    nMaxCardNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrRdr: LPWSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPWSTR,
    nMaxCard: DWORD,
    lpstrTitle: LPCWSTR,
    dwFlags: DWORD,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    dwActiveProtocol: DWORD,
    lpfnConnect: LPOCNCONNPROCW,
    lpfnCheck: LPOCNCHKPROC,
    lpfnDisconnect: LPOCNDSCPROC,
    hCardHandle: SCARDHANDLE,
};
pub const POPENCARDNAMEW = ?*extern struct {
    dwStructSize: DWORD,
    hwndOwner: HWND,
    hSCardContext: SCARDCONTEXT,
    lpstrGroupNames: LPWSTR,
    nMaxGroupNames: DWORD,
    lpstrCardNames: LPWSTR,
    nMaxCardNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrRdr: LPWSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPWSTR,
    nMaxCard: DWORD,
    lpstrTitle: LPCWSTR,
    dwFlags: DWORD,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    dwActiveProtocol: DWORD,
    lpfnConnect: LPOCNCONNPROCW,
    lpfnCheck: LPOCNCHKPROC,
    lpfnDisconnect: LPOCNDSCPROC,
    hCardHandle: SCARDHANDLE,
};
pub const LPOPENCARDNAMEW = ?*extern struct {
    dwStructSize: DWORD,
    hwndOwner: HWND,
    hSCardContext: SCARDCONTEXT,
    lpstrGroupNames: LPWSTR,
    nMaxGroupNames: DWORD,
    lpstrCardNames: LPWSTR,
    nMaxCardNames: DWORD,
    rgguidInterfaces: LPCGUID,
    cguidInterfaces: DWORD,
    lpstrRdr: LPWSTR,
    nMaxRdr: DWORD,
    lpstrCard: LPWSTR,
    nMaxCard: DWORD,
    lpstrTitle: LPCWSTR,
    dwFlags: DWORD,
    pvUserData: LPVOID,
    dwShareMode: DWORD,
    dwPreferredProtocols: DWORD,
    dwActiveProtocol: DWORD,
    lpfnConnect: LPOCNCONNPROCW,
    lpfnCheck: LPOCNCHKPROC,
    lpfnDisconnect: LPOCNDSCPROC,
    hCardHandle: SCARDHANDLE,
};
pub const PSP = @OpaqueType();
pub const HPROPSHEETPAGE = ?*PSP;
pub const PROPSHEETPAGE_RESOURCE = LPCDLGTEMPLATE;
pub const LPFNPSPCALLBACKA = ?extern fn(HWND, UINT, ?*PROPSHEETPAGEA) UINT;
pub const PROPSHEETPAGEA = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCSTR,
    },
    pszTitle: LPCSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKA,
    pcRefParent: ?*UINT,
    pszHeaderTitle: LPCSTR,
    pszHeaderSubTitle: LPCSTR,
    hActCtx: HANDLE,
    u3: extern union {
        hbmHeader: HBITMAP,
        pszbmHeader: LPCSTR,
    },
};
pub const LPFNPSPCALLBACKW = ?extern fn(HWND, UINT, ?*PROPSHEETPAGEW) UINT;
pub const PROPSHEETPAGEW = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCWSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCWSTR,
    },
    pszTitle: LPCWSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKW,
    pcRefParent: ?*UINT,
    pszHeaderTitle: LPCWSTR,
    pszHeaderSubTitle: LPCWSTR,
    hActCtx: HANDLE,
    u3: extern union {
        hbmHeader: HBITMAP,
        pszbmHeader: LPCWSTR,
    },
};
pub const PROPSHEETPAGEA_V1 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCSTR,
    },
    pszTitle: LPCSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKA,
    pcRefParent: ?*UINT,
};

pub const LPPROPSHEETPAGEA_V1 = ?*PROPSHEETPAGEA_V1;
pub const LPCPROPSHEETPAGEA_V1 = ?*const PROPSHEETPAGEA_V1;
pub const PROPSHEETPAGEA_V2 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCSTR,
    },
    pszTitle: LPCSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKA,
    pcRefParent: ?*UINT,
    pszHeaderTitle: LPCSTR,
    pszHeaderSubTitle: LPCSTR,
};

pub const LPPROPSHEETPAGEA_V2 = ?*PROPSHEETPAGEA_V2;
pub const LPCPROPSHEETPAGEA_V2 = ?*const PROPSHEETPAGEA_V2;
pub const PROPSHEETPAGEA_V3 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCSTR,
    },
    pszTitle: LPCSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKA,
    pcRefParent: ?*UINT,
    pszHeaderTitle: LPCSTR,
    pszHeaderSubTitle: LPCSTR,
    hActCtx: HANDLE,
};

pub const LPPROPSHEETPAGEA_V3 = ?*PROPSHEETPAGEA_V3;
pub const LPCPROPSHEETPAGEA_V3 = ?*const PROPSHEETPAGEA_V3;
pub const PROPSHEETPAGEA_V4 = PROPSHEETPAGEA;
pub const LPPROPSHEETPAGEA_V4 = ?*PROPSHEETPAGEA;
pub const LPCPROPSHEETPAGEA_V4 = ?*const PROPSHEETPAGEA_V4;
pub const PROPSHEETPAGEW_V1 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCWSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCWSTR,
    },
    pszTitle: LPCWSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKW,
    pcRefParent: ?*UINT,
};

pub const LPPROPSHEETPAGEW_V1 = ?*PROPSHEETPAGEW_V1;
pub const LPCPROPSHEETPAGEW_V1 = ?*const PROPSHEETPAGEW_V1;
pub const PROPSHEETPAGEW_V2 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCWSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCWSTR,
    },
    pszTitle: LPCWSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKW,
    pcRefParent: ?*UINT,
    pszHeaderTitle: LPCWSTR,
    pszHeaderSubTitle: LPCWSTR,
};

pub const LPPROPSHEETPAGEW_V2 = ?*PROPSHEETPAGEW_V2;
pub const LPCPROPSHEETPAGEW_V2 = ?*const PROPSHEETPAGEW_V2;
pub const PROPSHEETPAGEW_V3 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hInstance: HINSTANCE,
    u: extern union {
        pszTemplate: LPCWSTR,
        pResource: PROPSHEETPAGE_RESOURCE,
    },
    u2: extern union {
        hIcon: HICON,
        pszIcon: LPCWSTR,
    },
    pszTitle: LPCWSTR,
    pfnDlgProc: DLGPROC,
    lParam: LPARAM,
    pfnCallback: LPFNPSPCALLBACKW,
    pcRefParent: ?*UINT,
    pszHeaderTitle: LPCWSTR,
    pszHeaderSubTitle: LPCWSTR,
    hActCtx: HANDLE,
};

pub const LPPROPSHEETPAGEW_V3 = ?*PROPSHEETPAGEW_V3;
pub const LPCPROPSHEETPAGEW_V3 = ?*const PROPSHEETPAGEW_V3;
pub const PROPSHEETPAGEW_V4 = PROPSHEETPAGEW;
pub const LPPROPSHEETPAGEW_V4 = ?*PROPSHEETPAGEW;
pub const LPCPROPSHEETPAGEW_V4 = ?*const PROPSHEETPAGEW_V4;
pub const PROPSHEETPAGEA_LATEST = PROPSHEETPAGEA_V4;
pub const PROPSHEETPAGEW_LATEST = PROPSHEETPAGEW_V4;
pub const LPPROPSHEETPAGEA_LATEST = LPPROPSHEETPAGEA_V4;
pub const LPPROPSHEETPAGEW_LATEST = LPPROPSHEETPAGEW_V4;
pub const LPCPROPSHEETPAGEA_LATEST = LPCPROPSHEETPAGEA_V4;
pub const LPCPROPSHEETPAGEW_LATEST = LPCPROPSHEETPAGEW_V4;
pub const LPPROPSHEETPAGEA = LPPROPSHEETPAGEA_V4;
pub const LPPROPSHEETPAGEW = LPPROPSHEETPAGEW_V4;
pub const LPCPROPSHEETPAGEA = LPCPROPSHEETPAGEA_V4;
pub const LPCPROPSHEETPAGEW = LPCPROPSHEETPAGEW_V4;
pub const PFNPROPSHEETCALLBACK = ?extern fn(HWND, UINT, LPARAM) c_int;
pub const PROPSHEETHEADERA_V1 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hwndParent: HWND,
    hInstance: HINSTANCE,
    u: extern union {
        hIcon: HICON,
        pszIcon: LPCSTR,
    },
    pszCaption: LPCSTR,
    nPages: UINT,
    u2: extern union {
        nStartPage: UINT,
        pStartPage: LPCSTR,
    },
    u3: extern union {
        ppsp: LPCPROPSHEETPAGEA,
        phpage: ?*HPROPSHEETPAGE,
    },
    pfnCallback: PFNPROPSHEETCALLBACK,
};

pub const LPPROPSHEETHEADERA_V1 = ?*PROPSHEETHEADERA_V1;
pub const LPCPROPSHEETHEADERA_V1 = ?*const PROPSHEETHEADERA_V1;
pub const PROPSHEETHEADERA_V2 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hwndParent: HWND,
    hInstance: HINSTANCE,
    u: extern union {
        hIcon: HICON,
        pszIcon: LPCSTR,
    },
    pszCaption: LPCSTR,
    nPages: UINT,
    u2: extern union {
        nStartPage: UINT,
        pStartPage: LPCSTR,
    },
    u3: extern union {
        ppsp: LPCPROPSHEETPAGEA,
        phpage: ?*HPROPSHEETPAGE,
    },
    pfnCallback: PFNPROPSHEETCALLBACK,
    u4: extern union {
        hbmWatermark: HBITMAP,
        pszbmWatermark: LPCSTR,
    },
    hplWatermark: HPALETTE,
    u5: extern union {
        hbmHeader: HBITMAP,
        pszbmHeader: LPCSTR,
    },
};

pub const LPPROPSHEETHEADERA_V2 = ?*PROPSHEETHEADERA_V2;
pub const LPCPROPSHEETHEADERA_V2 = ?*const PROPSHEETHEADERA_V2;
pub const PROPSHEETHEADERW_V1 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hwndParent: HWND,
    hInstance: HINSTANCE,
    u: extern union {
        hIcon: HICON,
        pszIcon: LPCWSTR,
    },
    pszCaption: LPCWSTR,
    nPages: UINT,
    u2: extern union {
        nStartPage: UINT,
        pStartPage: LPCWSTR,
    },
    u3: extern union {
        ppsp: LPCPROPSHEETPAGEW,
        phpage: ?*HPROPSHEETPAGE,
    },
    pfnCallback: PFNPROPSHEETCALLBACK,
};

pub const LPPROPSHEETHEADERW_V1 = ?*PROPSHEETHEADERW_V1;
pub const LPCPROPSHEETHEADERW_V1 = ?*const PROPSHEETHEADERW_V1;
pub const PROPSHEETHEADERW_V2 = extern struct {
    dwSize: DWORD,
    dwFlags: DWORD,
    hwndParent: HWND,
    hInstance: HINSTANCE,
    u: extern union {
        hIcon: HICON,
        pszIcon: LPCWSTR,
    },
    pszCaption: LPCWSTR,
    nPages: UINT,
    u2: extern union {
        nStartPage: UINT,
        pStartPage: LPCWSTR,
    },
    u3: extern union {
        ppsp: LPCPROPSHEETPAGEW,
        phpage: ?*HPROPSHEETPAGE,
    },
    pfnCallback: PFNPROPSHEETCALLBACK,
    u4: extern union {
        hbmWatermark: HBITMAP,
        pszbmWatermark: LPCWSTR,
    },
    hplWatermark: HPALETTE,
    u5: extern union {
        hbmHeader: HBITMAP,
        pszbmHeader: LPCWSTR,
    },
};

pub const LPPROPSHEETHEADERW_V2 = ?*PROPSHEETHEADERW_V2;
pub const LPCPROPSHEETHEADERW_V2 = ?*const PROPSHEETHEADERW_V2;
pub const PROPSHEETHEADERA = PROPSHEETHEADERA_V2;
pub const PROPSHEETHEADERW = PROPSHEETHEADERW_V2;
pub const LPPROPSHEETHEADERA = LPPROPSHEETHEADERA_V2;
pub const LPPROPSHEETHEADERW = LPPROPSHEETHEADERW_V2;
pub const LPCPROPSHEETHEADERA = LPCPROPSHEETHEADERA_V2;
pub const LPCPROPSHEETHEADERW = LPCPROPSHEETHEADERW_V2;
pub const LPFNADDPROPSHEETPAGE = ?extern fn(HPROPSHEETPAGE, LPARAM) BOOL;
pub const LPFNADDPROPSHEETPAGES = ?extern fn(LPVOID, LPFNADDPROPSHEETPAGE, LPARAM) BOOL;
pub const PSHNOTIFY = extern struct {
    hdr: NMHDR,
    lParam: LPARAM,
};

pub const LPPSHNOTIFY = ?*PSHNOTIFY;
pub const PRINTER_INFO_1A = extern struct {
    Flags: DWORD,
    pDescription: LPSTR,
    pName: LPSTR,
    pComment: LPSTR,
};

pub const PPRINTER_INFO_1A = ?*PRINTER_INFO_1A;
pub const LPPRINTER_INFO_1A = ?*PRINTER_INFO_1A;
pub const PRINTER_INFO_1W = extern struct {
    Flags: DWORD,
    pDescription: LPWSTR,
    pName: LPWSTR,
    pComment: LPWSTR,
};

pub const PPRINTER_INFO_1W = ?*PRINTER_INFO_1W;
pub const LPPRINTER_INFO_1W = ?*PRINTER_INFO_1W;
pub const PRINTER_INFO_2A = extern struct {
    pServerName: LPSTR,
    pPrinterName: LPSTR,
    pShareName: LPSTR,
    pPortName: LPSTR,
    pDriverName: LPSTR,
    pComment: LPSTR,
    pLocation: LPSTR,
    pDevMode: LPDEVMODEA,
    pSepFile: LPSTR,
    pPrintProcessor: LPSTR,
    pDatatype: LPSTR,
    pParameters: LPSTR,
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
    Attributes: DWORD,
    Priority: DWORD,
    DefaultPriority: DWORD,
    StartTime: DWORD,
    UntilTime: DWORD,
    Status: DWORD,
    cJobs: DWORD,
    AveragePPM: DWORD,
};

pub const PPRINTER_INFO_2A = ?*PRINTER_INFO_2A;
pub const LPPRINTER_INFO_2A = ?*PRINTER_INFO_2A;
pub const PRINTER_INFO_2W = extern struct {
    pServerName: LPWSTR,
    pPrinterName: LPWSTR,
    pShareName: LPWSTR,
    pPortName: LPWSTR,
    pDriverName: LPWSTR,
    pComment: LPWSTR,
    pLocation: LPWSTR,
    pDevMode: LPDEVMODEW,
    pSepFile: LPWSTR,
    pPrintProcessor: LPWSTR,
    pDatatype: LPWSTR,
    pParameters: LPWSTR,
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
    Attributes: DWORD,
    Priority: DWORD,
    DefaultPriority: DWORD,
    StartTime: DWORD,
    UntilTime: DWORD,
    Status: DWORD,
    cJobs: DWORD,
    AveragePPM: DWORD,
};

pub const PPRINTER_INFO_2W = ?*PRINTER_INFO_2W;
pub const LPPRINTER_INFO_2W = ?*PRINTER_INFO_2W;
pub const PRINTER_INFO_3 = extern struct {
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
};

pub const PPRINTER_INFO_3 = ?*PRINTER_INFO_3;
pub const LPPRINTER_INFO_3 = ?*PRINTER_INFO_3;
pub const PRINTER_INFO_4A = extern struct {
    pPrinterName: LPSTR,
    pServerName: LPSTR,
    Attributes: DWORD,
};

pub const PPRINTER_INFO_4A = ?*PRINTER_INFO_4A;
pub const LPPRINTER_INFO_4A = ?*PRINTER_INFO_4A;
pub const PRINTER_INFO_4W = extern struct {
    pPrinterName: LPWSTR,
    pServerName: LPWSTR,
    Attributes: DWORD,
};

pub const PPRINTER_INFO_4W = ?*PRINTER_INFO_4W;
pub const LPPRINTER_INFO_4W = ?*PRINTER_INFO_4W;
pub const PRINTER_INFO_5A = extern struct {
    pPrinterName: LPSTR,
    pPortName: LPSTR,
    Attributes: DWORD,
    DeviceNotSelectedTimeout: DWORD,
    TransmissionRetryTimeout: DWORD,
};

pub const PPRINTER_INFO_5A = ?*PRINTER_INFO_5A;
pub const LPPRINTER_INFO_5A = ?*PRINTER_INFO_5A;
pub const PRINTER_INFO_5W = extern struct {
    pPrinterName: LPWSTR,
    pPortName: LPWSTR,
    Attributes: DWORD,
    DeviceNotSelectedTimeout: DWORD,
    TransmissionRetryTimeout: DWORD,
};

pub const PPRINTER_INFO_5W = ?*PRINTER_INFO_5W;
pub const LPPRINTER_INFO_5W = ?*PRINTER_INFO_5W;
pub const PRINTER_INFO_6 = extern struct {
    dwStatus: DWORD,
};

pub const PPRINTER_INFO_6 = ?*PRINTER_INFO_6;
pub const LPPRINTER_INFO_6 = ?*PRINTER_INFO_6;
pub const PRINTER_INFO_7A = extern struct {
    pszObjectGUID: LPSTR,
    dwAction: DWORD,
};

pub const PPRINTER_INFO_7A = ?*PRINTER_INFO_7A;
pub const LPPRINTER_INFO_7A = ?*PRINTER_INFO_7A;
pub const PRINTER_INFO_7W = extern struct {
    pszObjectGUID: LPWSTR,
    dwAction: DWORD,
};

pub const PPRINTER_INFO_7W = ?*PRINTER_INFO_7W;
pub const LPPRINTER_INFO_7W = ?*PRINTER_INFO_7W;
pub const PRINTER_INFO_8A = extern struct {
    pDevMode: LPDEVMODEA,
};

pub const PPRINTER_INFO_8A = ?*PRINTER_INFO_8A;
pub const LPPRINTER_INFO_8A = ?*PRINTER_INFO_8A;
pub const PRINTER_INFO_8W = extern struct {
    pDevMode: LPDEVMODEW,
};

pub const PPRINTER_INFO_8W = ?*PRINTER_INFO_8W;
pub const LPPRINTER_INFO_8W = ?*PRINTER_INFO_8W;
pub const PRINTER_INFO_9A = extern struct {
    pDevMode: LPDEVMODEA,
};

pub const PPRINTER_INFO_9A = ?*PRINTER_INFO_9A;
pub const LPPRINTER_INFO_9A = ?*PRINTER_INFO_9A;
pub const PRINTER_INFO_9W = extern struct {
    pDevMode: LPDEVMODEW,
};

pub const PPRINTER_INFO_9W = ?*PRINTER_INFO_9W;
pub const LPPRINTER_INFO_9W = ?*PRINTER_INFO_9W;
pub const JOB_INFO_1A = extern struct {
    JobId: DWORD,
    pPrinterName: LPSTR,
    pMachineName: LPSTR,
    pUserName: LPSTR,
    pDocument: LPSTR,
    pDatatype: LPSTR,
    pStatus: LPSTR,
    Status: DWORD,
    Priority: DWORD,
    Position: DWORD,
    TotalPages: DWORD,
    PagesPrinted: DWORD,
    Submitted: SYSTEMTIME,
};

pub const PJOB_INFO_1A = ?*JOB_INFO_1A;
pub const LPJOB_INFO_1A = ?*JOB_INFO_1A;
pub const JOB_INFO_1W = extern struct {
    JobId: DWORD,
    pPrinterName: LPWSTR,
    pMachineName: LPWSTR,
    pUserName: LPWSTR,
    pDocument: LPWSTR,
    pDatatype: LPWSTR,
    pStatus: LPWSTR,
    Status: DWORD,
    Priority: DWORD,
    Position: DWORD,
    TotalPages: DWORD,
    PagesPrinted: DWORD,
    Submitted: SYSTEMTIME,
};

pub const PJOB_INFO_1W = ?*JOB_INFO_1W;
pub const LPJOB_INFO_1W = ?*JOB_INFO_1W;
pub const JOB_INFO_2A = extern struct {
    JobId: DWORD,
    pPrinterName: LPSTR,
    pMachineName: LPSTR,
    pUserName: LPSTR,
    pDocument: LPSTR,
    pNotifyName: LPSTR,
    pDatatype: LPSTR,
    pPrintProcessor: LPSTR,
    pParameters: LPSTR,
    pDriverName: LPSTR,
    pDevMode: LPDEVMODEA,
    pStatus: LPSTR,
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
    Status: DWORD,
    Priority: DWORD,
    Position: DWORD,
    StartTime: DWORD,
    UntilTime: DWORD,
    TotalPages: DWORD,
    Size: DWORD,
    Submitted: SYSTEMTIME,
    Time: DWORD,
    PagesPrinted: DWORD,
};

pub const PJOB_INFO_2A = ?*JOB_INFO_2A;
pub const LPJOB_INFO_2A = ?*JOB_INFO_2A;
pub const JOB_INFO_2W = extern struct {
    JobId: DWORD,
    pPrinterName: LPWSTR,
    pMachineName: LPWSTR,
    pUserName: LPWSTR,
    pDocument: LPWSTR,
    pNotifyName: LPWSTR,
    pDatatype: LPWSTR,
    pPrintProcessor: LPWSTR,
    pParameters: LPWSTR,
    pDriverName: LPWSTR,
    pDevMode: LPDEVMODEW,
    pStatus: LPWSTR,
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
    Status: DWORD,
    Priority: DWORD,
    Position: DWORD,
    StartTime: DWORD,
    UntilTime: DWORD,
    TotalPages: DWORD,
    Size: DWORD,
    Submitted: SYSTEMTIME,
    Time: DWORD,
    PagesPrinted: DWORD,
};

pub const PJOB_INFO_2W = ?*JOB_INFO_2W;
pub const LPJOB_INFO_2W = ?*JOB_INFO_2W;
pub const JOB_INFO_3 = extern struct {
    JobId: DWORD,
    NextJobId: DWORD,
    Reserved: DWORD,
};

pub const PJOB_INFO_3 = ?*JOB_INFO_3;
pub const LPJOB_INFO_3 = ?*JOB_INFO_3;
pub const JOB_INFO_4A = extern struct {
    JobId: DWORD,
    pPrinterName: LPSTR,
    pMachineName: LPSTR,
    pUserName: LPSTR,
    pDocument: LPSTR,
    pNotifyName: LPSTR,
    pDatatype: LPSTR,
    pPrintProcessor: LPSTR,
    pParameters: LPSTR,
    pDriverName: LPSTR,
    pDevMode: LPDEVMODEA,
    pStatus: LPSTR,
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
    Status: DWORD,
    Priority: DWORD,
    Position: DWORD,
    StartTime: DWORD,
    UntilTime: DWORD,
    TotalPages: DWORD,
    Size: DWORD,
    Submitted: SYSTEMTIME,
    Time: DWORD,
    PagesPrinted: DWORD,
    SizeHigh: LONG,
};

pub const PJOB_INFO_4A = ?*JOB_INFO_4A;
pub const LPJOB_INFO_4A = ?*JOB_INFO_4A;
pub const JOB_INFO_4W = extern struct {
    JobId: DWORD,
    pPrinterName: LPWSTR,
    pMachineName: LPWSTR,
    pUserName: LPWSTR,
    pDocument: LPWSTR,
    pNotifyName: LPWSTR,
    pDatatype: LPWSTR,
    pPrintProcessor: LPWSTR,
    pParameters: LPWSTR,
    pDriverName: LPWSTR,
    pDevMode: LPDEVMODEW,
    pStatus: LPWSTR,
    pSecurityDescriptor: PSECURITY_DESCRIPTOR,
    Status: DWORD,
    Priority: DWORD,
    Position: DWORD,
    StartTime: DWORD,
    UntilTime: DWORD,
    TotalPages: DWORD,
    Size: DWORD,
    Submitted: SYSTEMTIME,
    Time: DWORD,
    PagesPrinted: DWORD,
    SizeHigh: LONG,
};

pub const PJOB_INFO_4W = ?*JOB_INFO_4W;
pub const LPJOB_INFO_4W = ?*JOB_INFO_4W;
pub const ADDJOB_INFO_1A = extern struct {
    Path: LPSTR,
    JobId: DWORD,
};

pub const PADDJOB_INFO_1A = ?*ADDJOB_INFO_1A;
pub const LPADDJOB_INFO_1A = ?*ADDJOB_INFO_1A;
pub const ADDJOB_INFO_1W = extern struct {
    Path: LPWSTR,
    JobId: DWORD,
};

pub const PADDJOB_INFO_1W = ?*ADDJOB_INFO_1W;
pub const LPADDJOB_INFO_1W = ?*ADDJOB_INFO_1W;
pub const DRIVER_INFO_1A = extern struct {
    pName: LPSTR,
};

pub const PDRIVER_INFO_1A = ?*DRIVER_INFO_1A;
pub const LPDRIVER_INFO_1A = ?*DRIVER_INFO_1A;
pub const DRIVER_INFO_1W = extern struct {
    pName: LPWSTR,
};

pub const PDRIVER_INFO_1W = ?*DRIVER_INFO_1W;
pub const LPDRIVER_INFO_1W = ?*DRIVER_INFO_1W;
pub const DRIVER_INFO_2A = extern struct {
    cVersion: DWORD,
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDriverPath: LPSTR,
    pDataFile: LPSTR,
    pConfigFile: LPSTR,
};

pub const PDRIVER_INFO_2A = ?*DRIVER_INFO_2A;
pub const LPDRIVER_INFO_2A = ?*DRIVER_INFO_2A;
pub const DRIVER_INFO_2W = extern struct {
    cVersion: DWORD,
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDriverPath: LPWSTR,
    pDataFile: LPWSTR,
    pConfigFile: LPWSTR,
};

pub const PDRIVER_INFO_2W = ?*DRIVER_INFO_2W;
pub const LPDRIVER_INFO_2W = ?*DRIVER_INFO_2W;
pub const DRIVER_INFO_3A = extern struct {
    cVersion: DWORD,
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDriverPath: LPSTR,
    pDataFile: LPSTR,
    pConfigFile: LPSTR,
    pHelpFile: LPSTR,
    pDependentFiles: LPSTR,
    pMonitorName: LPSTR,
    pDefaultDataType: LPSTR,
};

pub const PDRIVER_INFO_3A = ?*DRIVER_INFO_3A;
pub const LPDRIVER_INFO_3A = ?*DRIVER_INFO_3A;
pub const DRIVER_INFO_3W = extern struct {
    cVersion: DWORD,
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDriverPath: LPWSTR,
    pDataFile: LPWSTR,
    pConfigFile: LPWSTR,
    pHelpFile: LPWSTR,
    pDependentFiles: LPWSTR,
    pMonitorName: LPWSTR,
    pDefaultDataType: LPWSTR,
};

pub const PDRIVER_INFO_3W = ?*DRIVER_INFO_3W;
pub const LPDRIVER_INFO_3W = ?*DRIVER_INFO_3W;
pub const DRIVER_INFO_4A = extern struct {
    cVersion: DWORD,
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDriverPath: LPSTR,
    pDataFile: LPSTR,
    pConfigFile: LPSTR,
    pHelpFile: LPSTR,
    pDependentFiles: LPSTR,
    pMonitorName: LPSTR,
    pDefaultDataType: LPSTR,
    pszzPreviousNames: LPSTR,
};

pub const PDRIVER_INFO_4A = ?*DRIVER_INFO_4A;
pub const LPDRIVER_INFO_4A = ?*DRIVER_INFO_4A;
pub const DRIVER_INFO_4W = extern struct {
    cVersion: DWORD,
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDriverPath: LPWSTR,
    pDataFile: LPWSTR,
    pConfigFile: LPWSTR,
    pHelpFile: LPWSTR,
    pDependentFiles: LPWSTR,
    pMonitorName: LPWSTR,
    pDefaultDataType: LPWSTR,
    pszzPreviousNames: LPWSTR,
};

pub const PDRIVER_INFO_4W = ?*DRIVER_INFO_4W;
pub const LPDRIVER_INFO_4W = ?*DRIVER_INFO_4W;
pub const DRIVER_INFO_5A = extern struct {
    cVersion: DWORD,
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDriverPath: LPSTR,
    pDataFile: LPSTR,
    pConfigFile: LPSTR,
    dwDriverAttributes: DWORD,
    dwConfigVersion: DWORD,
    dwDriverVersion: DWORD,
};

pub const PDRIVER_INFO_5A = ?*DRIVER_INFO_5A;
pub const LPDRIVER_INFO_5A = ?*DRIVER_INFO_5A;
pub const DRIVER_INFO_5W = extern struct {
    cVersion: DWORD,
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDriverPath: LPWSTR,
    pDataFile: LPWSTR,
    pConfigFile: LPWSTR,
    dwDriverAttributes: DWORD,
    dwConfigVersion: DWORD,
    dwDriverVersion: DWORD,
};

pub const PDRIVER_INFO_5W = ?*DRIVER_INFO_5W;
pub const LPDRIVER_INFO_5W = ?*DRIVER_INFO_5W;
pub const DRIVER_INFO_6A = extern struct {
    cVersion: DWORD,
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDriverPath: LPSTR,
    pDataFile: LPSTR,
    pConfigFile: LPSTR,
    pHelpFile: LPSTR,
    pDependentFiles: LPSTR,
    pMonitorName: LPSTR,
    pDefaultDataType: LPSTR,
    pszzPreviousNames: LPSTR,
    ftDriverDate: FILETIME,
    dwlDriverVersion: DWORDLONG,
    pszMfgName: LPSTR,
    pszOEMUrl: LPSTR,
    pszHardwareID: LPSTR,
    pszProvider: LPSTR,
};

pub const PDRIVER_INFO_6A = ?*DRIVER_INFO_6A;
pub const LPDRIVER_INFO_6A = ?*DRIVER_INFO_6A;
pub const DRIVER_INFO_6W = extern struct {
    cVersion: DWORD,
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDriverPath: LPWSTR,
    pDataFile: LPWSTR,
    pConfigFile: LPWSTR,
    pHelpFile: LPWSTR,
    pDependentFiles: LPWSTR,
    pMonitorName: LPWSTR,
    pDefaultDataType: LPWSTR,
    pszzPreviousNames: LPWSTR,
    ftDriverDate: FILETIME,
    dwlDriverVersion: DWORDLONG,
    pszMfgName: LPWSTR,
    pszOEMUrl: LPWSTR,
    pszHardwareID: LPWSTR,
    pszProvider: LPWSTR,
};

pub const PDRIVER_INFO_6W = ?*DRIVER_INFO_6W;
pub const LPDRIVER_INFO_6W = ?*DRIVER_INFO_6W;
pub const DRIVER_INFO_8A = extern struct {
    cVersion: DWORD,
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDriverPath: LPSTR,
    pDataFile: LPSTR,
    pConfigFile: LPSTR,
    pHelpFile: LPSTR,
    pDependentFiles: LPSTR,
    pMonitorName: LPSTR,
    pDefaultDataType: LPSTR,
    pszzPreviousNames: LPSTR,
    ftDriverDate: FILETIME,
    dwlDriverVersion: DWORDLONG,
    pszMfgName: LPSTR,
    pszOEMUrl: LPSTR,
    pszHardwareID: LPSTR,
    pszProvider: LPSTR,
    pszPrintProcessor: LPSTR,
    pszVendorSetup: LPSTR,
    pszzColorProfiles: LPSTR,
    pszInfPath: LPSTR,
    dwPrinterDriverAttributes: DWORD,
    pszzCoreDriverDependencies: LPSTR,
    ftMinInboxDriverVerDate: FILETIME,
    dwlMinInboxDriverVerVersion: DWORDLONG,
};

pub const PDRIVER_INFO_8A = ?*DRIVER_INFO_8A;
pub const LPDRIVER_INFO_8A = ?*DRIVER_INFO_8A;
pub const DRIVER_INFO_8W = extern struct {
    cVersion: DWORD,
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDriverPath: LPWSTR,
    pDataFile: LPWSTR,
    pConfigFile: LPWSTR,
    pHelpFile: LPWSTR,
    pDependentFiles: LPWSTR,
    pMonitorName: LPWSTR,
    pDefaultDataType: LPWSTR,
    pszzPreviousNames: LPWSTR,
    ftDriverDate: FILETIME,
    dwlDriverVersion: DWORDLONG,
    pszMfgName: LPWSTR,
    pszOEMUrl: LPWSTR,
    pszHardwareID: LPWSTR,
    pszProvider: LPWSTR,
    pszPrintProcessor: LPWSTR,
    pszVendorSetup: LPWSTR,
    pszzColorProfiles: LPWSTR,
    pszInfPath: LPWSTR,
    dwPrinterDriverAttributes: DWORD,
    pszzCoreDriverDependencies: LPWSTR,
    ftMinInboxDriverVerDate: FILETIME,
    dwlMinInboxDriverVerVersion: DWORDLONG,
};

pub const PDRIVER_INFO_8W = ?*DRIVER_INFO_8W;
pub const LPDRIVER_INFO_8W = ?*DRIVER_INFO_8W;
pub const DOC_INFO_1A = extern struct {
    pDocName: LPSTR,
    pOutputFile: LPSTR,
    pDatatype: LPSTR,
};

pub const PDOC_INFO_1A = ?*DOC_INFO_1A;
pub const LPDOC_INFO_1A = ?*DOC_INFO_1A;
pub const DOC_INFO_1W = extern struct {
    pDocName: LPWSTR,
    pOutputFile: LPWSTR,
    pDatatype: LPWSTR,
};

pub const PDOC_INFO_1W = ?*DOC_INFO_1W;
pub const LPDOC_INFO_1W = ?*DOC_INFO_1W;
pub const FORM_INFO_1A = extern struct {
    Flags: DWORD,
    pName: LPSTR,
    Size: SIZEL,
    ImageableArea: RECTL,
};

pub const PFORM_INFO_1A = ?*FORM_INFO_1A;
pub const LPFORM_INFO_1A = ?*FORM_INFO_1A;
pub const FORM_INFO_1W = extern struct {
    Flags: DWORD,
    pName: LPWSTR,
    Size: SIZEL,
    ImageableArea: RECTL,
};

pub const PFORM_INFO_1W = ?*FORM_INFO_1W;
pub const LPFORM_INFO_1W = ?*FORM_INFO_1W;
pub const FORM_INFO_2A = extern struct {
    Flags: DWORD,
    pName: LPCSTR,
    Size: SIZEL,
    ImageableArea: RECTL,
    pKeyword: LPCSTR,
    StringType: DWORD,
    pMuiDll: LPCSTR,
    dwResourceId: DWORD,
    pDisplayName: LPCSTR,
    wLangId: LANGID,
};

pub const PFORM_INFO_2A = ?*FORM_INFO_2A;
pub const LPFORM_INFO_2A = ?*FORM_INFO_2A;
pub const FORM_INFO_2W = extern struct {
    Flags: DWORD,
    pName: LPCWSTR,
    Size: SIZEL,
    ImageableArea: RECTL,
    pKeyword: LPCSTR,
    StringType: DWORD,
    pMuiDll: LPCWSTR,
    dwResourceId: DWORD,
    pDisplayName: LPCWSTR,
    wLangId: LANGID,
};

pub const PFORM_INFO_2W = ?*FORM_INFO_2W;
pub const LPFORM_INFO_2W = ?*FORM_INFO_2W;
pub const DOC_INFO_2A = extern struct {
    pDocName: LPSTR,
    pOutputFile: LPSTR,
    pDatatype: LPSTR,
    dwMode: DWORD,
    JobId: DWORD,
};

pub const PDOC_INFO_2A = ?*DOC_INFO_2A;
pub const LPDOC_INFO_2A = ?*DOC_INFO_2A;
pub const DOC_INFO_2W = extern struct {
    pDocName: LPWSTR,
    pOutputFile: LPWSTR,
    pDatatype: LPWSTR,
    dwMode: DWORD,
    JobId: DWORD,
};

pub const PDOC_INFO_2W = ?*DOC_INFO_2W;
pub const LPDOC_INFO_2W = ?*DOC_INFO_2W;
pub const DOC_INFO_3A = extern struct {
    pDocName: LPSTR,
    pOutputFile: LPSTR,
    pDatatype: LPSTR,
    dwFlags: DWORD,
};

pub const PDOC_INFO_3A = ?*DOC_INFO_3A;
pub const LPDOC_INFO_3A = ?*DOC_INFO_3A;
pub const DOC_INFO_3W = extern struct {
    pDocName: LPWSTR,
    pOutputFile: LPWSTR,
    pDatatype: LPWSTR,
    dwFlags: DWORD,
};

pub const PDOC_INFO_3W = ?*DOC_INFO_3W;
pub const LPDOC_INFO_3W = ?*DOC_INFO_3W;
pub const PRINTPROCESSOR_INFO_1A = extern struct {
    pName: LPSTR,
};

pub const PPRINTPROCESSOR_INFO_1A = ?*PRINTPROCESSOR_INFO_1A;
pub const LPPRINTPROCESSOR_INFO_1A = ?*PRINTPROCESSOR_INFO_1A;
pub const PRINTPROCESSOR_INFO_1W = extern struct {
    pName: LPWSTR,
};

pub const PPRINTPROCESSOR_INFO_1W = ?*PRINTPROCESSOR_INFO_1W;
pub const LPPRINTPROCESSOR_INFO_1W = ?*PRINTPROCESSOR_INFO_1W;
pub const PRINTPROCESSOR_CAPS_1 = extern struct {
    dwLevel: DWORD,
    dwNupOptions: DWORD,
    dwPageOrderFlags: DWORD,
    dwNumberOfCopies: DWORD,
};

pub const PPRINTPROCESSOR_CAPS_1 = ?*PRINTPROCESSOR_CAPS_1;
pub const PRINTPROCESSOR_CAPS_2 = extern struct {
    dwLevel: DWORD,
    dwNupOptions: DWORD,
    dwPageOrderFlags: DWORD,
    dwNumberOfCopies: DWORD,
    dwDuplexHandlingCaps: DWORD,
    dwNupDirectionCaps: DWORD,
    dwNupBorderCaps: DWORD,
    dwBookletHandlingCaps: DWORD,
    dwScalingCaps: DWORD,
};

pub const PPRINTPROCESSOR_CAPS_2 = ?*PRINTPROCESSOR_CAPS_2;
pub const PORT_INFO_1A = extern struct {
    pName: LPSTR,
};

pub const PPORT_INFO_1A = ?*PORT_INFO_1A;
pub const LPPORT_INFO_1A = ?*PORT_INFO_1A;
pub const PORT_INFO_1W = extern struct {
    pName: LPWSTR,
};

pub const PPORT_INFO_1W = ?*PORT_INFO_1W;
pub const LPPORT_INFO_1W = ?*PORT_INFO_1W;
pub const PORT_INFO_2A = extern struct {
    pPortName: LPSTR,
    pMonitorName: LPSTR,
    pDescription: LPSTR,
    fPortType: DWORD,
    Reserved: DWORD,
};

pub const PPORT_INFO_2A = ?*PORT_INFO_2A;
pub const LPPORT_INFO_2A = ?*PORT_INFO_2A;
pub const PORT_INFO_2W = extern struct {
    pPortName: LPWSTR,
    pMonitorName: LPWSTR,
    pDescription: LPWSTR,
    fPortType: DWORD,
    Reserved: DWORD,
};

pub const PPORT_INFO_2W = ?*PORT_INFO_2W;
pub const LPPORT_INFO_2W = ?*PORT_INFO_2W;
pub const PORT_INFO_3A = extern struct {
    dwStatus: DWORD,
    pszStatus: LPSTR,
    dwSeverity: DWORD,
};

pub const PPORT_INFO_3A = ?*PORT_INFO_3A;
pub const LPPORT_INFO_3A = ?*PORT_INFO_3A;
pub const PORT_INFO_3W = extern struct {
    dwStatus: DWORD,
    pszStatus: LPWSTR,
    dwSeverity: DWORD,
};

pub const PPORT_INFO_3W = ?*PORT_INFO_3W;
pub const LPPORT_INFO_3W = ?*PORT_INFO_3W;
pub const MONITOR_INFO_1A = extern struct {
    pName: LPSTR,
};

pub const PMONITOR_INFO_1A = ?*MONITOR_INFO_1A;
pub const LPMONITOR_INFO_1A = ?*MONITOR_INFO_1A;
pub const MONITOR_INFO_1W = extern struct {
    pName: LPWSTR,
};

pub const PMONITOR_INFO_1W = ?*MONITOR_INFO_1W;
pub const LPMONITOR_INFO_1W = ?*MONITOR_INFO_1W;
pub const MONITOR_INFO_2A = extern struct {
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDLLName: LPSTR,
};

pub const PMONITOR_INFO_2A = ?*MONITOR_INFO_2A;
pub const LPMONITOR_INFO_2A = ?*MONITOR_INFO_2A;
pub const MONITOR_INFO_2W = extern struct {
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDLLName: LPWSTR,
};

pub const PMONITOR_INFO_2W = ?*MONITOR_INFO_2W;
pub const LPMONITOR_INFO_2W = ?*MONITOR_INFO_2W;
pub const DATATYPES_INFO_1A = extern struct {
    pName: LPSTR,
};

pub const PDATATYPES_INFO_1A = ?*DATATYPES_INFO_1A;
pub const LPDATATYPES_INFO_1A = ?*DATATYPES_INFO_1A;
pub const DATATYPES_INFO_1W = extern struct {
    pName: LPWSTR,
};

pub const PDATATYPES_INFO_1W = ?*DATATYPES_INFO_1W;
pub const LPDATATYPES_INFO_1W = ?*DATATYPES_INFO_1W;
pub const PRINTER_DEFAULTSA = extern struct {
    pDatatype: LPSTR,
    pDevMode: LPDEVMODEA,
    DesiredAccess: ACCESS_MASK,
};

pub const PPRINTER_DEFAULTSA = ?*PRINTER_DEFAULTSA;
pub const LPPRINTER_DEFAULTSA = ?*PRINTER_DEFAULTSA;
pub const PRINTER_DEFAULTSW = extern struct {
    pDatatype: LPWSTR,
    pDevMode: LPDEVMODEW,
    DesiredAccess: ACCESS_MASK,
};

pub const PPRINTER_DEFAULTSW = ?*PRINTER_DEFAULTSW;
pub const LPPRINTER_DEFAULTSW = ?*PRINTER_DEFAULTSW;
pub const PRINTER_ENUM_VALUESA = extern struct {
    pValueName: LPSTR,
    cbValueName: DWORD,
    dwType: DWORD,
    pData: LPBYTE,
    cbData: DWORD,
};

pub const PPRINTER_ENUM_VALUESA = ?*PRINTER_ENUM_VALUESA;
pub const LPPRINTER_ENUM_VALUESA = ?*PRINTER_ENUM_VALUESA;
pub const PRINTER_ENUM_VALUESW = extern struct {
    pValueName: LPWSTR,
    cbValueName: DWORD,
    dwType: DWORD,
    pData: LPBYTE,
    cbData: DWORD,
};

pub const PPRINTER_ENUM_VALUESW = ?*PRINTER_ENUM_VALUESW;
pub const LPPRINTER_ENUM_VALUESW = ?*PRINTER_ENUM_VALUESW;
pub const PRINTER_NOTIFY_OPTIONS_TYPE = extern struct {
    Type: WORD,
    Reserved0: WORD,
    Reserved1: DWORD,
    Reserved2: DWORD,
    Count: DWORD,
    pFields: PWORD,
};

pub const PPRINTER_NOTIFY_OPTIONS_TYPE = ?*PRINTER_NOTIFY_OPTIONS_TYPE;
pub const LPPRINTER_NOTIFY_OPTIONS_TYPE = ?*PRINTER_NOTIFY_OPTIONS_TYPE;
pub const PRINTER_NOTIFY_OPTIONS = extern struct {
    Version: DWORD,
    Flags: DWORD,
    Count: DWORD,
    pTypes: PPRINTER_NOTIFY_OPTIONS_TYPE,
};

pub const PPRINTER_NOTIFY_OPTIONS = ?*PRINTER_NOTIFY_OPTIONS;
pub const LPPRINTER_NOTIFY_OPTIONS = ?*PRINTER_NOTIFY_OPTIONS;
pub const PRINTER_NOTIFY_INFO_DATA = extern struct {
    Type: WORD,
    Field: WORD,
    Reserved: DWORD,
    Id: DWORD,
    NotifyData: extern union {
        adwData: [2]DWORD,
        Data: extern struct {
            cbBuf: DWORD,
            pBuf: LPVOID,
        },
    },
};

pub const PPRINTER_NOTIFY_INFO_DATA = ?*PRINTER_NOTIFY_INFO_DATA;
pub const LPPRINTER_NOTIFY_INFO_DATA = ?*PRINTER_NOTIFY_INFO_DATA;
pub const PRINTER_NOTIFY_INFO = extern struct {
    Version: DWORD,
    Flags: DWORD,
    Count: DWORD,
    aData: [1]PRINTER_NOTIFY_INFO_DATA,
};

pub const PPRINTER_NOTIFY_INFO = ?*PRINTER_NOTIFY_INFO;
pub const LPPRINTER_NOTIFY_INFO = ?*PRINTER_NOTIFY_INFO;
pub const BINARY_CONTAINER = extern struct {
    cbBuf: DWORD,
    pData: LPBYTE,
};

pub const PBINARY_CONTAINER = ?*BINARY_CONTAINER;
pub const BIDI_DATA = extern struct {
    dwBidiType: DWORD,
    u: extern union {
        bData: BOOL,
        iData: LONG,
        sData: LPWSTR,
        fData: FLOAT,
        biData: BINARY_CONTAINER,
    },
};

pub const PBIDI_DATA = ?*BIDI_DATA;
pub const LPBIDI_DATA = ?*BIDI_DATA;
pub const BIDI_REQUEST_DATA = extern struct {
    dwReqNumber: DWORD,
    pSchema: LPWSTR,
    data: BIDI_DATA,
};

pub const PBIDI_REQUEST_DATA = ?*BIDI_REQUEST_DATA;
pub const LPBIDI_REQUEST_DATA = ?*BIDI_REQUEST_DATA;
pub const BIDI_REQUEST_CONTAINER = extern struct {
    Version: DWORD,
    Flags: DWORD,
    Count: DWORD,
    aData: [1]BIDI_REQUEST_DATA,
};

pub const PBIDI_REQUEST_CONTAINER = ?*BIDI_REQUEST_CONTAINER;
pub const LPBIDI_REQUEST_CONTAINER = ?*BIDI_REQUEST_CONTAINER;
pub const BIDI_RESPONSE_DATA = extern struct {
    dwResult: DWORD,
    dwReqNumber: DWORD,
    pSchema: LPWSTR,
    data: BIDI_DATA,
};

pub const PBIDI_RESPONSE_DATA = ?*BIDI_RESPONSE_DATA;
pub const LPBIDI_RESPONSE_DATA = ?*BIDI_RESPONSE_DATA;
pub const BIDI_RESPONSE_CONTAINER = extern struct {
    Version: DWORD,
    Flags: DWORD,
    Count: DWORD,
    aData: [1]BIDI_RESPONSE_DATA,
};

pub const PBIDI_RESPONSE_CONTAINER = ?*BIDI_RESPONSE_CONTAINER;
pub const LPBIDI_RESPONSE_CONTAINER = ?*BIDI_RESPONSE_CONTAINER;
pub const BIDI_TYPE = c_int;
pub const PROVIDOR_INFO_1A = extern struct {
    pName: LPSTR,
    pEnvironment: LPSTR,
    pDLLName: LPSTR,
};

pub const PPROVIDOR_INFO_1A = ?*PROVIDOR_INFO_1A;
pub const LPPROVIDOR_INFO_1A = ?*PROVIDOR_INFO_1A;
pub const PROVIDOR_INFO_1W = extern struct {
    pName: LPWSTR,
    pEnvironment: LPWSTR,
    pDLLName: LPWSTR,
};

pub const PPROVIDOR_INFO_1W = ?*PROVIDOR_INFO_1W;
pub const LPPROVIDOR_INFO_1W = ?*PROVIDOR_INFO_1W;
pub const PROVIDOR_INFO_2A = extern struct {
    pOrder: LPSTR,
};

pub const PPROVIDOR_INFO_2A = ?*PROVIDOR_INFO_2A;
pub const LPPROVIDOR_INFO_2A = ?*PROVIDOR_INFO_2A;
pub const PROVIDOR_INFO_2W = extern struct {
    pOrder: LPWSTR,
};

pub const PPROVIDOR_INFO_2W = ?*PROVIDOR_INFO_2W;
pub const LPPROVIDOR_INFO_2W = ?*PROVIDOR_INFO_2W;
pub const PRINTER_OPTION_FLAGS = c_int;

pub const PRINTER_OPTIONSA = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
};

pub const PPRINTER_OPTIONSA = ?*PRINTER_OPTIONSA;
pub const LPPRINTER_OPTIONSA = ?*PRINTER_OPTIONSA;
pub const PRINTER_OPTIONSW = extern struct {
    cbSize: UINT,
    dwFlags: DWORD,
};

pub const PPRINTER_OPTIONSW = ?*PRINTER_OPTIONSW;
pub const LPPRINTER_OPTIONSW = ?*PRINTER_OPTIONSW;
pub const PRINTER_CONNECTION_INFO_1A = extern struct {
    dwFlags: DWORD,
    pszDriverName: LPSTR,
};

pub const PPRINTER_CONNECTION_INFO_1A = ?*PRINTER_CONNECTION_INFO_1A;
pub const PRINTER_CONNECTION_INFO_1W = extern struct {
    dwFlags: DWORD,
    pszDriverName: LPWSTR,
};

pub const PPRINTER_CONNECTION_INFO_1W = ?*PRINTER_CONNECTION_INFO_1W;
pub const CORE_PRINTER_DRIVERA = extern struct {
    CoreDriverGUID: GUID,
    ftDriverDate: FILETIME,
    dwlDriverVersion: DWORDLONG,
    szPackageID: [260]CHAR,
};

pub const PCORE_PRINTER_DRIVERA = ?*CORE_PRINTER_DRIVERA;
pub const CORE_PRINTER_DRIVERW = extern struct {
    CoreDriverGUID: GUID,
    ftDriverDate: FILETIME,
    dwlDriverVersion: DWORDLONG,
    szPackageID: [260]WCHAR,
};

pub const PCORE_PRINTER_DRIVERW = ?*CORE_PRINTER_DRIVERW;
pub const EPrintPropertyType = c_int;
pub const EPrintXPSJobProgress = c_int;
pub const EPrintXPSJobOperation = c_int;
pub const PrintPropertyValue = extern struct {
    ePropertyType: EPrintPropertyType,
    value: extern union {
        propertyByte: BYTE,
        propertyString: PWSTR,
        propertyInt32: LONG,
        propertyInt64: LONGLONG,
        propertyBlob: extern struct {
            cbBuf: DWORD,
            pBuf: LPVOID,
        },
    },
};
pub const PrintNamedProperty = extern struct {
    propertyName: ?*WCHAR,
    propertyValue: PrintPropertyValue,
};
pub const PrintPropertiesCollection = extern struct {
    numberOfProperties: ULONG,
    propertiesCollection: ?*PrintNamedProperty,
};
pub const PRINT_EXECUTION_CONTEXT = c_int;
pub const PRINT_EXECUTION_DATA = extern struct {
    context: PRINT_EXECUTION_CONTEXT,
    clientAppPID: DWORD,
};
pub const max_align_t = f64;
pub const _onexit_t = ?extern fn() c_int;
pub const _purecall_handler = ?extern fn() void;
pub const _invalid_parameter_handler = ?extern fn(?*const wchar_t, ?*const wchar_t, ?*const wchar_t, c_uint, usize) void;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};

pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};

pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};

pub const _LDOUBLE = extern struct {
    ld: [10]u8,
};
pub const _CRT_DOUBLE = extern struct {
    x: f64,
};
pub const _CRT_FLOAT = extern struct {
    f: f32,
};
pub const _LONGDOUBLE = extern struct {
    x: c_longdouble,
};
pub const _LDBL12 = extern struct {
    ld12: [12]u8,
};
pub const REGCLS = c_int;

pub const COINITBASE = c_int;


pub const AsyncIUnknownVtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIUnknown, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIUnknown) ULONG,
    Release: ?extern fn(?*AsyncIUnknown) ULONG,
    Begin_QueryInterface: ?extern fn(?*AsyncIUnknown, ?*const IID) HRESULT,
    Finish_QueryInterface: ?extern fn(?*AsyncIUnknown, ?*(?*c_void)) HRESULT,
    Begin_AddRef: ?extern fn(?*AsyncIUnknown) HRESULT,
    Finish_AddRef: ?extern fn(?*AsyncIUnknown) ULONG,
    Begin_Release: ?extern fn(?*AsyncIUnknown) HRESULT,
    Finish_Release: ?extern fn(?*AsyncIUnknown) ULONG,
};
pub const AsyncIUnknown = extern struct {
    lpVtbl: ?*AsyncIUnknownVtbl,
};

pub const IClassFactoryVtbl = extern struct {
    QueryInterface: ?extern fn(?*IClassFactory, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IClassFactory) ULONG,
    Release: ?extern fn(?*IClassFactory) ULONG,
    CreateInstance: ?extern fn(?*IClassFactory, ?*IUnknown, ?*const IID, ?*(?*c_void)) HRESULT,
    LockServer: ?extern fn(?*IClassFactory, BOOL) HRESULT,
};
pub const IClassFactory = extern struct {
    lpVtbl: ?*IClassFactoryVtbl,
};
pub const LPUNKNOWN = ?*IUnknown;


pub const LPCLASSFACTORY = ?*IClassFactory;



pub const STATSTG = extern struct {
    pwcsName: LPOLESTR,
    type: DWORD,
    cbSize: ULARGE_INTEGER,
    mtime: FILETIME,
    ctime: FILETIME,
    atime: FILETIME,
    grfMode: DWORD,
    grfLocksSupported: DWORD,
    clsid: CLSID,
    grfStateBits: DWORD,
    reserved: DWORD,
};

pub const IStreamVtbl = extern struct {
    QueryInterface: ?extern fn(?*IStream, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IStream) ULONG,
    Release: ?extern fn(?*IStream) ULONG,
    Read: ?extern fn(?*IStream, ?*c_void, ULONG, ?*ULONG) HRESULT,
    Write: ?extern fn(?*IStream, ?*const c_void, ULONG, ?*ULONG) HRESULT,
    Seek: ?extern fn(?*IStream, LARGE_INTEGER, DWORD, ?*ULARGE_INTEGER) HRESULT,
    SetSize: ?extern fn(?*IStream, ULARGE_INTEGER) HRESULT,
    CopyTo: ?extern fn(?*IStream, ?*IStream, ULARGE_INTEGER, ?*ULARGE_INTEGER, ?*ULARGE_INTEGER) HRESULT,
    Commit: ?extern fn(?*IStream, DWORD) HRESULT,
    Revert: ?extern fn(?*IStream) HRESULT,
    LockRegion: ?extern fn(?*IStream, ULARGE_INTEGER, ULARGE_INTEGER, DWORD) HRESULT,
    UnlockRegion: ?extern fn(?*IStream, ULARGE_INTEGER, ULARGE_INTEGER, DWORD) HRESULT,
    Stat: ?extern fn(?*IStream, ?*STATSTG, DWORD) HRESULT,
    Clone: ?extern fn(?*IStream, ?*(?*IStream)) HRESULT,
};
pub const IStream = extern struct {
    lpVtbl: ?*IStreamVtbl,
};
pub const IMarshalVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMarshal, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMarshal) ULONG,
    Release: ?extern fn(?*IMarshal) ULONG,
    GetUnmarshalClass: ?extern fn(?*IMarshal, ?*const IID, ?*c_void, DWORD, ?*c_void, DWORD, ?*CLSID) HRESULT,
    GetMarshalSizeMax: ?extern fn(?*IMarshal, ?*const IID, ?*c_void, DWORD, ?*c_void, DWORD, ?*DWORD) HRESULT,
    MarshalInterface: ?extern fn(?*IMarshal, ?*IStream, ?*const IID, ?*c_void, DWORD, ?*c_void, DWORD) HRESULT,
    UnmarshalInterface: ?extern fn(?*IMarshal, ?*IStream, ?*const IID, ?*(?*c_void)) HRESULT,
    ReleaseMarshalData: ?extern fn(?*IMarshal, ?*IStream) HRESULT,
    DisconnectObject: ?extern fn(?*IMarshal, DWORD) HRESULT,
};
pub const IMarshal = extern struct {
    lpVtbl: ?*IMarshalVtbl,
};

pub const INoMarshalVtbl = extern struct {
    QueryInterface: ?extern fn(?*INoMarshal, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*INoMarshal) ULONG,
    Release: ?extern fn(?*INoMarshal) ULONG,
};
pub const INoMarshal = extern struct {
    lpVtbl: ?*INoMarshalVtbl,
};

pub const IAgileObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAgileObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAgileObject) ULONG,
    Release: ?extern fn(?*IAgileObject) ULONG,
};
pub const IAgileObject = extern struct {
    lpVtbl: ?*IAgileObjectVtbl,
};

pub const IActivationFilterVtbl = extern struct {
    QueryInterface: ?extern fn(?*IActivationFilter, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IActivationFilter) ULONG,
    Release: ?extern fn(?*IActivationFilter) ULONG,
    HandleActivation: ?extern fn(?*IActivationFilter, DWORD, ?*const IID, ?*CLSID) HRESULT,
};
pub const IActivationFilter = extern struct {
    lpVtbl: ?*IActivationFilterVtbl,
};

pub const IMarshal2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IMarshal2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMarshal2) ULONG,
    Release: ?extern fn(?*IMarshal2) ULONG,
    GetUnmarshalClass: ?extern fn(?*IMarshal2, ?*const IID, ?*c_void, DWORD, ?*c_void, DWORD, ?*CLSID) HRESULT,
    GetMarshalSizeMax: ?extern fn(?*IMarshal2, ?*const IID, ?*c_void, DWORD, ?*c_void, DWORD, ?*DWORD) HRESULT,
    MarshalInterface: ?extern fn(?*IMarshal2, ?*IStream, ?*const IID, ?*c_void, DWORD, ?*c_void, DWORD) HRESULT,
    UnmarshalInterface: ?extern fn(?*IMarshal2, ?*IStream, ?*const IID, ?*(?*c_void)) HRESULT,
    ReleaseMarshalData: ?extern fn(?*IMarshal2, ?*IStream) HRESULT,
    DisconnectObject: ?extern fn(?*IMarshal2, DWORD) HRESULT,
};
pub const IMarshal2 = extern struct {
    lpVtbl: ?*IMarshal2Vtbl,
};

pub const IMallocVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMalloc, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMalloc) ULONG,
    Release: ?extern fn(?*IMalloc) ULONG,
    Alloc: ?extern fn(?*IMalloc, SIZE_T) ?*c_void,
    Realloc: ?extern fn(?*IMalloc, ?*c_void, SIZE_T) ?*c_void,
    Free: ?extern fn(?*IMalloc, ?*c_void) void,
    GetSize: ?extern fn(?*IMalloc, ?*c_void) SIZE_T,
    DidAlloc: ?extern fn(?*IMalloc, ?*c_void) c_int,
    HeapMinimize: ?extern fn(?*IMalloc) void,
};
pub const IMalloc = extern struct {
    lpVtbl: ?*IMallocVtbl,
};

pub const IStdMarshalInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IStdMarshalInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IStdMarshalInfo) ULONG,
    Release: ?extern fn(?*IStdMarshalInfo) ULONG,
    GetClassForHandler: ?extern fn(?*IStdMarshalInfo, DWORD, ?*c_void, ?*CLSID) HRESULT,
};
pub const IStdMarshalInfo = extern struct {
    lpVtbl: ?*IStdMarshalInfoVtbl,
};

pub const IExternalConnectionVtbl = extern struct {
    QueryInterface: ?extern fn(?*IExternalConnection, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IExternalConnection) ULONG,
    Release: ?extern fn(?*IExternalConnection) ULONG,
    AddConnection: ?extern fn(?*IExternalConnection, DWORD, DWORD) DWORD,
    ReleaseConnection: ?extern fn(?*IExternalConnection, DWORD, DWORD, BOOL) DWORD,
};
pub const IExternalConnection = extern struct {
    lpVtbl: ?*IExternalConnectionVtbl,
};

pub const MULTI_QI = extern struct {
    pIID: ?*const IID,
    pItf: ?*IUnknown,
    hr: HRESULT,
};

pub const IMultiQIVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMultiQI, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMultiQI) ULONG,
    Release: ?extern fn(?*IMultiQI) ULONG,
    QueryMultipleInterfaces: ?extern fn(?*IMultiQI, ULONG, ?*MULTI_QI) HRESULT,
};
pub const IMultiQI = extern struct {
    lpVtbl: ?*IMultiQIVtbl,
};

pub const AsyncIMultiQIVtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIMultiQI, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIMultiQI) ULONG,
    Release: ?extern fn(?*AsyncIMultiQI) ULONG,
    Begin_QueryMultipleInterfaces: ?extern fn(?*AsyncIMultiQI, ULONG, ?*MULTI_QI) HRESULT,
    Finish_QueryMultipleInterfaces: ?extern fn(?*AsyncIMultiQI, ?*MULTI_QI) HRESULT,
};
pub const AsyncIMultiQI = extern struct {
    lpVtbl: ?*AsyncIMultiQIVtbl,
};

pub const IInternalUnknownVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternalUnknown, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternalUnknown) ULONG,
    Release: ?extern fn(?*IInternalUnknown) ULONG,
    QueryInternalInterface: ?extern fn(?*IInternalUnknown, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IInternalUnknown = extern struct {
    lpVtbl: ?*IInternalUnknownVtbl,
};

pub const IEnumUnknownVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumUnknown, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumUnknown) ULONG,
    Release: ?extern fn(?*IEnumUnknown) ULONG,
    Next: ?extern fn(?*IEnumUnknown, ULONG, ?*(?*IUnknown), ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumUnknown, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumUnknown) HRESULT,
    Clone: ?extern fn(?*IEnumUnknown, ?*(?*IEnumUnknown)) HRESULT,
};
pub const IEnumUnknown = extern struct {
    lpVtbl: ?*IEnumUnknownVtbl,
};

pub const IEnumStringVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumString, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumString) ULONG,
    Release: ?extern fn(?*IEnumString) ULONG,
    Next: ?extern fn(?*IEnumString, ULONG, ?*LPOLESTR, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumString, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumString) HRESULT,
    Clone: ?extern fn(?*IEnumString, ?*(?*IEnumString)) HRESULT,
};
pub const IEnumString = extern struct {
    lpVtbl: ?*IEnumStringVtbl,
};

pub const ISequentialStreamVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISequentialStream, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISequentialStream) ULONG,
    Release: ?extern fn(?*ISequentialStream) ULONG,
    Read: ?extern fn(?*ISequentialStream, ?*c_void, ULONG, ?*ULONG) HRESULT,
    Write: ?extern fn(?*ISequentialStream, ?*const c_void, ULONG, ?*ULONG) HRESULT,
};
pub const ISequentialStream = extern struct {
    lpVtbl: ?*ISequentialStreamVtbl,
};

pub const IRpcChannelBuffer2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcChannelBuffer2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcChannelBuffer2) ULONG,
    Release: ?extern fn(?*IRpcChannelBuffer2) ULONG,
    GetBuffer: ?extern fn(?*IRpcChannelBuffer2, ?*RPCOLEMESSAGE, ?*const IID) HRESULT,
    SendReceive: ?extern fn(?*IRpcChannelBuffer2, ?*RPCOLEMESSAGE, ?*ULONG) HRESULT,
    FreeBuffer: ?extern fn(?*IRpcChannelBuffer2, ?*RPCOLEMESSAGE) HRESULT,
    GetDestCtx: ?extern fn(?*IRpcChannelBuffer2, ?*DWORD, ?*(?*c_void)) HRESULT,
    IsConnected: ?extern fn(?*IRpcChannelBuffer2) HRESULT,
    GetProtocolVersion: ?extern fn(?*IRpcChannelBuffer2, ?*DWORD) HRESULT,
};
pub const IRpcChannelBuffer2 = extern struct {
    lpVtbl: ?*IRpcChannelBuffer2Vtbl,
};


pub const ISynchronizeVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISynchronize, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISynchronize) ULONG,
    Release: ?extern fn(?*ISynchronize) ULONG,
    Wait: ?extern fn(?*ISynchronize, DWORD, DWORD) HRESULT,
    Signal: ?extern fn(?*ISynchronize) HRESULT,
    Reset: ?extern fn(?*ISynchronize) HRESULT,
};
pub const ISynchronize = extern struct {
    lpVtbl: ?*ISynchronizeVtbl,
};
pub const IAsyncRpcChannelBufferVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAsyncRpcChannelBuffer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAsyncRpcChannelBuffer) ULONG,
    Release: ?extern fn(?*IAsyncRpcChannelBuffer) ULONG,
    GetBuffer: ?extern fn(?*IAsyncRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*const IID) HRESULT,
    SendReceive: ?extern fn(?*IAsyncRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*ULONG) HRESULT,
    FreeBuffer: ?extern fn(?*IAsyncRpcChannelBuffer, ?*RPCOLEMESSAGE) HRESULT,
    GetDestCtx: ?extern fn(?*IAsyncRpcChannelBuffer, ?*DWORD, ?*(?*c_void)) HRESULT,
    IsConnected: ?extern fn(?*IAsyncRpcChannelBuffer) HRESULT,
    GetProtocolVersion: ?extern fn(?*IAsyncRpcChannelBuffer, ?*DWORD) HRESULT,
    Send: ?extern fn(?*IAsyncRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*ISynchronize, ?*ULONG) HRESULT,
    Receive: ?extern fn(?*IAsyncRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*ULONG) HRESULT,
    GetDestCtxEx: ?extern fn(?*IAsyncRpcChannelBuffer, ?*RPCOLEMESSAGE, ?*DWORD, ?*(?*c_void)) HRESULT,
};
pub const IAsyncRpcChannelBuffer = extern struct {
    lpVtbl: ?*IAsyncRpcChannelBufferVtbl,
};


pub const IAsyncManagerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAsyncManager, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAsyncManager) ULONG,
    Release: ?extern fn(?*IAsyncManager) ULONG,
    CompleteCall: ?extern fn(?*IAsyncManager, HRESULT) HRESULT,
    GetCallContext: ?extern fn(?*IAsyncManager, ?*const IID, ?*(?*c_void)) HRESULT,
    GetState: ?extern fn(?*IAsyncManager, ?*ULONG) HRESULT,
};
pub const IAsyncManager = extern struct {
    lpVtbl: ?*IAsyncManagerVtbl,
};
pub const IRpcChannelBuffer3Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcChannelBuffer3, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcChannelBuffer3) ULONG,
    Release: ?extern fn(?*IRpcChannelBuffer3) ULONG,
    GetBuffer: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*const IID) HRESULT,
    SendReceive: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*ULONG) HRESULT,
    FreeBuffer: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE) HRESULT,
    GetDestCtx: ?extern fn(?*IRpcChannelBuffer3, ?*DWORD, ?*(?*c_void)) HRESULT,
    IsConnected: ?extern fn(?*IRpcChannelBuffer3) HRESULT,
    GetProtocolVersion: ?extern fn(?*IRpcChannelBuffer3, ?*DWORD) HRESULT,
    Send: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*ULONG) HRESULT,
    Receive: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ULONG, ?*ULONG) HRESULT,
    Cancel: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE) HRESULT,
    GetCallContext: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*const IID, ?*(?*c_void)) HRESULT,
    GetDestCtxEx: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*DWORD, ?*(?*c_void)) HRESULT,
    GetState: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*DWORD) HRESULT,
    RegisterAsync: ?extern fn(?*IRpcChannelBuffer3, ?*RPCOLEMESSAGE, ?*IAsyncManager) HRESULT,
};
pub const IRpcChannelBuffer3 = extern struct {
    lpVtbl: ?*IRpcChannelBuffer3Vtbl,
};

pub const IRpcSyntaxNegotiateVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcSyntaxNegotiate, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcSyntaxNegotiate) ULONG,
    Release: ?extern fn(?*IRpcSyntaxNegotiate) ULONG,
    NegotiateSyntax: ?extern fn(?*IRpcSyntaxNegotiate, ?*RPCOLEMESSAGE) HRESULT,
};
pub const IRpcSyntaxNegotiate = extern struct {
    lpVtbl: ?*IRpcSyntaxNegotiateVtbl,
};

pub const IRpcProxyBufferVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcProxyBuffer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcProxyBuffer) ULONG,
    Release: ?extern fn(?*IRpcProxyBuffer) ULONG,
    Connect: ?extern fn(?*IRpcProxyBuffer, ?*IRpcChannelBuffer) HRESULT,
    Disconnect: ?extern fn(?*IRpcProxyBuffer) void,
};
pub const IRpcProxyBuffer = extern struct {
    lpVtbl: ?*IRpcProxyBufferVtbl,
};

pub const IPSFactoryBufferVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPSFactoryBuffer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPSFactoryBuffer) ULONG,
    Release: ?extern fn(?*IPSFactoryBuffer) ULONG,
    CreateProxy: ?extern fn(?*IPSFactoryBuffer, ?*IUnknown, ?*const IID, ?*(?*IRpcProxyBuffer), ?*(?*c_void)) HRESULT,
    CreateStub: ?extern fn(?*IPSFactoryBuffer, ?*const IID, ?*IUnknown, ?*(?*IRpcStubBuffer)) HRESULT,
};
pub const IPSFactoryBuffer = extern struct {
    lpVtbl: ?*IPSFactoryBufferVtbl,
};

pub const IChannelHookVtbl = extern struct {
    QueryInterface: ?extern fn(?*IChannelHook, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IChannelHook) ULONG,
    Release: ?extern fn(?*IChannelHook) ULONG,
    ClientGetSize: ?extern fn(?*IChannelHook, ?*const GUID, ?*const IID, ?*ULONG) void,
    ClientFillBuffer: ?extern fn(?*IChannelHook, ?*const GUID, ?*const IID, ?*ULONG, ?*c_void) void,
    ClientNotify: ?extern fn(?*IChannelHook, ?*const GUID, ?*const IID, ULONG, ?*c_void, DWORD, HRESULT) void,
    ServerNotify: ?extern fn(?*IChannelHook, ?*const GUID, ?*const IID, ULONG, ?*c_void, DWORD) void,
    ServerGetSize: ?extern fn(?*IChannelHook, ?*const GUID, ?*const IID, HRESULT, ?*ULONG) void,
    ServerFillBuffer: ?extern fn(?*IChannelHook, ?*const GUID, ?*const IID, ?*ULONG, ?*c_void, HRESULT) void,
};
pub const IChannelHook = extern struct {
    lpVtbl: ?*IChannelHookVtbl,
};

pub const IClientSecurityVtbl = extern struct {
    QueryInterface: ?extern fn(?*IClientSecurity, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IClientSecurity) ULONG,
    Release: ?extern fn(?*IClientSecurity) ULONG,
    QueryBlanket: ?extern fn(?*IClientSecurity, ?*IUnknown, ?*DWORD, ?*DWORD, ?*(?*OLECHAR), ?*DWORD, ?*DWORD, ?*(?*c_void), ?*DWORD) HRESULT,
    SetBlanket: ?extern fn(?*IClientSecurity, ?*IUnknown, DWORD, DWORD, ?*OLECHAR, DWORD, DWORD, ?*c_void, DWORD) HRESULT,
    CopyProxy: ?extern fn(?*IClientSecurity, ?*IUnknown, ?*(?*IUnknown)) HRESULT,
};
pub const IClientSecurity = extern struct {
    lpVtbl: ?*IClientSecurityVtbl,
};

pub const IServerSecurityVtbl = extern struct {
    QueryInterface: ?extern fn(?*IServerSecurity, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IServerSecurity) ULONG,
    Release: ?extern fn(?*IServerSecurity) ULONG,
    QueryBlanket: ?extern fn(?*IServerSecurity, ?*DWORD, ?*DWORD, ?*(?*OLECHAR), ?*DWORD, ?*DWORD, ?*(?*c_void), ?*DWORD) HRESULT,
    ImpersonateClient: ?extern fn(?*IServerSecurity) HRESULT,
    RevertToSelf: ?extern fn(?*IServerSecurity) HRESULT,
    IsImpersonating: ?extern fn(?*IServerSecurity) BOOL,
};
pub const IServerSecurity = extern struct {
    lpVtbl: ?*IServerSecurityVtbl,
};

pub const RPCOPT_PROPERTIES = c_int;

pub const IRpcOptionsVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcOptions, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcOptions) ULONG,
    Release: ?extern fn(?*IRpcOptions) ULONG,
    Set: ?extern fn(?*IRpcOptions, ?*IUnknown, RPCOPT_PROPERTIES, ULONG_PTR) HRESULT,
    Query: ?extern fn(?*IRpcOptions, ?*IUnknown, RPCOPT_PROPERTIES, ?*ULONG_PTR) HRESULT,
};
pub const IRpcOptions = extern struct {
    lpVtbl: ?*IRpcOptionsVtbl,
};

pub const GLOBALOPT_PROPERTIES = c_int;

pub const IGlobalOptionsVtbl = extern struct {
    QueryInterface: ?extern fn(?*IGlobalOptions, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IGlobalOptions) ULONG,
    Release: ?extern fn(?*IGlobalOptions) ULONG,
    Set: ?extern fn(?*IGlobalOptions, GLOBALOPT_PROPERTIES, ULONG_PTR) HRESULT,
    Query: ?extern fn(?*IGlobalOptions, GLOBALOPT_PROPERTIES, ?*ULONG_PTR) HRESULT,
};
pub const IGlobalOptions = extern struct {
    lpVtbl: ?*IGlobalOptionsVtbl,
};

pub const ISurrogateVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISurrogate, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISurrogate) ULONG,
    Release: ?extern fn(?*ISurrogate) ULONG,
    LoadDllServer: ?extern fn(?*ISurrogate, ?*const IID) HRESULT,
    FreeSurrogate: ?extern fn(?*ISurrogate) HRESULT,
};
pub const ISurrogate = extern struct {
    lpVtbl: ?*ISurrogateVtbl,
};

pub const IGlobalInterfaceTableVtbl = extern struct {
    QueryInterface: ?extern fn(?*IGlobalInterfaceTable, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IGlobalInterfaceTable) ULONG,
    Release: ?extern fn(?*IGlobalInterfaceTable) ULONG,
    RegisterInterfaceInGlobal: ?extern fn(?*IGlobalInterfaceTable, ?*IUnknown, ?*const IID, ?*DWORD) HRESULT,
    RevokeInterfaceFromGlobal: ?extern fn(?*IGlobalInterfaceTable, DWORD) HRESULT,
    GetInterfaceFromGlobal: ?extern fn(?*IGlobalInterfaceTable, DWORD, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IGlobalInterfaceTable = extern struct {
    lpVtbl: ?*IGlobalInterfaceTableVtbl,
};

pub const ISynchronizeHandleVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISynchronizeHandle, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISynchronizeHandle) ULONG,
    Release: ?extern fn(?*ISynchronizeHandle) ULONG,
    GetHandle: ?extern fn(?*ISynchronizeHandle, ?*HANDLE) HRESULT,
};
pub const ISynchronizeHandle = extern struct {
    lpVtbl: ?*ISynchronizeHandleVtbl,
};

pub const ISynchronizeEventVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISynchronizeEvent, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISynchronizeEvent) ULONG,
    Release: ?extern fn(?*ISynchronizeEvent) ULONG,
    GetHandle: ?extern fn(?*ISynchronizeEvent, ?*HANDLE) HRESULT,
    SetEventHandle: ?extern fn(?*ISynchronizeEvent, ?*HANDLE) HRESULT,
};
pub const ISynchronizeEvent = extern struct {
    lpVtbl: ?*ISynchronizeEventVtbl,
};

pub const ISynchronizeContainerVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISynchronizeContainer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISynchronizeContainer) ULONG,
    Release: ?extern fn(?*ISynchronizeContainer) ULONG,
    AddSynchronize: ?extern fn(?*ISynchronizeContainer, ?*ISynchronize) HRESULT,
    WaitMultiple: ?extern fn(?*ISynchronizeContainer, DWORD, DWORD, ?*(?*ISynchronize)) HRESULT,
};
pub const ISynchronizeContainer = extern struct {
    lpVtbl: ?*ISynchronizeContainerVtbl,
};

pub const ISynchronizeMutexVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISynchronizeMutex, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISynchronizeMutex) ULONG,
    Release: ?extern fn(?*ISynchronizeMutex) ULONG,
    Wait: ?extern fn(?*ISynchronizeMutex, DWORD, DWORD) HRESULT,
    Signal: ?extern fn(?*ISynchronizeMutex) HRESULT,
    Reset: ?extern fn(?*ISynchronizeMutex) HRESULT,
    ReleaseMutex: ?extern fn(?*ISynchronizeMutex) HRESULT,
};
pub const ISynchronizeMutex = extern struct {
    lpVtbl: ?*ISynchronizeMutexVtbl,
};

pub const ICancelMethodCallsVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICancelMethodCalls, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICancelMethodCalls) ULONG,
    Release: ?extern fn(?*ICancelMethodCalls) ULONG,
    Cancel: ?extern fn(?*ICancelMethodCalls, ULONG) HRESULT,
    TestCancel: ?extern fn(?*ICancelMethodCalls) HRESULT,
};
pub const ICancelMethodCalls = extern struct {
    lpVtbl: ?*ICancelMethodCallsVtbl,
};

pub const ICallFactoryVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICallFactory, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICallFactory) ULONG,
    Release: ?extern fn(?*ICallFactory) ULONG,
    CreateCall: ?extern fn(?*ICallFactory, ?*const IID, ?*IUnknown, ?*const IID, ?*(?*IUnknown)) HRESULT,
};
pub const ICallFactory = extern struct {
    lpVtbl: ?*ICallFactoryVtbl,
};

pub const IRpcHelperVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRpcHelper, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRpcHelper) ULONG,
    Release: ?extern fn(?*IRpcHelper) ULONG,
    GetDCOMProtocolVersion: ?extern fn(?*IRpcHelper, ?*DWORD) HRESULT,
    GetIIDFromOBJREF: ?extern fn(?*IRpcHelper, ?*c_void, ?*(?*IID)) HRESULT,
};
pub const IRpcHelper = extern struct {
    lpVtbl: ?*IRpcHelperVtbl,
};

pub const IReleaseMarshalBuffersVtbl = extern struct {
    QueryInterface: ?extern fn(?*IReleaseMarshalBuffers, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IReleaseMarshalBuffers) ULONG,
    Release: ?extern fn(?*IReleaseMarshalBuffers) ULONG,
    ReleaseMarshalBuffer: ?extern fn(?*IReleaseMarshalBuffers, ?*RPCOLEMESSAGE, DWORD, ?*IUnknown) HRESULT,
};
pub const IReleaseMarshalBuffers = extern struct {
    lpVtbl: ?*IReleaseMarshalBuffersVtbl,
};

pub const IWaitMultipleVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWaitMultiple, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWaitMultiple) ULONG,
    Release: ?extern fn(?*IWaitMultiple) ULONG,
    WaitMultiple: ?extern fn(?*IWaitMultiple, DWORD, ?*(?*ISynchronize)) HRESULT,
    AddSynchronize: ?extern fn(?*IWaitMultiple, ?*ISynchronize) HRESULT,
};
pub const IWaitMultiple = extern struct {
    lpVtbl: ?*IWaitMultipleVtbl,
};

pub const IAddrTrackingControlVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAddrTrackingControl, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAddrTrackingControl) ULONG,
    Release: ?extern fn(?*IAddrTrackingControl) ULONG,
    EnableCOMDynamicAddrTracking: ?extern fn(?*IAddrTrackingControl) HRESULT,
    DisableCOMDynamicAddrTracking: ?extern fn(?*IAddrTrackingControl) HRESULT,
};
pub const IAddrTrackingControl = extern struct {
    lpVtbl: ?*IAddrTrackingControlVtbl,
};

pub const IAddrExclusionControlVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAddrExclusionControl, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAddrExclusionControl) ULONG,
    Release: ?extern fn(?*IAddrExclusionControl) ULONG,
    GetCurrentAddrExclusionList: ?extern fn(?*IAddrExclusionControl, ?*const IID, ?*(?*c_void)) HRESULT,
    UpdateAddrExclusionList: ?extern fn(?*IAddrExclusionControl, ?*IUnknown) HRESULT,
};
pub const IAddrExclusionControl = extern struct {
    lpVtbl: ?*IAddrExclusionControlVtbl,
};

pub const IPipeByteVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPipeByte, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPipeByte) ULONG,
    Release: ?extern fn(?*IPipeByte) ULONG,
    Pull: ?extern fn(?*IPipeByte, ?*BYTE, ULONG, ?*ULONG) HRESULT,
    Push: ?extern fn(?*IPipeByte, ?*BYTE, ULONG) HRESULT,
};
pub const IPipeByte = extern struct {
    lpVtbl: ?*IPipeByteVtbl,
};

pub const AsyncIPipeByteVtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIPipeByte, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIPipeByte) ULONG,
    Release: ?extern fn(?*AsyncIPipeByte) ULONG,
    Begin_Pull: ?extern fn(?*AsyncIPipeByte, ULONG) HRESULT,
    Finish_Pull: ?extern fn(?*AsyncIPipeByte, ?*BYTE, ?*ULONG) HRESULT,
    Begin_Push: ?extern fn(?*AsyncIPipeByte, ?*BYTE, ULONG) HRESULT,
    Finish_Push: ?extern fn(?*AsyncIPipeByte) HRESULT,
};
pub const AsyncIPipeByte = extern struct {
    lpVtbl: ?*AsyncIPipeByteVtbl,
};

pub const IPipeLongVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPipeLong, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPipeLong) ULONG,
    Release: ?extern fn(?*IPipeLong) ULONG,
    Pull: ?extern fn(?*IPipeLong, ?*LONG, ULONG, ?*ULONG) HRESULT,
    Push: ?extern fn(?*IPipeLong, ?*LONG, ULONG) HRESULT,
};
pub const IPipeLong = extern struct {
    lpVtbl: ?*IPipeLongVtbl,
};

pub const AsyncIPipeLongVtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIPipeLong, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIPipeLong) ULONG,
    Release: ?extern fn(?*AsyncIPipeLong) ULONG,
    Begin_Pull: ?extern fn(?*AsyncIPipeLong, ULONG) HRESULT,
    Finish_Pull: ?extern fn(?*AsyncIPipeLong, ?*LONG, ?*ULONG) HRESULT,
    Begin_Push: ?extern fn(?*AsyncIPipeLong, ?*LONG, ULONG) HRESULT,
    Finish_Push: ?extern fn(?*AsyncIPipeLong) HRESULT,
};
pub const AsyncIPipeLong = extern struct {
    lpVtbl: ?*AsyncIPipeLongVtbl,
};

pub const IPipeDoubleVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPipeDouble, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPipeDouble) ULONG,
    Release: ?extern fn(?*IPipeDouble) ULONG,
    Pull: ?extern fn(?*IPipeDouble, ?*DOUBLE, ULONG, ?*ULONG) HRESULT,
    Push: ?extern fn(?*IPipeDouble, ?*DOUBLE, ULONG) HRESULT,
};
pub const IPipeDouble = extern struct {
    lpVtbl: ?*IPipeDoubleVtbl,
};

pub const AsyncIPipeDoubleVtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIPipeDouble, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIPipeDouble) ULONG,
    Release: ?extern fn(?*AsyncIPipeDouble) ULONG,
    Begin_Pull: ?extern fn(?*AsyncIPipeDouble, ULONG) HRESULT,
    Finish_Pull: ?extern fn(?*AsyncIPipeDouble, ?*DOUBLE, ?*ULONG) HRESULT,
    Begin_Push: ?extern fn(?*AsyncIPipeDouble, ?*DOUBLE, ULONG) HRESULT,
    Finish_Push: ?extern fn(?*AsyncIPipeDouble) HRESULT,
};
pub const AsyncIPipeDouble = extern struct {
    lpVtbl: ?*AsyncIPipeDoubleVtbl,
};
pub const IEnumContextProps = @OpaqueType();

pub const IContext = @OpaqueType();

pub const IObjContext = @OpaqueType();


pub const APTTYPE = c_int;

pub const THDTYPE = c_int;

pub const IComThreadingInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IComThreadingInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IComThreadingInfo) ULONG,
    Release: ?extern fn(?*IComThreadingInfo) ULONG,
    GetCurrentApartmentType: ?extern fn(?*IComThreadingInfo, ?*APTTYPE) HRESULT,
    GetCurrentThreadType: ?extern fn(?*IComThreadingInfo, ?*THDTYPE) HRESULT,
    GetCurrentLogicalThreadId: ?extern fn(?*IComThreadingInfo, ?*GUID) HRESULT,
    SetCurrentLogicalThreadId: ?extern fn(?*IComThreadingInfo, ?*const GUID) HRESULT,
};
pub const IComThreadingInfo = extern struct {
    lpVtbl: ?*IComThreadingInfoVtbl,
};

pub const IProcessInitControlVtbl = extern struct {
    QueryInterface: ?extern fn(?*IProcessInitControl, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IProcessInitControl) ULONG,
    Release: ?extern fn(?*IProcessInitControl) ULONG,
    ResetInitializerTimeout: ?extern fn(?*IProcessInitControl, DWORD) HRESULT,
};
pub const IProcessInitControl = extern struct {
    lpVtbl: ?*IProcessInitControlVtbl,
};

pub const IFastRundownVtbl = extern struct {
    QueryInterface: ?extern fn(?*IFastRundown, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IFastRundown) ULONG,
    Release: ?extern fn(?*IFastRundown) ULONG,
};
pub const IFastRundown = extern struct {
    lpVtbl: ?*IFastRundownVtbl,
};

pub const CO_MARSHALING_CONTEXT_ATTRIBUTES = c_int;

pub const IMarshalingStreamVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMarshalingStream, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMarshalingStream) ULONG,
    Release: ?extern fn(?*IMarshalingStream) ULONG,
    Read: ?extern fn(?*IMarshalingStream, ?*c_void, ULONG, ?*ULONG) HRESULT,
    Write: ?extern fn(?*IMarshalingStream, ?*const c_void, ULONG, ?*ULONG) HRESULT,
    Seek: ?extern fn(?*IMarshalingStream, LARGE_INTEGER, DWORD, ?*ULARGE_INTEGER) HRESULT,
    SetSize: ?extern fn(?*IMarshalingStream, ULARGE_INTEGER) HRESULT,
    CopyTo: ?extern fn(?*IMarshalingStream, ?*IStream, ULARGE_INTEGER, ?*ULARGE_INTEGER, ?*ULARGE_INTEGER) HRESULT,
    Commit: ?extern fn(?*IMarshalingStream, DWORD) HRESULT,
    Revert: ?extern fn(?*IMarshalingStream) HRESULT,
    LockRegion: ?extern fn(?*IMarshalingStream, ULARGE_INTEGER, ULARGE_INTEGER, DWORD) HRESULT,
    UnlockRegion: ?extern fn(?*IMarshalingStream, ULARGE_INTEGER, ULARGE_INTEGER, DWORD) HRESULT,
    Stat: ?extern fn(?*IMarshalingStream, ?*STATSTG, DWORD) HRESULT,
    Clone: ?extern fn(?*IMarshalingStream, ?*(?*IStream)) HRESULT,
    GetMarshalingContextAttribute: ?extern fn(?*IMarshalingStream, CO_MARSHALING_CONTEXT_ATTRIBUTES, ?*ULONG_PTR) HRESULT,
};
pub const IMarshalingStream = extern struct {
    lpVtbl: ?*IMarshalingStreamVtbl,
};

pub const IAgileReferenceVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAgileReference, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAgileReference) ULONG,
    Release: ?extern fn(?*IAgileReference) ULONG,
    Resolve: ?extern fn(?*IAgileReference, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IAgileReference = extern struct {
    lpVtbl: ?*IAgileReferenceVtbl,
};
pub const COSERVERINFO = extern struct {
    dwReserved1: DWORD,
    pwszName: LPWSTR,
    pAuthInfo: ?*COAUTHINFO,
    dwReserved2: DWORD,
};

pub const LPMARSHAL = ?*IMarshal;



pub const ACTIVATIONTYPE = c_int;


pub const LPMARSHAL2 = ?*IMarshal2;

pub const LPMALLOC = ?*IMalloc;

pub const LPSTDMARSHALINFO = ?*IStdMarshalInfo;

pub const LPEXTERNALCONNECTION = ?*IExternalConnection;
pub const EXTCONN = c_int;


pub const LPMULTIQI = ?*IMultiQI;



pub const LPENUMUNKNOWN = ?*IEnumUnknown;

pub const LPENUMSTRING = ?*IEnumString;


pub const LPSTREAM = ?*IStream;
pub const STGTY = c_int;

pub const STREAM_SEEK = c_int;

pub const LOCKTYPE = c_int;


pub const PRPCOLEMESSAGE = ?*RPCOLEMESSAGE;








pub const SChannelHookCallInfo = extern struct {
    iid: IID,
    cbSize: DWORD,
    uCausality: GUID,
    dwServerPid: DWORD,
    iMethod: DWORD,
    pObject: ?*c_void,
};


pub const SOLE_AUTHENTICATION_SERVICE = extern struct {
    dwAuthnSvc: DWORD,
    dwAuthzSvc: DWORD,
    pPrincipalName: ?*OLECHAR,
    hr: HRESULT,
};

pub const PSOLE_AUTHENTICATION_SERVICE = ?*SOLE_AUTHENTICATION_SERVICE;
pub const EOLE_AUTHENTICATION_CAPABILITIES = c_int;

pub const SOLE_AUTHENTICATION_INFO = extern struct {
    dwAuthnSvc: DWORD,
    dwAuthzSvc: DWORD,
    pAuthInfo: ?*c_void,
};

pub const PSOLE_AUTHENTICATION_INFO = ?*SOLE_AUTHENTICATION_INFO;
pub const SOLE_AUTHENTICATION_LIST = extern struct {
    cAuthInfo: DWORD,
    aAuthInfo: ?*SOLE_AUTHENTICATION_INFO,
};

pub const PSOLE_AUTHENTICATION_LIST = ?*SOLE_AUTHENTICATION_LIST;


pub const RPCOPT_SERVER_LOCALITY_VALUES = c_int;


pub const GLOBALOPT_EH_VALUES = c_int;

pub const GLOBALOPT_RPCTP_VALUES = c_int;

pub const GLOBALOPT_RO_FLAGS = c_int;

pub const GLOBALOPT_UNMARSHALING_POLICY_VALUES = c_int;


pub const LPSURROGATE = ?*ISurrogate;

pub const LPGLOBALINTERFACETABLE = ?*IGlobalInterfaceTable;






pub const LPCANCELMETHODCALLS = ?*ICancelMethodCalls;

pub const DCOM_CALL_STATE = c_int;






pub const LPADDRTRACKINGCONTROL = ?*IAddrTrackingControl;

pub const LPADDREXCLUSIONCONTROL = ?*IAddrExclusionControl;







pub const APTTYPEQUALIFIER = c_int;

pub const APARTMENTID = DWORD;





pub const ServerInformation = extern struct {
    dwServerPid: DWORD,
    dwServerTid: DWORD,
    ui64ServerAddress: UINT64,
};

pub const PServerInformation = ?*ServerInformation;
pub const CO_MTA_USAGE_COOKIE__ = extern struct {
    unused: c_int,
};
pub const CO_MTA_USAGE_COOKIE = ?*CO_MTA_USAGE_COOKIE__;
pub const STDMSHLFLAGS = c_int;

pub const PROPVAR_PAD1 = WORD;
pub const PROPVAR_PAD2 = WORD;
pub const PROPVAR_PAD3 = WORD;


pub const DISPID = LONG;
pub const MEMBERID = DISPID;
pub const TYPEKIND = c_int;


pub const SAFEARRAYBOUND = extern struct {
    cElements: ULONG,
    lLbound: LONG,
};

pub const ARRAYDESC = extern struct {
    tdescElem: TYPEDESC,
    cDims: USHORT,
    rgbounds: [1]SAFEARRAYBOUND,
};
pub const HREFTYPE = DWORD;
pub const TYPEDESC = extern struct {
    u: extern union {
        lptdesc: ?*TYPEDESC,
        lpadesc: ?*ARRAYDESC,
        hreftype: HREFTYPE,
    },
    vt: VARTYPE,
};
pub const IDLDESC = extern struct {
    dwReserved: ULONG_PTR,
    wIDLFlags: USHORT,
};

pub const TYPEATTR = extern struct {
    guid: GUID,
    lcid: LCID,
    dwReserved: DWORD,
    memidConstructor: MEMBERID,
    memidDestructor: MEMBERID,
    lpstrSchema: LPOLESTR,
    cbSizeInstance: ULONG,
    typekind: TYPEKIND,
    cFuncs: WORD,
    cVars: WORD,
    cImplTypes: WORD,
    cbSizeVft: WORD,
    cbAlignment: WORD,
    wTypeFlags: WORD,
    wMajorVerNum: WORD,
    wMinorVerNum: WORD,
    tdescAlias: TYPEDESC,
    idldescType: IDLDESC,
};


pub const DESCKIND = c_int;

pub const SAFEARRAY = extern struct {
    cDims: USHORT,
    fFeatures: USHORT,
    cbElements: ULONG,
    cLocks: ULONG,
    pvData: PVOID,
    rgsabound: [1]SAFEARRAYBOUND,
};



pub const IRecordInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRecordInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRecordInfo) ULONG,
    Release: ?extern fn(?*IRecordInfo) ULONG,
    RecordInit: ?extern fn(?*IRecordInfo, PVOID) HRESULT,
    RecordClear: ?extern fn(?*IRecordInfo, PVOID) HRESULT,
    RecordCopy: ?extern fn(?*IRecordInfo, PVOID, PVOID) HRESULT,
    GetGuid: ?extern fn(?*IRecordInfo, ?*GUID) HRESULT,
    GetName: ?extern fn(?*IRecordInfo, ?*BSTR) HRESULT,
    GetSize: ?extern fn(?*IRecordInfo, ?*ULONG) HRESULT,
    GetTypeInfo: ?extern fn(?*IRecordInfo, ?*(?*ITypeInfo)) HRESULT,
    GetField: ?extern fn(?*IRecordInfo, PVOID, LPCOLESTR, ?*VARIANT) HRESULT,
    GetFieldNoCopy: ?extern fn(?*IRecordInfo, PVOID, LPCOLESTR, ?*VARIANT, ?*PVOID) HRESULT,
    PutField: ?extern fn(?*IRecordInfo, ULONG, PVOID, LPCOLESTR, ?*VARIANT) HRESULT,
    PutFieldNoCopy: ?extern fn(?*IRecordInfo, ULONG, PVOID, LPCOLESTR, ?*VARIANT) HRESULT,
    GetFieldNames: ?extern fn(?*IRecordInfo, ?*ULONG, ?*BSTR) HRESULT,
    IsMatchingType: ?extern fn(?*IRecordInfo, ?*IRecordInfo) BOOL,
    RecordCreate: ?extern fn(?*IRecordInfo) PVOID,
    RecordCreateCopy: ?extern fn(?*IRecordInfo, PVOID, ?*PVOID) HRESULT,
    RecordDestroy: ?extern fn(?*IRecordInfo, PVOID) HRESULT,
};
pub const IRecordInfo = extern struct {
    lpVtbl: ?*IRecordInfoVtbl,
};
pub const VARIANT = extern struct {
    u: extern union {
        s: extern struct {
            vt: VARTYPE,
            wReserved1: WORD,
            wReserved2: WORD,
            wReserved3: WORD,
            u: extern union {
                llVal: LONGLONG,
                lVal: LONG,
                bVal: BYTE,
                iVal: SHORT,
                fltVal: FLOAT,
                dblVal: DOUBLE,
                boolVal: VARIANT_BOOL,
                scode: SCODE,
                cyVal: CY,
                date: DATE,
                bstrVal: BSTR,
                punkVal: ?*IUnknown,
                pdispVal: ?*IDispatch,
                parray: ?*SAFEARRAY,
                pbVal: ?*BYTE,
                piVal: ?*SHORT,
                plVal: ?*LONG,
                pllVal: ?*LONGLONG,
                pfltVal: ?*FLOAT,
                pdblVal: ?*DOUBLE,
                pboolVal: ?*VARIANT_BOOL,
                pscode: ?*SCODE,
                pcyVal: ?*CY,
                pdate: ?*DATE,
                pbstrVal: ?*BSTR,
                ppunkVal: ?*(?*IUnknown),
                ppdispVal: ?*(?*IDispatch),
                pparray: ?*(?*SAFEARRAY),
                pvarVal: ?*VARIANT,
                byref: PVOID,
                cVal: CHAR,
                uiVal: USHORT,
                ulVal: ULONG,
                ullVal: ULONGLONG,
                intVal: INT,
                uintVal: UINT,
                pdecVal: ?*DECIMAL,
                pcVal: ?*CHAR,
                puiVal: ?*USHORT,
                pulVal: ?*ULONG,
                pullVal: ?*ULONGLONG,
                pintVal: ?*INT,
                puintVal: ?*UINT,
                s: extern struct {
                    pvRecord: PVOID,
                    pRecInfo: ?*IRecordInfo,
                },
            },
        },
        decVal: DECIMAL,
    },
};
pub const VARIANTARG = VARIANT;
pub const PARAMDESCEX = extern struct {
    cBytes: ULONG,
    varDefaultValue: VARIANTARG,
};
pub const LPPARAMDESCEX = ?*PARAMDESCEX;
pub const PARAMDESC = extern struct {
    pparamdescex: LPPARAMDESCEX,
    wParamFlags: USHORT,
};

pub const ELEMDESC = extern struct {
    tdesc: TYPEDESC,
    u: extern union {
        idldesc: IDLDESC,
        paramdesc: PARAMDESC,
    },
};

pub const FUNCKIND = c_int;

pub const INVOKEKIND = c_int;

pub const CALLCONV = c_int;

pub const FUNCDESC = extern struct {
    memid: MEMBERID,
    lprgscode: ?*SCODE,
    lprgelemdescParam: ?*ELEMDESC,
    funckind: FUNCKIND,
    invkind: INVOKEKIND,
    callconv: CALLCONV,
    cParams: SHORT,
    cParamsOpt: SHORT,
    oVft: SHORT,
    cScodes: SHORT,
    elemdescFunc: ELEMDESC,
    wFuncFlags: WORD,
};

pub const VARKIND = c_int;

pub const VARDESC = extern struct {
    memid: MEMBERID,
    lpstrSchema: LPOLESTR,
    u: extern union {
        oInst: ULONG,
        lpvarValue: ?*VARIANT,
    },
    elemdescVar: ELEMDESC,
    wVarFlags: WORD,
    varkind: VARKIND,
};

pub const BINDPTR = extern union {
    lpfuncdesc: ?*FUNCDESC,
    lpvardesc: ?*VARDESC,
    lptcomp: ?*ITypeComp,
};

pub const ITypeCompVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeComp, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeComp) ULONG,
    Release: ?extern fn(?*ITypeComp) ULONG,
    Bind: ?extern fn(?*ITypeComp, LPOLESTR, ULONG, WORD, ?*(?*ITypeInfo), ?*DESCKIND, ?*BINDPTR) HRESULT,
    BindType: ?extern fn(?*ITypeComp, LPOLESTR, ULONG, ?*(?*ITypeInfo), ?*(?*ITypeComp)) HRESULT,
};
pub const ITypeComp = extern struct {
    lpVtbl: ?*ITypeCompVtbl,
};
pub const DISPPARAMS = extern struct {
    rgvarg: ?*VARIANTARG,
    rgdispidNamedArgs: ?*DISPID,
    cArgs: UINT,
    cNamedArgs: UINT,
};

pub const EXCEPINFO = extern struct {
    wCode: WORD,
    wReserved: WORD,
    bstrSource: BSTR,
    bstrDescription: BSTR,
    bstrHelpFile: BSTR,
    dwHelpContext: DWORD,
    pvReserved: PVOID,
    pfnDeferredFillIn: ?extern fn(?*EXCEPINFO) HRESULT,
    scode: SCODE,
};


pub const SYSKIND = c_int;

pub const TLIBATTR = extern struct {
    guid: GUID,
    lcid: LCID,
    syskind: SYSKIND,
    wMajorVerNum: WORD,
    wMinorVerNum: WORD,
    wLibFlags: WORD,
};

pub const ITypeLibVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeLib, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeLib) ULONG,
    Release: ?extern fn(?*ITypeLib) ULONG,
    GetTypeInfoCount: ?extern fn(?*ITypeLib) UINT,
    GetTypeInfo: ?extern fn(?*ITypeLib, UINT, ?*(?*ITypeInfo)) HRESULT,
    GetTypeInfoType: ?extern fn(?*ITypeLib, UINT, ?*TYPEKIND) HRESULT,
    GetTypeInfoOfGuid: ?extern fn(?*ITypeLib, ?*const GUID, ?*(?*ITypeInfo)) HRESULT,
    GetLibAttr: ?extern fn(?*ITypeLib, ?*(?*TLIBATTR)) HRESULT,
    GetTypeComp: ?extern fn(?*ITypeLib, ?*(?*ITypeComp)) HRESULT,
    GetDocumentation: ?extern fn(?*ITypeLib, INT, ?*BSTR, ?*BSTR, ?*DWORD, ?*BSTR) HRESULT,
    IsName: ?extern fn(?*ITypeLib, LPOLESTR, ULONG, ?*BOOL) HRESULT,
    FindName: ?extern fn(?*ITypeLib, LPOLESTR, ULONG, ?*(?*ITypeInfo), ?*MEMBERID, ?*USHORT) HRESULT,
    ReleaseTLibAttr: ?extern fn(?*ITypeLib, ?*TLIBATTR) void,
};
pub const ITypeLib = extern struct {
    lpVtbl: ?*ITypeLibVtbl,
};
pub const ITypeInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeInfo) ULONG,
    Release: ?extern fn(?*ITypeInfo) ULONG,
    GetTypeAttr: ?extern fn(?*ITypeInfo, ?*(?*TYPEATTR)) HRESULT,
    GetTypeComp: ?extern fn(?*ITypeInfo, ?*(?*ITypeComp)) HRESULT,
    GetFuncDesc: ?extern fn(?*ITypeInfo, UINT, ?*(?*FUNCDESC)) HRESULT,
    GetVarDesc: ?extern fn(?*ITypeInfo, UINT, ?*(?*VARDESC)) HRESULT,
    GetNames: ?extern fn(?*ITypeInfo, MEMBERID, ?*BSTR, UINT, ?*UINT) HRESULT,
    GetRefTypeOfImplType: ?extern fn(?*ITypeInfo, UINT, ?*HREFTYPE) HRESULT,
    GetImplTypeFlags: ?extern fn(?*ITypeInfo, UINT, ?*INT) HRESULT,
    GetIDsOfNames: ?extern fn(?*ITypeInfo, ?*LPOLESTR, UINT, ?*MEMBERID) HRESULT,
    Invoke: ?extern fn(?*ITypeInfo, PVOID, MEMBERID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    GetDocumentation: ?extern fn(?*ITypeInfo, MEMBERID, ?*BSTR, ?*BSTR, ?*DWORD, ?*BSTR) HRESULT,
    GetDllEntry: ?extern fn(?*ITypeInfo, MEMBERID, INVOKEKIND, ?*BSTR, ?*BSTR, ?*WORD) HRESULT,
    GetRefTypeInfo: ?extern fn(?*ITypeInfo, HREFTYPE, ?*(?*ITypeInfo)) HRESULT,
    AddressOfMember: ?extern fn(?*ITypeInfo, MEMBERID, INVOKEKIND, ?*PVOID) HRESULT,
    CreateInstance: ?extern fn(?*ITypeInfo, ?*IUnknown, ?*const IID, ?*PVOID) HRESULT,
    GetMops: ?extern fn(?*ITypeInfo, MEMBERID, ?*BSTR) HRESULT,
    GetContainingTypeLib: ?extern fn(?*ITypeInfo, ?*(?*ITypeLib), ?*UINT) HRESULT,
    ReleaseTypeAttr: ?extern fn(?*ITypeInfo, ?*TYPEATTR) void,
    ReleaseFuncDesc: ?extern fn(?*ITypeInfo, ?*FUNCDESC) void,
    ReleaseVarDesc: ?extern fn(?*ITypeInfo, ?*VARDESC) void,
};
pub const ITypeInfo = extern struct {
    lpVtbl: ?*ITypeInfoVtbl,
};
pub const IDispatchVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDispatch, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDispatch) ULONG,
    Release: ?extern fn(?*IDispatch) ULONG,
    GetTypeInfoCount: ?extern fn(?*IDispatch, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IDispatch, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IDispatch, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IDispatch, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
};
pub const IDispatch = extern struct {
    lpVtbl: ?*IDispatchVtbl,
};

pub const SNB = ?*LPOLESTR;

pub const IEnumSTATSTGVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumSTATSTG, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumSTATSTG) ULONG,
    Release: ?extern fn(?*IEnumSTATSTG) ULONG,
    Next: ?extern fn(?*IEnumSTATSTG, ULONG, ?*STATSTG, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumSTATSTG, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumSTATSTG) HRESULT,
    Clone: ?extern fn(?*IEnumSTATSTG, ?*(?*IEnumSTATSTG)) HRESULT,
};
pub const IEnumSTATSTG = extern struct {
    lpVtbl: ?*IEnumSTATSTGVtbl,
};
pub const IStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*IStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IStorage) ULONG,
    Release: ?extern fn(?*IStorage) ULONG,
    CreateStream: ?extern fn(?*IStorage, ?*const OLECHAR, DWORD, DWORD, DWORD, ?*(?*IStream)) HRESULT,
    OpenStream: ?extern fn(?*IStorage, ?*const OLECHAR, ?*c_void, DWORD, DWORD, ?*(?*IStream)) HRESULT,
    CreateStorage: ?extern fn(?*IStorage, ?*const OLECHAR, DWORD, DWORD, DWORD, ?*(?*IStorage)) HRESULT,
    OpenStorage: ?extern fn(?*IStorage, ?*const OLECHAR, ?*IStorage, DWORD, SNB, DWORD, ?*(?*IStorage)) HRESULT,
    CopyTo: ?extern fn(?*IStorage, DWORD, ?*const IID, SNB, ?*IStorage) HRESULT,
    MoveElementTo: ?extern fn(?*IStorage, ?*const OLECHAR, ?*IStorage, ?*const OLECHAR, DWORD) HRESULT,
    Commit: ?extern fn(?*IStorage, DWORD) HRESULT,
    Revert: ?extern fn(?*IStorage) HRESULT,
    EnumElements: ?extern fn(?*IStorage, DWORD, ?*c_void, DWORD, ?*(?*IEnumSTATSTG)) HRESULT,
    DestroyElement: ?extern fn(?*IStorage, ?*const OLECHAR) HRESULT,
    RenameElement: ?extern fn(?*IStorage, ?*const OLECHAR, ?*const OLECHAR) HRESULT,
    SetElementTimes: ?extern fn(?*IStorage, ?*const OLECHAR, ?*const FILETIME, ?*const FILETIME, ?*const FILETIME) HRESULT,
    SetClass: ?extern fn(?*IStorage, ?*const IID) HRESULT,
    SetStateBits: ?extern fn(?*IStorage, DWORD, DWORD) HRESULT,
    Stat: ?extern fn(?*IStorage, ?*STATSTG, DWORD) HRESULT,
};
pub const IStorage = extern struct {
    lpVtbl: ?*IStorageVtbl,
};
pub const VersionedStream = extern struct {
    guidVersion: GUID,
    pStream: ?*IStream,
};
pub const LPVERSIONEDSTREAM = ?*VersionedStream;
pub const LPSAFEARRAY = ?*SAFEARRAY;
pub const CAC = extern struct {
    cElems: ULONG,
    pElems: ?*CHAR,
};

pub const CAUB = extern struct {
    cElems: ULONG,
    pElems: ?*UCHAR,
};

pub const CAI = extern struct {
    cElems: ULONG,
    pElems: ?*SHORT,
};

pub const CAUI = extern struct {
    cElems: ULONG,
    pElems: ?*USHORT,
};

pub const CAL = extern struct {
    cElems: ULONG,
    pElems: ?*LONG,
};

pub const CAUL = extern struct {
    cElems: ULONG,
    pElems: ?*ULONG,
};

pub const CAH = extern struct {
    cElems: ULONG,
    pElems: ?*LARGE_INTEGER,
};

pub const CAUH = extern struct {
    cElems: ULONG,
    pElems: ?*ULARGE_INTEGER,
};

pub const CAFLT = extern struct {
    cElems: ULONG,
    pElems: ?*FLOAT,
};

pub const CADBL = extern struct {
    cElems: ULONG,
    pElems: ?*DOUBLE,
};

pub const CABOOL = extern struct {
    cElems: ULONG,
    pElems: ?*VARIANT_BOOL,
};

pub const CASCODE = extern struct {
    cElems: ULONG,
    pElems: ?*SCODE,
};

pub const CACY = extern struct {
    cElems: ULONG,
    pElems: ?*CY,
};

pub const CADATE = extern struct {
    cElems: ULONG,
    pElems: ?*DATE,
};

pub const CAFILETIME = extern struct {
    cElems: ULONG,
    pElems: ?*FILETIME,
};

pub const CACLSID = extern struct {
    cElems: ULONG,
    pElems: ?*CLSID,
};

pub const CACLIPDATA = extern struct {
    cElems: ULONG,
    pElems: ?*CLIPDATA,
};

pub const CABSTR = extern struct {
    cElems: ULONG,
    pElems: ?*BSTR,
};

pub const CABSTRBLOB = extern struct {
    cElems: ULONG,
    pElems: ?*BSTRBLOB,
};

pub const CALPSTR = extern struct {
    cElems: ULONG,
    pElems: ?*LPSTR,
};

pub const CALPWSTR = extern struct {
    cElems: ULONG,
    pElems: ?*LPWSTR,
};


pub const CAPROPVARIANT = extern struct {
    cElems: ULONG,
    pElems: ?*PROPVARIANT,
};

pub const PROPVARIANT = extern struct {
    u: extern union {
        s: extern struct {
            vt: VARTYPE,
            wReserved1: PROPVAR_PAD1,
            wReserved2: PROPVAR_PAD2,
            wReserved3: PROPVAR_PAD3,
            u: extern union {
                cVal: CHAR,
                bVal: UCHAR,
                iVal: SHORT,
                uiVal: USHORT,
                lVal: LONG,
                ulVal: ULONG,
                intVal: INT,
                uintVal: UINT,
                hVal: LARGE_INTEGER,
                uhVal: ULARGE_INTEGER,
                fltVal: FLOAT,
                dblVal: DOUBLE,
                boolVal: VARIANT_BOOL,
                scode: SCODE,
                cyVal: CY,
                date: DATE,
                filetime: FILETIME,
                puuid: ?*CLSID,
                pclipdata: ?*CLIPDATA,
                bstrVal: BSTR,
                bstrblobVal: BSTRBLOB,
                blob: BLOB,
                pszVal: LPSTR,
                pwszVal: LPWSTR,
                punkVal: ?*IUnknown,
                pdispVal: ?*IDispatch,
                pStream: ?*IStream,
                pStorage: ?*IStorage,
                pVersionedStream: LPVERSIONEDSTREAM,
                parray: LPSAFEARRAY,
                cac: CAC,
                caub: CAUB,
                cai: CAI,
                caui: CAUI,
                cal: CAL,
                caul: CAUL,
                cah: CAH,
                cauh: CAUH,
                caflt: CAFLT,
                cadbl: CADBL,
                cabool: CABOOL,
                cascode: CASCODE,
                cacy: CACY,
                cadate: CADATE,
                cafiletime: CAFILETIME,
                cauuid: CACLSID,
                caclipdata: CACLIPDATA,
                cabstr: CABSTR,
                cabstrblob: CABSTRBLOB,
                calpstr: CALPSTR,
                calpwstr: CALPWSTR,
                capropvar: CAPROPVARIANT,
                pcVal: ?*CHAR,
                pbVal: ?*UCHAR,
                piVal: ?*SHORT,
                puiVal: ?*USHORT,
                plVal: ?*LONG,
                pulVal: ?*ULONG,
                pintVal: ?*INT,
                puintVal: ?*UINT,
                pfltVal: ?*FLOAT,
                pdblVal: ?*DOUBLE,
                pboolVal: ?*VARIANT_BOOL,
                pdecVal: ?*DECIMAL,
                pscode: ?*SCODE,
                pcyVal: ?*CY,
                pdate: ?*DATE,
                pbstrVal: ?*BSTR,
                ppunkVal: ?*(?*IUnknown),
                ppdispVal: ?*(?*IDispatch),
                pparray: ?*LPSAFEARRAY,
                pvarVal: ?*PROPVARIANT,
            },
        },
        decVal: DECIMAL,
    },
};
pub const COWAIT_FLAGS = c_int;

pub const CWMO_FLAGS = c_int;

pub const AgileReferenceOptions = c_int;
pub const LPFNGETCLASSOBJECT = ?extern fn(?*const IID, ?*const IID, ?*LPVOID) HRESULT;
pub const LPFNCANUNLOADNOW = ?extern fn() HRESULT;

pub const IMallocSpyVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMallocSpy, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMallocSpy) ULONG,
    Release: ?extern fn(?*IMallocSpy) ULONG,
    PreAlloc: ?extern fn(?*IMallocSpy, SIZE_T) SIZE_T,
    PostAlloc: ?extern fn(?*IMallocSpy, ?*c_void) ?*c_void,
    PreFree: ?extern fn(?*IMallocSpy, ?*c_void, BOOL) ?*c_void,
    PostFree: ?extern fn(?*IMallocSpy, BOOL) void,
    PreRealloc: ?extern fn(?*IMallocSpy, ?*c_void, SIZE_T, ?*(?*c_void), BOOL) SIZE_T,
    PostRealloc: ?extern fn(?*IMallocSpy, ?*c_void, BOOL) ?*c_void,
    PreGetSize: ?extern fn(?*IMallocSpy, ?*c_void, BOOL) ?*c_void,
    PostGetSize: ?extern fn(?*IMallocSpy, SIZE_T, BOOL) SIZE_T,
    PreDidAlloc: ?extern fn(?*IMallocSpy, ?*c_void, BOOL) ?*c_void,
    PostDidAlloc: ?extern fn(?*IMallocSpy, ?*c_void, BOOL, c_int) c_int,
    PreHeapMinimize: ?extern fn(?*IMallocSpy) void,
    PostHeapMinimize: ?extern fn(?*IMallocSpy) void,
};
pub const IMallocSpy = extern struct {
    lpVtbl: ?*IMallocSpyVtbl,
};

pub const BIND_OPTS = extern struct {
    cbStruct: DWORD,
    grfFlags: DWORD,
    grfMode: DWORD,
    dwTickCountDeadline: DWORD,
};




pub const IEnumMonikerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumMoniker, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumMoniker) ULONG,
    Release: ?extern fn(?*IEnumMoniker) ULONG,
    Next: ?extern fn(?*IEnumMoniker, ULONG, ?*(?*IMoniker), ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumMoniker, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumMoniker) HRESULT,
    Clone: ?extern fn(?*IEnumMoniker, ?*(?*IEnumMoniker)) HRESULT,
};
pub const IEnumMoniker = extern struct {
    lpVtbl: ?*IEnumMonikerVtbl,
};
pub const IMonikerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMoniker, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMoniker) ULONG,
    Release: ?extern fn(?*IMoniker) ULONG,
    GetClassID: ?extern fn(?*IMoniker, ?*CLSID) HRESULT,
    IsDirty: ?extern fn(?*IMoniker) HRESULT,
    Load: ?extern fn(?*IMoniker, ?*IStream) HRESULT,
    Save: ?extern fn(?*IMoniker, ?*IStream, BOOL) HRESULT,
    GetSizeMax: ?extern fn(?*IMoniker, ?*ULARGE_INTEGER) HRESULT,
    BindToObject: ?extern fn(?*IMoniker, ?*IBindCtx, ?*IMoniker, ?*const IID, ?*(?*c_void)) HRESULT,
    BindToStorage: ?extern fn(?*IMoniker, ?*IBindCtx, ?*IMoniker, ?*const IID, ?*(?*c_void)) HRESULT,
    Reduce: ?extern fn(?*IMoniker, ?*IBindCtx, DWORD, ?*(?*IMoniker), ?*(?*IMoniker)) HRESULT,
    ComposeWith: ?extern fn(?*IMoniker, ?*IMoniker, BOOL, ?*(?*IMoniker)) HRESULT,
    Enum: ?extern fn(?*IMoniker, BOOL, ?*(?*IEnumMoniker)) HRESULT,
    IsEqual: ?extern fn(?*IMoniker, ?*IMoniker) HRESULT,
    Hash: ?extern fn(?*IMoniker, ?*DWORD) HRESULT,
    IsRunning: ?extern fn(?*IMoniker, ?*IBindCtx, ?*IMoniker, ?*IMoniker) HRESULT,
    GetTimeOfLastChange: ?extern fn(?*IMoniker, ?*IBindCtx, ?*IMoniker, ?*FILETIME) HRESULT,
    Inverse: ?extern fn(?*IMoniker, ?*(?*IMoniker)) HRESULT,
    CommonPrefixWith: ?extern fn(?*IMoniker, ?*IMoniker, ?*(?*IMoniker)) HRESULT,
    RelativePathTo: ?extern fn(?*IMoniker, ?*IMoniker, ?*(?*IMoniker)) HRESULT,
    GetDisplayName: ?extern fn(?*IMoniker, ?*IBindCtx, ?*IMoniker, ?*LPOLESTR) HRESULT,
    ParseDisplayName: ?extern fn(?*IMoniker, ?*IBindCtx, ?*IMoniker, LPOLESTR, ?*ULONG, ?*(?*IMoniker)) HRESULT,
    IsSystemMoniker: ?extern fn(?*IMoniker, ?*DWORD) HRESULT,
};
pub const IMoniker = extern struct {
    lpVtbl: ?*IMonikerVtbl,
};
pub const IRunningObjectTableVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRunningObjectTable, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRunningObjectTable) ULONG,
    Release: ?extern fn(?*IRunningObjectTable) ULONG,
    Register: ?extern fn(?*IRunningObjectTable, DWORD, ?*IUnknown, ?*IMoniker, ?*DWORD) HRESULT,
    Revoke: ?extern fn(?*IRunningObjectTable, DWORD) HRESULT,
    IsRunning: ?extern fn(?*IRunningObjectTable, ?*IMoniker) HRESULT,
    GetObjectA: ?extern fn(?*IRunningObjectTable, ?*IMoniker, ?*(?*IUnknown)) HRESULT,
    NoteChangeTime: ?extern fn(?*IRunningObjectTable, DWORD, ?*FILETIME) HRESULT,
    GetTimeOfLastChange: ?extern fn(?*IRunningObjectTable, ?*IMoniker, ?*FILETIME) HRESULT,
    EnumRunning: ?extern fn(?*IRunningObjectTable, ?*(?*IEnumMoniker)) HRESULT,
};
pub const IRunningObjectTable = extern struct {
    lpVtbl: ?*IRunningObjectTableVtbl,
};
pub const IBindCtxVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindCtx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindCtx) ULONG,
    Release: ?extern fn(?*IBindCtx) ULONG,
    RegisterObjectBound: ?extern fn(?*IBindCtx, ?*IUnknown) HRESULT,
    RevokeObjectBound: ?extern fn(?*IBindCtx, ?*IUnknown) HRESULT,
    ReleaseBoundObjects: ?extern fn(?*IBindCtx) HRESULT,
    SetBindOptions: ?extern fn(?*IBindCtx, ?*BIND_OPTS) HRESULT,
    GetBindOptions: ?extern fn(?*IBindCtx, ?*BIND_OPTS) HRESULT,
    GetRunningObjectTable: ?extern fn(?*IBindCtx, ?*(?*IRunningObjectTable)) HRESULT,
    RegisterObjectParam: ?extern fn(?*IBindCtx, LPOLESTR, ?*IUnknown) HRESULT,
    GetObjectParam: ?extern fn(?*IBindCtx, LPOLESTR, ?*(?*IUnknown)) HRESULT,
    EnumObjectParam: ?extern fn(?*IBindCtx, ?*(?*IEnumString)) HRESULT,
    RevokeObjectParam: ?extern fn(?*IBindCtx, LPOLESTR) HRESULT,
};
pub const IBindCtx = extern struct {
    lpVtbl: ?*IBindCtxVtbl,
};

pub const LPBINDCTX = ?*IBindCtx;
pub const IRunnableObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRunnableObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRunnableObject) ULONG,
    Release: ?extern fn(?*IRunnableObject) ULONG,
    GetRunningClass: ?extern fn(?*IRunnableObject, LPCLSID) HRESULT,
    Run: ?extern fn(?*IRunnableObject, LPBINDCTX) HRESULT,
    IsRunning: ?extern fn(?*IRunnableObject) BOOL,
    LockRunning: ?extern fn(?*IRunnableObject, BOOL, BOOL) HRESULT,
    SetContainedObject: ?extern fn(?*IRunnableObject, BOOL) HRESULT,
};
pub const IRunnableObject = extern struct {
    lpVtbl: ?*IRunnableObjectVtbl,
};

pub const IPersistVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPersist, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPersist) ULONG,
    Release: ?extern fn(?*IPersist) ULONG,
    GetClassID: ?extern fn(?*IPersist, ?*CLSID) HRESULT,
};
pub const IPersist = extern struct {
    lpVtbl: ?*IPersistVtbl,
};

pub const IPersistStreamVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPersistStream, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPersistStream) ULONG,
    Release: ?extern fn(?*IPersistStream) ULONG,
    GetClassID: ?extern fn(?*IPersistStream, ?*CLSID) HRESULT,
    IsDirty: ?extern fn(?*IPersistStream) HRESULT,
    Load: ?extern fn(?*IPersistStream, ?*IStream) HRESULT,
    Save: ?extern fn(?*IPersistStream, ?*IStream, BOOL) HRESULT,
    GetSizeMax: ?extern fn(?*IPersistStream, ?*ULARGE_INTEGER) HRESULT,
};
pub const IPersistStream = extern struct {
    lpVtbl: ?*IPersistStreamVtbl,
};

pub const IROTDataVtbl = extern struct {
    QueryInterface: ?extern fn(?*IROTData, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IROTData) ULONG,
    Release: ?extern fn(?*IROTData) ULONG,
    GetComparisonData: ?extern fn(?*IROTData, ?*byte, ULONG, ?*ULONG) HRESULT,
};
pub const IROTData = extern struct {
    lpVtbl: ?*IROTDataVtbl,
};

pub const IPersistFileVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPersistFile, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPersistFile) ULONG,
    Release: ?extern fn(?*IPersistFile) ULONG,
    GetClassID: ?extern fn(?*IPersistFile, ?*CLSID) HRESULT,
    IsDirty: ?extern fn(?*IPersistFile) HRESULT,
    Load: ?extern fn(?*IPersistFile, LPCOLESTR, DWORD) HRESULT,
    Save: ?extern fn(?*IPersistFile, LPCOLESTR, BOOL) HRESULT,
    SaveCompleted: ?extern fn(?*IPersistFile, LPCOLESTR) HRESULT,
    GetCurFile: ?extern fn(?*IPersistFile, ?*LPOLESTR) HRESULT,
};
pub const IPersistFile = extern struct {
    lpVtbl: ?*IPersistFileVtbl,
};

pub const IPersistStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPersistStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPersistStorage) ULONG,
    Release: ?extern fn(?*IPersistStorage) ULONG,
    GetClassID: ?extern fn(?*IPersistStorage, ?*CLSID) HRESULT,
    IsDirty: ?extern fn(?*IPersistStorage) HRESULT,
    InitNew: ?extern fn(?*IPersistStorage, ?*IStorage) HRESULT,
    Load: ?extern fn(?*IPersistStorage, ?*IStorage) HRESULT,
    Save: ?extern fn(?*IPersistStorage, ?*IStorage, BOOL) HRESULT,
    SaveCompleted: ?extern fn(?*IPersistStorage, ?*IStorage) HRESULT,
    HandsOffStorage: ?extern fn(?*IPersistStorage) HRESULT,
};
pub const IPersistStorage = extern struct {
    lpVtbl: ?*IPersistStorageVtbl,
};

pub const ILockBytesVtbl = extern struct {
    QueryInterface: ?extern fn(?*ILockBytes, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ILockBytes) ULONG,
    Release: ?extern fn(?*ILockBytes) ULONG,
    ReadAt: ?extern fn(?*ILockBytes, ULARGE_INTEGER, ?*c_void, ULONG, ?*ULONG) HRESULT,
    WriteAt: ?extern fn(?*ILockBytes, ULARGE_INTEGER, ?*const c_void, ULONG, ?*ULONG) HRESULT,
    Flush: ?extern fn(?*ILockBytes) HRESULT,
    SetSize: ?extern fn(?*ILockBytes, ULARGE_INTEGER) HRESULT,
    LockRegion: ?extern fn(?*ILockBytes, ULARGE_INTEGER, ULARGE_INTEGER, DWORD) HRESULT,
    UnlockRegion: ?extern fn(?*ILockBytes, ULARGE_INTEGER, ULARGE_INTEGER, DWORD) HRESULT,
    Stat: ?extern fn(?*ILockBytes, ?*STATSTG, DWORD) HRESULT,
};
pub const ILockBytes = extern struct {
    lpVtbl: ?*ILockBytesVtbl,
};

pub const DVTARGETDEVICE = extern struct {
    tdSize: DWORD,
    tdDriverNameOffset: WORD,
    tdDeviceNameOffset: WORD,
    tdPortNameOffset: WORD,
    tdExtDevmodeOffset: WORD,
    tdData: [1]BYTE,
};

pub const FORMATETC = extern struct {
    cfFormat: CLIPFORMAT,
    ptd: ?*DVTARGETDEVICE,
    dwAspect: DWORD,
    lindex: LONG,
    tymed: DWORD,
};

pub const IEnumFORMATETCVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumFORMATETC, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumFORMATETC) ULONG,
    Release: ?extern fn(?*IEnumFORMATETC) ULONG,
    Next: ?extern fn(?*IEnumFORMATETC, ULONG, ?*FORMATETC, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumFORMATETC, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumFORMATETC) HRESULT,
    Clone: ?extern fn(?*IEnumFORMATETC, ?*(?*IEnumFORMATETC)) HRESULT,
};
pub const IEnumFORMATETC = extern struct {
    lpVtbl: ?*IEnumFORMATETCVtbl,
};


pub const STGMEDIUM = extern struct {
    tymed: DWORD,
    u: extern union {
        hBitmap: HBITMAP,
        hMetaFilePict: HMETAFILEPICT,
        hEnhMetaFile: HENHMETAFILE,
        hGlobal: HGLOBAL,
        lpszFileName: LPOLESTR,
        pstm: ?*IStream,
        pstg: ?*IStorage,
    },
    pUnkForRelease: ?*IUnknown,
};

pub const IAdviseSinkVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAdviseSink, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAdviseSink) ULONG,
    Release: ?extern fn(?*IAdviseSink) ULONG,
    OnDataChange: ?extern fn(?*IAdviseSink, ?*FORMATETC, ?*STGMEDIUM) void,
    OnViewChange: ?extern fn(?*IAdviseSink, DWORD, LONG) void,
    OnRename: ?extern fn(?*IAdviseSink, ?*IMoniker) void,
    OnSave: ?extern fn(?*IAdviseSink) void,
    OnClose: ?extern fn(?*IAdviseSink) void,
};
pub const IAdviseSink = extern struct {
    lpVtbl: ?*IAdviseSinkVtbl,
};
pub const STATDATA = extern struct {
    formatetc: FORMATETC,
    advf: DWORD,
    pAdvSink: ?*IAdviseSink,
    dwConnection: DWORD,
};

pub const IEnumSTATDATAVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumSTATDATA, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumSTATDATA) ULONG,
    Release: ?extern fn(?*IEnumSTATDATA) ULONG,
    Next: ?extern fn(?*IEnumSTATDATA, ULONG, ?*STATDATA, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumSTATDATA, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumSTATDATA) HRESULT,
    Clone: ?extern fn(?*IEnumSTATDATA, ?*(?*IEnumSTATDATA)) HRESULT,
};
pub const IEnumSTATDATA = extern struct {
    lpVtbl: ?*IEnumSTATDATAVtbl,
};

pub const IRootStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*IRootStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IRootStorage) ULONG,
    Release: ?extern fn(?*IRootStorage) ULONG,
    SwitchToFile: ?extern fn(?*IRootStorage, LPOLESTR) HRESULT,
};
pub const IRootStorage = extern struct {
    lpVtbl: ?*IRootStorageVtbl,
};

pub const AsyncIAdviseSinkVtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIAdviseSink, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIAdviseSink) ULONG,
    Release: ?extern fn(?*AsyncIAdviseSink) ULONG,
    Begin_OnDataChange: ?extern fn(?*AsyncIAdviseSink, ?*FORMATETC, ?*STGMEDIUM) void,
    Finish_OnDataChange: ?extern fn(?*AsyncIAdviseSink) void,
    Begin_OnViewChange: ?extern fn(?*AsyncIAdviseSink, DWORD, LONG) void,
    Finish_OnViewChange: ?extern fn(?*AsyncIAdviseSink) void,
    Begin_OnRename: ?extern fn(?*AsyncIAdviseSink, ?*IMoniker) void,
    Finish_OnRename: ?extern fn(?*AsyncIAdviseSink) void,
    Begin_OnSave: ?extern fn(?*AsyncIAdviseSink) void,
    Finish_OnSave: ?extern fn(?*AsyncIAdviseSink) void,
    Begin_OnClose: ?extern fn(?*AsyncIAdviseSink) void,
    Finish_OnClose: ?extern fn(?*AsyncIAdviseSink) void,
};
pub const AsyncIAdviseSink = extern struct {
    lpVtbl: ?*AsyncIAdviseSinkVtbl,
};

pub const IAdviseSink2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IAdviseSink2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAdviseSink2) ULONG,
    Release: ?extern fn(?*IAdviseSink2) ULONG,
    OnDataChange: ?extern fn(?*IAdviseSink2, ?*FORMATETC, ?*STGMEDIUM) void,
    OnViewChange: ?extern fn(?*IAdviseSink2, DWORD, LONG) void,
    OnRename: ?extern fn(?*IAdviseSink2, ?*IMoniker) void,
    OnSave: ?extern fn(?*IAdviseSink2) void,
    OnClose: ?extern fn(?*IAdviseSink2) void,
    OnLinkSrcChange: ?extern fn(?*IAdviseSink2, ?*IMoniker) void,
};
pub const IAdviseSink2 = extern struct {
    lpVtbl: ?*IAdviseSink2Vtbl,
};

pub const AsyncIAdviseSink2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*AsyncIAdviseSink2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*AsyncIAdviseSink2) ULONG,
    Release: ?extern fn(?*AsyncIAdviseSink2) ULONG,
    Begin_OnDataChange: ?extern fn(?*AsyncIAdviseSink2, ?*FORMATETC, ?*STGMEDIUM) void,
    Finish_OnDataChange: ?extern fn(?*AsyncIAdviseSink2) void,
    Begin_OnViewChange: ?extern fn(?*AsyncIAdviseSink2, DWORD, LONG) void,
    Finish_OnViewChange: ?extern fn(?*AsyncIAdviseSink2) void,
    Begin_OnRename: ?extern fn(?*AsyncIAdviseSink2, ?*IMoniker) void,
    Finish_OnRename: ?extern fn(?*AsyncIAdviseSink2) void,
    Begin_OnSave: ?extern fn(?*AsyncIAdviseSink2) void,
    Finish_OnSave: ?extern fn(?*AsyncIAdviseSink2) void,
    Begin_OnClose: ?extern fn(?*AsyncIAdviseSink2) void,
    Finish_OnClose: ?extern fn(?*AsyncIAdviseSink2) void,
    Begin_OnLinkSrcChange: ?extern fn(?*AsyncIAdviseSink2, ?*IMoniker) void,
    Finish_OnLinkSrcChange: ?extern fn(?*AsyncIAdviseSink2) void,
};
pub const AsyncIAdviseSink2 = extern struct {
    lpVtbl: ?*AsyncIAdviseSink2Vtbl,
};

pub const IDataObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDataObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDataObject) ULONG,
    Release: ?extern fn(?*IDataObject) ULONG,
    GetData: ?extern fn(?*IDataObject, ?*FORMATETC, ?*STGMEDIUM) HRESULT,
    GetDataHere: ?extern fn(?*IDataObject, ?*FORMATETC, ?*STGMEDIUM) HRESULT,
    QueryGetData: ?extern fn(?*IDataObject, ?*FORMATETC) HRESULT,
    GetCanonicalFormatEtc: ?extern fn(?*IDataObject, ?*FORMATETC, ?*FORMATETC) HRESULT,
    SetData: ?extern fn(?*IDataObject, ?*FORMATETC, ?*STGMEDIUM, BOOL) HRESULT,
    EnumFormatEtc: ?extern fn(?*IDataObject, DWORD, ?*(?*IEnumFORMATETC)) HRESULT,
    DAdvise: ?extern fn(?*IDataObject, ?*FORMATETC, DWORD, ?*IAdviseSink, ?*DWORD) HRESULT,
    DUnadvise: ?extern fn(?*IDataObject, DWORD) HRESULT,
    EnumDAdvise: ?extern fn(?*IDataObject, ?*(?*IEnumSTATDATA)) HRESULT,
};
pub const IDataObject = extern struct {
    lpVtbl: ?*IDataObjectVtbl,
};

pub const IDataAdviseHolderVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDataAdviseHolder, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDataAdviseHolder) ULONG,
    Release: ?extern fn(?*IDataAdviseHolder) ULONG,
    Advise: ?extern fn(?*IDataAdviseHolder, ?*IDataObject, ?*FORMATETC, DWORD, ?*IAdviseSink, ?*DWORD) HRESULT,
    Unadvise: ?extern fn(?*IDataAdviseHolder, DWORD) HRESULT,
    EnumAdvise: ?extern fn(?*IDataAdviseHolder, ?*(?*IEnumSTATDATA)) HRESULT,
    SendOnDataChange: ?extern fn(?*IDataAdviseHolder, ?*IDataObject, DWORD, DWORD) HRESULT,
};
pub const IDataAdviseHolder = extern struct {
    lpVtbl: ?*IDataAdviseHolderVtbl,
};

pub const INTERFACEINFO = extern struct {
    pUnk: ?*IUnknown,
    iid: IID,
    wMethod: WORD,
};
pub const LPINTERFACEINFO = ?*INTERFACEINFO;
pub const IMessageFilterVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMessageFilter, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMessageFilter) ULONG,
    Release: ?extern fn(?*IMessageFilter) ULONG,
    HandleInComingCall: ?extern fn(?*IMessageFilter, DWORD, HTASK, DWORD, LPINTERFACEINFO) DWORD,
    RetryRejectedCall: ?extern fn(?*IMessageFilter, HTASK, DWORD, DWORD) DWORD,
    MessagePending: ?extern fn(?*IMessageFilter, HTASK, DWORD, DWORD) DWORD,
};
pub const IMessageFilter = extern struct {
    lpVtbl: ?*IMessageFilterVtbl,
};

pub const IClassActivatorVtbl = extern struct {
    QueryInterface: ?extern fn(?*IClassActivator, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IClassActivator) ULONG,
    Release: ?extern fn(?*IClassActivator) ULONG,
    GetClassObject: ?extern fn(?*IClassActivator, ?*const IID, DWORD, LCID, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IClassActivator = extern struct {
    lpVtbl: ?*IClassActivatorVtbl,
};

pub const IFillLockBytesVtbl = extern struct {
    QueryInterface: ?extern fn(?*IFillLockBytes, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IFillLockBytes) ULONG,
    Release: ?extern fn(?*IFillLockBytes) ULONG,
    FillAppend: ?extern fn(?*IFillLockBytes, ?*const c_void, ULONG, ?*ULONG) HRESULT,
    FillAt: ?extern fn(?*IFillLockBytes, ULARGE_INTEGER, ?*const c_void, ULONG, ?*ULONG) HRESULT,
    SetFillSize: ?extern fn(?*IFillLockBytes, ULARGE_INTEGER) HRESULT,
    Terminate: ?extern fn(?*IFillLockBytes, BOOL) HRESULT,
};
pub const IFillLockBytes = extern struct {
    lpVtbl: ?*IFillLockBytesVtbl,
};

pub const IProgressNotifyVtbl = extern struct {
    QueryInterface: ?extern fn(?*IProgressNotify, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IProgressNotify) ULONG,
    Release: ?extern fn(?*IProgressNotify) ULONG,
    OnProgress: ?extern fn(?*IProgressNotify, DWORD, DWORD, BOOL, BOOL) HRESULT,
};
pub const IProgressNotify = extern struct {
    lpVtbl: ?*IProgressNotifyVtbl,
};

pub const StorageLayout = extern struct {
    LayoutType: DWORD,
    pwcsElementName: ?*OLECHAR,
    cOffset: LARGE_INTEGER,
    cBytes: LARGE_INTEGER,
};

pub const ILayoutStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*ILayoutStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ILayoutStorage) ULONG,
    Release: ?extern fn(?*ILayoutStorage) ULONG,
    LayoutScript: ?extern fn(?*ILayoutStorage, ?*StorageLayout, DWORD, DWORD) HRESULT,
    BeginMonitor: ?extern fn(?*ILayoutStorage) HRESULT,
    EndMonitor: ?extern fn(?*ILayoutStorage) HRESULT,
    ReLayoutDocfile: ?extern fn(?*ILayoutStorage, ?*OLECHAR) HRESULT,
    ReLayoutDocfileOnILockBytes: ?extern fn(?*ILayoutStorage, ?*ILockBytes) HRESULT,
};
pub const ILayoutStorage = extern struct {
    lpVtbl: ?*ILayoutStorageVtbl,
};

pub const IBlockingLockVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBlockingLock, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBlockingLock) ULONG,
    Release: ?extern fn(?*IBlockingLock) ULONG,
    Lock: ?extern fn(?*IBlockingLock, DWORD) HRESULT,
    Unlock: ?extern fn(?*IBlockingLock) HRESULT,
};
pub const IBlockingLock = extern struct {
    lpVtbl: ?*IBlockingLockVtbl,
};

pub const ITimeAndNoticeControlVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITimeAndNoticeControl, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITimeAndNoticeControl) ULONG,
    Release: ?extern fn(?*ITimeAndNoticeControl) ULONG,
    SuppressChanges: ?extern fn(?*ITimeAndNoticeControl, DWORD, DWORD) HRESULT,
};
pub const ITimeAndNoticeControl = extern struct {
    lpVtbl: ?*ITimeAndNoticeControlVtbl,
};

pub const IOplockStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOplockStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOplockStorage) ULONG,
    Release: ?extern fn(?*IOplockStorage) ULONG,
    CreateStorageEx: ?extern fn(?*IOplockStorage, LPCWSTR, DWORD, DWORD, DWORD, ?*const IID, ?*(?*c_void)) HRESULT,
    OpenStorageEx: ?extern fn(?*IOplockStorage, LPCWSTR, DWORD, DWORD, DWORD, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IOplockStorage = extern struct {
    lpVtbl: ?*IOplockStorageVtbl,
};

pub const IDirectWriterLockVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDirectWriterLock, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDirectWriterLock) ULONG,
    Release: ?extern fn(?*IDirectWriterLock) ULONG,
    WaitForWriteAccess: ?extern fn(?*IDirectWriterLock, DWORD) HRESULT,
    ReleaseWriteAccess: ?extern fn(?*IDirectWriterLock) HRESULT,
    HaveWriteAccess: ?extern fn(?*IDirectWriterLock) HRESULT,
};
pub const IDirectWriterLock = extern struct {
    lpVtbl: ?*IDirectWriterLockVtbl,
};

pub const IUrlMonVtbl = extern struct {
    QueryInterface: ?extern fn(?*IUrlMon, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IUrlMon) ULONG,
    Release: ?extern fn(?*IUrlMon) ULONG,
    AsyncGetClassBits: ?extern fn(?*IUrlMon, ?*const IID, LPCWSTR, LPCWSTR, DWORD, DWORD, LPCWSTR, ?*IBindCtx, DWORD, ?*const IID, DWORD) HRESULT,
};
pub const IUrlMon = extern struct {
    lpVtbl: ?*IUrlMonVtbl,
};

pub const IForegroundTransferVtbl = extern struct {
    QueryInterface: ?extern fn(?*IForegroundTransfer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IForegroundTransfer) ULONG,
    Release: ?extern fn(?*IForegroundTransfer) ULONG,
    AllowForegroundTransfer: ?extern fn(?*IForegroundTransfer, ?*c_void) HRESULT,
};
pub const IForegroundTransfer = extern struct {
    lpVtbl: ?*IForegroundTransferVtbl,
};

pub const IThumbnailExtractorVtbl = extern struct {
    QueryInterface: ?extern fn(?*IThumbnailExtractor, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IThumbnailExtractor) ULONG,
    Release: ?extern fn(?*IThumbnailExtractor) ULONG,
    ExtractThumbnail: ?extern fn(?*IThumbnailExtractor, ?*IStorage, ULONG, ULONG, ?*ULONG, ?*ULONG, ?*HBITMAP) HRESULT,
    OnFileUpdated: ?extern fn(?*IThumbnailExtractor, ?*IStorage) HRESULT,
};
pub const IThumbnailExtractor = extern struct {
    lpVtbl: ?*IThumbnailExtractorVtbl,
};

pub const IDummyHICONIncluderVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDummyHICONIncluder, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDummyHICONIncluder) ULONG,
    Release: ?extern fn(?*IDummyHICONIncluder) ULONG,
    Dummy: ?extern fn(?*IDummyHICONIncluder, HICON, HDC) HRESULT,
};
pub const IDummyHICONIncluder = extern struct {
    lpVtbl: ?*IDummyHICONIncluderVtbl,
};

pub const IProcessLockVtbl = extern struct {
    QueryInterface: ?extern fn(?*IProcessLock, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IProcessLock) ULONG,
    Release: ?extern fn(?*IProcessLock) ULONG,
    AddRefOnProcess: ?extern fn(?*IProcessLock) ULONG,
    ReleaseRefOnProcess: ?extern fn(?*IProcessLock) ULONG,
};
pub const IProcessLock = extern struct {
    lpVtbl: ?*IProcessLockVtbl,
};

pub const ApplicationType = c_int;

pub const ShutdownType = c_int;

pub const ISurrogateServiceVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISurrogateService, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISurrogateService) ULONG,
    Release: ?extern fn(?*ISurrogateService) ULONG,
    Init: ?extern fn(?*ISurrogateService, ?*const GUID, ?*IProcessLock, ?*BOOL) HRESULT,
    ApplicationLaunch: ?extern fn(?*ISurrogateService, ?*const GUID, ApplicationType) HRESULT,
    ApplicationFree: ?extern fn(?*ISurrogateService, ?*const GUID) HRESULT,
    CatalogRefresh: ?extern fn(?*ISurrogateService, ULONG) HRESULT,
    ProcessShutdown: ?extern fn(?*ISurrogateService, ShutdownType) HRESULT,
};
pub const ISurrogateService = extern struct {
    lpVtbl: ?*ISurrogateServiceVtbl,
};

pub const IInitializeSpyVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInitializeSpy, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInitializeSpy) ULONG,
    Release: ?extern fn(?*IInitializeSpy) ULONG,
    PreInitialize: ?extern fn(?*IInitializeSpy, DWORD, DWORD) HRESULT,
    PostInitialize: ?extern fn(?*IInitializeSpy, HRESULT, DWORD, DWORD) HRESULT,
    PreUninitialize: ?extern fn(?*IInitializeSpy, DWORD) HRESULT,
    PostUninitialize: ?extern fn(?*IInitializeSpy, DWORD) HRESULT,
};
pub const IInitializeSpy = extern struct {
    lpVtbl: ?*IInitializeSpyVtbl,
};

pub const IApartmentShutdownVtbl = extern struct {
    QueryInterface: ?extern fn(?*IApartmentShutdown, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IApartmentShutdown) ULONG,
    Release: ?extern fn(?*IApartmentShutdown) ULONG,
    OnUninitialize: ?extern fn(?*IApartmentShutdown, UINT64) void,
};
pub const IApartmentShutdown = extern struct {
    lpVtbl: ?*IApartmentShutdownVtbl,
};
pub const LPMALLOCSPY = ?*IMallocSpy;

pub const LPBC = ?*IBindCtx;
pub const LPBIND_OPTS = ?*BIND_OPTS;
pub const BIND_OPTS2 = extern struct {
    cbStruct: DWORD,
    grfFlags: DWORD,
    grfMode: DWORD,
    dwTickCountDeadline: DWORD,
    dwTrackFlags: DWORD,
    dwClassContext: DWORD,
    locale: LCID,
    pServerInfo: ?*COSERVERINFO,
};

pub const LPBIND_OPTS2 = ?*BIND_OPTS2;
pub const BIND_OPTS3 = extern struct {
    cbStruct: DWORD,
    grfFlags: DWORD,
    grfMode: DWORD,
    dwTickCountDeadline: DWORD,
    dwTrackFlags: DWORD,
    dwClassContext: DWORD,
    locale: LCID,
    pServerInfo: ?*COSERVERINFO,
    hwnd: HWND,
};

pub const LPBIND_OPTS3 = ?*BIND_OPTS3;
pub const BIND_FLAGS = c_int;


pub const LPENUMMONIKER = ?*IEnumMoniker;

pub const LPRUNNABLEOBJECT = ?*IRunnableObject;

pub const LPRUNNINGOBJECTTABLE = ?*IRunningObjectTable;

pub const LPPERSIST = ?*IPersist;

pub const LPPERSISTSTREAM = ?*IPersistStream;

pub const LPMONIKER = ?*IMoniker;
pub const MKSYS = c_int;

pub const MKREDUCE = c_int;
pub const MKRREDUCE = MKREDUCE;


pub const LPENUMSTATSTG = ?*IEnumSTATSTG;

pub const LPSTORAGE = ?*IStorage;
pub const RemSNB = extern struct {
    ulCntStr: ULONG,
    ulCntChar: ULONG,
    rgString: [1]OLECHAR,
};

pub const wireSNB = ?*RemSNB;

pub const LPPERSISTFILE = ?*IPersistFile;

pub const LPPERSISTSTORAGE = ?*IPersistStorage;

pub const LPLOCKBYTES = ?*ILockBytes;

pub const LPENUMFORMATETC = ?*IEnumFORMATETC;
pub const LPCLIPFORMAT = ?*CLIPFORMAT;
pub const LPFORMATETC = ?*FORMATETC;

pub const LPENUMSTATDATA = ?*IEnumSTATDATA;
pub const ADVF = c_int;

pub const LPSTATDATA = ?*STATDATA;

pub const LPROOTSTORAGE = ?*IRootStorage;

pub const LPADVISESINK = ?*IAdviseSink;
pub const TYMED = c_int;

pub const RemSTGMEDIUM = extern struct {
    tymed: DWORD,
    dwHandleType: DWORD,
    pData: ULONG,
    pUnkForRelease: ULONG,
    cbData: ULONG,
    data: [1]byte,
};

pub const _MIDL_IAdviseSink_0002 = extern union {
    hBitmap: wireHBITMAP,
    hPalette: wireHPALETTE,
    hGeneric: wireHGLOBAL,
};
pub const GDI_OBJECT = extern struct {
    ObjectType: DWORD,
    u: _MIDL_IAdviseSink_0002,
};

pub const _MIDL_IAdviseSink_0003 = extern union {
    hMetaFilePict: wireHMETAFILEPICT,
    hHEnhMetaFile: wireHENHMETAFILE,
    hGdiHandle: ?*GDI_OBJECT,
    hGlobal: wireHGLOBAL,
    lpszFileName: LPOLESTR,
    pstm: ?*BYTE_BLOB,
    pstg: ?*BYTE_BLOB,
};
pub const STGMEDIUM_UNION = extern struct {
    tymed: DWORD,
    u: _MIDL_IAdviseSink_0003,
};
pub const userSTGMEDIUM = extern struct {
    u: STGMEDIUM_UNION,
    pUnkForRelease: ?*IUnknown,
};

pub const wireSTGMEDIUM = ?*userSTGMEDIUM;
pub const wireASYNC_STGMEDIUM = ?*userSTGMEDIUM;
pub const ASYNC_STGMEDIUM = STGMEDIUM;
pub const LPSTGMEDIUM = ?*STGMEDIUM;
pub const userFLAG_STGMEDIUM = extern struct {
    ContextFlags: LONG,
    fPassOwnership: LONG,
    Stgmed: userSTGMEDIUM,
};

pub const wireFLAG_STGMEDIUM = ?*userFLAG_STGMEDIUM;
pub const FLAG_STGMEDIUM = extern struct {
    ContextFlags: LONG,
    fPassOwnership: LONG,
    Stgmed: STGMEDIUM,
};



pub const LPADVISESINK2 = ?*IAdviseSink2;


pub const LPDATAOBJECT = ?*IDataObject;
pub const DATADIR = c_int;


pub const LPDATAADVISEHOLDER = ?*IDataAdviseHolder;

pub const LPMESSAGEFILTER = ?*IMessageFilter;
pub const CALLTYPE = c_int;

pub const SERVERCALL = c_int;

pub const PENDINGTYPE = c_int;

pub const PENDINGMSG = c_int;

















pub const LPINITIALIZESPY = ?*IInitializeSpy;



pub const PROPSPEC = extern struct {
    ulKind: ULONG,
    u: extern union {
        propid: PROPID,
        lpwstr: LPOLESTR,
    },
};


pub const STATPROPSTG = extern struct {
    lpwstrName: LPOLESTR,
    propid: PROPID,
    vt: VARTYPE,
};

pub const IEnumSTATPROPSTGVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumSTATPROPSTG, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumSTATPROPSTG) ULONG,
    Release: ?extern fn(?*IEnumSTATPROPSTG) ULONG,
    Next: ?extern fn(?*IEnumSTATPROPSTG, ULONG, ?*STATPROPSTG, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumSTATPROPSTG, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumSTATPROPSTG) HRESULT,
    Clone: ?extern fn(?*IEnumSTATPROPSTG, ?*(?*IEnumSTATPROPSTG)) HRESULT,
};
pub const IEnumSTATPROPSTG = extern struct {
    lpVtbl: ?*IEnumSTATPROPSTGVtbl,
};
pub const STATPROPSETSTG = extern struct {
    fmtid: FMTID,
    clsid: CLSID,
    grfFlags: DWORD,
    mtime: FILETIME,
    ctime: FILETIME,
    atime: FILETIME,
    dwOSVersion: DWORD,
};

pub const IPropertyStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPropertyStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPropertyStorage) ULONG,
    Release: ?extern fn(?*IPropertyStorage) ULONG,
    ReadMultiple: ?extern fn(?*IPropertyStorage, ULONG, ?*const PROPSPEC, ?*PROPVARIANT) HRESULT,
    WriteMultiple: ?extern fn(?*IPropertyStorage, ULONG, ?*const PROPSPEC, ?*const PROPVARIANT, PROPID) HRESULT,
    DeleteMultiple: ?extern fn(?*IPropertyStorage, ULONG, ?*const PROPSPEC) HRESULT,
    ReadPropertyNames: ?extern fn(?*IPropertyStorage, ULONG, ?*const PROPID, ?*LPOLESTR) HRESULT,
    WritePropertyNames: ?extern fn(?*IPropertyStorage, ULONG, ?*const PROPID, ?*const LPOLESTR) HRESULT,
    DeletePropertyNames: ?extern fn(?*IPropertyStorage, ULONG, ?*const PROPID) HRESULT,
    Commit: ?extern fn(?*IPropertyStorage, DWORD) HRESULT,
    Revert: ?extern fn(?*IPropertyStorage) HRESULT,
    Enum: ?extern fn(?*IPropertyStorage, ?*(?*IEnumSTATPROPSTG)) HRESULT,
    SetTimes: ?extern fn(?*IPropertyStorage, ?*const FILETIME, ?*const FILETIME, ?*const FILETIME) HRESULT,
    SetClass: ?extern fn(?*IPropertyStorage, ?*const IID) HRESULT,
    Stat: ?extern fn(?*IPropertyStorage, ?*STATPROPSETSTG) HRESULT,
};
pub const IPropertyStorage = extern struct {
    lpVtbl: ?*IPropertyStorageVtbl,
};


pub const IEnumSTATPROPSETSTGVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumSTATPROPSETSTG, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumSTATPROPSETSTG) ULONG,
    Release: ?extern fn(?*IEnumSTATPROPSETSTG) ULONG,
    Next: ?extern fn(?*IEnumSTATPROPSETSTG, ULONG, ?*STATPROPSETSTG, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumSTATPROPSETSTG, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumSTATPROPSETSTG) HRESULT,
    Clone: ?extern fn(?*IEnumSTATPROPSETSTG, ?*(?*IEnumSTATPROPSETSTG)) HRESULT,
};
pub const IEnumSTATPROPSETSTG = extern struct {
    lpVtbl: ?*IEnumSTATPROPSETSTGVtbl,
};
pub const IPropertySetStorageVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPropertySetStorage, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPropertySetStorage) ULONG,
    Release: ?extern fn(?*IPropertySetStorage) ULONG,
    Create: ?extern fn(?*IPropertySetStorage, ?*const IID, ?*const CLSID, DWORD, DWORD, ?*(?*IPropertyStorage)) HRESULT,
    Open: ?extern fn(?*IPropertySetStorage, ?*const IID, DWORD, ?*(?*IPropertyStorage)) HRESULT,
    Delete: ?extern fn(?*IPropertySetStorage, ?*const IID) HRESULT,
    Enum: ?extern fn(?*IPropertySetStorage, ?*(?*IEnumSTATPROPSETSTG)) HRESULT,
};
pub const IPropertySetStorage = extern struct {
    lpVtbl: ?*IPropertySetStorageVtbl,
};

pub const ICreateTypeInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICreateTypeInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICreateTypeInfo) ULONG,
    Release: ?extern fn(?*ICreateTypeInfo) ULONG,
    SetGuid: ?extern fn(?*ICreateTypeInfo, ?*const GUID) HRESULT,
    SetTypeFlags: ?extern fn(?*ICreateTypeInfo, UINT) HRESULT,
    SetDocString: ?extern fn(?*ICreateTypeInfo, LPOLESTR) HRESULT,
    SetHelpContext: ?extern fn(?*ICreateTypeInfo, DWORD) HRESULT,
    SetVersion: ?extern fn(?*ICreateTypeInfo, WORD, WORD) HRESULT,
    AddRefTypeInfo: ?extern fn(?*ICreateTypeInfo, ?*ITypeInfo, ?*HREFTYPE) HRESULT,
    AddFuncDesc: ?extern fn(?*ICreateTypeInfo, UINT, ?*FUNCDESC) HRESULT,
    AddImplType: ?extern fn(?*ICreateTypeInfo, UINT, HREFTYPE) HRESULT,
    SetImplTypeFlags: ?extern fn(?*ICreateTypeInfo, UINT, INT) HRESULT,
    SetAlignment: ?extern fn(?*ICreateTypeInfo, WORD) HRESULT,
    SetSchema: ?extern fn(?*ICreateTypeInfo, LPOLESTR) HRESULT,
    AddVarDesc: ?extern fn(?*ICreateTypeInfo, UINT, ?*VARDESC) HRESULT,
    SetFuncAndParamNames: ?extern fn(?*ICreateTypeInfo, UINT, ?*LPOLESTR, UINT) HRESULT,
    SetVarName: ?extern fn(?*ICreateTypeInfo, UINT, LPOLESTR) HRESULT,
    SetTypeDescAlias: ?extern fn(?*ICreateTypeInfo, ?*TYPEDESC) HRESULT,
    DefineFuncAsDllEntry: ?extern fn(?*ICreateTypeInfo, UINT, LPOLESTR, LPOLESTR) HRESULT,
    SetFuncDocString: ?extern fn(?*ICreateTypeInfo, UINT, LPOLESTR) HRESULT,
    SetVarDocString: ?extern fn(?*ICreateTypeInfo, UINT, LPOLESTR) HRESULT,
    SetFuncHelpContext: ?extern fn(?*ICreateTypeInfo, UINT, DWORD) HRESULT,
    SetVarHelpContext: ?extern fn(?*ICreateTypeInfo, UINT, DWORD) HRESULT,
    SetMops: ?extern fn(?*ICreateTypeInfo, UINT, BSTR) HRESULT,
    SetTypeIdldesc: ?extern fn(?*ICreateTypeInfo, ?*IDLDESC) HRESULT,
    LayOut: ?extern fn(?*ICreateTypeInfo) HRESULT,
};
pub const ICreateTypeInfo = extern struct {
    lpVtbl: ?*ICreateTypeInfoVtbl,
};

pub const ICreateTypeInfo2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*ICreateTypeInfo2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICreateTypeInfo2) ULONG,
    Release: ?extern fn(?*ICreateTypeInfo2) ULONG,
    SetGuid: ?extern fn(?*ICreateTypeInfo2, ?*const GUID) HRESULT,
    SetTypeFlags: ?extern fn(?*ICreateTypeInfo2, UINT) HRESULT,
    SetDocString: ?extern fn(?*ICreateTypeInfo2, LPOLESTR) HRESULT,
    SetHelpContext: ?extern fn(?*ICreateTypeInfo2, DWORD) HRESULT,
    SetVersion: ?extern fn(?*ICreateTypeInfo2, WORD, WORD) HRESULT,
    AddRefTypeInfo: ?extern fn(?*ICreateTypeInfo2, ?*ITypeInfo, ?*HREFTYPE) HRESULT,
    AddFuncDesc: ?extern fn(?*ICreateTypeInfo2, UINT, ?*FUNCDESC) HRESULT,
    AddImplType: ?extern fn(?*ICreateTypeInfo2, UINT, HREFTYPE) HRESULT,
    SetImplTypeFlags: ?extern fn(?*ICreateTypeInfo2, UINT, INT) HRESULT,
    SetAlignment: ?extern fn(?*ICreateTypeInfo2, WORD) HRESULT,
    SetSchema: ?extern fn(?*ICreateTypeInfo2, LPOLESTR) HRESULT,
    AddVarDesc: ?extern fn(?*ICreateTypeInfo2, UINT, ?*VARDESC) HRESULT,
    SetFuncAndParamNames: ?extern fn(?*ICreateTypeInfo2, UINT, ?*LPOLESTR, UINT) HRESULT,
    SetVarName: ?extern fn(?*ICreateTypeInfo2, UINT, LPOLESTR) HRESULT,
    SetTypeDescAlias: ?extern fn(?*ICreateTypeInfo2, ?*TYPEDESC) HRESULT,
    DefineFuncAsDllEntry: ?extern fn(?*ICreateTypeInfo2, UINT, LPOLESTR, LPOLESTR) HRESULT,
    SetFuncDocString: ?extern fn(?*ICreateTypeInfo2, UINT, LPOLESTR) HRESULT,
    SetVarDocString: ?extern fn(?*ICreateTypeInfo2, UINT, LPOLESTR) HRESULT,
    SetFuncHelpContext: ?extern fn(?*ICreateTypeInfo2, UINT, DWORD) HRESULT,
    SetVarHelpContext: ?extern fn(?*ICreateTypeInfo2, UINT, DWORD) HRESULT,
    SetMops: ?extern fn(?*ICreateTypeInfo2, UINT, BSTR) HRESULT,
    SetTypeIdldesc: ?extern fn(?*ICreateTypeInfo2, ?*IDLDESC) HRESULT,
    LayOut: ?extern fn(?*ICreateTypeInfo2) HRESULT,
    DeleteFuncDesc: ?extern fn(?*ICreateTypeInfo2, UINT) HRESULT,
    DeleteFuncDescByMemId: ?extern fn(?*ICreateTypeInfo2, MEMBERID, INVOKEKIND) HRESULT,
    DeleteVarDesc: ?extern fn(?*ICreateTypeInfo2, UINT) HRESULT,
    DeleteVarDescByMemId: ?extern fn(?*ICreateTypeInfo2, MEMBERID) HRESULT,
    DeleteImplType: ?extern fn(?*ICreateTypeInfo2, UINT) HRESULT,
    SetCustData: ?extern fn(?*ICreateTypeInfo2, ?*const GUID, ?*VARIANT) HRESULT,
    SetFuncCustData: ?extern fn(?*ICreateTypeInfo2, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    SetParamCustData: ?extern fn(?*ICreateTypeInfo2, UINT, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    SetVarCustData: ?extern fn(?*ICreateTypeInfo2, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    SetImplTypeCustData: ?extern fn(?*ICreateTypeInfo2, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    SetHelpStringContext: ?extern fn(?*ICreateTypeInfo2, ULONG) HRESULT,
    SetFuncHelpStringContext: ?extern fn(?*ICreateTypeInfo2, UINT, ULONG) HRESULT,
    SetVarHelpStringContext: ?extern fn(?*ICreateTypeInfo2, UINT, ULONG) HRESULT,
    Invalidate: ?extern fn(?*ICreateTypeInfo2) HRESULT,
    SetName: ?extern fn(?*ICreateTypeInfo2, LPOLESTR) HRESULT,
};
pub const ICreateTypeInfo2 = extern struct {
    lpVtbl: ?*ICreateTypeInfo2Vtbl,
};

pub const ICreateTypeLibVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICreateTypeLib, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICreateTypeLib) ULONG,
    Release: ?extern fn(?*ICreateTypeLib) ULONG,
    CreateTypeInfo: ?extern fn(?*ICreateTypeLib, LPOLESTR, TYPEKIND, ?*(?*ICreateTypeInfo)) HRESULT,
    SetName: ?extern fn(?*ICreateTypeLib, LPOLESTR) HRESULT,
    SetVersion: ?extern fn(?*ICreateTypeLib, WORD, WORD) HRESULT,
    SetGuid: ?extern fn(?*ICreateTypeLib, ?*const GUID) HRESULT,
    SetDocString: ?extern fn(?*ICreateTypeLib, LPOLESTR) HRESULT,
    SetHelpFileName: ?extern fn(?*ICreateTypeLib, LPOLESTR) HRESULT,
    SetHelpContext: ?extern fn(?*ICreateTypeLib, DWORD) HRESULT,
    SetLcid: ?extern fn(?*ICreateTypeLib, LCID) HRESULT,
    SetLibFlags: ?extern fn(?*ICreateTypeLib, UINT) HRESULT,
    SaveAllChanges: ?extern fn(?*ICreateTypeLib) HRESULT,
};
pub const ICreateTypeLib = extern struct {
    lpVtbl: ?*ICreateTypeLibVtbl,
};

pub const ICreateTypeLib2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*ICreateTypeLib2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICreateTypeLib2) ULONG,
    Release: ?extern fn(?*ICreateTypeLib2) ULONG,
    CreateTypeInfo: ?extern fn(?*ICreateTypeLib2, LPOLESTR, TYPEKIND, ?*(?*ICreateTypeInfo)) HRESULT,
    SetName: ?extern fn(?*ICreateTypeLib2, LPOLESTR) HRESULT,
    SetVersion: ?extern fn(?*ICreateTypeLib2, WORD, WORD) HRESULT,
    SetGuid: ?extern fn(?*ICreateTypeLib2, ?*const GUID) HRESULT,
    SetDocString: ?extern fn(?*ICreateTypeLib2, LPOLESTR) HRESULT,
    SetHelpFileName: ?extern fn(?*ICreateTypeLib2, LPOLESTR) HRESULT,
    SetHelpContext: ?extern fn(?*ICreateTypeLib2, DWORD) HRESULT,
    SetLcid: ?extern fn(?*ICreateTypeLib2, LCID) HRESULT,
    SetLibFlags: ?extern fn(?*ICreateTypeLib2, UINT) HRESULT,
    SaveAllChanges: ?extern fn(?*ICreateTypeLib2) HRESULT,
    DeleteTypeInfo: ?extern fn(?*ICreateTypeLib2, LPOLESTR) HRESULT,
    SetCustData: ?extern fn(?*ICreateTypeLib2, ?*const GUID, ?*VARIANT) HRESULT,
    SetHelpStringContext: ?extern fn(?*ICreateTypeLib2, ULONG) HRESULT,
    SetHelpStringDll: ?extern fn(?*ICreateTypeLib2, LPOLESTR) HRESULT,
};
pub const ICreateTypeLib2 = extern struct {
    lpVtbl: ?*ICreateTypeLib2Vtbl,
};

pub const IEnumVARIANTVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumVARIANT, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumVARIANT) ULONG,
    Release: ?extern fn(?*IEnumVARIANT) ULONG,
    Next: ?extern fn(?*IEnumVARIANT, ULONG, ?*VARIANT, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumVARIANT, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumVARIANT) HRESULT,
    Clone: ?extern fn(?*IEnumVARIANT, ?*(?*IEnumVARIANT)) HRESULT,
};
pub const IEnumVARIANT = extern struct {
    lpVtbl: ?*IEnumVARIANTVtbl,
};

pub const CUSTDATAITEM = extern struct {
    guid: GUID,
    varValue: VARIANTARG,
};
pub const LPCUSTDATAITEM = ?*CUSTDATAITEM;
pub const CUSTDATA = extern struct {
    cCustData: DWORD,
    prgCustData: LPCUSTDATAITEM,
};

pub const ITypeInfo2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeInfo2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeInfo2) ULONG,
    Release: ?extern fn(?*ITypeInfo2) ULONG,
    GetTypeAttr: ?extern fn(?*ITypeInfo2, ?*(?*TYPEATTR)) HRESULT,
    GetTypeComp: ?extern fn(?*ITypeInfo2, ?*(?*ITypeComp)) HRESULT,
    GetFuncDesc: ?extern fn(?*ITypeInfo2, UINT, ?*(?*FUNCDESC)) HRESULT,
    GetVarDesc: ?extern fn(?*ITypeInfo2, UINT, ?*(?*VARDESC)) HRESULT,
    GetNames: ?extern fn(?*ITypeInfo2, MEMBERID, ?*BSTR, UINT, ?*UINT) HRESULT,
    GetRefTypeOfImplType: ?extern fn(?*ITypeInfo2, UINT, ?*HREFTYPE) HRESULT,
    GetImplTypeFlags: ?extern fn(?*ITypeInfo2, UINT, ?*INT) HRESULT,
    GetIDsOfNames: ?extern fn(?*ITypeInfo2, ?*LPOLESTR, UINT, ?*MEMBERID) HRESULT,
    Invoke: ?extern fn(?*ITypeInfo2, PVOID, MEMBERID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    GetDocumentation: ?extern fn(?*ITypeInfo2, MEMBERID, ?*BSTR, ?*BSTR, ?*DWORD, ?*BSTR) HRESULT,
    GetDllEntry: ?extern fn(?*ITypeInfo2, MEMBERID, INVOKEKIND, ?*BSTR, ?*BSTR, ?*WORD) HRESULT,
    GetRefTypeInfo: ?extern fn(?*ITypeInfo2, HREFTYPE, ?*(?*ITypeInfo)) HRESULT,
    AddressOfMember: ?extern fn(?*ITypeInfo2, MEMBERID, INVOKEKIND, ?*PVOID) HRESULT,
    CreateInstance: ?extern fn(?*ITypeInfo2, ?*IUnknown, ?*const IID, ?*PVOID) HRESULT,
    GetMops: ?extern fn(?*ITypeInfo2, MEMBERID, ?*BSTR) HRESULT,
    GetContainingTypeLib: ?extern fn(?*ITypeInfo2, ?*(?*ITypeLib), ?*UINT) HRESULT,
    ReleaseTypeAttr: ?extern fn(?*ITypeInfo2, ?*TYPEATTR) void,
    ReleaseFuncDesc: ?extern fn(?*ITypeInfo2, ?*FUNCDESC) void,
    ReleaseVarDesc: ?extern fn(?*ITypeInfo2, ?*VARDESC) void,
    GetTypeKind: ?extern fn(?*ITypeInfo2, ?*TYPEKIND) HRESULT,
    GetTypeFlags: ?extern fn(?*ITypeInfo2, ?*ULONG) HRESULT,
    GetFuncIndexOfMemId: ?extern fn(?*ITypeInfo2, MEMBERID, INVOKEKIND, ?*UINT) HRESULT,
    GetVarIndexOfMemId: ?extern fn(?*ITypeInfo2, MEMBERID, ?*UINT) HRESULT,
    GetCustData: ?extern fn(?*ITypeInfo2, ?*const GUID, ?*VARIANT) HRESULT,
    GetFuncCustData: ?extern fn(?*ITypeInfo2, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    GetParamCustData: ?extern fn(?*ITypeInfo2, UINT, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    GetVarCustData: ?extern fn(?*ITypeInfo2, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    GetImplTypeCustData: ?extern fn(?*ITypeInfo2, UINT, ?*const GUID, ?*VARIANT) HRESULT,
    GetDocumentation2: ?extern fn(?*ITypeInfo2, MEMBERID, LCID, ?*BSTR, ?*DWORD, ?*BSTR) HRESULT,
    GetAllCustData: ?extern fn(?*ITypeInfo2, ?*CUSTDATA) HRESULT,
    GetAllFuncCustData: ?extern fn(?*ITypeInfo2, UINT, ?*CUSTDATA) HRESULT,
    GetAllParamCustData: ?extern fn(?*ITypeInfo2, UINT, UINT, ?*CUSTDATA) HRESULT,
    GetAllVarCustData: ?extern fn(?*ITypeInfo2, UINT, ?*CUSTDATA) HRESULT,
    GetAllImplTypeCustData: ?extern fn(?*ITypeInfo2, UINT, ?*CUSTDATA) HRESULT,
};
pub const ITypeInfo2 = extern struct {
    lpVtbl: ?*ITypeInfo2Vtbl,
};

pub const ITypeLib2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeLib2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeLib2) ULONG,
    Release: ?extern fn(?*ITypeLib2) ULONG,
    GetTypeInfoCount: ?extern fn(?*ITypeLib2) UINT,
    GetTypeInfo: ?extern fn(?*ITypeLib2, UINT, ?*(?*ITypeInfo)) HRESULT,
    GetTypeInfoType: ?extern fn(?*ITypeLib2, UINT, ?*TYPEKIND) HRESULT,
    GetTypeInfoOfGuid: ?extern fn(?*ITypeLib2, ?*const GUID, ?*(?*ITypeInfo)) HRESULT,
    GetLibAttr: ?extern fn(?*ITypeLib2, ?*(?*TLIBATTR)) HRESULT,
    GetTypeComp: ?extern fn(?*ITypeLib2, ?*(?*ITypeComp)) HRESULT,
    GetDocumentation: ?extern fn(?*ITypeLib2, INT, ?*BSTR, ?*BSTR, ?*DWORD, ?*BSTR) HRESULT,
    IsName: ?extern fn(?*ITypeLib2, LPOLESTR, ULONG, ?*BOOL) HRESULT,
    FindName: ?extern fn(?*ITypeLib2, LPOLESTR, ULONG, ?*(?*ITypeInfo), ?*MEMBERID, ?*USHORT) HRESULT,
    ReleaseTLibAttr: ?extern fn(?*ITypeLib2, ?*TLIBATTR) void,
    GetCustData: ?extern fn(?*ITypeLib2, ?*const GUID, ?*VARIANT) HRESULT,
    GetLibStatistics: ?extern fn(?*ITypeLib2, ?*ULONG, ?*ULONG) HRESULT,
    GetDocumentation2: ?extern fn(?*ITypeLib2, INT, LCID, ?*BSTR, ?*DWORD, ?*BSTR) HRESULT,
    GetAllCustData: ?extern fn(?*ITypeLib2, ?*CUSTDATA) HRESULT,
};
pub const ITypeLib2 = extern struct {
    lpVtbl: ?*ITypeLib2Vtbl,
};

pub const CHANGEKIND = c_int;

pub const ITypeChangeEventsVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeChangeEvents, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeChangeEvents) ULONG,
    Release: ?extern fn(?*ITypeChangeEvents) ULONG,
    RequestTypeChange: ?extern fn(?*ITypeChangeEvents, CHANGEKIND, ?*ITypeInfo, LPOLESTR, ?*INT) HRESULT,
    AfterTypeChange: ?extern fn(?*ITypeChangeEvents, CHANGEKIND, ?*ITypeInfo, LPOLESTR) HRESULT,
};
pub const ITypeChangeEvents = extern struct {
    lpVtbl: ?*ITypeChangeEventsVtbl,
};

pub const IErrorInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IErrorInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IErrorInfo) ULONG,
    Release: ?extern fn(?*IErrorInfo) ULONG,
    GetGUID: ?extern fn(?*IErrorInfo, ?*GUID) HRESULT,
    GetSource: ?extern fn(?*IErrorInfo, ?*BSTR) HRESULT,
    GetDescription: ?extern fn(?*IErrorInfo, ?*BSTR) HRESULT,
    GetHelpFile: ?extern fn(?*IErrorInfo, ?*BSTR) HRESULT,
    GetHelpContext: ?extern fn(?*IErrorInfo, ?*DWORD) HRESULT,
};
pub const IErrorInfo = extern struct {
    lpVtbl: ?*IErrorInfoVtbl,
};

pub const ICreateErrorInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICreateErrorInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICreateErrorInfo) ULONG,
    Release: ?extern fn(?*ICreateErrorInfo) ULONG,
    SetGUID: ?extern fn(?*ICreateErrorInfo, ?*const GUID) HRESULT,
    SetSource: ?extern fn(?*ICreateErrorInfo, LPOLESTR) HRESULT,
    SetDescription: ?extern fn(?*ICreateErrorInfo, LPOLESTR) HRESULT,
    SetHelpFile: ?extern fn(?*ICreateErrorInfo, LPOLESTR) HRESULT,
    SetHelpContext: ?extern fn(?*ICreateErrorInfo, DWORD) HRESULT,
};
pub const ICreateErrorInfo = extern struct {
    lpVtbl: ?*ICreateErrorInfoVtbl,
};

pub const ISupportErrorInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISupportErrorInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISupportErrorInfo) ULONG,
    Release: ?extern fn(?*ISupportErrorInfo) ULONG,
    InterfaceSupportsErrorInfo: ?extern fn(?*ISupportErrorInfo, ?*const IID) HRESULT,
};
pub const ISupportErrorInfo = extern struct {
    lpVtbl: ?*ISupportErrorInfoVtbl,
};

pub const ITypeFactoryVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeFactory, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeFactory) ULONG,
    Release: ?extern fn(?*ITypeFactory) ULONG,
    CreateFromTypeInfo: ?extern fn(?*ITypeFactory, ?*ITypeInfo, ?*const IID, ?*(?*IUnknown)) HRESULT,
};
pub const ITypeFactory = extern struct {
    lpVtbl: ?*ITypeFactoryVtbl,
};

pub const ITypeMarshalVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeMarshal, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeMarshal) ULONG,
    Release: ?extern fn(?*ITypeMarshal) ULONG,
    Size: ?extern fn(?*ITypeMarshal, PVOID, DWORD, PVOID, ?*ULONG) HRESULT,
    Marshal: ?extern fn(?*ITypeMarshal, PVOID, DWORD, PVOID, ULONG, ?*BYTE, ?*ULONG) HRESULT,
    Unmarshal: ?extern fn(?*ITypeMarshal, PVOID, DWORD, ULONG, ?*BYTE, ?*ULONG) HRESULT,
    Free: ?extern fn(?*ITypeMarshal, PVOID) HRESULT,
};
pub const ITypeMarshal = extern struct {
    lpVtbl: ?*ITypeMarshalVtbl,
};

pub const IErrorLogVtbl = extern struct {
    QueryInterface: ?extern fn(?*IErrorLog, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IErrorLog) ULONG,
    Release: ?extern fn(?*IErrorLog) ULONG,
    AddError: ?extern fn(?*IErrorLog, LPCOLESTR, ?*EXCEPINFO) HRESULT,
};
pub const IErrorLog = extern struct {
    lpVtbl: ?*IErrorLogVtbl,
};

pub const IPropertyBagVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPropertyBag, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPropertyBag) ULONG,
    Release: ?extern fn(?*IPropertyBag) ULONG,
    Read: ?extern fn(?*IPropertyBag, LPCOLESTR, ?*VARIANT, ?*IErrorLog) HRESULT,
    Write: ?extern fn(?*IPropertyBag, LPCOLESTR, ?*VARIANT) HRESULT,
};
pub const IPropertyBag = extern struct {
    lpVtbl: ?*IPropertyBagVtbl,
};

pub const ITypeLibRegistrationReaderVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeLibRegistrationReader, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeLibRegistrationReader) ULONG,
    Release: ?extern fn(?*ITypeLibRegistrationReader) ULONG,
    EnumTypeLibRegistrations: ?extern fn(?*ITypeLibRegistrationReader, ?*(?*IEnumUnknown)) HRESULT,
};
pub const ITypeLibRegistrationReader = extern struct {
    lpVtbl: ?*ITypeLibRegistrationReaderVtbl,
};

pub const ITypeLibRegistrationVtbl = extern struct {
    QueryInterface: ?extern fn(?*ITypeLibRegistration, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ITypeLibRegistration) ULONG,
    Release: ?extern fn(?*ITypeLibRegistration) ULONG,
    GetGuid: ?extern fn(?*ITypeLibRegistration, ?*GUID) HRESULT,
    GetVersion: ?extern fn(?*ITypeLibRegistration, ?*BSTR) HRESULT,
    GetLcid: ?extern fn(?*ITypeLibRegistration, ?*LCID) HRESULT,
    GetWin32Path: ?extern fn(?*ITypeLibRegistration, ?*BSTR) HRESULT,
    GetWin64Path: ?extern fn(?*ITypeLibRegistration, ?*BSTR) HRESULT,
    GetDisplayName: ?extern fn(?*ITypeLibRegistration, ?*BSTR) HRESULT,
    GetFlags: ?extern fn(?*ITypeLibRegistration, ?*DWORD) HRESULT,
    GetHelpDir: ?extern fn(?*ITypeLibRegistration, ?*BSTR) HRESULT,
};
pub const ITypeLibRegistration = extern struct {
    lpVtbl: ?*ITypeLibRegistrationVtbl,
};
pub const CURRENCY = CY;
pub const LPSAFEARRAYBOUND = ?*SAFEARRAYBOUND;
pub const wireSAFEARR_BSTR = extern struct {
    Size: ULONG,
    aBstr: ?*wireBSTR,
};
pub const SAFEARR_BSTR = wireSAFEARR_BSTR;
pub const wireSAFEARR_UNKNOWN = extern struct {
    Size: ULONG,
    apUnknown: ?*(?*IUnknown),
};
pub const SAFEARR_UNKNOWN = wireSAFEARR_UNKNOWN;
pub const wireSAFEARR_DISPATCH = extern struct {
    Size: ULONG,
    apDispatch: ?*(?*IDispatch),
};
pub const SAFEARR_DISPATCH = wireSAFEARR_DISPATCH;

pub const wireSAFEARR_VARIANT = extern struct {
    Size: ULONG,
    aVariant: ?*wireVARIANT,
};
pub const SAFEARR_VARIANT = wireSAFEARR_VARIANT;
pub const wireBRECORD = extern struct {
    fFlags: ULONG,
    clSize: ULONG,
    pRecInfo: ?*IRecordInfo,
    pRecord: ?*byte,
};

pub const wireSAFEARR_BRECORD = extern struct {
    Size: ULONG,
    aRecord: ?*wireBRECORD,
};
pub const SAFEARR_BRECORD = wireSAFEARR_BRECORD;
pub const wireSAFEARR_HAVEIID = extern struct {
    Size: ULONG,
    apUnknown: ?*(?*IUnknown),
    iid: IID,
};
pub const SAFEARR_HAVEIID = wireSAFEARR_HAVEIID;
pub const _MIDL_IOleAutomationTypes_0001 = extern union {
    BstrStr: SAFEARR_BSTR,
    UnknownStr: SAFEARR_UNKNOWN,
    DispatchStr: SAFEARR_DISPATCH,
    VariantStr: SAFEARR_VARIANT,
    RecordStr: SAFEARR_BRECORD,
    HaveIidStr: SAFEARR_HAVEIID,
    ByteStr: BYTE_SIZEDARR,
    WordStr: WORD_SIZEDARR,
    LongStr: DWORD_SIZEDARR,
    HyperStr: HYPER_SIZEDARR,
};
pub const wireSAFEARRAY_UNION = extern struct {
    sfType: ULONG,
    u: _MIDL_IOleAutomationTypes_0001,
};
pub const SAFEARRAYUNION = wireSAFEARRAY_UNION;
pub const wireSAFEARRAY = extern struct {
    cDims: USHORT,
    fFeatures: USHORT,
    cbElements: ULONG,
    cLocks: ULONG,
    uArrayStructs: SAFEARRAYUNION,
    rgsabound: [1]SAFEARRAYBOUND,
};

pub const wirePSAFEARRAY = ?*wireSAFEARRAY;
pub const wireVARIANT = extern struct {
    clSize: DWORD,
    rpcReserved: DWORD,
    vt: USHORT,
    wReserved1: USHORT,
    wReserved2: USHORT,
    wReserved3: USHORT,
    u: extern union {
        llVal: LONGLONG,
        lVal: LONG,
        bVal: BYTE,
        iVal: SHORT,
        fltVal: FLOAT,
        dblVal: DOUBLE,
        boolVal: VARIANT_BOOL,
        scode: SCODE,
        cyVal: CY,
        date: DATE,
        bstrVal: wireBSTR,
        punkVal: ?*IUnknown,
        pdispVal: ?*IDispatch,
        parray: wirePSAFEARRAY,
        brecVal: wireBRECORD,
        pbVal: ?*BYTE,
        piVal: ?*SHORT,
        plVal: ?*LONG,
        pllVal: ?*LONGLONG,
        pfltVal: ?*FLOAT,
        pdblVal: ?*DOUBLE,
        pboolVal: ?*VARIANT_BOOL,
        pscode: ?*SCODE,
        pcyVal: ?*CY,
        pdate: ?*DATE,
        pbstrVal: ?*wireBSTR,
        ppunkVal: ?*(?*IUnknown),
        ppdispVal: ?*(?*IDispatch),
        pparray: ?*wirePSAFEARRAY,
        pvarVal: ?*wireVARIANT,
        cVal: CHAR,
        uiVal: USHORT,
        ulVal: ULONG,
        ullVal: ULONGLONG,
        intVal: INT,
        uintVal: UINT,
        decVal: DECIMAL,
        pdecVal: ?*DECIMAL,
        pcVal: ?*CHAR,
        puiVal: ?*USHORT,
        pulVal: ?*ULONG,
        pullVal: ?*ULONGLONG,
        pintVal: ?*INT,
        puintVal: ?*UINT,
    },
};
pub const SF_TYPE = c_int;

pub const LPVARIANT = ?*VARIANT;
pub const LPVARIANTARG = ?*VARIANT;


pub const LPPARAMDESC = ?*PARAMDESC;
pub const LPIDLDESC = ?*IDLDESC;
pub const LPELEMDESC = ?*ELEMDESC;
pub const LPTYPEATTR = ?*TYPEATTR;
pub const LPEXCEPINFO = ?*EXCEPINFO;
pub const LPFUNCDESC = ?*FUNCDESC;
pub const LPVARDESC = ?*VARDESC;
pub const TYPEFLAGS = c_int;

pub const FUNCFLAGS = c_int;

pub const VARFLAGS = c_int;

pub const CLEANLOCALSTORAGE = extern struct {
    pInterface: ?*IUnknown,
    pStorage: PVOID,
    flags: DWORD,
};


pub const LPCUSTDATA = ?*CUSTDATA;
pub const LPCREATETYPEINFO = ?*ICreateTypeInfo;

pub const LPCREATETYPEINFO2 = ?*ICreateTypeInfo2;

pub const LPCREATETYPELIB = ?*ICreateTypeLib;

pub const LPCREATETYPELIB2 = ?*ICreateTypeLib2;

pub const LPDISPATCH = ?*IDispatch;

pub const LPENUMVARIANT = ?*IEnumVARIANT;

pub const LPTYPECOMP = ?*ITypeComp;
pub const LPBINDPTR = ?*BINDPTR;

pub const LPTYPEINFO = ?*ITypeInfo;

pub const LPTYPEINFO2 = ?*ITypeInfo2;

pub const LIBFLAGS = c_int;

pub const LPTYPELIB = ?*ITypeLib;
pub const LPTLIBATTR = ?*TLIBATTR;

pub const LPTYPELIB2 = ?*ITypeLib2;

pub const LPTYPECHANGEEVENTS = ?*ITypeChangeEvents;

pub const LPERRORINFO = ?*IErrorInfo;

pub const LPCREATEERRORINFO = ?*ICreateErrorInfo;

pub const LPSUPPORTERRORINFO = ?*ISupportErrorInfo;



pub const LPRECORDINFO = ?*IRecordInfo;

pub const LPERRORLOG = ?*IErrorLog;

pub const LPPROPERTYBAG = ?*IPropertyBag;



pub const VERSIONEDSTREAM = VersionedStream;
pub const LPPROPVARIANT = ?*PROPVARIANT;

pub const LPPROPERTYSETSTORAGE = ?*IPropertySetStorage;

pub const LPENUMSTATPROPSTG = ?*IEnumSTATPROPSTG;

pub const LPENUMSTATPROPSETSTG = ?*IEnumSTATPROPSETSTG;

pub const LPPROPERTYSTORAGE = ?*IPropertyStorage;
pub const STGFMT = DWORD;
pub const STGOPTIONS = extern struct {
    usVersion: USHORT,
    reserved: USHORT,
    ulSectorSize: ULONG,
    pwcsTemplateFile: ?*const WCHAR,
};

pub const COINIT = c_int;

pub const COMSD = c_int;


pub const IPersistMonikerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPersistMoniker, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPersistMoniker) ULONG,
    Release: ?extern fn(?*IPersistMoniker) ULONG,
    GetClassID: ?extern fn(?*IPersistMoniker, ?*CLSID) HRESULT,
    IsDirty: ?extern fn(?*IPersistMoniker) HRESULT,
    Load: ?extern fn(?*IPersistMoniker, BOOL, ?*IMoniker, LPBC, DWORD) HRESULT,
    Save: ?extern fn(?*IPersistMoniker, ?*IMoniker, LPBC, BOOL) HRESULT,
    SaveCompleted: ?extern fn(?*IPersistMoniker, ?*IMoniker, LPBC) HRESULT,
    GetCurMoniker: ?extern fn(?*IPersistMoniker, ?*(?*IMoniker)) HRESULT,
};
pub const IPersistMoniker = extern struct {
    lpVtbl: ?*IPersistMonikerVtbl,
};

pub const _MIDL_IMonikerProp_0001 = c_int;
pub const MONIKERPROPERTY = _MIDL_IMonikerProp_0001;
pub const IMonikerPropVtbl = extern struct {
    QueryInterface: ?extern fn(?*IMonikerProp, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IMonikerProp) ULONG,
    Release: ?extern fn(?*IMonikerProp) ULONG,
    PutProperty: ?extern fn(?*IMonikerProp, MONIKERPROPERTY, LPCWSTR) HRESULT,
};
pub const IMonikerProp = extern struct {
    lpVtbl: ?*IMonikerPropVtbl,
};


pub const IBindingVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBinding, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBinding) ULONG,
    Release: ?extern fn(?*IBinding) ULONG,
    Abort: ?extern fn(?*IBinding) HRESULT,
    Suspend: ?extern fn(?*IBinding) HRESULT,
    Resume: ?extern fn(?*IBinding) HRESULT,
    SetPriority: ?extern fn(?*IBinding, LONG) HRESULT,
    GetPriority: ?extern fn(?*IBinding, ?*LONG) HRESULT,
    GetBindResult: ?extern fn(?*IBinding, ?*CLSID, ?*DWORD, ?*LPOLESTR, ?*DWORD) HRESULT,
};
pub const IBinding = extern struct {
    lpVtbl: ?*IBindingVtbl,
};
pub const IBindProtocolVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindProtocol, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindProtocol) ULONG,
    Release: ?extern fn(?*IBindProtocol) ULONG,
    CreateBinding: ?extern fn(?*IBindProtocol, LPCWSTR, ?*IBindCtx, ?*(?*IBinding)) HRESULT,
};
pub const IBindProtocol = extern struct {
    lpVtbl: ?*IBindProtocolVtbl,
};

pub const BINDINFO = extern struct {
    cbSize: ULONG,
    szExtraInfo: LPWSTR,
    stgmedData: STGMEDIUM,
    grfBindInfoF: DWORD,
    dwBindVerb: DWORD,
    szCustomVerb: LPWSTR,
    cbstgmedData: DWORD,
    dwOptions: DWORD,
    dwOptionsFlags: DWORD,
    dwCodePage: DWORD,
    securityAttributes: SECURITY_ATTRIBUTES,
    iid: IID,
    pUnk: ?*IUnknown,
    dwReserved: DWORD,
};

pub const IBindStatusCallbackVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindStatusCallback, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindStatusCallback) ULONG,
    Release: ?extern fn(?*IBindStatusCallback) ULONG,
    OnStartBinding: ?extern fn(?*IBindStatusCallback, DWORD, ?*IBinding) HRESULT,
    GetPriority: ?extern fn(?*IBindStatusCallback, ?*LONG) HRESULT,
    OnLowResource: ?extern fn(?*IBindStatusCallback, DWORD) HRESULT,
    OnProgress: ?extern fn(?*IBindStatusCallback, ULONG, ULONG, ULONG, LPCWSTR) HRESULT,
    OnStopBinding: ?extern fn(?*IBindStatusCallback, HRESULT, LPCWSTR) HRESULT,
    GetBindInfo: ?extern fn(?*IBindStatusCallback, ?*DWORD, ?*BINDINFO) HRESULT,
    OnDataAvailable: ?extern fn(?*IBindStatusCallback, DWORD, DWORD, ?*FORMATETC, ?*STGMEDIUM) HRESULT,
    OnObjectAvailable: ?extern fn(?*IBindStatusCallback, ?*const IID, ?*IUnknown) HRESULT,
};
pub const IBindStatusCallback = extern struct {
    lpVtbl: ?*IBindStatusCallbackVtbl,
};

pub const IBindStatusCallbackExVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindStatusCallbackEx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindStatusCallbackEx) ULONG,
    Release: ?extern fn(?*IBindStatusCallbackEx) ULONG,
    OnStartBinding: ?extern fn(?*IBindStatusCallbackEx, DWORD, ?*IBinding) HRESULT,
    GetPriority: ?extern fn(?*IBindStatusCallbackEx, ?*LONG) HRESULT,
    OnLowResource: ?extern fn(?*IBindStatusCallbackEx, DWORD) HRESULT,
    OnProgress: ?extern fn(?*IBindStatusCallbackEx, ULONG, ULONG, ULONG, LPCWSTR) HRESULT,
    OnStopBinding: ?extern fn(?*IBindStatusCallbackEx, HRESULT, LPCWSTR) HRESULT,
    GetBindInfo: ?extern fn(?*IBindStatusCallbackEx, ?*DWORD, ?*BINDINFO) HRESULT,
    OnDataAvailable: ?extern fn(?*IBindStatusCallbackEx, DWORD, DWORD, ?*FORMATETC, ?*STGMEDIUM) HRESULT,
    OnObjectAvailable: ?extern fn(?*IBindStatusCallbackEx, ?*const IID, ?*IUnknown) HRESULT,
    GetBindInfoEx: ?extern fn(?*IBindStatusCallbackEx, ?*DWORD, ?*BINDINFO, ?*DWORD, ?*DWORD) HRESULT,
};
pub const IBindStatusCallbackEx = extern struct {
    lpVtbl: ?*IBindStatusCallbackExVtbl,
};

pub const IAuthenticateVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAuthenticate, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAuthenticate) ULONG,
    Release: ?extern fn(?*IAuthenticate) ULONG,
    Authenticate: ?extern fn(?*IAuthenticate, ?*HWND, ?*LPWSTR, ?*LPWSTR) HRESULT,
};
pub const IAuthenticate = extern struct {
    lpVtbl: ?*IAuthenticateVtbl,
};

pub const AUTHENTICATEINFO = extern struct {
    dwFlags: DWORD,
    dwReserved: DWORD,
};

pub const IAuthenticateExVtbl = extern struct {
    QueryInterface: ?extern fn(?*IAuthenticateEx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IAuthenticateEx) ULONG,
    Release: ?extern fn(?*IAuthenticateEx) ULONG,
    Authenticate: ?extern fn(?*IAuthenticateEx, ?*HWND, ?*LPWSTR, ?*LPWSTR) HRESULT,
    AuthenticateEx: ?extern fn(?*IAuthenticateEx, ?*HWND, ?*LPWSTR, ?*LPWSTR, ?*AUTHENTICATEINFO) HRESULT,
};
pub const IAuthenticateEx = extern struct {
    lpVtbl: ?*IAuthenticateExVtbl,
};

pub const IHttpNegotiateVtbl = extern struct {
    QueryInterface: ?extern fn(?*IHttpNegotiate, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IHttpNegotiate) ULONG,
    Release: ?extern fn(?*IHttpNegotiate) ULONG,
    BeginningTransaction: ?extern fn(?*IHttpNegotiate, LPCWSTR, LPCWSTR, DWORD, ?*LPWSTR) HRESULT,
    OnResponse: ?extern fn(?*IHttpNegotiate, DWORD, LPCWSTR, LPCWSTR, ?*LPWSTR) HRESULT,
};
pub const IHttpNegotiate = extern struct {
    lpVtbl: ?*IHttpNegotiateVtbl,
};

pub const IHttpNegotiate2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IHttpNegotiate2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IHttpNegotiate2) ULONG,
    Release: ?extern fn(?*IHttpNegotiate2) ULONG,
    BeginningTransaction: ?extern fn(?*IHttpNegotiate2, LPCWSTR, LPCWSTR, DWORD, ?*LPWSTR) HRESULT,
    OnResponse: ?extern fn(?*IHttpNegotiate2, DWORD, LPCWSTR, LPCWSTR, ?*LPWSTR) HRESULT,
    GetRootSecurityId: ?extern fn(?*IHttpNegotiate2, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
};
pub const IHttpNegotiate2 = extern struct {
    lpVtbl: ?*IHttpNegotiate2Vtbl,
};

pub const IHttpNegotiate3Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IHttpNegotiate3, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IHttpNegotiate3) ULONG,
    Release: ?extern fn(?*IHttpNegotiate3) ULONG,
    BeginningTransaction: ?extern fn(?*IHttpNegotiate3, LPCWSTR, LPCWSTR, DWORD, ?*LPWSTR) HRESULT,
    OnResponse: ?extern fn(?*IHttpNegotiate3, DWORD, LPCWSTR, LPCWSTR, ?*LPWSTR) HRESULT,
    GetRootSecurityId: ?extern fn(?*IHttpNegotiate3, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
    GetSerializedClientCertContext: ?extern fn(?*IHttpNegotiate3, ?*(?*BYTE), ?*DWORD) HRESULT,
};
pub const IHttpNegotiate3 = extern struct {
    lpVtbl: ?*IHttpNegotiate3Vtbl,
};

pub const IWinInetFileStreamVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWinInetFileStream, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWinInetFileStream) ULONG,
    Release: ?extern fn(?*IWinInetFileStream) ULONG,
    SetHandleForUnlock: ?extern fn(?*IWinInetFileStream, DWORD_PTR, DWORD_PTR) HRESULT,
    SetDeleteFile: ?extern fn(?*IWinInetFileStream, DWORD_PTR) HRESULT,
};
pub const IWinInetFileStream = extern struct {
    lpVtbl: ?*IWinInetFileStreamVtbl,
};

pub const IWindowForBindingUIVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWindowForBindingUI, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWindowForBindingUI) ULONG,
    Release: ?extern fn(?*IWindowForBindingUI) ULONG,
    GetWindow: ?extern fn(?*IWindowForBindingUI, ?*const GUID, ?*HWND) HRESULT,
};
pub const IWindowForBindingUI = extern struct {
    lpVtbl: ?*IWindowForBindingUIVtbl,
};

pub const ICodeInstallVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICodeInstall, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICodeInstall) ULONG,
    Release: ?extern fn(?*ICodeInstall) ULONG,
    GetWindow: ?extern fn(?*ICodeInstall, ?*const GUID, ?*HWND) HRESULT,
    OnCodeInstallProblem: ?extern fn(?*ICodeInstall, ULONG, LPCWSTR, LPCWSTR, DWORD) HRESULT,
};
pub const ICodeInstall = extern struct {
    lpVtbl: ?*ICodeInstallVtbl,
};

pub const _MIDL_IUri_0001 = c_int;
pub const Uri_PROPERTY = _MIDL_IUri_0001;
pub const IUriVtbl = extern struct {
    QueryInterface: ?extern fn(?*IUri, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IUri) ULONG,
    Release: ?extern fn(?*IUri) ULONG,
    GetPropertyBSTR: ?extern fn(?*IUri, Uri_PROPERTY, ?*BSTR, DWORD) HRESULT,
    GetPropertyLength: ?extern fn(?*IUri, Uri_PROPERTY, ?*DWORD, DWORD) HRESULT,
    GetPropertyDWORD: ?extern fn(?*IUri, Uri_PROPERTY, ?*DWORD, DWORD) HRESULT,
    HasProperty: ?extern fn(?*IUri, Uri_PROPERTY, ?*BOOL) HRESULT,
    GetAbsoluteUri: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetAuthority: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetDisplayUri: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetDomain: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetExtension: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetFragment: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetHost: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetPassword: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetPath: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetPathAndQuery: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetQuery: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetRawUri: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetSchemeName: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetUserInfo: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetUserNameA: ?extern fn(?*IUri, ?*BSTR) HRESULT,
    GetHostType: ?extern fn(?*IUri, ?*DWORD) HRESULT,
    GetPort: ?extern fn(?*IUri, ?*DWORD) HRESULT,
    GetScheme: ?extern fn(?*IUri, ?*DWORD) HRESULT,
    GetZone: ?extern fn(?*IUri, ?*DWORD) HRESULT,
    GetProperties: ?extern fn(?*IUri, LPDWORD) HRESULT,
    IsEqual: ?extern fn(?*IUri, ?*IUri, ?*BOOL) HRESULT,
};
pub const IUri = extern struct {
    lpVtbl: ?*IUriVtbl,
};

pub const IUriContainerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IUriContainer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IUriContainer) ULONG,
    Release: ?extern fn(?*IUriContainer) ULONG,
    GetIUri: ?extern fn(?*IUriContainer, ?*(?*IUri)) HRESULT,
};
pub const IUriContainer = extern struct {
    lpVtbl: ?*IUriContainerVtbl,
};

pub const IUriBuilderVtbl = extern struct {
    QueryInterface: ?extern fn(?*IUriBuilder, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IUriBuilder) ULONG,
    Release: ?extern fn(?*IUriBuilder) ULONG,
    CreateUriSimple: ?extern fn(?*IUriBuilder, DWORD, DWORD_PTR, ?*(?*IUri)) HRESULT,
    CreateUri: ?extern fn(?*IUriBuilder, DWORD, DWORD, DWORD_PTR, ?*(?*IUri)) HRESULT,
    CreateUriWithFlags: ?extern fn(?*IUriBuilder, DWORD, DWORD, DWORD, DWORD_PTR, ?*(?*IUri)) HRESULT,
    GetIUri: ?extern fn(?*IUriBuilder, ?*(?*IUri)) HRESULT,
    SetIUri: ?extern fn(?*IUriBuilder, ?*IUri) HRESULT,
    GetFragment: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    GetHost: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    GetPassword: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    GetPath: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    GetPort: ?extern fn(?*IUriBuilder, ?*BOOL, ?*DWORD) HRESULT,
    GetQuery: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    GetSchemeName: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    GetUserNameA: ?extern fn(?*IUriBuilder, ?*DWORD, ?*LPCWSTR) HRESULT,
    SetFragment: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    SetHost: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    SetPassword: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    SetPath: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    SetPortA: ?extern fn(?*IUriBuilder, BOOL, DWORD) HRESULT,
    SetQuery: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    SetSchemeName: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    SetUserName: ?extern fn(?*IUriBuilder, LPCWSTR) HRESULT,
    RemoveProperties: ?extern fn(?*IUriBuilder, DWORD) HRESULT,
    HasBeenModified: ?extern fn(?*IUriBuilder, ?*BOOL) HRESULT,
};
pub const IUriBuilder = extern struct {
    lpVtbl: ?*IUriBuilderVtbl,
};

pub const IUriBuilderFactoryVtbl = extern struct {
    QueryInterface: ?extern fn(?*IUriBuilderFactory, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IUriBuilderFactory) ULONG,
    Release: ?extern fn(?*IUriBuilderFactory) ULONG,
    CreateIUriBuilder: ?extern fn(?*IUriBuilderFactory, DWORD, DWORD_PTR, ?*(?*IUriBuilder)) HRESULT,
    CreateInitializedIUriBuilder: ?extern fn(?*IUriBuilderFactory, DWORD, DWORD_PTR, ?*(?*IUriBuilder)) HRESULT,
};
pub const IUriBuilderFactory = extern struct {
    lpVtbl: ?*IUriBuilderFactoryVtbl,
};

pub const IWinInetInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWinInetInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWinInetInfo) ULONG,
    Release: ?extern fn(?*IWinInetInfo) ULONG,
    QueryOption: ?extern fn(?*IWinInetInfo, DWORD, LPVOID, ?*DWORD) HRESULT,
};
pub const IWinInetInfo = extern struct {
    lpVtbl: ?*IWinInetInfoVtbl,
};

pub const IHttpSecurityVtbl = extern struct {
    QueryInterface: ?extern fn(?*IHttpSecurity, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IHttpSecurity) ULONG,
    Release: ?extern fn(?*IHttpSecurity) ULONG,
    GetWindow: ?extern fn(?*IHttpSecurity, ?*const GUID, ?*HWND) HRESULT,
    OnSecurityProblem: ?extern fn(?*IHttpSecurity, DWORD) HRESULT,
};
pub const IHttpSecurity = extern struct {
    lpVtbl: ?*IHttpSecurityVtbl,
};

pub const IWinInetHttpInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWinInetHttpInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWinInetHttpInfo) ULONG,
    Release: ?extern fn(?*IWinInetHttpInfo) ULONG,
    QueryOption: ?extern fn(?*IWinInetHttpInfo, DWORD, LPVOID, ?*DWORD) HRESULT,
    QueryInfo: ?extern fn(?*IWinInetHttpInfo, DWORD, LPVOID, ?*DWORD, ?*DWORD, ?*DWORD) HRESULT,
};
pub const IWinInetHttpInfo = extern struct {
    lpVtbl: ?*IWinInetHttpInfoVtbl,
};

pub const IWinInetHttpTimeoutsVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWinInetHttpTimeouts, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWinInetHttpTimeouts) ULONG,
    Release: ?extern fn(?*IWinInetHttpTimeouts) ULONG,
    GetRequestTimeouts: ?extern fn(?*IWinInetHttpTimeouts, ?*DWORD, ?*DWORD, ?*DWORD) HRESULT,
};
pub const IWinInetHttpTimeouts = extern struct {
    lpVtbl: ?*IWinInetHttpTimeoutsVtbl,
};

pub const IWinInetCacheHintsVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWinInetCacheHints, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWinInetCacheHints) ULONG,
    Release: ?extern fn(?*IWinInetCacheHints) ULONG,
    SetCacheExtension: ?extern fn(?*IWinInetCacheHints, LPCWSTR, LPVOID, ?*DWORD, ?*DWORD, ?*DWORD) HRESULT,
};
pub const IWinInetCacheHints = extern struct {
    lpVtbl: ?*IWinInetCacheHintsVtbl,
};

pub const IWinInetCacheHints2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IWinInetCacheHints2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWinInetCacheHints2) ULONG,
    Release: ?extern fn(?*IWinInetCacheHints2) ULONG,
    SetCacheExtension: ?extern fn(?*IWinInetCacheHints2, LPCWSTR, LPVOID, ?*DWORD, ?*DWORD, ?*DWORD) HRESULT,
    SetCacheExtension2: ?extern fn(?*IWinInetCacheHints2, LPCWSTR, ?*WCHAR, ?*DWORD, ?*DWORD, ?*DWORD) HRESULT,
};
pub const IWinInetCacheHints2 = extern struct {
    lpVtbl: ?*IWinInetCacheHints2Vtbl,
};

pub const IBindHostVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindHost, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindHost) ULONG,
    Release: ?extern fn(?*IBindHost) ULONG,
    CreateMoniker: ?extern fn(?*IBindHost, LPOLESTR, ?*IBindCtx, ?*(?*IMoniker), DWORD) HRESULT,
    MonikerBindToStorage: ?extern fn(?*IBindHost, ?*IMoniker, ?*IBindCtx, ?*IBindStatusCallback, ?*const IID, ?*(?*c_void)) HRESULT,
    MonikerBindToObject: ?extern fn(?*IBindHost, ?*IMoniker, ?*IBindCtx, ?*IBindStatusCallback, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IBindHost = extern struct {
    lpVtbl: ?*IBindHostVtbl,
};

pub const IInternetVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternet, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternet) ULONG,
    Release: ?extern fn(?*IInternet) ULONG,
};
pub const IInternet = extern struct {
    lpVtbl: ?*IInternetVtbl,
};

pub const IInternetBindInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetBindInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetBindInfo) ULONG,
    Release: ?extern fn(?*IInternetBindInfo) ULONG,
    GetBindInfo: ?extern fn(?*IInternetBindInfo, ?*DWORD, ?*BINDINFO) HRESULT,
    GetBindString: ?extern fn(?*IInternetBindInfo, ULONG, ?*LPOLESTR, ULONG, ?*ULONG) HRESULT,
};
pub const IInternetBindInfo = extern struct {
    lpVtbl: ?*IInternetBindInfoVtbl,
};

pub const IInternetBindInfoExVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetBindInfoEx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetBindInfoEx) ULONG,
    Release: ?extern fn(?*IInternetBindInfoEx) ULONG,
    GetBindInfo: ?extern fn(?*IInternetBindInfoEx, ?*DWORD, ?*BINDINFO) HRESULT,
    GetBindString: ?extern fn(?*IInternetBindInfoEx, ULONG, ?*LPOLESTR, ULONG, ?*ULONG) HRESULT,
    GetBindInfoEx: ?extern fn(?*IInternetBindInfoEx, ?*DWORD, ?*BINDINFO, ?*DWORD, ?*DWORD) HRESULT,
};
pub const IInternetBindInfoEx = extern struct {
    lpVtbl: ?*IInternetBindInfoExVtbl,
};


pub const PROTOCOLDATA = extern struct {
    grfFlags: DWORD,
    dwState: DWORD,
    pData: LPVOID,
    cbData: ULONG,
};

pub const IInternetProtocolSinkVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetProtocolSink, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetProtocolSink) ULONG,
    Release: ?extern fn(?*IInternetProtocolSink) ULONG,
    Switch: ?extern fn(?*IInternetProtocolSink, ?*PROTOCOLDATA) HRESULT,
    ReportProgress: ?extern fn(?*IInternetProtocolSink, ULONG, LPCWSTR) HRESULT,
    ReportData: ?extern fn(?*IInternetProtocolSink, DWORD, ULONG, ULONG) HRESULT,
    ReportResult: ?extern fn(?*IInternetProtocolSink, HRESULT, DWORD, LPCWSTR) HRESULT,
};
pub const IInternetProtocolSink = extern struct {
    lpVtbl: ?*IInternetProtocolSinkVtbl,
};
pub const IInternetProtocolRootVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetProtocolRoot, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetProtocolRoot) ULONG,
    Release: ?extern fn(?*IInternetProtocolRoot) ULONG,
    Start: ?extern fn(?*IInternetProtocolRoot, LPCWSTR, ?*IInternetProtocolSink, ?*IInternetBindInfo, DWORD, HANDLE_PTR) HRESULT,
    Continue: ?extern fn(?*IInternetProtocolRoot, ?*PROTOCOLDATA) HRESULT,
    Abort: ?extern fn(?*IInternetProtocolRoot, HRESULT, DWORD) HRESULT,
    Terminate: ?extern fn(?*IInternetProtocolRoot, DWORD) HRESULT,
    Suspend: ?extern fn(?*IInternetProtocolRoot) HRESULT,
    Resume: ?extern fn(?*IInternetProtocolRoot) HRESULT,
};
pub const IInternetProtocolRoot = extern struct {
    lpVtbl: ?*IInternetProtocolRootVtbl,
};

pub const IInternetProtocolVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetProtocol, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetProtocol) ULONG,
    Release: ?extern fn(?*IInternetProtocol) ULONG,
    Start: ?extern fn(?*IInternetProtocol, LPCWSTR, ?*IInternetProtocolSink, ?*IInternetBindInfo, DWORD, HANDLE_PTR) HRESULT,
    Continue: ?extern fn(?*IInternetProtocol, ?*PROTOCOLDATA) HRESULT,
    Abort: ?extern fn(?*IInternetProtocol, HRESULT, DWORD) HRESULT,
    Terminate: ?extern fn(?*IInternetProtocol, DWORD) HRESULT,
    Suspend: ?extern fn(?*IInternetProtocol) HRESULT,
    Resume: ?extern fn(?*IInternetProtocol) HRESULT,
    Read: ?extern fn(?*IInternetProtocol, ?*c_void, ULONG, ?*ULONG) HRESULT,
    Seek: ?extern fn(?*IInternetProtocol, LARGE_INTEGER, DWORD, ?*ULARGE_INTEGER) HRESULT,
    LockRequest: ?extern fn(?*IInternetProtocol, DWORD) HRESULT,
    UnlockRequest: ?extern fn(?*IInternetProtocol) HRESULT,
};
pub const IInternetProtocol = extern struct {
    lpVtbl: ?*IInternetProtocolVtbl,
};

pub const IInternetProtocolExVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetProtocolEx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetProtocolEx) ULONG,
    Release: ?extern fn(?*IInternetProtocolEx) ULONG,
    Start: ?extern fn(?*IInternetProtocolEx, LPCWSTR, ?*IInternetProtocolSink, ?*IInternetBindInfo, DWORD, HANDLE_PTR) HRESULT,
    Continue: ?extern fn(?*IInternetProtocolEx, ?*PROTOCOLDATA) HRESULT,
    Abort: ?extern fn(?*IInternetProtocolEx, HRESULT, DWORD) HRESULT,
    Terminate: ?extern fn(?*IInternetProtocolEx, DWORD) HRESULT,
    Suspend: ?extern fn(?*IInternetProtocolEx) HRESULT,
    Resume: ?extern fn(?*IInternetProtocolEx) HRESULT,
    Read: ?extern fn(?*IInternetProtocolEx, ?*c_void, ULONG, ?*ULONG) HRESULT,
    Seek: ?extern fn(?*IInternetProtocolEx, LARGE_INTEGER, DWORD, ?*ULARGE_INTEGER) HRESULT,
    LockRequest: ?extern fn(?*IInternetProtocolEx, DWORD) HRESULT,
    UnlockRequest: ?extern fn(?*IInternetProtocolEx) HRESULT,
    StartEx: ?extern fn(?*IInternetProtocolEx, ?*IUri, ?*IInternetProtocolSink, ?*IInternetBindInfo, DWORD, HANDLE_PTR) HRESULT,
};
pub const IInternetProtocolEx = extern struct {
    lpVtbl: ?*IInternetProtocolExVtbl,
};

pub const IInternetProtocolSinkStackableVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetProtocolSinkStackable, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetProtocolSinkStackable) ULONG,
    Release: ?extern fn(?*IInternetProtocolSinkStackable) ULONG,
    SwitchSink: ?extern fn(?*IInternetProtocolSinkStackable, ?*IInternetProtocolSink) HRESULT,
    CommitSwitch: ?extern fn(?*IInternetProtocolSinkStackable) HRESULT,
    RollbackSwitch: ?extern fn(?*IInternetProtocolSinkStackable) HRESULT,
};
pub const IInternetProtocolSinkStackable = extern struct {
    lpVtbl: ?*IInternetProtocolSinkStackableVtbl,
};

pub const IInternetSessionVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetSession, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetSession) ULONG,
    Release: ?extern fn(?*IInternetSession) ULONG,
    RegisterNameSpace: ?extern fn(?*IInternetSession, ?*IClassFactory, ?*const IID, LPCWSTR, ULONG, ?*const LPCWSTR, DWORD) HRESULT,
    UnregisterNameSpace: ?extern fn(?*IInternetSession, ?*IClassFactory, LPCWSTR) HRESULT,
    RegisterMimeFilter: ?extern fn(?*IInternetSession, ?*IClassFactory, ?*const IID, LPCWSTR) HRESULT,
    UnregisterMimeFilter: ?extern fn(?*IInternetSession, ?*IClassFactory, LPCWSTR) HRESULT,
    CreateBinding: ?extern fn(?*IInternetSession, LPBC, LPCWSTR, ?*IUnknown, ?*(?*IUnknown), ?*(?*IInternetProtocol), DWORD) HRESULT,
    SetSessionOption: ?extern fn(?*IInternetSession, DWORD, LPVOID, DWORD, DWORD) HRESULT,
    GetSessionOption: ?extern fn(?*IInternetSession, DWORD, LPVOID, ?*DWORD, DWORD) HRESULT,
};
pub const IInternetSession = extern struct {
    lpVtbl: ?*IInternetSessionVtbl,
};

pub const IInternetThreadSwitchVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetThreadSwitch, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetThreadSwitch) ULONG,
    Release: ?extern fn(?*IInternetThreadSwitch) ULONG,
    Prepare: ?extern fn(?*IInternetThreadSwitch) HRESULT,
    Continue: ?extern fn(?*IInternetThreadSwitch) HRESULT,
};
pub const IInternetThreadSwitch = extern struct {
    lpVtbl: ?*IInternetThreadSwitchVtbl,
};

pub const IInternetPriorityVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetPriority, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetPriority) ULONG,
    Release: ?extern fn(?*IInternetPriority) ULONG,
    SetPriority: ?extern fn(?*IInternetPriority, LONG) HRESULT,
    GetPriority: ?extern fn(?*IInternetPriority, ?*LONG) HRESULT,
};
pub const IInternetPriority = extern struct {
    lpVtbl: ?*IInternetPriorityVtbl,
};

pub const PARSEACTION = c_int;

pub const QUERYOPTION = c_int;

pub const IInternetProtocolInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetProtocolInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetProtocolInfo) ULONG,
    Release: ?extern fn(?*IInternetProtocolInfo) ULONG,
    ParseUrl: ?extern fn(?*IInternetProtocolInfo, LPCWSTR, PARSEACTION, DWORD, LPWSTR, DWORD, ?*DWORD, DWORD) HRESULT,
    CombineUrl: ?extern fn(?*IInternetProtocolInfo, LPCWSTR, LPCWSTR, DWORD, LPWSTR, DWORD, ?*DWORD, DWORD) HRESULT,
    CompareUrl: ?extern fn(?*IInternetProtocolInfo, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    QueryInfo: ?extern fn(?*IInternetProtocolInfo, LPCWSTR, QUERYOPTION, DWORD, LPVOID, DWORD, ?*DWORD, DWORD) HRESULT,
};
pub const IInternetProtocolInfo = extern struct {
    lpVtbl: ?*IInternetProtocolInfoVtbl,
};

pub const IInternetSecurityMgrSiteVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetSecurityMgrSite, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetSecurityMgrSite) ULONG,
    Release: ?extern fn(?*IInternetSecurityMgrSite) ULONG,
    GetWindow: ?extern fn(?*IInternetSecurityMgrSite, ?*HWND) HRESULT,
    EnableModeless: ?extern fn(?*IInternetSecurityMgrSite, BOOL) HRESULT,
};
pub const IInternetSecurityMgrSite = extern struct {
    lpVtbl: ?*IInternetSecurityMgrSiteVtbl,
};

pub const IInternetSecurityManagerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetSecurityManager, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetSecurityManager) ULONG,
    Release: ?extern fn(?*IInternetSecurityManager) ULONG,
    SetSecuritySite: ?extern fn(?*IInternetSecurityManager, ?*IInternetSecurityMgrSite) HRESULT,
    GetSecuritySite: ?extern fn(?*IInternetSecurityManager, ?*(?*IInternetSecurityMgrSite)) HRESULT,
    MapUrlToZone: ?extern fn(?*IInternetSecurityManager, LPCWSTR, ?*DWORD, DWORD) HRESULT,
    GetSecurityId: ?extern fn(?*IInternetSecurityManager, LPCWSTR, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
    ProcessUrlAction: ?extern fn(?*IInternetSecurityManager, LPCWSTR, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD) HRESULT,
    QueryCustomPolicy: ?extern fn(?*IInternetSecurityManager, LPCWSTR, ?*const GUID, ?*(?*BYTE), ?*DWORD, ?*BYTE, DWORD, DWORD) HRESULT,
    SetZoneMapping: ?extern fn(?*IInternetSecurityManager, DWORD, LPCWSTR, DWORD) HRESULT,
    GetZoneMappings: ?extern fn(?*IInternetSecurityManager, DWORD, ?*(?*IEnumString), DWORD) HRESULT,
};
pub const IInternetSecurityManager = extern struct {
    lpVtbl: ?*IInternetSecurityManagerVtbl,
};

pub const IInternetSecurityManagerExVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetSecurityManagerEx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetSecurityManagerEx) ULONG,
    Release: ?extern fn(?*IInternetSecurityManagerEx) ULONG,
    SetSecuritySite: ?extern fn(?*IInternetSecurityManagerEx, ?*IInternetSecurityMgrSite) HRESULT,
    GetSecuritySite: ?extern fn(?*IInternetSecurityManagerEx, ?*(?*IInternetSecurityMgrSite)) HRESULT,
    MapUrlToZone: ?extern fn(?*IInternetSecurityManagerEx, LPCWSTR, ?*DWORD, DWORD) HRESULT,
    GetSecurityId: ?extern fn(?*IInternetSecurityManagerEx, LPCWSTR, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
    ProcessUrlAction: ?extern fn(?*IInternetSecurityManagerEx, LPCWSTR, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD) HRESULT,
    QueryCustomPolicy: ?extern fn(?*IInternetSecurityManagerEx, LPCWSTR, ?*const GUID, ?*(?*BYTE), ?*DWORD, ?*BYTE, DWORD, DWORD) HRESULT,
    SetZoneMapping: ?extern fn(?*IInternetSecurityManagerEx, DWORD, LPCWSTR, DWORD) HRESULT,
    GetZoneMappings: ?extern fn(?*IInternetSecurityManagerEx, DWORD, ?*(?*IEnumString), DWORD) HRESULT,
    ProcessUrlActionEx: ?extern fn(?*IInternetSecurityManagerEx, LPCWSTR, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD, ?*DWORD) HRESULT,
};
pub const IInternetSecurityManagerEx = extern struct {
    lpVtbl: ?*IInternetSecurityManagerExVtbl,
};

pub const IInternetSecurityManagerEx2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetSecurityManagerEx2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetSecurityManagerEx2) ULONG,
    Release: ?extern fn(?*IInternetSecurityManagerEx2) ULONG,
    SetSecuritySite: ?extern fn(?*IInternetSecurityManagerEx2, ?*IInternetSecurityMgrSite) HRESULT,
    GetSecuritySite: ?extern fn(?*IInternetSecurityManagerEx2, ?*(?*IInternetSecurityMgrSite)) HRESULT,
    MapUrlToZone: ?extern fn(?*IInternetSecurityManagerEx2, LPCWSTR, ?*DWORD, DWORD) HRESULT,
    GetSecurityId: ?extern fn(?*IInternetSecurityManagerEx2, LPCWSTR, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
    ProcessUrlAction: ?extern fn(?*IInternetSecurityManagerEx2, LPCWSTR, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD) HRESULT,
    QueryCustomPolicy: ?extern fn(?*IInternetSecurityManagerEx2, LPCWSTR, ?*const GUID, ?*(?*BYTE), ?*DWORD, ?*BYTE, DWORD, DWORD) HRESULT,
    SetZoneMapping: ?extern fn(?*IInternetSecurityManagerEx2, DWORD, LPCWSTR, DWORD) HRESULT,
    GetZoneMappings: ?extern fn(?*IInternetSecurityManagerEx2, DWORD, ?*(?*IEnumString), DWORD) HRESULT,
    ProcessUrlActionEx: ?extern fn(?*IInternetSecurityManagerEx2, LPCWSTR, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD, ?*DWORD) HRESULT,
    MapUrlToZoneEx2: ?extern fn(?*IInternetSecurityManagerEx2, ?*IUri, ?*DWORD, DWORD, ?*LPWSTR, ?*DWORD) HRESULT,
    ProcessUrlActionEx2: ?extern fn(?*IInternetSecurityManagerEx2, ?*IUri, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD_PTR, ?*DWORD) HRESULT,
    GetSecurityIdEx2: ?extern fn(?*IInternetSecurityManagerEx2, ?*IUri, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
    QueryCustomPolicyEx2: ?extern fn(?*IInternetSecurityManagerEx2, ?*IUri, ?*const GUID, ?*(?*BYTE), ?*DWORD, ?*BYTE, DWORD, DWORD_PTR) HRESULT,
};
pub const IInternetSecurityManagerEx2 = extern struct {
    lpVtbl: ?*IInternetSecurityManagerEx2Vtbl,
};

pub const IZoneIdentifierVtbl = extern struct {
    QueryInterface: ?extern fn(?*IZoneIdentifier, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IZoneIdentifier) ULONG,
    Release: ?extern fn(?*IZoneIdentifier) ULONG,
    GetId: ?extern fn(?*IZoneIdentifier, ?*DWORD) HRESULT,
    SetId: ?extern fn(?*IZoneIdentifier, DWORD) HRESULT,
    Remove: ?extern fn(?*IZoneIdentifier) HRESULT,
};
pub const IZoneIdentifier = extern struct {
    lpVtbl: ?*IZoneIdentifierVtbl,
};

pub const IZoneIdentifier2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IZoneIdentifier2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IZoneIdentifier2) ULONG,
    Release: ?extern fn(?*IZoneIdentifier2) ULONG,
    GetId: ?extern fn(?*IZoneIdentifier2, ?*DWORD) HRESULT,
    SetId: ?extern fn(?*IZoneIdentifier2, DWORD) HRESULT,
    Remove: ?extern fn(?*IZoneIdentifier2) HRESULT,
    GetLastWriterPackageFamilyName: ?extern fn(?*IZoneIdentifier2, ?*LPWSTR) HRESULT,
    SetLastWriterPackageFamilyName: ?extern fn(?*IZoneIdentifier2, LPCWSTR) HRESULT,
    RemoveLastWriterPackageFamilyName: ?extern fn(?*IZoneIdentifier2) HRESULT,
    GetAppZoneId: ?extern fn(?*IZoneIdentifier2, ?*DWORD) HRESULT,
    SetAppZoneId: ?extern fn(?*IZoneIdentifier2, DWORD) HRESULT,
    RemoveAppZoneId: ?extern fn(?*IZoneIdentifier2) HRESULT,
};
pub const IZoneIdentifier2 = extern struct {
    lpVtbl: ?*IZoneIdentifier2Vtbl,
};

pub const IInternetHostSecurityManagerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetHostSecurityManager, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetHostSecurityManager) ULONG,
    Release: ?extern fn(?*IInternetHostSecurityManager) ULONG,
    GetSecurityId: ?extern fn(?*IInternetHostSecurityManager, ?*BYTE, ?*DWORD, DWORD_PTR) HRESULT,
    ProcessUrlAction: ?extern fn(?*IInternetHostSecurityManager, DWORD, ?*BYTE, DWORD, ?*BYTE, DWORD, DWORD, DWORD) HRESULT,
    QueryCustomPolicy: ?extern fn(?*IInternetHostSecurityManager, ?*const GUID, ?*(?*BYTE), ?*DWORD, ?*BYTE, DWORD, DWORD) HRESULT,
};
pub const IInternetHostSecurityManager = extern struct {
    lpVtbl: ?*IInternetHostSecurityManagerVtbl,
};

pub const ZONEATTRIBUTES = extern struct {
    cbSize: ULONG,
    szDisplayName: [260]WCHAR,
    szDescription: [200]WCHAR,
    szIconPath: [260]WCHAR,
    dwTemplateMinLevel: DWORD,
    dwTemplateRecommended: DWORD,
    dwTemplateCurrentLevel: DWORD,
    dwFlags: DWORD,
};

pub const URLZONEREG = c_int;

pub const IInternetZoneManagerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetZoneManager, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetZoneManager) ULONG,
    Release: ?extern fn(?*IInternetZoneManager) ULONG,
    GetZoneAttributes: ?extern fn(?*IInternetZoneManager, DWORD, ?*ZONEATTRIBUTES) HRESULT,
    SetZoneAttributes: ?extern fn(?*IInternetZoneManager, DWORD, ?*ZONEATTRIBUTES) HRESULT,
    GetZoneCustomPolicy: ?extern fn(?*IInternetZoneManager, DWORD, ?*const GUID, ?*(?*BYTE), ?*DWORD, URLZONEREG) HRESULT,
    SetZoneCustomPolicy: ?extern fn(?*IInternetZoneManager, DWORD, ?*const GUID, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    GetZoneActionPolicy: ?extern fn(?*IInternetZoneManager, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    SetZoneActionPolicy: ?extern fn(?*IInternetZoneManager, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    PromptAction: ?extern fn(?*IInternetZoneManager, DWORD, HWND, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    LogAction: ?extern fn(?*IInternetZoneManager, DWORD, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    CreateZoneEnumerator: ?extern fn(?*IInternetZoneManager, ?*DWORD, ?*DWORD, DWORD) HRESULT,
    GetZoneAt: ?extern fn(?*IInternetZoneManager, DWORD, DWORD, ?*DWORD) HRESULT,
    DestroyZoneEnumerator: ?extern fn(?*IInternetZoneManager, DWORD) HRESULT,
    CopyTemplatePoliciesToZone: ?extern fn(?*IInternetZoneManager, DWORD, DWORD, DWORD) HRESULT,
};
pub const IInternetZoneManager = extern struct {
    lpVtbl: ?*IInternetZoneManagerVtbl,
};

pub const IInternetZoneManagerExVtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetZoneManagerEx, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetZoneManagerEx) ULONG,
    Release: ?extern fn(?*IInternetZoneManagerEx) ULONG,
    GetZoneAttributes: ?extern fn(?*IInternetZoneManagerEx, DWORD, ?*ZONEATTRIBUTES) HRESULT,
    SetZoneAttributes: ?extern fn(?*IInternetZoneManagerEx, DWORD, ?*ZONEATTRIBUTES) HRESULT,
    GetZoneCustomPolicy: ?extern fn(?*IInternetZoneManagerEx, DWORD, ?*const GUID, ?*(?*BYTE), ?*DWORD, URLZONEREG) HRESULT,
    SetZoneCustomPolicy: ?extern fn(?*IInternetZoneManagerEx, DWORD, ?*const GUID, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    GetZoneActionPolicy: ?extern fn(?*IInternetZoneManagerEx, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    SetZoneActionPolicy: ?extern fn(?*IInternetZoneManagerEx, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    PromptAction: ?extern fn(?*IInternetZoneManagerEx, DWORD, HWND, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    LogAction: ?extern fn(?*IInternetZoneManagerEx, DWORD, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    CreateZoneEnumerator: ?extern fn(?*IInternetZoneManagerEx, ?*DWORD, ?*DWORD, DWORD) HRESULT,
    GetZoneAt: ?extern fn(?*IInternetZoneManagerEx, DWORD, DWORD, ?*DWORD) HRESULT,
    DestroyZoneEnumerator: ?extern fn(?*IInternetZoneManagerEx, DWORD) HRESULT,
    CopyTemplatePoliciesToZone: ?extern fn(?*IInternetZoneManagerEx, DWORD, DWORD, DWORD) HRESULT,
    GetZoneActionPolicyEx: ?extern fn(?*IInternetZoneManagerEx, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG, DWORD) HRESULT,
    SetZoneActionPolicyEx: ?extern fn(?*IInternetZoneManagerEx, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG, DWORD) HRESULT,
};
pub const IInternetZoneManagerEx = extern struct {
    lpVtbl: ?*IInternetZoneManagerExVtbl,
};

pub const IInternetZoneManagerEx2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IInternetZoneManagerEx2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IInternetZoneManagerEx2) ULONG,
    Release: ?extern fn(?*IInternetZoneManagerEx2) ULONG,
    GetZoneAttributes: ?extern fn(?*IInternetZoneManagerEx2, DWORD, ?*ZONEATTRIBUTES) HRESULT,
    SetZoneAttributes: ?extern fn(?*IInternetZoneManagerEx2, DWORD, ?*ZONEATTRIBUTES) HRESULT,
    GetZoneCustomPolicy: ?extern fn(?*IInternetZoneManagerEx2, DWORD, ?*const GUID, ?*(?*BYTE), ?*DWORD, URLZONEREG) HRESULT,
    SetZoneCustomPolicy: ?extern fn(?*IInternetZoneManagerEx2, DWORD, ?*const GUID, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    GetZoneActionPolicy: ?extern fn(?*IInternetZoneManagerEx2, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    SetZoneActionPolicy: ?extern fn(?*IInternetZoneManagerEx2, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG) HRESULT,
    PromptAction: ?extern fn(?*IInternetZoneManagerEx2, DWORD, HWND, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    LogAction: ?extern fn(?*IInternetZoneManagerEx2, DWORD, LPCWSTR, LPCWSTR, DWORD) HRESULT,
    CreateZoneEnumerator: ?extern fn(?*IInternetZoneManagerEx2, ?*DWORD, ?*DWORD, DWORD) HRESULT,
    GetZoneAt: ?extern fn(?*IInternetZoneManagerEx2, DWORD, DWORD, ?*DWORD) HRESULT,
    DestroyZoneEnumerator: ?extern fn(?*IInternetZoneManagerEx2, DWORD) HRESULT,
    CopyTemplatePoliciesToZone: ?extern fn(?*IInternetZoneManagerEx2, DWORD, DWORD, DWORD) HRESULT,
    GetZoneActionPolicyEx: ?extern fn(?*IInternetZoneManagerEx2, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG, DWORD) HRESULT,
    SetZoneActionPolicyEx: ?extern fn(?*IInternetZoneManagerEx2, DWORD, DWORD, ?*BYTE, DWORD, URLZONEREG, DWORD) HRESULT,
    GetZoneAttributesEx: ?extern fn(?*IInternetZoneManagerEx2, DWORD, ?*ZONEATTRIBUTES, DWORD) HRESULT,
    GetZoneSecurityState: ?extern fn(?*IInternetZoneManagerEx2, DWORD, BOOL, LPDWORD, ?*BOOL) HRESULT,
    GetIESecurityState: ?extern fn(?*IInternetZoneManagerEx2, BOOL, LPDWORD, ?*BOOL, BOOL) HRESULT,
    FixUnsecureSettings: ?extern fn(?*IInternetZoneManagerEx2) HRESULT,
};
pub const IInternetZoneManagerEx2 = extern struct {
    lpVtbl: ?*IInternetZoneManagerEx2Vtbl,
};



pub const IXMLElementCollectionVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLElementCollection, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLElementCollection) ULONG,
    Release: ?extern fn(?*IXMLElementCollection) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLElementCollection, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLElementCollection, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLElementCollection, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLElementCollection, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    put_length: ?extern fn(?*IXMLElementCollection, c_long) HRESULT,
    get_length: ?extern fn(?*IXMLElementCollection, ?*c_long) HRESULT,
    get__newEnum: ?extern fn(?*IXMLElementCollection, ?*(?*IUnknown)) HRESULT,
    item: ?extern fn(?*IXMLElementCollection, VARIANT, VARIANT, ?*(?*IDispatch)) HRESULT,
};
pub const IXMLElementCollection = extern struct {
    lpVtbl: ?*IXMLElementCollectionVtbl,
};
pub const IXMLElementVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLElement, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLElement) ULONG,
    Release: ?extern fn(?*IXMLElement) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLElement, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLElement, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLElement, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLElement, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_tagName: ?extern fn(?*IXMLElement, ?*BSTR) HRESULT,
    put_tagName: ?extern fn(?*IXMLElement, BSTR) HRESULT,
    get_parent: ?extern fn(?*IXMLElement, ?*(?*IXMLElement)) HRESULT,
    setAttribute: ?extern fn(?*IXMLElement, BSTR, VARIANT) HRESULT,
    getAttribute: ?extern fn(?*IXMLElement, BSTR, ?*VARIANT) HRESULT,
    removeAttribute: ?extern fn(?*IXMLElement, BSTR) HRESULT,
    get_children: ?extern fn(?*IXMLElement, ?*(?*IXMLElementCollection)) HRESULT,
    get_type: ?extern fn(?*IXMLElement, ?*c_long) HRESULT,
    get_text: ?extern fn(?*IXMLElement, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLElement, BSTR) HRESULT,
    addChild: ?extern fn(?*IXMLElement, ?*IXMLElement, c_long, c_long) HRESULT,
    removeChild: ?extern fn(?*IXMLElement, ?*IXMLElement) HRESULT,
};
pub const IXMLElement = extern struct {
    lpVtbl: ?*IXMLElementVtbl,
};
pub const SOFTDISTINFO = extern struct {
    cbSize: ULONG,
    dwFlags: DWORD,
    dwAdState: DWORD,
    szTitle: LPWSTR,
    szAbstract: LPWSTR,
    szHREF: LPWSTR,
    dwInstalledVersionMS: DWORD,
    dwInstalledVersionLS: DWORD,
    dwUpdateVersionMS: DWORD,
    dwUpdateVersionLS: DWORD,
    dwAdvertisedVersionMS: DWORD,
    dwAdvertisedVersionLS: DWORD,
    dwReserved: DWORD,
};
pub const LPSOFTDISTINFO = ?*SOFTDISTINFO;
pub const CODEBASEHOLD = extern struct {
    cbSize: ULONG,
    szDistUnit: LPWSTR,
    szCodeBase: LPWSTR,
    dwVersionMS: DWORD,
    dwVersionLS: DWORD,
    dwStyle: DWORD,
};
pub const LPCODEBASEHOLD = ?*CODEBASEHOLD;
pub const ISoftDistExtVtbl = extern struct {
    QueryInterface: ?extern fn(?*ISoftDistExt, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ISoftDistExt) ULONG,
    Release: ?extern fn(?*ISoftDistExt) ULONG,
    ProcessSoftDist: ?extern fn(?*ISoftDistExt, LPCWSTR, ?*IXMLElement, LPSOFTDISTINFO) HRESULT,
    GetFirstCodeBase: ?extern fn(?*ISoftDistExt, ?*LPWSTR, LPDWORD) HRESULT,
    GetNextCodeBase: ?extern fn(?*ISoftDistExt, ?*LPWSTR, LPDWORD) HRESULT,
    AsyncInstallDistributionUnit: ?extern fn(?*ISoftDistExt, ?*IBindCtx, LPVOID, DWORD, LPCODEBASEHOLD) HRESULT,
};
pub const ISoftDistExt = extern struct {
    lpVtbl: ?*ISoftDistExtVtbl,
};

pub const ICatalogFileInfoVtbl = extern struct {
    QueryInterface: ?extern fn(?*ICatalogFileInfo, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*ICatalogFileInfo) ULONG,
    Release: ?extern fn(?*ICatalogFileInfo) ULONG,
    GetCatalogFile: ?extern fn(?*ICatalogFileInfo, ?*LPSTR) HRESULT,
    GetJavaTrust: ?extern fn(?*ICatalogFileInfo, ?*(?*c_void)) HRESULT,
};
pub const ICatalogFileInfo = extern struct {
    lpVtbl: ?*ICatalogFileInfoVtbl,
};

pub const IDataFilterVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDataFilter, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDataFilter) ULONG,
    Release: ?extern fn(?*IDataFilter) ULONG,
    DoEncode: ?extern fn(?*IDataFilter, DWORD, LONG, ?*BYTE, LONG, ?*BYTE, LONG, ?*LONG, ?*LONG, DWORD) HRESULT,
    DoDecode: ?extern fn(?*IDataFilter, DWORD, LONG, ?*BYTE, LONG, ?*BYTE, LONG, ?*LONG, ?*LONG, DWORD) HRESULT,
    SetEncodingLevel: ?extern fn(?*IDataFilter, DWORD) HRESULT,
};
pub const IDataFilter = extern struct {
    lpVtbl: ?*IDataFilterVtbl,
};

pub const DATAINFO = extern struct {
    ulTotalSize: ULONG,
    ulavrPacketSize: ULONG,
    ulConnectSpeed: ULONG,
    ulProcessorSpeed: ULONG,
};

pub const IEncodingFilterFactoryVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEncodingFilterFactory, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEncodingFilterFactory) ULONG,
    Release: ?extern fn(?*IEncodingFilterFactory) ULONG,
    FindBestFilter: ?extern fn(?*IEncodingFilterFactory, LPCWSTR, LPCWSTR, DATAINFO, ?*(?*IDataFilter)) HRESULT,
    GetDefaultFilter: ?extern fn(?*IEncodingFilterFactory, LPCWSTR, LPCWSTR, ?*(?*IDataFilter)) HRESULT,
};
pub const IEncodingFilterFactory = extern struct {
    lpVtbl: ?*IEncodingFilterFactoryVtbl,
};

pub const IWrappedProtocolVtbl = extern struct {
    QueryInterface: ?extern fn(?*IWrappedProtocol, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IWrappedProtocol) ULONG,
    Release: ?extern fn(?*IWrappedProtocol) ULONG,
    GetWrapperCode: ?extern fn(?*IWrappedProtocol, ?*LONG, DWORD_PTR) HRESULT,
};
pub const IWrappedProtocol = extern struct {
    lpVtbl: ?*IWrappedProtocolVtbl,
};

pub const _MIDL_IGetBindHandle_0001 = c_int;
pub const BINDHANDLETYPES = _MIDL_IGetBindHandle_0001;
pub const IGetBindHandleVtbl = extern struct {
    QueryInterface: ?extern fn(?*IGetBindHandle, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IGetBindHandle) ULONG,
    Release: ?extern fn(?*IGetBindHandle) ULONG,
    GetBindHandle: ?extern fn(?*IGetBindHandle, BINDHANDLETYPES, ?*HANDLE) HRESULT,
};
pub const IGetBindHandle = extern struct {
    lpVtbl: ?*IGetBindHandleVtbl,
};

pub const IBindCallbackRedirectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindCallbackRedirect, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindCallbackRedirect) ULONG,
    Release: ?extern fn(?*IBindCallbackRedirect) ULONG,
    Redirect: ?extern fn(?*IBindCallbackRedirect, LPCWSTR, ?*VARIANT_BOOL) HRESULT,
};
pub const IBindCallbackRedirect = extern struct {
    lpVtbl: ?*IBindCallbackRedirectVtbl,
};

pub const IBindHttpSecurityVtbl = extern struct {
    QueryInterface: ?extern fn(?*IBindHttpSecurity, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IBindHttpSecurity) ULONG,
    Release: ?extern fn(?*IBindHttpSecurity) ULONG,
    GetIgnoreCertMask: ?extern fn(?*IBindHttpSecurity, ?*DWORD) HRESULT,
};
pub const IBindHttpSecurity = extern struct {
    lpVtbl: ?*IBindHttpSecurityVtbl,
};

pub const IOleAdviseHolderVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleAdviseHolder, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleAdviseHolder) ULONG,
    Release: ?extern fn(?*IOleAdviseHolder) ULONG,
    Advise: ?extern fn(?*IOleAdviseHolder, ?*IAdviseSink, ?*DWORD) HRESULT,
    Unadvise: ?extern fn(?*IOleAdviseHolder, DWORD) HRESULT,
    EnumAdvise: ?extern fn(?*IOleAdviseHolder, ?*(?*IEnumSTATDATA)) HRESULT,
    SendOnRename: ?extern fn(?*IOleAdviseHolder, ?*IMoniker) HRESULT,
    SendOnSave: ?extern fn(?*IOleAdviseHolder) HRESULT,
    SendOnClose: ?extern fn(?*IOleAdviseHolder) HRESULT,
};
pub const IOleAdviseHolder = extern struct {
    lpVtbl: ?*IOleAdviseHolderVtbl,
};

pub const IOleCacheVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleCache, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleCache) ULONG,
    Release: ?extern fn(?*IOleCache) ULONG,
    Cache: ?extern fn(?*IOleCache, ?*FORMATETC, DWORD, ?*DWORD) HRESULT,
    Uncache: ?extern fn(?*IOleCache, DWORD) HRESULT,
    EnumCache: ?extern fn(?*IOleCache, ?*(?*IEnumSTATDATA)) HRESULT,
    InitCache: ?extern fn(?*IOleCache, ?*IDataObject) HRESULT,
    SetData: ?extern fn(?*IOleCache, ?*FORMATETC, ?*STGMEDIUM, BOOL) HRESULT,
};
pub const IOleCache = extern struct {
    lpVtbl: ?*IOleCacheVtbl,
};

pub const IOleCache2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleCache2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleCache2) ULONG,
    Release: ?extern fn(?*IOleCache2) ULONG,
    Cache: ?extern fn(?*IOleCache2, ?*FORMATETC, DWORD, ?*DWORD) HRESULT,
    Uncache: ?extern fn(?*IOleCache2, DWORD) HRESULT,
    EnumCache: ?extern fn(?*IOleCache2, ?*(?*IEnumSTATDATA)) HRESULT,
    InitCache: ?extern fn(?*IOleCache2, ?*IDataObject) HRESULT,
    SetData: ?extern fn(?*IOleCache2, ?*FORMATETC, ?*STGMEDIUM, BOOL) HRESULT,
    UpdateCache: ?extern fn(?*IOleCache2, LPDATAOBJECT, DWORD, LPVOID) HRESULT,
    DiscardCache: ?extern fn(?*IOleCache2, DWORD) HRESULT,
};
pub const IOleCache2 = extern struct {
    lpVtbl: ?*IOleCache2Vtbl,
};

pub const IOleCacheControlVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleCacheControl, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleCacheControl) ULONG,
    Release: ?extern fn(?*IOleCacheControl) ULONG,
    OnRun: ?extern fn(?*IOleCacheControl, LPDATAOBJECT) HRESULT,
    OnStop: ?extern fn(?*IOleCacheControl) HRESULT,
};
pub const IOleCacheControl = extern struct {
    lpVtbl: ?*IOleCacheControlVtbl,
};

pub const IParseDisplayNameVtbl = extern struct {
    QueryInterface: ?extern fn(?*IParseDisplayName, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IParseDisplayName) ULONG,
    Release: ?extern fn(?*IParseDisplayName) ULONG,
    ParseDisplayName: ?extern fn(?*IParseDisplayName, ?*IBindCtx, LPOLESTR, ?*ULONG, ?*(?*IMoniker)) HRESULT,
};
pub const IParseDisplayName = extern struct {
    lpVtbl: ?*IParseDisplayNameVtbl,
};

pub const IOleContainerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleContainer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleContainer) ULONG,
    Release: ?extern fn(?*IOleContainer) ULONG,
    ParseDisplayName: ?extern fn(?*IOleContainer, ?*IBindCtx, LPOLESTR, ?*ULONG, ?*(?*IMoniker)) HRESULT,
    EnumObjects: ?extern fn(?*IOleContainer, DWORD, ?*(?*IEnumUnknown)) HRESULT,
    LockContainer: ?extern fn(?*IOleContainer, BOOL) HRESULT,
};
pub const IOleContainer = extern struct {
    lpVtbl: ?*IOleContainerVtbl,
};

pub const IOleClientSiteVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleClientSite, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleClientSite) ULONG,
    Release: ?extern fn(?*IOleClientSite) ULONG,
    SaveObject: ?extern fn(?*IOleClientSite) HRESULT,
    GetMoniker: ?extern fn(?*IOleClientSite, DWORD, DWORD, ?*(?*IMoniker)) HRESULT,
    GetContainer: ?extern fn(?*IOleClientSite, ?*(?*IOleContainer)) HRESULT,
    ShowObject: ?extern fn(?*IOleClientSite) HRESULT,
    OnShowWindow: ?extern fn(?*IOleClientSite, BOOL) HRESULT,
    RequestNewObjectLayout: ?extern fn(?*IOleClientSite) HRESULT,
};
pub const IOleClientSite = extern struct {
    lpVtbl: ?*IOleClientSiteVtbl,
};


pub const OLEVERB = extern struct {
    lVerb: LONG,
    lpszVerbName: LPOLESTR,
    fuFlags: DWORD,
    grfAttribs: DWORD,
};
pub const LPOLEVERB = ?*OLEVERB;
pub const IEnumOLEVERBVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnumOLEVERB, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnumOLEVERB) ULONG,
    Release: ?extern fn(?*IEnumOLEVERB) ULONG,
    Next: ?extern fn(?*IEnumOLEVERB, ULONG, LPOLEVERB, ?*ULONG) HRESULT,
    Skip: ?extern fn(?*IEnumOLEVERB, ULONG) HRESULT,
    Reset: ?extern fn(?*IEnumOLEVERB) HRESULT,
    Clone: ?extern fn(?*IEnumOLEVERB, ?*(?*IEnumOLEVERB)) HRESULT,
};
pub const IEnumOLEVERB = extern struct {
    lpVtbl: ?*IEnumOLEVERBVtbl,
};
pub const IOleObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleObject) ULONG,
    Release: ?extern fn(?*IOleObject) ULONG,
    SetClientSite: ?extern fn(?*IOleObject, ?*IOleClientSite) HRESULT,
    GetClientSite: ?extern fn(?*IOleObject, ?*(?*IOleClientSite)) HRESULT,
    SetHostNames: ?extern fn(?*IOleObject, LPCOLESTR, LPCOLESTR) HRESULT,
    Close: ?extern fn(?*IOleObject, DWORD) HRESULT,
    SetMoniker: ?extern fn(?*IOleObject, DWORD, ?*IMoniker) HRESULT,
    GetMoniker: ?extern fn(?*IOleObject, DWORD, DWORD, ?*(?*IMoniker)) HRESULT,
    InitFromData: ?extern fn(?*IOleObject, ?*IDataObject, BOOL, DWORD) HRESULT,
    GetClipboardData: ?extern fn(?*IOleObject, DWORD, ?*(?*IDataObject)) HRESULT,
    DoVerb: ?extern fn(?*IOleObject, LONG, LPMSG, ?*IOleClientSite, LONG, HWND, LPCRECT) HRESULT,
    EnumVerbs: ?extern fn(?*IOleObject, ?*(?*IEnumOLEVERB)) HRESULT,
    Update: ?extern fn(?*IOleObject) HRESULT,
    IsUpToDate: ?extern fn(?*IOleObject) HRESULT,
    GetUserClassID: ?extern fn(?*IOleObject, ?*CLSID) HRESULT,
    GetUserType: ?extern fn(?*IOleObject, DWORD, ?*LPOLESTR) HRESULT,
    SetExtent: ?extern fn(?*IOleObject, DWORD, ?*SIZEL) HRESULT,
    GetExtent: ?extern fn(?*IOleObject, DWORD, ?*SIZEL) HRESULT,
    Advise: ?extern fn(?*IOleObject, ?*IAdviseSink, ?*DWORD) HRESULT,
    Unadvise: ?extern fn(?*IOleObject, DWORD) HRESULT,
    EnumAdvise: ?extern fn(?*IOleObject, ?*(?*IEnumSTATDATA)) HRESULT,
    GetMiscStatus: ?extern fn(?*IOleObject, DWORD, ?*DWORD) HRESULT,
    SetColorScheme: ?extern fn(?*IOleObject, ?*LOGPALETTE) HRESULT,
};
pub const IOleObject = extern struct {
    lpVtbl: ?*IOleObjectVtbl,
};

pub const IOleWindowVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleWindow, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleWindow) ULONG,
    Release: ?extern fn(?*IOleWindow) ULONG,
    GetWindow: ?extern fn(?*IOleWindow, ?*HWND) HRESULT,
    ContextSensitiveHelp: ?extern fn(?*IOleWindow, BOOL) HRESULT,
};
pub const IOleWindow = extern struct {
    lpVtbl: ?*IOleWindowVtbl,
};

pub const IOleLinkVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleLink, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleLink) ULONG,
    Release: ?extern fn(?*IOleLink) ULONG,
    SetUpdateOptions: ?extern fn(?*IOleLink, DWORD) HRESULT,
    GetUpdateOptions: ?extern fn(?*IOleLink, ?*DWORD) HRESULT,
    SetSourceMoniker: ?extern fn(?*IOleLink, ?*IMoniker, ?*const IID) HRESULT,
    GetSourceMoniker: ?extern fn(?*IOleLink, ?*(?*IMoniker)) HRESULT,
    SetSourceDisplayName: ?extern fn(?*IOleLink, LPCOLESTR) HRESULT,
    GetSourceDisplayName: ?extern fn(?*IOleLink, ?*LPOLESTR) HRESULT,
    BindToSource: ?extern fn(?*IOleLink, DWORD, ?*IBindCtx) HRESULT,
    BindIfRunning: ?extern fn(?*IOleLink) HRESULT,
    GetBoundSource: ?extern fn(?*IOleLink, ?*(?*IUnknown)) HRESULT,
    UnbindSource: ?extern fn(?*IOleLink) HRESULT,
    Update: ?extern fn(?*IOleLink, ?*IBindCtx) HRESULT,
};
pub const IOleLink = extern struct {
    lpVtbl: ?*IOleLinkVtbl,
};

pub const IOleItemContainerVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleItemContainer, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleItemContainer) ULONG,
    Release: ?extern fn(?*IOleItemContainer) ULONG,
    ParseDisplayName: ?extern fn(?*IOleItemContainer, ?*IBindCtx, LPOLESTR, ?*ULONG, ?*(?*IMoniker)) HRESULT,
    EnumObjects: ?extern fn(?*IOleItemContainer, DWORD, ?*(?*IEnumUnknown)) HRESULT,
    LockContainer: ?extern fn(?*IOleItemContainer, BOOL) HRESULT,
    GetObjectA: ?extern fn(?*IOleItemContainer, LPOLESTR, DWORD, ?*IBindCtx, ?*const IID, ?*(?*c_void)) HRESULT,
    GetObjectStorage: ?extern fn(?*IOleItemContainer, LPOLESTR, ?*IBindCtx, ?*const IID, ?*(?*c_void)) HRESULT,
    IsRunning: ?extern fn(?*IOleItemContainer, LPOLESTR) HRESULT,
};
pub const IOleItemContainer = extern struct {
    lpVtbl: ?*IOleItemContainerVtbl,
};

pub const LPCBORDERWIDTHS = LPCRECT;

pub const IOleInPlaceActiveObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleInPlaceActiveObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleInPlaceActiveObject) ULONG,
    Release: ?extern fn(?*IOleInPlaceActiveObject) ULONG,
    GetWindow: ?extern fn(?*IOleInPlaceActiveObject, ?*HWND) HRESULT,
    ContextSensitiveHelp: ?extern fn(?*IOleInPlaceActiveObject, BOOL) HRESULT,
    TranslateAcceleratorA: ?extern fn(?*IOleInPlaceActiveObject, LPMSG) HRESULT,
    OnFrameWindowActivate: ?extern fn(?*IOleInPlaceActiveObject, BOOL) HRESULT,
    OnDocWindowActivate: ?extern fn(?*IOleInPlaceActiveObject, BOOL) HRESULT,
    ResizeBorder: ?extern fn(?*IOleInPlaceActiveObject, LPCRECT, ?*IOleInPlaceUIWindow, BOOL) HRESULT,
    EnableModeless: ?extern fn(?*IOleInPlaceActiveObject, BOOL) HRESULT,
};
pub const IOleInPlaceActiveObject = extern struct {
    lpVtbl: ?*IOleInPlaceActiveObjectVtbl,
};
pub const IOleInPlaceUIWindowVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleInPlaceUIWindow, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleInPlaceUIWindow) ULONG,
    Release: ?extern fn(?*IOleInPlaceUIWindow) ULONG,
    GetWindow: ?extern fn(?*IOleInPlaceUIWindow, ?*HWND) HRESULT,
    ContextSensitiveHelp: ?extern fn(?*IOleInPlaceUIWindow, BOOL) HRESULT,
    GetBorder: ?extern fn(?*IOleInPlaceUIWindow, LPRECT) HRESULT,
    RequestBorderSpace: ?extern fn(?*IOleInPlaceUIWindow, LPCBORDERWIDTHS) HRESULT,
    SetBorderSpace: ?extern fn(?*IOleInPlaceUIWindow, LPCBORDERWIDTHS) HRESULT,
    SetActiveObject: ?extern fn(?*IOleInPlaceUIWindow, ?*IOleInPlaceActiveObject, LPCOLESTR) HRESULT,
};
pub const IOleInPlaceUIWindow = extern struct {
    lpVtbl: ?*IOleInPlaceUIWindowVtbl,
};

pub const OleMenuGroupWidths = extern struct {
    width: [6]LONG,
};
pub const LPOLEMENUGROUPWIDTHS = ?*OleMenuGroupWidths;
pub const HOLEMENU = HGLOBAL;
pub const IOleInPlaceFrameVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleInPlaceFrame, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleInPlaceFrame) ULONG,
    Release: ?extern fn(?*IOleInPlaceFrame) ULONG,
    GetWindow: ?extern fn(?*IOleInPlaceFrame, ?*HWND) HRESULT,
    ContextSensitiveHelp: ?extern fn(?*IOleInPlaceFrame, BOOL) HRESULT,
    GetBorder: ?extern fn(?*IOleInPlaceFrame, LPRECT) HRESULT,
    RequestBorderSpace: ?extern fn(?*IOleInPlaceFrame, LPCBORDERWIDTHS) HRESULT,
    SetBorderSpace: ?extern fn(?*IOleInPlaceFrame, LPCBORDERWIDTHS) HRESULT,
    SetActiveObject: ?extern fn(?*IOleInPlaceFrame, ?*IOleInPlaceActiveObject, LPCOLESTR) HRESULT,
    InsertMenus: ?extern fn(?*IOleInPlaceFrame, HMENU, LPOLEMENUGROUPWIDTHS) HRESULT,
    SetMenu: ?extern fn(?*IOleInPlaceFrame, HMENU, HOLEMENU, HWND) HRESULT,
    RemoveMenus: ?extern fn(?*IOleInPlaceFrame, HMENU) HRESULT,
    SetStatusText: ?extern fn(?*IOleInPlaceFrame, LPCOLESTR) HRESULT,
    EnableModeless: ?extern fn(?*IOleInPlaceFrame, BOOL) HRESULT,
    TranslateAcceleratorA: ?extern fn(?*IOleInPlaceFrame, LPMSG, WORD) HRESULT,
};
pub const IOleInPlaceFrame = extern struct {
    lpVtbl: ?*IOleInPlaceFrameVtbl,
};

pub const IOleInPlaceObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleInPlaceObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleInPlaceObject) ULONG,
    Release: ?extern fn(?*IOleInPlaceObject) ULONG,
    GetWindow: ?extern fn(?*IOleInPlaceObject, ?*HWND) HRESULT,
    ContextSensitiveHelp: ?extern fn(?*IOleInPlaceObject, BOOL) HRESULT,
    InPlaceDeactivate: ?extern fn(?*IOleInPlaceObject) HRESULT,
    UIDeactivate: ?extern fn(?*IOleInPlaceObject) HRESULT,
    SetObjectRects: ?extern fn(?*IOleInPlaceObject, LPCRECT, LPCRECT) HRESULT,
    ReactivateAndUndo: ?extern fn(?*IOleInPlaceObject) HRESULT,
};
pub const IOleInPlaceObject = extern struct {
    lpVtbl: ?*IOleInPlaceObjectVtbl,
};

pub const OIFI = extern struct {
    cb: UINT,
    fMDIApp: BOOL,
    hwndFrame: HWND,
    haccel: HACCEL,
    cAccelEntries: UINT,
};
pub const LPOLEINPLACEFRAMEINFO = ?*OIFI;
pub const IOleInPlaceSiteVtbl = extern struct {
    QueryInterface: ?extern fn(?*IOleInPlaceSite, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IOleInPlaceSite) ULONG,
    Release: ?extern fn(?*IOleInPlaceSite) ULONG,
    GetWindow: ?extern fn(?*IOleInPlaceSite, ?*HWND) HRESULT,
    ContextSensitiveHelp: ?extern fn(?*IOleInPlaceSite, BOOL) HRESULT,
    CanInPlaceActivate: ?extern fn(?*IOleInPlaceSite) HRESULT,
    OnInPlaceActivate: ?extern fn(?*IOleInPlaceSite) HRESULT,
    OnUIActivate: ?extern fn(?*IOleInPlaceSite) HRESULT,
    GetWindowContext: ?extern fn(?*IOleInPlaceSite, ?*(?*IOleInPlaceFrame), ?*(?*IOleInPlaceUIWindow), LPRECT, LPRECT, LPOLEINPLACEFRAMEINFO) HRESULT,
    Scroll: ?extern fn(?*IOleInPlaceSite, SIZE) HRESULT,
    OnUIDeactivate: ?extern fn(?*IOleInPlaceSite, BOOL) HRESULT,
    OnInPlaceDeactivate: ?extern fn(?*IOleInPlaceSite) HRESULT,
    DiscardUndoState: ?extern fn(?*IOleInPlaceSite) HRESULT,
    DeactivateAndUndo: ?extern fn(?*IOleInPlaceSite) HRESULT,
    OnPosRectChange: ?extern fn(?*IOleInPlaceSite, LPCRECT) HRESULT,
};
pub const IOleInPlaceSite = extern struct {
    lpVtbl: ?*IOleInPlaceSiteVtbl,
};

pub const IContinueVtbl = extern struct {
    QueryInterface: ?extern fn(?*IContinue, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IContinue) ULONG,
    Release: ?extern fn(?*IContinue) ULONG,
    FContinue: ?extern fn(?*IContinue) HRESULT,
};
pub const IContinue = extern struct {
    lpVtbl: ?*IContinueVtbl,
};

pub const IViewObjectVtbl = extern struct {
    QueryInterface: ?extern fn(?*IViewObject, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IViewObject) ULONG,
    Release: ?extern fn(?*IViewObject) ULONG,
    Draw: ?extern fn(?*IViewObject, DWORD, LONG, ?*c_void, ?*DVTARGETDEVICE, HDC, HDC, LPCRECTL, LPCRECTL, ?extern fn(ULONG_PTR) BOOL, ULONG_PTR) HRESULT,
    GetColorSet: ?extern fn(?*IViewObject, DWORD, LONG, ?*c_void, ?*DVTARGETDEVICE, HDC, ?*(?*LOGPALETTE)) HRESULT,
    Freeze: ?extern fn(?*IViewObject, DWORD, LONG, ?*c_void, ?*DWORD) HRESULT,
    Unfreeze: ?extern fn(?*IViewObject, DWORD) HRESULT,
    SetAdvise: ?extern fn(?*IViewObject, DWORD, DWORD, ?*IAdviseSink) HRESULT,
    GetAdvise: ?extern fn(?*IViewObject, ?*DWORD, ?*DWORD, ?*(?*IAdviseSink)) HRESULT,
};
pub const IViewObject = extern struct {
    lpVtbl: ?*IViewObjectVtbl,
};

pub const IViewObject2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IViewObject2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IViewObject2) ULONG,
    Release: ?extern fn(?*IViewObject2) ULONG,
    Draw: ?extern fn(?*IViewObject2, DWORD, LONG, ?*c_void, ?*DVTARGETDEVICE, HDC, HDC, LPCRECTL, LPCRECTL, ?extern fn(ULONG_PTR) BOOL, ULONG_PTR) HRESULT,
    GetColorSet: ?extern fn(?*IViewObject2, DWORD, LONG, ?*c_void, ?*DVTARGETDEVICE, HDC, ?*(?*LOGPALETTE)) HRESULT,
    Freeze: ?extern fn(?*IViewObject2, DWORD, LONG, ?*c_void, ?*DWORD) HRESULT,
    Unfreeze: ?extern fn(?*IViewObject2, DWORD) HRESULT,
    SetAdvise: ?extern fn(?*IViewObject2, DWORD, DWORD, ?*IAdviseSink) HRESULT,
    GetAdvise: ?extern fn(?*IViewObject2, ?*DWORD, ?*DWORD, ?*(?*IAdviseSink)) HRESULT,
    GetExtent: ?extern fn(?*IViewObject2, DWORD, LONG, ?*DVTARGETDEVICE, LPSIZEL) HRESULT,
};
pub const IViewObject2 = extern struct {
    lpVtbl: ?*IViewObject2Vtbl,
};

pub const IDropSourceVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDropSource, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDropSource) ULONG,
    Release: ?extern fn(?*IDropSource) ULONG,
    QueryContinueDrag: ?extern fn(?*IDropSource, BOOL, DWORD) HRESULT,
    GiveFeedback: ?extern fn(?*IDropSource, DWORD) HRESULT,
};
pub const IDropSource = extern struct {
    lpVtbl: ?*IDropSourceVtbl,
};

pub const IDropTargetVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDropTarget, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDropTarget) ULONG,
    Release: ?extern fn(?*IDropTarget) ULONG,
    DragEnter: ?extern fn(?*IDropTarget, ?*IDataObject, DWORD, POINTL, ?*DWORD) HRESULT,
    DragOver: ?extern fn(?*IDropTarget, DWORD, POINTL, ?*DWORD) HRESULT,
    DragLeave: ?extern fn(?*IDropTarget) HRESULT,
    Drop: ?extern fn(?*IDropTarget, ?*IDataObject, DWORD, POINTL, ?*DWORD) HRESULT,
};
pub const IDropTarget = extern struct {
    lpVtbl: ?*IDropTargetVtbl,
};

pub const IDropSourceNotifyVtbl = extern struct {
    QueryInterface: ?extern fn(?*IDropSourceNotify, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IDropSourceNotify) ULONG,
    Release: ?extern fn(?*IDropSourceNotify) ULONG,
    DragEnterTarget: ?extern fn(?*IDropSourceNotify, HWND) HRESULT,
    DragLeaveTarget: ?extern fn(?*IDropSourceNotify) HRESULT,
};
pub const IDropSourceNotify = extern struct {
    lpVtbl: ?*IDropSourceNotifyVtbl,
};

pub const IEnterpriseDropTargetVtbl = extern struct {
    QueryInterface: ?extern fn(?*IEnterpriseDropTarget, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IEnterpriseDropTarget) ULONG,
    Release: ?extern fn(?*IEnterpriseDropTarget) ULONG,
    SetDropSourceEnterpriseId: ?extern fn(?*IEnterpriseDropTarget, LPCWSTR) HRESULT,
    IsEvaluatingEdpPolicy: ?extern fn(?*IEnterpriseDropTarget, ?*BOOL) HRESULT,
};
pub const IEnterpriseDropTarget = extern struct {
    lpVtbl: ?*IEnterpriseDropTargetVtbl,
};
pub const LPOLEADVISEHOLDER = ?*IOleAdviseHolder;

pub const LPOLECACHE = ?*IOleCache;

pub const LPOLECACHE2 = ?*IOleCache2;
pub const DISCARDCACHE = c_int;


pub const LPOLECACHECONTROL = ?*IOleCacheControl;

pub const LPPARSEDISPLAYNAME = ?*IParseDisplayName;

pub const LPOLECONTAINER = ?*IOleContainer;

pub const LPOLECLIENTSITE = ?*IOleClientSite;

pub const LPOLEOBJECT = ?*IOleObject;
pub const OLEGETMONIKER = c_int;

pub const OLEWHICHMK = c_int;

pub const USERCLASSTYPE = c_int;

pub const OLEMISC = c_int;

pub const OLECLOSE = c_int;


pub const OLERENDER = c_int;

pub const LPOLERENDER = ?*OLERENDER;
pub const OBJECTDESCRIPTOR = extern struct {
    cbSize: ULONG,
    clsid: CLSID,
    dwDrawAspect: DWORD,
    sizel: SIZEL,
    pointl: POINTL,
    dwStatus: DWORD,
    dwFullUserTypeName: DWORD,
    dwSrcOfCopy: DWORD,
};

pub const POBJECTDESCRIPTOR = ?*OBJECTDESCRIPTOR;
pub const LPOBJECTDESCRIPTOR = ?*OBJECTDESCRIPTOR;
pub const LINKSRCDESCRIPTOR = OBJECTDESCRIPTOR;
pub const PLINKSRCDESCRIPTOR = ?*OBJECTDESCRIPTOR;
pub const LPLINKSRCDESCRIPTOR = ?*OBJECTDESCRIPTOR;
pub const LPOLEWINDOW = ?*IOleWindow;

pub const LPOLELINK = ?*IOleLink;
pub const OLEUPDATE = c_int;

pub const LPOLEUPDATE = ?*OLEUPDATE;
pub const POLEUPDATE = ?*OLEUPDATE;
pub const OLELINKBIND = c_int;


pub const LPOLEITEMCONTAINER = ?*IOleItemContainer;
pub const BINDSPEED = c_int;

pub const OLECONTF = c_int;


pub const LPOLEINPLACEUIWINDOW = ?*IOleInPlaceUIWindow;
pub const BORDERWIDTHS = RECT;
pub const LPBORDERWIDTHS = LPRECT;

pub const LPOLEINPLACEACTIVEOBJECT = ?*IOleInPlaceActiveObject;

pub const LPOLEINPLACEFRAME = ?*IOleInPlaceFrame;
pub const OLEINPLACEFRAMEINFO = OIFI;
pub const OLEMENUGROUPWIDTHS = OleMenuGroupWidths;

pub const LPOLEINPLACEOBJECT = ?*IOleInPlaceObject;

pub const LPOLEINPLACESITE = ?*IOleInPlaceSite;


pub const LPVIEWOBJECT = ?*IViewObject;

pub const LPVIEWOBJECT2 = ?*IViewObject2;

pub const LPDROPSOURCE = ?*IDropSource;

pub const LPDROPTARGET = ?*IDropTarget;



pub const LPENUMOLEVERB = ?*IEnumOLEVERB;

pub const OLEVERBATTRIB = c_int;



pub const IServiceProviderVtbl = extern struct {
    QueryInterface: ?extern fn(?*IServiceProvider, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IServiceProvider) ULONG,
    Release: ?extern fn(?*IServiceProvider) ULONG,
    QueryService: ?extern fn(?*IServiceProvider, ?*const GUID, ?*const IID, ?*(?*c_void)) HRESULT,
};
pub const IServiceProvider = extern struct {
    lpVtbl: ?*IServiceProviderVtbl,
};
pub const LPSERVICEPROVIDER = ?*IServiceProvider;


pub const IXMLDOMImplementationVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMImplementation, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMImplementation) ULONG,
    Release: ?extern fn(?*IXMLDOMImplementation) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMImplementation, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMImplementation, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMImplementation, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMImplementation, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    hasFeature: ?extern fn(?*IXMLDOMImplementation, BSTR, BSTR, ?*VARIANT_BOOL) HRESULT,
};
pub const IXMLDOMImplementation = extern struct {
    lpVtbl: ?*IXMLDOMImplementationVtbl,
};

pub const DOMNodeType = c_int;


pub const IXMLDOMNodeListVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMNodeList, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMNodeList) ULONG,
    Release: ?extern fn(?*IXMLDOMNodeList) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMNodeList, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMNodeList, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMNodeList, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMNodeList, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_item: ?extern fn(?*IXMLDOMNodeList, c_long, ?*(?*IXMLDOMNode)) HRESULT,
    get_length: ?extern fn(?*IXMLDOMNodeList, ?*c_long) HRESULT,
    nextNode: ?extern fn(?*IXMLDOMNodeList, ?*(?*IXMLDOMNode)) HRESULT,
    reset: ?extern fn(?*IXMLDOMNodeList) HRESULT,
    get__newEnum: ?extern fn(?*IXMLDOMNodeList, ?*(?*IUnknown)) HRESULT,
};
pub const IXMLDOMNodeList = extern struct {
    lpVtbl: ?*IXMLDOMNodeListVtbl,
};

pub const IXMLDOMNamedNodeMapVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMNamedNodeMap, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMNamedNodeMap) ULONG,
    Release: ?extern fn(?*IXMLDOMNamedNodeMap) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMNamedNodeMap, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMNamedNodeMap, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMNamedNodeMap, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMNamedNodeMap, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    getNamedItem: ?extern fn(?*IXMLDOMNamedNodeMap, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    setNamedItem: ?extern fn(?*IXMLDOMNamedNodeMap, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeNamedItem: ?extern fn(?*IXMLDOMNamedNodeMap, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_item: ?extern fn(?*IXMLDOMNamedNodeMap, c_long, ?*(?*IXMLDOMNode)) HRESULT,
    get_length: ?extern fn(?*IXMLDOMNamedNodeMap, ?*c_long) HRESULT,
    getQualifiedItem: ?extern fn(?*IXMLDOMNamedNodeMap, BSTR, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    removeQualifiedItem: ?extern fn(?*IXMLDOMNamedNodeMap, BSTR, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    nextNode: ?extern fn(?*IXMLDOMNamedNodeMap, ?*(?*IXMLDOMNode)) HRESULT,
    reset: ?extern fn(?*IXMLDOMNamedNodeMap) HRESULT,
    get__newEnum: ?extern fn(?*IXMLDOMNamedNodeMap, ?*(?*IUnknown)) HRESULT,
};
pub const IXMLDOMNamedNodeMap = extern struct {
    lpVtbl: ?*IXMLDOMNamedNodeMapVtbl,
};


pub const IXMLDOMDocumentTypeVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMDocumentType, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMDocumentType) ULONG,
    Release: ?extern fn(?*IXMLDOMDocumentType) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMDocumentType, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMDocumentType, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMDocumentType, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMDocumentType, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMDocumentType, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMDocumentType, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMDocumentType, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMDocumentType, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMDocumentType, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMDocumentType, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMDocumentType, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMDocumentType, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMDocumentType, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMDocumentType, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMDocumentType, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMDocumentType, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMDocumentType, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMDocumentType, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMDocumentType, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMDocumentType, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMDocumentType, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMDocumentType, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMDocumentType, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMDocumentType, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_name: ?extern fn(?*IXMLDOMDocumentType, ?*BSTR) HRESULT,
    get_entities: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    get_notations: ?extern fn(?*IXMLDOMDocumentType, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
};
pub const IXMLDOMDocumentType = extern struct {
    lpVtbl: ?*IXMLDOMDocumentTypeVtbl,
};


pub const IXMLDOMAttributeVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMAttribute, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMAttribute) ULONG,
    Release: ?extern fn(?*IXMLDOMAttribute) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMAttribute, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMAttribute, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMAttribute, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMAttribute, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMAttribute, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMAttribute, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMAttribute, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMAttribute, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMAttribute, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMAttribute, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMAttribute, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMAttribute, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMAttribute, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMAttribute, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMAttribute, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMAttribute, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMAttribute, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMAttribute, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMAttribute, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_name: ?extern fn(?*IXMLDOMAttribute, ?*BSTR) HRESULT,
    get_value: ?extern fn(?*IXMLDOMAttribute, ?*VARIANT) HRESULT,
    put_value: ?extern fn(?*IXMLDOMAttribute, VARIANT) HRESULT,
};
pub const IXMLDOMAttribute = extern struct {
    lpVtbl: ?*IXMLDOMAttributeVtbl,
};
pub const IXMLDOMElementVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMElement, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMElement) ULONG,
    Release: ?extern fn(?*IXMLDOMElement) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMElement, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMElement, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMElement, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMElement, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMElement, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMElement, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMElement, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMElement, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMElement, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMElement, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMElement, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMElement, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMElement, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMElement, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMElement, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMElement, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMElement, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMElement, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMElement, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_tagName: ?extern fn(?*IXMLDOMElement, ?*BSTR) HRESULT,
    getAttribute: ?extern fn(?*IXMLDOMElement, BSTR, ?*VARIANT) HRESULT,
    setAttribute: ?extern fn(?*IXMLDOMElement, BSTR, VARIANT) HRESULT,
    removeAttribute: ?extern fn(?*IXMLDOMElement, BSTR) HRESULT,
    getAttributeNode: ?extern fn(?*IXMLDOMElement, BSTR, ?*(?*IXMLDOMAttribute)) HRESULT,
    setAttributeNode: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMAttribute, ?*(?*IXMLDOMAttribute)) HRESULT,
    removeAttributeNode: ?extern fn(?*IXMLDOMElement, ?*IXMLDOMAttribute, ?*(?*IXMLDOMAttribute)) HRESULT,
    getElementsByTagName: ?extern fn(?*IXMLDOMElement, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    normalize: ?extern fn(?*IXMLDOMElement) HRESULT,
};
pub const IXMLDOMElement = extern struct {
    lpVtbl: ?*IXMLDOMElementVtbl,
};

pub const IXMLDOMDocumentFragmentVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMDocumentFragment, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMDocumentFragment) ULONG,
    Release: ?extern fn(?*IXMLDOMDocumentFragment) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMDocumentFragment, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMDocumentFragment, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMDocumentFragment, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMDocumentFragment, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMDocumentFragment, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMDocumentFragment, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMDocumentFragment, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMDocumentFragment, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMDocumentFragment, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMDocumentFragment, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMDocumentFragment, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMDocumentFragment, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMDocumentFragment, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMDocumentFragment, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMDocumentFragment, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMDocumentFragment, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMDocumentFragment, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMDocumentFragment, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMDocumentFragment, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMDocumentFragment, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMDocumentFragment, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMDocumentFragment, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMDocumentFragment, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMDocumentFragment, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMDocumentFragment, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMDocumentFragment, ?*IXMLDOMNode, VARIANT) HRESULT,
};
pub const IXMLDOMDocumentFragment = extern struct {
    lpVtbl: ?*IXMLDOMDocumentFragmentVtbl,
};

pub const IXMLDOMTextVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMText, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMText) ULONG,
    Release: ?extern fn(?*IXMLDOMText) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMText, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMText, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMText, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMText, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMText, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMText, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMText, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMText, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMText, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMText, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMText, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMText, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMText, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMText, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMText, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMText, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMText, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMText, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMText, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMText, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMText, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMText, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMText, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMText, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMText, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_data: ?extern fn(?*IXMLDOMText, ?*BSTR) HRESULT,
    put_data: ?extern fn(?*IXMLDOMText, BSTR) HRESULT,
    get_length: ?extern fn(?*IXMLDOMText, ?*c_long) HRESULT,
    substringData: ?extern fn(?*IXMLDOMText, c_long, c_long, ?*BSTR) HRESULT,
    appendData: ?extern fn(?*IXMLDOMText, BSTR) HRESULT,
    insertData: ?extern fn(?*IXMLDOMText, c_long, BSTR) HRESULT,
    deleteData: ?extern fn(?*IXMLDOMText, c_long, c_long) HRESULT,
    replaceData: ?extern fn(?*IXMLDOMText, c_long, c_long, BSTR) HRESULT,
    splitText: ?extern fn(?*IXMLDOMText, c_long, ?*(?*IXMLDOMText)) HRESULT,
};
pub const IXMLDOMText = extern struct {
    lpVtbl: ?*IXMLDOMTextVtbl,
};

pub const IXMLDOMCommentVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMComment, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMComment) ULONG,
    Release: ?extern fn(?*IXMLDOMComment) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMComment, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMComment, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMComment, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMComment, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMComment, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMComment, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMComment, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMComment, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMComment, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMComment, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMComment, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMComment, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMComment, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMComment, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMComment, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMComment, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMComment, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMComment, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMComment, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMComment, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMComment, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMComment, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMComment, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMComment, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMComment, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_data: ?extern fn(?*IXMLDOMComment, ?*BSTR) HRESULT,
    put_data: ?extern fn(?*IXMLDOMComment, BSTR) HRESULT,
    get_length: ?extern fn(?*IXMLDOMComment, ?*c_long) HRESULT,
    substringData: ?extern fn(?*IXMLDOMComment, c_long, c_long, ?*BSTR) HRESULT,
    appendData: ?extern fn(?*IXMLDOMComment, BSTR) HRESULT,
    insertData: ?extern fn(?*IXMLDOMComment, c_long, BSTR) HRESULT,
    deleteData: ?extern fn(?*IXMLDOMComment, c_long, c_long) HRESULT,
    replaceData: ?extern fn(?*IXMLDOMComment, c_long, c_long, BSTR) HRESULT,
};
pub const IXMLDOMComment = extern struct {
    lpVtbl: ?*IXMLDOMCommentVtbl,
};

pub const IXMLDOMCDATASectionVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMCDATASection, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMCDATASection) ULONG,
    Release: ?extern fn(?*IXMLDOMCDATASection) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMCDATASection, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMCDATASection, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMCDATASection, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMCDATASection, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMCDATASection, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMCDATASection, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMCDATASection, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMCDATASection, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMCDATASection, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMCDATASection, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMCDATASection, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMCDATASection, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMCDATASection, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMCDATASection, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMCDATASection, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMCDATASection, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMCDATASection, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMCDATASection, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMCDATASection, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMCDATASection, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMCDATASection, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMCDATASection, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMCDATASection, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMCDATASection, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMCDATASection, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_data: ?extern fn(?*IXMLDOMCDATASection, ?*BSTR) HRESULT,
    put_data: ?extern fn(?*IXMLDOMCDATASection, BSTR) HRESULT,
    get_length: ?extern fn(?*IXMLDOMCDATASection, ?*c_long) HRESULT,
    substringData: ?extern fn(?*IXMLDOMCDATASection, c_long, c_long, ?*BSTR) HRESULT,
    appendData: ?extern fn(?*IXMLDOMCDATASection, BSTR) HRESULT,
    insertData: ?extern fn(?*IXMLDOMCDATASection, c_long, BSTR) HRESULT,
    deleteData: ?extern fn(?*IXMLDOMCDATASection, c_long, c_long) HRESULT,
    replaceData: ?extern fn(?*IXMLDOMCDATASection, c_long, c_long, BSTR) HRESULT,
    splitText: ?extern fn(?*IXMLDOMCDATASection, c_long, ?*(?*IXMLDOMText)) HRESULT,
};
pub const IXMLDOMCDATASection = extern struct {
    lpVtbl: ?*IXMLDOMCDATASectionVtbl,
};

pub const IXMLDOMProcessingInstructionVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMProcessingInstruction, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMProcessingInstruction) ULONG,
    Release: ?extern fn(?*IXMLDOMProcessingInstruction) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMProcessingInstruction, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMProcessingInstruction, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMProcessingInstruction, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMProcessingInstruction, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMProcessingInstruction, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMProcessingInstruction, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMProcessingInstruction, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMProcessingInstruction, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMProcessingInstruction, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMProcessingInstruction, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMProcessingInstruction, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMProcessingInstruction, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMProcessingInstruction, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMProcessingInstruction, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMProcessingInstruction, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMProcessingInstruction, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMProcessingInstruction, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMProcessingInstruction, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMProcessingInstruction, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMProcessingInstruction, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMProcessingInstruction, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMProcessingInstruction, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMProcessingInstruction, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMProcessingInstruction, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMProcessingInstruction, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_target: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    get_data: ?extern fn(?*IXMLDOMProcessingInstruction, ?*BSTR) HRESULT,
    put_data: ?extern fn(?*IXMLDOMProcessingInstruction, BSTR) HRESULT,
};
pub const IXMLDOMProcessingInstruction = extern struct {
    lpVtbl: ?*IXMLDOMProcessingInstructionVtbl,
};

pub const IXMLDOMEntityReferenceVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMEntityReference, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMEntityReference) ULONG,
    Release: ?extern fn(?*IXMLDOMEntityReference) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMEntityReference, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMEntityReference, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMEntityReference, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMEntityReference, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMEntityReference, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMEntityReference, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMEntityReference, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMEntityReference, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMEntityReference, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMEntityReference, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMEntityReference, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMEntityReference, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMEntityReference, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMEntityReference, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMEntityReference, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMEntityReference, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMEntityReference, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMEntityReference, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMEntityReference, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMEntityReference, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMEntityReference, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMEntityReference, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMEntityReference, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMEntityReference, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMEntityReference, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMEntityReference, ?*IXMLDOMNode, VARIANT) HRESULT,
};
pub const IXMLDOMEntityReference = extern struct {
    lpVtbl: ?*IXMLDOMEntityReferenceVtbl,
};

pub const IXMLDOMParseErrorVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMParseError, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMParseError) ULONG,
    Release: ?extern fn(?*IXMLDOMParseError) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMParseError, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMParseError, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMParseError, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMParseError, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_errorCode: ?extern fn(?*IXMLDOMParseError, ?*c_long) HRESULT,
    get_url: ?extern fn(?*IXMLDOMParseError, ?*BSTR) HRESULT,
    get_reason: ?extern fn(?*IXMLDOMParseError, ?*BSTR) HRESULT,
    get_srcText: ?extern fn(?*IXMLDOMParseError, ?*BSTR) HRESULT,
    get_line: ?extern fn(?*IXMLDOMParseError, ?*c_long) HRESULT,
    get_linepos: ?extern fn(?*IXMLDOMParseError, ?*c_long) HRESULT,
    get_filepos: ?extern fn(?*IXMLDOMParseError, ?*c_long) HRESULT,
};
pub const IXMLDOMParseError = extern struct {
    lpVtbl: ?*IXMLDOMParseErrorVtbl,
};
pub const IXMLDOMDocumentVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMDocument, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMDocument) ULONG,
    Release: ?extern fn(?*IXMLDOMDocument) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMDocument, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMDocument, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMDocument, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMDocument, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMDocument, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMDocument, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMDocument, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMDocument, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMDocument, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMDocument, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMDocument, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMDocument, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMDocument, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_doctype: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMDocumentType)) HRESULT,
    get_implementation: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMImplementation)) HRESULT,
    get_documentElement: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMElement)) HRESULT,
    putref_documentElement: ?extern fn(?*IXMLDOMDocument, ?*IXMLDOMElement) HRESULT,
    createElement: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMElement)) HRESULT,
    createDocumentFragment: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMDocumentFragment)) HRESULT,
    createTextNode: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMText)) HRESULT,
    createComment: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMComment)) HRESULT,
    createCDATASection: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMCDATASection)) HRESULT,
    createProcessingInstruction: ?extern fn(?*IXMLDOMDocument, BSTR, BSTR, ?*(?*IXMLDOMProcessingInstruction)) HRESULT,
    createAttribute: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMAttribute)) HRESULT,
    createEntityReference: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMEntityReference)) HRESULT,
    getElementsByTagName: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    createNode: ?extern fn(?*IXMLDOMDocument, VARIANT, BSTR, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    nodeFromID: ?extern fn(?*IXMLDOMDocument, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    load: ?extern fn(?*IXMLDOMDocument, VARIANT, ?*VARIANT_BOOL) HRESULT,
    get_readyState: ?extern fn(?*IXMLDOMDocument, ?*c_long) HRESULT,
    get_parseError: ?extern fn(?*IXMLDOMDocument, ?*(?*IXMLDOMParseError)) HRESULT,
    get_url: ?extern fn(?*IXMLDOMDocument, ?*BSTR) HRESULT,
    get_async: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    put_async: ?extern fn(?*IXMLDOMDocument, VARIANT_BOOL) HRESULT,
    abort: ?extern fn(?*IXMLDOMDocument) HRESULT,
    loadXML: ?extern fn(?*IXMLDOMDocument, BSTR, ?*VARIANT_BOOL) HRESULT,
    save: ?extern fn(?*IXMLDOMDocument, VARIANT) HRESULT,
    get_validateOnParse: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    put_validateOnParse: ?extern fn(?*IXMLDOMDocument, VARIANT_BOOL) HRESULT,
    get_resolveExternals: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    put_resolveExternals: ?extern fn(?*IXMLDOMDocument, VARIANT_BOOL) HRESULT,
    get_preserveWhiteSpace: ?extern fn(?*IXMLDOMDocument, ?*VARIANT_BOOL) HRESULT,
    put_preserveWhiteSpace: ?extern fn(?*IXMLDOMDocument, VARIANT_BOOL) HRESULT,
    put_onreadystatechange: ?extern fn(?*IXMLDOMDocument, VARIANT) HRESULT,
    put_ondataavailable: ?extern fn(?*IXMLDOMDocument, VARIANT) HRESULT,
    put_ontransformnode: ?extern fn(?*IXMLDOMDocument, VARIANT) HRESULT,
};
pub const IXMLDOMDocument = extern struct {
    lpVtbl: ?*IXMLDOMDocumentVtbl,
};
pub const IXMLDOMNodeVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMNode, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMNode) ULONG,
    Release: ?extern fn(?*IXMLDOMNode) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMNode, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMNode, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMNode, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMNode, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMNode, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMNode, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMNode, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMNode, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMNode, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMNode, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMNode, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMNode, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMNode, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMNode, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMNode, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMNode, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMNode, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMNode, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMNode, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMNode, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMNode, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMNode, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMNode, ?*IXMLDOMNode, VARIANT) HRESULT,
};
pub const IXMLDOMNode = extern struct {
    lpVtbl: ?*IXMLDOMNodeVtbl,
};

pub const IXMLDOMCharacterDataVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMCharacterData, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMCharacterData) ULONG,
    Release: ?extern fn(?*IXMLDOMCharacterData) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMCharacterData, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMCharacterData, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMCharacterData, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMCharacterData, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMCharacterData, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMCharacterData, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMCharacterData, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMCharacterData, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMCharacterData, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMCharacterData, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMCharacterData, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMCharacterData, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMCharacterData, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMCharacterData, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMCharacterData, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMCharacterData, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMCharacterData, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMCharacterData, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMCharacterData, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMCharacterData, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMCharacterData, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMCharacterData, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMCharacterData, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMCharacterData, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMCharacterData, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_data: ?extern fn(?*IXMLDOMCharacterData, ?*BSTR) HRESULT,
    put_data: ?extern fn(?*IXMLDOMCharacterData, BSTR) HRESULT,
    get_length: ?extern fn(?*IXMLDOMCharacterData, ?*c_long) HRESULT,
    substringData: ?extern fn(?*IXMLDOMCharacterData, c_long, c_long, ?*BSTR) HRESULT,
    appendData: ?extern fn(?*IXMLDOMCharacterData, BSTR) HRESULT,
    insertData: ?extern fn(?*IXMLDOMCharacterData, c_long, BSTR) HRESULT,
    deleteData: ?extern fn(?*IXMLDOMCharacterData, c_long, c_long) HRESULT,
    replaceData: ?extern fn(?*IXMLDOMCharacterData, c_long, c_long, BSTR) HRESULT,
};
pub const IXMLDOMCharacterData = extern struct {
    lpVtbl: ?*IXMLDOMCharacterDataVtbl,
};

pub const IXMLDOMNotationVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMNotation, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMNotation) ULONG,
    Release: ?extern fn(?*IXMLDOMNotation) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMNotation, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMNotation, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMNotation, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMNotation, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMNotation, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMNotation, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMNotation, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMNotation, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMNotation, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMNotation, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMNotation, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMNotation, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMNotation, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMNotation, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMNotation, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMNotation, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMNotation, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMNotation, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMNotation, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMNotation, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMNotation, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMNotation, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMNotation, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMNotation, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMNotation, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMNotation, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_publicId: ?extern fn(?*IXMLDOMNotation, ?*VARIANT) HRESULT,
    get_systemId: ?extern fn(?*IXMLDOMNotation, ?*VARIANT) HRESULT,
};
pub const IXMLDOMNotation = extern struct {
    lpVtbl: ?*IXMLDOMNotationVtbl,
};

pub const IXMLDOMEntityVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDOMEntity, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDOMEntity) ULONG,
    Release: ?extern fn(?*IXMLDOMEntity) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDOMEntity, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDOMEntity, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDOMEntity, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDOMEntity, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXMLDOMEntity, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXMLDOMEntity, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXMLDOMEntity, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXMLDOMEntity, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXMLDOMEntity, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXMLDOMEntity, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXMLDOMEntity, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXMLDOMEntity, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXMLDOMEntity, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLDOMEntity, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXMLDOMEntity, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXMLDOMEntity, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXMLDOMEntity, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXMLDOMEntity, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXMLDOMEntity, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXMLDOMEntity, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXMLDOMEntity, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXMLDOMEntity, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXMLDOMEntity, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXMLDOMEntity, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXMLDOMEntity, ?*IXMLDOMNode, VARIANT) HRESULT,
    get_publicId: ?extern fn(?*IXMLDOMEntity, ?*VARIANT) HRESULT,
    get_systemId: ?extern fn(?*IXMLDOMEntity, ?*VARIANT) HRESULT,
    get_notationName: ?extern fn(?*IXMLDOMEntity, ?*BSTR) HRESULT,
};
pub const IXMLDOMEntity = extern struct {
    lpVtbl: ?*IXMLDOMEntityVtbl,
};

pub const IXTLRuntimeVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXTLRuntime, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXTLRuntime) ULONG,
    Release: ?extern fn(?*IXTLRuntime) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXTLRuntime, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXTLRuntime, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXTLRuntime, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXTLRuntime, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_nodeName: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    get_nodeValue: ?extern fn(?*IXTLRuntime, ?*VARIANT) HRESULT,
    put_nodeValue: ?extern fn(?*IXTLRuntime, VARIANT) HRESULT,
    get_nodeType: ?extern fn(?*IXTLRuntime, ?*DOMNodeType) HRESULT,
    get_parentNode: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNode)) HRESULT,
    get_childNodes: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNodeList)) HRESULT,
    get_firstChild: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNode)) HRESULT,
    get_lastChild: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNode)) HRESULT,
    get_previousSibling: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNode)) HRESULT,
    get_nextSibling: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNode)) HRESULT,
    get_attributes: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNamedNodeMap)) HRESULT,
    insertBefore: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, VARIANT, ?*(?*IXMLDOMNode)) HRESULT,
    replaceChild: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    removeChild: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    appendChild: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*(?*IXMLDOMNode)) HRESULT,
    hasChildNodes: ?extern fn(?*IXTLRuntime, ?*VARIANT_BOOL) HRESULT,
    get_ownerDocument: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMDocument)) HRESULT,
    cloneNode: ?extern fn(?*IXTLRuntime, VARIANT_BOOL, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypeString: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    get_text: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXTLRuntime, BSTR) HRESULT,
    get_specified: ?extern fn(?*IXTLRuntime, ?*VARIANT_BOOL) HRESULT,
    get_definition: ?extern fn(?*IXTLRuntime, ?*(?*IXMLDOMNode)) HRESULT,
    get_nodeTypedValue: ?extern fn(?*IXTLRuntime, ?*VARIANT) HRESULT,
    put_nodeTypedValue: ?extern fn(?*IXTLRuntime, VARIANT) HRESULT,
    get_dataType: ?extern fn(?*IXTLRuntime, ?*VARIANT) HRESULT,
    put_dataType: ?extern fn(?*IXTLRuntime, BSTR) HRESULT,
    get_xml: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    transformNode: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*BSTR) HRESULT,
    selectNodes: ?extern fn(?*IXTLRuntime, BSTR, ?*(?*IXMLDOMNodeList)) HRESULT,
    selectSingleNode: ?extern fn(?*IXTLRuntime, BSTR, ?*(?*IXMLDOMNode)) HRESULT,
    get_parsed: ?extern fn(?*IXTLRuntime, ?*VARIANT_BOOL) HRESULT,
    get_namespaceURI: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    get_prefix: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    get_baseName: ?extern fn(?*IXTLRuntime, ?*BSTR) HRESULT,
    transformNodeToObject: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, VARIANT) HRESULT,
    uniqueID: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*c_long) HRESULT,
    depth: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*c_long) HRESULT,
    childNumber: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*c_long) HRESULT,
    ancestorChildNumber: ?extern fn(?*IXTLRuntime, BSTR, ?*IXMLDOMNode, ?*c_long) HRESULT,
    absoluteChildNumber: ?extern fn(?*IXTLRuntime, ?*IXMLDOMNode, ?*c_long) HRESULT,
    formatIndex: ?extern fn(?*IXTLRuntime, c_long, BSTR, ?*BSTR) HRESULT,
    formatNumber: ?extern fn(?*IXTLRuntime, f64, BSTR, ?*BSTR) HRESULT,
    formatDate: ?extern fn(?*IXTLRuntime, VARIANT, BSTR, VARIANT, ?*BSTR) HRESULT,
    formatTime: ?extern fn(?*IXTLRuntime, VARIANT, BSTR, VARIANT, ?*BSTR) HRESULT,
};
pub const IXTLRuntime = extern struct {
    lpVtbl: ?*IXTLRuntimeVtbl,
};

pub const XMLDOMDocumentEventsVtbl = extern struct {
    QueryInterface: ?extern fn(?*XMLDOMDocumentEvents, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*XMLDOMDocumentEvents) ULONG,
    Release: ?extern fn(?*XMLDOMDocumentEvents) ULONG,
    GetTypeInfoCount: ?extern fn(?*XMLDOMDocumentEvents, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*XMLDOMDocumentEvents, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*XMLDOMDocumentEvents, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*XMLDOMDocumentEvents, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
};
pub const XMLDOMDocumentEvents = extern struct {
    lpVtbl: ?*XMLDOMDocumentEventsVtbl,
};
pub const DOMDocument = @OpaqueType();

pub const DOMFreeThreadedDocument = @OpaqueType();


pub const IXMLHttpRequestVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLHttpRequest, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLHttpRequest) ULONG,
    Release: ?extern fn(?*IXMLHttpRequest) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLHttpRequest, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLHttpRequest, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLHttpRequest, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLHttpRequest, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    open: ?extern fn(?*IXMLHttpRequest, BSTR, BSTR, VARIANT, VARIANT, VARIANT) HRESULT,
    setRequestHeader: ?extern fn(?*IXMLHttpRequest, BSTR, BSTR) HRESULT,
    getResponseHeader: ?extern fn(?*IXMLHttpRequest, BSTR, ?*BSTR) HRESULT,
    getAllResponseHeaders: ?extern fn(?*IXMLHttpRequest, ?*BSTR) HRESULT,
    send: ?extern fn(?*IXMLHttpRequest, VARIANT) HRESULT,
    abort: ?extern fn(?*IXMLHttpRequest) HRESULT,
    get_status: ?extern fn(?*IXMLHttpRequest, ?*c_long) HRESULT,
    get_statusText: ?extern fn(?*IXMLHttpRequest, ?*BSTR) HRESULT,
    get_responseXML: ?extern fn(?*IXMLHttpRequest, ?*(?*IDispatch)) HRESULT,
    get_responseText: ?extern fn(?*IXMLHttpRequest, ?*BSTR) HRESULT,
    get_responseBody: ?extern fn(?*IXMLHttpRequest, ?*VARIANT) HRESULT,
    get_responseStream: ?extern fn(?*IXMLHttpRequest, ?*VARIANT) HRESULT,
    get_readyState: ?extern fn(?*IXMLHttpRequest, ?*c_long) HRESULT,
    put_onreadystatechange: ?extern fn(?*IXMLHttpRequest, ?*IDispatch) HRESULT,
};
pub const IXMLHttpRequest = extern struct {
    lpVtbl: ?*IXMLHttpRequestVtbl,
};
pub const XMLHTTPRequest = @OpaqueType();


pub const IXMLDSOControlVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDSOControl, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDSOControl) ULONG,
    Release: ?extern fn(?*IXMLDSOControl) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDSOControl, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDSOControl, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDSOControl, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDSOControl, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_XMLDocument: ?extern fn(?*IXMLDSOControl, ?*(?*IXMLDOMDocument)) HRESULT,
    put_XMLDocument: ?extern fn(?*IXMLDSOControl, ?*IXMLDOMDocument) HRESULT,
    get_JavaDSOCompatible: ?extern fn(?*IXMLDSOControl, ?*BOOL) HRESULT,
    put_JavaDSOCompatible: ?extern fn(?*IXMLDSOControl, BOOL) HRESULT,
    get_readyState: ?extern fn(?*IXMLDSOControl, ?*c_long) HRESULT,
};
pub const IXMLDSOControl = extern struct {
    lpVtbl: ?*IXMLDSOControlVtbl,
};
pub const XMLDSOControl = @OpaqueType();


pub const IXMLDocumentVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDocument, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDocument) ULONG,
    Release: ?extern fn(?*IXMLDocument) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDocument, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDocument, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDocument, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDocument, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_root: ?extern fn(?*IXMLDocument, ?*(?*IXMLElement)) HRESULT,
    get_fileSize: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    get_fileModifiedDate: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    get_fileUpdatedDate: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    get_URL: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    put_URL: ?extern fn(?*IXMLDocument, BSTR) HRESULT,
    get_mimeType: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    get_readyState: ?extern fn(?*IXMLDocument, ?*c_long) HRESULT,
    get_charset: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    put_charset: ?extern fn(?*IXMLDocument, BSTR) HRESULT,
    get_version: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    get_doctype: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    get_dtdURL: ?extern fn(?*IXMLDocument, ?*BSTR) HRESULT,
    createElement: ?extern fn(?*IXMLDocument, VARIANT, VARIANT, ?*(?*IXMLElement)) HRESULT,
};
pub const IXMLDocument = extern struct {
    lpVtbl: ?*IXMLDocumentVtbl,
};


pub const IXMLElement2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLElement2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLElement2) ULONG,
    Release: ?extern fn(?*IXMLElement2) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLElement2, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLElement2, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLElement2, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLElement2, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_tagName: ?extern fn(?*IXMLElement2, ?*BSTR) HRESULT,
    put_tagName: ?extern fn(?*IXMLElement2, BSTR) HRESULT,
    get_parent: ?extern fn(?*IXMLElement2, ?*(?*IXMLElement2)) HRESULT,
    setAttribute: ?extern fn(?*IXMLElement2, BSTR, VARIANT) HRESULT,
    getAttribute: ?extern fn(?*IXMLElement2, BSTR, ?*VARIANT) HRESULT,
    removeAttribute: ?extern fn(?*IXMLElement2, BSTR) HRESULT,
    get_children: ?extern fn(?*IXMLElement2, ?*(?*IXMLElementCollection)) HRESULT,
    get_type: ?extern fn(?*IXMLElement2, ?*c_long) HRESULT,
    get_text: ?extern fn(?*IXMLElement2, ?*BSTR) HRESULT,
    put_text: ?extern fn(?*IXMLElement2, BSTR) HRESULT,
    addChild: ?extern fn(?*IXMLElement2, ?*IXMLElement2, c_long, c_long) HRESULT,
    removeChild: ?extern fn(?*IXMLElement2, ?*IXMLElement2) HRESULT,
    get_attributes: ?extern fn(?*IXMLElement2, ?*(?*IXMLElementCollection)) HRESULT,
};
pub const IXMLElement2 = extern struct {
    lpVtbl: ?*IXMLElement2Vtbl,
};
pub const IXMLDocument2Vtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLDocument2, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLDocument2) ULONG,
    Release: ?extern fn(?*IXMLDocument2) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLDocument2, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLDocument2, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLDocument2, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLDocument2, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_root: ?extern fn(?*IXMLDocument2, ?*(?*IXMLElement2)) HRESULT,
    get_fileSize: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    get_fileModifiedDate: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    get_fileUpdatedDate: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    get_URL: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    put_URL: ?extern fn(?*IXMLDocument2, BSTR) HRESULT,
    get_mimeType: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    get_readyState: ?extern fn(?*IXMLDocument2, ?*c_long) HRESULT,
    get_charset: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    put_charset: ?extern fn(?*IXMLDocument2, BSTR) HRESULT,
    get_version: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    get_doctype: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    get_dtdURL: ?extern fn(?*IXMLDocument2, ?*BSTR) HRESULT,
    createElement: ?extern fn(?*IXMLDocument2, VARIANT, VARIANT, ?*(?*IXMLElement2)) HRESULT,
    get_async: ?extern fn(?*IXMLDocument2, ?*VARIANT_BOOL) HRESULT,
    put_async: ?extern fn(?*IXMLDocument2, VARIANT_BOOL) HRESULT,
};
pub const IXMLDocument2 = extern struct {
    lpVtbl: ?*IXMLDocument2Vtbl,
};

pub const IXMLAttributeVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLAttribute, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLAttribute) ULONG,
    Release: ?extern fn(?*IXMLAttribute) ULONG,
    GetTypeInfoCount: ?extern fn(?*IXMLAttribute, ?*UINT) HRESULT,
    GetTypeInfo: ?extern fn(?*IXMLAttribute, UINT, LCID, ?*(?*ITypeInfo)) HRESULT,
    GetIDsOfNames: ?extern fn(?*IXMLAttribute, ?*const IID, ?*LPOLESTR, UINT, LCID, ?*DISPID) HRESULT,
    Invoke: ?extern fn(?*IXMLAttribute, DISPID, ?*const IID, LCID, WORD, ?*DISPPARAMS, ?*VARIANT, ?*EXCEPINFO, ?*UINT) HRESULT,
    get_name: ?extern fn(?*IXMLAttribute, ?*BSTR) HRESULT,
    get_value: ?extern fn(?*IXMLAttribute, ?*BSTR) HRESULT,
};
pub const IXMLAttribute = extern struct {
    lpVtbl: ?*IXMLAttributeVtbl,
};

pub const xml_error = extern struct {
    _nLine: c_uint,
    _pchBuf: BSTR,
    _cchBuf: c_uint,
    _ich: c_uint,
    _pszFound: BSTR,
    _pszExpected: BSTR,
    _reserved1: DWORD,
    _reserved2: DWORD,
};
pub const XML_ERROR = xml_error;
pub const IXMLErrorVtbl = extern struct {
    QueryInterface: ?extern fn(?*IXMLError, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IXMLError) ULONG,
    Release: ?extern fn(?*IXMLError) ULONG,
    GetErrorInfo: ?extern fn(?*IXMLError, ?*XML_ERROR) HRESULT,
};
pub const IXMLError = extern struct {
    lpVtbl: ?*IXMLErrorVtbl,
};
pub const XMLDocument = @OpaqueType();

pub const XMLEMEM_TYPE = c_int;
pub const XMLELEM_TYPE = XMLEMEM_TYPE;





























pub const IE_EPM_OBJECT_EVENT = IEObjectType.IE_EPM_OBJECT_EVENT;
pub const IE_EPM_OBJECT_MUTEX = IEObjectType.IE_EPM_OBJECT_MUTEX;
pub const IE_EPM_OBJECT_SEMAPHORE = IEObjectType.IE_EPM_OBJECT_SEMAPHORE;
pub const IE_EPM_OBJECT_SHARED_MEMORY = IEObjectType.IE_EPM_OBJECT_SHARED_MEMORY;
pub const IE_EPM_OBJECT_WAITABLE_TIMER = IEObjectType.IE_EPM_OBJECT_WAITABLE_TIMER;
pub const IE_EPM_OBJECT_FILE = IEObjectType.IE_EPM_OBJECT_FILE;
pub const IE_EPM_OBJECT_NAMED_PIPE = IEObjectType.IE_EPM_OBJECT_NAMED_PIPE;
pub const IE_EPM_OBJECT_REGISTRY = IEObjectType.IE_EPM_OBJECT_REGISTRY;
pub const IEObjectType = extern enum {
    IE_EPM_OBJECT_EVENT,
    IE_EPM_OBJECT_MUTEX,
    IE_EPM_OBJECT_SEMAPHORE,
    IE_EPM_OBJECT_SHARED_MEMORY,
    IE_EPM_OBJECT_WAITABLE_TIMER,
    IE_EPM_OBJECT_FILE,
    IE_EPM_OBJECT_NAMED_PIPE,
    IE_EPM_OBJECT_REGISTRY,
};

pub const LPPERSISTMONIKER = ?*IPersistMoniker;

pub const LPMONIKERPROP = ?*IMonikerProp;

pub const LPBINDPROTOCOL = ?*IBindProtocol;

pub const LPBINDING = ?*IBinding;

pub const LPBINDSTATUSCALLBACK = ?*IBindStatusCallback;
pub const _MIDL_IBindStatusCallback_0001 = c_int;
pub const BINDVERB = _MIDL_IBindStatusCallback_0001;
pub const _MIDL_IBindStatusCallback_0002 = c_int;
pub const BINDINFOF = _MIDL_IBindStatusCallback_0002;
pub const _MIDL_IBindStatusCallback_0003 = c_int;
pub const BINDF = _MIDL_IBindStatusCallback_0003;
pub const _MIDL_IBindStatusCallback_0004 = c_int;
pub const URL_ENCODING = _MIDL_IBindStatusCallback_0004;
pub const REMSECURITY_ATTRIBUTES = extern struct {
    nLength: DWORD,
    lpSecurityDescriptor: DWORD,
    bInheritHandle: BOOL,
};

pub const PREMSECURITY_ATTRIBUTES = ?*REMSECURITY_ATTRIBUTES;
pub const LPREMSECURITY_ATTRIBUTES = ?*REMSECURITY_ATTRIBUTES;
pub const RemBINDINFO = extern struct {
    cbSize: ULONG,
    szExtraInfo: LPWSTR,
    grfBindInfoF: DWORD,
    dwBindVerb: DWORD,
    szCustomVerb: LPWSTR,
    cbstgmedData: DWORD,
    dwOptions: DWORD,
    dwOptionsFlags: DWORD,
    dwCodePage: DWORD,
    securityAttributes: REMSECURITY_ATTRIBUTES,
    iid: IID,
    pUnk: ?*IUnknown,
    dwReserved: DWORD,
};

pub const RemFORMATETC = extern struct {
    cfFormat: DWORD,
    ptd: DWORD,
    dwAspect: DWORD,
    lindex: LONG,
    tymed: DWORD,
};

pub const LPREMFORMATETC = ?*RemFORMATETC;
pub const _MIDL_IBindStatusCallback_0005 = c_int;
pub const BINDINFO_OPTIONS = _MIDL_IBindStatusCallback_0005;
pub const _MIDL_IBindStatusCallback_0006 = c_int;
pub const BSCF = _MIDL_IBindStatusCallback_0006;
pub const BINDSTATUS = c_int;


pub const LPBINDSTATUSCALLBACKEX = ?*IBindStatusCallbackEx;
pub const _MIDL_IBindStatusCallbackEx_0001 = c_int;
pub const BINDF2 = _MIDL_IBindStatusCallbackEx_0001;

pub const LPAUTHENTICATION = ?*IAuthenticate;

pub const LPAUTHENTICATIONEX = ?*IAuthenticateEx;
pub const _MIDL_IAuthenticateEx_0001 = c_int;
pub const AUTHENTICATEF = _MIDL_IAuthenticateEx_0001;

pub const LPHTTPNEGOTIATE = ?*IHttpNegotiate;

pub const LPHTTPNEGOTIATE2 = ?*IHttpNegotiate2;

pub const LPHTTPNEGOTIATE3 = ?*IHttpNegotiate3;

pub const LPWININETFILESTREAM = ?*IWinInetFileStream;

pub const LPWINDOWFORBINDINGUI = ?*IWindowForBindingUI;

pub const LPCODEINSTALL = ?*ICodeInstall;
pub const _MIDL_ICodeInstall_0001 = c_int;
pub const CIP_STATUS = _MIDL_ICodeInstall_0001;

pub const _MIDL_IUri_0002 = c_int;
pub const Uri_HOST_TYPE = _MIDL_IUri_0002;




pub const LPWININETINFO = ?*IWinInetInfo;

pub const LPHTTPSECURITY = ?*IHttpSecurity;

pub const LPWININETHTTPINFO = ?*IWinInetHttpInfo;


pub const LPWININETCACHEHINTS = ?*IWinInetCacheHints;

pub const LPWININETCACHEHINTS2 = ?*IWinInetCacheHints2;

pub const LPBINDHOST = ?*IBindHost;

pub const LPIINTERNET = ?*IInternet;

pub const LPIINTERNETBINDINFO = ?*IInternetBindInfo;
pub const BINDSTRING = c_int;


pub const LPIINTERNETBINDINFOEX = ?*IInternetBindInfoEx;

pub const LPIINTERNETPROTOCOLROOT = ?*IInternetProtocolRoot;
pub const PI_FLAGS = c_int;

pub const StartParam = extern struct {
    iid: IID,
    pIBindCtx: ?*IBindCtx,
    pItf: ?*IUnknown,
};


pub const LPIINTERNETPROTOCOL = ?*IInternetProtocol;


pub const LPIINTERNETPROTOCOLSINK = ?*IInternetProtocolSink;

pub const LPIINTERNETPROTOCOLSINKStackable = ?*IInternetProtocolSinkStackable;

pub const LPIINTERNETSESSION = ?*IInternetSession;
pub const OIBDG_FLAGS = c_int;


pub const LPIINTERNETTHREADSWITCH = ?*IInternetThreadSwitch;

pub const LPIINTERNETPRIORITY = ?*IInternetPriority;

pub const LPIINTERNETPROTOCOLINFO = ?*IInternetProtocolInfo;
pub const PSUACTION = c_int;


pub const INTERNETFEATURELIST = c_int;


pub const _MIDL_IInternetSecurityManager_0001 = c_int;
pub const PUAF = _MIDL_IInternetSecurityManager_0001;
pub const _MIDL_IInternetSecurityManager_0002 = c_int;
pub const PUAFOUT = _MIDL_IInternetSecurityManager_0002;
pub const _MIDL_IInternetSecurityManager_0003 = c_int;
pub const SZM_FLAGS = _MIDL_IInternetSecurityManager_0003;






pub const LPURLZONEMANAGER = ?*IInternetZoneManager;
pub const URLZONE = c_int;

pub const URLTEMPLATE = c_int;

pub const _MIDL_IInternetZoneManager_0001 = c_int;
pub const _MIDL_IInternetZoneManager_0002 = c_int;
pub const ZAFLAGS = _MIDL_IInternetZoneManager_0002;
pub const LPZONEATTRIBUTES = ?*ZONEATTRIBUTES;






pub const LPCATALOGFILEINFO = ?*ICatalogFileInfo;

pub const LPDATAFILTER = ?*IDataFilter;

pub const PROTOCOLFILTERDATA = extern struct {
    cbSize: DWORD,
    pProtocolSink: ?*IInternetProtocolSink,
    pProtocol: ?*IInternetProtocol,
    pUnk: ?*IUnknown,
    dwFilterFlags: DWORD,
};

pub const LPENCODINGFILTERFACTORY = ?*IEncodingFilterFactory;

pub const HIT_LOGGING_INFO = extern struct {
    dwStructSize: DWORD,
    lpszLoggedUrlName: LPSTR,
    StartTime: SYSTEMTIME,
    EndTime: SYSTEMTIME,
    lpszExtendedInfo: LPSTR,
};

pub const LPHIT_LOGGING_INFO = ?*HIT_LOGGING_INFO;
pub const CONFIRMSAFETY = extern struct {
    clsid: CLSID,
    pUnk: ?*IUnknown,
    dwFlags: DWORD,
};
pub const LPIWRAPPEDPROTOCOL = ?*IWrappedProtocol;

pub const LPGETBINDHANDLE = ?*IGetBindHandle;

pub const PROTOCOL_ARGUMENT = extern struct {
    szMethod: LPCWSTR,
    szTargetUrl: LPCWSTR,
};

pub const LPPROTOCOL_ARGUMENT = ?*PROTOCOL_ARGUMENT;
pub const LPBINDCALLBACKREDIRECT = ?*IBindCallbackRedirect;


pub const PIDMSI_STATUS_VALUE = c_int;
pub const SERIALIZEDPROPERTYVALUE = extern struct {
    dwType: DWORD,
    rgb: [1]BYTE,
};

pub const NUMPARSE = extern struct {
    cDig: INT,
    dwInFlags: ULONG,
    dwOutFlags: ULONG,
    cchUsed: INT,
    nBaseShift: INT,
    nPwr10: INT,
};
pub const UDATE = extern struct {
    st: SYSTEMTIME,
    wDayOfYear: USHORT,
};
pub const REGKIND_DEFAULT = REGKIND.REGKIND_DEFAULT;
pub const REGKIND_REGISTER = REGKIND.REGKIND_REGISTER;
pub const REGKIND_NONE = REGKIND.REGKIND_NONE;
pub const REGKIND = extern enum {
    REGKIND_DEFAULT,
    REGKIND_REGISTER,
    REGKIND_NONE,
};

pub const PARAMDATA = extern struct {
    szName: ?*OLECHAR,
    vt: VARTYPE,
};

pub const LPPARAMDATA = ?*PARAMDATA;
pub const METHODDATA = extern struct {
    szName: ?*OLECHAR,
    ppdata: ?*PARAMDATA,
    dispid: DISPID,
    iMeth: UINT,
    cc: CALLCONV,
    cArgs: UINT,
    wFlags: WORD,
    vtReturn: VARTYPE,
};

pub const LPMETHODDATA = ?*METHODDATA;
pub const INTERFACEDATA = extern struct {
    pmethdata: ?*METHODDATA,
    cMembers: UINT,
};

pub const LPINTERFACEDATA = ?*INTERFACEDATA;
pub const LPOLESTREAM = ?*OLESTREAM;
pub const OLESTREAMVTBL = extern struct {
    Get: ?extern fn(LPOLESTREAM, ?*c_void, DWORD) DWORD,
    Put: ?extern fn(LPOLESTREAM, ?*const c_void, DWORD) DWORD,
};

pub const LPOLESTREAMVTBL = ?*OLESTREAMVTBL;
pub const OLESTREAM = extern struct {
    lpstbl: LPOLESTREAMVTBL,
};

pub const LPOFNHOOKPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const OFN_NT4A = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    lpstrFilter: LPCSTR,
    lpstrCustomFilter: LPSTR,
    nMaxCustFilter: DWORD,
    nFilterIndex: DWORD,
    lpstrFile: LPSTR,
    nMaxFile: DWORD,
    lpstrFileTitle: LPSTR,
    nMaxFileTitle: DWORD,
    lpstrInitialDir: LPCSTR,
    lpstrTitle: LPCSTR,
    Flags: DWORD,
    nFileOffset: WORD,
    nFileExtension: WORD,
    lpstrDefExt: LPCSTR,
    lCustData: LPARAM,
    lpfnHook: LPOFNHOOKPROC,
    lpTemplateName: LPCSTR,
};
pub const OPENFILENAME_NT4A = OFN_NT4A;
pub const LPOPENFILENAME_NT4A = ?*OFN_NT4A;
pub const OFN_NT4W = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    lpstrFilter: LPCWSTR,
    lpstrCustomFilter: LPWSTR,
    nMaxCustFilter: DWORD,
    nFilterIndex: DWORD,
    lpstrFile: LPWSTR,
    nMaxFile: DWORD,
    lpstrFileTitle: LPWSTR,
    nMaxFileTitle: DWORD,
    lpstrInitialDir: LPCWSTR,
    lpstrTitle: LPCWSTR,
    Flags: DWORD,
    nFileOffset: WORD,
    nFileExtension: WORD,
    lpstrDefExt: LPCWSTR,
    lCustData: LPARAM,
    lpfnHook: LPOFNHOOKPROC,
    lpTemplateName: LPCWSTR,
};
pub const OPENFILENAME_NT4W = OFN_NT4W;
pub const LPOPENFILENAME_NT4W = ?*OFN_NT4W;
pub const OFNA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    lpstrFilter: LPCSTR,
    lpstrCustomFilter: LPSTR,
    nMaxCustFilter: DWORD,
    nFilterIndex: DWORD,
    lpstrFile: LPSTR,
    nMaxFile: DWORD,
    lpstrFileTitle: LPSTR,
    nMaxFileTitle: DWORD,
    lpstrInitialDir: LPCSTR,
    lpstrTitle: LPCSTR,
    Flags: DWORD,
    nFileOffset: WORD,
    nFileExtension: WORD,
    lpstrDefExt: LPCSTR,
    lCustData: LPARAM,
    lpfnHook: LPOFNHOOKPROC,
    lpTemplateName: LPCSTR,
    pvReserved: ?*c_void,
    dwReserved: DWORD,
    FlagsEx: DWORD,
};
pub const OPENFILENAMEA = OFNA;
pub const LPOPENFILENAMEA = ?*OFNA;
pub const OFNW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    lpstrFilter: LPCWSTR,
    lpstrCustomFilter: LPWSTR,
    nMaxCustFilter: DWORD,
    nFilterIndex: DWORD,
    lpstrFile: LPWSTR,
    nMaxFile: DWORD,
    lpstrFileTitle: LPWSTR,
    nMaxFileTitle: DWORD,
    lpstrInitialDir: LPCWSTR,
    lpstrTitle: LPCWSTR,
    Flags: DWORD,
    nFileOffset: WORD,
    nFileExtension: WORD,
    lpstrDefExt: LPCWSTR,
    lCustData: LPARAM,
    lpfnHook: LPOFNHOOKPROC,
    lpTemplateName: LPCWSTR,
    pvReserved: ?*c_void,
    dwReserved: DWORD,
    FlagsEx: DWORD,
};
pub const OPENFILENAMEW = OFNW;
pub const LPOPENFILENAMEW = ?*OFNW;
pub const LPCCHOOKPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const OFNOTIFYA = extern struct {
    hdr: NMHDR,
    lpOFN: LPOPENFILENAMEA,
    pszFile: LPSTR,
};

pub const LPOFNOTIFYA = ?*OFNOTIFYA;
pub const OFNOTIFYW = extern struct {
    hdr: NMHDR,
    lpOFN: LPOPENFILENAMEW,
    pszFile: LPWSTR,
};

pub const LPOFNOTIFYW = ?*OFNOTIFYW;
pub const OFNOTIFYEXA = extern struct {
    hdr: NMHDR,
    lpOFN: LPOPENFILENAMEA,
    psf: LPVOID,
    pidl: LPVOID,
};

pub const LPOFNOTIFYEXA = ?*OFNOTIFYEXA;
pub const OFNOTIFYEXW = extern struct {
    hdr: NMHDR,
    lpOFN: LPOPENFILENAMEW,
    psf: LPVOID,
    pidl: LPVOID,
};

pub const LPOFNOTIFYEXW = ?*OFNOTIFYEXW;
pub const CHOOSECOLORA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HWND,
    rgbResult: COLORREF,
    lpCustColors: ?*COLORREF,
    Flags: DWORD,
    lCustData: LPARAM,
    lpfnHook: LPCCHOOKPROC,
    lpTemplateName: LPCSTR,
};

pub const LPCHOOSECOLORA = ?*CHOOSECOLORA;
pub const CHOOSECOLORW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HWND,
    rgbResult: COLORREF,
    lpCustColors: ?*COLORREF,
    Flags: DWORD,
    lCustData: LPARAM,
    lpfnHook: LPCCHOOKPROC,
    lpTemplateName: LPCWSTR,
};

pub const LPCHOOSECOLORW = ?*CHOOSECOLORW;
pub const LPFRHOOKPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const FINDREPLACEA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    Flags: DWORD,
    lpstrFindWhat: LPSTR,
    lpstrReplaceWith: LPSTR,
    wFindWhatLen: WORD,
    wReplaceWithLen: WORD,
    lCustData: LPARAM,
    lpfnHook: LPFRHOOKPROC,
    lpTemplateName: LPCSTR,
};

pub const LPFINDREPLACEA = ?*FINDREPLACEA;
pub const FINDREPLACEW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hInstance: HINSTANCE,
    Flags: DWORD,
    lpstrFindWhat: LPWSTR,
    lpstrReplaceWith: LPWSTR,
    wFindWhatLen: WORD,
    wReplaceWithLen: WORD,
    lCustData: LPARAM,
    lpfnHook: LPFRHOOKPROC,
    lpTemplateName: LPCWSTR,
};

pub const LPFINDREPLACEW = ?*FINDREPLACEW;
pub const LPCFHOOKPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const CHOOSEFONTA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDC: HDC,
    lpLogFont: LPLOGFONTA,
    iPointSize: INT,
    Flags: DWORD,
    rgbColors: COLORREF,
    lCustData: LPARAM,
    lpfnHook: LPCFHOOKPROC,
    lpTemplateName: LPCSTR,
    hInstance: HINSTANCE,
    lpszStyle: LPSTR,
    nFontType: WORD,
    ___MISSING_ALIGNMENT__: WORD,
    nSizeMin: INT,
    nSizeMax: INT,
};

pub const CHOOSEFONTW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDC: HDC,
    lpLogFont: LPLOGFONTW,
    iPointSize: INT,
    Flags: DWORD,
    rgbColors: COLORREF,
    lCustData: LPARAM,
    lpfnHook: LPCFHOOKPROC,
    lpTemplateName: LPCWSTR,
    hInstance: HINSTANCE,
    lpszStyle: LPWSTR,
    nFontType: WORD,
    ___MISSING_ALIGNMENT__: WORD,
    nSizeMin: INT,
    nSizeMax: INT,
};

pub const LPCHOOSEFONTA = ?*CHOOSEFONTA;
pub const LPCHOOSEFONTW = ?*CHOOSEFONTW;
pub const PCCHOOSEFONTA = ?*const CHOOSEFONTA;
pub const PCCHOOSEFONTW = ?*const CHOOSEFONTW;
pub const LPPRINTHOOKPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const LPSETUPHOOKPROC = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const PDA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDevMode: HGLOBAL,
    hDevNames: HGLOBAL,
    hDC: HDC,
    Flags: DWORD,
    nFromPage: WORD,
    nToPage: WORD,
    nMinPage: WORD,
    nMaxPage: WORD,
    nCopies: WORD,
    hInstance: HINSTANCE,
    lCustData: LPARAM,
    lpfnPrintHook: LPPRINTHOOKPROC,
    lpfnSetupHook: LPSETUPHOOKPROC,
    lpPrintTemplateName: LPCSTR,
    lpSetupTemplateName: LPCSTR,
    hPrintTemplate: HGLOBAL,
    hSetupTemplate: HGLOBAL,
};
pub const PRINTDLGA = PDA;
pub const LPPRINTDLGA = ?*PDA;
pub const PDW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDevMode: HGLOBAL,
    hDevNames: HGLOBAL,
    hDC: HDC,
    Flags: DWORD,
    nFromPage: WORD,
    nToPage: WORD,
    nMinPage: WORD,
    nMaxPage: WORD,
    nCopies: WORD,
    hInstance: HINSTANCE,
    lCustData: LPARAM,
    lpfnPrintHook: LPPRINTHOOKPROC,
    lpfnSetupHook: LPSETUPHOOKPROC,
    lpPrintTemplateName: LPCWSTR,
    lpSetupTemplateName: LPCWSTR,
    hPrintTemplate: HGLOBAL,
    hSetupTemplate: HGLOBAL,
};
pub const PRINTDLGW = PDW;
pub const LPPRINTDLGW = ?*PDW;

pub const IPrintDialogCallbackVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPrintDialogCallback, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPrintDialogCallback) ULONG,
    Release: ?extern fn(?*IPrintDialogCallback) ULONG,
    InitDone: ?extern fn(?*IPrintDialogCallback) HRESULT,
    SelectionChange: ?extern fn(?*IPrintDialogCallback) HRESULT,
    HandleMessage: ?extern fn(?*IPrintDialogCallback, HWND, UINT, WPARAM, LPARAM, ?*LRESULT) HRESULT,
};
pub const IPrintDialogCallback = extern struct {
    lpVtbl: ?*IPrintDialogCallbackVtbl,
};


pub const IPrintDialogServicesVtbl = extern struct {
    QueryInterface: ?extern fn(?*IPrintDialogServices, ?*const IID, ?*(?*c_void)) HRESULT,
    AddRef: ?extern fn(?*IPrintDialogServices) ULONG,
    Release: ?extern fn(?*IPrintDialogServices) ULONG,
    GetCurrentDevMode: ?extern fn(?*IPrintDialogServices, LPDEVMODE, ?*UINT) HRESULT,
    GetCurrentPrinterName: ?extern fn(?*IPrintDialogServices, LPWSTR, ?*UINT) HRESULT,
    GetCurrentPortName: ?extern fn(?*IPrintDialogServices, LPWSTR, ?*UINT) HRESULT,
};
pub const IPrintDialogServices = extern struct {
    lpVtbl: ?*IPrintDialogServicesVtbl,
};

pub const PRINTPAGERANGE = extern struct {
    nFromPage: DWORD,
    nToPage: DWORD,
};

pub const LPPRINTPAGERANGE = ?*PRINTPAGERANGE;
pub const PCPRINTPAGERANGE = ?*const PRINTPAGERANGE;
pub const PDEXA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDevMode: HGLOBAL,
    hDevNames: HGLOBAL,
    hDC: HDC,
    Flags: DWORD,
    Flags2: DWORD,
    ExclusionFlags: DWORD,
    nPageRanges: DWORD,
    nMaxPageRanges: DWORD,
    lpPageRanges: LPPRINTPAGERANGE,
    nMinPage: DWORD,
    nMaxPage: DWORD,
    nCopies: DWORD,
    hInstance: HINSTANCE,
    lpPrintTemplateName: LPCSTR,
    lpCallback: LPUNKNOWN,
    nPropertyPages: DWORD,
    lphPropertyPages: ?*HPROPSHEETPAGE,
    nStartPage: DWORD,
    dwResultAction: DWORD,
};
pub const PRINTDLGEXA = PDEXA;
pub const LPPRINTDLGEXA = ?*PDEXA;
pub const PDEXW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDevMode: HGLOBAL,
    hDevNames: HGLOBAL,
    hDC: HDC,
    Flags: DWORD,
    Flags2: DWORD,
    ExclusionFlags: DWORD,
    nPageRanges: DWORD,
    nMaxPageRanges: DWORD,
    lpPageRanges: LPPRINTPAGERANGE,
    nMinPage: DWORD,
    nMaxPage: DWORD,
    nCopies: DWORD,
    hInstance: HINSTANCE,
    lpPrintTemplateName: LPCWSTR,
    lpCallback: LPUNKNOWN,
    nPropertyPages: DWORD,
    lphPropertyPages: ?*HPROPSHEETPAGE,
    nStartPage: DWORD,
    dwResultAction: DWORD,
};
pub const PRINTDLGEXW = PDEXW;
pub const LPPRINTDLGEXW = ?*PDEXW;
pub const DEVNAMES = extern struct {
    wDriverOffset: WORD,
    wDeviceOffset: WORD,
    wOutputOffset: WORD,
    wDefault: WORD,
};

pub const LPDEVNAMES = ?*DEVNAMES;
pub const PCDEVNAMES = ?*const DEVNAMES;
pub const LPPAGEPAINTHOOK = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const LPPAGESETUPHOOK = ?extern fn(HWND, UINT, WPARAM, LPARAM) UINT_PTR;
pub const PSDA = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDevMode: HGLOBAL,
    hDevNames: HGLOBAL,
    Flags: DWORD,
    ptPaperSize: POINT,
    rtMinMargin: RECT,
    rtMargin: RECT,
    hInstance: HINSTANCE,
    lCustData: LPARAM,
    lpfnPageSetupHook: LPPAGESETUPHOOK,
    lpfnPagePaintHook: LPPAGEPAINTHOOK,
    lpPageSetupTemplateName: LPCSTR,
    hPageSetupTemplate: HGLOBAL,
};
pub const PAGESETUPDLGA = PSDA;
pub const LPPAGESETUPDLGA = ?*PSDA;
pub const PSDW = extern struct {
    lStructSize: DWORD,
    hwndOwner: HWND,
    hDevMode: HGLOBAL,
    hDevNames: HGLOBAL,
    Flags: DWORD,
    ptPaperSize: POINT,
    rtMinMargin: RECT,
    rtMargin: RECT,
    hInstance: HINSTANCE,
    lCustData: LPARAM,
    lpfnPageSetupHook: LPPAGESETUPHOOK,
    lpfnPagePaintHook: LPPAGEPAINTHOOK,
    lpPageSetupTemplateName: LPCWSTR,
    hPageSetupTemplate: HGLOBAL,
};
pub const PAGESETUPDLGW = PSDW;
pub const LPPAGESETUPDLGW = ?*PSDW;
pub const PUWSTR_C = ?*WCHAR;
pub const SERVICE_TRIGGER_CUSTOM_STATE_ID = extern struct {
    Data: [2]DWORD,
};
pub const SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM = extern struct {
    u: extern union {
        CustomStateId: SERVICE_TRIGGER_CUSTOM_STATE_ID,
        s: extern struct {
            DataOffset: DWORD,
            Data: [1]BYTE,
        },
    },
};

pub const LPSERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM = ?*SERVICE_CUSTOM_SYSTEM_STATE_CHANGE_DATA_ITEM;
pub const SERVICE_DESCRIPTIONA = extern struct {
    lpDescription: LPSTR,
};

pub const LPSERVICE_DESCRIPTIONA = ?*SERVICE_DESCRIPTIONA;
pub const SERVICE_DESCRIPTIONW = extern struct {
    lpDescription: LPWSTR,
};

pub const LPSERVICE_DESCRIPTIONW = ?*SERVICE_DESCRIPTIONW;
pub const SC_ACTION_TYPE = c_int;

pub const SC_ACTION = extern struct {
    Type: SC_ACTION_TYPE,
    Delay: DWORD,
};

pub const LPSC_ACTION = ?*SC_ACTION;
pub const SERVICE_FAILURE_ACTIONSA = extern struct {
    dwResetPeriod: DWORD,
    lpRebootMsg: LPSTR,
    lpCommand: LPSTR,
    cActions: DWORD,
    lpsaActions: ?*SC_ACTION,
};

pub const LPSERVICE_FAILURE_ACTIONSA = ?*SERVICE_FAILURE_ACTIONSA;
pub const SERVICE_FAILURE_ACTIONSW = extern struct {
    dwResetPeriod: DWORD,
    lpRebootMsg: LPWSTR,
    lpCommand: LPWSTR,
    cActions: DWORD,
    lpsaActions: ?*SC_ACTION,
};

pub const LPSERVICE_FAILURE_ACTIONSW = ?*SERVICE_FAILURE_ACTIONSW;
pub const SERVICE_DELAYED_AUTO_START_INFO = extern struct {
    fDelayedAutostart: BOOL,
};

pub const LPSERVICE_DELAYED_AUTO_START_INFO = ?*SERVICE_DELAYED_AUTO_START_INFO;
pub const SERVICE_FAILURE_ACTIONS_FLAG = extern struct {
    fFailureActionsOnNonCrashFailures: BOOL,
};

pub const LPSERVICE_FAILURE_ACTIONS_FLAG = ?*SERVICE_FAILURE_ACTIONS_FLAG;
pub const SERVICE_SID_INFO = extern struct {
    dwServiceSidType: DWORD,
};

pub const LPSERVICE_SID_INFO = ?*SERVICE_SID_INFO;
pub const SERVICE_REQUIRED_PRIVILEGES_INFOA = extern struct {
    pmszRequiredPrivileges: LPSTR,
};

pub const LPSERVICE_REQUIRED_PRIVILEGES_INFOA = ?*SERVICE_REQUIRED_PRIVILEGES_INFOA;
pub const SERVICE_REQUIRED_PRIVILEGES_INFOW = extern struct {
    pmszRequiredPrivileges: LPWSTR,
};

pub const LPSERVICE_REQUIRED_PRIVILEGES_INFOW = ?*SERVICE_REQUIRED_PRIVILEGES_INFOW;
pub const SERVICE_PRESHUTDOWN_INFO = extern struct {
    dwPreshutdownTimeout: DWORD,
};

pub const LPSERVICE_PRESHUTDOWN_INFO = ?*SERVICE_PRESHUTDOWN_INFO;
pub const SERVICE_TRIGGER_SPECIFIC_DATA_ITEM = extern struct {
    dwDataType: DWORD,
    cbData: DWORD,
    pData: PBYTE,
};

pub const PSERVICE_TRIGGER_SPECIFIC_DATA_ITEM = ?*SERVICE_TRIGGER_SPECIFIC_DATA_ITEM;
pub const SERVICE_TRIGGER = extern struct {
    dwTriggerType: DWORD,
    dwAction: DWORD,
    pTriggerSubtype: ?*GUID,
    cDataItems: DWORD,
    pDataItems: PSERVICE_TRIGGER_SPECIFIC_DATA_ITEM,
};

pub const PSERVICE_TRIGGER = ?*SERVICE_TRIGGER;
pub const SERVICE_TRIGGER_INFO = extern struct {
    cTriggers: DWORD,
    pTriggers: PSERVICE_TRIGGER,
    pReserved: PBYTE,
};

pub const PSERVICE_TRIGGER_INFO = ?*SERVICE_TRIGGER_INFO;
pub const SERVICE_PREFERRED_NODE_INFO = extern struct {
    usPreferredNode: USHORT,
    fDelete: BOOLEAN,
};

pub const LPSERVICE_PREFERRED_NODE_INFO = ?*SERVICE_PREFERRED_NODE_INFO;
pub const SERVICE_TIMECHANGE_INFO = extern struct {
    liNewTime: LARGE_INTEGER,
    liOldTime: LARGE_INTEGER,
};

pub const PSERVICE_TIMECHANGE_INFO = ?*SERVICE_TIMECHANGE_INFO;
pub const SERVICE_LAUNCH_PROTECTED_INFO = extern struct {
    dwLaunchProtected: DWORD,
};

pub const PSERVICE_LAUNCH_PROTECTED_INFO = ?*SERVICE_LAUNCH_PROTECTED_INFO;
pub const SC_HANDLE__ = extern struct {
    unused: c_int,
};
pub const SC_HANDLE = ?*SC_HANDLE__;
pub const LPSC_HANDLE = ?*SC_HANDLE;
pub const SERVICE_STATUS_HANDLE__ = extern struct {
    unused: c_int,
};
pub const SERVICE_STATUS_HANDLE = ?*SERVICE_STATUS_HANDLE__;
pub const SC_STATUS_TYPE = c_int;

pub const SC_ENUM_TYPE = c_int;

pub const SERVICE_STATUS = extern struct {
    dwServiceType: DWORD,
    dwCurrentState: DWORD,
    dwControlsAccepted: DWORD,
    dwWin32ExitCode: DWORD,
    dwServiceSpecificExitCode: DWORD,
    dwCheckPoint: DWORD,
    dwWaitHint: DWORD,
};

pub const LPSERVICE_STATUS = ?*SERVICE_STATUS;
pub const SERVICE_STATUS_PROCESS = extern struct {
    dwServiceType: DWORD,
    dwCurrentState: DWORD,
    dwControlsAccepted: DWORD,
    dwWin32ExitCode: DWORD,
    dwServiceSpecificExitCode: DWORD,
    dwCheckPoint: DWORD,
    dwWaitHint: DWORD,
    dwProcessId: DWORD,
    dwServiceFlags: DWORD,
};

pub const LPSERVICE_STATUS_PROCESS = ?*SERVICE_STATUS_PROCESS;
pub const ENUM_SERVICE_STATUSA = extern struct {
    lpServiceName: LPSTR,
    lpDisplayName: LPSTR,
    ServiceStatus: SERVICE_STATUS,
};

pub const LPENUM_SERVICE_STATUSA = ?*ENUM_SERVICE_STATUSA;
pub const ENUM_SERVICE_STATUSW = extern struct {
    lpServiceName: LPWSTR,
    lpDisplayName: LPWSTR,
    ServiceStatus: SERVICE_STATUS,
};

pub const LPENUM_SERVICE_STATUSW = ?*ENUM_SERVICE_STATUSW;
pub const ENUM_SERVICE_STATUS_PROCESSA = extern struct {
    lpServiceName: LPSTR,
    lpDisplayName: LPSTR,
    ServiceStatusProcess: SERVICE_STATUS_PROCESS,
};

pub const LPENUM_SERVICE_STATUS_PROCESSA = ?*ENUM_SERVICE_STATUS_PROCESSA;
pub const ENUM_SERVICE_STATUS_PROCESSW = extern struct {
    lpServiceName: LPWSTR,
    lpDisplayName: LPWSTR,
    ServiceStatusProcess: SERVICE_STATUS_PROCESS,
};

pub const LPENUM_SERVICE_STATUS_PROCESSW = ?*ENUM_SERVICE_STATUS_PROCESSW;
pub const SC_LOCK = LPVOID;
pub const QUERY_SERVICE_LOCK_STATUSA = extern struct {
    fIsLocked: DWORD,
    lpLockOwner: LPSTR,
    dwLockDuration: DWORD,
};

pub const LPQUERY_SERVICE_LOCK_STATUSA = ?*QUERY_SERVICE_LOCK_STATUSA;
pub const QUERY_SERVICE_LOCK_STATUSW = extern struct {
    fIsLocked: DWORD,
    lpLockOwner: LPWSTR,
    dwLockDuration: DWORD,
};

pub const LPQUERY_SERVICE_LOCK_STATUSW = ?*QUERY_SERVICE_LOCK_STATUSW;
pub const QUERY_SERVICE_CONFIGA = extern struct {
    dwServiceType: DWORD,
    dwStartType: DWORD,
    dwErrorControl: DWORD,
    lpBinaryPathName: LPSTR,
    lpLoadOrderGroup: LPSTR,
    dwTagId: DWORD,
    lpDependencies: LPSTR,
    lpServiceStartName: LPSTR,
    lpDisplayName: LPSTR,
};

pub const LPQUERY_SERVICE_CONFIGA = ?*QUERY_SERVICE_CONFIGA;
pub const QUERY_SERVICE_CONFIGW = extern struct {
    dwServiceType: DWORD,
    dwStartType: DWORD,
    dwErrorControl: DWORD,
    lpBinaryPathName: LPWSTR,
    lpLoadOrderGroup: LPWSTR,
    dwTagId: DWORD,
    lpDependencies: LPWSTR,
    lpServiceStartName: LPWSTR,
    lpDisplayName: LPWSTR,
};

pub const LPQUERY_SERVICE_CONFIGW = ?*QUERY_SERVICE_CONFIGW;
pub const SERVICE_MAIN_FUNCTIONW = extern fn(DWORD, ?*LPWSTR) void;
pub const SERVICE_MAIN_FUNCTIONA = extern fn(DWORD, ?*LPTSTR) void;
pub const LPSERVICE_MAIN_FUNCTIONW = ?extern fn(DWORD, ?*LPWSTR) void;
pub const LPSERVICE_MAIN_FUNCTIONA = ?extern fn(DWORD, ?*LPSTR) void;
pub const SERVICE_TABLE_ENTRYA = extern struct {
    lpServiceName: LPSTR,
    lpServiceProc: LPSERVICE_MAIN_FUNCTIONA,
};

pub const LPSERVICE_TABLE_ENTRYA = ?*SERVICE_TABLE_ENTRYA;
pub const SERVICE_TABLE_ENTRYW = extern struct {
    lpServiceName: LPWSTR,
    lpServiceProc: LPSERVICE_MAIN_FUNCTIONW,
};

pub const LPSERVICE_TABLE_ENTRYW = ?*SERVICE_TABLE_ENTRYW;
pub const HANDLER_FUNCTION = extern fn(DWORD) void;
pub const HANDLER_FUNCTION_EX = extern fn(DWORD, DWORD, LPVOID, LPVOID) DWORD;
pub const LPHANDLER_FUNCTION = ?extern fn(DWORD) void;
pub const LPHANDLER_FUNCTION_EX = ?extern fn(DWORD, DWORD, LPVOID, LPVOID) DWORD;
pub const PFN_SC_NOTIFY_CALLBACK = ?extern fn(PVOID) void;
pub const SERVICE_NOTIFY_1 = extern struct {
    dwVersion: DWORD,
    pfnNotifyCallback: PFN_SC_NOTIFY_CALLBACK,
    pContext: PVOID,
    dwNotificationStatus: DWORD,
    ServiceStatus: SERVICE_STATUS_PROCESS,
};

pub const PSERVICE_NOTIFY_1 = ?*SERVICE_NOTIFY_1;
pub const SERVICE_NOTIFY_2A = extern struct {
    dwVersion: DWORD,
    pfnNotifyCallback: PFN_SC_NOTIFY_CALLBACK,
    pContext: PVOID,
    dwNotificationStatus: DWORD,
    ServiceStatus: SERVICE_STATUS_PROCESS,
    dwNotificationTriggered: DWORD,
    pszServiceNames: LPSTR,
};

pub const PSERVICE_NOTIFY_2A = ?*SERVICE_NOTIFY_2A;
pub const SERVICE_NOTIFY_2W = extern struct {
    dwVersion: DWORD,
    pfnNotifyCallback: PFN_SC_NOTIFY_CALLBACK,
    pContext: PVOID,
    dwNotificationStatus: DWORD,
    ServiceStatus: SERVICE_STATUS_PROCESS,
    dwNotificationTriggered: DWORD,
    pszServiceNames: LPWSTR,
};

pub const PSERVICE_NOTIFY_2W = ?*SERVICE_NOTIFY_2W;
pub const SERVICE_NOTIFYA = SERVICE_NOTIFY_2A;
pub const PSERVICE_NOTIFYA = ?*SERVICE_NOTIFY_2A;
pub const SERVICE_NOTIFYW = SERVICE_NOTIFY_2W;
pub const PSERVICE_NOTIFYW = ?*SERVICE_NOTIFY_2W;
pub const SERVICE_CONTROL_STATUS_REASON_PARAMSA = extern struct {
    dwReason: DWORD,
    pszComment: LPSTR,
    ServiceStatus: SERVICE_STATUS_PROCESS,
};

pub const PSERVICE_CONTROL_STATUS_REASON_PARAMSA = ?*SERVICE_CONTROL_STATUS_REASON_PARAMSA;
pub const SERVICE_CONTROL_STATUS_REASON_PARAMSW = extern struct {
    dwReason: DWORD,
    pszComment: LPWSTR,
    ServiceStatus: SERVICE_STATUS_PROCESS,
};

pub const PSERVICE_CONTROL_STATUS_REASON_PARAMSW = ?*SERVICE_CONTROL_STATUS_REASON_PARAMSW;
pub const SERVICE_START_REASON = extern struct {
    dwReason: DWORD,
};

pub const PSERVICE_START_REASON = ?*SERVICE_START_REASON;
pub const SC_EVENT_DATABASE_CHANGE = SC_EVENT_TYPE.SC_EVENT_DATABASE_CHANGE;
pub const SC_EVENT_PROPERTY_CHANGE = SC_EVENT_TYPE.SC_EVENT_PROPERTY_CHANGE;
pub const SC_EVENT_STATUS_CHANGE = SC_EVENT_TYPE.SC_EVENT_STATUS_CHANGE;
pub const SC_EVENT_TYPE = extern enum {
    SC_EVENT_DATABASE_CHANGE,
    SC_EVENT_PROPERTY_CHANGE,
    SC_EVENT_STATUS_CHANGE,
};

pub const PSC_EVENT_TYPE = ?*SC_EVENT_TYPE;
pub const SC_NOTIFICATION_CALLBACK = extern fn(DWORD, PVOID) void;
pub const PSC_NOTIFICATION_CALLBACK = ?*SC_NOTIFICATION_CALLBACK;
pub const SC_NOTIFICATION_REGISTRATION = @OpaqueType();
pub const PSC_NOTIFICATION_REGISTRATION = ?*SC_NOTIFICATION_REGISTRATION;
pub const MODEMDEVCAPS = extern struct {
    dwActualSize: DWORD,
    dwRequiredSize: DWORD,
    dwDevSpecificOffset: DWORD,
    dwDevSpecificSize: DWORD,
    dwModemProviderVersion: DWORD,
    dwModemManufacturerOffset: DWORD,
    dwModemManufacturerSize: DWORD,
    dwModemModelOffset: DWORD,
    dwModemModelSize: DWORD,
    dwModemVersionOffset: DWORD,
    dwModemVersionSize: DWORD,
    dwDialOptions: DWORD,
    dwCallSetupFailTimer: DWORD,
    dwInactivityTimeout: DWORD,
    dwSpeakerVolume: DWORD,
    dwSpeakerMode: DWORD,
    dwModemOptions: DWORD,
    dwMaxDTERate: DWORD,
    dwMaxDCERate: DWORD,
    abVariablePortion: [1]BYTE,
};

pub const PMODEMDEVCAPS = ?*MODEMDEVCAPS;
pub const LPMODEMDEVCAPS = ?*MODEMDEVCAPS;
pub const MODEMSETTINGS = extern struct {
    dwActualSize: DWORD,
    dwRequiredSize: DWORD,
    dwDevSpecificOffset: DWORD,
    dwDevSpecificSize: DWORD,
    dwCallSetupFailTimer: DWORD,
    dwInactivityTimeout: DWORD,
    dwSpeakerVolume: DWORD,
    dwSpeakerMode: DWORD,
    dwPreferredModemOptions: DWORD,
    dwNegotiatedModemOptions: DWORD,
    dwNegotiatedDCERate: DWORD,
    abVariablePortion: [1]BYTE,
};

pub const PMODEMSETTINGS = ?*MODEMSETTINGS;
pub const LPMODEMSETTINGS = ?*MODEMSETTINGS;
pub const HIMC__ = extern struct {
    unused: c_int,
};
pub const HIMC = ?*HIMC__;
pub const HIMCC__ = extern struct {
    unused: c_int,
};
pub const HIMCC = ?*HIMCC__;
pub const LPHKL = ?*HKL;
pub const COMPOSITIONFORM = extern struct {
    dwStyle: DWORD,
    ptCurrentPos: POINT,
    rcArea: RECT,
};

pub const PCOMPOSITIONFORM = ?*COMPOSITIONFORM;
pub const NPCOMPOSITIONFORM = ?*COMPOSITIONFORM;
pub const LPCOMPOSITIONFORM = ?*COMPOSITIONFORM;
pub const CANDIDATEFORM = extern struct {
    dwIndex: DWORD,
    dwStyle: DWORD,
    ptCurrentPos: POINT,
    rcArea: RECT,
};

pub const PCANDIDATEFORM = ?*CANDIDATEFORM;
pub const NPCANDIDATEFORM = ?*CANDIDATEFORM;
pub const LPCANDIDATEFORM = ?*CANDIDATEFORM;
pub const CANDIDATELIST = extern struct {
    dwSize: DWORD,
    dwStyle: DWORD,
    dwCount: DWORD,
    dwSelection: DWORD,
    dwPageStart: DWORD,
    dwPageSize: DWORD,
    dwOffset: [1]DWORD,
};

pub const PCANDIDATELIST = ?*CANDIDATELIST;
pub const NPCANDIDATELIST = ?*CANDIDATELIST;
pub const LPCANDIDATELIST = ?*CANDIDATELIST;
pub const REGISTERWORDA = extern struct {
    lpReading: LPSTR,
    lpWord: LPSTR,
};

pub const PREGISTERWORDA = ?*REGISTERWORDA;
pub const NPREGISTERWORDA = ?*REGISTERWORDA;
pub const LPREGISTERWORDA = ?*REGISTERWORDA;
pub const REGISTERWORDW = extern struct {
    lpReading: LPWSTR,
    lpWord: LPWSTR,
};

pub const PREGISTERWORDW = ?*REGISTERWORDW;
pub const NPREGISTERWORDW = ?*REGISTERWORDW;
pub const LPREGISTERWORDW = ?*REGISTERWORDW;
pub const RECONVERTSTRING = extern struct {
    dwSize: DWORD,
    dwVersion: DWORD,
    dwStrLen: DWORD,
    dwStrOffset: DWORD,
    dwCompStrLen: DWORD,
    dwCompStrOffset: DWORD,
    dwTargetStrLen: DWORD,
    dwTargetStrOffset: DWORD,
};

pub const PRECONVERTSTRING = ?*RECONVERTSTRING;
pub const NPRECONVERTSTRING = ?*RECONVERTSTRING;
pub const LPRECONVERTSTRING = ?*RECONVERTSTRING;
pub const STYLEBUFA = extern struct {
    dwStyle: DWORD,
    szDescription: [32]CHAR,
};

pub const PSTYLEBUFA = ?*STYLEBUFA;
pub const NPSTYLEBUFA = ?*STYLEBUFA;
pub const LPSTYLEBUFA = ?*STYLEBUFA;
pub const STYLEBUFW = extern struct {
    dwStyle: DWORD,
    szDescription: [32]WCHAR,
};

pub const PSTYLEBUFW = ?*STYLEBUFW;
pub const NPSTYLEBUFW = ?*STYLEBUFW;
pub const LPSTYLEBUFW = ?*STYLEBUFW;
pub const IMEMENUITEMINFOA = extern struct {
    cbSize: UINT,
    fType: UINT,
    fState: UINT,
    wID: UINT,
    hbmpChecked: HBITMAP,
    hbmpUnchecked: HBITMAP,
    dwItemData: DWORD,
    szString: [80]CHAR,
    hbmpItem: HBITMAP,
};

pub const PIMEMENUITEMINFOA = ?*IMEMENUITEMINFOA;
pub const NPIMEMENUITEMINFOA = ?*IMEMENUITEMINFOA;
pub const LPIMEMENUITEMINFOA = ?*IMEMENUITEMINFOA;
pub const IMEMENUITEMINFOW = extern struct {
    cbSize: UINT,
    fType: UINT,
    fState: UINT,
    wID: UINT,
    hbmpChecked: HBITMAP,
    hbmpUnchecked: HBITMAP,
    dwItemData: DWORD,
    szString: [80]WCHAR,
    hbmpItem: HBITMAP,
};

pub const PIMEMENUITEMINFOW = ?*IMEMENUITEMINFOW;
pub const NPIMEMENUITEMINFOW = ?*IMEMENUITEMINFOW;
pub const LPIMEMENUITEMINFOW = ?*IMEMENUITEMINFOW;
pub const IMECHARPOSITION = extern struct {
    dwSize: DWORD,
    dwCharPos: DWORD,
    pt: POINT,
    cLineHeight: UINT,
    rcDocument: RECT,
};

pub const PIMECHARPOSITION = ?*IMECHARPOSITION;
pub const NPIMECHARPOSITION = ?*IMECHARPOSITION;
pub const LPIMECHARPOSITION = ?*IMECHARPOSITION;
pub const IMCENUMPROC = ?extern fn(HIMC, LPARAM) BOOL;
pub const REGISTERWORDENUMPROCA = ?extern fn(LPCSTR, DWORD, LPCSTR, LPVOID) c_int;
pub const REGISTERWORDENUMPROCW = ?extern fn(LPCWSTR, DWORD, LPCWSTR, LPVOID) c_int;
pub const WriteSizeTRaw = WriteULongPtrRaw;
pub const NCRYPT_RSA_ALGORITHM_GROUP = NCRYPT_RSA_ALGORITHM;
pub const uuid_t = UUID;
pub const onexit_t = _onexit_t;
pub const LPPROPSHEETPAGE_V4 = LPPROPSHEETPAGEA_V4;
pub const LPPROPSHEETPAGE_V1 = LPPROPSHEETPAGEA_V1;
pub const LPPROPSHEETPAGE_LATEST = LPPROPSHEETPAGEA_LATEST;
pub const LPPROPSHEETPAGE_V3 = LPPROPSHEETPAGEA_V3;
pub const LPPROPSHEETPAGE_V2 = LPPROPSHEETPAGEA_V2;
pub const rpc_binding_handle_t = RPC_BINDING_HANDLE;
pub const OPENCARDNAMEW_EX = OPENCARDNAME_EXW;
pub const LPOINETPRIORITY = LPIINTERNETPRIORITY;
pub const CFORCEINLINE = FORCEINLINE;
pub const ReadSizeTAcquire = ReadULongPtrAcquire;
pub const SECURITY_MIN_IMPERSONATION_LEVEL = SecurityAnonymous;
pub const WriteSizeTRelease = WriteULongPtrRelease;
pub const LPOINETPROTOCOLINFO = LPIINTERNETPROTOCOLINFO;
pub const LPOINETBINDINFO = LPIINTERNETBINDINFO;
pub const INTERFACE = IPrintDialogCallback;
pub const IOInetProtocolRoot = IInternetProtocolRoot;
pub const IOInetProtocolSinkStackable = IInternetProtocolSinkStackable;
pub const SECURITY_MAX_IMPERSONATION_LEVEL = SecurityDelegation;
pub const NTAPI_INLINE = NTAPI;
pub const InterlockedCompareExchangeRelease64 = InterlockedCompareExchange64;
pub const LPOINET = LPIINTERNET;
pub const LPOINETPROTOCOL = LPIINTERNETPROTOCOL;
pub const InterlockedCompareExchangeAcquire64 = InterlockedCompareExchange64;
pub const WINCRYPT32STRINGAPI = WINCRYPT32API;
pub const __WINT_TYPE__ = c_int;
pub const DEFAULT_IMPERSONATION_LEVEL = SecurityImpersonation;
pub const __INT_LEAST32_TYPE__ = c_int;
pub const NCRYPT_DSA_ALGORITHM_GROUP = NCRYPT_DSA_ALGORITHM;
pub const ReadSizeTRaw = ReadULongPtrRaw;
pub const __INT32_TYPE__ = c_int;
pub const IOInetProtocolEx = IInternetProtocolEx;
pub const ASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION = ASSEMBLY_FILE_DETAILED_INFORMATION;
pub const OPENCARDNAMEA_EX = OPENCARDNAME_EXA;
pub const SCARD_READERSTATE_W = SCARD_READERSTATEW;
pub const rpc_binding_vector_t = RPC_BINDING_VECTOR;
pub const _PROPSHEETPAGEW_V4 = _PROPSHEETPAGEW;
pub const OPENCARDNAME_W = OPENCARDNAMEW;
pub const _ASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION = _ASSEMBLY_FILE_DETAILED_INFORMATION;
pub const IOInetProtocol = IInternetProtocol;
pub const InterlockedExchangeNoFence64 = InterlockedExchange64;
pub const LPOINETPROTOCOLSINK = LPIINTERNETPROTOCOLSINK;
pub const POPENCARDNAMEA_EX = POPENCARDNAME_EXA;
pub const PSCARD_READERSTATE_A = PSCARD_READERSTATEA;
pub const LPOINETPROTOCOLROOT = LPIINTERNETPROTOCOLROOT;
pub const IOInetProtocolInfo = IInternetProtocolInfo;
pub const DEVICE_TYPE = DWORD;
pub const LPOPENCARDNAME_A = LPOPENCARDNAMEA;
pub const SCARD_READERSTATE_A = SCARD_READERSTATEA;
pub const OPENCARDNAME_A = OPENCARDNAMEA;
pub const LPSCARD_READERSTATE_W = LPSCARD_READERSTATEW;
pub const LPOPENCARDNAMEW_EX = LPOPENCARDNAME_EXW;
pub const _PROPSHEETPAGEA_V4 = _PROPSHEETPAGEA;
pub const IOInetBindInfo = IInternetBindInfo;
pub const PSCARD_READERSTATE_W = PSCARD_READERSTATEW;
pub const PROPSHEETPAGE_V1 = PROPSHEETPAGEA_V1;
pub const WS_TILEDWINDOW = WS_OVERLAPPEDWINDOW;
pub const PROPSHEETPAGE_V3 = PROPSHEETPAGEA_V3;
pub const PROPSHEETPAGE_V2 = PROPSHEETPAGEA_V2;
pub const IOInetThreadSwitch = IInternetThreadSwitch;
pub const LPSCARD_READERSTATE_A = LPSCARD_READERSTATEA;
pub const PROPSHEETPAGE_V4 = PROPSHEETPAGEA_V4;
pub const PCASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION = PCASSEMBLY_FILE_DETAILED_INFORMATION;
pub const LPOINETSESSION = LPIINTERNETSESSION;
pub const LPCPROPSHEETPAGE_LATEST = LPCPROPSHEETPAGEA_LATEST;
pub const IOInetProtocolSink = IInternetProtocolSink;
pub const LPOPENCARDNAME_W = LPOPENCARDNAMEW;
pub const LPCPROPSHEETPAGE_V4 = LPCPROPSHEETPAGEA_V4;
pub const IOInetSession = IInternetSession;
pub const __CRTDECL = __CLRCALL_PURE_OR_CDECL;
pub const LPCPROPSHEETPAGE_V1 = LPCPROPSHEETPAGEA_V1;
pub const InterlockedCompareExchangeNoFence64 = InterlockedCompareExchange64;
pub const LPCPROPSHEETPAGE_V2 = LPCPROPSHEETPAGEA_V2;
pub const LPCPROPSHEETPAGE_V3 = LPCPROPSHEETPAGEA_V3;
pub const IOInet = IInternet;
pub const WINAPI_INLINE = WINAPI;
pub const InterlockedOrAffinity = InterlockedOr64;
pub const POPENCARDNAME_W = POPENCARDNAMEW;
pub const __INT_FAST32_TYPE__ = c_int;
pub const NCRYPT_AES_ALGORITHM_GROUP = NCRYPT_AES_ALGORITHM;
pub const EXPENTRY = CALLBACK;
pub const ACTIVATIONCONTEXTINFOCLASS = ACTIVATION_CONTEXT_INFO_CLASS;
pub const InterlockedExchangeAcquire64 = InterlockedExchange64;
pub const APIENTRY = WINAPI;
pub const LPOINETTHREADSWITCH = LPIINTERNETTHREADSWITCH;
pub const LPOPENCARDNAMEA_EX = LPOPENCARDNAME_EXA;
pub const VOID = void;
pub const PROPSHEETPAGE_LATEST = PROPSHEETPAGEA_LATEST;
pub const NCRYPT_RC2_ALGORITHM_GROUP = NCRYPT_RC2_ALGORITHM;
pub const POPENCARDNAME_A = POPENCARDNAMEA;
pub const POPENCARDNAMEW_EX = POPENCARDNAME_EXW;
pub const WriteSizeTNoFence = WriteULongPtrNoFence;
pub const InterlockedAndAffinity = InterlockedAnd64;
pub const PFORCEINLINE = FORCEINLINE;
pub const NCRYPT_DH_ALGORITHM_GROUP = NCRYPT_DH_ALGORITHM;
pub const uuid_vector_t = UUID_VECTOR;
pub const STKFORCEINLINE = FORCEINLINE;
pub const PASSEMBLY_DLL_REDIRECTION_DETAILED_INFORMATION = PASSEMBLY_FILE_DETAILED_INFORMATION;
pub const IOInetBindInfoEx = IInternetBindInfoEx;
pub const ReadSizeTNoFence = ReadULongPtrNoFence;
pub const WINPATHCCHAPI = WINBASEAPI;
pub const IOInetPriority = IInternetPriority;
pub const RPC_MGR_EPV = void;






































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































