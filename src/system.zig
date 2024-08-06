const builtin = @import("builtin");
const std = @import("std");

pub extern "System" fn dispatch_async(queue: *anyopaque, work: *const Block(fn (*BlockLiteral(void)) void)) void;
pub extern "System" fn dispatch_async_f(queue: *anyopaque, context: ?*anyopaque, work: *const fn (context: ?*anyopaque) callconv(.C) void) void;
pub extern "System" fn @"dispatch_assert_queue$V2"(queue: *anyopaque) void;
pub extern "System" var _dispatch_main_q: anyopaque;

pub fn Block(comptime Signature: type) type {
    const signature_fn_info = @typeInfo(Signature).Fn;
    return opaque {
        pub fn invoke(self: *const @This(), args: std.meta.ArgsTuple(Signature)) signature_fn_info.return_type.? {
            const self_param = std.builtin.Type.Fn.Param{
                .is_generic = false,
                .is_noalias = false,
                .type = *@This(),
            };
            const SignatureForInvoke = @Type(.{
                .Fn = .{
                    .calling_convention = .C,
                    .is_generic = signature_fn_info.is_generic,
                    .is_var_args = signature_fn_info.is_var_args,
                    .return_type = signature_fn_info.return_type,
                    .params = .{self_param} ++ signature_fn_info.params,
                },
            });

            const offset = @offsetOf(BlockLiteral(void), "invoke");
            const invoke_ptr: *const SignatureForInvoke = @ptrCast(self + offset);
            return @call(.auto, invoke_ptr, .{self} ++ args);
        }

        pub fn copy(self: *const @This()) *@This() {
            return _Block_copy(self);
        }
        const _Block_copy = @extern(fn (*const anyopaque) callconv(.C) *anyopaque, .{
            .name = "_Block_copy",
            .library_name = if (builtin.target.os.tag == .macos) null else "System",
        });

        pub fn release(self: *const @This()) void {
            _Block_release(self);
        }
        const _Block_release = @extern(fn (*const anyopaque) callconv(.C) void, .{
            .name = "_Block_release",
            .library_name = if (builtin.target.os.tag == .macos) null else "System",
        });
    };
}

const TrivialBlockDescriptor = extern struct {
    reserved: c_ulong = 0,
    size: c_ulong,

    fn static(comptime size: c_ulong) *const TrivialBlockDescriptor {
        const Static = struct {
            const descriptor: TrivialBlockDescriptor = .{ .size = size };
        };
        return &Static.descriptor;
    }
};

fn CopyDisposeBlockDescriptor(comptime Context: type) type {
    return extern struct {
        reserved: c_ulong = 0,
        size: c_ulong,
        copy: *const CopyFn,
        dispose: *const DisposeFn,

        pub const CopyFn = fn (dst: *BlockLiteral(Context), src: *const BlockLiteral(Context)) callconv(.C) void;
        pub const DisposeFn = fn (block: *const BlockLiteral(Context)) callconv(.C) void;

        fn static(comptime size: c_ulong, comptime copy: CopyFn, comptime dispose: DisposeFn) *const CopyDisposeBlockDescriptor {
            const Static = struct {
                const descriptor: CopyDisposeBlockDescriptor = .{
                    .size = size,
                    .copy = copy,
                    .dispose = dispose,
                };
            };
            return &Static.descriptor;
        }
    };
}

pub fn BlockLiteral(comptime Context: type) type {
    return extern struct {
        isa: *anyopaque,
        flags: i32,
        reserved: i32 = 0,
        invoke: *const anyopaque,
        descriptor: *const anyopaque,
        context: Context,

        fn trivialStaticDescriptor() *const anyopaque {
            return TrivialBlockDescriptor.static(@sizeOf(@This()));
        }

        fn copyDisposeStaticDescriptor(comptime copy: anytype, comptime dispose: anytype) *const anyopaque {
            return CopyDisposeBlockDescriptor(Context).static(@sizeOf(@This()), copy, dispose);
        }

        pub fn asBlockWithSignature(self: *@This(), comptime Signature: type) *Block(Signature) {
            comptime {
                validateBlockSignature(Signature, @This());
            }
            return @ptrCast(self);
        }
    };
}

