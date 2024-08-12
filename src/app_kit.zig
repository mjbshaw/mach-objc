const ns = @import("foundation.zig");
const objc = @import("objc.zig");

/// `NSBackingStoreType`
pub const BackingStoreType = enum(usize) {
    /// `NSBackingStoreRetained`
    nsbacking_store_retained = 0,
    /// `NSBackingStoreNonretained`
    nsbacking_store_nonretained = 1,
    /// `NSBackingStoreBuffered`
    nsbacking_store_buffered = 2,
    _,
};

/// `NSWindowStyleMask`
pub const WindowStyleMask = enum(usize) {
    /// `NSWindowStyleMaskBorderless`
    borderless = 0,
    /// `NSWindowStyleMaskTitled`
    titled = 1,
    /// `NSWindowStyleMaskClosable`
    closable = 2,
    /// `NSWindowStyleMaskMiniaturizable`
    miniaturizable = 4,
    /// `NSWindowStyleMaskResizable`
    resizable = 8,
    /// `NSWindowStyleMaskTexturedBackground`
    textured_background = 256,
    /// `NSWindowStyleMaskUnifiedTitleAndToolbar`
    unified_title_and_toolbar = 4096,
    /// `NSWindowStyleMaskFullScreen`
    full_screen = 16384,
    /// `NSWindowStyleMaskFullSizeContentView`
    full_size_content_view = 32768,
    /// `NSWindowStyleMaskUtilityWindow`
    utility_window = 16,
    /// `NSWindowStyleMaskDocModalWindow`
    doc_modal_window = 64,
    /// `NSWindowStyleMaskNonactivatingPanel`
    nonactivating_panel = 128,
    /// `NSWindowStyleMaskHUDWindow`
    hudwindow = 8192,
    _,
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
};

/// `NSApplicationDelegate`
pub const ApplicationDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const as = InternalInfo.as;
};
