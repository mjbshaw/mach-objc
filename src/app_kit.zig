const c = @import("c.zig");
const ca = @import("quartz_core.zig");
const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");
const cg = @import("core_graphics.zig");
const objc = @import("objc.zig");

pub const applicationMain = NSApplicationMain;
extern fn NSApplicationMain(argc: c_int, argv: [*]*c_char) c_int;

// ------------------------------------------------------------------------------------------------
// Shared

pub const ErrorDomain = ns.ErrorDomain;
pub const ErrorUserInfoKey = ns.ErrorUserInfoKey;
pub const Integer = ns.Integer;
pub const NotificationName = ns.NotificationName;
pub const TimeInterval = ns.TimeInterval;
pub const UInteger = ns.UInteger;
pub const unichar = ns.unichar;
pub const Range = ns.Range;
pub const StringEncoding = ns.StringEncoding;
pub const StringTransform = ns.StringTransform;
pub const StringEncodingDetectionOptionsKey = ns.StringEncodingDetectionOptionsKey;
pub const Array = ns.Array;
pub const String = ns.String;

// ------------------------------------------------------------------------------------------------
// Types

pub const ModalResponse = *String;
pub const PasteboardType = *String;
pub const AboutPanelOptionKey = *String;
pub const ModalSession = *opaque {};
pub const PrintInfoAttributeKey = *String;
pub const Rect = cg.Rect;
pub const Point = cg.Point;
pub const Size = cg.Size;
pub const RunLoopMode = *String;
pub const PrinterPaperName = *String;
pub const PrintJobDispositionValue = *String;
pub const InterfaceStyle = UInteger;
pub const TouchBarItemIdentifier = *String;
pub const TouchBarCustomizationIdentifier = *String;
pub const TouchBarItemPriority = f32;
pub const DeviceDescriptionKey = *String;
pub const PrinterTypeName = *String;
pub const PrintInfoSettingKey = *String;
pub const AccessibilityActionName = *String;
pub const AccessibilityAttributeName = *String;
pub const ExceptionName = *String;
pub const ImageName = *String;
pub const NibName = *String;
pub const WindowFrameAutosaveName = *String;
pub const AccessibilityParameterizedAttributeName = *String;
pub const UserInterfaceItemIdentifier = *String;

pub const BackingStoreType = UInteger;
pub const BackingStoreRetained: BackingStoreType = 0;
pub const BackingStoreNonretained: BackingStoreType = 1;
pub const BackingStoreBuffered: BackingStoreType = 2;

pub const WindowStyleMask = UInteger;
pub const WindowStyleMaskBorderless: WindowStyleMask = 0;
pub const WindowStyleMaskTitled: WindowStyleMask = 1;
pub const WindowStyleMaskClosable: WindowStyleMask = 2;
pub const WindowStyleMaskMiniaturizable: WindowStyleMask = 4;
pub const WindowStyleMaskResizable: WindowStyleMask = 8;
pub const WindowStyleMaskTexturedBackground: WindowStyleMask = 256;
pub const WindowStyleMaskUnifiedTitleAndToolbar: WindowStyleMask = 4096;
pub const WindowStyleMaskFullScreen: WindowStyleMask = 16384;
pub const WindowStyleMaskFullSizeContentView: WindowStyleMask = 32768;
pub const WindowStyleMaskUtilityWindow: WindowStyleMask = 16;
pub const WindowStyleMaskDocModalWindow: WindowStyleMask = 64;
pub const WindowStyleMaskNonactivatingPanel: WindowStyleMask = 128;
pub const WindowStyleMaskHUDWindow: WindowStyleMask = 8192;

