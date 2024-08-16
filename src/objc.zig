const std = @import("std");
const builtin = @import("builtin");

// LLVM's documented ARC APIs that technically aren't part of libobjc's public API.
pub const AutoreleasePool = opaque {};
extern "objc" fn objc_autoreleasePoolPop(pool: *AutoreleasePool) void;
extern "objc" fn objc_autoreleasePoolPush() *AutoreleasePool;

pub const autoreleasePoolPop = objc_autoreleasePoolPop;
pub const autoreleasePoolPush = objc_autoreleasePoolPush;

extern "objc" fn objc_autorelease(*Id) *Id; // Same as `[object autorelease]`.
extern "objc" fn objc_release(*Id) void; // Same as `[object release]`.
extern "objc" fn objc_retain(*Id) *Id; // Same as `[object retain]`.

pub const autorelease = objc_autorelease;
pub const release = objc_release;
pub const retain = objc_retain;

// APIs that are part of libobjc's public ABI, but not its public API.
extern "objc" fn objc_alloc(class: *Class) ?*Id; // Same as `[Class alloc]`.
extern "objc" fn objc_alloc_init(class: *Class) ?*Id; // Same as `[[Class alloc] init]`.
extern "objc" fn objc_opt_new(class: *Class) ?*Id; // Same as `[Class new]`.
extern "objc" fn objc_opt_class(object: ?*Id) ?*Class; // Same as `[object class]`.
extern "objc" fn objc_opt_isKindOfClass(object: ?*Id, class: ?*Class) bool; // Same as `[object isKindOfClass:class]`.

pub const alloc = objc_alloc_init;
pub const alloc_init = objc_alloc_init;
pub const opt_new = objc_opt_new;
pub const opt_class = objc_opt_class;
pub const opt_isKindOfClass = objc_opt_isKindOfClass;

// APIs that are part of libobjc's public API.
pub const Id = opaque {
    pub const InternalInfo = struct {
        pub fn as(_: *Id, comptime _: type) unreachable {}

        pub fn class() unreachable {}
    };
    pub fn as(_: *Id, comptime _: type) unreachable {}

    pub const retain = objc_retain;
    pub const release = objc_release;
    pub const autorelease = objc_autorelease;
};
pub const Protocol = opaque {};
pub const Class = opaque {};
pub const SEL = [*:0]const c_char;

extern "objc" fn objc_enumerationMutation(object: *Id) void;
pub const enumerationMutation = objc_enumerationMutation;

/// Calls `objc_msgSend(receiver, selector, args...)` (or `objc_msgSend_stret` if needed).
///
/// Be careful. The return type and argument types *must* match the Objective-C method's signature. No compile-time verification is performed.
pub fn msgSend(receiver: anytype, comptime selector: []const u8, return_type: type, args: anytype) return_type {
    const n_colons = comptime std.mem.count(u8, selector, ":");
    if (comptime n_colons != args.len) {
        const plural = comptime if (n_colons == 1) "" else "s";
        const error_msg = comptime std.fmt.comptimePrint("Selector `{s}` has {} argument{s}, but {} were given", .{ selector, n_colons, plural, args.len });
        @compileError(error_msg);
    }

    // TODO: Consider run-time signature verification if `builtin.mode == .Debug` (or use some other toggle). Register the selector, then call `class_getInstanceMethod()` or `class_getClassMethod()`, then call `method_getTypeEncoding()`, and then parse the string and validate it against `receiver` and `args`.

    const fn_type = comptime init: {
        var params: []const std.builtin.Type.Fn.Param = &.{
            .{
                .is_generic = false,
                .is_noalias = false,
                .type = @TypeOf(receiver),
            },
            .{
                .is_generic = false,
                .is_noalias = false,
                .type = [*:0]c_char,
            },
        };
        for (@typeInfo(@TypeOf(args)).Struct.fields) |field| {
            params = params ++
                .{.{
                .is_generic = false,
                .is_noalias = false,
                .type = field.type,
            }};
        }
        break :init std.builtin.Type{
            .Fn = .{
                .calling_convention = .C,
                .is_generic = false,
                .is_var_args = false,
                .return_type = return_type,
                .params = params,
            },
        };
    };

    // TODO: double check that "objc_msgSend(_stret)$selector" actually works for x86_64 (especially stret). If not, use real selectors.
    const needs_fpret = comptime builtin.target.cpu.arch == .x86_64 and (return_type == f32 or return_type == f64);
    const needs_stret = comptime builtin.target.cpu.arch == .x86_64 and @sizeOf(return_type) > 16;
    const msg_send_fn_name = comptime if (needs_stret) "objc_msgSend_stret" else if (needs_fpret) "objc_msgSend_fpret" else "objc_msgSend";
    const msg_send_fn = @extern(*const @Type(fn_type), .{ .name = msg_send_fn_name ++ "$" ++ selector });
    return @call(.auto, msg_send_fn, .{ receiver, undefined } ++ args);
}

