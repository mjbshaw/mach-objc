const cg = @import("core_graphics.zig");
const mtl = @import("metal.zig");
const ns = @import("foundation.zig");
const objc = @import("objc.zig");

/// `CALayer`
pub const Layer = opaque {
    pub const InternalInfo = objc.ExternClass("CALayer", @This(), ns.Object);

    pub const as = InternalInfo.as;

    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;
};

/// `CAMetalDrawable`
pub const MetalDrawable = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), mtl.Drawable);

    pub const as = InternalInfo.as;

    pub fn texture(self: *MetalDrawable) *mtl.Texture {
        return objc.msgSend(self, "texture", *mtl.Texture, .{});
    }

    pub fn layer(self: *MetalDrawable) *MetalLayer {
        return objc.msgSend(self, "layer", *MetalLayer, .{});
    }
};

/// `CAMetalLayer`
pub const MetalLayer = opaque {
    pub const InternalInfo = objc.ExternClass("CAMetalLayer", @This(), Layer);

    pub const as = InternalInfo.as;

    pub const new = InternalInfo.new;
    pub const alloc = InternalInfo.alloc;
    pub const allocInit = InternalInfo.allocInit;

    /// `-[CAMetalLayer nextDrawable]`
    pub fn nextDrawable(self: *MetalLayer) ?*MetalDrawable {
        return objc.msgSend(self, "nextDrawable", ?*MetalDrawable, .{});
    }

    /// `-[CAMetalLayer device]`
    pub fn device(self: *MetalLayer) ?*mtl.Device {
        return objc.msgSend(self, "device", ?*mtl.Device, .{});
    }

    /// `-[CAMetalLayer setDevice:]`
    pub fn setDevice(self: *MetalLayer, dev: ?*mtl.Device) void {
        return objc.msgSend(self, "setDevice:", void, .{dev});
    }

    /// `-[CAMetalLayer pixelFormat]`
    pub fn pixelFormat(self: *MetalLayer) mtl.PixelFormat {
        return objc.msgSend(self, "pixelFormat", mtl.PixelFormat, .{});
    }
    /// `-[CAMetalLayer setPixelFormat:]`
    pub fn setPixelFormat(self: *MetalLayer, fmt: mtl.PixelFormat) void {
        return objc.msgSend(self, "setPixelFormat:", void, .{fmt});
    }

    /// `-[CAMetalLayer framebufferOnly]`
    pub fn framebufferOnly(self: *MetalLayer) bool {
        return objc.msgSend(self, "framebufferOnly", bool, .{});
    }
    /// `-[CAMetalLayer setFramebufferOnly:]`
    pub fn setFramebufferOnly(self: *MetalLayer, fb_only: bool) void {
        return objc.msgSend(self, "setFramebufferOnly:", void, .{fb_only});
    }

    /// `-[CAMetalLayer drawableSize]`
    pub fn drawableSize(self: *MetalLayer) cg.Size {
        return objc.msgSend(self, "drawableSize", cg.Size, .{});
    }
    /// `-[CAMetalLayer setDrawableSize:]`
    pub fn setDrawableSize(self: *MetalLayer, size: cg.Size) void {
        return objc.msgSend(self, "setDrawableSize:", void, .{size});
    }

    /// `-[CAMetalLayer maximumDrawableCount]`
    pub fn maximumDrawableCount(self: *MetalLayer) usize {
        return objc.msgSend(self, "maximumDrawableCount", usize, .{});
    }
    /// `-[CAMetalLayer setMaximumDrawableCount:]`
    pub fn setMaximumDrawableCount(self: *MetalLayer, count: usize) void {
        return objc.msgSend(self, "setMaximumDrawableCount:", void, .{count});
    }

    /// `-[CAMetalLayer displaySyncEnabled]`
    pub fn displaySyncEnabled(self: *MetalLayer) bool {
        return objc.msgSend(self, "displaySyncEnabled", bool, .{});
    }
    /// `-[CAMetalLayer setDisplaySyncEnabled:]`
    pub fn setDisplaySyncEnabled(self: *MetalLayer, enabled: bool) void {
        return objc.msgSend(self, "setDisplaySyncEnabled:", void, .{enabled});
    }
};
