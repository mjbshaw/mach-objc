const std = @import("std");

pub fn RemoveFields(container: type, comptime fields_to_remove: anytype) type {
    const FieldsToRemove = @TypeOf(fields_to_remove);
    for (std.meta.fields(FieldsToRemove)) |field| {
        if (!@hasField(container, field.name)) {
            @compileError("`" ++ @typeName(container) ++ "` has no field named `" ++ field.name ++ "`");
        }
    }

    var fields = std.meta.fields(container);
    var copied_fields = fields[0..0];
    for (fields) |field| {
        if (!@hasField(FieldsToRemove, field.name)) {
            copied_fields = copied_fields ++ .{field};
        }
    }

    var type_info = @typeInfo(container);
    switch (type_info) {
        .Struct => {
            type_info.Struct.fields = copied_fields;
            return @Type(type_info);
        },
        .Enum => {
            type_info.Enum.fields = copied_fields;
            return @Type(type_info);
        },
        .Union => {
            type_info.Union.fields = copied_fields;
            return @Type(type_info);
        },
        _ => {
            return container;
        },
    }
}
