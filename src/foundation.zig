const builtin = @import("builtin");
const dispatch = @import("dispatch.zig");
const cf = @import("core_foundation.zig");
const objc = @import("objc.zig");
const cg = @import("core_graphics.zig");
const std = @import("std");
const system = @import("system.zig");

pub const Block = system.Block;
pub const BlockLiteral = system.BlockLiteral;
pub const BlockLiteralWithSignature = system.BlockLiteralWithSignature;
pub const stackBlockLiteral = system.stackBlockLiteral;
pub const globalBlockLiteral = system.globalBlockLiteral;
pub const globalBlock = system.globalBlock;

pub const Rect = cg.Rect;

/// `NSTimeInterval`
pub const TimeInterval = f64;

///`NSRange`
pub const Range = extern struct {
    location: usize,
    length: usize,

    /// `NSMakeRange()`
    pub fn init(location: usize, length: usize) Range {
        return .{ .location = location, .length = length };
    }
};

/// `NSObject`'s protocol (`NSObjectProtocol` in Swift)
pub const ObjectProtocol = opaque {
    pub const InternalInfo = objc.ExternProtocol(@This(), objc.Id);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub const as = InternalInfo.as;

    /// `-[NSObject description]`
    pub fn description(self: *ObjectProtocol) *String {
        return objc.msgSend(self, "description", *String, .{});
    }

    /// `-[NSObject debugDescription]`
    pub fn debugDescription(self: *ObjectProtocol) *String {
        return objc.msgSend(self, "debugDescription", *String, .{});
    }

    /// `-[NSObject isEqual:]`
    pub fn isEqual(self: *ObjectProtocol, other: ?*objc.id) bool {
        return objc.msgSend(self, "isEqual:", bool, .{other});
    }

    /// `-[NSObject hash]`
    pub fn hash(self: *ObjectProtocol) usize {
        return objc.msgSend(self, "hash", usize, .{});
    }

    /// `-[NSObject class]`
    pub fn class(self: *ObjectProtocol) *objc.Class {
        return objc.opt_class(self);
    }

    /// `-[NSObject isKindOfClass:]`
    pub fn isKindOfClass(self: *ObjectProtocol, base_class: *objc.Class) bool {
        return objc.opt_isKindOfClass(self, base_class) != 0;
    }
};

/// `NSObject`
pub const Object = opaque {
    pub const InternalInfo = objc.ExternClass("NSObject", @This(), ObjectProtocol);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub const as = InternalInfo.as;

    /// `+[NSObject new]`
    pub const new = InternalInfo.new;

    /// `+[NSObject alloc]`
    pub const alloc = InternalInfo.alloc;

    /// `[[NSObject alloc] init]`
    pub const allocInit = InternalInfo.allocInit;

    /// `-[NSObject description]`
    pub fn description(self: *Object) *String {
        return self.as(ObjectProtocol).description();
    }

    /// `-[NSObject debugDescription]`
    pub fn debugDescription(self: *Object) *String {
        return self.as(ObjectProtocol).debugDescription();
    }

    /// `-[NSObject isEqual:]`
    pub fn isEqual(self: *Object, other: ?*objc.id) bool {
        return self.as(ObjectProtocol).isEqual(other);
    }

    /// `-[NSObject hash]`
    pub fn hash(self: *Object) usize {
        return self.as(ObjectProtocol).hash();
    }

    /// `-[NSObject class]`
    pub fn class(self: *Object) *objc.Class {
        return self.as(ObjectProtocol).class();
    }

    /// `-[NSObject isKindOfClass:]`
    pub fn isKindOfClass(self: *Object, base_class: *objc.Class) bool {
        return self.as(ObjectProtocol).isKindOfClass(base_class);
    }
};

