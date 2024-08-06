const builtin = @import("builtin");
const objc = @import("objc.zig");

pub const ColorSpace = opaque {};

// TODO: consider removing `Float` and just using `f64` directly. 32-bit Apple platforms are dead.
pub const Float = if (builtin.target.ptrBitWidth() != 64) f64 else unreachable;

pub const Point = extern struct {
    x: Float,
    y: Float,
};

pub const Size = extern struct {
    width: Float,
    height: Float,
};

pub const Rect = extern struct {
    origin: Point,
    size: Size,
};