pub const Application = opaque {
    pub const InternalInfo = objc.ExternClass("NSApplication", @This(), Responder, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn run(self_: *@This()) void {
        return objc.msgSend(self_, "run", void, .{});
    }
    pub fn sharedApplication() *Application {
        return objc.msgSend(@This().InternalInfo.class(), "sharedApplication", *Application, .{});
    }
    pub fn setDelegate(self_: *@This(), delegate_: ?*ApplicationDelegate) void {
        return objc.msgSend(self_, "setDelegate:", void, .{delegate_});
    }
};

pub const Responder = opaque {
    pub const InternalInfo = objc.ExternClass("NSResponder", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;
};

pub const Window = opaque {
    pub const InternalInfo = objc.ExternClass("NSWindow", @This(), Responder, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn initWithContentRect_styleMask_backing_defer_screen(self_: *@This(), contentRect_: Rect, style_: WindowStyleMask, backingStoreType_: BackingStoreType, flag_: bool, screen_: ?*Screen) *@This() {
        return objc.msgSend(self_, "initWithContentRect:styleMask:backing:defer:screen:", *@This(), .{ contentRect_, style_, backingStoreType_, flag_, screen_ });
    }
    pub fn makeKeyAndOrderFront(self_: *@This(), sender_: ?*objc.Id) void {
        return objc.msgSend(self_, "makeKeyAndOrderFront:", void, .{sender_});
    }
    pub fn contentView(self_: *@This()) ?*View {
        return objc.msgSend(self_, "contentView", ?*View, .{});
    }
    pub fn isReleasedWhenClosed(self_: *@This()) bool {
        return objc.msgSend(self_, "isReleasedWhenClosed", bool, .{});
    }
    pub fn setReleasedWhenClosed(self_: *@This(), releasedWhenClosed_: bool) void {
        return objc.msgSend(self_, "setReleasedWhenClosed:", void, .{releasedWhenClosed_});
    }
    pub fn isVisible(self_: *@This()) bool {
        return objc.msgSend(self_, "isVisible", bool, .{});
    }
    pub fn setIsVisible(self_: *@This(), flag_: bool) void {
        return objc.msgSend(self_, "setIsVisible:", void, .{flag_});
    }
};

pub const Notification = opaque {
    pub const InternalInfo = objc.ExternClass("NSNotification", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn name(self_: *@This()) NotificationName {
        return objc.msgSend(self_, "name", NotificationName, .{});
    }
    pub fn object(self_: *@This()) ?*objc.Id {
        return objc.msgSend(self_, "object", ?*objc.Id, .{});
    }
};

pub const ObjectInterface = opaque {
    pub const InternalInfo = objc.ExternClass("NSObject", @This(), c.object_type, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn copy(self_: *@This()) *objc.Id {
        return objc.msgSend(self_, "copy", *objc.Id, .{});
    }
};

pub const View = opaque {
    pub const InternalInfo = objc.ExternClass("NSView", @This(), Responder, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn layer(self_: *@This()) *ca.Layer {
        return objc.msgSend(self_, "layer", *ca.Layer, .{});
    }
    pub fn setLayer(self_: *@This(), layer_: *ca.Layer) void {
        return objc.msgSend(self_, "setLayer:", void, .{layer_});
    }
};

pub const Screen = opaque {
    pub const InternalInfo = objc.ExternClass("NSScreen", @This(), ObjectInterface, &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;
    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    pub fn screens() *Array(*Screen) {
        return objc.msgSend(@This().InternalInfo.class(), "screens", *Array(*Screen), .{});
    }
    pub fn mainScreen() ?*Screen {
        return objc.msgSend(@This().InternalInfo.class(), "mainScreen", ?*Screen, .{});
    }
};

pub const ApplicationDelegate = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{ ObjectProtocol, ObjectProtocol });
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn applicationDidFinishLaunching(self_: *@This(), notification_: *Notification) void {
        return objc.msgSend(self_, "applicationDidFinishLaunching:", void, .{notification_});
    }
};

pub const ObjectProtocol = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), &.{});
    pub const as = InternalInfo.as;
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn retainCount(self_: *@This()) UInteger {
        return objc.msgSend(self_, "retainCount", UInteger, .{});
    }
};