/// `NSString`
pub const String = opaque {
    pub const InternalInfo = objc.ExternClass("NSString", @This(), Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn as(self: *String, comptime T: type) *T {
        if (T == cf.String) return @ptrCast(self);
        return InternalInfo.as(self, T);
    }
    pub fn from(str: *cf.String) *String {
        return @ptrCast(str);
    }

    pub const Encoding = enum(usize) {
        ascii = 1,
        next_step = 2,
        japanese_euc = 3,
        utf8 = 4,
        iso_latin1 = 5,
        symbol = 6,
        non_lossy_ascii = 7,
        shift_jis = 8,
        iso_latin2 = 9,
        unicode = 10,
        windows_cp1251 = 11,
        windows_cp1252 = 12,
        windows_cp1253 = 13,
        windows_cp1254 = 14,
        windows_cp1250 = 15,
        iso_2022_jp = 21,
        macos_roman = 30,
        utf16_big_endian = 0x90000100,
        utf16_little_endian = 0x94000100,
        utf32 = 0x8c000100,
        utf32_big_endian = 0x98000100,
        utf32_little_endian = 0x9c000100,
        _,

        pub const utf16: Encoding = .unicode;
    };

    pub fn literal(comptime utf8: []const u8) *String {
        return @ptrCast(cf.String.literal(utf8));
    }

    pub fn literalWithUniqueId(comptime utf8: []const u8, comptime unique_id: []const u8) *String {
        return @ptrCast(cf.String.literalWithUniqueId(utf8, unique_id));
    }

    pub fn asciiLiteralWithUniqueId(comptime ascii: []const u8, comptime unique_id: []const u8) *String {
        return @ptrCast(cf.String.asciiLiteralWithUniqueId(ascii, unique_id));
    }

    pub fn utf16LiteralWithUniqueId(comptime utf16: []const u16, comptime unique_id: []const u8) *String {
        return @ptrCast(cf.String.asciiLiteralWithUniqueId(utf16, unique_id));
    }

    /// `+[NSString new]`
    pub const new = InternalInfo.new;

    /// `+[NSString alloc]`
    pub const alloc = InternalInfo.alloc;

    /// `[[NSString alloc] init]`
    pub const allocInit = InternalInfo.allocInit;

    /// `+[NSString stringWithUTF8String:]`
    pub fn stringWithUtf8String(utf8_string: [*:0]const u8) *String {
        const c_str: [*:0]const c_char = @ptrCast(utf8_string);
        return objc.msgSend(InternalInfo.class(), "stringWithUTF8String:", *String, .{c_str});
    }

    pub fn initWithBytesNoCopy_length_encoding_freeWhenDone(self: *String, bytes: *anyopaque, length: usize, encoding: Encoding, free_when_done: bool) *String {
        return objc.msgSend(self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", *String, .{ bytes, length, encoding, free_when_done });
    }

    /// `-[NSString UTF8String]`
    pub fn utf8String(self: *String) [*:0]const u8 {
        return @ptrCast(objc.msgSend(self, "UTF8String", [*:0]const c_char, .{}));
    }

    /// `-[NSString isEqualToString:]`
    pub fn isEqualToString(self: *String, other: *String) bool {
        return objc.msgSend(self, "isEqualToString:", bool, .{other});
    }
};

/// `NSMutableString`
pub const MutableString = opaque {
    pub const InternalInfo = objc.ExternClass("NSMutableString", @This(), String);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn as(self: *MutableString, comptime T: type) *T {
        if (T == cf.MutableString or T == cf.String) return @ptrCast(self);
        return InternalInfo.as(self, T);
    }
    pub fn from(str: *cf.MutableString) *MutableString {
        return @ptrCast(str);
    }

    /// `+[NSMutableString new]`
    pub const new = InternalInfo.new;

    /// `+[NSMutableString alloc]`
    pub const alloc = InternalInfo.alloc;

    /// `[[NSMutableString alloc] init]`
    pub const allocInit = InternalInfo.allocInit();

    /// `+[NSMutableString stringWithUTF8String:]`
    pub fn stringWithUtf8String(utf8_string: [*:0]const u8) *MutableString {
        const c_str: [*:0]const c_char = @ptrCast(utf8_string);
        return objc.msgSend(InternalInfo.class(), "stringWithUTF8String:", *MutableString, .{c_str});
    }

    /// `+[NSMutableString stringWithCapacity:]`
    pub fn stringWithCapacity(capacity: usize) *MutableString {
        return objc.msgSend(InternalInfo.class(), "stringWithCapacity:", *MutableString, .{capacity});
    }

    /// `-[NSMutableString initWithCapacity:]`
    pub fn initWithCapacity(self: *MutableString, capacity: usize) *MutableString {
        return objc.msgSend(self, "initWithCapacity:", *MutableString, .{capacity});
    }

    /// `-[NSMutableString appendString:]`
    pub fn appendString(self: *MutableString, str: *String) void {
        return objc.msgSend(self, "appendString:", void, .{str});
    }

    /// `-[NSMutableString setString:]`
    pub fn setString(self: *MutableString, str: *String) void {
        return objc.msgSend(self, "setString:", void, .{str});
    }
};

/// `NSError`
pub const Error = opaque {
    pub const InternalInfo = objc.ExternClass("NSError", @This(), Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub const as = InternalInfo.as;

    pub const Domain = opaque {
        pub const InternalInfo = objc.AliasClass(@This(), String);
        pub const as = Domain.InternalInfo.as;
    };
    pub const UserInfoKey = opaque {
        pub const InternalInfo = objc.AliasClass(@This(), String);
        pub const as = UserInfoKey.InternalInfo.as;
    };

    /// `-[NSError code]`
    pub fn code(self: *Error) isize {
        return objc.msgSend(self, "code", isize, .{});
    }

    /// `-[NSError domain]`
    pub fn domain(self: *Error) *Domain {
        return objc.msgSend(self, "domain", *Domain, .{});
    }

    /// `-[NSError userInfo]`
    pub fn userInfo(self: *Error) *Dictionary(UserInfoKey, objc.id) {
        return objc.msgSend(self, "userInfo", *Dictionary(UserInfoKey, objc.id), .{});
    }

    /// `-[NSError localizedDescription]`
    pub fn localizedDescription(self: *Error) *String {
        return objc.msgSend(self, "localizedDescription", *String, .{});
    }
};

/// `NSData`
pub const Data = opaque {
    pub const InternalInfo = objc.ExternClass("NSData", @This(), Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub fn as(self: *MutableString, comptime T: type) *T {
        if (T == dispatch.Data) return @ptrCast(self);
        return InternalInfo.as(self, T);
    }
    pub fn from(str: *dispatch.Data) *Data {
        return @ptrCast(str);
    }
};

/// `NSEnumerator`
pub fn Enumerator(T: type) type {
    return opaque {
        pub const InternalInfo = objc.ExternClass("NSEnumerator", @This(), Object);
        pub const retain = InternalInfo.retain;
        pub const release = InternalInfo.release;
        pub const autorelease = InternalInfo.autorelease;

        pub const as = InternalInfo.as;

        pub fn allObjects(self: *@This()) *Array(T) {
            return objc.msgSend(self, "allObjects", *Array(T), .{});
        }

        pub fn nextObject(self: *@This()) ?*T {
            return objc.msgSend(self, "nextObject", ?*T, .{});
        }
    };
}

/// `NSDictionary`
pub fn Dictionary(K: type, V: type) type {
    return opaque {
        pub const InternalInfo = objc.ExternClass("NSDictionary", @This(), Object);
        pub const retain = InternalInfo.retain;
        pub const release = InternalInfo.release;
        pub const autorelease = InternalInfo.autorelease;

        pub const as = InternalInfo.as;

        /// `+[NSDictionary new]`
        pub const new = InternalInfo.new;

        /// `+[NSDictionary alloc]`
        pub const alloc = InternalInfo.alloc;

        /// `[[NSDictionary alloc] init]`
        pub const allocInit = InternalInfo.allocInit();

        /// `-[NSDictionary isEqualToDictionary:]`
        pub fn code(self: *@This(), other: *@This()) bool {
            return objc.msgSend(self, "isEqualToDictionary:", bool, .{other});
        }

        /// `-[NSDictionary objectForKey:]`
        pub fn objectForKey(self: *@This(), key: *K) ?*V {
            return objc.msgSend(self, "objectForKey:", ?*V, .{key});
        }

        /// `-[NSDictionary count]`
        pub fn count(self: *@This()) usize {
            return objc.msgSend(self, "count", usize, .{});
        }

        /// `-[NSDictionary allKeys]`
        pub fn allKeys(self: *@This()) *Array(K) {
            return objc.msgSend(self, "allKeys", *Array(K), .{});
        }

        /// `-[NSDictionary allValues]`
        pub fn allValues(self: *@This()) *Array(V) {
            return objc.msgSend(self, "allValues", *Array(V), .{});
        }

        /// `-[NSDictionary keyEnumerator]`
        pub fn keyEnumerator(self: *@This()) *Enumerator(K) {
            return objc.msgSend(self, "keyEnumerator", *Enumerator(K), .{});
        }

        /// `-[NSDictionary objectEnumerator]`
        pub fn objectEnumerator(self: *@This()) *Enumerator(V) {
            return objc.msgSend(self, "objectEnumerator", *Enumerator(V), .{});
        }

        pub fn iterator(self: *@This()) FastEnumeration.TypedIterator(K) {
            return .{ .inner = .{ .object = @ptrCast(self) } };
        }
    };
}

/// `NSFastEnumerationState`
pub const FastEnumerationState = extern struct {
    state: c_ulong,
    items_ptr: ?[*]?*objc.id,
    mutations_ptr: ?*c_ulong,
    extra: [5]c_ulong,
};

// /// `NSFastEnumeration`
pub const FastEnumeration = opaque {
    pub fn countByEnumeratingWithState(self: *FastEnumeration, state: *FastEnumerationState, objects: []?*objc.id) usize {
        return objc.msgSend(self, "countByEnumeratingWithState:objects:count:", usize, .{ state, objects.ptr, objects.len });
    }

    pub const Iterator = struct {
        object: *FastEnumeration,
        state: FastEnumerationState = std.mem.zeroes(FastEnumerationState),
        index: usize = 0,
        count: usize = 0,
        space: [16]?*objc.id = undefined,
        mutations: if (check_mutations) c_ulong else void = undefined,

        const check_mutations = builtin.mode == .Debug or builtin.mode == .ReleaseSafe;

        pub fn next(self: *Iterator) ?*objc.id {
            if (self.index == self.count) {
                const init_mutations = self.count == 0;
                self.index = 0;
                self.count = self.object.countByEnumeratingWithState(&self.state, &self.space);
                if (self.count == 0) return null;

                if (comptime check_mutations) {
                    if (init_mutations) self.mutations = self.state.mutations_ptr.*;
                }
            }

            if (comptime check_mutations) {
                if (self.mutations != self.state.mutations_ptr.*) {
                    objc.enumerationMutation(self.object);
                }
            }

            const item = self.state.items_ptr[self.index];
            self.index += 1;
            return item;
        }
    };

    pub fn TypedIterator(T: type) type {
        return struct {
            inner: Iterator,

            pub fn next(self: *@This()) ?*T {
                return @ptrCast(self.inner.next());
            }
        };
    }
};

/// `NSArray`
pub fn Array(T: type) type {
    return opaque {
        pub const InternalInfo = objc.ExternClass("NSArray", @This(), Object);
        pub const retain = InternalInfo.retain;
        pub const release = InternalInfo.release;
        pub const autorelease = InternalInfo.autorelease;

        pub const as = InternalInfo.as;

        /// `+[NSArray new]`
        pub const new = InternalInfo.new;

        /// `+[NSArray alloc]`
        pub const alloc = InternalInfo.alloc;

        /// `[[NSArray alloc] init]`
        pub const allocInit = InternalInfo.allocInit();

        /// `-[NSArray isEqualToArray:]`
        pub fn code(self: *@This(), other: *@This()) bool {
            return objc.msgSend(self, "isEqualToArray:", bool, .{other});
        }

        /// `-[NSArray count]`
        pub fn count(self: *@This()) usize {
            return objc.msgSend(self, "count", usize, .{});
        }

        /// `-[NSArray objectAtIndex:]`
        pub fn objectAtIndex(self: *@This(), index: usize) *T {
            return objc.msgSend(self, "objectAtIndex:", *T, .{index});
        }

        /// `-[NSArray firstObject]`
        pub fn firstObject(self: *@This()) ?*T {
            return objc.msgSend(self, "firstObject", ?*T, .{});
        }

        /// `-[NSArray lastObject]`
        pub fn lastObject(self: *@This()) ?*T {
            return objc.msgSend(self, "lastObject", ?*T, .{});
        }

        /// `-[NSArray objectEnumerator]`
        pub fn objectEnumerator(self: *@This()) *Enumerator(T) {
            return objc.msgSend(self, "objectEnumerator", *Enumerator(T), .{});
        }

        /// `-[NSArray reverseObjectEnumerator]`
        pub fn reverseObjectEnumerator(self: *@This()) *Enumerator(T) {
            return objc.msgSend(self, "reverseObjectEnumerator", *Enumerator(T), .{});
        }

        pub fn iterator(self: *@This()) FastEnumeration.TypedIterator(T) {
            return .{ .inner = .{ .object = @ptrCast(self) } };
        }
    };
}

/// `NSThread`
pub const Thread = opaque {
    pub const InternalInfo = objc.ExternClass("NSThread", @This(), Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub const as = InternalInfo.as;

    /// `+[NSThread new]`
    pub const new = InternalInfo.new;

    /// `+[NSThread alloc]`
    pub const alloc = InternalInfo.alloc;

    /// `[[NSThread alloc] init]`
    pub const allocInit = InternalInfo.allocInit();

    /// `+[NSString isMainThread]`
    pub fn isMainThread() bool {
        return objc.msgSend(InternalInfo.class(), "isMainThread", bool, .{});
    }

    /// `+[NSString mainThread]`
    pub fn mainThread() *Thread {
        return objc.msgSend(InternalInfo.class(), "mainThread", *Thread, .{});
    }

    /// `+[NSString currentThread]`
    pub fn currentThread() *Thread {
        return objc.msgSend(InternalInfo.class(), "currentThread", *Thread, .{});
    }

    /// `-[NSString name]`
    pub fn name(self: *Thread) ?*String {
        return objc.msgSend(self, "name", ?*String, .{});
    }
};

/// `NSDate`
pub const Date = opaque {
    pub const InternalInfo = objc.ExternClass("NSDate", @This(), Object);
    pub const retain = InternalInfo.retain;
    pub const release = InternalInfo.release;
    pub const autorelease = InternalInfo.autorelease;

    pub const as = InternalInfo.as;

    /// `+[NSDate new]`
    pub const new = InternalInfo.new;

    /// `+[NSDate alloc]`
    pub const alloc = InternalInfo.alloc;

    /// `[[NSDate alloc] init]`
    pub const allocInit = InternalInfo.allocInit();

    /// `-[NSDate initWithTimeIntervalSinceNow:]`
    pub fn initWithTimeIntervalSinceNow(self: *Date, time_interval: TimeInterval) *Date {
        return objc.msgSend(self, "initWithTimeIntervalSinceNow:", *Date, .{time_interval});
    }

    /// `+[NSDate distantFuture]`
    pub fn distantFuture() *Date {
        return objc.msgSend(InternalInfo.class(), "distantFuture", *Date, .{});
    }

    /// `+[NSDate distantPast]`
    pub fn distantPast() *Date {
        return objc.msgSend(InternalInfo.class(), "distantPast", *Date, .{});
    }

    /// `-[NSDate timeIntervalSinceNow]`
    pub fn timeIntervalSinceNow(self: *Date) TimeInterval {
        return objc.msgSend(self, "timeIntervalSinceNow", TimeInterval, .{});
    }

    /// `-[NSDate timeIntervalSinceReferenceDate]`
    pub fn timeIntervalSinceReferenceDate(self: *Date) TimeInterval {
        return objc.msgSend(self, "timeIntervalSinceReferenceDate", TimeInterval, .{});
    }

    /// `-[NSDate timeIntervalSince1970]`
    pub fn timeIntervalSince1970(self: *Date) TimeInterval {
        return objc.msgSend(self, "timeIntervalSince1970", TimeInterval, .{});
    }
};
