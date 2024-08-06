const builtin = @import("builtin");
const objc = @import("objc.zig");
const std = @import("std");

/// `CFString`
pub const String = opaque {
    fn isAsciiString(comptime str: []const u8) bool {
        for (str) |c| {
            // TODO: clang also uses UTF-16 for ASCII strings that contain the NUL character. Is that actually a requirement we must follow?
            if (!std.ascii.isASCII(c)) return false;
        }
        return true;
    }

    /// `CFSTR()`
    ///
    /// This is just a convenience method for `literalWithUniqueId()` that will compute a unique ID based on the string's contents. If you might have multiple strings with the same contents, use `literalWithUniqueId()` and provide a unique ID for each string.
    pub fn literal(comptime utf8: []const u8) *String {
        // Another option is to take a `SourceLocation` parameter and use that as part of the hash. But let's keep this simple for now.
        const hash = comptime std.hash.Wyhash.hash(0x57325bbf446493ac, utf8);
        const unique_id = comptime std.fmt.comptimePrint("{x:0>16}", .{hash});
        return literalWithUniqueId(utf8, unique_id);
    }

    /// `CFSTR()`
    ///
    /// Strings within the same object file must each have a unique ID to avoid symbol collisions.
    pub fn literalWithUniqueId(comptime utf8: []const u8, comptime unique_id: []const u8) *String {
        if (comptime isAsciiString(utf8)) {
            return asciiLiteralWithUniqueId(utf8, unique_id);
        } else {
            return utf16LiteralWithUniqueId(std.unicode.utf8ToUtf16LeStringLiteral(utf8), unique_id);
        }
    }

    /// Prefer `literal()` or `literalWithUniqueId()`. Only use this if the comptime ASCII check is problematic.
    pub fn asciiLiteralWithUniqueId(comptime ascii: []const u8, comptime unique_id: []const u8) *String {
        const local_prefix = if (comptime builtin.cpu.arch == .x86_64) "L" else "l";

        _ = struct {
            comptime {
                var str_data: []const u8 = "";
                for (ascii) |c| {
                    str_data = str_data ++ std.fmt.comptimePrint("    .byte {}\n", .{c});
                }
                str_data = str_data ++ "    .byte 0";

                // zig fmt: off
                asm (
                    "    .section __TEXT,__cstring,cstring_literals\n" ++
                    local_prefix ++ "_.str." ++ unique_id ++ ":\n" ++
                    str_data ++ "\n\n" ++
                    "    .section __DATA,__cfstring\n" ++
                    "    .p2align 3, 0x0\n" ++
                    local_prefix ++ "__unnamed_cfstring_." ++ unique_id ++ ":\n" ++
                    "    .quad ___CFConstantStringClassReference\n" ++
                    "    .long 1992\n" ++
                    "    .space 4\n" ++
                    "    .quad " ++ local_prefix ++ "_.str." ++ unique_id ++ "\n" ++
                    std.fmt.comptimePrint("    .quad {}\n", .{ascii.len})
                );
                // zig fmt: on
            }
        };

        return @extern(*String, .{ .name = "\x01" ++ local_prefix ++ "__unnamed_cfstring_." ++ unique_id });
    }

    /// Prefer `literal()` or `literalWithUniqueId()`. Only use this if the comptime ASCII check or UTF-16 conversion is problematic.
    pub fn utf16LiteralWithUniqueId(comptime utf16: []const u16, comptime unique_id: []const u8) *String {
        const local_prefix = if (comptime builtin.cpu.arch == .x86_64) "L" else "l";

        _ = struct {
            comptime {
                var str_data: []const u8 = "";
                for (utf16) |c| {
                    str_data = str_data ++ std.fmt.comptimePrint("    .short {}\n", .{c});
                }
                str_data = str_data ++ "    .short 0";

                // zig fmt: off
                asm (
                    "    .section __TEXT,__ustring\n" ++
                    "    .p2align 1, 0x0\n" ++
                    "l_.str." ++ unique_id ++ ":\n" ++
                    str_data ++ "\n\n" ++
                    "    .section __DATA,__cfstring\n" ++
                    "    .p2align 3, 0x0\n" ++
                    local_prefix ++ "__unnamed_cfstring_." ++ unique_id ++ ":\n" ++
                    "    .quad ___CFConstantStringClassReference\n" ++
                    "    .long 2000\n" ++
                    "    .space 4\n" ++
                    "    .quad l_.str." ++ unique_id ++ "\n" ++
                    std.fmt.comptimePrint("    .quad {}\n", .{utf16.len})
                );
                // zig fmt: on
            }
        };

        return @extern(*String, .{ .name = "\x01" ++ local_prefix ++ "__unnamed_cfstring_." ++ unique_id });
    }
};

/// `CFMutableString`
pub const MutableString = opaque {};

/// `CFTimeInterval`
pub const TimeInterval = f64;

/// `CFRunLoop`
pub const RunLoop = opaque {
    /// `CFRunLoopMode`
    pub const Mode = opaque {
        pub const common = @extern(*Mode, .{ .name = "kCFRunLoopCommonModes" });
        pub const default = @extern(*Mode, .{ .name = "kCFRunLoopDefaultMode" });

        pub fn asString(self: *Mode) *String {
            return @ptrCast(self);
        }
    };

    /// `CFRunLoopRunResult`
    pub const RunResult = enum(i32) {
        finished = 1,
        stopped = 2,
        timed_out = 3,
        handled_source = 4,
        _,
    };

    /// `CFRunLoopRunInMode`
    pub fn runInMode(self: *RunLoop, seconds: TimeInterval, return_after_source_handled: bool) RunLoop.RunResult {
        return CFRunLoopRunInMode(self, seconds, return_after_source_handled);
    }
    extern fn CFRunLoopRunInMode(mode: *RunLoop.Mode, seconds: TimeInterval, return_after_source_handled: bool) RunLoop.RunResult;

    /// `CFRunLoopGetMain`
    pub fn getMain() *RunLoop {
        return CFRunLoopGetMain();
    }
    extern fn CFRunLoopGetMain() *RunLoop;
};
