const std = @import("std");
const builtin = @import("builtin");

pub const AvailabilityMinVersions = struct {
    macos: std.SemanticVersion = .{ 0, 0, 0 },
    ios: std.SemanticVersion = .{ 0, 0, 0 },
    tvos: std.SemanticVersion = .{ 0, 0, 0 },
    watchos: std.SemanticVersion = .{ 0, 0, 0 },
    driverkit: std.SemanticVersion = .{ 0, 0, 0 },
    visionos: std.SemanticVersion = .{ 0, 0, 0 },
};

extern fn __isPlatformVersionAtLeast(platform: u32, major: u32, minor: u32, patch: u32) i32;

/// This is equivalent to Objective-C's `@available(...)` or Clang's `__builtin_available(...)`.
pub inline fn available(platforms: AvailabilityMinVersions) bool {
    const query = comptime switch (builtin.target.os.tag) {
        .macos => .{ 1, platforms.macos },
        .ios => .{ 2, platforms.ios },
        .tvos => .{ 3, platforms.tvos },
        .watchos => .{ 4, platforms.watchos },
        .driverkit => .{ 10, platforms.driverkit },
        .visionos => .{ 11, platforms.visionos },
        else => @compileError("Unsupported target platform"),
    };

    const target_min = comptime switch (builtin.target.os.version_range.getVersionRange()) {
        .none => .{ .major = 0, .minor = 0, .patch = 0 },
        .semver => |ver| ver.min,
        else => @compileError("Unsupported target platform"),
    };
    if (comptime target_min.order(query[1]).compare(.gte)) {
        return true;
    }

    return __isPlatformVersionAtLeast(query[0], query[1].major, query[1].minor, query[1].patch) != 0;
}
