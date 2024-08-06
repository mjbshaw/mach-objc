const objc = @import("objc.zig");
const ns = @import("foundation.zig");

/// `IOSurface`
pub const Surface = opaque {
    pub const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub const as = InternalInfo.as;
};