pub fn ExternClass(comptime name: []const u8, T: type, SuperType: type) type {
    return struct {
        comptime {
            // zig fmt: off
            asm (
                "    .section __DATA,__objc_classrefs,regular,no_dead_strip\n" ++
                "    .p2align 3, 0x0\n" ++
                "_OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ ":\n" ++
                "    .quad _OBJC_CLASS_$_" ++ name
            );
            // zig fmt: on
        }

        pub const Super = SuperType;

        pub fn class() *Class {
            var ptr: *anyopaque = undefined;
            if (comptime builtin.cpu.arch == .x86_64) {
                // zig fmt: off
                asm (
                    "movq _OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ "(%rip), %[ptr]"
                    : [ptr] "=r" (ptr),
                );
                // zig fmt: on
            } else {
                // zig fmt: off
                asm (
                    "adrp %[ptr], _OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ "@PAGE\n" ++
                    "ldr %[ptr], [%[ptr], _OBJC_CLASSLIST_REFERENCES_$_" ++ name ++ "@PAGEOFF]"
                    : [ptr] "=r" (ptr),
                );
                // zig fmt: on
            }
            return @ptrCast(ptr);
        }

        pub fn as(self: *T, comptime Base: type) *Base {
            if (comptime Base == Super) return @ptrCast(self);
            return Super.as(@ptrCast(self), Base);
        }

        pub fn new() *T {
            return @ptrCast(opt_new(class()));
        }

        pub fn alloc() *T {
            return @ptrCast(objc_alloc(class()));
        }

        pub fn allocInit() *T {
            return @ptrCast(alloc_init(class()));
        }

        pub fn retain(self: *T) *T {
            return @ptrCast(objc_retain(@ptrCast(self)));
        }

        pub fn release(self: *T) void {
            return objc_release(@ptrCast(self));
        }

        pub fn autorelease(self: *T) *T {
            return @ptrCast(objc_autorelease(@ptrCast(self)));
        }
    };
}

pub fn AliasClass(T: type, Alias: type) type {
    return opaque {
        pub const Super = Alias.InternalInfo.Super;
        pub const class = Alias.InternalInfo.class;

        pub fn as(self: *T, comptime Base: type) *Base {
            if (comptime Base == Alias) return @ptrCast(self);
            return Alias.InternalInfo.as(@ptrCast(self), Base);
        }
    };
}

pub fn ExternProtocol(T: type, SuperType: type) type {
    return struct {
        pub const Super = SuperType;

        pub fn as(self: *T, comptime Base: type) *Base {
            if (comptime Base == Super) return @ptrCast(self);
            return Super.as(@ptrCast(self), Base);
        }

        pub fn retain(self: *T) *T {
            return @ptrCast(objc_retain(@ptrCast(self)));
        }

        pub fn release(self: *T) void {
            return objc_release(@ptrCast(self));
        }

        pub fn autorelease(self: *T) *T {
            return @ptrCast(objc_autorelease(@ptrCast(self)));
        }
    };
}
