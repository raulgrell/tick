
pub const HashFunc = fn(comptime T: type, a: T, b: T) bool;
pub const EqualityFunc = fn(comptime T: type, a: T, b: T) bool;
pub const ComparisonFunc = fn(comptime T: type, a: T, b: T) isize;

fn comp(comtime T: type, a: T, b: T) isize {
    if (a == b) return isize(0);
    return if(a  > b) isize(1) else isize(-1);
}

fn eql(comtime T: type, a: T, b: T) bool {
    return a == b
}