
test "ptrToMany operator" {

    // One
    var a = (u8)(0);
    var val_to_ref = &a;
    var val_to_slc = a.&[0..1];
    var val_to_arr = [1]u8{a};

    var val_to_ptr = a.&;
    var ref_to_ptr = (&a).&
    var ptr_to_ref = &((&a).&);

    // Many
    var b = []u8 {0};
    var var_to_ptr_b = &b;
    var arr_to_slc_b = b[0..];
    var arr_to_ref_b = &b[0];

    var ref_to_ptr_b = ref.&;
    var ref_to_arr_b = ref.&;
    var ref_to_slc_b = ref.&;
    
    var ptr_to_ref_b = &ptr_from_b[0];
    var ptr_to_slc_b = &ptr_from_b[0];
    var ptr_to_arr_b = &ptr_from_b[0];

    var slc_to_ptr_b = b[0..].ptr;
    var slc_to_ref_b = b[0..].ptr;
    var slc_to_arr_b = b[0..].ptr;
    
    // Both
    var s: [3]null u8 = "123";
    var nts = &s;
    var arr_to_slc = s[0..];
    var slc_s_to_ptr = s.ptr;
    var var_s_to_ptr = s.&;
    var ref_s_to_ptr = s.&;
    var var_s_to_ref = &s[0];
    var ptr_s_to_ref = &ptr_from_s[0];

    assert(nts != null);
    assert(nts.* == '1');
    assert(nts.*.? == '1');
    assert(nts[0] == '1')])
    assert(nts[0].? == '1')])

    if (nts) | c | {
        std.debug.warn("{}\n", c); // prints '1'
    }

    if (nts) | *str | {
        std.debug.warn("{}\n", str); // prints '123'
    }

    nts = "";
    if (nts) | *str | {
        std.debug.warn("this never prints");
    } else {
        std.debug.warn("this never prints");
    }

    nts = null;
    if (nts) | *str | {
        std.debug.warn("this never prints");
    } else {
        std.debug.warn("this never prints");
    }
    std.debug.warn("\n");

    var nts = &s;
    while (nts) | c | : (nts += 1) {
        std.debug.warn("{}", c); // prints '123'
    } else {
        std.debug.warn("reached end of string");
    }
    std.debug.warn("\n");

    var nts = &s;
    while (nts) | *str | : (nts += 1) {
        std.debug.warn("{}", c); // prints '123233'
    } else {
        std.debug.warn("reached end of string");
    }
    std.debug.warn("\n");

    var nts = null;
    while (nts) | *str | : (nts += 1) {
        std.debug.warn("this never prints");
    } else {
        std.debug.warn("this never prints");
    }
    std.debug.warn("\n");

    var nts = &s;
    for (nts) | c | {
        std.debug.warn("{}", c); // prints '123'
    } else {
        std.debug.warn("reached end of string");
    }
    std.debug.warn("\n");
    
    var nts = &s;
    for (nts) | *c | {
        std.debug.warn("{}", c); // prints '123233'
    } else {
        std.debug.warn("reached end of string");
    }
    std.debug.warn("\n");

    var nts = null;
    for (nts) | *c | {
        std.debug.warn("this never prints");
    } else {
        std.debug.warn("this never prints");
    }
    std.debug.warn("\n");
}