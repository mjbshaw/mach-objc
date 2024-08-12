const std = @import("std");
const objc = @import("objc.zig");
const ns = @import("foundation.zig");

/// `UIApplication`
pub const Application = opaque {
    pub const InternalInfo = objc.ExternClass("UIApplication", ns.Object);

    /// `+[UIApplication sharedApplication]`
    pub fn sharedApplication() *Application {
        return objc.msgSend(InternalInfo.objcClass(), "sharedApplication", *Application, .{});
    }

    /// `-[UIApplication delegate]`
    pub fn delegate(self: *Application) ?*ApplicationDelegate {
        return objc.msgSend(self, "delegate", ?*ApplicationDelegate, .{});
    }

    /// `-[UIApplication setDelegate:]`
    pub fn setDelegate(self: *Application, delegate_object: ?*ApplicationDelegate) void {
        objc.msgSend(self, "setDelegate:", void, .{delegate_object});
    }
};

/// `UIApplicationDelegate`
pub const ApplicationDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(ApplicationDelegate, ns.ObjectProtocol);
    pub const as = InternalInfo.as;
};

pub const applicationMain = UIApplicationMain;
extern fn UIApplicationMain(argc: c_int, argv: *?*c_char, principal_class_name: ?*ns.String, delegate_class_name: ?*ns.String) c_int;
