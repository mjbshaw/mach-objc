const objc = @import("objc.zig");
const ns = @import("foundation.zig");

/// `IOSurface`
pub const Surface = opaque {
    pub const InternalInfo = objc.ExternClass("IOSurface", @This(), ns.Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
};
