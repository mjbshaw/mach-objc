const builtin = @import("builtin");
const system = @import("system.zig");

pub const Block = system.Block(fn () void);
pub const BlockLiteral = system.BlockLiteral;
pub const BlockLiteralWithSignature = system.BlockLiteralWithSignature;

pub fn stackBlockLiteral(invoke: anytype, context: anytype, comptime copy: ?fn (dst: *BlockLiteral(@TypeOf(context)), src: *const BlockLiteral(@TypeOf(context))) callconv(.C) void, comptime dispose: ?fn (block: *const BlockLiteral(@TypeOf(context))) callconv(.C) void) BlockLiteralWithSignature(@TypeOf(context), fn (*BlockLiteral(@TypeOf(context))) callconv(.C) void) {
    return system.stackBlockLiteral(invoke, context, copy, dispose);
}

pub fn globalBlockLiteral(invoke: anytype, context: anytype) BlockLiteralWithSignature(@TypeOf(context), fn (*BlockLiteral(@TypeOf(context))) callconv(.C) void) {
    return system.globalBlockLiteral(invoke, context);
}

pub fn globalBlock(comptime invoke: fn (*BlockLiteral(void)) callconv(.C) void) *Block {
    return system.globalBlock(invoke);
}

extern fn dispatch_retain(*const anyopaque) void;
extern fn dispatch_release(*const anyopaque) void;

pub const Queue = opaque {
    /// `dispatch_async()`
    pub fn dispatchAsync(self: *const Queue, work: *const Block) void {
        return system.dispatch_async(self, work);
    }

    /// `dispatch_async_f()`
    pub fn dispatchAsyncF(self: *const Queue, context: ?*anyopaque, work: *const fn (context: ?*anyopaque) callconv(.C) void) void {
        return system.dispatch_async_f(self, context, work);
    }

    /// `dispatch_assert_queue()`
    pub fn assert(self: *const Queue) void {
        system.@"dispatch_assert_queue$V2"(self);
    }

    pub fn debugAssert(self: *const Queue) void {
        if (builtin.mode == .Debug or builtin.mode == .ReleaseSafe) {
            self.assert();
        }
    }

    /// `dispatch_retain()`
    pub fn retain(self: *const Queue) void {
        dispatch_retain(self);
    }

    /// `dispatch_release()`
    pub fn release(self: *const Queue) void {
        dispatch_release(self);
    }
};

/// `dispatch_get_main_queue()`
pub inline fn getMainQueue() *Queue {
    return &system._dispatch_main_q;
}

pub const Data = opaque {
    /// `DISPATCH_DATA_DESTRUCTOR_DEFAULT`
    const destructor_default: ?*Block = null;
    /// `DISPATCH_DATA_DESTRUCTOR_FREE`
    const destructor_free = @extern(*Block, .{ .name = "_dispatch_data_destructor_free", .library_name = "System" });
    /// `DISPATCH_DATA_DESTRUCTOR_MUNMAP`
    const destructor_munmap = @extern(*Block, .{ .name = "_dispatch_data_destructor_munmap", .library_name = "System" });

    /// `dispatch_data_create()`
    pub fn create(buffer: []const u8, queue: ?*const Queue, destructor: ?*Block) *const Data {
        return dispatch_data_create(buffer.ptr, buffer.len, queue, destructor);
    }
    extern fn dispatch_data_create(*const anyopaque, usize, ?*const Queue, ?*Block) *const Data;

    /// `dispatch_data_get_size()`
    pub fn size(self: *const Data) usize {
        return dispatch_data_get_size(self);
    }
    extern fn dispatch_data_get_size(*const Data) usize;

    /// `dispatch_data_create_concat()`
    pub fn concat(self: *const Data, tail: *const Data) *const Data {
        return dispatch_data_create_concat(self, tail);
    }
    extern fn dispatch_data_create_concat(*const Data, *const Data) *const Data;

    /// `dispatch_data_apply()`
    pub const Applier = system.Block(fn (region: *const Data, offset: usize, buffer: *const anyopaque, size: usize) bool);
    pub fn apply(self: *const Data, applier: *Applier) bool {
        return dispatch_data_apply(self, applier);
    }
    extern fn dispatch_data_apply(*const Data, *Applier) bool;

    /// `dispatch_retain()`
    pub fn retain(self: *const Data) void {
        dispatch_retain(self);
    }

    /// `dispatch_release()`
    pub fn release(self: *const Data) void {
        dispatch_release(self);
    }

    /// `dispatch_data_empty`
    pub const empty = @extern(*const Data, .{ .name = "_dispatch_data_empty", .library_name = "System" });
};
