const builtin = @import("builtin");
const cg = @import("core_graphics.zig");
const mtl = @import("metal.zig");
const objc = @import("objc.zig");

const BaseView = if (builtin.target.os.tag == .macos) @import("app_kit.zig").View else @import("ui_kit.zig").View;

/// `MTKView`
pub const View = opaque {
    pub const InternalInfo = objc.ExternClass("MTKView", @This(), BaseView);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub const as = InternalInfo.as;

    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    // `-[MTKView initWithFrame:device:]`
    pub fn initWithFrame(self: *View, frame: cg.Rect, dev: ?*mtl.Device) *View {
        return objc.msgSend(self, "initWithFrame:device:", *View, .{ frame, dev });
    }

    pub fn device(self: *View) ?*mtl.Device {
        return objc.msgSend(self, "device", *View, .{});
    }
    pub fn setDevice(self: *View, dev: ?*mtl.Device) void {
        return objc.msgSend(self, "setDevice:", void, .{dev});
    }
    pub fn preferredDevice(self: *View) ?*mtl.Device {
        return objc.msgSend(self, "preferredDevice", *View, .{});
    }
};
