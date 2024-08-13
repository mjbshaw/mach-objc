const ca = @import("quartz_core.zig");
const ns = @import("foundation.zig");
const objc = @import("objc.zig");

/// `NSBackingStoreType`
pub const BackingStoreType = enum(usize) {
    /// `NSBackingStoreRetained`
    retained = 0,
    /// `NSBackingStoreNonretained`
    nonretained = 1,
    /// `NSBackingStoreBuffered`
    buffered = 2,
    _,
};

/// `NSWindowStyleMask`
pub const WindowStyleMask = packed struct(usize) {
    /// `NSWindowStyleMaskTitled`
    titled: bool = false,
    /// `NSWindowStyleMaskClosable`
    closable: bool = false,
    /// `NSWindowStyleMaskMiniaturizable`
    miniaturizable: bool = false,
    /// `NSWindowStyleMaskResizable`
    resizable: bool = false,
    /// `NSWindowStyleMaskUtilityWindow`
    utility_window: bool = false,
    _padding1: u1 = 0,
    /// `NSWindowStyleMaskDocModalWindow`
    doc_modal_window: bool = false,
    /// `NSWindowStyleMaskNonactivatingPanel`
    nonactivating_panel: bool = false,
    _padding2: u4 = 0,
    /// `NSWindowStyleMaskUnifiedTitleAndToolbar`
    unified_title_and_toolbar: bool = false,
    /// `NSWindowStyleMaskHUDWindow`
    hud_window: bool = false,
    /// `NSWindowStyleMaskFullScreen`
    full_screen: bool = false,
    /// `NSWindowStyleMaskFullSizeContentView`
    full_size_content_view: bool = false,
    _padding3: u48 = 0,

    pub const borderless = .{};
};

/// `NSResponder`
pub const Responder = opaque {
    pub const InternalInfo = objc.ExternClass("NSResponder", @This(), ns.Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
};

/// `NSApplication`
pub const Application = opaque {
    pub const InternalInfo = objc.ExternClass("NSApplication", @This(), Responder);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
    /// `+[NSApplication new]`
    pub const new = InternalInfo.new;
    /// `+[NSApplication alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[NSApplication alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[NSApplication run]
    pub fn run(self: *@This()) void {
        return objc.msgSend(self, "run", void, .{});
    }
    /// `+[NSApplication sharedApplication]
    pub fn sharedApplication() *Application {
        return objc.msgSend(InternalInfo.class(), "sharedApplication", *Application, .{});
    }
    /// `-[NSApplication setDelegate:]
    pub fn setDelegate(self: *@This(), delegate: ?*ApplicationDelegate) void {
        return objc.msgSend(self, "setDelegate:", void, .{delegate});
    }
};

/// `NSWindow`
pub const Window = opaque {
    pub const InternalInfo = objc.ExternClass("NSWindow", @This(), Responder);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
    /// `+[NSWindow new]`
    pub const new = InternalInfo.new;
    /// `+[NSWindow alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[NSWindow alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[NSWindow initWithContentRect:styleMask:backing:defer:screen:]
    pub fn initWithContentRect_styleMask_backing_defer_screen(self: *@This(), content_rect: ns.Rect, style: WindowStyleMask, backing_store_type: BackingStoreType, flag: bool, screen: ?*Screen) *@This() {
        return objc.msgSend(self, "initWithContentRect:styleMask:backing:defer:screen:", *@This(), .{ content_rect, style, backing_store_type, flag, screen });
    }
    /// `-[NSWindow isReleasedWhenClosed]`
    pub fn releasedWhenClosed(self: *Window) bool {
        return objc.msgSend(self, "isReleasedWhenClosed", bool, .{});
    }
    /// `-[NSWindow setReleasedWhenClosed:]`
    pub fn setReleasedWhenClosed(self: *Window, release_when_closed: bool) void {
        return objc.msgSend(self, "setReleasedWhenClosed:", void, .{release_when_closed});
    }
    /// `-[NSWindow contentView]`
    pub fn contentView(self: *Window) *View {
        return objc.msgSend(self, "contentView", *View, .{});
    }
    /// `-[NSWindow setContentView:]`
    pub fn setContentView(self: *Window, view: *View) void {
        return objc.msgSend(self, "setContentView:", void, .{view});
    }
    /// `-[NSWindow setIsVisible:]`
    pub fn setIsVisible(self: *Window, visible: bool) void {
        return objc.msgSend(self, "setIsVisible:", void, .{visible});
    }
    /// `-[NSWindow makeKeyAndOrderFront:]`
    pub fn makeKeyAndOrderFront(self: *Window, sender: ?*objc.Id) void {
        return objc.msgSend(self, "makeKeyAndOrderFront:", void, .{sender});
    }
};

/// `NSView`
pub const View = opaque {
    pub const InternalInfo = objc.ExternClass("NSView", @This(), Responder);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
    /// `+[NSView new]`
    pub const new = InternalInfo.new;
    /// `+[NSView alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[NSView alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    pub fn layer(self: *View) *ca.Layer {
        return objc.msgSend(self, "layer", *ca.Layer, .{});
    }
    pub fn setLayer(self: *View, value: *ca.Layer) void {
        return objc.msgSend(self, "setLayer:", void, .{value});
    }
};

/// `NSScreen`
pub const Screen = opaque {
    pub const InternalInfo = objc.ExternClass("NSScreen", @This(), ns.Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
    /// `+[NSScreen new]`
    pub const new = InternalInfo.new;
    /// `+[NSScreen alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[NSScreen alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[NSScreen screens]
    pub fn screens() *ns.Array(Screen) {
        return objc.msgSend(InternalInfo.class(), "screens", *ns.Array(Screen), .{});
    }
    /// `+[NSScreen mainScreen]
    pub fn mainScreen() ?*Screen {
        return objc.msgSend(InternalInfo.class(), "mainScreen", ?*Screen, .{});
    }
};

/// `NSApplicationDelegate`
pub const ApplicationDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
};
