const ca = @import("quartz_core.zig");
const ns = @import("foundation.zig");
const objc = @import("objc.zig");
const std = @import("std");

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

/// `NSEventType`
pub const EventType = enum(usize) {
    left_mouse_down = 1,
    left_mouse_up = 2,
    right_mouse_down = 3,
    right_mouse_up = 4,
    mouse_moved = 5,
    left_mouse_dragged = 6,
    right_mouse_dragged = 7,
    mouse_entered = 8,
    mouse_exited = 9,
    key_down = 10,
    key_up = 11,
    flags_changed = 12,
    app_kit_defined = 13,
    system_defined = 14,
    application_defined = 15,
    periodic = 16,
    cursor_update = 17,
    rotate = 18,
    begin_gesture = 19,
    end_gesture = 20,
    scroll_wheel = 22,
    tablet_point = 23,
    tablet_proximity = 24,
    other_mouse_down = 25,
    other_mouse_up = 26,
    other_mouse_dragged = 27,
    gesture = 29,
    magnify = 30,
    swipe = 31,
    smart_magnify = 32,
    quick_look = 33,
    pressure = 34,
    direct_touch = 37,
    change_mode = 38,
    _,
};

/// `NSEventMask`
pub const EventMask = packed struct(u64) {
    left_mouse_down: bool = false,
    left_mouse_up: bool = false,
    right_mouse_down: bool = false,
    right_mouse_up: bool = false,
    mouse_moved: bool = false,
    left_mouse_dragged: bool = false,
    right_mouse_dragged: bool = false,
    mouse_entered: bool = false,
    mouse_exited: bool = false,
    key_down: bool = false,
    key_up: bool = false,
    flags_changed: bool = false,
    app_kit_defined: bool = false,
    system_defined: bool = false,
    application_defined: bool = false,
    periodic: bool = false,
    cursor_update: bool = false,
    rotate: bool = false,
    begin_gesture: bool = false,
    end_gesture: bool = false,
    _padding1: u1 = 0,
    scroll_wheel: bool = false,
    tablet_point: bool = false,
    tablet_proximity: bool = false,
    other_mouse_down: bool = false,
    other_mouse_up: bool = false,
    other_mouse_dragged: bool = false,
    _padding2: u1 = 0,
    gesture: bool = false,
    magnify: bool = false,
    swipe: bool = false,
    smart_magnify: bool = false,
    _padding3: u1 = 0,
    pressure: bool = false,
    _padding4: u2 = 0,
    direct_touch: bool = false,
    change_mode: bool = false,
    _padding5: u26 = 0,

    pub const any: EventMask = @bitCast(@as(u64, std.math.maxInt(u64)));
};

/// `NSRunLoopMode`
pub const RunLoopMode = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;

    // TODO: Should we keep using aliases? See https://github.com/ziglang/zig/issues/19515
    /// `NSDefaultRunLoopMode`
    pub const default = @extern(*const *RunLoopMode, .{ .name = "NSDefaultRunLoopMode" });
    /// `NSEventTrackingRunLoopMode`
    pub const event_tracking = @extern(*const *RunLoopMode, .{ .name = "NSEventTrackingRunLoopMode" });
    /// `NSModalPanelRunLoopMode`
    pub const modal_panel = @extern(*const *RunLoopMode, .{ .name = "NSModalPanelRunLoopMode" });
    /// `NSConnectionReplyMode`
    pub const connection_reply = @extern(*const *RunLoopMode, .{ .name = "NSConnectionReplyMode" });
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

    // `-[NSApplication nextEventMatchingMask:untilDate:inMode:dequeue:]`
    pub fn nextEventMatchingMask(self: *@This(), mask: EventMask, expiration: ?*ns.Date, mode: *RunLoopMode, dequeue: bool) ?*Event {
        return objc.msgSend(self, "nextEventMatchingMask:untilDate:inMode:dequeue:", ?*Event, .{ mask, expiration, mode, dequeue });
    }

    // `-[NSApplication sendEvent:]`
    pub fn sendEvent(self: *@This(), event: *Event) void {
        return objc.msgSend(self, "sendEvent:", void, .{event});
    }
    // `-[NSApplication updateWindows]`
    pub fn updateWindows(self: *@This()) void {
        return objc.msgSend(self, "updateWindows", void, .{});
    }
};

/// `NSEvent`
pub const Event = opaque {
    pub const InternalInfo = objc.ExternClass("NSEvent", @This(), ns.Object);
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

    /// `-[NSEvent type]
    pub fn eventType(self: *@This()) EventType {
        return objc.msgSend(self, "type", EventType, .{});
    }
    /// `-[NSEvent timestamp]
    pub fn timestamp(self: *@This()) ns.TimeInterval {
        return objc.msgSend(self, "timestamp", ns.TimeInterval, .{});
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

/// `NSApplicationMain`
pub const applicationMain = NSApplicationMain;
extern fn NSApplicationMain(argc: c_int, argv: **c_char) c_int;