pub fn BlockLiteralWithSignature(comptime Context: type, comptime Signature: type) type {
    // We could also obtain `Context` from `@typeInfo(Signature).Fn.params[0].type`.
    return extern struct {
        literal: BlockLiteral(Context),

        pub fn asBlock(self: *@This()) *Block(Signature) {
            return self.literal.asBlockWithSignature(Signature);
        }
    };
}

fn validateBlockSignature(comptime Invoke: type, comptime ExpectedLiteralType: type) void {
    switch (@typeInfo(Invoke)) {
        .Fn => |fn_info| {
            if (fn_info.calling_convention != .C) {
                @compileError("A block's `invoke` must use the C calling convention");
            }

            // TODO: should we allow zero params? At the ABI-level it would be fine but I think the compiler might consider it UB.
            if (fn_info.params.len == 0 or fn_info.params[0].type != *ExpectedLiteralType) {
                @compileError("The first parameter for a block's `invoke` must be a block literal pointer");
            }
        },
        else => @compileError("A block's `invoke` must be a function"),
    }
}

pub fn stackBlockLiteral(invoke: anytype, context: anytype, comptime copy: ?fn (dst: *BlockLiteral(@TypeOf(context)), src: *const BlockLiteral(@TypeOf(context))) callconv(.C) void, comptime dispose: ?fn (block: *const BlockLiteral(@TypeOf(context))) callconv(.C) void) BlockLiteralWithSignature(@TypeOf(context), @TypeOf(invoke)) {
    const Context = @TypeOf(context);
    const Literal = BlockLiteral(Context);
    comptime {
        validateBlockSignature(@TypeOf(invoke), Literal);
        if ((copy == null) != (dispose == null)) {
            @compileError("Both `copy` and `dispose` must either be null or nonnull");
        }
    }
    const has_copy_dispose = if (comptime copy != null and dispose != null) 1 << 25 else 0;
    return .{
        .literal = .{
            .isa = &_NSConcreteStackBlock,
            .flags = has_copy_dispose,
            .invoke = invoke,
            .descriptor = if (has_copy_dispose) Literal.copyDisposeStaticDescriptor(copy, dispose) else Literal.staticDescriptor(copy, dispose),
            .context = context,
        },
    };
}
const _NSConcreteStackBlock = @extern(*anyopaque, .{
    .name = "_NSConcreteStackBlock",
    .library_name = if (builtin.target.os.tag == .macos) null else "System",
});
// extern const _NSConcreteStackBlock: *anyopaque;

pub fn globalBlockLiteral(invoke: anytype, context: anytype) BlockLiteralWithSignature(@TypeOf(context), @TypeOf(invoke)) {
    const Context = @TypeOf(context);
    const Literal = BlockLiteral(Context);
    comptime {
        validateBlockSignature(@TypeOf(invoke), Literal);
    }
    const block_is_no_escape = 1 << 23;
    const block_is_global = 1 << 28;
    return .{
        .literal = .{
            .isa = &_NSConcreteGlobalBlock,
            .flags = block_is_no_escape | block_is_global,
            .invoke = invoke,
            .descriptor = Literal.staticDescriptor(),
            .context = context,
        },
    };
}
const _NSConcreteGlobalBlock = @extern(*anyopaque, .{
    .name = "_NSConcreteGlobalBlock",
    .library_name = if (builtin.target.os.tag == .macos) null else "System",
});
// extern const _NSConcreteGlobalBlock: *anyopaque;

pub fn globalBlock(comptime invoke: anytype) *Block(@TypeOf(invoke)) {
    const Static = struct {
        const literal = globalBlockLiteral(invoke, {});
    };
    return Static.literal.asBlock();
}
