pub fn RelativePtr(comptime T: type)type {
    struct {
        base: usize,
        offset: T,
    }
}

pub fn SmallVector(comptime T: type, comptime S: size)type {
    struct {
        data: [S]T,
    }
}

