const ns = @import("foundation.zig");
const objc = @import("objc");

/// `NSApplication`
pub const Application = opaque {
    pub const InternalInfo = objc.ExternClass("NSApplication", @This(), ns.Object);

    pub const as = InternalInfo.as;

    /// `+[NSApplication sharedApplication]`
    pub fn sharedApplication() *Application {
        return objc.msgSend(InternalInfo.class(), "sharedApplication", *Application, .{});
    }

    /// `-[NSApplication run]`
    pub fn run(self: *Application) void {
        objc.msgSend(self, "run", void, .{});
    }

    /// `-[NSApplication stop:]`
    pub fn stop(self: *Application, sender: *objc.id) void {
        objc.msgSend(self, "stop:", void, .{sender});
    }

    /// `-[NSApplication delegate]`
    pub fn delegate(self: *Application) ?*ApplicationDelegate {
        return objc.msgSend(self, "delegate", ?*ApplicationDelegate, .{});
    }

    /// `-[NSApplication setDelegate:]`
    pub fn setDelegate(self: *Application, delegate_object: ?*ApplicationDelegate) void {
        return objc.msgSend(self, "setDelegate:", void, .{delegate_object});
    }
};

/// `NSApplicationDelegate`
pub const ApplicationDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), objc.ObjectProtocol);

    pub const as = InternalInfo.as;
};
