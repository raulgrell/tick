const io = @import("std").io;
const mem = @import("std").mem;
const assert = @import("std").debug.assert;

use @import("parse.zig");

const math = @import("std").math;

const Cursor = @import("memory.zig").Cursor;

const powers_of_ten = []f64 {
    1.0e1, 1.0e2, 1.0e4, 1.0e8, 1.0e16, 1.0e32, 1.0e64, 1.0e128, 1.0e256
};

pub fn parseFloat(string: []const u8) -> f64 {
    // Trim leading whitespace
    var cursor = Cursor(u8).init(string);
    while (isSpace(cursor.peek())) cursor.advance();

    // Check for negative
    var negative = if (cursor.match('-')) { true } else {
        _ = cursor.match('+');
        false
    };

    // Find length of mantissa and index of decimal
    var mantissa_start = cursor.data;
    var mantissa_len = usize(0); // Includes decimal point
    var decimal_index = usize(0);

    while(true) : (mantissa_len += 1) {
        const c = cursor.peek();
        if (!isNum(c)) {
            if ((c != '.') or (decimal_index > 0)) {
                break;
            }
            decimal_index = mantissa_len;
        }
        cursor.advance();
    }

    var cursor_exp = cursor.data;
    cursor.data = mantissa_start;

    // Remove decimal point
    if (decimal_index < 0) { decimal_index = mantissa_len; } else { mantissa_len -= 1; }

    var fraction_exp = if (mantissa_len > 18) {
        mantissa_len = 18;
        isize(decimal_index) - 18
    } else {
        isize(decimal_index) - isize(mantissa_len)
    };

    // Compute floating point fraction
    var fraction = f64(0);
    if (mantissa_len == 0) {
        fraction = 0.0;
        cursor.data = string;
        // goto done;
    } else {
        var frac = u64(0);
        while (mantissa_len > 0) : (mantissa_len -= 1) {
            var c = cursor.next();
            if (c == '.') c = cursor.next();
            frac = 10 * frac + (c - '0');
        }
        fraction = f64(frac);
    }

    // Exponent
    var exp = isize(0);
    var negative_exp = false;

    cursor.data = cursor_exp;

    if (cursor.match('E') or cursor.match('e')) {
        negative_exp = if (cursor.match('-')) { true } else {
            _ = cursor.match('+');
            false
        };

        if (!isNum(cursor.peek())) {
            cursor.data = cursor_exp;
            // goto done;
        }

        while (cursor.data.len > 0 and isNum(cursor.peek())) {
            exp = exp * 10 + isize(cursor.peek() - '0');
            cursor.advance();
        }
    }

    exp = if (negative_exp) { fraction_exp - exp } else { fraction_exp + exp };

    negative_exp = if (exp >= 0) { false } else {
        exp = -exp;
        true
    };

    var dblExp = f64(1.0);
    { var i = usize(0) ; while (exp != 0) : ({exp >>= 1;  i += 1}) {
        if (exp & 1 != 0) {
            dblExp *= powers_of_ten[i];
        }
    }}

    if (negative_exp) { fraction /= dblExp; } else { fraction *= dblExp; }

    // Set tail to rest of input
    // if (cursor.data.len != 0 and tail != null) tail = cursor.data;

    return if (negative) -fraction else fraction;
}

test "parseFloat" {
    const a = parseFloat("1.234434e3");
    const b = 1.234434e3;
    assert (a == b);
}

const PRECISION = 8;

pub fn formatFloat(str: []u8, num: f64) -> []const u8 {
    var n = num;
    var index = usize(0);    
    if (math.isNan(n)) {
        mem.copy(u8, str, "NaN");
        index = 3;
    } else if (math.isInf(n)) {
        mem.copy(u8, str, "Inf");
        index = 3;        
    } else if (n == 0.0) {
        mem.copy(u8, str, "0.0");
        index = 3;       
    } else {
        const is_negative = n < 0;
        if (is_negative) n = -n;

        const whole_part = i64(n);
        const magnitude = usize(math.log(10, n));

        if (is_negative) {
            str[index] = '-';
            index += 1;
        }

        // Extract whole part
        var digit = u8(0);
        var weight = f64(0);
        index += magnitude;
        { var i = usize(1); while (i < usize(magnitude) + 2) : (i += 1) {
            weight = math.pow(f64, 10, f64(i));
            const rem = @mod(whole_part, i64(weight));
            digit = u8(@divTrunc(rem - i64(digit), @divTrunc(i64(weight), 10)));
            str[index] = digit + '0';
            if (index == 0)
                break;
            index -= 1;
        }}

        index = if (is_negative) magnitude + 2 else magnitude + 1;
        str[index] = '.';

        // Extract fractional part
        const fraction_part = f64(n - f64(whole_part));
        var tmp = f64(0);
        var tmp1 = fraction_part;
        { var i = usize(1); while(i < PRECISION) : (i += 1) {
            weight = 10; 
            tmp = tmp1 * weight;
            digit = u8(tmp);
            index += 1;
            str[index] = digit + '0';
            tmp1 = tmp - f64(digit);
        }}
    }

    return str[0..index];
}

test "formatFloat" {
    var b = []u8 {'0'} ** 20;
    const a = formatFloat(b[0..], -1.234434e3);
    %%io.stdout.printf("{}", a)
}

// const Float = struct {
//     union {
//         u: u32,
//         f: float,
//         parts: struct {
//             u32 mantissa : 23;
//             u32 exponent : 8;
//             u32 sign : 1;
//         };
//     }

//     pub fn init(float num = 0.0f) -> Float_t {f(num)}
//     pub fn negative() -> bool { return (i >> 31) != 0; }
//     pub fn rawMantissa() -> int32_t { return i & ((1 << 23) - 1); }
//     pub fn rawExponent() -> int32_t { return (i >> 23) & 0xFF; }
// };

// const Double = struct {
//     union {
//         u: u64,
//         f: float,
//         parts: struct {
//             u64 mantissa : 23;
//             u64 exponent : 8;
//             u64 sign : 1;
//         };
//     }

//     pub fn init(float num = 0.0f) -> Float_t {f(num)}
//     pub fn negative() -> bool { return (i >> 31) != 0; }
//     pub fn rawMantissa() -> int32_t { return i & ((1 << 23) - 1); }
//     pub fn rawExponent() -> int32_t { return (i >> 23) & 0xFF; }
// };