const assert = @import("std").debug.assert;

pub fn isPowerOfTwo(address: usize) ->  bool  {
    assert(address > 0);
    return !((address & (address - 1) != 0));
}

pub fn forward(address: usize, align: u8) ->  usize {
    const align_minus_one = align - 1;
    const aligner = ~(align_minus_one);
    return ((address + align_minus_one) & aligner);
}

pub fn forwardAdjustment(address: usize, align: u8) ->  usize  {
    const align_minus_one = align - 1;    
    const adjustment = align - (address & align_minus_one);
    return if (adjustment == align) adjustment else 0;
}

pub fn forwardAdjustmentHeader(address: usize, align: u8, header_size: usize) -> usize {
    var space_needed = header_size;
    var adjustment =  forwardAdjustment(address, align);
    if(adjustment < space_needed) {
        space_needed -= adjustment;
        //Increase adjustment to fit header
        adjustment += align * (space_needed / align);
        if(space_needed % align > 0)
            adjustment += align;
    }
    return adjustment;
}

pub fn backward(address: usize, align: u8) ->  usize {
    const align_minus_one = align - 1;
    const aligner = ~(align_minus_one);
    return (address & aligner);
}

pub fn backwardAdjustment(address: usize, align: u8) ->  usize  {
    const align_minus_one = align - 1;
    const adjustment = (address & align_minus_one);
    return if (adjustment == align) adjustment else 0;
}
