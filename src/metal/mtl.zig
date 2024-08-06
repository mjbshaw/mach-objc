const std = @import("std");
const cf = @import("../core_foundation.zig");
const dispatch = @import("../dispatch.zig");
const io = @import("../iosurface.zig");
const ns = @import("../foundation.zig");
const objc = @import("../objc.zig");

// MTLCounters.hpp

/// `MTLCommonCounter`
pub const CommonCounter = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;

    /// `MTLCommonCounterTimestamp`
    pub const timestamp = @extern(*CommonCounter, .{ .name = "MTLCommonCounterTimestamp" });
    /// `MTLCommonCounterTessellationInputPatches`
    pub const tessellation_input_patches = @extern(*CommonCounter, .{ .name = "MTLCommonCounterTessellationInputPatches" });
    /// `MTLCommonCounterVertexInvocations`
    pub const vertex_invocations = @extern(*CommonCounter, .{ .name = "MTLCommonCounterVertexInvocations" });
    /// `MTLCommonCounterPostTessellationVertexInvocations`
    pub const post_tessellation_vertex_invocations = @extern(*CommonCounter, .{ .name = "MTLCommonCounterPostTessellationVertexInvocations" });
    /// `MTLCommonCounterClipperInvocations`
    pub const clipper_invocations = @extern(*CommonCounter, .{ .name = "MTLCommonCounterClipperInvocations" });
    /// `MTLCommonCounterClipperPrimitivesOut`
    pub const clipper_primitives_out = @extern(*CommonCounter, .{ .name = "MTLCommonCounterClipperPrimitivesOut" });
    /// `MTLCommonCounterFragmentInvocations`
    pub const fragment_invocations = @extern(*CommonCounter, .{ .name = "MTLCommonCounterFragmentInvocations" });
    /// `MTLCommonCounterFragmentsPassed`
    pub const fragments_passed = @extern(*CommonCounter, .{ .name = "MTLCommonCounterFragmentsPassed" });
    /// `MTLCommonCounterComputeKernelInvocations`
    pub const compute_kernel_invocations = @extern(*CommonCounter, .{ .name = "MTLCommonCounterComputeKernelInvocations" });
    /// `MTLCommonCounterTotalCycles`
    pub const total_cycles = @extern(*CommonCounter, .{ .name = "MTLCommonCounterTotalCycles" });
    /// `MTLCommonCounterVertexCycles`
    pub const vertex_cycles = @extern(*CommonCounter, .{ .name = "MTLCommonCounterVertexCycles" });
    /// `MTLCommonCounterTessellationCycles`
    pub const tessellation_cycles = @extern(*CommonCounter, .{ .name = "MTLCommonCounterTessellationCycles" });
    /// `MTLCommonCounterPostTessellationVertexCycles`
    pub const post_tessellation_vertex_cycles = @extern(*CommonCounter, .{ .name = "MTLCommonCounterPostTessellationVertexCycles" });
    /// `MTLCommonCounterFragmentCycles`
    pub const fragment_cycles = @extern(*CommonCounter, .{ .name = "MTLCommonCounterFragmentCycles" });
    /// `MTLCommonCounterRenderTargetWriteCycles`
    pub const render_target_write_cycles = @extern(*CommonCounter, .{ .name = "MTLCommonCounterRenderTargetWriteCycles" });
};

/// `MTLCommonCounterSet`
pub const CommonCounterSet = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;

    /// `MTLCommonCounterSetTimestamp`
    pub const timestamp = @extern(*CommonCounterSet, .{ .name = "MTLCommonCounterSetTimestamp" });
    /// `MTLCommonCounterSetStageUtilization`
    pub const stage_utilization = @extern(*CommonCounterSet, .{ .name = "MTLCommonCounterSetStageUtilization" });
    /// `MTLCommonCounterSetStatistic`
    pub const statistic = @extern(*CommonCounterSet, .{ .name = "MTLCommonCounterSetStatistic" });
};

// MTLDevice.hpp

/// `MTLCommonCounter`
pub const DeviceNotificationName = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;

    /// `MTLDeviceWasAddedNotification`
    pub const device_was_added = @extern(*CommonCounter, .{ .name = "MTLDeviceWasAddedNotification" });
    /// `MTLDeviceRemovalRequestedNotification`
    pub const device_removal_requested = @extern(*CommonCounter, .{ .name = "MTLDeviceRemovalRequestedNotification" });
    /// `MTLDeviceWasRemovedNotification`
    pub const device_was_removed = @extern(*CommonCounter, .{ .name = "MTLDeviceWasRemovedNotification" });
};

/// `MTLAutoreleasedComputePipelineReflection`
pub const AutoreleasedComputePipelineReflection = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ComputePipelineReflection);
    pub const as = InternalInfo.as;
};

/// `MTLAutoreleasedRenderPipelineReflection`
pub const AutoreleasedRenderPipelineReflection = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), RenderPipelineReflection);
    pub const as = InternalInfo.as;
};

pub const Timestamp = u64;

// MTLLibrary.hpp

/// `MTLAutoreleasedArgument`
pub const AutoreleasedArgument = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), Argument);
    pub const as = InternalInfo.as;
};

// MTLDevice.hpp

/// `MTLCreateSystemDefaultDevice()`
pub const createSystemDefaultDevice = MTLCreateSystemDefaultDevice;
extern fn MTLCreateSystemDefaultDevice() ?*Device;

/// `MTLCopyAllDevices()`
pub const copyAllDevices = MTLCopyAllDevices;
extern fn MTLCopyAllDevices() *ns.Array(*Device);

// MTLComputeCommandEncoder.hpp

pub const DispatchThreadgroupsIndirectArguments = extern struct {
    threadgroups_per_grid: [3]u32,

    pub fn init(threadgroups_per_grid: [3]u32) DispatchThreadgroupsIndirectArguments {
        return DispatchThreadgroupsIndirectArguments{ .threadgroups_per_grid = threadgroups_per_grid };
    }
};

pub const StageInRegionIndirectArguments = extern struct {
    stage_in_origin: [3]u32,
    stage_in_size: [3]u32,

    pub fn init(stage_in_origin: [3]u32, stage_in_size: [3]u32) StageInRegionIndirectArguments {
        return StageInRegionIndirectArguments{ .stage_in_origin = stage_in_origin, .stage_in_size = stage_in_size };
    }
};

// MTLRenderCommandEncoder.hpp

/// `MTLScissorRect`
pub const ScissorRect = extern struct {
    x: usize,
    y: usize,
    width: usize,
    height: usize,

    pub fn init(x: ns.UInteger, y: ns.UInteger, width: ns.UInteger, height: ns.UInteger) ScissorRect {
        return ScissorRect{ .x = x, .y = y, .width = width, .height = height };
    }
};

/// `MTLViewport`
pub const Viewport = extern struct {
    origin_x: f64,
    origin_y: f64,
    width: f64,
    height: f64,
    z_near: f64,
    z_far: f64,

    pub fn init(originX: f64, originY: f64, width: f64, height: f64, znear: f64, zfar: f64) Viewport {
        return Viewport{ .originX = originX, .originY = originY, .width = width, .height = height, .znear = znear, .zfar = zfar };
    }
};

/// `MTLVertexAmplificationViewMapping`
pub const VertexAmplificationViewMapping = extern struct {
    viewport_array_index_offset: u32,
    render_target_array_index_offset: u32,

    pub fn init(viewport_array_index_offset: u32, render_target_array_index_offset: u32) VertexAmplificationViewMapping {
        return VertexAmplificationViewMapping{ .viewport_array_index_offset = viewport_array_index_offset, .render_target_array_index_offset = render_target_array_index_offset };
    }
};

// MTLRenderPass.hpp

/// `MTLClearColor`
pub const ClearColor = extern struct {
    red: f64,
    green: f64,
    blue: f64,
    alpha: f64,

    pub fn init(red: f64, green: f64, blue: f64, alpha: f64) ClearColor {
        return ClearColor{ .red = red, .green = green, .blue = blue, .alpha = alpha };
    }
};

// MTLTexture.hpp

/// `MTLTextureSwizzleChannels`
pub const TextureSwizzleChannels = extern struct {
    red: TextureSwizzle,
    green: TextureSwizzle,
    blue: TextureSwizzle,
    alpha: TextureSwizzle,

    pub fn init(red: TextureSwizzle, green: TextureSwizzle, blue: TextureSwizzle, alpha: TextureSwizzle) TextureSwizzleChannels {
        return TextureSwizzleChannels{ .red = red, .green = green, .blue = blue, .alpha = alpha };
    }
};

// MTLTypes.hpp

/// `MTLOrigin`
pub const Origin = extern struct {
    x: usize,
    y: usize,
    z: usize,

    pub fn init(x: ns.UInteger, y: ns.UInteger, z: ns.UInteger) Origin {
        return .{ .x = x, .y = y, .z = z };
    }
};

/// `MTLSize`
pub const Size = extern struct {
    width: usize,
    height: usize,
    depth: usize,

    pub fn init(width: ns.UInteger, height: ns.UInteger, depth: ns.UInteger) Size {
        return .{ .width = width, .height = height, .depth = depth };
    }
};

/// `MTLRegion`
pub const Region = extern struct {
    origin: Origin,
    size: Size,

    /// `MTLRegionMake1D()`
    pub fn init1d(x: usize, width: usize) Region {
        return .{ .origin = .{ .x = x, .y = 0, .z = 0 }, .size = .{ .width = width, .height = 1, .depth = 1 } };
    }

    /// `MTLRegionMake2D()`
    pub fn init2d(x: usize, y: usize, width: usize, height: usize) Region {
        return .{ .origin = .{ .x = x, .y = y, .z = 0 }, .size = .{ .width = width, .height = height, .depth = 1 } };
    }

    /// `MTLRegionMake3D()`
    pub fn init3d(x: usize, y: usize, z: usize, width: usize, height: usize, depth: usize) Region {
        return .{ .origin = .{ .x = x, .y = y, .z = z }, .size = .{ .width = width, .height = height, .depth = depth } };
    }
};

/// `MTLSamplePosition`
pub const SamplePosition = extern struct {
    x: f32,
    y: f32,

    /// `MTLSamplePositionMake()`
    pub fn init(x: f32, y: f32) SamplePosition {
        return .{ .x = x, .y = y };
    }
};

/// `MTLCoordinate2D`
pub const Coordinate2D = SamplePosition;

/// `MTLResourceID`
pub const ResourceId = extern struct {
    _impl: u64,
};

// MTLCounters.hpp

/// `MTLCounterResultTimestamp`
pub const CounterResultTimestamp = extern struct { timestamp: u64 };

pub const CounterResultStageUtilization = extern struct {
    total_cycles: u64,
    vertex_cycles: u64,
    tessellation_cycles: u64,
    post_tessellation_vertex_cycles: u64,
    fragment_cycles: u64,
    render_target_cycles: u64,
};

pub const CounterResultStatistic = extern struct {
    tessellation_input_patches: u64,
    vertex_invocations: u64,
    post_tessellation_vertex_invocations: u64,
    clipper_invocations: u64,
    clipper_primitives_out: u64,
    fragment_invocations: u64,
    fragments_passed: u64,
    compute_kernel_invocations: u64,
};

// MTLDevice.hpp

/// `MTLAccelerationStructureSizes`
pub const AccelerationStructureSizes = extern struct {
    acceleration_structure_size: usize,
    build_scratch_buffer_size: usize,
    refit_scratch_buffer_size: usize,
};

/// `MTLSizeAndAlign`
pub const SizeAndAlign = extern struct {
    size: usize,
    @"align": usize,
};

/// `MTLAccelerationStructureUsage`
pub const AccelerationStructureUsage = packed struct(usize) {
    /// `MTLAccelerationStructureUsageRefit`
    refit: bool = false,
    /// `MTLAccelerationStructureUsagePreferFastBuild`
    prefer_fast_build: bool = false,
    /// `MTLAccelerationStructureUsageExtendedLimits`
    extended_limits: bool = false,
    _padding: u61 = 0,

    /// `MTLAccelerationStructureUsageNone`
    pub const none: AccelerationStructureUsage = .{};
};

/// `MTLAccelerationStructureInstanceOptions`
pub const AccelerationStructureInstanceOptions = packed struct(u32) {
    /// `MTLAccelerationStructureInstanceOptionDisableTriangleCulling`
    disable_triangle_culling: bool = false,
    /// `MTLAccelerationStructureInstanceOptionTriangleFrontFacingWindingCounterClockwise`
    triangle_front_facing_winding_counter_clockwise: bool = false,
    /// `MTLAccelerationStructureInstanceOptionOpaque`
    @"opaque": bool = false,
    /// `MTLAccelerationStructureInstanceOptionNonOpaque`
    non_opaque: bool = false,
    _padding: u60 = 0,

    /// `MTLAccelerationStructureInstanceOptionNone`
    pub const none: AccelerationStructureInstanceOptions = .{};
};

/// `MTLMotionBorderMode`
pub const MotionBorderMode = enum(u32) {
    /// `MTLMotionBorderModeClamp`
    clamp = 0,
    /// `MTLMotionBorderModeVanish`
    vanish = 1,
    _,
};

/// `MTLAccelerationStructureInstanceDescriptorType`
pub const AccelerationStructureInstanceDescriptorType = enum(usize) {
    /// `MTLAccelerationStructureInstanceDescriptorTypeDefault`
    default = 0,
    /// `MTLAccelerationStructureInstanceDescriptorTypeUserID`
    user_id = 1,
    /// `MTLAccelerationStructureInstanceDescriptorTypeMotion`
    motion = 2,
    /// `MTLAccelerationStructureInstanceDescriptorTypeIndirect`
    indirect = 3,
    /// `MTLAccelerationStructureInstanceDescriptorTypeIndirectMotion`
    indirect_motion = 4,
    _,
};

/// `MTLAccelerationStructureRefitOptions`
pub const AccelerationStructureRefitOptions = packed struct(usize) {
    /// `MTLAccelerationStructureRefitOptionVertexData`
    vertex_data: bool = false,
    /// `MTLAccelerationStructureRefitOptionPerPrimitiveData`
    per_primitive_data: bool = false,
    _padding: u62 = 0,
};

/// `MTLDataType`
pub const DataType = enum(usize) {
    /// `MTLDataTypeNone`
    none = 0,
    /// `MTLDataTypeStruct`
    structure = 1,
    /// `MTLDataTypeArray`
    array = 2,
    /// `MTLDataTypeFloat`
    float = 3,
    /// `MTLDataTypeFloat2`
    float2 = 4,
    /// `MTLDataTypeFloat3`
    float3 = 5,
    /// `MTLDataTypeFloat4`
    float4 = 6,
    /// `MTLDataTypeFloat2x2`
    float2_x2 = 7,
    /// `MTLDataTypeFloat2x3`
    float2_x3 = 8,
    /// `MTLDataTypeFloat2x4`
    float2_x4 = 9,
    /// `MTLDataTypeFloat3x2`
    float3_x2 = 10,
    /// `MTLDataTypeFloat3x3`
    float3_x3 = 11,
    /// `MTLDataTypeFloat3x4`
    float3_x4 = 12,
    /// `MTLDataTypeFloat4x2`
    float4_x2 = 13,
    /// `MTLDataTypeFloat4x3`
    float4_x3 = 14,
    /// `MTLDataTypeFloat4x4`
    float4_x4 = 15,
    /// `MTLDataTypeHalf`
    half = 16,
    /// `MTLDataTypeHalf2`
    half2 = 17,
    /// `MTLDataTypeHalf3`
    half3 = 18,
    /// `MTLDataTypeHalf4`
    half4 = 19,
    /// `MTLDataTypeHalf2x2`
    half2_x2 = 20,
    /// `MTLDataTypeHalf2x3`
    half2_x3 = 21,
    /// `MTLDataTypeHalf2x4`
    half2_x4 = 22,
    /// `MTLDataTypeHalf3x2`
    half3_x2 = 23,
    /// `MTLDataTypeHalf3x3`
    half3_x3 = 24,
    /// `MTLDataTypeHalf3x4`
    half3_x4 = 25,
    /// `MTLDataTypeHalf4x2`
    half4_x2 = 26,
    /// `MTLDataTypeHalf4x3`
    half4_x3 = 27,
    /// `MTLDataTypeHalf4x4`
    half4_x4 = 28,
    /// `MTLDataTypeInt`
    int = 29,
    /// `MTLDataTypeInt2`
    int2 = 30,
    /// `MTLDataTypeInt3`
    int3 = 31,
    /// `MTLDataTypeInt4`
    int4 = 32,
    /// `MTLDataTypeUInt`
    uint = 33,
    /// `MTLDataTypeUInt2`
    uint2 = 34,
    /// `MTLDataTypeUInt3`
    uint3 = 35,
    /// `MTLDataTypeUInt4`
    uint4 = 36,
    /// `MTLDataTypeShort`
    short = 37,
    /// `MTLDataTypeShort2`
    short2 = 38,
    /// `MTLDataTypeShort3`
    short3 = 39,
    /// `MTLDataTypeShort4`
    short4 = 40,
    /// `MTLDataTypeUShort`
    ushort = 41,
    /// `MTLDataTypeUShort2`
    ushort2 = 42,
    /// `MTLDataTypeUShort3`
    ushort3 = 43,
    /// `MTLDataTypeUShort4`
    ushort4 = 44,
    /// `MTLDataTypeChar`
    char = 45,
    /// `MTLDataTypeChar2`
    char2 = 46,
    /// `MTLDataTypeChar3`
    char3 = 47,
    /// `MTLDataTypeChar4`
    char4 = 48,
    /// `MTLDataTypeUChar`
    uchar = 49,
    /// `MTLDataTypeUChar2`
    uchar2 = 50,
    /// `MTLDataTypeUChar3`
    uchar3 = 51,
    /// `MTLDataTypeUChar4`
    uchar4 = 52,
    /// `MTLDataTypeBool`
    bool = 53,
    /// `MTLDataTypeBool2`
    bool2 = 54,
    /// `MTLDataTypeBool3`
    bool3 = 55,
    /// `MTLDataTypeBool4`
    bool4 = 56,
    /// `MTLDataTypeTexture`
    texture = 58,
    /// `MTLDataTypeSampler`
    sampler = 59,
    /// `MTLDataTypePointer`
    pointer = 60,
    /// `MTLDataTypeR8Unorm`
    r8_unorm = 62,
    /// `MTLDataTypeR8Snorm`
    r8_snorm = 63,
    /// `MTLDataTypeR16Unorm`
    r16_unorm = 64,
    /// `MTLDataTypeR16Snorm`
    r16_snorm = 65,
    /// `MTLDataTypeRG8Unorm`
    rg8_unorm = 66,
    /// `MTLDataTypeRG8Snorm`
    rg8_snorm = 67,
    /// `MTLDataTypeRG16Unorm`
    rg16_unorm = 68,
    /// `MTLDataTypeRG16Snorm`
    rg16_snorm = 69,
    /// `MTLDataTypeRGBA8Unorm`
    rgba8_unorm = 70,
    /// `MTLDataTypeRGBA8Unorm_sRGB`
    rgba8_unorm_s_rgb = 71,
    /// `MTLDataTypeRGBA8Snorm`
    rgba8_snorm = 72,
    /// `MTLDataTypeRGBA16Unorm`
    rgba16_unorm = 73,
    /// `MTLDataTypeRGBA16Snorm`
    rgba16_snorm = 74,
    /// `MTLDataTypeRGB10A2Unorm`
    rgb10_a2_unorm = 75,
    /// `MTLDataTypeRG11B10Float`
    rg11_b10_float = 76,
    /// `MTLDataTypeRGB9E5Float`
    rgb9_e5_float = 77,
    /// `MTLDataTypeRenderPipeline`
    render_pipeline = 78,
    /// `MTLDataTypeComputePipeline`
    compute_pipeline = 79,
    /// `MTLDataTypeIndirectCommandBuffer`
    indirect_command_buffer = 80,
    /// `MTLDataTypeLong`
    long = 81,
    /// `MTLDataTypeLong2`
    long2 = 82,
    /// `MTLDataTypeLong3`
    long3 = 83,
    /// `MTLDataTypeLong4`
    long4 = 84,
    /// `MTLDataTypeULong`
    ulong = 85,
    /// `MTLDataTypeULong2`
    ulong2 = 86,
    /// `MTLDataTypeULong3`
    ulong3 = 87,
    /// `MTLDataTypeULong4`
    ulong4 = 88,
    /// `MTLDataTypeVisibleFunctionTable`
    visible_function_table = 115,
    /// `MTLDataTypeIntersectionFunctionTable`
    intersection_function_table = 116,
    /// `MTLDataTypePrimitiveAccelerationStructure`
    primitive_acceleration_structure = 117,
    /// `MTLDataTypeInstanceAccelerationStructure`
    instance_acceleration_structure = 118,
    /// `MTLDataTypeBFloat`
    bfloat = 121,
    /// `MTLDataTypeBFloat2`
    bfloat2 = 122,
    /// `MTLDataTypeBFloat3`
    bfloat3 = 123,
    /// `MTLDataTypeBFloat4`
    bfloat4 = 124,
    _,
};

/// `MTLBindingType`
pub const BindingType = enum(isize) {
    /// `MTLBindingTypeBuffer`
    buffer = 0,
    /// `MTLBindingTypeThreadgroupMemory`
    threadgroup_memory = 1,
    /// `MTLBindingTypeTexture`
    texture = 2,
    /// `MTLBindingTypeSampler`
    sampler = 3,
    /// `MTLBindingTypeImageblockData`
    imageblock_data = 16,
    /// `MTLBindingTypeImageblock`
    imageblock = 17,
    /// `MTLBindingTypeVisibleFunctionTable`
    visible_function_table = 24,
    /// `MTLBindingTypePrimitiveAccelerationStructure`
    primitive_acceleration_structure = 25,
    /// `MTLBindingTypeInstanceAccelerationStructure`
    instance_acceleration_structure = 26,
    /// `MTLBindingTypeIntersectionFunctionTable`
    intersection_function_table = 27,
    /// `MTLBindingTypeObjectPayload`
    object_payload = 34,
    _,
};

/// `MTLArgumentType`
pub const ArgumentType = enum(usize) {
    /// `MTLArgumentTypeBuffer`
    buffer = 0,
    /// `MTLArgumentTypeThreadgroupMemory`
    threadgroup_memory = 1,
    /// `MTLArgumentTypeTexture`
    texture = 2,
    /// `MTLArgumentTypeSampler`
    sampler = 3,
    /// `MTLArgumentTypeImageblockData`
    imageblock_data = 16,
    /// `MTLArgumentTypeImageblock`
    imageblock = 17,
    /// `MTLArgumentTypeVisibleFunctionTable`
    visible_function_table = 24,
    /// `MTLArgumentTypePrimitiveAccelerationStructure`
    primitive_acceleration_structure = 25,
    /// `MTLArgumentTypeInstanceAccelerationStructure`
    instance_acceleration_structure = 26,
    /// `MTLArgumentTypeIntersectionFunctionTable`
    intersection_function_table = 27,
    _,
};

/// `MTLBindingAccess`
pub const BindingAccess = enum(usize) {
    /// `MTLBindingAccessReadOnly` and `MTLArgumentAccessReadOnly`
    read_only = 0,
    /// `MTLBindingAccessReadWrite` and `MTLArgumentAccessReadWrite`
    read_write = 1,
    /// `MTLBindingAccessWriteOnly` and `MTLArgumentAccessWriteOnly`
    write_only = 2,
};

/// `MTLBinaryArchiveError`
pub const BinaryArchiveError = enum(usize) {
    /// `MTLBinaryArchiveErrorNone`
    none = 0,
    /// `MTLBinaryArchiveErrorInvalidFile`
    invalid_file = 1,
    /// `MTLBinaryArchiveErrorUnexpectedElement`
    unexpected_element = 2,
    /// `MTLBinaryArchiveErrorCompilationFailure`
    compilation_failure = 3,
    /// `MTLBinaryArchiveErrorInternalError`
    internal_error = 4,
    _,
};

/// `MTLBlitOption`
pub const BlitOption = packed struct(usize) {
    /// `MTLBlitOptionDepthFromDepthStencil`
    depth_from_depth_stencil: bool = false,
    /// `MTLBlitOptionStencilFromDepthStencil`
    stencil_from_depth_stencil: bool = false,
    /// `MTLBlitOptionRowLinearPVRTC`
    row_linear_pvrtc: bool = false,
    _padding: u61 = 0,

    /// `MTLBlitOptionNone`
    pub const none: BlitOption = .{};
};

/// `MTLCaptureError`
pub const CaptureError = enum(isize) {
    /// `MTLCaptureErrorNotSupported`
    not_supported = 1,
    /// `MTLCaptureErrorAlreadyCapturing`
    already_capturing = 2,
    /// `MTLCaptureErrorInvalidDescriptor`
    invalid_descriptor = 3,
    _,
};

/// `MTLCaptureDestination`
pub const CaptureDestination = enum(isize) {
    /// `MTLCaptureDestinationDeveloperTools`
    developer_tools = 1,
    /// `MTLCaptureDestinationGPUTraceDocument`
    gputrace_document = 0,
    _,
};

/// `MTLCommandBufferStatus`
pub const CommandBufferStatus = enum(usize) {
    /// `MTLCommandBufferStatusNotEnqueued`
    not_enqueued = 0,
    /// `MTLCommandBufferStatusEnqueued`
    enqueued = 1,
    /// `MTLCommandBufferStatusCommitted`
    committed = 2,
    /// `MTLCommandBufferStatusScheduled`
    scheduled = 3,
    /// `MTLCommandBufferStatusCompleted`
    completed = 4,
    /// `MTLCommandBufferStatusError`
    err = 5,
    _,
};

/// `MTLCommandBufferError`
pub const CommandBufferError = enum(usize) {
    /// `MTLCommandBufferErrorNone`
    none = 0,
    /// `MTLCommandBufferErrorInternal`
    internal = 1,
    /// `MTLCommandBufferErrorTimeout`
    timeout = 2,
    /// `MTLCommandBufferErrorPageFault`
    page_fault = 3,
    /// `MTLCommandBufferErrorBlacklisted`
    blacklisted = 4,
    /// `MTLCommandBufferErrorAccessRevoked`
    access_revoked = 4,
    /// `MTLCommandBufferErrorNotPermitted`
    not_permitted = 7,
    /// `MTLCommandBufferErrorOutOfMemory`
    out_of_memory = 8,
    /// `MTLCommandBufferErrorInvalidResource`
    invalid_resource = 9,
    /// `MTLCommandBufferErrorMemoryless`
    memoryless = 10,
    /// `MTLCommandBufferErrorDeviceRemoved`
    device_removed = 11,
    /// `MTLCommandBufferErrorStackOverflow`
    stack_overflow = 12,
    _,
};

/// `MTLCommandBufferErrorOption`
pub const CommandBufferErrorOption = packed struct(usize) {
    /// `MTLCommandBufferErrorOptionEncoderExecutionStatus`
    encoder_execution_status: bool = false,
    _padding: u63 = 0,

    /// `MTLCommandBufferErrorOptionNone`
    pub const none: CommandBufferErrorOption = .{};
};

/// `MTLCommandEncoderErrorState`
pub const CommandEncoderErrorState = enum(isize) {
    /// `MTLCommandEncoderErrorStateUnknown`
    unknown = 0,
    /// `MTLCommandEncoderErrorStateCompleted`
    completed = 1,
    /// `MTLCommandEncoderErrorStateAffected`
    affected = 2,
    /// `MTLCommandEncoderErrorStatePending`
    pending = 3,
    /// `MTLCommandEncoderErrorStateFaulted`
    faulted = 4,
    _,
};

/// `MTLDispatchType`
pub const DispatchType = enum(usize) {
    /// `MTLDispatchTypeSerial`
    serial = 0,
    /// `MTLDispatchTypeConcurrent`
    concurrent = 0,
    _,
};

/// `MTLResourceUsage`
pub const ResourceUsage = packed struct(usize) {
    /// `MTLResourceUsageRead`
    read: bool = false,
    /// `MTLResourceUsageWrite`
    write: bool = false,
    /// `MTLResourceUsageSample`
    sample: bool = false,
    _padding: u61 = 0,
};

/// `MTLBarrierScope`
pub const BarrierScope = packed struct(usize) {
    /// `MTLBarrierScopeBuffers`
    buffers: bool = false,
    /// `MTLBarrierScopeTextures`
    textures: bool = false,
    /// `MTLBarrierScopeRenderTargets`
    render_targets: bool = false,
    _padding: u61 = 0,
};

/// `MTLCounterSampleBufferError`
pub const CounterSampleBufferError = enum(isize) {
    /// `MTLCounterSampleBufferErrorOutOfMemory`
    out_of_memory = 0,
    /// `MTLCounterSampleBufferErrorInvalid`
    invalid = 1,
    /// `MTLCounterSampleBufferErrorInternal`
    internal = 2,
    _,
};

/// `MTLCompareFunction`
pub const CompareFunction = enum(usize) {
    /// `MTLCompareFunctionNever`
    never = 0,
    /// `MTLCompareFunctionLess`
    less = 1,
    /// `MTLCompareFunctionEqual`
    equal = 2,
    /// `MTLCompareFunctionLessEqual`
    less_equal = 3,
    /// `MTLCompareFunctionGreater`
    greater = 4,
    /// `MTLCompareFunctionNotEqual`
    not_equal = 5,
    /// `MTLCompareFunctionGreaterEqual`
    greater_equal = 6,
    /// `MTLCompareFunctionAlways`
    always = 7,
    _,
};

/// `MTLStencilOperation`
pub const StencilOperation = enum(usize) {
    /// `MTLStencilOperationKeep`
    keep = 0,
    /// `MTLStencilOperationZero`
    zero = 1,
    /// `MTLStencilOperationReplace`
    replace = 2,
    /// `MTLStencilOperationIncrementClamp`
    increment_clamp = 3,
    /// `MTLStencilOperationDecrementClamp`
    decrement_clamp = 4,
    /// `MTLStencilOperationInvert`
    invert = 5,
    /// `MTLStencilOperationIncrementWrap`
    increment_wrap = 6,
    /// `MTLStencilOperationDecrementWrap`
    decrement_wrap = 7,
    _,
};

/// `MTLIOCompressionMethod`
pub const IoCompressionMethod = enum(isize) {
    /// `MTLIOCompressionMethodZlib`
    zlib = 0,
    /// `MTLIOCompressionMethodLZFSE`
    lzfse = 1,
    /// `MTLIOCompressionMethodLZ4`
    lz4 = 2,
    /// `MTLIOCompressionMethodLZMA`
    lzma = 3,
    /// `MTLIOCompressionMethodLZBitmap`
    lzbitmap = 4,
    _,
};

/// `MTLFeatureSet`
pub const FeatureSet = enum(usize) {
    /// `MTLFeatureSet_iOS_GPUFamily1_v1`
    i_os_gpufamily1_v1 = 0,
    /// `MTLFeatureSet_iOS_GPUFamily2_v1`
    i_os_gpufamily2_v1 = 1,
    /// `MTLFeatureSet_iOS_GPUFamily1_v2`
    i_os_gpufamily1_v2 = 2,
    /// `MTLFeatureSet_iOS_GPUFamily2_v2`
    i_os_gpufamily2_v2 = 3,
    /// `MTLFeatureSet_iOS_GPUFamily3_v1`
    i_os_gpufamily3_v1 = 4,
    /// `MTLFeatureSet_iOS_GPUFamily1_v3`
    i_os_gpufamily1_v3 = 5,
    /// `MTLFeatureSet_iOS_GPUFamily2_v3`
    i_os_gpufamily2_v3 = 6,
    /// `MTLFeatureSet_iOS_GPUFamily3_v2`
    i_os_gpufamily3_v2 = 7,
    /// `MTLFeatureSet_iOS_GPUFamily1_v4`
    i_os_gpufamily1_v4 = 8,
    /// `MTLFeatureSet_iOS_GPUFamily2_v4`
    i_os_gpufamily2_v4 = 9,
    /// `MTLFeatureSet_iOS_GPUFamily3_v3`
    i_os_gpufamily3_v3 = 10,
    /// `MTLFeatureSet_iOS_GPUFamily4_v1`
    i_os_gpufamily4_v1 = 11,
    /// `MTLFeatureSet_iOS_GPUFamily1_v5`
    i_os_gpufamily1_v5 = 12,
    /// `MTLFeatureSet_iOS_GPUFamily2_v5`
    i_os_gpufamily2_v5 = 13,
    /// `MTLFeatureSet_iOS_GPUFamily3_v4`
    i_os_gpufamily3_v4 = 14,
    /// `MTLFeatureSet_iOS_GPUFamily4_v2`
    i_os_gpufamily4_v2 = 15,
    /// `MTLFeatureSet_iOS_GPUFamily5_v1`
    i_os_gpufamily5_v1 = 16,
    /// `MTLFeatureSet_macOS_GPUFamily1_v1`
    mac_os_gpufamily1_v1 = 10000,
    /// `MTLFeatureSet_OSX_GPUFamily1_v1`
    osx_gpufamily1_v1 = 10000,
    /// `MTLFeatureSet_macOS_GPUFamily1_v2`
    mac_os_gpufamily1_v2 = 10001,
    /// `MTLFeatureSet_OSX_GPUFamily1_v2`
    osx_gpufamily1_v2 = 10001,
    /// `MTLFeatureSet_macOS_ReadWriteTextureTier2`
    mac_os_read_write_texture_tier2 = 10002,
    /// `MTLFeatureSet_OSX_ReadWriteTextureTier2`
    osx_read_write_texture_tier2 = 10002,
    /// `MTLFeatureSet_macOS_GPUFamily1_v3`
    mac_os_gpufamily1_v3 = 10003,
    /// `MTLFeatureSet_macOS_GPUFamily1_v4`
    mac_os_gpufamily1_v4 = 10004,
    /// `MTLFeatureSet_macOS_GPUFamily2_v1`
    mac_os_gpufamily2_v1 = 10005,
    /// `MTLFeatureSet_tvOS_GPUFamily1_v1`
    tv_os_gpufamily1_v1 = 30000,
    /// `MTLFeatureSet_TVOS_GPUFamily1_v1`
    tvos_gpufamily1_v1 = 30000,
    /// `MTLFeatureSet_tvOS_GPUFamily1_v2`
    tv_os_gpufamily1_v2 = 30001,
    /// `MTLFeatureSet_tvOS_GPUFamily1_v3`
    tv_os_gpufamily1_v3 = 30002,
    /// `MTLFeatureSet_tvOS_GPUFamily2_v1`
    tv_os_gpufamily2_v1 = 30003,
    /// `MTLFeatureSet_tvOS_GPUFamily1_v4`
    tv_os_gpufamily1_v4 = 30004,
    /// `MTLFeatureSet_tvOS_GPUFamily2_v2`
    tv_os_gpufamily2_v2 = 30005,
    _,
};

/// `MTLGPUFamily`
pub const GPUFamily = enum(isize) {
    /// `MTLGPUFamilyApple1`
    apple1 = 1001,
    /// `MTLGPUFamilyApple2`
    apple2 = 1002,
    /// `MTLGPUFamilyApple3`
    apple3 = 1003,
    /// `MTLGPUFamilyApple4`
    apple4 = 1004,
    /// `MTLGPUFamilyApple5`
    apple5 = 1005,
    /// `MTLGPUFamilyApple6`
    apple6 = 1006,
    /// `MTLGPUFamilyApple7`
    apple7 = 1007,
    /// `MTLGPUFamilyApple8`
    apple8 = 1008,
    /// `MTLGPUFamilyApple9`
    apple9 = 1009,
    /// `MTLGPUFamilyMac1`
    mac1 = 2001,
    /// `MTLGPUFamilyMac2`
    mac2 = 2002,
    /// `MTLGPUFamilyCommon1`
    common1 = 3001,
    /// `MTLGPUFamilyCommon2`
    common2 = 3002,
    /// `MTLGPUFamilyCommon3`
    common3 = 3003,
    /// `MTLGPUFamilyMacCatalyst1`
    mac_catalyst1 = 4001,
    /// `MTLGPUFamilyMacCatalyst2`
    mac_catalyst2 = 4002,
    /// `MTLGPUFamilyMetal3`
    metal3 = 5001,
    _,
};

/// `MTLDeviceLocation`
pub const DeviceLocation = enum(usize) {
    /// `MTLDeviceLocationBuiltIn`
    built_in = 0,
    /// `MTLDeviceLocationSlot`
    slot = 1,
    /// `MTLDeviceLocationExternal`
    external = 2,
    /// `MTLDeviceLocationUnspecified`
    unspecified = std.math.maxInt(usize),
    _,
};

/// `MTLPipelineOption`
pub const PipelineOption = packed struct(usize) {
    /// `MTLPipelineOptionArgumentInfo`
    argument_info: bool = false,
    /// `MTLPipelineOptionBufferTypeInfo`
    buffer_type_info: bool = false,
    /// `MTLPipelineOptionFailOnBinaryArchiveMiss`
    fail_on_binary_archive_miss: bool = false,
    _padding: u61 = 0,

    /// `MTLPipelineOptionNone`
    const none: PipelineOption = .{};
};

/// `MTLReadWriteTextureTier`
pub const ReadWriteTextureTier = enum(usize) {
    /// `MTLReadWriteTextureTierNone`
    none = 0,
    /// `MTLReadWriteTextureTier1`
    one = 1,
    /// `MTLReadWriteTextureTier2`
    two = 2,
    _,
};

/// `MTLArgumentBuffersTier`
pub const ArgumentBuffersTier = enum(usize) {
    /// `MTLArgumentBuffersTier1`
    one = 0,
    /// `MTLArgumentBuffersTier2`
    two = 1,
    _,
};

/// `MTLSparseTextureRegionAlignmentMode`
pub const SparseTextureRegionAlignmentMode = enum(usize) {
    /// `MTLSparseTextureRegionAlignmentModeOutward`
    outward = 0,
    /// `MTLSparseTextureRegionAlignmentModeInward`
    inward = 1,
    _,
};

/// `MTLSparsePageSize`
pub const SparsePageSize = enum(isize) {
    /// `MTLSparsePageSize16`
    kb_16 = 101,
    /// `MTLSparsePageSize64`
    kb_64 = 102,
    /// `MTLSparsePageSize256`
    kb_256 = 103,
    _,
};

/// `MTLCounterSamplingPoint`
pub const CounterSamplingPoint = enum(usize) {
    /// `MTLCounterSamplingPointAtStageBoundary`
    at_stage_boundary = 0,
    /// `MTLCounterSamplingPointAtDrawBoundary`
    at_draw_boundary = 1,
    /// `MTLCounterSamplingPointAtDispatchBoundary`
    at_dispatch_boundary = 2,
    /// `MTLCounterSamplingPointAtTileDispatchBoundary`
    at_tile_dispatch_boundary = 3,
    /// `MTLCounterSamplingPointAtBlitBoundary`
    at_blit_boundary = 4,
    _,
};

/// `MTLDynamicLibraryError`
pub const DynamicLibraryError = enum(usize) {
    /// `MTLDynamicLibraryErrorNone`
    none = 0,
    /// `MTLDynamicLibraryErrorInvalidFile`
    invalid_file = 1,
    /// `MTLDynamicLibraryErrorCompilationFailure`
    compilation_failure = 2,
    /// `MTLDynamicLibraryErrorUnresolvedInstallName`
    unresolved_install_name = 3,
    /// `MTLDynamicLibraryErrorDependencyLoadFailure`
    dependency_load_failure = 4,
    /// `MTLDynamicLibraryErrorUnsupported`
    unsupported = 5,
    _,
};

/// `MTLFunctionOptions`
pub const FunctionOptions = packed struct(usize) {
    /// `MTLFunctionOptionCompileToBinary`
    compile_to_binary: bool = false,
    /// `MTLFunctionOptionStoreFunctionInMetalScript`
    store_function_in_metal_script: bool = false,
    _padding: u62 = 0,

    /// `MTLFunctionOptionNone`
    pub const none: FunctionOptions = .{};
};

/// `MTLFunctionLogType`
pub const FunctionLogType = enum(usize) {
    /// `MTLFunctionLogTypeValidation`
    validation = 0,
    _,
};

/// `MTLHeapType`
pub const HeapType = enum(isize) {
    /// `MTLHeapTypeAutomatic`
    automatic = 0,
    /// `MTLHeapTypePlacement`
    placement = 1,
    /// `MTLHeapTypeSparse`
    sparse = 2,
    _,
};

/// `MTLIndirectCommandType`
pub const IndirectCommandType = packed struct(usize) {
    /// `MTLIndirectCommandTypeDraw`
    draw: bool = false,
    /// `MTLIndirectCommandTypeDrawIndexed`
    draw_indexed: bool = false,
    /// `MTLIndirectCommandTypeDrawPatches`
    draw_patches: bool = false,
    /// `MTLIndirectCommandTypeDrawIndexedPatches`
    draw_indexed_patches: bool = false,
    _padding1: u1 = 0,
    /// `MTLIndirectCommandTypeConcurrentDispatch`
    concurrent_dispatch: bool = false,
    /// `MTLIndirectCommandTypeConcurrentDispatchThreads`
    concurrent_dispatch_threads: bool = false,
    /// `MTLIndirectCommandTypeDrawMeshThreadgroups`
    draw_mesh_threadgroups: bool = false,
    /// `MTLIndirectCommandTypeDrawMeshThreads`
    draw_mesh_threads: bool = false,
    _padding2: u55 = 0,
};

/// `MTLIntersectionFunctionSignature`
pub const IntersectionFunctionSignature = packed struct(usize) {
    /// `MTLIntersectionFunctionSignatureInstancing`
    instancing: bool = false,
    /// `MTLIntersectionFunctionSignatureTriangleData`
    triangle_data: bool = false,
    /// `MTLIntersectionFunctionSignatureWorldSpaceData`
    world_space_data: bool = false,
    /// `MTLIntersectionFunctionSignatureInstanceMotion`
    instance_motion: bool = false,
    /// `MTLIntersectionFunctionSignaturePrimitiveMotion`
    primitive_motion: bool = false,
    /// `MTLIntersectionFunctionSignatureExtendedLimits`
    extended_limits: bool = false,
    /// `MTLIntersectionFunctionSignatureMaxLevels`
    max_levels: bool = false,
    /// `MTLIntersectionFunctionSignatureCurveData`
    curve_data: bool = false,
    _padding: u56 = false,

    /// `MTLIntersectionFunctionSignatureNone`
    pub const none: IntersectionFunctionSignature = .{};
};

/// `MTLIOStatus`
pub const IoStatus = enum(isize) {
    /// `MTLIOStatusPending`
    pending = 0,
    /// `MTLIOStatusCancelled`
    cancelled = 1,
    /// `MTLIOStatusError`
    err = 2,
    /// `MTLIOStatusComplete`
    complete = 3,
    _,
};

/// `MTLIOPriority`
pub const IoPriority = enum(isize) {
    /// `MTLIOPriorityHigh`
    high = 0,
    /// `MTLIOPriorityNormal`
    normal = 1,
    /// `MTLIOPriorityLow`
    low = 2,
    _,
};

/// `MTLIOCommandQueueType`
pub const IoCommandQueueType = enum(isize) {
    /// `MTLIOCommandQueueTypeConcurrent`
    concurrent = 0,
    /// `MTLIOCommandQueueTypeSerial`
    serial = 1,
    _,
};

/// `MTLIOError`
pub const IoError = enum(isize) {
    /// `MTLIOErrorURLInvalid`
    url_invalid = 1,
    /// `MTLIOErrorInternal`
    internal = 2,
    _,
};

/// `MTLPatchType`
pub const PatchType = enum(usize) {
    /// `MTLPatchTypeNone`
    none = 0,
    /// `MTLPatchTypeTriangle`
    triangle = 1,
    /// `MTLPatchTypeQuad`
    quad = 2,
    _,
};

/// `MTLFunctionType`
pub const FunctionType = enum(usize) {
    /// `MTLFunctionTypeVertex`
    vertex = 1,
    /// `MTLFunctionTypeFragment`
    fragment = 2,
    /// `MTLFunctionTypeKernel`
    kernel = 3,
    /// `MTLFunctionTypeVisible`
    visible = 5,
    /// `MTLFunctionTypeIntersection`
    intersection = 6,
    /// `MTLFunctionTypeMesh`
    mesh = 7,
    /// `MTLFunctionTypeObject`
    object = 8,
    _,
};

/// `MTLLanguageVersion`
pub const LanguageVersion = enum(usize) {
    /// `MTLLanguageVersion1_0`
    @"1.0" = 65536,
    /// `MTLLanguageVersion1_1`
    @"1.1" = 65537,
    /// `MTLLanguageVersion1_2`
    @"1.2" = 65538,
    /// `MTLLanguageVersion2_0`
    @"2.0" = 131072,
    /// `MTLLanguageVersion2_1`
    @"2.1" = 131073,
    /// `MTLLanguageVersion2_2`
    @"2.2" = 131074,
    /// `MTLLanguageVersion2_3`
    @"2.3" = 131075,
    /// `MTLLanguageVersion2_4`
    @"2.4" = 131076,
    /// `MTLLanguageVersion3_0`
    @"3.0" = 196608,
    /// `MTLLanguageVersion3_1`
    @"3.1" = 196609,
    _,
};

/// `MTLLibraryType`
pub const LibraryType = enum(isize) {
    /// `MTLLibraryTypeExecutable`
    executable = 0,
    /// `MTLLibraryTypeDynamic`
    dynamic = 1,
    _,
};

/// `MTLLibraryOptimizationLevel`
pub const LibraryOptimizationLevel = enum(isize) {
    /// `MTLLibraryOptimizationLevelDefault`
    default = 0,
    /// `MTLLibraryOptimizationLevelSize`
    size = 1,
    _,
};

/// `MTLCompileSymbolVisibility`
pub const CompileSymbolVisibility = enum(isize) {
    /// `MTLCompileSymbolVisibilityDefault`
    default = 0,
    /// `MTLCompileSymbolVisibilityHidden`
    hidden = 1,
    _,
};

/// `MTLLibraryError`
pub const LibraryError = enum(usize) {
    /// `MTLLibraryErrorUnsupported`
    unsupported = 1,
    /// `MTLLibraryErrorInternal`
    internal = 2,
    /// `MTLLibraryErrorCompileFailure`
    compile_failure = 3,
    /// `MTLLibraryErrorCompileWarning`
    compile_warning = 4,
    /// `MTLLibraryErrorFunctionNotFound`
    function_not_found = 5,
    /// `MTLLibraryErrorFileNotFound`
    file_not_found = 6,
    _,
};

/// `MTLMutability`
pub const Mutability = enum(usize) {
    /// `MTLMutabilityDefault`
    default = 0,
    /// `MTLMutabilityMutable`
    mutable = 1,
    /// `MTLMutabilityImmutable`
    immutable = 2,
    _,
};

/// `MTLPixelFormat`
pub const PixelFormat = enum(usize) {
    /// `MTLPixelFormatInvalid`
    invalid = 0,
    /// `MTLPixelFormatA8Unorm`
    a8_unorm = 1,
    /// `MTLPixelFormatR8Unorm`
    r8_unorm = 10,
    /// `MTLPixelFormatR8Unorm_sRGB`
    r8_unorm_srgb = 11,
    /// `MTLPixelFormatR8Snorm`
    r8_snorm = 12,
    /// `MTLPixelFormatR8Uint`
    r8_uint = 13,
    /// `MTLPixelFormatR8Sint`
    r8_sint = 14,
    /// `MTLPixelFormatR16Unorm`
    r16_unorm = 20,
    /// `MTLPixelFormatR16Snorm`
    r16_snorm = 22,
    /// `MTLPixelFormatR16Uint`
    r16_uint = 23,
    /// `MTLPixelFormatR16Sint`
    r16_sint = 24,
    /// `MTLPixelFormatR16Float`
    r16_float = 25,
    /// `MTLPixelFormatRG8Unorm`
    rg8_unorm = 30,
    /// `MTLPixelFormatRG8Unorm_sRGB`
    rg8_unorm_srgb = 31,
    /// `MTLPixelFormatRG8Snorm`
    rg8_snorm = 32,
    /// `MTLPixelFormatRG8Uint`
    rg8_uint = 33,
    /// `MTLPixelFormatRG8Sint`
    rg8_sint = 34,
    /// `MTLPixelFormatB5G6R5Unorm`
    b5_g6_r5_unorm = 40,
    /// `MTLPixelFormatA1BGR5Unorm`
    a1_bgr5_unorm = 41,
    /// `MTLPixelFormatABGR4Unorm`
    abgr4_unorm = 42,
    /// `MTLPixelFormatBGR5A1Unorm`
    bgr5_a1_unorm = 43,
    /// `MTLPixelFormatR32Uint`
    r32_uint = 53,
    /// `MTLPixelFormatR32Sint`
    r32_sint = 54,
    /// `MTLPixelFormatR32Float`
    r32_float = 55,
    /// `MTLPixelFormatRG16Unorm`
    rg16_unorm = 60,
    /// `MTLPixelFormatRG16Snorm`
    rg16_snorm = 62,
    /// `MTLPixelFormatRG16Uint`
    rg16_uint = 63,
    /// `MTLPixelFormatRG16Sint`
    rg16_sint = 64,
    /// `MTLPixelFormatRG16Float`
    rg16_float = 65,
    /// `MTLPixelFormatRGBA8Unorm`
    rgba8_unorm = 70,
    /// `MTLPixelFormatRGBA8Unorm_sRGB`
    rgba8_unorm_srgb = 71,
    /// `MTLPixelFormatRGBA8Snorm`
    rgba8_snorm = 72,
    /// `MTLPixelFormatRGBA8Uint`
    rgba8_uint = 73,
    /// `MTLPixelFormatRGBA8Sint`
    rgba8_sint = 74,
    /// `MTLPixelFormatBGRA8Unorm`
    bgra8_unorm = 80,
    /// `MTLPixelFormatBGRA8Unorm_sRGB`
    bgra8_unorm_srgb = 81,
    /// `MTLPixelFormatRGB10A2Unorm`
    rgb10_a2_unorm = 90,
    /// `MTLPixelFormatRGB10A2Uint`
    rgb10_a2_uint = 91,
    /// `MTLPixelFormatRG11B10Float`
    rg11_b10_float = 92,
    /// `MTLPixelFormatRGB9E5Float`
    rgb9_e5_float = 93,
    /// `MTLPixelFormatBGR10A2Unorm`
    bgr10_a2_unorm = 94,
    /// `MTLPixelFormatBGR10_XR`
    bgr10_xr = 554,
    /// `MTLPixelFormatBGR10_XR_sRGB`
    bgr10_xr_srgb = 555,
    /// `MTLPixelFormatRG32Uint`
    rg32_uint = 103,
    /// `MTLPixelFormatRG32Sint`
    rg32_sint = 104,
    /// `MTLPixelFormatRG32Float`
    rg32_float = 105,
    /// `MTLPixelFormatRGBA16Unorm`
    rgba16_unorm = 110,
    /// `MTLPixelFormatRGBA16Snorm`
    rgba16_snorm = 112,
    /// `MTLPixelFormatRGBA16Uint`
    rgba16_uint = 113,
    /// `MTLPixelFormatRGBA16Sint`
    rgba16_sint = 114,
    /// `MTLPixelFormatRGBA16Float`
    rgba16_float = 115,
    /// `MTLPixelFormatBGRA10_XR`
    bgra10_xr = 552,
    /// `MTLPixelFormatBGRA10_XR_sRGB`
    bgra10_xr_srgb = 553,
    /// `MTLPixelFormatRGBA32Uint`
    rgba32_uint = 123,
    /// `MTLPixelFormatRGBA32Sint`
    rgba32_sint = 124,
    /// `MTLPixelFormatRGBA32Float`
    rgba32_float = 125,
    /// `MTLPixelFormatBC1_RGBA`
    bc1_rgba = 130,
    /// `MTLPixelFormatBC1_RGBA_sRGB`
    bc1_rgba_srgb = 131,
    /// `MTLPixelFormatBC2_RGBA`
    bc2_rgba = 132,
    /// `MTLPixelFormatBC2_RGBA_sRGB`
    bc2_rgba_srgb = 133,
    /// `MTLPixelFormatBC3_RGBA`
    bc3_rgba = 134,
    /// `MTLPixelFormatBC3_RGBA_sRGB`
    bc3_rgba_srgb = 135,
    /// `MTLPixelFormatBC4_RUnorm`
    bc4_r_unorm = 140,
    /// `MTLPixelFormatBC4_RSnorm`
    bc4_r_snorm = 141,
    /// `MTLPixelFormatBC5_RGUnorm`
    bc5_rg_unorm = 142,
    /// `MTLPixelFormatBC5_RGSnorm`
    bc5_rg_snorm = 143,
    /// `MTLPixelFormatBC6H_RGBFloat`
    bc6_h_rgbfloat = 150,
    /// `MTLPixelFormatBC6H_RGBUfloat`
    bc6_h_rgbufloat = 151,
    /// `MTLPixelFormatBC7_RGBAUnorm`
    bc7_rgba_unorm = 152,
    /// `MTLPixelFormatBC7_RGBAUnorm_sRGB`
    bc7_rgba_unorm_srgb = 153,
    /// `MTLPixelFormatPVRTC_RGB_2BPP`
    pvrtc_rgb_2bpp = 160,
    /// `MTLPixelFormatPVRTC_RGB_2BPP_sRGB`
    pvrtc_rgb_2bpp_srgb = 161,
    /// `MTLPixelFormatPVRTC_RGB_4BPP`
    pvrtc_rgb_4bpp = 162,
    /// `MTLPixelFormatPVRTC_RGB_4BPP_sRGB`
    pvrtc_rgb_4bpp_srgb = 163,
    /// `MTLPixelFormatPVRTC_RGBA_2BPP`
    pvrtc_rgba_2bpp = 164,
    /// `MTLPixelFormatPVRTC_RGBA_2BPP_sRGB`
    pvrtc_rgba_2bpp_srgb = 165,
    /// `MTLPixelFormatPVRTC_RGBA_4BPP`
    pvrtc_rgba_4bpp = 166,
    /// `MTLPixelFormatPVRTC_RGBA_4BPP_sRGB`
    pvrtc_rgba_4bpp_srgb = 167,
    /// `MTLPixelFormatEAC_R11Unorm`
    eac_r11_unorm = 170,
    /// `MTLPixelFormatEAC_R11Snorm`
    eac_r11_snorm = 172,
    /// `MTLPixelFormatEAC_RG11Unorm`
    eac_rg11_unorm = 174,
    /// `MTLPixelFormatEAC_RG11Snorm`
    eac_rg11_snorm = 176,
    /// `MTLPixelFormatEAC_RGBA8`
    eac_rgba8 = 178,
    /// `MTLPixelFormatEAC_RGBA8_sRGB`
    eac_rgba8_srgb = 179,
    /// `MTLPixelFormatETC2_RGB8`
    etc2_rgb8 = 180,
    /// `MTLPixelFormatETC2_RGB8_sRGB`
    etc2_rgb8_srgb = 181,
    /// `MTLPixelFormatETC2_RGB8A1`
    etc2_rgb8_a1 = 182,
    /// `MTLPixelFormatETC2_RGB8A1_sRGB`
    etc2_rgb8_a1_srgb = 183,
    /// `MTLPixelFormatASTC_4x4_sRGB`
    astc_4x4_srgb = 186,
    /// `MTLPixelFormatASTC_5x4_sRGB`
    astc_5x4_srgb = 187,
    /// `MTLPixelFormatASTC_5x5_sRGB`
    astc_5x5_srgb = 188,
    /// `MTLPixelFormatASTC_6x5_sRGB`
    astc_6x5_srgb = 189,
    /// `MTLPixelFormatASTC_6x6_sRGB`
    astc_6x6_srgb = 190,
    /// `MTLPixelFormatASTC_8x5_sRGB`
    astc_8x5_srgb = 192,
    /// `MTLPixelFormatASTC_8x6_sRGB`
    astc_8x6_srgb = 193,
    /// `MTLPixelFormatASTC_8x8_sRGB`
    astc_8x8_srgb = 194,
    /// `MTLPixelFormatASTC_10x5_sRGB`
    astc_10x5_srgb = 195,
    /// `MTLPixelFormatASTC_10x6_sRGB`
    astc_10x6_srgb = 196,
    /// `MTLPixelFormatASTC_10x8_sRGB`
    astc_10x8_srgb = 197,
    /// `MTLPixelFormatASTC_10x10_sRGB`
    astc_10x10_srgb = 198,
    /// `MTLPixelFormatASTC_12x10_sRGB`
    astc_12x10_srgb = 199,
    /// `MTLPixelFormatASTC_12x12_sRGB`
    astc_12x12_srgb = 200,
    /// `MTLPixelFormatASTC_4x4_LDR`
    astc_4x4_ldr = 204,
    /// `MTLPixelFormatASTC_5x4_LDR`
    astc_5x4_ldr = 205,
    /// `MTLPixelFormatASTC_5x5_LDR`
    astc_5x5_ldr = 206,
    /// `MTLPixelFormatASTC_6x5_LDR`
    astc_6x5_ldr = 207,
    /// `MTLPixelFormatASTC_6x6_LDR`
    astc_6x6_ldr = 208,
    /// `MTLPixelFormatASTC_8x5_LDR`
    astc_8x5_ldr = 210,
    /// `MTLPixelFormatASTC_8x6_LDR`
    astc_8x6_ldr = 211,
    /// `MTLPixelFormatASTC_8x8_LDR`
    astc_8x8_ldr = 212,
    /// `MTLPixelFormatASTC_10x5_LDR`
    astc_10x5_ldr = 213,
    /// `MTLPixelFormatASTC_10x6_LDR`
    astc_10x6_ldr = 214,
    /// `MTLPixelFormatASTC_10x8_LDR`
    astc_10x8_ldr = 215,
    /// `MTLPixelFormatASTC_10x10_LDR`
    astc_10x10_ldr = 216,
    /// `MTLPixelFormatASTC_12x10_LDR`
    astc_12x10_ldr = 217,
    /// `MTLPixelFormatASTC_12x12_LDR`
    astc_12x12_ldr = 218,
    /// `MTLPixelFormatASTC_4x4_HDR`
    astc_4x4_hdr = 222,
    /// `MTLPixelFormatASTC_5x4_HDR`
    astc_5x4_hdr = 223,
    /// `MTLPixelFormatASTC_5x5_HDR`
    astc_5x5_hdr = 224,
    /// `MTLPixelFormatASTC_6x5_HDR`
    astc_6x5_hdr = 225,
    /// `MTLPixelFormatASTC_6x6_HDR`
    astc_6x6_hdr = 226,
    /// `MTLPixelFormatASTC_8x5_HDR`
    astc_8x5_hdr = 228,
    /// `MTLPixelFormatASTC_8x6_HDR`
    astc_8x6_hdr = 229,
    /// `MTLPixelFormatASTC_8x8_HDR`
    astc_8x8_hdr = 230,
    /// `MTLPixelFormatASTC_10x5_HDR`
    astc_10x5_hdr = 231,
    /// `MTLPixelFormatASTC_10x6_HDR`
    astc_10x6_hdr = 232,
    /// `MTLPixelFormatASTC_10x8_HDR`
    astc_10x8_hdr = 233,
    /// `MTLPixelFormatASTC_10x10_HDR`
    astc_10x10_hdr = 234,
    /// `MTLPixelFormatASTC_12x10_HDR`
    astc_12x10_hdr = 235,
    /// `MTLPixelFormatASTC_12x12_HDR`
    astc_12x12_hdr = 236,
    /// `MTLPixelFormatGBGR422`
    gbgr422 = 240,
    /// `MTLPixelFormatBGRG422`
    bgrg422 = 241,
    /// `MTLPixelFormatDepth16Unorm`
    depth16_unorm = 250,
    /// `MTLPixelFormatDepth32Float`
    depth32_float = 252,
    /// `MTLPixelFormatStencil8`
    stencil8 = 253,
    /// `MTLPixelFormatDepth24Unorm_Stencil8`
    depth24_unorm_stencil8 = 255,
    /// `MTLPixelFormatDepth32Float_Stencil8`
    depth32_float_stencil8 = 260,
    /// `MTLPixelFormatX32_Stencil8`
    x32_stencil8 = 261,
    /// `MTLPixelFormatX24_Stencil8`
    x24_stencil8 = 262,
    _,
};

/// `MTLPrimitiveType`
pub const PrimitiveType = enum(usize) {
    /// `MTLPrimitiveTypePoint`
    point = 0,
    /// `MTLPrimitiveTypeLine`
    line = 1,
    /// `MTLPrimitiveTypeLineStrip`
    line_strip = 2,
    /// `MTLPrimitiveTypeTriangle`
    triangle = 3,
    /// `MTLPrimitiveTypeTriangleStrip`
    triangle_strip = 4,
    _,
};

/// `MTLVisibilityResultMode`
pub const VisibilityResultMode = enum(usize) {
    /// `MTLVisibilityResultModeDisabled`
    disabled = 0,
    /// `MTLVisibilityResultModeBoolean`
    boolean = 1,
    /// `MTLVisibilityResultModeCounting`
    counting = 2,
    _,
};

/// `MTLCullMode`
pub const CullMode = enum(usize) {
    /// `MTLCullModeNone`
    none = 0,
    /// `MTLCullModeFront`
    front = 1,
    /// `MTLCullModeBack`
    back = 2,
    _,
};

/// `MTLWinding`
pub const Winding = enum(usize) {
    /// `MTLWindingClockwise`
    clockwise = 0,
    /// `MTLWindingCounterClockwise`
    counter_clockwise = 1,
    _,
};

/// `MTLDepthClipMode`
pub const DepthClipMode = enum(usize) {
    /// `MTLDepthClipModeClip`
    clip = 0,
    /// `MTLDepthClipModeClamp`
    clamp = 1,
    _,
};

/// `MTLTriangleFillMode`
pub const TriangleFillMode = enum(usize) {
    /// `MTLTriangleFillModeFill`
    fill = 0,
    /// `MTLTriangleFillModeLines`
    lines = 1,
    _,
};

/// `MTLRenderStages`
pub const RenderStages = packed struct(usize) {
    /// `MTLRenderStageVertex`
    vertex: bool = false,
    /// `MTLRenderStageFragment`
    fragment: bool = false,
    /// `MTLRenderStageTile`
    tile: bool = false,
    /// `MTLRenderStageObject`
    object: bool = false,
    /// `MTLRenderStageMesh`
    mesh: bool = false,
    _padding: u59 = 0,
};

/// `MTLLoadAction`
pub const LoadAction = enum(usize) {
    /// `MTLLoadActionDontCare`
    dont_care = 0,
    /// `MTLLoadActionLoad`
    load = 1,
    /// `MTLLoadActionClear`
    clear = 2,
    _,
};

/// `MTLStoreAction`
pub const StoreAction = enum(usize) {
    /// `MTLStoreActionDontCare`
    dont_care = 0,
    /// `MTLStoreActionStore`
    store = 1,
    /// `MTLStoreActionMultisampleResolve`
    multisample_resolve = 2,
    /// `MTLStoreActionStoreAndMultisampleResolve`
    store_and_multisample_resolve = 3,
    /// `MTLStoreActionUnknown`
    unknown = 4,
    /// `MTLStoreActionCustomSampleDepthStore`
    custom_sample_depth_store = 5,
    _,
};

/// `MTLStoreActionOptions`
pub const StoreActionOptions = packed struct(usize) {
    /// `MTLStoreActionOptionCustomSamplePositions`
    custom_sample_positions: bool = false,
    _padding: u63 = 0,

    /// `MTLStoreActionOptionNone`
    pub const none: StoreActionOptions = .{};
};

/// `MTLMultisampleDepthResolveFilter`
pub const MultisampleDepthResolveFilter = enum(usize) {
    /// `MTLMultisampleDepthResolveFilterSample0`
    sample0 = 0,
    /// `MTLMultisampleDepthResolveFilterMin`
    min = 1,
    /// `MTLMultisampleDepthResolveFilterMax`
    max = 2,
    _,
};

/// `MTLMultisampleStencilResolveFilter`
pub const MultisampleStencilResolveFilter = enum(usize) {
    /// `MTLMultisampleStencilResolveFilterSample0`
    sample0 = 0,
    /// `MTLMultisampleStencilResolveFilterDepthResolvedSample`
    depth_resolved_sample = 1,
    _,
};

/// `MTLBlendFactor`
pub const BlendFactor = enum(usize) {
    /// `MTLBlendFactorZero`
    zero = 0,
    /// `MTLBlendFactorOne`
    one = 1,
    /// `MTLBlendFactorSourceColor`
    source_color = 2,
    /// `MTLBlendFactorOneMinusSourceColor`
    one_minus_source_color = 3,
    /// `MTLBlendFactorSourceAlpha`
    source_alpha = 4,
    /// `MTLBlendFactorOneMinusSourceAlpha`
    one_minus_source_alpha = 5,
    /// `MTLBlendFactorDestinationColor`
    destination_color = 6,
    /// `MTLBlendFactorOneMinusDestinationColor`
    one_minus_destination_color = 7,
    /// `MTLBlendFactorDestinationAlpha`
    destination_alpha = 8,
    /// `MTLBlendFactorOneMinusDestinationAlpha`
    one_minus_destination_alpha = 9,
    /// `MTLBlendFactorSourceAlphaSaturated`
    source_alpha_saturated = 10,
    /// `MTLBlendFactorBlendColor`
    blend_color = 11,
    /// `MTLBlendFactorOneMinusBlendColor`
    one_minus_blend_color = 12,
    /// `MTLBlendFactorBlendAlpha`
    blend_alpha = 13,
    /// `MTLBlendFactorOneMinusBlendAlpha`
    one_minus_blend_alpha = 14,
    /// `MTLBlendFactorSource1Color`
    source1_color = 15,
    /// `MTLBlendFactorOneMinusSource1Color`
    one_minus_source1_color = 16,
    /// `MTLBlendFactorSource1Alpha`
    source1_alpha = 17,
    /// `MTLBlendFactorOneMinusSource1Alpha`
    one_minus_source1_alpha = 18,
    _,
};

/// `MTLBlendOperation`
pub const BlendOperation = enum(usize) {
    /// `MTLBlendOperationAdd`
    add = 0,
    /// `MTLBlendOperationSubtract`
    subtract = 1,
    /// `MTLBlendOperationReverseSubtract`
    reverse_subtract = 2,
    /// `MTLBlendOperationMin`
    min = 3,
    /// `MTLBlendOperationMax`
    max = 4,
    _,
};

/// `MTLColorWriteMask`
pub const ColorWriteMask = packed struct(usize) {
    /// `MTLColorWriteMaskAlpha`
    alpha: bool = false,
    /// `MTLColorWriteMaskBlue`
    blue: bool = false,
    /// `MTLColorWriteMaskGreen`
    green: bool = false,
    /// `MTLColorWriteMaskRed`
    red: bool = false,
    _padding: u60 = 0,

    /// `MTLColorWriteMaskNone`
    pub const none: ColorWriteMask = .{};
    /// `MTLColorWriteMaskAll`
    pub const all: ColorWriteMask = .{
        .alpha = true,
        .blue = true,
        .green = true,
        .red = true,
    };
};

/// `MTLPrimitiveTopologyClass`
pub const PrimitiveTopologyClass = enum(usize) {
    /// `MTLPrimitiveTopologyClassUnspecified`
    unspecified = 0,
    /// `MTLPrimitiveTopologyClassPoint`
    point = 1,
    /// `MTLPrimitiveTopologyClassLine`
    line = 2,
    /// `MTLPrimitiveTopologyClassTriangle`
    triangle = 3,
    _,
};

/// `MTLTessellationPartitionMode`
pub const TessellationPartitionMode = enum(usize) {
    /// `MTLTessellationPartitionModePow2`
    pow2 = 0,
    /// `MTLTessellationPartitionModeInteger`
    integer = 1,
    /// `MTLTessellationPartitionModeFractionalOdd`
    fractional_odd = 2,
    /// `MTLTessellationPartitionModeFractionalEven`
    fractional_even = 3,
    _,
};

/// `MTLTessellationFactorStepFunction`
pub const TessellationFactorStepFunction = enum(usize) {
    /// `MTLTessellationFactorStepFunctionConstant`
    constant = 0,
    /// `MTLTessellationFactorStepFunctionPerPatch`
    per_patch = 1,
    /// `MTLTessellationFactorStepFunctionPerInstance`
    per_instance = 2,
    /// `MTLTessellationFactorStepFunctionPerPatchAndPerInstance`
    per_patch_and_per_instance = 3,
    _,
};

/// `MTLTessellationFactorFormat`
pub const TessellationFactorFormat = enum(usize) {
    /// `MTLTessellationFactorFormatHalf`
    half = 0,
    _,
};

/// `MTLTessellationControlPointIndexType`
pub const TessellationControlPointIndexType = enum(usize) {
    /// `MTLTessellationControlPointIndexTypeNone`
    none = 0,
    /// `MTLTessellationControlPointIndexTypeUInt16`
    uint16 = 1,
    /// `MTLTessellationControlPointIndexTypeUInt32`
    uint32 = 2,
    _,
};

/// `MTLPurgeableState`
pub const PurgeableState = enum(usize) {
    /// `MTLPurgeableStateKeepCurrent`
    keep_current = 1,
    /// `MTLPurgeableStateNonVolatile`
    non_volatile = 2,
    /// `MTLPurgeableStateVolatile`
    @"volatile" = 3,
    /// `MTLPurgeableStateEmpty`
    empty = 4,
    _,
};

/// `MTLCPUCacheMode`
pub const CpuCacheMode = enum(usize) {
    /// `MTLCPUCacheModeDefaultCache`
    default_cache = 0,
    /// `MTLCPUCacheModeWriteCombined`
    write_combined = 1,
    _,
};

/// `MTLStorageMode`
pub const StorageMode = enum(usize) {
    /// `MTLStorageModeShared`
    shared = 0,
    /// `MTLStorageModeManaged`
    managed = 1,
    /// `MTLStorageModePrivate`
    private = 2,
    /// `MTLStorageModeMemoryless`
    memoryless = 3,
    _,
};

/// `MTLHazardTrackingMode`
pub const HazardTrackingMode = enum(usize) {
    /// `MTLHazardTrackingModeDefault`
    default = 0,
    /// `MTLHazardTrackingModeUntracked`
    untracked = 1,
    /// `MTLHazardTrackingModeTracked`
    tracked = 2,
    _,
};

/// `MTLResourceOptions`
pub const ResourceOptions = packed struct(usize) {
    cpu_cache_mode: Cpu = std.mem.zeroes(Cpu),
    storage_mode: Storage = std.mem.zeroes(Storage),
    hazard_tracking: Hazard = std.mem.zeroes(Hazard),
    _padding: u54 = 0,

    pub const Cpu = enum(u4) {
        /// `MTLResourceCPUCacheModeDefaultCache`
        default_cache = @intFromEnum(CpuCacheMode.default_cache),
        /// `MTLResourceCPUCacheModeWriteCombined`
        write_combined = @intFromEnum(CpuCacheMode.write_combined),
        _,
    };

    pub const Storage = enum(u4) {
        /// `MTLResourceStorageModeShared`
        shared = @intFromEnum(StorageMode.shared),
        /// `MTLResourceStorageModeManaged`
        managed = @intFromEnum(StorageMode.managed),
        /// `MTLResourceStorageModePrivate`
        private = @intFromEnum(StorageMode.private),
        /// `MTLResourceStorageModeMemoryless`
        memoryless = @intFromEnum(StorageMode.memoryless),
        _,
    };

    pub const Hazard = enum(u2) {
        /// `MTLResourceHazardTrackingModeDefault`
        default = @intFromEnum(HazardTrackingMode.default),
        /// `MTLResourceHazardTrackingModeUntracked`
        untracked = @intFromEnum(HazardTrackingMode.untracked),
        /// `MTLResourceHazardTrackingModeTracked`
        tracked = @intFromEnum(HazardTrackingMode.tracked),
        _,
    };
};

/// `MTLSparseTextureMappingMode`
pub const SparseTextureMappingMode = enum(usize) {
    /// `MTLSparseTextureMappingModeMap`
    map = 0,
    /// `MTLSparseTextureMappingModeUnmap`
    unmap = 1,
    _,
};

/// `MTLSamplerMinMagFilter`
pub const SamplerMinMagFilter = enum(usize) {
    /// `MTLSamplerMinMagFilterNearest`
    nearest = 0,
    /// `MTLSamplerMinMagFilterLinear`
    linear = 1,
    _,
};

/// `MTLSamplerMipFilter`
pub const SamplerMipFilter = enum(usize) {
    /// `MTLSamplerMipFilterNotMipmapped`
    not_mipmapped = 0,
    /// `MTLSamplerMipFilterNearest`
    nearest = 1,
    /// `MTLSamplerMipFilterLinear`
    linear = 2,
    _,
};

/// `MTLSamplerAddressMode`
pub const SamplerAddressMode = enum(usize) {
    /// `MTLSamplerAddressModeClampToEdge`
    clamp_to_edge = 0,
    /// `MTLSamplerAddressModeMirrorClampToEdge`
    mirror_clamp_to_edge = 1,
    /// `MTLSamplerAddressModeRepeat`
    repeat = 2,
    /// `MTLSamplerAddressModeMirrorRepeat`
    mirror_repeat = 3,
    /// `MTLSamplerAddressModeClampToZero`
    clamp_to_zero = 4,
    /// `MTLSamplerAddressModeClampToBorderColor`
    clamp_to_border_color = 5,
    _,
};

/// `MTLSamplerBorderColor`
pub const SamplerBorderColor = enum(usize) {
    /// `MTLSamplerBorderColorTransparentBlack`
    transparent_black = 0,
    /// `MTLSamplerBorderColorOpaqueBlack`
    opaque_black = 1,
    /// `MTLSamplerBorderColorOpaqueWhite`
    opaque_white = 2,
    _,
};

/// `MTLAttributeFormat`
pub const AttributeFormat = enum(usize) {
    /// `MTLAttributeFormatInvalid`
    invalid = 0,
    /// `MTLAttributeFormatUChar2`
    uchar2 = 1,
    /// `MTLAttributeFormatUChar3`
    uchar3 = 2,
    /// `MTLAttributeFormatUChar4`
    uchar4 = 3,
    /// `MTLAttributeFormatChar2`
    char2 = 4,
    /// `MTLAttributeFormatChar3`
    char3 = 5,
    /// `MTLAttributeFormatChar4`
    char4 = 6,
    /// `MTLAttributeFormatUChar2Normalized`
    uchar2_normalized = 7,
    /// `MTLAttributeFormatUChar3Normalized`
    uchar3_normalized = 8,
    /// `MTLAttributeFormatUChar4Normalized`
    uchar4_normalized = 9,
    /// `MTLAttributeFormatChar2Normalized`
    char2_normalized = 10,
    /// `MTLAttributeFormatChar3Normalized`
    char3_normalized = 11,
    /// `MTLAttributeFormatChar4Normalized`
    char4_normalized = 12,
    /// `MTLAttributeFormatUShort2`
    ushort2 = 13,
    /// `MTLAttributeFormatUShort3`
    ushort3 = 14,
    /// `MTLAttributeFormatUShort4`
    ushort4 = 15,
    /// `MTLAttributeFormatShort2`
    short2 = 16,
    /// `MTLAttributeFormatShort3`
    short3 = 17,
    /// `MTLAttributeFormatShort4`
    short4 = 18,
    /// `MTLAttributeFormatUShort2Normalized`
    ushort2_normalized = 19,
    /// `MTLAttributeFormatUShort3Normalized`
    ushort3_normalized = 20,
    /// `MTLAttributeFormatUShort4Normalized`
    ushort4_normalized = 21,
    /// `MTLAttributeFormatShort2Normalized`
    short2_normalized = 22,
    /// `MTLAttributeFormatShort3Normalized`
    short3_normalized = 23,
    /// `MTLAttributeFormatShort4Normalized`
    short4_normalized = 24,
    /// `MTLAttributeFormatHalf2`
    half2 = 25,
    /// `MTLAttributeFormatHalf3`
    half3 = 26,
    /// `MTLAttributeFormatHalf4`
    half4 = 27,
    /// `MTLAttributeFormatFloat`
    float = 28,
    /// `MTLAttributeFormatFloat2`
    float2 = 29,
    /// `MTLAttributeFormatFloat3`
    float3 = 30,
    /// `MTLAttributeFormatFloat4`
    float4 = 31,
    /// `MTLAttributeFormatInt`
    int = 32,
    /// `MTLAttributeFormatInt2`
    int2 = 33,
    /// `MTLAttributeFormatInt3`
    int3 = 34,
    /// `MTLAttributeFormatInt4`
    int4 = 35,
    /// `MTLAttributeFormatUInt`
    uint = 36,
    /// `MTLAttributeFormatUInt2`
    uint2 = 37,
    /// `MTLAttributeFormatUInt3`
    uint3 = 38,
    /// `MTLAttributeFormatUInt4`
    uint4 = 39,
    /// `MTLAttributeFormatInt1010102Normalized`
    int1010102_normalized = 40,
    /// `MTLAttributeFormatUInt1010102Normalized`
    uint1010102_normalized = 41,
    /// `MTLAttributeFormatUChar4Normalized_BGRA`
    uchar4_normalized_bgra = 42,
    /// `MTLAttributeFormatUChar`
    uchar = 45,
    /// `MTLAttributeFormatChar`
    char = 46,
    /// `MTLAttributeFormatUCharNormalized`
    uchar_normalized = 47,
    /// `MTLAttributeFormatCharNormalized`
    char_normalized = 48,
    /// `MTLAttributeFormatUShort`
    ushort = 49,
    /// `MTLAttributeFormatShort`
    short = 50,
    /// `MTLAttributeFormatUShortNormalized`
    ushort_normalized = 51,
    /// `MTLAttributeFormatShortNormalized`
    short_normalized = 52,
    /// `MTLAttributeFormatHalf`
    half = 53,
    /// `MTLAttributeFormatFloatRG11B10`
    float_rg11_b10 = 54,
    /// `MTLAttributeFormatFloatRGB9E5`
    float_rgb9_e5 = 55,
    _,
};

/// `MTLIndexType`
pub const IndexType = enum(usize) {
    /// `MTLIndexTypeUInt16`
    uint16 = 0,
    /// `MTLIndexTypeUInt32`
    uint32 = 1,
    _,
};

/// `MTLStepFunction`
pub const StepFunction = enum(usize) {
    /// `MTLStepFunctionConstant`
    constant = 0,
    /// `MTLStepFunctionPerVertex`
    per_vertex = 1,
    /// `MTLStepFunctionPerInstance`
    per_instance = 2,
    /// `MTLStepFunctionPerPatch`
    per_patch = 3,
    /// `MTLStepFunctionPerPatchControlPoint`
    per_patch_control_point = 4,
    /// `MTLStepFunctionThreadPositionInGridX`
    thread_position_in_grid_x = 5,
    /// `MTLStepFunctionThreadPositionInGridY`
    thread_position_in_grid_y = 6,
    /// `MTLStepFunctionThreadPositionInGridXIndexed`
    thread_position_in_grid_xindexed = 7,
    /// `MTLStepFunctionThreadPositionInGridYIndexed`
    thread_position_in_grid_yindexed = 8,
    _,
};

/// `MTLTextureType`
pub const TextureType = enum(usize) {
    /// `MTLTextureType1D`
    one_d = 0,
    /// `MTLTextureType1DArray`
    one_d_array = 1,
    /// `MTLTextureType2D`
    two_d = 2,
    /// `MTLTextureType2DArray`
    two_d_array = 3,
    /// `MTLTextureType2DMultisample`
    two_d_multisample = 4,
    /// `MTLTextureTypeCube`
    cube = 5,
    /// `MTLTextureTypeCubeArray`
    cube_array = 6,
    /// `MTLTextureType3D`
    three_d = 7,
    /// `MTLTextureType2DMultisampleArray`
    two_d_multisample_array = 8,
    /// `MTLTextureTypeTextureBuffer`
    texture_buffer = 9,
    _,
};

/// `MTLTextureSwizzle`
pub const TextureSwizzle = enum(u8) {
    /// `MTLTextureSwizzleZero`
    zero = 0,
    /// `MTLTextureSwizzleOne`
    one = 1,
    /// `MTLTextureSwizzleRed`
    red = 2,
    /// `MTLTextureSwizzleGreen`
    green = 3,
    /// `MTLTextureSwizzleBlue`
    blue = 4,
    /// `MTLTextureSwizzleAlpha`
    alpha = 5,
    _,
};

/// `MTLTextureUsage`
pub const TextureUsage = packed struct(usize) {
    /// `MTLTextureUsageShaderRead`
    shader_read: bool = false,
    /// `MTLTextureUsageShaderWrite`
    shader_write: bool = false,
    /// `MTLTextureUsageRenderTarget`
    render_target: bool = false,
    _padding1: u1 = 0,
    /// `MTLTextureUsagePixelFormatView`
    pixel_format_view: bool = false,
    /// `MTLTextureUsageShaderAtomic`
    shader_atomic: bool = false,
    _padding2: u58 = 0,

    /// `MTLTextureUsageUnknown`
    pub const unknown: TextureUsage = .{};
};

/// `MTLTextureCompressionType`
pub const TextureCompressionType = enum(isize) {
    /// `MTLTextureCompressionTypeLossless`
    lossless = 0,
    /// `MTLTextureCompressionTypeLossy`
    lossy = 1,
    _,
};

/// `MTLVertexFormat`
pub const VertexFormat = enum(usize) {
    /// `MTLVertexFormatInvalid`
    invalid = 0,
    /// `MTLVertexFormatUChar2`
    uchar2 = 1,
    /// `MTLVertexFormatUChar3`
    uchar3 = 2,
    /// `MTLVertexFormatUChar4`
    uchar4 = 3,
    /// `MTLVertexFormatChar2`
    char2 = 4,
    /// `MTLVertexFormatChar3`
    char3 = 5,
    /// `MTLVertexFormatChar4`
    char4 = 6,
    /// `MTLVertexFormatUChar2Normalized`
    uchar2_normalized = 7,
    /// `MTLVertexFormatUChar3Normalized`
    uchar3_normalized = 8,
    /// `MTLVertexFormatUChar4Normalized`
    uchar4_normalized = 9,
    /// `MTLVertexFormatChar2Normalized`
    char2_normalized = 10,
    /// `MTLVertexFormatChar3Normalized`
    char3_normalized = 11,
    /// `MTLVertexFormatChar4Normalized`
    char4_normalized = 12,
    /// `MTLVertexFormatUShort2`
    ushort2 = 13,
    /// `MTLVertexFormatUShort3`
    ushort3 = 14,
    /// `MTLVertexFormatUShort4`
    ushort4 = 15,
    /// `MTLVertexFormatShort2`
    short2 = 16,
    /// `MTLVertexFormatShort3`
    short3 = 17,
    /// `MTLVertexFormatShort4`
    short4 = 18,
    /// `MTLVertexFormatUShort2Normalized`
    ushort2_normalized = 19,
    /// `MTLVertexFormatUShort3Normalized`
    ushort3_normalized = 20,
    /// `MTLVertexFormatUShort4Normalized`
    ushort4_normalized = 21,
    /// `MTLVertexFormatShort2Normalized`
    short2_normalized = 22,
    /// `MTLVertexFormatShort3Normalized`
    short3_normalized = 23,
    /// `MTLVertexFormatShort4Normalized`
    short4_normalized = 24,
    /// `MTLVertexFormatHalf2`
    half2 = 25,
    /// `MTLVertexFormatHalf3`
    half3 = 26,
    /// `MTLVertexFormatHalf4`
    half4 = 27,
    /// `MTLVertexFormatFloat`
    float = 28,
    /// `MTLVertexFormatFloat2`
    float2 = 29,
    /// `MTLVertexFormatFloat3`
    float3 = 30,
    /// `MTLVertexFormatFloat4`
    float4 = 31,
    /// `MTLVertexFormatInt`
    int = 32,
    /// `MTLVertexFormatInt2`
    int2 = 33,
    /// `MTLVertexFormatInt3`
    int3 = 34,
    /// `MTLVertexFormatInt4`
    int4 = 35,
    /// `MTLVertexFormatUInt`
    uint = 36,
    /// `MTLVertexFormatUInt2`
    uint2 = 37,
    /// `MTLVertexFormatUInt3`
    uint3 = 38,
    /// `MTLVertexFormatUInt4`
    uint4 = 39,
    /// `MTLVertexFormatInt1010102Normalized`
    int1010102_normalized = 40,
    /// `MTLVertexFormatUInt1010102Normalized`
    uint1010102_normalized = 41,
    /// `MTLVertexFormatUChar4Normalized_BGRA`
    uchar4_normalized_bgra = 42,
    /// `MTLVertexFormatUChar`
    uchar = 45,
    /// `MTLVertexFormatChar`
    char = 46,
    /// `MTLVertexFormatUCharNormalized`
    uchar_normalized = 47,
    /// `MTLVertexFormatCharNormalized`
    char_normalized = 48,
    /// `MTLVertexFormatUShort`
    ushort = 49,
    /// `MTLVertexFormatShort`
    short = 50,
    /// `MTLVertexFormatUShortNormalized`
    ushort_normalized = 51,
    /// `MTLVertexFormatShortNormalized`
    short_normalized = 52,
    /// `MTLVertexFormatHalf`
    half = 53,
    /// `MTLVertexFormatFloatRG11B10`
    float_rg11_b10 = 54,
    /// `MTLVertexFormatFloatRGB9E5`
    float_rgb9_e5 = 55,
    _,
};

/// `MTLVertexStepFunction`
pub const VertexStepFunction = enum(usize) {
    /// `MTLVertexStepFunctionConstant`
    constant = 0,
    /// `MTLVertexStepFunctionPerVertex`
    per_vertex = 1,
    /// `MTLVertexStepFunctionPerInstance`
    per_instance = 2,
    /// `MTLVertexStepFunctionPerPatch`
    per_patch = 3,
    /// `MTLVertexStepFunctionPerPatchControlPoint`
    per_patch_control_point = 4,
    _,
};

/// `MTLAccelerationStructureDescriptor`
pub const AccelerationStructureDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLAccelerationStructureDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructureDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructureDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAccelerationStructureDescriptor usage]
    pub fn usage(self: *@This()) AccelerationStructureUsage {
        return objc.msgSend(self, "usage", AccelerationStructureUsage, .{});
    }
    /// `-[MTLAccelerationStructureDescriptor setUsage:]
    pub fn setUsage_(self: *@This(), usage: AccelerationStructureUsage) void {
        return objc.msgSend(self, "setUsage:", void, .{usage});
    }
};

/// `MTLAccelerationStructureGeometryDescriptor`
pub const AccelerationStructureGeometryDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLAccelerationStructureGeometryDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructureGeometryDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructureGeometryDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAccelerationStructureGeometryDescriptor intersectionFunctionTableOffset]
    pub fn intersectionFunctionTableOffset(self: *@This()) usize {
        return objc.msgSend(self, "intersectionFunctionTableOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setIntersectionFunctionTableOffset:]
    pub fn setIntersectionFunctionTableOffset_(self: *@This(), intersection_function_table_offset: usize) void {
        return objc.msgSend(self, "setIntersectionFunctionTableOffset:", void, .{intersection_function_table_offset});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor opaque]
    pub fn @"opaque"(self: *@This()) bool {
        return objc.msgSend(self, "opaque", bool, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setOpaque:]
    pub fn setOpaque_(self: *@This(), is_opaque: bool) void {
        return objc.msgSend(self, "setOpaque:", void, .{is_opaque});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor allowDuplicateIntersectionFunctionInvocation]
    pub fn allowDuplicateIntersectionFunctionInvocation(self: *@This()) bool {
        return objc.msgSend(self, "allowDuplicateIntersectionFunctionInvocation", bool, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setAllowDuplicateIntersectionFunctionInvocation:]
    pub fn setAllowDuplicateIntersectionFunctionInvocation_(self: *@This(), allow_duplicate_intersection_function_invocation: bool) void {
        return objc.msgSend(self, "setAllowDuplicateIntersectionFunctionInvocation:", void, .{allow_duplicate_intersection_function_invocation});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor primitiveDataBuffer]
    pub fn primitiveDataBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "primitiveDataBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setPrimitiveDataBuffer:]
    pub fn setPrimitiveDataBuffer_(self: *@This(), primitive_data_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setPrimitiveDataBuffer:", void, .{primitive_data_buffer});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor primitiveDataBufferOffset]
    pub fn primitiveDataBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "primitiveDataBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setPrimitiveDataBufferOffset:]
    pub fn setPrimitiveDataBufferOffset_(self: *@This(), primitive_data_buffer_offset: usize) void {
        return objc.msgSend(self, "setPrimitiveDataBufferOffset:", void, .{primitive_data_buffer_offset});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor primitiveDataStride]
    pub fn primitiveDataStride(self: *@This()) usize {
        return objc.msgSend(self, "primitiveDataStride", usize, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setPrimitiveDataStride:]
    pub fn setPrimitiveDataStride_(self: *@This(), primitive_data_stride: usize) void {
        return objc.msgSend(self, "setPrimitiveDataStride:", void, .{primitive_data_stride});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor primitiveDataElementSize]
    pub fn primitiveDataElementSize(self: *@This()) usize {
        return objc.msgSend(self, "primitiveDataElementSize", usize, .{});
    }
    /// `-[MTLAccelerationStructureGeometryDescriptor setPrimitiveDataElementSize:]
    pub fn setPrimitiveDataElementSize_(self: *@This(), primitive_data_element_size: usize) void {
        return objc.msgSend(self, "setPrimitiveDataElementSize:", void, .{primitive_data_element_size});
    }
};

/// `MTLPrimitiveAccelerationStructureDescriptor`
pub const PrimitiveAccelerationStructureDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), AccelerationStructureDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLPrimitiveAccelerationStructureDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLPrimitiveAccelerationStructureDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLPrimitiveAccelerationStructureDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLPrimitiveAccelerationStructureDescriptor descriptor]
    pub fn descriptor() *@This() {
        return objc.msgSend(InternalInfo.class(), "descriptor", *@This(), .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor geometryDescriptors]
    pub fn geometryDescriptors(self: *@This()) ?*ns.Array(*AccelerationStructureGeometryDescriptor) {
        return objc.msgSend(self, "geometryDescriptors", ?*ns.Array(*AccelerationStructureGeometryDescriptor), .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor setGeometryDescriptors:]
    pub fn setGeometryDescriptors_(self: *@This(), geometry_descriptors: ?*ns.Array(*AccelerationStructureGeometryDescriptor)) void {
        return objc.msgSend(self, "setGeometryDescriptors:", void, .{geometry_descriptors});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor motionStartBorderMode]
    pub fn motionStartBorderMode(self: *@This()) MotionBorderMode {
        return objc.msgSend(self, "motionStartBorderMode", MotionBorderMode, .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor setMotionStartBorderMode:]
    pub fn setMotionStartBorderMode_(self: *@This(), motion_start_border_mode: MotionBorderMode) void {
        return objc.msgSend(self, "setMotionStartBorderMode:", void, .{motion_start_border_mode});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor motionEndBorderMode]
    pub fn motionEndBorderMode(self: *@This()) MotionBorderMode {
        return objc.msgSend(self, "motionEndBorderMode", MotionBorderMode, .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor setMotionEndBorderMode:]
    pub fn setMotionEndBorderMode_(self: *@This(), motion_end_border_mode: MotionBorderMode) void {
        return objc.msgSend(self, "setMotionEndBorderMode:", void, .{motion_end_border_mode});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor motionStartTime]
    pub fn motionStartTime(self: *@This()) f32 {
        return objc.msgSend(self, "motionStartTime", f32, .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor setMotionStartTime:]
    pub fn setMotionStartTime_(self: *@This(), motion_start_time: f32) void {
        return objc.msgSend(self, "setMotionStartTime:", void, .{motion_start_time});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor motionEndTime]
    pub fn motionEndTime(self: *@This()) f32 {
        return objc.msgSend(self, "motionEndTime", f32, .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor setMotionEndTime:]
    pub fn setMotionEndTime_(self: *@This(), motion_end_time: f32) void {
        return objc.msgSend(self, "setMotionEndTime:", void, .{motion_end_time});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor motionKeyframeCount]
    pub fn motionKeyframeCount(self: *@This()) usize {
        return objc.msgSend(self, "motionKeyframeCount", usize, .{});
    }
    /// `-[MTLPrimitiveAccelerationStructureDescriptor setMotionKeyframeCount:]
    pub fn setMotionKeyframeCount_(self: *@This(), motion_keyframe_count: usize) void {
        return objc.msgSend(self, "setMotionKeyframeCount:", void, .{motion_keyframe_count});
    }
};

/// `MTLAccelerationStructureTriangleGeometryDescriptor`
pub const AccelerationStructureTriangleGeometryDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), AccelerationStructureGeometryDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLAccelerationStructureTriangleGeometryDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructureTriangleGeometryDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructureTriangleGeometryDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLAccelerationStructureTriangleGeometryDescriptor descriptor]
    pub fn descriptor() *@This() {
        return objc.msgSend(InternalInfo.class(), "descriptor", *@This(), .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor vertexBuffer]
    pub fn vertexBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "vertexBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setVertexBuffer:]
    pub fn setVertexBuffer_(self: *@This(), vertex_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setVertexBuffer:", void, .{vertex_buffer});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor vertexBufferOffset]
    pub fn vertexBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "vertexBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setVertexBufferOffset:]
    pub fn setVertexBufferOffset_(self: *@This(), vertex_buffer_offset: usize) void {
        return objc.msgSend(self, "setVertexBufferOffset:", void, .{vertex_buffer_offset});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor vertexFormat]
    pub fn vertexFormat(self: *@This()) AttributeFormat {
        return objc.msgSend(self, "vertexFormat", AttributeFormat, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setVertexFormat:]
    pub fn setVertexFormat_(self: *@This(), vertex_format: AttributeFormat) void {
        return objc.msgSend(self, "setVertexFormat:", void, .{vertex_format});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor vertexStride]
    pub fn vertexStride(self: *@This()) usize {
        return objc.msgSend(self, "vertexStride", usize, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setVertexStride:]
    pub fn setVertexStride_(self: *@This(), vertex_stride: usize) void {
        return objc.msgSend(self, "setVertexStride:", void, .{vertex_stride});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor indexBuffer]
    pub fn indexBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "indexBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setIndexBuffer:]
    pub fn setIndexBuffer_(self: *@This(), index_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setIndexBuffer:", void, .{index_buffer});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor indexBufferOffset]
    pub fn indexBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "indexBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setIndexBufferOffset:]
    pub fn setIndexBufferOffset_(self: *@This(), index_buffer_offset: usize) void {
        return objc.msgSend(self, "setIndexBufferOffset:", void, .{index_buffer_offset});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor indexType]
    pub fn indexType(self: *@This()) IndexType {
        return objc.msgSend(self, "indexType", IndexType, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setIndexType:]
    pub fn setIndexType_(self: *@This(), index_type: IndexType) void {
        return objc.msgSend(self, "setIndexType:", void, .{index_type});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor triangleCount]
    pub fn triangleCount(self: *@This()) usize {
        return objc.msgSend(self, "triangleCount", usize, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setTriangleCount:]
    pub fn setTriangleCount_(self: *@This(), triangle_count: usize) void {
        return objc.msgSend(self, "setTriangleCount:", void, .{triangle_count});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBuffer]
    pub fn transformationMatrixBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "transformationMatrixBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setTransformationMatrixBuffer:]
    pub fn setTransformationMatrixBuffer_(self: *@This(), transformation_matrix_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setTransformationMatrixBuffer:", void, .{transformation_matrix_buffer});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBufferOffset]
    pub fn transformationMatrixBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "transformationMatrixBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureTriangleGeometryDescriptor setTransformationMatrixBufferOffset:]
    pub fn setTransformationMatrixBufferOffset_(self: *@This(), transformation_matrix_buffer_offset: usize) void {
        return objc.msgSend(self, "setTransformationMatrixBufferOffset:", void, .{transformation_matrix_buffer_offset});
    }
};

/// `MTLAccelerationStructureBoundingBoxGeometryDescriptor`
pub const AccelerationStructureBoundingBoxGeometryDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), AccelerationStructureGeometryDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLAccelerationStructureBoundingBoxGeometryDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructureBoundingBoxGeometryDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructureBoundingBoxGeometryDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLAccelerationStructureBoundingBoxGeometryDescriptor descriptor]
    pub fn descriptor() *@This() {
        return objc.msgSend(InternalInfo.class(), "descriptor", *@This(), .{});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxBuffer]
    pub fn boundingBoxBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "boundingBoxBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor setBoundingBoxBuffer:]
    pub fn setBoundingBoxBuffer_(self: *@This(), bounding_box_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setBoundingBoxBuffer:", void, .{bounding_box_buffer});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxBufferOffset]
    pub fn boundingBoxBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "boundingBoxBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor setBoundingBoxBufferOffset:]
    pub fn setBoundingBoxBufferOffset_(self: *@This(), bounding_box_buffer_offset: usize) void {
        return objc.msgSend(self, "setBoundingBoxBufferOffset:", void, .{bounding_box_buffer_offset});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxStride]
    pub fn boundingBoxStride(self: *@This()) usize {
        return objc.msgSend(self, "boundingBoxStride", usize, .{});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor setBoundingBoxStride:]
    pub fn setBoundingBoxStride_(self: *@This(), bounding_box_stride: usize) void {
        return objc.msgSend(self, "setBoundingBoxStride:", void, .{bounding_box_stride});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor boundingBoxCount]
    pub fn boundingBoxCount(self: *@This()) usize {
        return objc.msgSend(self, "boundingBoxCount", usize, .{});
    }
    /// `-[MTLAccelerationStructureBoundingBoxGeometryDescriptor setBoundingBoxCount:]
    pub fn setBoundingBoxCount_(self: *@This(), bounding_box_count: usize) void {
        return objc.msgSend(self, "setBoundingBoxCount:", void, .{bounding_box_count});
    }
};

/// `MTLMotionKeyframeData`
pub const MotionKeyframeData = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLMotionKeyframeData new]`
    pub const new = InternalInfo.new;
    /// `+[MTLMotionKeyframeData alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLMotionKeyframeData alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLMotionKeyframeData data]
    pub fn data() *@This() {
        return objc.msgSend(InternalInfo.class(), "data", *@This(), .{});
    }
    /// `-[MTLMotionKeyframeData buffer]
    pub fn buffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "buffer", ?*Buffer, .{});
    }
    /// `-[MTLMotionKeyframeData setBuffer:]
    pub fn setBuffer_(self: *@This(), buf: ?*Buffer) void {
        return objc.msgSend(self, "setBuffer:", void, .{buf});
    }
    /// `-[MTLMotionKeyframeData offset]
    pub fn offset(self: *@This()) usize {
        return objc.msgSend(self, "offset", usize, .{});
    }
    /// `-[MTLMotionKeyframeData setOffset:]
    pub fn setOffset_(self: *@This(), value: usize) void {
        return objc.msgSend(self, "setOffset:", void, .{value});
    }
};

/// `MTLAccelerationStructureMotionTriangleGeometryDescriptor`
pub const AccelerationStructureMotionTriangleGeometryDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), AccelerationStructureGeometryDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLAccelerationStructureMotionTriangleGeometryDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructureMotionTriangleGeometryDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructureMotionTriangleGeometryDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLAccelerationStructureMotionTriangleGeometryDescriptor descriptor]
    pub fn descriptor() *@This() {
        return objc.msgSend(InternalInfo.class(), "descriptor", *@This(), .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers]
    pub fn vertexBuffers(self: *@This()) *ns.Array(*MotionKeyframeData) {
        return objc.msgSend(self, "vertexBuffers", *ns.Array(*MotionKeyframeData), .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setVertexBuffers:]
    pub fn setVertexBuffers_(self: *@This(), vertex_buffers: *ns.Array(*MotionKeyframeData)) void {
        return objc.msgSend(self, "setVertexBuffers:", void, .{vertex_buffers});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexFormat]
    pub fn vertexFormat(self: *@This()) AttributeFormat {
        return objc.msgSend(self, "vertexFormat", AttributeFormat, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setVertexFormat:]
    pub fn setVertexFormat_(self: *@This(), vertex_format: AttributeFormat) void {
        return objc.msgSend(self, "setVertexFormat:", void, .{vertex_format});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexStride]
    pub fn vertexStride(self: *@This()) usize {
        return objc.msgSend(self, "vertexStride", usize, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setVertexStride:]
    pub fn setVertexStride_(self: *@This(), vertex_stride: usize) void {
        return objc.msgSend(self, "setVertexStride:", void, .{vertex_stride});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBuffer]
    pub fn indexBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "indexBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setIndexBuffer:]
    pub fn setIndexBuffer_(self: *@This(), index_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setIndexBuffer:", void, .{index_buffer});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBufferOffset]
    pub fn indexBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "indexBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setIndexBufferOffset:]
    pub fn setIndexBufferOffset_(self: *@This(), index_buffer_offset: usize) void {
        return objc.msgSend(self, "setIndexBufferOffset:", void, .{index_buffer_offset});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexType]
    pub fn indexType(self: *@This()) IndexType {
        return objc.msgSend(self, "indexType", IndexType, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setIndexType:]
    pub fn setIndexType_(self: *@This(), index_type: IndexType) void {
        return objc.msgSend(self, "setIndexType:", void, .{index_type});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor triangleCount]
    pub fn triangleCount(self: *@This()) usize {
        return objc.msgSend(self, "triangleCount", usize, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setTriangleCount:]
    pub fn setTriangleCount_(self: *@This(), triangle_count: usize) void {
        return objc.msgSend(self, "setTriangleCount:", void, .{triangle_count});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBuffer]
    pub fn transformationMatrixBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "transformationMatrixBuffer", ?*Buffer, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setTransformationMatrixBuffer:]
    pub fn setTransformationMatrixBuffer_(self: *@This(), transformation_matrix_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setTransformationMatrixBuffer:", void, .{transformation_matrix_buffer});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBufferOffset]
    pub fn transformationMatrixBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "transformationMatrixBufferOffset", usize, .{});
    }
    /// `-[MTLAccelerationStructureMotionTriangleGeometryDescriptor setTransformationMatrixBufferOffset:]
    pub fn setTransformationMatrixBufferOffset_(self: *@This(), transformation_matrix_buffer_offset: usize) void {
        return objc.msgSend(self, "setTransformationMatrixBufferOffset:", void, .{transformation_matrix_buffer_offset});
    }
};

/// `MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor`
pub const AccelerationStructureMotionBoundingBoxGeometryDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), AccelerationStructureGeometryDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor descriptor]
    pub fn descriptor() *@This() {
        return objc.msgSend(InternalInfo.class(), "descriptor", *@This(), .{});
    }
    /// `-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxBuffers]
    pub fn boundingBoxBuffers(self: *@This()) *ns.Array(*MotionKeyframeData) {
        return objc.msgSend(self, "boundingBoxBuffers", *ns.Array(*MotionKeyframeData), .{});
    }
    /// `-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor setBoundingBoxBuffers:]
    pub fn setBoundingBoxBuffers_(self: *@This(), bounding_box_buffers: *ns.Array(*MotionKeyframeData)) void {
        return objc.msgSend(self, "setBoundingBoxBuffers:", void, .{bounding_box_buffers});
    }
    /// `-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxStride]
    pub fn boundingBoxStride(self: *@This()) usize {
        return objc.msgSend(self, "boundingBoxStride", usize, .{});
    }
    /// `-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor setBoundingBoxStride:]
    pub fn setBoundingBoxStride_(self: *@This(), bounding_box_stride: usize) void {
        return objc.msgSend(self, "setBoundingBoxStride:", void, .{bounding_box_stride});
    }
    /// `-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor boundingBoxCount]
    pub fn boundingBoxCount(self: *@This()) usize {
        return objc.msgSend(self, "boundingBoxCount", usize, .{});
    }
    /// `-[MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor setBoundingBoxCount:]
    pub fn setBoundingBoxCount_(self: *@This(), bounding_box_count: usize) void {
        return objc.msgSend(self, "setBoundingBoxCount:", void, .{bounding_box_count});
    }
};

/// `MTLInstanceAccelerationStructureDescriptor`
pub const InstanceAccelerationStructureDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), AccelerationStructureDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLInstanceAccelerationStructureDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLInstanceAccelerationStructureDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLInstanceAccelerationStructureDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLInstanceAccelerationStructureDescriptor descriptor]
    pub fn descriptor() *@This() {
        return objc.msgSend(InternalInfo.class(), "descriptor", *@This(), .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBuffer]
    pub fn instanceDescriptorBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "instanceDescriptorBuffer", ?*Buffer, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setInstanceDescriptorBuffer:]
    pub fn setInstanceDescriptorBuffer_(self: *@This(), instance_descriptor_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setInstanceDescriptorBuffer:", void, .{instance_descriptor_buffer});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBufferOffset]
    pub fn instanceDescriptorBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "instanceDescriptorBufferOffset", usize, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setInstanceDescriptorBufferOffset:]
    pub fn setInstanceDescriptorBufferOffset_(self: *@This(), instance_descriptor_buffer_offset: usize) void {
        return objc.msgSend(self, "setInstanceDescriptorBufferOffset:", void, .{instance_descriptor_buffer_offset});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor instanceDescriptorStride]
    pub fn instanceDescriptorStride(self: *@This()) usize {
        return objc.msgSend(self, "instanceDescriptorStride", usize, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setInstanceDescriptorStride:]
    pub fn setInstanceDescriptorStride_(self: *@This(), instance_descriptor_stride: usize) void {
        return objc.msgSend(self, "setInstanceDescriptorStride:", void, .{instance_descriptor_stride});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor instanceCount]
    pub fn instanceCount(self: *@This()) usize {
        return objc.msgSend(self, "instanceCount", usize, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setInstanceCount:]
    pub fn setInstanceCount_(self: *@This(), instance_count: usize) void {
        return objc.msgSend(self, "setInstanceCount:", void, .{instance_count});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor instancedAccelerationStructures]
    pub fn instancedAccelerationStructures(self: *@This()) ?*ns.Array(*AccelerationStructure) {
        return objc.msgSend(self, "instancedAccelerationStructures", ?*ns.Array(*AccelerationStructure), .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setInstancedAccelerationStructures:]
    pub fn setInstancedAccelerationStructures_(self: *@This(), instanced_acceleration_structures: ?*ns.Array(*AccelerationStructure)) void {
        return objc.msgSend(self, "setInstancedAccelerationStructures:", void, .{instanced_acceleration_structures});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor instanceDescriptorType]
    pub fn instanceDescriptorType(self: *@This()) AccelerationStructureInstanceDescriptorType {
        return objc.msgSend(self, "instanceDescriptorType", AccelerationStructureInstanceDescriptorType, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setInstanceDescriptorType:]
    pub fn setInstanceDescriptorType_(self: *@This(), instance_descriptor_type: AccelerationStructureInstanceDescriptorType) void {
        return objc.msgSend(self, "setInstanceDescriptorType:", void, .{instance_descriptor_type});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor motionTransformBuffer]
    pub fn motionTransformBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "motionTransformBuffer", ?*Buffer, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setMotionTransformBuffer:]
    pub fn setMotionTransformBuffer_(self: *@This(), motion_transform_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setMotionTransformBuffer:", void, .{motion_transform_buffer});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor motionTransformBufferOffset]
    pub fn motionTransformBufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "motionTransformBufferOffset", usize, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setMotionTransformBufferOffset:]
    pub fn setMotionTransformBufferOffset_(self: *@This(), motion_transform_buffer_offset: usize) void {
        return objc.msgSend(self, "setMotionTransformBufferOffset:", void, .{motion_transform_buffer_offset});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor motionTransformCount]
    pub fn motionTransformCount(self: *@This()) usize {
        return objc.msgSend(self, "motionTransformCount", usize, .{});
    }
    /// `-[MTLInstanceAccelerationStructureDescriptor setMotionTransformCount:]
    pub fn setMotionTransformCount_(self: *@This(), motion_transform_count: usize) void {
        return objc.msgSend(self, "setMotionTransformCount:", void, .{motion_transform_count});
    }
};

/// `MTLAccelerationStructure`
pub const AccelerationStructure = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Resource);
    const as = InternalInfo.as;
    /// `-[MTLAccelerationStructure size]
    pub fn size(self: *@This()) usize {
        return objc.msgSend(self, "size", usize, .{});
    }
    /// `-[MTLAccelerationStructure gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};

/// `MTLAccelerationStructureCommandEncoder`
pub const AccelerationStructureCommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), CommandEncoder);
    const as = InternalInfo.as;
    /// `-[MTLAccelerationStructureCommandEncoder buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:]
    pub fn buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_(self: *@This(), acceleration_structure: *AccelerationStructure, descriptor: *AccelerationStructureDescriptor, scratch_buffer: *Buffer, scratch_buffer_offset: usize) void {
        return objc.msgSend(self, "buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:", void, .{ acceleration_structure, descriptor, scratch_buffer, scratch_buffer_offset });
    }
    /// `-[MTLAccelerationStructureCommandEncoder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:]
    pub fn refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_(self: *@This(), source_acceleration_structure: *AccelerationStructure, descriptor: *AccelerationStructureDescriptor, destination_acceleration_structure: ?*AccelerationStructure, scratch_buffer: ?*Buffer, scratch_buffer_offset: usize) void {
        return objc.msgSend(self, "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:", void, .{ source_acceleration_structure, descriptor, destination_acceleration_structure, scratch_buffer, scratch_buffer_offset });
    }
    /// `-[MTLAccelerationStructureCommandEncoder refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:]
    pub fn refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_(self: *@This(), source_acceleration_structure: *AccelerationStructure, descriptor: *AccelerationStructureDescriptor, destination_acceleration_structure: ?*AccelerationStructure, scratch_buffer: ?*Buffer, scratch_buffer_offset: usize, options: AccelerationStructureRefitOptions) void {
        return objc.msgSend(self, "refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:", void, .{ source_acceleration_structure, descriptor, destination_acceleration_structure, scratch_buffer, scratch_buffer_offset, options });
    }
    /// `-[MTLAccelerationStructureCommandEncoder copyAccelerationStructure:toAccelerationStructure:]
    pub fn copyAccelerationStructure_toAccelerationStructure_(self: *@This(), source_acceleration_structure: *AccelerationStructure, destination_acceleration_structure: *AccelerationStructure) void {
        return objc.msgSend(self, "copyAccelerationStructure:toAccelerationStructure:", void, .{ source_acceleration_structure, destination_acceleration_structure });
    }
    /// `-[MTLAccelerationStructureCommandEncoder writeCompactedAccelerationStructureSize:toBuffer:offset:]
    pub fn writeCompactedAccelerationStructureSize_toBuffer_offset_(self: *@This(), acceleration_structure: *AccelerationStructure, buffer: *Buffer, offset: usize) void {
        return objc.msgSend(self, "writeCompactedAccelerationStructureSize:toBuffer:offset:", void, .{ acceleration_structure, buffer, offset });
    }
    /// `-[MTLAccelerationStructureCommandEncoder writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:]
    pub fn writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_(self: *@This(), acceleration_structure: *AccelerationStructure, buffer: *Buffer, offset: usize, size_data_type: DataType) void {
        return objc.msgSend(self, "writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:", void, .{ acceleration_structure, buffer, offset, size_data_type });
    }
    /// `-[MTLAccelerationStructureCommandEncoder copyAndCompactAccelerationStructure:toAccelerationStructure:]
    pub fn copyAndCompactAccelerationStructure_toAccelerationStructure_(self: *@This(), source_acceleration_structure: *AccelerationStructure, destination_acceleration_structure: *AccelerationStructure) void {
        return objc.msgSend(self, "copyAndCompactAccelerationStructure:toAccelerationStructure:", void, .{ source_acceleration_structure, destination_acceleration_structure });
    }
    /// `-[MTLAccelerationStructureCommandEncoder updateFence:]
    pub fn updateFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "updateFence:", void, .{fence});
    }
    /// `-[MTLAccelerationStructureCommandEncoder waitForFence:]
    pub fn waitForFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "waitForFence:", void, .{fence});
    }
    /// `-[MTLAccelerationStructureCommandEncoder useResource:usage:]
    pub fn useResource_usage_(self: *@This(), resource: *Resource, usage: ResourceUsage) void {
        return objc.msgSend(self, "useResource:usage:", void, .{ resource, usage });
    }
    /// `-[MTLAccelerationStructureCommandEncoder useResources:count:usage:]
    pub fn useResources_count_usage_(self: *@This(), resources: [*]*const Resource, count: usize, usage: ResourceUsage) void {
        return objc.msgSend(self, "useResources:count:usage:", void, .{ resources, count, usage });
    }
    /// `-[MTLAccelerationStructureCommandEncoder useHeap:]
    pub fn useHeap_(self: *@This(), heap: *Heap) void {
        return objc.msgSend(self, "useHeap:", void, .{heap});
    }
    /// `-[MTLAccelerationStructureCommandEncoder useHeaps:count:]
    pub fn useHeaps_count_(self: *@This(), heaps: [*]*const Heap, count: usize) void {
        return objc.msgSend(self, "useHeaps:count:", void, .{ heaps, count });
    }
    /// `-[MTLAccelerationStructureCommandEncoder sampleCountersInBuffer:atSampleIndex:withBarrier:]
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier_(self: *@This(), sample_buffer: *CounterSampleBuffer, sample_index: usize, barrier: bool) void {
        return objc.msgSend(self, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sample_buffer, sample_index, barrier });
    }
};

/// `MTLAccelerationStructurePassSampleBufferAttachmentDescriptor`
pub const AccelerationStructurePassSampleBufferAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor sampleBuffer]
    pub fn sampleBuffer(self: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor setSampleBuffer:]
    pub fn setSampleBuffer_(self: *@This(), sample_buffer: ?*CounterSampleBuffer) void {
        return objc.msgSend(self, "setSampleBuffer:", void, .{sample_buffer});
    }
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor startOfEncoderSampleIndex]
    pub fn startOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "startOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor setStartOfEncoderSampleIndex:]
    pub fn setStartOfEncoderSampleIndex_(self: *@This(), start_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setStartOfEncoderSampleIndex:", void, .{start_of_encoder_sample_index});
    }
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor endOfEncoderSampleIndex]
    pub fn endOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "endOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptor setEndOfEncoderSampleIndex:]
    pub fn setEndOfEncoderSampleIndex_(self: *@This(), end_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setEndOfEncoderSampleIndex:", void, .{end_of_encoder_sample_index});
    }
};

/// `MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray`
pub const AccelerationStructurePassSampleBufferAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *AccelerationStructurePassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *AccelerationStructurePassSampleBufferAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*AccelerationStructurePassSampleBufferAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLAccelerationStructurePassDescriptor`
pub const AccelerationStructurePassDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLAccelerationStructurePassDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAccelerationStructurePassDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAccelerationStructurePassDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLAccelerationStructurePassDescriptor accelerationStructurePassDescriptor]
    pub fn accelerationStructurePassDescriptor() *AccelerationStructurePassDescriptor {
        return objc.msgSend(InternalInfo.class(), "accelerationStructurePassDescriptor", *AccelerationStructurePassDescriptor, .{});
    }
    /// `-[MTLAccelerationStructurePassDescriptor sampleBufferAttachments]
    pub fn sampleBufferAttachments(self: *@This()) *AccelerationStructurePassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self, "sampleBufferAttachments", *AccelerationStructurePassSampleBufferAttachmentDescriptorArray, .{});
    }
};

/// `MTLType`
pub const Type = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLType new]`
    pub const new = InternalInfo.new;
    /// `+[MTLType alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLType alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLType dataType]
    pub fn dataType(self: *@This()) DataType {
        return objc.msgSend(self, "dataType", DataType, .{});
    }
};

/// `MTLStructMember`
pub const StructMember = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLStructMember new]`
    pub const new = InternalInfo.new;
    /// `+[MTLStructMember alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLStructMember alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLStructMember structType]
    pub fn structType(self: *@This()) ?*StructType {
        return objc.msgSend(self, "structType", ?*StructType, .{});
    }
    /// `-[MTLStructMember arrayType]
    pub fn arrayType(self: *@This()) ?*ArrayType {
        return objc.msgSend(self, "arrayType", ?*ArrayType, .{});
    }
    /// `-[MTLStructMember textureReferenceType]
    pub fn textureReferenceType(self: *@This()) ?*TextureReferenceType {
        return objc.msgSend(self, "textureReferenceType", ?*TextureReferenceType, .{});
    }
    /// `-[MTLStructMember pointerType]
    pub fn pointerType(self: *@This()) ?*PointerType {
        return objc.msgSend(self, "pointerType", ?*PointerType, .{});
    }
    /// `-[MTLStructMember name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLStructMember offset]
    pub fn offset(self: *@This()) usize {
        return objc.msgSend(self, "offset", usize, .{});
    }
    /// `-[MTLStructMember dataType]
    pub fn dataType(self: *@This()) DataType {
        return objc.msgSend(self, "dataType", DataType, .{});
    }
    /// `-[MTLStructMember argumentIndex]
    pub fn argumentIndex(self: *@This()) usize {
        return objc.msgSend(self, "argumentIndex", usize, .{});
    }
};

/// `MTLStructType`
pub const StructType = opaque {
    const InternalInfo = objc.ExternClass(@This(), Type);
    const as = InternalInfo.as;
    /// `+[MTLStructType new]`
    pub const new = InternalInfo.new;
    /// `+[MTLStructType alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLStructType alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLStructType memberByName:]
    pub fn memberByName_(self: *@This(), name: *ns.String) ?*StructMember {
        return objc.msgSend(self, "memberByName:", ?*StructMember, .{name});
    }
    /// `-[MTLStructType members]
    pub fn members(self: *@This()) *ns.Array(*StructMember) {
        return objc.msgSend(self, "members", *ns.Array(*StructMember), .{});
    }
};

/// `MTLArrayType`
pub const ArrayType = opaque {
    const InternalInfo = objc.ExternClass(@This(), Type);
    const as = InternalInfo.as;
    /// `+[MTLArrayType new]`
    pub const new = InternalInfo.new;
    /// `+[MTLArrayType alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLArrayType alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLArrayType elementStructType]
    pub fn elementStructType(self: *@This()) ?*StructType {
        return objc.msgSend(self, "elementStructType", ?*StructType, .{});
    }
    /// `-[MTLArrayType elementArrayType]
    pub fn elementArrayType(self: *@This()) ?*ArrayType {
        return objc.msgSend(self, "elementArrayType", ?*ArrayType, .{});
    }
    /// `-[MTLArrayType elementTextureReferenceType]
    pub fn elementTextureReferenceType(self: *@This()) ?*TextureReferenceType {
        return objc.msgSend(self, "elementTextureReferenceType", ?*TextureReferenceType, .{});
    }
    /// `-[MTLArrayType elementPointerType]
    pub fn elementPointerType(self: *@This()) ?*PointerType {
        return objc.msgSend(self, "elementPointerType", ?*PointerType, .{});
    }
    /// `-[MTLArrayType elementType]
    pub fn elementType(self: *@This()) DataType {
        return objc.msgSend(self, "elementType", DataType, .{});
    }
    /// `-[MTLArrayType arrayLength]
    pub fn arrayLength(self: *@This()) usize {
        return objc.msgSend(self, "arrayLength", usize, .{});
    }
    /// `-[MTLArrayType stride]
    pub fn stride(self: *@This()) usize {
        return objc.msgSend(self, "stride", usize, .{});
    }
    /// `-[MTLArrayType argumentIndexStride]
    pub fn argumentIndexStride(self: *@This()) usize {
        return objc.msgSend(self, "argumentIndexStride", usize, .{});
    }
};

/// `MTLPointerType`
pub const PointerType = opaque {
    const InternalInfo = objc.ExternClass(@This(), Type);
    const as = InternalInfo.as;
    /// `+[MTLPointerType new]`
    pub const new = InternalInfo.new;
    /// `+[MTLPointerType alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLPointerType alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLPointerType elementStructType]
    pub fn elementStructType(self: *@This()) ?*StructType {
        return objc.msgSend(self, "elementStructType", ?*StructType, .{});
    }
    /// `-[MTLPointerType elementArrayType]
    pub fn elementArrayType(self: *@This()) ?*ArrayType {
        return objc.msgSend(self, "elementArrayType", ?*ArrayType, .{});
    }
    /// `-[MTLPointerType elementType]
    pub fn elementType(self: *@This()) DataType {
        return objc.msgSend(self, "elementType", DataType, .{});
    }
    /// `-[MTLPointerType access]
    pub fn access(self: *@This()) BindingAccess {
        return objc.msgSend(self, "access", BindingAccess, .{});
    }
    /// `-[MTLPointerType alignment]
    pub fn alignment(self: *@This()) usize {
        return objc.msgSend(self, "alignment", usize, .{});
    }
    /// `-[MTLPointerType dataSize]
    pub fn dataSize(self: *@This()) usize {
        return objc.msgSend(self, "dataSize", usize, .{});
    }
    /// `-[MTLPointerType elementIsArgumentBuffer]
    pub fn elementIsArgumentBuffer(self: *@This()) bool {
        return objc.msgSend(self, "elementIsArgumentBuffer", bool, .{});
    }
};

/// `MTLTextureReferenceType`
pub const TextureReferenceType = opaque {
    const InternalInfo = objc.ExternClass(@This(), Type);
    const as = InternalInfo.as;
    /// `+[MTLTextureReferenceType new]`
    pub const new = InternalInfo.new;
    /// `+[MTLTextureReferenceType alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLTextureReferenceType alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLTextureReferenceType textureDataType]
    pub fn textureDataType(self: *@This()) DataType {
        return objc.msgSend(self, "textureDataType", DataType, .{});
    }
    /// `-[MTLTextureReferenceType textureType]
    pub fn textureType(self: *@This()) TextureType {
        return objc.msgSend(self, "textureType", TextureType, .{});
    }
    /// `-[MTLTextureReferenceType access]
    pub fn access(self: *@This()) BindingAccess {
        return objc.msgSend(self, "access", BindingAccess, .{});
    }
    /// `-[MTLTextureReferenceType isDepthTexture]
    pub fn isDepthTexture(self: *@This()) bool {
        return objc.msgSend(self, "isDepthTexture", bool, .{});
    }
};

/// `MTLArgument`
pub const Argument = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLArgument new]`
    pub const new = InternalInfo.new;
    /// `+[MTLArgument alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLArgument alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLArgument name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLArgument type]
    pub fn @"type"(self: *@This()) ArgumentType {
        return objc.msgSend(self, "type", ArgumentType, .{});
    }
    /// `-[MTLArgument access]
    pub fn access(self: *@This()) BindingAccess {
        return objc.msgSend(self, "access", BindingAccess, .{});
    }
    /// `-[MTLArgument index]
    pub fn index(self: *@This()) usize {
        return objc.msgSend(self, "index", usize, .{});
    }
    /// `-[MTLArgument isActive]
    pub fn isActive(self: *@This()) bool {
        return objc.msgSend(self, "isActive", bool, .{});
    }
    /// `-[MTLArgument bufferAlignment]
    pub fn bufferAlignment(self: *@This()) usize {
        return objc.msgSend(self, "bufferAlignment", usize, .{});
    }
    /// `-[MTLArgument bufferDataSize]
    pub fn bufferDataSize(self: *@This()) usize {
        return objc.msgSend(self, "bufferDataSize", usize, .{});
    }
    /// `-[MTLArgument bufferDataType]
    pub fn bufferDataType(self: *@This()) DataType {
        return objc.msgSend(self, "bufferDataType", DataType, .{});
    }
    /// `-[MTLArgument bufferStructType]
    pub fn bufferStructType(self: *@This()) ?*StructType {
        return objc.msgSend(self, "bufferStructType", ?*StructType, .{});
    }
    /// `-[MTLArgument bufferPointerType]
    pub fn bufferPointerType(self: *@This()) ?*PointerType {
        return objc.msgSend(self, "bufferPointerType", ?*PointerType, .{});
    }
    /// `-[MTLArgument threadgroupMemoryAlignment]
    pub fn threadgroupMemoryAlignment(self: *@This()) usize {
        return objc.msgSend(self, "threadgroupMemoryAlignment", usize, .{});
    }
    /// `-[MTLArgument threadgroupMemoryDataSize]
    pub fn threadgroupMemoryDataSize(self: *@This()) usize {
        return objc.msgSend(self, "threadgroupMemoryDataSize", usize, .{});
    }
    /// `-[MTLArgument textureType]
    pub fn textureType(self: *@This()) TextureType {
        return objc.msgSend(self, "textureType", TextureType, .{});
    }
    /// `-[MTLArgument textureDataType]
    pub fn textureDataType(self: *@This()) DataType {
        return objc.msgSend(self, "textureDataType", DataType, .{});
    }
    /// `-[MTLArgument isDepthTexture]
    pub fn isDepthTexture(self: *@This()) bool {
        return objc.msgSend(self, "isDepthTexture", bool, .{});
    }
    /// `-[MTLArgument arrayLength]
    pub fn arrayLength(self: *@This()) usize {
        return objc.msgSend(self, "arrayLength", usize, .{});
    }
};

/// `MTLBinding`
pub const Binding = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLBinding name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLBinding type]
    pub fn @"type"(self: *@This()) BindingType {
        return objc.msgSend(self, "type", BindingType, .{});
    }
    /// `-[MTLBinding access]
    pub fn access(self: *@This()) BindingAccess {
        return objc.msgSend(self, "access", BindingAccess, .{});
    }
    /// `-[MTLBinding index]
    pub fn index(self: *@This()) usize {
        return objc.msgSend(self, "index", usize, .{});
    }
    /// `-[MTLBinding isUsed]
    pub fn isUsed(self: *@This()) bool {
        return objc.msgSend(self, "isUsed", bool, .{});
    }
    /// `-[MTLBinding isArgument]
    pub fn isArgument(self: *@This()) bool {
        return objc.msgSend(self, "isArgument", bool, .{});
    }
};

/// `MTLBufferBinding`
pub const BufferBinding = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Binding);
    const as = InternalInfo.as;
    /// `-[MTLBufferBinding bufferAlignment]
    pub fn bufferAlignment(self: *@This()) usize {
        return objc.msgSend(self, "bufferAlignment", usize, .{});
    }
    /// `-[MTLBufferBinding bufferDataSize]
    pub fn bufferDataSize(self: *@This()) usize {
        return objc.msgSend(self, "bufferDataSize", usize, .{});
    }
    /// `-[MTLBufferBinding bufferDataType]
    pub fn bufferDataType(self: *@This()) DataType {
        return objc.msgSend(self, "bufferDataType", DataType, .{});
    }
    /// `-[MTLBufferBinding bufferStructType]
    pub fn bufferStructType(self: *@This()) ?*StructType {
        return objc.msgSend(self, "bufferStructType", ?*StructType, .{});
    }
    /// `-[MTLBufferBinding bufferPointerType]
    pub fn bufferPointerType(self: *@This()) ?*PointerType {
        return objc.msgSend(self, "bufferPointerType", ?*PointerType, .{});
    }
};

/// `MTLThreadgroupBinding`
pub const ThreadgroupBinding = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Binding);
    const as = InternalInfo.as;
    /// `-[MTLThreadgroupBinding threadgroupMemoryAlignment]
    pub fn threadgroupMemoryAlignment(self: *@This()) usize {
        return objc.msgSend(self, "threadgroupMemoryAlignment", usize, .{});
    }
    /// `-[MTLThreadgroupBinding threadgroupMemoryDataSize]
    pub fn threadgroupMemoryDataSize(self: *@This()) usize {
        return objc.msgSend(self, "threadgroupMemoryDataSize", usize, .{});
    }
};

/// `MTLTextureBinding`
pub const TextureBinding = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Binding);
    const as = InternalInfo.as;
    /// `-[MTLTextureBinding textureType]
    pub fn textureType(self: *@This()) TextureType {
        return objc.msgSend(self, "textureType", TextureType, .{});
    }
    /// `-[MTLTextureBinding textureDataType]
    pub fn textureDataType(self: *@This()) DataType {
        return objc.msgSend(self, "textureDataType", DataType, .{});
    }
    /// `-[MTLTextureBinding isDepthTexture]
    pub fn isDepthTexture(self: *@This()) bool {
        return objc.msgSend(self, "isDepthTexture", bool, .{});
    }
    /// `-[MTLTextureBinding arrayLength]
    pub fn arrayLength(self: *@This()) usize {
        return objc.msgSend(self, "arrayLength", usize, .{});
    }
};

/// `MTLObjectPayloadBinding`
pub const ObjectPayloadBinding = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Binding);
    const as = InternalInfo.as;
    /// `-[MTLObjectPayloadBinding objectPayloadAlignment]
    pub fn objectPayloadAlignment(self: *@This()) usize {
        return objc.msgSend(self, "objectPayloadAlignment", usize, .{});
    }
    /// `-[MTLObjectPayloadBinding objectPayloadDataSize]
    pub fn objectPayloadDataSize(self: *@This()) usize {
        return objc.msgSend(self, "objectPayloadDataSize", usize, .{});
    }
};

/// `MTLArgumentEncoder`
pub const ArgumentEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLArgumentEncoder setArgumentBuffer:offset:]
    pub fn setArgumentBuffer_offset_(self: *@This(), argument_buffer: ?*Buffer, offset: usize) void {
        return objc.msgSend(self, "setArgumentBuffer:offset:", void, .{ argument_buffer, offset });
    }
    /// `-[MTLArgumentEncoder setArgumentBuffer:startOffset:arrayElement:]
    pub fn setArgumentBuffer_startOffset_arrayElement_(self: *@This(), argument_buffer: ?*Buffer, start_offset: usize, array_element: usize) void {
        return objc.msgSend(self, "setArgumentBuffer:startOffset:arrayElement:", void, .{ argument_buffer, start_offset, array_element });
    }
    /// `-[MTLArgumentEncoder setBuffer:offset:atIndex:]
    pub fn setBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLArgumentEncoder setBuffers:offsets:withRange:]
    pub fn setBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLArgumentEncoder setTexture:atIndex:]
    pub fn setTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLArgumentEncoder setTextures:withRange:]
    pub fn setTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLArgumentEncoder setSamplerState:atIndex:]
    pub fn setSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLArgumentEncoder setSamplerStates:withRange:]
    pub fn setSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLArgumentEncoder constantDataAtIndex:]
    pub fn constantDataAtIndex_(self: *@This(), index: usize) *anyopaque {
        return objc.msgSend(self, "constantDataAtIndex:", *anyopaque, .{index});
    }
    /// `-[MTLArgumentEncoder setRenderPipelineState:atIndex:]
    pub fn setRenderPipelineState_atIndex_(self: *@This(), pipeline: ?*RenderPipelineState, index: usize) void {
        return objc.msgSend(self, "setRenderPipelineState:atIndex:", void, .{ pipeline, index });
    }
    /// `-[MTLArgumentEncoder setRenderPipelineStates:withRange:]
    pub fn setRenderPipelineStates_withRange_(self: *@This(), pipelines: [*]?*const RenderPipelineState, range: ns.Range) void {
        return objc.msgSend(self, "setRenderPipelineStates:withRange:", void, .{ pipelines, range });
    }
    /// `-[MTLArgumentEncoder setComputePipelineState:atIndex:]
    pub fn setComputePipelineState_atIndex_(self: *@This(), pipeline: ?*ComputePipelineState, index: usize) void {
        return objc.msgSend(self, "setComputePipelineState:atIndex:", void, .{ pipeline, index });
    }
    /// `-[MTLArgumentEncoder setComputePipelineStates:withRange:]
    pub fn setComputePipelineStates_withRange_(self: *@This(), pipelines: [*]?*const ComputePipelineState, range: ns.Range) void {
        return objc.msgSend(self, "setComputePipelineStates:withRange:", void, .{ pipelines, range });
    }
    /// `-[MTLArgumentEncoder setIndirectCommandBuffer:atIndex:]
    pub fn setIndirectCommandBuffer_atIndex_(self: *@This(), indirect_command_buffer: ?*IndirectCommandBuffer, index: usize) void {
        return objc.msgSend(self, "setIndirectCommandBuffer:atIndex:", void, .{ indirect_command_buffer, index });
    }
    /// `-[MTLArgumentEncoder setIndirectCommandBuffers:withRange:]
    pub fn setIndirectCommandBuffers_withRange_(self: *@This(), buffers: [*]?*const IndirectCommandBuffer, range: ns.Range) void {
        return objc.msgSend(self, "setIndirectCommandBuffers:withRange:", void, .{ buffers, range });
    }
    /// `-[MTLArgumentEncoder setAccelerationStructure:atIndex:]
    pub fn setAccelerationStructure_atIndex_(self: *@This(), acceleration_structure: ?*AccelerationStructure, index: usize) void {
        return objc.msgSend(self, "setAccelerationStructure:atIndex:", void, .{ acceleration_structure, index });
    }
    /// `-[MTLArgumentEncoder newArgumentEncoderForBufferAtIndex:]
    pub fn newArgumentEncoderForBufferAtIndex_(self: *@This(), index: usize) ?*ArgumentEncoder {
        return objc.msgSend(self, "newArgumentEncoderForBufferAtIndex:", ?*ArgumentEncoder, .{index});
    }
    /// `-[MTLArgumentEncoder setVisibleFunctionTable:atIndex:]
    pub fn setVisibleFunctionTable_atIndex_(self: *@This(), visible_function_table: ?*VisibleFunctionTable, index: usize) void {
        return objc.msgSend(self, "setVisibleFunctionTable:atIndex:", void, .{ visible_function_table, index });
    }
    /// `-[MTLArgumentEncoder setVisibleFunctionTables:withRange:]
    pub fn setVisibleFunctionTables_withRange_(self: *@This(), visible_function_tables: [*]?*const VisibleFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setVisibleFunctionTables:withRange:", void, .{ visible_function_tables, range });
    }
    /// `-[MTLArgumentEncoder setIntersectionFunctionTable:atIndex:]
    pub fn setIntersectionFunctionTable_atIndex_(self: *@This(), intersection_function_table: ?*IntersectionFunctionTable, index: usize) void {
        return objc.msgSend(self, "setIntersectionFunctionTable:atIndex:", void, .{ intersection_function_table, index });
    }
    /// `-[MTLArgumentEncoder setIntersectionFunctionTables:withRange:]
    pub fn setIntersectionFunctionTables_withRange_(self: *@This(), intersection_function_tables: [*]?*const IntersectionFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setIntersectionFunctionTables:withRange:", void, .{ intersection_function_tables, range });
    }
    /// `-[MTLArgumentEncoder device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLArgumentEncoder label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLArgumentEncoder setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLArgumentEncoder encodedLength]
    pub fn encodedLength(self: *@This()) usize {
        return objc.msgSend(self, "encodedLength", usize, .{});
    }
    /// `-[MTLArgumentEncoder alignment]
    pub fn alignment(self: *@This()) usize {
        return objc.msgSend(self, "alignment", usize, .{});
    }
};

/// `MTLBinaryArchiveDescriptor`
pub const BinaryArchiveDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLBinaryArchiveDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLBinaryArchiveDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLBinaryArchiveDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLBinaryArchiveDescriptor url]
    pub fn url(self: *@This()) ?*ns.Url {
        return objc.msgSend(self, "url", ?*ns.Url, .{});
    }
    /// `-[MTLBinaryArchiveDescriptor setUrl:]
    pub fn setUrl_(self: *@This(), value: ?*ns.Url) void {
        return objc.msgSend(self, "setUrl:", void, .{value});
    }
};

/// `MTLBinaryArchive`
pub const BinaryArchive = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLBinaryArchive addComputePipelineFunctionsWithDescriptor:error:]
    pub fn addComputePipelineFunctionsWithDescriptor_error_(self: *@This(), descriptor: *ComputePipelineDescriptor, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "addComputePipelineFunctionsWithDescriptor:error:", bool, .{ descriptor, err });
    }
    /// `-[MTLBinaryArchive addRenderPipelineFunctionsWithDescriptor:error:]
    pub fn addRenderPipelineFunctionsWithDescriptor_error_(self: *@This(), descriptor: *RenderPipelineDescriptor, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "addRenderPipelineFunctionsWithDescriptor:error:", bool, .{ descriptor, err });
    }
    /// `-[MTLBinaryArchive addTileRenderPipelineFunctionsWithDescriptor:error:]
    pub fn addTileRenderPipelineFunctionsWithDescriptor_error_(self: *@This(), descriptor: *TileRenderPipelineDescriptor, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "addTileRenderPipelineFunctionsWithDescriptor:error:", bool, .{ descriptor, err });
    }
    /// `-[MTLBinaryArchive serializeToURL:error:]
    pub fn serializeToUrl_error_(self: *@This(), url: *ns.Url, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "serializeToURL:error:", bool, .{ url, err });
    }
    /// `-[MTLBinaryArchive addFunctionWithDescriptor:library:error:]
    pub fn addFunctionWithDescriptor_library_error_(self: *@This(), descriptor: *FunctionDescriptor, library: *Library, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "addFunctionWithDescriptor:library:error:", bool, .{ descriptor, library, err });
    }
    /// `-[MTLBinaryArchive label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLBinaryArchive setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLBinaryArchive device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
};

/// `MTLBlitCommandEncoder`
pub const BlitCommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), CommandEncoder);
    const as = InternalInfo.as;
    /// `-[MTLBlitCommandEncoder synchronizeResource:]
    pub fn synchronizeResource_(self: *@This(), resource: *Resource) void {
        return objc.msgSend(self, "synchronizeResource:", void, .{resource});
    }
    /// `-[MTLBlitCommandEncoder synchronizeTexture:slice:level:]
    pub fn synchronizeTexture_slice_level_(self: *@This(), texture: *Texture, slice: usize, level: usize) void {
        return objc.msgSend(self, "synchronizeTexture:slice:level:", void, .{ texture, slice, level });
    }
    /// `-[MTLBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:]
    pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(self: *@This(), source_texture: *Texture, source_slice: usize, source_level: usize, source_origin: Origin, source_size: Size, destination_texture: *Texture, destination_slice: usize, destination_level: usize, destination_origin: Origin) void {
        return objc.msgSend(self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", void, .{ source_texture, source_slice, source_level, source_origin, source_size, destination_texture, destination_slice, destination_level, destination_origin });
    }
    /// `-[MTLBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:]
    pub fn copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(self: *@This(), source_buffer: *Buffer, source_offset: usize, source_bytes_per_row: usize, source_bytes_per_image: usize, source_size: Size, destination_texture: *Texture, destination_slice: usize, destination_level: usize, destination_origin: Origin) void {
        return objc.msgSend(self, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", void, .{ source_buffer, source_offset, source_bytes_per_row, source_bytes_per_image, source_size, destination_texture, destination_slice, destination_level, destination_origin });
    }
    /// `-[MTLBlitCommandEncoder copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:]
    pub fn copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_(self: *@This(), source_buffer: *Buffer, source_offset: usize, source_bytes_per_row: usize, source_bytes_per_image: usize, source_size: Size, destination_texture: *Texture, destination_slice: usize, destination_level: usize, destination_origin: Origin, options: BlitOption) void {
        return objc.msgSend(self, "copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:", void, .{ source_buffer, source_offset, source_bytes_per_row, source_bytes_per_image, source_size, destination_texture, destination_slice, destination_level, destination_origin, options });
    }
    /// `-[MTLBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:]
    pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_(self: *@This(), source_texture: *Texture, source_slice: usize, source_level: usize, source_origin: Origin, source_size: Size, destination_buffer: *Buffer, destination_offset: usize, destination_bytes_per_row: usize, destination_bytes_per_image: usize) void {
        return objc.msgSend(self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:", void, .{ source_texture, source_slice, source_level, source_origin, source_size, destination_buffer, destination_offset, destination_bytes_per_row, destination_bytes_per_image });
    }
    /// `-[MTLBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:]
    pub fn copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_(self: *@This(), source_texture: *Texture, source_slice: usize, source_level: usize, source_origin: Origin, source_size: Size, destination_buffer: *Buffer, destination_offset: usize, destination_bytes_per_row: usize, destination_bytes_per_image: usize, options: BlitOption) void {
        return objc.msgSend(self, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:", void, .{ source_texture, source_slice, source_level, source_origin, source_size, destination_buffer, destination_offset, destination_bytes_per_row, destination_bytes_per_image, options });
    }
    /// `-[MTLBlitCommandEncoder generateMipmapsForTexture:]
    pub fn generateMipmapsForTexture_(self: *@This(), texture: *Texture) void {
        return objc.msgSend(self, "generateMipmapsForTexture:", void, .{texture});
    }
    /// `-[MTLBlitCommandEncoder fillBuffer:range:value:]
    pub fn fillBuffer_range_value_(self: *@This(), buffer: *Buffer, range: ns.Range, value: u8) void {
        return objc.msgSend(self, "fillBuffer:range:value:", void, .{ buffer, range, value });
    }
    /// `-[MTLBlitCommandEncoder copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:]
    pub fn copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_(self: *@This(), source_texture: *Texture, source_slice: usize, source_level: usize, destination_texture: *Texture, destination_slice: usize, destination_level: usize, slice_count: usize, level_count: usize) void {
        return objc.msgSend(self, "copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:", void, .{ source_texture, source_slice, source_level, destination_texture, destination_slice, destination_level, slice_count, level_count });
    }
    /// `-[MTLBlitCommandEncoder copyFromTexture:toTexture:]
    pub fn copyFromTexture_toTexture_(self: *@This(), source_texture: *Texture, destination_texture: *Texture) void {
        return objc.msgSend(self, "copyFromTexture:toTexture:", void, .{ source_texture, destination_texture });
    }
    /// `-[MTLBlitCommandEncoder copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:]
    pub fn copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(self: *@This(), source_buffer: *Buffer, source_offset: usize, destination_buffer: *Buffer, destination_offset: usize, size: usize) void {
        return objc.msgSend(self, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", void, .{ source_buffer, source_offset, destination_buffer, destination_offset, size });
    }
    /// `-[MTLBlitCommandEncoder updateFence:]
    pub fn updateFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "updateFence:", void, .{fence});
    }
    /// `-[MTLBlitCommandEncoder waitForFence:]
    pub fn waitForFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "waitForFence:", void, .{fence});
    }
    /// `-[MTLBlitCommandEncoder getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:]
    pub fn getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_(self: *@This(), texture: *Texture, region: Region, mip_level: usize, slice: usize, reset_counters: bool, counters_buffer: *Buffer, counters_buffer_offset: usize) void {
        return objc.msgSend(self, "getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:", void, .{ texture, region, mip_level, slice, reset_counters, counters_buffer, counters_buffer_offset });
    }
    /// `-[MTLBlitCommandEncoder resetTextureAccessCounters:region:mipLevel:slice:]
    pub fn resetTextureAccessCounters_region_mipLevel_slice_(self: *@This(), texture: *Texture, region: Region, mip_level: usize, slice: usize) void {
        return objc.msgSend(self, "resetTextureAccessCounters:region:mipLevel:slice:", void, .{ texture, region, mip_level, slice });
    }
    /// `-[MTLBlitCommandEncoder optimizeContentsForGPUAccess:]
    pub fn optimizeContentsForGPUAccess_(self: *@This(), texture: *Texture) void {
        return objc.msgSend(self, "optimizeContentsForGPUAccess:", void, .{texture});
    }
    /// `-[MTLBlitCommandEncoder optimizeContentsForGPUAccess:slice:level:]
    pub fn optimizeContentsForGPUAccess_slice_level_(self: *@This(), texture: *Texture, slice: usize, level: usize) void {
        return objc.msgSend(self, "optimizeContentsForGPUAccess:slice:level:", void, .{ texture, slice, level });
    }
    /// `-[MTLBlitCommandEncoder optimizeContentsForCPUAccess:]
    pub fn optimizeContentsForCpuAccess_(self: *@This(), texture: *Texture) void {
        return objc.msgSend(self, "optimizeContentsForCPUAccess:", void, .{texture});
    }
    /// `-[MTLBlitCommandEncoder optimizeContentsForCPUAccess:slice:level:]
    pub fn optimizeContentsForCpuAccess_slice_level_(self: *@This(), texture: *Texture, slice: usize, level: usize) void {
        return objc.msgSend(self, "optimizeContentsForCPUAccess:slice:level:", void, .{ texture, slice, level });
    }
    /// `-[MTLBlitCommandEncoder resetCommandsInBuffer:withRange:]
    pub fn resetCommandsInBuffer_withRange_(self: *@This(), buffer: *IndirectCommandBuffer, range: ns.Range) void {
        return objc.msgSend(self, "resetCommandsInBuffer:withRange:", void, .{ buffer, range });
    }
    /// `-[MTLBlitCommandEncoder copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:]
    pub fn copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_(self: *@This(), source: *IndirectCommandBuffer, source_range: ns.Range, destination: *IndirectCommandBuffer, destination_index: usize) void {
        return objc.msgSend(self, "copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:", void, .{ source, source_range, destination, destination_index });
    }
    /// `-[MTLBlitCommandEncoder optimizeIndirectCommandBuffer:withRange:]
    pub fn optimizeIndirectCommandBuffer_withRange_(self: *@This(), indirect_command_buffer: *IndirectCommandBuffer, range: ns.Range) void {
        return objc.msgSend(self, "optimizeIndirectCommandBuffer:withRange:", void, .{ indirect_command_buffer, range });
    }
    /// `-[MTLBlitCommandEncoder sampleCountersInBuffer:atSampleIndex:withBarrier:]
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier_(self: *@This(), sample_buffer: *CounterSampleBuffer, sample_index: usize, barrier: bool) void {
        return objc.msgSend(self, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sample_buffer, sample_index, barrier });
    }
    /// `-[MTLBlitCommandEncoder resolveCounters:inRange:destinationBuffer:destinationOffset:]
    pub fn resolveCounters_inRange_destinationBuffer_destinationOffset_(self: *@This(), sample_buffer: *CounterSampleBuffer, range: ns.Range, destination_buffer: *Buffer, destination_offset: usize) void {
        return objc.msgSend(self, "resolveCounters:inRange:destinationBuffer:destinationOffset:", void, .{ sample_buffer, range, destination_buffer, destination_offset });
    }
};

/// `MTLBlitPassSampleBufferAttachmentDescriptor`
pub const BlitPassSampleBufferAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLBlitPassSampleBufferAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLBlitPassSampleBufferAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLBlitPassSampleBufferAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptor sampleBuffer]
    pub fn sampleBuffer(self: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptor setSampleBuffer:]
    pub fn setSampleBuffer_(self: *@This(), sample_buffer: ?*CounterSampleBuffer) void {
        return objc.msgSend(self, "setSampleBuffer:", void, .{sample_buffer});
    }
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptor startOfEncoderSampleIndex]
    pub fn startOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "startOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptor setStartOfEncoderSampleIndex:]
    pub fn setStartOfEncoderSampleIndex_(self: *@This(), start_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setStartOfEncoderSampleIndex:", void, .{start_of_encoder_sample_index});
    }
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptor endOfEncoderSampleIndex]
    pub fn endOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "endOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptor setEndOfEncoderSampleIndex:]
    pub fn setEndOfEncoderSampleIndex_(self: *@This(), end_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setEndOfEncoderSampleIndex:", void, .{end_of_encoder_sample_index});
    }
};

/// `MTLBlitPassSampleBufferAttachmentDescriptorArray`
pub const BlitPassSampleBufferAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLBlitPassSampleBufferAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLBlitPassSampleBufferAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLBlitPassSampleBufferAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *BlitPassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *BlitPassSampleBufferAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLBlitPassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*BlitPassSampleBufferAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLBlitPassDescriptor`
pub const BlitPassDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLBlitPassDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLBlitPassDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLBlitPassDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLBlitPassDescriptor blitPassDescriptor]
    pub fn blitPassDescriptor() *BlitPassDescriptor {
        return objc.msgSend(InternalInfo.class(), "blitPassDescriptor", *BlitPassDescriptor, .{});
    }
    /// `-[MTLBlitPassDescriptor sampleBufferAttachments]
    pub fn sampleBufferAttachments(self: *@This()) *BlitPassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self, "sampleBufferAttachments", *BlitPassSampleBufferAttachmentDescriptorArray, .{});
    }
};

/// `MTLBuffer`
pub const Buffer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Resource);
    const as = InternalInfo.as;
    /// `-[MTLBuffer contents]
    pub fn contents(self: *@This()) *anyopaque {
        return objc.msgSend(self, "contents", *anyopaque, .{});
    }
    /// `-[MTLBuffer didModifyRange:]
    pub fn didModifyRange_(self: *@This(), range: ns.Range) void {
        return objc.msgSend(self, "didModifyRange:", void, .{range});
    }
    /// `-[MTLBuffer newTextureWithDescriptor:offset:bytesPerRow:]
    pub fn newTextureWithDescriptor_offset_bytesPerRow_(self: *@This(), descriptor: *TextureDescriptor, offset: usize, bytes_per_row: usize) ?*Texture {
        return objc.msgSend(self, "newTextureWithDescriptor:offset:bytesPerRow:", ?*Texture, .{ descriptor, offset, bytes_per_row });
    }
    /// `-[MTLBuffer addDebugMarker:range:]
    pub fn addDebugMarker_range_(self: *@This(), marker: *ns.String, range: ns.Range) void {
        return objc.msgSend(self, "addDebugMarker:range:", void, .{ marker, range });
    }
    /// `-[MTLBuffer removeAllDebugMarkers]
    pub fn removeAllDebugMarkers(self: *@This()) void {
        return objc.msgSend(self, "removeAllDebugMarkers", void, .{});
    }
    /// `-[MTLBuffer newRemoteBufferViewForDevice:]
    pub fn newRemoteBufferViewForDevice_(self: *@This(), device: *Device) ?*Buffer {
        return objc.msgSend(self, "newRemoteBufferViewForDevice:", ?*Buffer, .{device});
    }
    /// `-[MTLBuffer length]
    pub fn length(self: *@This()) usize {
        return objc.msgSend(self, "length", usize, .{});
    }
    /// `-[MTLBuffer remoteStorageBuffer]
    pub fn remoteStorageBuffer(self: *@This()) *Buffer {
        return objc.msgSend(self, "remoteStorageBuffer", *Buffer, .{});
    }
    /// `-[MTLBuffer gpuAddress]
    pub fn gpuAddress(self: *@This()) u64 {
        return objc.msgSend(self, "gpuAddress", u64, .{});
    }
};

/// `MTLCaptureDescriptor`
pub const CaptureDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLCaptureDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLCaptureDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLCaptureDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLCaptureDescriptor captureObject]
    pub fn captureObject(self: *@This()) ?*objc.Id {
        return objc.msgSend(self, "captureObject", ?*objc.Id, .{});
    }
    /// `-[MTLCaptureDescriptor setCaptureObject:]
    pub fn setCaptureObject_(self: *@This(), capture_object: ?*objc.Id) void {
        return objc.msgSend(self, "setCaptureObject:", void, .{capture_object});
    }
    /// `-[MTLCaptureDescriptor destination]
    pub fn destination(self: *@This()) CaptureDestination {
        return objc.msgSend(self, "destination", CaptureDestination, .{});
    }
    /// `-[MTLCaptureDescriptor setDestination:]
    pub fn setDestination_(self: *@This(), destination: CaptureDestination) void {
        return objc.msgSend(self, "setDestination:", void, .{destination});
    }
    /// `-[MTLCaptureDescriptor outputURL]
    pub fn outputUrl(self: *@This()) ?*ns.Url {
        return objc.msgSend(self, "outputURL", ?*ns.Url, .{});
    }
    /// `-[MTLCaptureDescriptor setOutputURL:]
    pub fn setOutputUrl_(self: *@This(), output_url: ?*ns.Url) void {
        return objc.msgSend(self, "setOutputURL:", void, .{output_url});
    }
};

/// `MTLCaptureManager`
pub const CaptureManager = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLCaptureManager new]`
    pub const new = InternalInfo.new;
    /// `+[MTLCaptureManager alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLCaptureManager alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLCaptureManager sharedCaptureManager]
    pub fn sharedCaptureManager() *CaptureManager {
        return objc.msgSend(InternalInfo.class(), "sharedCaptureManager", *CaptureManager, .{});
    }
    /// `-[MTLCaptureManager newCaptureScopeWithDevice:]
    pub fn newCaptureScopeWithDevice_(self: *@This(), device: *Device) *CaptureScope {
        return objc.msgSend(self, "newCaptureScopeWithDevice:", *CaptureScope, .{device});
    }
    /// `-[MTLCaptureManager newCaptureScopeWithCommandQueue:]
    pub fn newCaptureScopeWithCommandQueue_(self: *@This(), command_queue: *CommandQueue) *CaptureScope {
        return objc.msgSend(self, "newCaptureScopeWithCommandQueue:", *CaptureScope, .{command_queue});
    }
    /// `-[MTLCaptureManager supportsDestination:]
    pub fn supportsDestination_(self: *@This(), destination: CaptureDestination) bool {
        return objc.msgSend(self, "supportsDestination:", bool, .{destination});
    }
    /// `-[MTLCaptureManager startCaptureWithDescriptor:error:]
    pub fn startCaptureWithDescriptor_error_(self: *@This(), descriptor: *CaptureDescriptor, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "startCaptureWithDescriptor:error:", bool, .{ descriptor, err });
    }
    /// `-[MTLCaptureManager startCaptureWithDevice:]
    pub fn startCaptureWithDevice_(self: *@This(), device: *Device) void {
        return objc.msgSend(self, "startCaptureWithDevice:", void, .{device});
    }
    /// `-[MTLCaptureManager startCaptureWithCommandQueue:]
    pub fn startCaptureWithCommandQueue_(self: *@This(), command_queue: *CommandQueue) void {
        return objc.msgSend(self, "startCaptureWithCommandQueue:", void, .{command_queue});
    }
    /// `-[MTLCaptureManager startCaptureWithScope:]
    pub fn startCaptureWithScope_(self: *@This(), capture_scope: *CaptureScope) void {
        return objc.msgSend(self, "startCaptureWithScope:", void, .{capture_scope});
    }
    /// `-[MTLCaptureManager stopCapture]
    pub fn stopCapture(self: *@This()) void {
        return objc.msgSend(self, "stopCapture", void, .{});
    }
    /// `-[MTLCaptureManager defaultCaptureScope]
    pub fn defaultCaptureScope(self: *@This()) ?*CaptureScope {
        return objc.msgSend(self, "defaultCaptureScope", ?*CaptureScope, .{});
    }
    /// `-[MTLCaptureManager setDefaultCaptureScope:]
    pub fn setDefaultCaptureScope_(self: *@This(), default_capture_scope: ?*CaptureScope) void {
        return objc.msgSend(self, "setDefaultCaptureScope:", void, .{default_capture_scope});
    }
    /// `-[MTLCaptureManager isCapturing]
    pub fn isCapturing(self: *@This()) bool {
        return objc.msgSend(self, "isCapturing", bool, .{});
    }
};

/// `MTLCaptureScope`
pub const CaptureScope = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCaptureScope beginScope]
    pub fn beginScope(self: *@This()) void {
        return objc.msgSend(self, "beginScope", void, .{});
    }
    /// `-[MTLCaptureScope endScope]
    pub fn endScope(self: *@This()) void {
        return objc.msgSend(self, "endScope", void, .{});
    }
    /// `-[MTLCaptureScope label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLCaptureScope setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLCaptureScope device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLCaptureScope commandQueue]
    pub fn commandQueue(self: *@This()) ?*CommandQueue {
        return objc.msgSend(self, "commandQueue", ?*CommandQueue, .{});
    }
};

/// `MTLCommandBufferDescriptor`
pub const CommandBufferDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLCommandBufferDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLCommandBufferDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLCommandBufferDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLCommandBufferDescriptor retainedReferences]
    pub fn retainedReferences(self: *@This()) bool {
        return objc.msgSend(self, "retainedReferences", bool, .{});
    }
    /// `-[MTLCommandBufferDescriptor setRetainedReferences:]
    pub fn setRetainedReferences_(self: *@This(), retained_references: bool) void {
        return objc.msgSend(self, "setRetainedReferences:", void, .{retained_references});
    }
    /// `-[MTLCommandBufferDescriptor errorOptions]
    pub fn errorOptions(self: *@This()) CommandBufferErrorOption {
        return objc.msgSend(self, "errorOptions", CommandBufferErrorOption, .{});
    }
    /// `-[MTLCommandBufferDescriptor setErrorOptions:]
    pub fn setErrorOptions_(self: *@This(), error_options: CommandBufferErrorOption) void {
        return objc.msgSend(self, "setErrorOptions:", void, .{error_options});
    }
};

/// `MTLCommandBufferEncoderInfo`
pub const CommandBufferEncoderInfo = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCommandBufferEncoderInfo label]
    pub fn label(self: *@This()) *ns.String {
        return objc.msgSend(self, "label", *ns.String, .{});
    }
    /// `-[MTLCommandBufferEncoderInfo debugSignposts]
    pub fn debugSignposts(self: *@This()) *ns.Array(*ns.String) {
        return objc.msgSend(self, "debugSignposts", *ns.Array(*ns.String), .{});
    }
    /// `-[MTLCommandBufferEncoderInfo errorState]
    pub fn errorState(self: *@This()) CommandEncoderErrorState {
        return objc.msgSend(self, "errorState", CommandEncoderErrorState, .{});
    }
};

/// `MTLCommandBuffer`
pub const CommandBuffer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCommandBuffer enqueue]
    pub fn enqueue(self: *@This()) void {
        return objc.msgSend(self, "enqueue", void, .{});
    }
    /// `-[MTLCommandBuffer commit]
    pub fn commit(self: *@This()) void {
        return objc.msgSend(self, "commit", void, .{});
    }
    /// `-[MTLCommandBuffer addScheduledHandler:]
    pub fn addScheduledHandler_(self: *@This(), block: *ns.Block(fn (*CommandBuffer) void)) void {
        return objc.msgSend(self, "addScheduledHandler:", void, .{block});
    }
    /// `-[MTLCommandBuffer presentDrawable:]
    pub fn presentDrawable_(self: *@This(), drawable: *Drawable) void {
        return objc.msgSend(self, "presentDrawable:", void, .{drawable});
    }
    /// `-[MTLCommandBuffer presentDrawable:atTime:]
    pub fn presentDrawable_atTime_(self: *@This(), drawable: *Drawable, presentation_time: cf.TimeInterval) void {
        return objc.msgSend(self, "presentDrawable:atTime:", void, .{ drawable, presentation_time });
    }
    /// `-[MTLCommandBuffer presentDrawable:afterMinimumDuration:]
    pub fn presentDrawable_afterMinimumDuration_(self: *@This(), drawable: *Drawable, duration: cf.TimeInterval) void {
        return objc.msgSend(self, "presentDrawable:afterMinimumDuration:", void, .{ drawable, duration });
    }
    /// `-[MTLCommandBuffer waitUntilScheduled]
    pub fn waitUntilScheduled(self: *@This()) void {
        return objc.msgSend(self, "waitUntilScheduled", void, .{});
    }
    /// `-[MTLCommandBuffer addCompletedHandler:]
    pub fn addCompletedHandler_(self: *@This(), block: *ns.Block(fn (*CommandBuffer) void)) void {
        return objc.msgSend(self, "addCompletedHandler:", void, .{block});
    }
    /// `-[MTLCommandBuffer waitUntilCompleted]
    pub fn waitUntilCompleted(self: *@This()) void {
        return objc.msgSend(self, "waitUntilCompleted", void, .{});
    }
    /// `-[MTLCommandBuffer blitCommandEncoder]
    pub fn blitCommandEncoder(self: *@This()) ?*BlitCommandEncoder {
        return objc.msgSend(self, "blitCommandEncoder", ?*BlitCommandEncoder, .{});
    }
    /// `-[MTLCommandBuffer renderCommandEncoderWithDescriptor:]
    pub fn renderCommandEncoderWithDescriptor_(self: *@This(), render_pass_descriptor: *RenderPassDescriptor) ?*RenderCommandEncoder {
        return objc.msgSend(self, "renderCommandEncoderWithDescriptor:", ?*RenderCommandEncoder, .{render_pass_descriptor});
    }
    /// `-[MTLCommandBuffer computeCommandEncoderWithDescriptor:]
    pub fn computeCommandEncoderWithDescriptor_(self: *@This(), compute_pass_descriptor: *ComputePassDescriptor) ?*ComputeCommandEncoder {
        return objc.msgSend(self, "computeCommandEncoderWithDescriptor:", ?*ComputeCommandEncoder, .{compute_pass_descriptor});
    }
    /// `-[MTLCommandBuffer blitCommandEncoderWithDescriptor:]
    pub fn blitCommandEncoderWithDescriptor_(self: *@This(), blit_pass_descriptor: *BlitPassDescriptor) ?*BlitCommandEncoder {
        return objc.msgSend(self, "blitCommandEncoderWithDescriptor:", ?*BlitCommandEncoder, .{blit_pass_descriptor});
    }
    /// `-[MTLCommandBuffer computeCommandEncoder]
    pub fn computeCommandEncoder(self: *@This()) ?*ComputeCommandEncoder {
        return objc.msgSend(self, "computeCommandEncoder", ?*ComputeCommandEncoder, .{});
    }
    /// `-[MTLCommandBuffer computeCommandEncoderWithDispatchType:]
    pub fn computeCommandEncoderWithDispatchType_(self: *@This(), dispatch_type: DispatchType) ?*ComputeCommandEncoder {
        return objc.msgSend(self, "computeCommandEncoderWithDispatchType:", ?*ComputeCommandEncoder, .{dispatch_type});
    }
    /// `-[MTLCommandBuffer encodeWaitForEvent:value:]
    pub fn encodeWaitForEvent_value_(self: *@This(), event: *Event, value: u64) void {
        return objc.msgSend(self, "encodeWaitForEvent:value:", void, .{ event, value });
    }
    /// `-[MTLCommandBuffer encodeSignalEvent:value:]
    pub fn encodeSignalEvent_value_(self: *@This(), event: *Event, value: u64) void {
        return objc.msgSend(self, "encodeSignalEvent:value:", void, .{ event, value });
    }
    /// `-[MTLCommandBuffer parallelRenderCommandEncoderWithDescriptor:]
    pub fn parallelRenderCommandEncoderWithDescriptor_(self: *@This(), render_pass_descriptor: *RenderPassDescriptor) ?*ParallelRenderCommandEncoder {
        return objc.msgSend(self, "parallelRenderCommandEncoderWithDescriptor:", ?*ParallelRenderCommandEncoder, .{render_pass_descriptor});
    }
    /// `-[MTLCommandBuffer resourceStateCommandEncoder]
    pub fn resourceStateCommandEncoder(self: *@This()) ?*ResourceStateCommandEncoder {
        return objc.msgSend(self, "resourceStateCommandEncoder", ?*ResourceStateCommandEncoder, .{});
    }
    /// `-[MTLCommandBuffer resourceStateCommandEncoderWithDescriptor:]
    pub fn resourceStateCommandEncoderWithDescriptor_(self: *@This(), resource_state_pass_descriptor: *ResourceStatePassDescriptor) ?*ResourceStateCommandEncoder {
        return objc.msgSend(self, "resourceStateCommandEncoderWithDescriptor:", ?*ResourceStateCommandEncoder, .{resource_state_pass_descriptor});
    }
    /// `-[MTLCommandBuffer accelerationStructureCommandEncoder]
    pub fn accelerationStructureCommandEncoder(self: *@This()) ?*AccelerationStructureCommandEncoder {
        return objc.msgSend(self, "accelerationStructureCommandEncoder", ?*AccelerationStructureCommandEncoder, .{});
    }
    /// `-[MTLCommandBuffer accelerationStructureCommandEncoderWithDescriptor:]
    pub fn accelerationStructureCommandEncoderWithDescriptor_(self: *@This(), descriptor: *AccelerationStructurePassDescriptor) *AccelerationStructureCommandEncoder {
        return objc.msgSend(self, "accelerationStructureCommandEncoderWithDescriptor:", *AccelerationStructureCommandEncoder, .{descriptor});
    }
    /// `-[MTLCommandBuffer pushDebugGroup:]
    pub fn pushDebugGroup_(self: *@This(), string: *ns.String) void {
        return objc.msgSend(self, "pushDebugGroup:", void, .{string});
    }
    /// `-[MTLCommandBuffer popDebugGroup]
    pub fn popDebugGroup(self: *@This()) void {
        return objc.msgSend(self, "popDebugGroup", void, .{});
    }
    /// `-[MTLCommandBuffer device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLCommandBuffer commandQueue]
    pub fn commandQueue(self: *@This()) *CommandQueue {
        return objc.msgSend(self, "commandQueue", *CommandQueue, .{});
    }
    /// `-[MTLCommandBuffer retainedReferences]
    pub fn retainedReferences(self: *@This()) bool {
        return objc.msgSend(self, "retainedReferences", bool, .{});
    }
    /// `-[MTLCommandBuffer errorOptions]
    pub fn errorOptions(self: *@This()) CommandBufferErrorOption {
        return objc.msgSend(self, "errorOptions", CommandBufferErrorOption, .{});
    }
    /// `-[MTLCommandBuffer label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLCommandBuffer setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLCommandBuffer kernelStartTime]
    pub fn kernelStartTime(self: *@This()) cf.TimeInterval {
        return objc.msgSend(self, "kernelStartTime", cf.TimeInterval, .{});
    }
    /// `-[MTLCommandBuffer kernelEndTime]
    pub fn kernelEndTime(self: *@This()) cf.TimeInterval {
        return objc.msgSend(self, "kernelEndTime", cf.TimeInterval, .{});
    }
    /// `-[MTLCommandBuffer logs]
    pub fn logs(self: *@This()) *LogContainer {
        return objc.msgSend(self, "logs", *LogContainer, .{});
    }
    /// `-[MTLCommandBuffer GPUStartTime]
    pub fn GPUStartTime(self: *@This()) cf.TimeInterval {
        return objc.msgSend(self, "GPUStartTime", cf.TimeInterval, .{});
    }
    /// `-[MTLCommandBuffer GPUEndTime]
    pub fn GPUEndTime(self: *@This()) cf.TimeInterval {
        return objc.msgSend(self, "GPUEndTime", cf.TimeInterval, .{});
    }
    /// `-[MTLCommandBuffer status]
    pub fn status(self: *@This()) CommandBufferStatus {
        return objc.msgSend(self, "status", CommandBufferStatus, .{});
    }
    /// `-[MTLCommandBuffer error]
    pub fn @"error"(self: *@This()) ?*ns.Error {
        return objc.msgSend(self, "error", ?*ns.Error, .{});
    }
};

/// `MTLCommandEncoder`
pub const CommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCommandEncoder endEncoding]
    pub fn endEncoding(self: *@This()) void {
        return objc.msgSend(self, "endEncoding", void, .{});
    }
    /// `-[MTLCommandEncoder insertDebugSignpost:]
    pub fn insertDebugSignpost_(self: *@This(), string: *ns.String) void {
        return objc.msgSend(self, "insertDebugSignpost:", void, .{string});
    }
    /// `-[MTLCommandEncoder pushDebugGroup:]
    pub fn pushDebugGroup_(self: *@This(), string: *ns.String) void {
        return objc.msgSend(self, "pushDebugGroup:", void, .{string});
    }
    /// `-[MTLCommandEncoder popDebugGroup]
    pub fn popDebugGroup(self: *@This()) void {
        return objc.msgSend(self, "popDebugGroup", void, .{});
    }
    /// `-[MTLCommandEncoder device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLCommandEncoder label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLCommandEncoder setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLCommandQueue`
pub const CommandQueue = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCommandQueue commandBuffer]
    pub fn commandBuffer(self: *@This()) ?*CommandBuffer {
        return objc.msgSend(self, "commandBuffer", ?*CommandBuffer, .{});
    }
    /// `-[MTLCommandQueue commandBufferWithDescriptor:]
    pub fn commandBufferWithDescriptor_(self: *@This(), descriptor: *CommandBufferDescriptor) ?*CommandBuffer {
        return objc.msgSend(self, "commandBufferWithDescriptor:", ?*CommandBuffer, .{descriptor});
    }
    /// `-[MTLCommandQueue commandBufferWithUnretainedReferences]
    pub fn commandBufferWithUnretainedReferences(self: *@This()) ?*CommandBuffer {
        return objc.msgSend(self, "commandBufferWithUnretainedReferences", ?*CommandBuffer, .{});
    }
    /// `-[MTLCommandQueue insertDebugCaptureBoundary]
    pub fn insertDebugCaptureBoundary(self: *@This()) void {
        return objc.msgSend(self, "insertDebugCaptureBoundary", void, .{});
    }
    /// `-[MTLCommandQueue label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLCommandQueue setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLCommandQueue device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
};

/// `MTLComputeCommandEncoder`
pub const ComputeCommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), CommandEncoder);
    const as = InternalInfo.as;
    /// `-[MTLComputeCommandEncoder setComputePipelineState:]
    pub fn setComputePipelineState_(self: *@This(), state: *ComputePipelineState) void {
        return objc.msgSend(self, "setComputePipelineState:", void, .{state});
    }
    /// `-[MTLComputeCommandEncoder setBytes:length:atIndex:]
    pub fn setBytes_length_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, index: usize) void {
        return objc.msgSend(self, "setBytes:length:atIndex:", void, .{ bytes, length, index });
    }
    /// `-[MTLComputeCommandEncoder setBuffer:offset:atIndex:]
    pub fn setBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLComputeCommandEncoder setBufferOffset:atIndex:]
    pub fn setBufferOffset_atIndex_(self: *@This(), offset: usize, index: usize) void {
        return objc.msgSend(self, "setBufferOffset:atIndex:", void, .{ offset, index });
    }
    /// `-[MTLComputeCommandEncoder setBuffers:offsets:withRange:]
    pub fn setBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLComputeCommandEncoder setBuffer:offset:attributeStride:atIndex:]
    pub fn setBuffer_offset_attributeStride_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setBuffer:offset:attributeStride:atIndex:", void, .{ buffer, offset, stride, index });
    }
    /// `-[MTLComputeCommandEncoder setBuffers:offsets:attributeStrides:withRange:]
    pub fn setBuffers_offsets_attributeStrides_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, strides: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setBuffers:offsets:attributeStrides:withRange:", void, .{ buffers, offsets, strides, range });
    }
    /// `-[MTLComputeCommandEncoder setBufferOffset:attributeStride:atIndex:]
    pub fn setBufferOffset_attributeStride_atIndex_(self: *@This(), offset: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setBufferOffset:attributeStride:atIndex:", void, .{ offset, stride, index });
    }
    /// `-[MTLComputeCommandEncoder setBytes:length:attributeStride:atIndex:]
    pub fn setBytes_length_attributeStride_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setBytes:length:attributeStride:atIndex:", void, .{ bytes, length, stride, index });
    }
    /// `-[MTLComputeCommandEncoder setVisibleFunctionTable:atBufferIndex:]
    pub fn setVisibleFunctionTable_atBufferIndex_(self: *@This(), visible_function_table: ?*VisibleFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setVisibleFunctionTable:atBufferIndex:", void, .{ visible_function_table, buffer_index });
    }
    /// `-[MTLComputeCommandEncoder setVisibleFunctionTables:withBufferRange:]
    pub fn setVisibleFunctionTables_withBufferRange_(self: *@This(), visible_function_tables: [*]?*const VisibleFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setVisibleFunctionTables:withBufferRange:", void, .{ visible_function_tables, range });
    }
    /// `-[MTLComputeCommandEncoder setIntersectionFunctionTable:atBufferIndex:]
    pub fn setIntersectionFunctionTable_atBufferIndex_(self: *@This(), intersection_function_table: ?*IntersectionFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setIntersectionFunctionTable:atBufferIndex:", void, .{ intersection_function_table, buffer_index });
    }
    /// `-[MTLComputeCommandEncoder setIntersectionFunctionTables:withBufferRange:]
    pub fn setIntersectionFunctionTables_withBufferRange_(self: *@This(), intersection_function_tables: [*]?*const IntersectionFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setIntersectionFunctionTables:withBufferRange:", void, .{ intersection_function_tables, range });
    }
    /// `-[MTLComputeCommandEncoder setAccelerationStructure:atBufferIndex:]
    pub fn setAccelerationStructure_atBufferIndex_(self: *@This(), acceleration_structure: ?*AccelerationStructure, buffer_index: usize) void {
        return objc.msgSend(self, "setAccelerationStructure:atBufferIndex:", void, .{ acceleration_structure, buffer_index });
    }
    /// `-[MTLComputeCommandEncoder setTexture:atIndex:]
    pub fn setTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLComputeCommandEncoder setTextures:withRange:]
    pub fn setTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLComputeCommandEncoder setSamplerState:atIndex:]
    pub fn setSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLComputeCommandEncoder setSamplerStates:withRange:]
    pub fn setSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLComputeCommandEncoder setSamplerState:lodMinClamp:lodMaxClamp:atIndex:]
    pub fn setSamplerState_lodMinClamp_lodMaxClamp_atIndex_(self: *@This(), sampler: ?*SamplerState, lod_min_clamp: f32, lod_max_clamp: f32, index: usize) void {
        return objc.msgSend(self, "setSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler, lod_min_clamp, lod_max_clamp, index });
    }
    /// `-[MTLComputeCommandEncoder setSamplerStates:lodMinClamps:lodMaxClamps:withRange:]
    pub fn setSamplerStates_lodMinClamps_lodMaxClamps_withRange_(self: *@This(), samplers: [*]?*const SamplerState, lod_min_clamps: *const f32, lod_max_clamps: *const f32, range: ns.Range) void {
        return objc.msgSend(self, "setSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers, lod_min_clamps, lod_max_clamps, range });
    }
    /// `-[MTLComputeCommandEncoder setThreadgroupMemoryLength:atIndex:]
    pub fn setThreadgroupMemoryLength_atIndex_(self: *@This(), length: usize, index: usize) void {
        return objc.msgSend(self, "setThreadgroupMemoryLength:atIndex:", void, .{ length, index });
    }
    /// `-[MTLComputeCommandEncoder setImageblockWidth:height:]
    pub fn setImageblockWidth_height_(self: *@This(), width: usize, height: usize) void {
        return objc.msgSend(self, "setImageblockWidth:height:", void, .{ width, height });
    }
    /// `-[MTLComputeCommandEncoder setStageInRegion:]
    pub fn setStageInRegion_(self: *@This(), region: Region) void {
        return objc.msgSend(self, "setStageInRegion:", void, .{region});
    }
    /// `-[MTLComputeCommandEncoder setStageInRegionWithIndirectBuffer:indirectBufferOffset:]
    pub fn setStageInRegionWithIndirectBuffer_indirectBufferOffset_(self: *@This(), indirect_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "setStageInRegionWithIndirectBuffer:indirectBufferOffset:", void, .{ indirect_buffer, indirect_buffer_offset });
    }
    /// `-[MTLComputeCommandEncoder dispatchThreadgroups:threadsPerThreadgroup:]
    pub fn dispatchThreadgroups_threadsPerThreadgroup_(self: *@This(), threadgroups_per_grid: Size, threads_per_threadgroup: Size) void {
        return objc.msgSend(self, "dispatchThreadgroups:threadsPerThreadgroup:", void, .{ threadgroups_per_grid, threads_per_threadgroup });
    }
    /// `-[MTLComputeCommandEncoder dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:]
    pub fn dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_(self: *@This(), indirect_buffer: *Buffer, indirect_buffer_offset: usize, threads_per_threadgroup: Size) void {
        return objc.msgSend(self, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", void, .{ indirect_buffer, indirect_buffer_offset, threads_per_threadgroup });
    }
    /// `-[MTLComputeCommandEncoder dispatchThreads:threadsPerThreadgroup:]
    pub fn dispatchThreads_threadsPerThreadgroup_(self: *@This(), threads_per_grid: Size, threads_per_threadgroup: Size) void {
        return objc.msgSend(self, "dispatchThreads:threadsPerThreadgroup:", void, .{ threads_per_grid, threads_per_threadgroup });
    }
    /// `-[MTLComputeCommandEncoder updateFence:]
    pub fn updateFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "updateFence:", void, .{fence});
    }
    /// `-[MTLComputeCommandEncoder waitForFence:]
    pub fn waitForFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "waitForFence:", void, .{fence});
    }
    /// `-[MTLComputeCommandEncoder useResource:usage:]
    pub fn useResource_usage_(self: *@This(), resource: *Resource, usage: ResourceUsage) void {
        return objc.msgSend(self, "useResource:usage:", void, .{ resource, usage });
    }
    /// `-[MTLComputeCommandEncoder useResources:count:usage:]
    pub fn useResources_count_usage_(self: *@This(), resources: [*]*const Resource, count: usize, usage: ResourceUsage) void {
        return objc.msgSend(self, "useResources:count:usage:", void, .{ resources, count, usage });
    }
    /// `-[MTLComputeCommandEncoder useHeap:]
    pub fn useHeap_(self: *@This(), heap: *Heap) void {
        return objc.msgSend(self, "useHeap:", void, .{heap});
    }
    /// `-[MTLComputeCommandEncoder useHeaps:count:]
    pub fn useHeaps_count_(self: *@This(), heaps: [*]*const Heap, count: usize) void {
        return objc.msgSend(self, "useHeaps:count:", void, .{ heaps, count });
    }
    /// `-[MTLComputeCommandEncoder executeCommandsInBuffer:withRange:]
    pub fn executeCommandsInBuffer_withRange_(self: *@This(), indirect_command_buffer: *IndirectCommandBuffer, execution_range: ns.Range) void {
        return objc.msgSend(self, "executeCommandsInBuffer:withRange:", void, .{ indirect_command_buffer, execution_range });
    }
    /// `-[MTLComputeCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:]
    pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_(self: *@This(), indirect_commandbuffer: *IndirectCommandBuffer, indirect_range_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", void, .{ indirect_commandbuffer, indirect_range_buffer, indirect_buffer_offset });
    }
    /// `-[MTLComputeCommandEncoder memoryBarrierWithScope:]
    pub fn memoryBarrierWithScope_(self: *@This(), scope: BarrierScope) void {
        return objc.msgSend(self, "memoryBarrierWithScope:", void, .{scope});
    }
    /// `-[MTLComputeCommandEncoder memoryBarrierWithResources:count:]
    pub fn memoryBarrierWithResources_count_(self: *@This(), resources: [*]*const Resource, count: usize) void {
        return objc.msgSend(self, "memoryBarrierWithResources:count:", void, .{ resources, count });
    }
    /// `-[MTLComputeCommandEncoder sampleCountersInBuffer:atSampleIndex:withBarrier:]
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier_(self: *@This(), sample_buffer: *CounterSampleBuffer, sample_index: usize, barrier: bool) void {
        return objc.msgSend(self, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sample_buffer, sample_index, barrier });
    }
    /// `-[MTLComputeCommandEncoder dispatchType]
    pub fn dispatchType(self: *@This()) DispatchType {
        return objc.msgSend(self, "dispatchType", DispatchType, .{});
    }
};

/// `MTLComputePassSampleBufferAttachmentDescriptor`
pub const ComputePassSampleBufferAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLComputePassSampleBufferAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLComputePassSampleBufferAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLComputePassSampleBufferAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLComputePassSampleBufferAttachmentDescriptor sampleBuffer]
    pub fn sampleBuffer(self: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    /// `-[MTLComputePassSampleBufferAttachmentDescriptor setSampleBuffer:]
    pub fn setSampleBuffer_(self: *@This(), sample_buffer: ?*CounterSampleBuffer) void {
        return objc.msgSend(self, "setSampleBuffer:", void, .{sample_buffer});
    }
    /// `-[MTLComputePassSampleBufferAttachmentDescriptor startOfEncoderSampleIndex]
    pub fn startOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "startOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLComputePassSampleBufferAttachmentDescriptor setStartOfEncoderSampleIndex:]
    pub fn setStartOfEncoderSampleIndex_(self: *@This(), start_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setStartOfEncoderSampleIndex:", void, .{start_of_encoder_sample_index});
    }
    /// `-[MTLComputePassSampleBufferAttachmentDescriptor endOfEncoderSampleIndex]
    pub fn endOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "endOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLComputePassSampleBufferAttachmentDescriptor setEndOfEncoderSampleIndex:]
    pub fn setEndOfEncoderSampleIndex_(self: *@This(), end_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setEndOfEncoderSampleIndex:", void, .{end_of_encoder_sample_index});
    }
};

/// `MTLComputePassSampleBufferAttachmentDescriptorArray`
pub const ComputePassSampleBufferAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLComputePassSampleBufferAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLComputePassSampleBufferAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLComputePassSampleBufferAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLComputePassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *ComputePassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *ComputePassSampleBufferAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLComputePassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*ComputePassSampleBufferAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLComputePassDescriptor`
pub const ComputePassDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLComputePassDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLComputePassDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLComputePassDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLComputePassDescriptor computePassDescriptor]
    pub fn computePassDescriptor() *ComputePassDescriptor {
        return objc.msgSend(InternalInfo.class(), "computePassDescriptor", *ComputePassDescriptor, .{});
    }
    /// `-[MTLComputePassDescriptor dispatchType]
    pub fn dispatchType(self: *@This()) DispatchType {
        return objc.msgSend(self, "dispatchType", DispatchType, .{});
    }
    /// `-[MTLComputePassDescriptor setDispatchType:]
    pub fn setDispatchType_(self: *@This(), dispatch_type: DispatchType) void {
        return objc.msgSend(self, "setDispatchType:", void, .{dispatch_type});
    }
    /// `-[MTLComputePassDescriptor sampleBufferAttachments]
    pub fn sampleBufferAttachments(self: *@This()) *ComputePassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self, "sampleBufferAttachments", *ComputePassSampleBufferAttachmentDescriptorArray, .{});
    }
};

/// `MTLComputePipelineReflection`
pub const ComputePipelineReflection = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLComputePipelineReflection new]`
    pub const new = InternalInfo.new;
    /// `+[MTLComputePipelineReflection alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLComputePipelineReflection alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLComputePipelineReflection bindings]
    pub fn bindings(self: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self, "bindings", *ns.Array(*Binding), .{});
    }
    /// `-[MTLComputePipelineReflection arguments]
    pub fn arguments(self: *@This()) *ns.Array(*Argument) {
        return objc.msgSend(self, "arguments", *ns.Array(*Argument), .{});
    }
};

/// `MTLComputePipelineDescriptor`
pub const ComputePipelineDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLComputePipelineDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLComputePipelineDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLComputePipelineDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLComputePipelineDescriptor reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLComputePipelineDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLComputePipelineDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLComputePipelineDescriptor computeFunction]
    pub fn computeFunction(self: *@This()) ?*Function {
        return objc.msgSend(self, "computeFunction", ?*Function, .{});
    }
    /// `-[MTLComputePipelineDescriptor setComputeFunction:]
    pub fn setComputeFunction_(self: *@This(), compute_function: ?*Function) void {
        return objc.msgSend(self, "setComputeFunction:", void, .{compute_function});
    }
    /// `-[MTLComputePipelineDescriptor threadGroupSizeIsMultipleOfThreadExecutionWidth]
    pub fn threadGroupSizeIsMultipleOfThreadExecutionWidth(self: *@This()) bool {
        return objc.msgSend(self, "threadGroupSizeIsMultipleOfThreadExecutionWidth", bool, .{});
    }
    /// `-[MTLComputePipelineDescriptor setThreadGroupSizeIsMultipleOfThreadExecutionWidth:]
    pub fn setThreadGroupSizeIsMultipleOfThreadExecutionWidth_(self: *@This(), thread_group_size_is_multiple_of_thread_execution_width: bool) void {
        return objc.msgSend(self, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", void, .{thread_group_size_is_multiple_of_thread_execution_width});
    }
    /// `-[MTLComputePipelineDescriptor maxTotalThreadsPerThreadgroup]
    pub fn maxTotalThreadsPerThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerThreadgroup", usize, .{});
    }
    /// `-[MTLComputePipelineDescriptor setMaxTotalThreadsPerThreadgroup:]
    pub fn setMaxTotalThreadsPerThreadgroup_(self: *@This(), max_total_threads_per_threadgroup: usize) void {
        return objc.msgSend(self, "setMaxTotalThreadsPerThreadgroup:", void, .{max_total_threads_per_threadgroup});
    }
    /// `-[MTLComputePipelineDescriptor stageInputDescriptor]
    pub fn stageInputDescriptor(self: *@This()) ?*StageInputOutputDescriptor {
        return objc.msgSend(self, "stageInputDescriptor", ?*StageInputOutputDescriptor, .{});
    }
    /// `-[MTLComputePipelineDescriptor setStageInputDescriptor:]
    pub fn setStageInputDescriptor_(self: *@This(), stage_input_descriptor: ?*StageInputOutputDescriptor) void {
        return objc.msgSend(self, "setStageInputDescriptor:", void, .{stage_input_descriptor});
    }
    /// `-[MTLComputePipelineDescriptor buffers]
    pub fn buffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "buffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLComputePipelineDescriptor supportIndirectCommandBuffers]
    pub fn supportIndirectCommandBuffers(self: *@This()) bool {
        return objc.msgSend(self, "supportIndirectCommandBuffers", bool, .{});
    }
    /// `-[MTLComputePipelineDescriptor setSupportIndirectCommandBuffers:]
    pub fn setSupportIndirectCommandBuffers_(self: *@This(), support_indirect_command_buffers: bool) void {
        return objc.msgSend(self, "setSupportIndirectCommandBuffers:", void, .{support_indirect_command_buffers});
    }
    /// `-[MTLComputePipelineDescriptor insertLibraries]
    pub fn insertLibraries(self: *@This()) ?*ns.Array(*DynamicLibrary) {
        return objc.msgSend(self, "insertLibraries", ?*ns.Array(*DynamicLibrary), .{});
    }
    /// `-[MTLComputePipelineDescriptor setInsertLibraries:]
    pub fn setInsertLibraries_(self: *@This(), insert_libraries: ?*ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self, "setInsertLibraries:", void, .{insert_libraries});
    }
    /// `-[MTLComputePipelineDescriptor preloadedLibraries]
    pub fn preloadedLibraries(self: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self, "preloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    /// `-[MTLComputePipelineDescriptor setPreloadedLibraries:]
    pub fn setPreloadedLibraries_(self: *@This(), preloaded_libraries: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self, "setPreloadedLibraries:", void, .{preloaded_libraries});
    }
    /// `-[MTLComputePipelineDescriptor binaryArchives]
    pub fn binaryArchives(self: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    /// `-[MTLComputePipelineDescriptor setBinaryArchives:]
    pub fn setBinaryArchives_(self: *@This(), binary_archives: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self, "setBinaryArchives:", void, .{binary_archives});
    }
    /// `-[MTLComputePipelineDescriptor linkedFunctions]
    pub fn linkedFunctions(self: *@This()) ?*LinkedFunctions {
        return objc.msgSend(self, "linkedFunctions", ?*LinkedFunctions, .{});
    }
    /// `-[MTLComputePipelineDescriptor setLinkedFunctions:]
    pub fn setLinkedFunctions_(self: *@This(), linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setLinkedFunctions:", void, .{linked_functions});
    }
    /// `-[MTLComputePipelineDescriptor supportAddingBinaryFunctions]
    pub fn supportAddingBinaryFunctions(self: *@This()) bool {
        return objc.msgSend(self, "supportAddingBinaryFunctions", bool, .{});
    }
    /// `-[MTLComputePipelineDescriptor setSupportAddingBinaryFunctions:]
    pub fn setSupportAddingBinaryFunctions_(self: *@This(), support_adding_binary_functions: bool) void {
        return objc.msgSend(self, "setSupportAddingBinaryFunctions:", void, .{support_adding_binary_functions});
    }
    /// `-[MTLComputePipelineDescriptor maxCallStackDepth]
    pub fn maxCallStackDepth(self: *@This()) usize {
        return objc.msgSend(self, "maxCallStackDepth", usize, .{});
    }
    /// `-[MTLComputePipelineDescriptor setMaxCallStackDepth:]
    pub fn setMaxCallStackDepth_(self: *@This(), max_call_stack_depth: usize) void {
        return objc.msgSend(self, "setMaxCallStackDepth:", void, .{max_call_stack_depth});
    }
};

/// `MTLComputePipelineState`
pub const ComputePipelineState = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLComputePipelineState imageblockMemoryLengthForDimensions:]
    pub fn imageblockMemoryLengthForDimensions_(self: *@This(), imageblock_dimensions: Size) usize {
        return objc.msgSend(self, "imageblockMemoryLengthForDimensions:", usize, .{imageblock_dimensions});
    }
    /// `-[MTLComputePipelineState functionHandleWithFunction:]
    pub fn functionHandleWithFunction_(self: *@This(), function: *Function) ?*FunctionHandle {
        return objc.msgSend(self, "functionHandleWithFunction:", ?*FunctionHandle, .{function});
    }
    /// `-[MTLComputePipelineState newComputePipelineStateWithAdditionalBinaryFunctions:error:]
    pub fn newComputePipelineStateWithAdditionalBinaryFunctions_error_(self: *@This(), functions: *ns.Array(*Function), err: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self, "newComputePipelineStateWithAdditionalBinaryFunctions:error:", ?*ComputePipelineState, .{ functions, err });
    }
    /// `-[MTLComputePipelineState newVisibleFunctionTableWithDescriptor:]
    pub fn newVisibleFunctionTableWithDescriptor_(self: *@This(), descriptor: *VisibleFunctionTableDescriptor) ?*VisibleFunctionTable {
        return objc.msgSend(self, "newVisibleFunctionTableWithDescriptor:", ?*VisibleFunctionTable, .{descriptor});
    }
    /// `-[MTLComputePipelineState newIntersectionFunctionTableWithDescriptor:]
    pub fn newIntersectionFunctionTableWithDescriptor_(self: *@This(), descriptor: *IntersectionFunctionTableDescriptor) ?*IntersectionFunctionTable {
        return objc.msgSend(self, "newIntersectionFunctionTableWithDescriptor:", ?*IntersectionFunctionTable, .{descriptor});
    }
    /// `-[MTLComputePipelineState label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLComputePipelineState device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLComputePipelineState maxTotalThreadsPerThreadgroup]
    pub fn maxTotalThreadsPerThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerThreadgroup", usize, .{});
    }
    /// `-[MTLComputePipelineState threadExecutionWidth]
    pub fn threadExecutionWidth(self: *@This()) usize {
        return objc.msgSend(self, "threadExecutionWidth", usize, .{});
    }
    /// `-[MTLComputePipelineState staticThreadgroupMemoryLength]
    pub fn staticThreadgroupMemoryLength(self: *@This()) usize {
        return objc.msgSend(self, "staticThreadgroupMemoryLength", usize, .{});
    }
    /// `-[MTLComputePipelineState supportIndirectCommandBuffers]
    pub fn supportIndirectCommandBuffers(self: *@This()) bool {
        return objc.msgSend(self, "supportIndirectCommandBuffers", bool, .{});
    }
    /// `-[MTLComputePipelineState gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};

/// `MTLCounter`
pub const Counter = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCounter name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
};

/// `MTLCounterSet`
pub const CounterSet = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCounterSet name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLCounterSet counters]
    pub fn counters(self: *@This()) *ns.Array(*Counter) {
        return objc.msgSend(self, "counters", *ns.Array(*Counter), .{});
    }
};

/// `MTLCounterSampleBufferDescriptor`
pub const CounterSampleBufferDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLCounterSampleBufferDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLCounterSampleBufferDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLCounterSampleBufferDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLCounterSampleBufferDescriptor counterSet]
    pub fn counterSet(self: *@This()) ?*CounterSet {
        return objc.msgSend(self, "counterSet", ?*CounterSet, .{});
    }
    /// `-[MTLCounterSampleBufferDescriptor setCounterSet:]
    pub fn setCounterSet_(self: *@This(), counter_set: ?*CounterSet) void {
        return objc.msgSend(self, "setCounterSet:", void, .{counter_set});
    }
    /// `-[MTLCounterSampleBufferDescriptor label]
    pub fn label(self: *@This()) *ns.String {
        return objc.msgSend(self, "label", *ns.String, .{});
    }
    /// `-[MTLCounterSampleBufferDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: *ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLCounterSampleBufferDescriptor storageMode]
    pub fn storageMode(self: *@This()) StorageMode {
        return objc.msgSend(self, "storageMode", StorageMode, .{});
    }
    /// `-[MTLCounterSampleBufferDescriptor setStorageMode:]
    pub fn setStorageMode_(self: *@This(), storage_mode: StorageMode) void {
        return objc.msgSend(self, "setStorageMode:", void, .{storage_mode});
    }
    /// `-[MTLCounterSampleBufferDescriptor sampleCount]
    pub fn sampleCount(self: *@This()) usize {
        return objc.msgSend(self, "sampleCount", usize, .{});
    }
    /// `-[MTLCounterSampleBufferDescriptor setSampleCount:]
    pub fn setSampleCount_(self: *@This(), sample_count: usize) void {
        return objc.msgSend(self, "setSampleCount:", void, .{sample_count});
    }
};

/// `MTLCounterSampleBuffer`
pub const CounterSampleBuffer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLCounterSampleBuffer resolveCounterRange:]
    pub fn resolveCounterRange_(self: *@This(), range: ns.Range) ?*ns.Data {
        return objc.msgSend(self, "resolveCounterRange:", ?*ns.Data, .{range});
    }
    /// `-[MTLCounterSampleBuffer device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLCounterSampleBuffer label]
    pub fn label(self: *@This()) *ns.String {
        return objc.msgSend(self, "label", *ns.String, .{});
    }
    /// `-[MTLCounterSampleBuffer sampleCount]
    pub fn sampleCount(self: *@This()) usize {
        return objc.msgSend(self, "sampleCount", usize, .{});
    }
};

/// `MTLStencilDescriptor`
pub const StencilDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLStencilDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLStencilDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLStencilDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLStencilDescriptor stencilCompareFunction]
    pub fn stencilCompareFunction(self: *@This()) CompareFunction {
        return objc.msgSend(self, "stencilCompareFunction", CompareFunction, .{});
    }
    /// `-[MTLStencilDescriptor setStencilCompareFunction:]
    pub fn setStencilCompareFunction_(self: *@This(), stencil_compare_function: CompareFunction) void {
        return objc.msgSend(self, "setStencilCompareFunction:", void, .{stencil_compare_function});
    }
    /// `-[MTLStencilDescriptor stencilFailureOperation]
    pub fn stencilFailureOperation(self: *@This()) StencilOperation {
        return objc.msgSend(self, "stencilFailureOperation", StencilOperation, .{});
    }
    /// `-[MTLStencilDescriptor setStencilFailureOperation:]
    pub fn setStencilFailureOperation_(self: *@This(), stencil_failure_operation: StencilOperation) void {
        return objc.msgSend(self, "setStencilFailureOperation:", void, .{stencil_failure_operation});
    }
    /// `-[MTLStencilDescriptor depthFailureOperation]
    pub fn depthFailureOperation(self: *@This()) StencilOperation {
        return objc.msgSend(self, "depthFailureOperation", StencilOperation, .{});
    }
    /// `-[MTLStencilDescriptor setDepthFailureOperation:]
    pub fn setDepthFailureOperation_(self: *@This(), depth_failure_operation: StencilOperation) void {
        return objc.msgSend(self, "setDepthFailureOperation:", void, .{depth_failure_operation});
    }
    /// `-[MTLStencilDescriptor depthStencilPassOperation]
    pub fn depthStencilPassOperation(self: *@This()) StencilOperation {
        return objc.msgSend(self, "depthStencilPassOperation", StencilOperation, .{});
    }
    /// `-[MTLStencilDescriptor setDepthStencilPassOperation:]
    pub fn setDepthStencilPassOperation_(self: *@This(), depth_stencil_pass_operation: StencilOperation) void {
        return objc.msgSend(self, "setDepthStencilPassOperation:", void, .{depth_stencil_pass_operation});
    }
    /// `-[MTLStencilDescriptor readMask]
    pub fn readMask(self: *@This()) u32 {
        return objc.msgSend(self, "readMask", u32, .{});
    }
    /// `-[MTLStencilDescriptor setReadMask:]
    pub fn setReadMask_(self: *@This(), read_mask: u32) void {
        return objc.msgSend(self, "setReadMask:", void, .{read_mask});
    }
    /// `-[MTLStencilDescriptor writeMask]
    pub fn writeMask(self: *@This()) u32 {
        return objc.msgSend(self, "writeMask", u32, .{});
    }
    /// `-[MTLStencilDescriptor setWriteMask:]
    pub fn setWriteMask_(self: *@This(), write_mask: u32) void {
        return objc.msgSend(self, "setWriteMask:", void, .{write_mask});
    }
};

/// `MTLDepthStencilDescriptor`
pub const DepthStencilDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLDepthStencilDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLDepthStencilDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLDepthStencilDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLDepthStencilDescriptor depthCompareFunction]
    pub fn depthCompareFunction(self: *@This()) CompareFunction {
        return objc.msgSend(self, "depthCompareFunction", CompareFunction, .{});
    }
    /// `-[MTLDepthStencilDescriptor setDepthCompareFunction:]
    pub fn setDepthCompareFunction_(self: *@This(), depth_compare_function: CompareFunction) void {
        return objc.msgSend(self, "setDepthCompareFunction:", void, .{depth_compare_function});
    }
    /// `-[MTLDepthStencilDescriptor isDepthWriteEnabled]
    pub fn isDepthWriteEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isDepthWriteEnabled", bool, .{});
    }
    /// `-[MTLDepthStencilDescriptor setDepthWriteEnabled:]
    pub fn setDepthWriteEnabled_(self: *@This(), depth_write_enabled: bool) void {
        return objc.msgSend(self, "setDepthWriteEnabled:", void, .{depth_write_enabled});
    }
    /// `-[MTLDepthStencilDescriptor frontFaceStencil]
    pub fn frontFaceStencil(self: *@This()) *StencilDescriptor {
        return objc.msgSend(self, "frontFaceStencil", *StencilDescriptor, .{});
    }
    /// `-[MTLDepthStencilDescriptor setFrontFaceStencil:]
    pub fn setFrontFaceStencil_(self: *@This(), front_face_stencil: ?*StencilDescriptor) void {
        return objc.msgSend(self, "setFrontFaceStencil:", void, .{front_face_stencil});
    }
    /// `-[MTLDepthStencilDescriptor backFaceStencil]
    pub fn backFaceStencil(self: *@This()) *StencilDescriptor {
        return objc.msgSend(self, "backFaceStencil", *StencilDescriptor, .{});
    }
    /// `-[MTLDepthStencilDescriptor setBackFaceStencil:]
    pub fn setBackFaceStencil_(self: *@This(), back_face_stencil: ?*StencilDescriptor) void {
        return objc.msgSend(self, "setBackFaceStencil:", void, .{back_face_stencil});
    }
    /// `-[MTLDepthStencilDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLDepthStencilDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLDepthStencilState`
pub const DepthStencilState = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLDepthStencilState label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLDepthStencilState device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
};

/// `MTLArchitecture`
pub const Architecture = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLArchitecture new]`
    pub const new = InternalInfo.new;
    /// `+[MTLArchitecture alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLArchitecture alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLArchitecture name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
};

/// `MTLArgumentDescriptor`
pub const ArgumentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLArgumentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLArgumentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLArgumentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLArgumentDescriptor argumentDescriptor]
    pub fn argumentDescriptor() *ArgumentDescriptor {
        return objc.msgSend(InternalInfo.class(), "argumentDescriptor", *ArgumentDescriptor, .{});
    }
    /// `-[MTLArgumentDescriptor dataType]
    pub fn dataType(self: *@This()) DataType {
        return objc.msgSend(self, "dataType", DataType, .{});
    }
    /// `-[MTLArgumentDescriptor setDataType:]
    pub fn setDataType_(self: *@This(), data_type: DataType) void {
        return objc.msgSend(self, "setDataType:", void, .{data_type});
    }
    /// `-[MTLArgumentDescriptor index]
    pub fn index(self: *@This()) usize {
        return objc.msgSend(self, "index", usize, .{});
    }
    /// `-[MTLArgumentDescriptor setIndex:]
    pub fn setIndex_(self: *@This(), index: usize) void {
        return objc.msgSend(self, "setIndex:", void, .{index});
    }
    /// `-[MTLArgumentDescriptor arrayLength]
    pub fn arrayLength(self: *@This()) usize {
        return objc.msgSend(self, "arrayLength", usize, .{});
    }
    /// `-[MTLArgumentDescriptor setArrayLength:]
    pub fn setArrayLength_(self: *@This(), array_length: usize) void {
        return objc.msgSend(self, "setArrayLength:", void, .{array_length});
    }
    /// `-[MTLArgumentDescriptor access]
    pub fn access(self: *@This()) BindingAccess {
        return objc.msgSend(self, "access", BindingAccess, .{});
    }
    /// `-[MTLArgumentDescriptor setAccess:]
    pub fn setAccess_(self: *@This(), access: BindingAccess) void {
        return objc.msgSend(self, "setAccess:", void, .{access});
    }
    /// `-[MTLArgumentDescriptor textureType]
    pub fn textureType(self: *@This()) TextureType {
        return objc.msgSend(self, "textureType", TextureType, .{});
    }
    /// `-[MTLArgumentDescriptor setTextureType:]
    pub fn setTextureType_(self: *@This(), texture_type: TextureType) void {
        return objc.msgSend(self, "setTextureType:", void, .{texture_type});
    }
    /// `-[MTLArgumentDescriptor constantBlockAlignment]
    pub fn constantBlockAlignment(self: *@This()) usize {
        return objc.msgSend(self, "constantBlockAlignment", usize, .{});
    }
    /// `-[MTLArgumentDescriptor setConstantBlockAlignment:]
    pub fn setConstantBlockAlignment_(self: *@This(), constant_block_alignment: usize) void {
        return objc.msgSend(self, "setConstantBlockAlignment:", void, .{constant_block_alignment});
    }
};

/// `MTLDevice`
pub const Device = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLDevice newCommandQueue]
    pub fn newCommandQueue(self: *@This()) ?*CommandQueue {
        return objc.msgSend(self, "newCommandQueue", ?*CommandQueue, .{});
    }
    /// `-[MTLDevice newCommandQueueWithMaxCommandBufferCount:]
    pub fn newCommandQueueWithMaxCommandBufferCount_(self: *@This(), max_command_buffer_count: usize) ?*CommandQueue {
        return objc.msgSend(self, "newCommandQueueWithMaxCommandBufferCount:", ?*CommandQueue, .{max_command_buffer_count});
    }
    /// `-[MTLDevice heapTextureSizeAndAlignWithDescriptor:]
    pub fn heapTextureSizeAndAlignWithDescriptor_(self: *@This(), desc: *TextureDescriptor) SizeAndAlign {
        return objc.msgSend(self, "heapTextureSizeAndAlignWithDescriptor:", SizeAndAlign, .{desc});
    }
    /// `-[MTLDevice heapBufferSizeAndAlignWithLength:options:]
    pub fn heapBufferSizeAndAlignWithLength_options_(self: *@This(), length: usize, options: ResourceOptions) SizeAndAlign {
        return objc.msgSend(self, "heapBufferSizeAndAlignWithLength:options:", SizeAndAlign, .{ length, options });
    }
    /// `-[MTLDevice newHeapWithDescriptor:]
    pub fn newHeapWithDescriptor_(self: *@This(), descriptor: *HeapDescriptor) ?*Heap {
        return objc.msgSend(self, "newHeapWithDescriptor:", ?*Heap, .{descriptor});
    }
    /// `-[MTLDevice newBufferWithLength:options:]
    pub fn newBufferWithLength_options_(self: *@This(), length: usize, options: ResourceOptions) ?*Buffer {
        return objc.msgSend(self, "newBufferWithLength:options:", ?*Buffer, .{ length, options });
    }
    /// `-[MTLDevice newBufferWithBytes:length:options:]
    pub fn newBufferWithBytes_length_options_(self: *@This(), pointer: *const anyopaque, length: usize, options: ResourceOptions) ?*Buffer {
        return objc.msgSend(self, "newBufferWithBytes:length:options:", ?*Buffer, .{ pointer, length, options });
    }
    /// `-[MTLDevice newBufferWithBytesNoCopy:length:options:deallocator:]
    pub fn newBufferWithBytesNoCopy_length_options_deallocator_(self: *@This(), pointer: *anyopaque, length: usize, options: ResourceOptions, deallocator: *ns.Block(fn (*anyopaque, usize) void)) ?*Buffer {
        return objc.msgSend(self, "newBufferWithBytesNoCopy:length:options:deallocator:", ?*Buffer, .{ pointer, length, options, deallocator });
    }
    /// `-[MTLDevice newDepthStencilStateWithDescriptor:]
    pub fn newDepthStencilStateWithDescriptor_(self: *@This(), descriptor: *DepthStencilDescriptor) ?*DepthStencilState {
        return objc.msgSend(self, "newDepthStencilStateWithDescriptor:", ?*DepthStencilState, .{descriptor});
    }
    /// `-[MTLDevice newTextureWithDescriptor:]
    pub fn newTextureWithDescriptor_(self: *@This(), descriptor: *TextureDescriptor) ?*Texture {
        return objc.msgSend(self, "newTextureWithDescriptor:", ?*Texture, .{descriptor});
    }
    /// `-[MTLDevice newTextureWithDescriptor:iosurface:plane:]
    pub fn newTextureWithDescriptor_iosurface_plane_(self: *@This(), descriptor: *TextureDescriptor, iosurface: *io.Surface, plane: usize) ?*Texture {
        return objc.msgSend(self, "newTextureWithDescriptor:iosurface:plane:", ?*Texture, .{ descriptor, iosurface, plane });
    }
    /// `-[MTLDevice newSharedTextureWithDescriptor:]
    pub fn newSharedTextureWithDescriptor_(self: *@This(), descriptor: *TextureDescriptor) ?*Texture {
        return objc.msgSend(self, "newSharedTextureWithDescriptor:", ?*Texture, .{descriptor});
    }
    /// `-[MTLDevice newSharedTextureWithHandle:]
    pub fn newSharedTextureWithHandle_(self: *@This(), shared_handle: *SharedTextureHandle) ?*Texture {
        return objc.msgSend(self, "newSharedTextureWithHandle:", ?*Texture, .{shared_handle});
    }
    /// `-[MTLDevice newSamplerStateWithDescriptor:]
    pub fn newSamplerStateWithDescriptor_(self: *@This(), descriptor: *SamplerDescriptor) ?*SamplerState {
        return objc.msgSend(self, "newSamplerStateWithDescriptor:", ?*SamplerState, .{descriptor});
    }
    /// `-[MTLDevice newDefaultLibrary]
    pub fn newDefaultLibrary(self: *@This()) ?*Library {
        return objc.msgSend(self, "newDefaultLibrary", ?*Library, .{});
    }
    /// `-[MTLDevice newDefaultLibraryWithBundle:error:]
    pub fn newDefaultLibraryWithBundle_error_(self: *@This(), bundle: *ns.Bundle, err: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self, "newDefaultLibraryWithBundle:error:", ?*Library, .{ bundle, err });
    }
    /// `-[MTLDevice newLibraryWithFile:error:]
    pub fn newLibraryWithFile_error_(self: *@This(), filepath: *ns.String, err: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self, "newLibraryWithFile:error:", ?*Library, .{ filepath, err });
    }
    /// `-[MTLDevice newLibraryWithURL:error:]
    pub fn newLibraryWithUrl_error_(self: *@This(), url: *ns.Url, err: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self, "newLibraryWithURL:error:", ?*Library, .{ url, err });
    }
    /// `-[MTLDevice newLibraryWithData:error:]
    pub fn newLibraryWithData_error_(self: *@This(), data: *const dispatch.Data, err: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self, "newLibraryWithData:error:", ?*Library, .{ data, err });
    }
    /// `-[MTLDevice newLibraryWithSource:options:error:]
    pub fn newLibraryWithSource_options_error_(self: *@This(), source: *ns.String, options: ?*CompileOptions, err: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self, "newLibraryWithSource:options:error:", ?*Library, .{ source, options, err });
    }
    /// `-[MTLDevice newLibraryWithSource:options:completionHandler:]
    pub fn newLibraryWithSource_options_completionHandler_(self: *@This(), source: *ns.String, options: ?*CompileOptions, completion_handler: *ns.Block(fn (?*Library, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newLibraryWithSource:options:completionHandler:", void, .{ source, options, completion_handler });
    }
    /// `-[MTLDevice newLibraryWithStitchedDescriptor:error:]
    pub fn newLibraryWithStitchedDescriptor_error_(self: *@This(), descriptor: *StitchedLibraryDescriptor, err: ?*?*ns.Error) ?*Library {
        return objc.msgSend(self, "newLibraryWithStitchedDescriptor:error:", ?*Library, .{ descriptor, err });
    }
    /// `-[MTLDevice newLibraryWithStitchedDescriptor:completionHandler:]
    pub fn newLibraryWithStitchedDescriptor_completionHandler_(self: *@This(), descriptor: *StitchedLibraryDescriptor, completion_handler: *ns.Block(fn (?*Library, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newLibraryWithStitchedDescriptor:completionHandler:", void, .{ descriptor, completion_handler });
    }
    /// `-[MTLDevice newRenderPipelineStateWithDescriptor:error:]
    pub fn newRenderPipelineStateWithDescriptor_error_(self: *@This(), descriptor: *RenderPipelineDescriptor, err: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self, "newRenderPipelineStateWithDescriptor:error:", ?*RenderPipelineState, .{ descriptor, err });
    }
    /// `-[MTLDevice newRenderPipelineStateWithDescriptor:options:reflection:error:]
    pub fn newRenderPipelineStateWithDescriptor_options_reflection_error_(self: *@This(), descriptor: *RenderPipelineDescriptor, options: PipelineOption, reflection: ?*AutoreleasedRenderPipelineReflection, err: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self, "newRenderPipelineStateWithDescriptor:options:reflection:error:", ?*RenderPipelineState, .{ descriptor, options, reflection, err });
    }
    /// `-[MTLDevice newRenderPipelineStateWithDescriptor:completionHandler:]
    pub fn newRenderPipelineStateWithDescriptor_completionHandler_(self: *@This(), descriptor: *RenderPipelineDescriptor, completion_handler: *ns.Block(fn (?*RenderPipelineState, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newRenderPipelineStateWithDescriptor:completionHandler:", void, .{ descriptor, completion_handler });
    }
    /// `-[MTLDevice newRenderPipelineStateWithDescriptor:options:completionHandler:]
    pub fn newRenderPipelineStateWithDescriptor_options_completionHandler_(self: *@This(), descriptor: *RenderPipelineDescriptor, options: PipelineOption, completion_handler: *ns.Block(fn (?*RenderPipelineState, *RenderPipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newRenderPipelineStateWithDescriptor:options:completionHandler:", void, .{ descriptor, options, completion_handler });
    }
    /// `-[MTLDevice newComputePipelineStateWithFunction:error:]
    pub fn newComputePipelineStateWithFunction_error_(self: *@This(), compute_function: *Function, err: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self, "newComputePipelineStateWithFunction:error:", ?*ComputePipelineState, .{ compute_function, err });
    }
    /// `-[MTLDevice newComputePipelineStateWithFunction:options:reflection:error:]
    pub fn newComputePipelineStateWithFunction_options_reflection_error_(self: *@This(), compute_function: *Function, options: PipelineOption, reflection: ?*AutoreleasedComputePipelineReflection, err: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self, "newComputePipelineStateWithFunction:options:reflection:error:", ?*ComputePipelineState, .{ compute_function, options, reflection, err });
    }
    /// `-[MTLDevice newComputePipelineStateWithFunction:completionHandler:]
    pub fn newComputePipelineStateWithFunction_completionHandler_(self: *@This(), compute_function: *Function, completion_handler: *ns.Block(fn (?*ComputePipelineState, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newComputePipelineStateWithFunction:completionHandler:", void, .{ compute_function, completion_handler });
    }
    /// `-[MTLDevice newComputePipelineStateWithFunction:options:completionHandler:]
    pub fn newComputePipelineStateWithFunction_options_completionHandler_(self: *@This(), compute_function: *Function, options: PipelineOption, completion_handler: *ns.Block(fn (?*ComputePipelineState, *ComputePipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newComputePipelineStateWithFunction:options:completionHandler:", void, .{ compute_function, options, completion_handler });
    }
    /// `-[MTLDevice newComputePipelineStateWithDescriptor:options:reflection:error:]
    pub fn newComputePipelineStateWithDescriptor_options_reflection_error_(self: *@This(), descriptor: *ComputePipelineDescriptor, options: PipelineOption, reflection: ?*AutoreleasedComputePipelineReflection, err: ?*?*ns.Error) ?*ComputePipelineState {
        return objc.msgSend(self, "newComputePipelineStateWithDescriptor:options:reflection:error:", ?*ComputePipelineState, .{ descriptor, options, reflection, err });
    }
    /// `-[MTLDevice newComputePipelineStateWithDescriptor:options:completionHandler:]
    pub fn newComputePipelineStateWithDescriptor_options_completionHandler_(self: *@This(), descriptor: *ComputePipelineDescriptor, options: PipelineOption, completion_handler: *ns.Block(fn (?*ComputePipelineState, *ComputePipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newComputePipelineStateWithDescriptor:options:completionHandler:", void, .{ descriptor, options, completion_handler });
    }
    /// `-[MTLDevice newFence]
    pub fn newFence(self: *@This()) ?*Fence {
        return objc.msgSend(self, "newFence", ?*Fence, .{});
    }
    /// `-[MTLDevice supportsFeatureSet:]
    pub fn supportsFeatureSet_(self: *@This(), feature_set: FeatureSet) bool {
        return objc.msgSend(self, "supportsFeatureSet:", bool, .{feature_set});
    }
    /// `-[MTLDevice supportsFamily:]
    pub fn supportsFamily_(self: *@This(), gpu_family: GPUFamily) bool {
        return objc.msgSend(self, "supportsFamily:", bool, .{gpu_family});
    }
    /// `-[MTLDevice supportsTextureSampleCount:]
    pub fn supportsTextureSampleCount_(self: *@This(), sample_count: usize) bool {
        return objc.msgSend(self, "supportsTextureSampleCount:", bool, .{sample_count});
    }
    /// `-[MTLDevice minimumLinearTextureAlignmentForPixelFormat:]
    pub fn minimumLinearTextureAlignmentForPixelFormat_(self: *@This(), format: PixelFormat) usize {
        return objc.msgSend(self, "minimumLinearTextureAlignmentForPixelFormat:", usize, .{format});
    }
    /// `-[MTLDevice minimumTextureBufferAlignmentForPixelFormat:]
    pub fn minimumTextureBufferAlignmentForPixelFormat_(self: *@This(), format: PixelFormat) usize {
        return objc.msgSend(self, "minimumTextureBufferAlignmentForPixelFormat:", usize, .{format});
    }
    /// `-[MTLDevice newRenderPipelineStateWithTileDescriptor:options:reflection:error:]
    pub fn newRenderPipelineStateWithTileDescriptor_options_reflection_error_(self: *@This(), descriptor: *TileRenderPipelineDescriptor, options: PipelineOption, reflection: ?*AutoreleasedRenderPipelineReflection, err: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self, "newRenderPipelineStateWithTileDescriptor:options:reflection:error:", ?*RenderPipelineState, .{ descriptor, options, reflection, err });
    }
    /// `-[MTLDevice newRenderPipelineStateWithTileDescriptor:options:completionHandler:]
    pub fn newRenderPipelineStateWithTileDescriptor_options_completionHandler_(self: *@This(), descriptor: *TileRenderPipelineDescriptor, options: PipelineOption, completion_handler: *ns.Block(fn (?*RenderPipelineState, *RenderPipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", void, .{ descriptor, options, completion_handler });
    }
    /// `-[MTLDevice newRenderPipelineStateWithMeshDescriptor:options:reflection:error:]
    pub fn newRenderPipelineStateWithMeshDescriptor_options_reflection_error_(self: *@This(), descriptor: *MeshRenderPipelineDescriptor, options: PipelineOption, reflection: ?*AutoreleasedRenderPipelineReflection, err: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self, "newRenderPipelineStateWithMeshDescriptor:options:reflection:error:", ?*RenderPipelineState, .{ descriptor, options, reflection, err });
    }
    /// `-[MTLDevice newRenderPipelineStateWithMeshDescriptor:options:completionHandler:]
    pub fn newRenderPipelineStateWithMeshDescriptor_options_completionHandler_(self: *@This(), descriptor: *MeshRenderPipelineDescriptor, options: PipelineOption, completion_handler: *ns.Block(fn (?*RenderPipelineState, *RenderPipelineReflection, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:", void, .{ descriptor, options, completion_handler });
    }
    /// `-[MTLDevice getDefaultSamplePositions:count:]
    pub fn getDefaultSamplePositions_count_(self: *@This(), positions: *SamplePosition, count: usize) void {
        return objc.msgSend(self, "getDefaultSamplePositions:count:", void, .{ positions, count });
    }
    /// `-[MTLDevice newArgumentEncoderWithArguments:]
    pub fn newArgumentEncoderWithArguments_(self: *@This(), arguments: *ns.Array(*ArgumentDescriptor)) ?*ArgumentEncoder {
        return objc.msgSend(self, "newArgumentEncoderWithArguments:", ?*ArgumentEncoder, .{arguments});
    }
    /// `-[MTLDevice supportsRasterizationRateMapWithLayerCount:]
    pub fn supportsRasterizationRateMapWithLayerCount_(self: *@This(), layer_count: usize) bool {
        return objc.msgSend(self, "supportsRasterizationRateMapWithLayerCount:", bool, .{layer_count});
    }
    /// `-[MTLDevice newRasterizationRateMapWithDescriptor:]
    pub fn newRasterizationRateMapWithDescriptor_(self: *@This(), descriptor: *RasterizationRateMapDescriptor) ?*RasterizationRateMap {
        return objc.msgSend(self, "newRasterizationRateMapWithDescriptor:", ?*RasterizationRateMap, .{descriptor});
    }
    /// `-[MTLDevice newIndirectCommandBufferWithDescriptor:maxCommandCount:options:]
    pub fn newIndirectCommandBufferWithDescriptor_maxCommandCount_options_(self: *@This(), descriptor: *IndirectCommandBufferDescriptor, max_count: usize, options: ResourceOptions) ?*IndirectCommandBuffer {
        return objc.msgSend(self, "newIndirectCommandBufferWithDescriptor:maxCommandCount:options:", ?*IndirectCommandBuffer, .{ descriptor, max_count, options });
    }
    /// `-[MTLDevice newEvent]
    pub fn newEvent(self: *@This()) ?*Event {
        return objc.msgSend(self, "newEvent", ?*Event, .{});
    }
    /// `-[MTLDevice newSharedEvent]
    pub fn newSharedEvent(self: *@This()) ?*SharedEvent {
        return objc.msgSend(self, "newSharedEvent", ?*SharedEvent, .{});
    }
    /// `-[MTLDevice newSharedEventWithHandle:]
    pub fn newSharedEventWithHandle_(self: *@This(), shared_event_handle: *SharedEventHandle) ?*SharedEvent {
        return objc.msgSend(self, "newSharedEventWithHandle:", ?*SharedEvent, .{shared_event_handle});
    }
    /// `-[MTLDevice newIOHandleWithURL:error:]
    pub fn newIOHandleWithUrl_error_(self: *@This(), url: *ns.Url, err: ?*?*ns.Error) ?*IoFileHandle {
        return objc.msgSend(self, "newIOHandleWithURL:error:", ?*IoFileHandle, .{ url, err });
    }
    /// `-[MTLDevice newIOCommandQueueWithDescriptor:error:]
    pub fn newIOCommandQueueWithDescriptor_error_(self: *@This(), descriptor: *IoCommandQueueDescriptor, err: ?*?*ns.Error) ?*IoCommandQueue {
        return objc.msgSend(self, "newIOCommandQueueWithDescriptor:error:", ?*IoCommandQueue, .{ descriptor, err });
    }
    /// `-[MTLDevice newIOHandleWithURL:compressionMethod:error:]
    pub fn newIOHandleWithUrl_compressionMethod_error_(self: *@This(), url: *ns.Url, compression_method: IoCompressionMethod, err: ?*?*ns.Error) ?*IoFileHandle {
        return objc.msgSend(self, "newIOHandleWithURL:compressionMethod:error:", ?*IoFileHandle, .{ url, compression_method, err });
    }
    /// `-[MTLDevice newIOFileHandleWithURL:error:]
    pub fn newIOFileHandleWithUrl_error_(self: *@This(), url: *ns.Url, err: ?*?*ns.Error) ?*IoFileHandle {
        return objc.msgSend(self, "newIOFileHandleWithURL:error:", ?*IoFileHandle, .{ url, err });
    }
    /// `-[MTLDevice newIOFileHandleWithURL:compressionMethod:error:]
    pub fn newIOFileHandleWithUrl_compressionMethod_error_(self: *@This(), url: *ns.Url, compression_method: IoCompressionMethod, err: ?*?*ns.Error) ?*IoFileHandle {
        return objc.msgSend(self, "newIOFileHandleWithURL:compressionMethod:error:", ?*IoFileHandle, .{ url, compression_method, err });
    }
    /// `-[MTLDevice sparseTileSizeWithTextureType:pixelFormat:sampleCount:]
    pub fn sparseTileSizeWithTextureType_pixelFormat_sampleCount_(self: *@This(), texture_type: TextureType, pixel_format: PixelFormat, sample_count: usize) Size {
        return objc.msgSend(self, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:", Size, .{ texture_type, pixel_format, sample_count });
    }
    /// `-[MTLDevice convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:]
    pub fn convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_(self: *@This(), pixel_regions: *const Region, tile_regions: *Region, tile_size: Size, mode: SparseTextureRegionAlignmentMode, num_regions: usize) void {
        return objc.msgSend(self, "convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:", void, .{ pixel_regions, tile_regions, tile_size, mode, num_regions });
    }
    /// `-[MTLDevice convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:]
    pub fn convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_(self: *@This(), tile_regions: *const Region, pixel_regions: *Region, tile_size: Size, num_regions: usize) void {
        return objc.msgSend(self, "convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:", void, .{ tile_regions, pixel_regions, tile_size, num_regions });
    }
    /// `-[MTLDevice sparseTileSizeInBytesForSparsePageSize:]
    pub fn sparseTileSizeInBytesForSparsePageSize_(self: *@This(), sparse_page_size: SparsePageSize) usize {
        return objc.msgSend(self, "sparseTileSizeInBytesForSparsePageSize:", usize, .{sparse_page_size});
    }
    /// `-[MTLDevice sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:]
    pub fn sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_(self: *@This(), texture_type: TextureType, pixel_format: PixelFormat, sample_count: usize, sparse_page_size: SparsePageSize) Size {
        return objc.msgSend(self, "sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:", Size, .{ texture_type, pixel_format, sample_count, sparse_page_size });
    }
    /// `-[MTLDevice newCounterSampleBufferWithDescriptor:error:]
    pub fn newCounterSampleBufferWithDescriptor_error_(self: *@This(), descriptor: *CounterSampleBufferDescriptor, err: ?*?*ns.Error) ?*CounterSampleBuffer {
        return objc.msgSend(self, "newCounterSampleBufferWithDescriptor:error:", ?*CounterSampleBuffer, .{ descriptor, err });
    }
    /// `-[MTLDevice sampleTimestamps:gpuTimestamp:]
    pub fn sampleTimestamps_gpuTimestamp_(self: *@This(), cpu_timestamp: *Timestamp, gpu_timestamp: *Timestamp) void {
        return objc.msgSend(self, "sampleTimestamps:gpuTimestamp:", void, .{ cpu_timestamp, gpu_timestamp });
    }
    /// `-[MTLDevice newArgumentEncoderWithBufferBinding:]
    pub fn newArgumentEncoderWithBufferBinding_(self: *@This(), buffer_binding: *BufferBinding) *ArgumentEncoder {
        return objc.msgSend(self, "newArgumentEncoderWithBufferBinding:", *ArgumentEncoder, .{buffer_binding});
    }
    /// `-[MTLDevice supportsCounterSampling:]
    pub fn supportsCounterSampling_(self: *@This(), sampling_point: CounterSamplingPoint) bool {
        return objc.msgSend(self, "supportsCounterSampling:", bool, .{sampling_point});
    }
    /// `-[MTLDevice supportsVertexAmplificationCount:]
    pub fn supportsVertexAmplificationCount_(self: *@This(), count: usize) bool {
        return objc.msgSend(self, "supportsVertexAmplificationCount:", bool, .{count});
    }
    /// `-[MTLDevice newDynamicLibrary:error:]
    pub fn newDynamicLibrary_error_(self: *@This(), library: *Library, err: ?*?*ns.Error) ?*DynamicLibrary {
        return objc.msgSend(self, "newDynamicLibrary:error:", ?*DynamicLibrary, .{ library, err });
    }
    /// `-[MTLDevice newDynamicLibraryWithURL:error:]
    pub fn newDynamicLibraryWithUrl_error_(self: *@This(), url: *ns.Url, err: ?*?*ns.Error) ?*DynamicLibrary {
        return objc.msgSend(self, "newDynamicLibraryWithURL:error:", ?*DynamicLibrary, .{ url, err });
    }
    /// `-[MTLDevice newBinaryArchiveWithDescriptor:error:]
    pub fn newBinaryArchiveWithDescriptor_error_(self: *@This(), descriptor: *BinaryArchiveDescriptor, err: ?*?*ns.Error) ?*BinaryArchive {
        return objc.msgSend(self, "newBinaryArchiveWithDescriptor:error:", ?*BinaryArchive, .{ descriptor, err });
    }
    /// `-[MTLDevice accelerationStructureSizesWithDescriptor:]
    pub fn accelerationStructureSizesWithDescriptor_(self: *@This(), descriptor: *AccelerationStructureDescriptor) AccelerationStructureSizes {
        return objc.msgSend(self, "accelerationStructureSizesWithDescriptor:", AccelerationStructureSizes, .{descriptor});
    }
    /// `-[MTLDevice newAccelerationStructureWithSize:]
    pub fn newAccelerationStructureWithSize_(self: *@This(), size: usize) ?*AccelerationStructure {
        return objc.msgSend(self, "newAccelerationStructureWithSize:", ?*AccelerationStructure, .{size});
    }
    /// `-[MTLDevice newAccelerationStructureWithDescriptor:]
    pub fn newAccelerationStructureWithDescriptor_(self: *@This(), descriptor: *AccelerationStructureDescriptor) ?*AccelerationStructure {
        return objc.msgSend(self, "newAccelerationStructureWithDescriptor:", ?*AccelerationStructure, .{descriptor});
    }
    /// `-[MTLDevice heapAccelerationStructureSizeAndAlignWithSize:]
    pub fn heapAccelerationStructureSizeAndAlignWithSize_(self: *@This(), size: usize) SizeAndAlign {
        return objc.msgSend(self, "heapAccelerationStructureSizeAndAlignWithSize:", SizeAndAlign, .{size});
    }
    /// `-[MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:]
    pub fn heapAccelerationStructureSizeAndAlignWithDescriptor_(self: *@This(), descriptor: *AccelerationStructureDescriptor) SizeAndAlign {
        return objc.msgSend(self, "heapAccelerationStructureSizeAndAlignWithDescriptor:", SizeAndAlign, .{descriptor});
    }
    /// `-[MTLDevice name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLDevice registryID]
    pub fn registryID(self: *@This()) u64 {
        return objc.msgSend(self, "registryID", u64, .{});
    }
    /// `-[MTLDevice architecture]
    pub fn architecture(self: *@This()) *Architecture {
        return objc.msgSend(self, "architecture", *Architecture, .{});
    }
    /// `-[MTLDevice maxThreadsPerThreadgroup]
    pub fn maxThreadsPerThreadgroup(self: *@This()) Size {
        return objc.msgSend(self, "maxThreadsPerThreadgroup", Size, .{});
    }
    /// `-[MTLDevice isLowPower]
    pub fn isLowPower(self: *@This()) bool {
        return objc.msgSend(self, "isLowPower", bool, .{});
    }
    /// `-[MTLDevice isHeadless]
    pub fn isHeadless(self: *@This()) bool {
        return objc.msgSend(self, "isHeadless", bool, .{});
    }
    /// `-[MTLDevice isRemovable]
    pub fn isRemovable(self: *@This()) bool {
        return objc.msgSend(self, "isRemovable", bool, .{});
    }
    /// `-[MTLDevice hasUnifiedMemory]
    pub fn hasUnifiedMemory(self: *@This()) bool {
        return objc.msgSend(self, "hasUnifiedMemory", bool, .{});
    }
    /// `-[MTLDevice recommendedMaxWorkingSetSize]
    pub fn recommendedMaxWorkingSetSize(self: *@This()) u64 {
        return objc.msgSend(self, "recommendedMaxWorkingSetSize", u64, .{});
    }
    /// `-[MTLDevice location]
    pub fn location(self: *@This()) DeviceLocation {
        return objc.msgSend(self, "location", DeviceLocation, .{});
    }
    /// `-[MTLDevice locationNumber]
    pub fn locationNumber(self: *@This()) usize {
        return objc.msgSend(self, "locationNumber", usize, .{});
    }
    /// `-[MTLDevice maxTransferRate]
    pub fn maxTransferRate(self: *@This()) u64 {
        return objc.msgSend(self, "maxTransferRate", u64, .{});
    }
    /// `-[MTLDevice isDepth24Stencil8PixelFormatSupported]
    pub fn isDepth24Stencil8PixelFormatSupported(self: *@This()) bool {
        return objc.msgSend(self, "isDepth24Stencil8PixelFormatSupported", bool, .{});
    }
    /// `-[MTLDevice readWriteTextureSupport]
    pub fn readWriteTextureSupport(self: *@This()) ReadWriteTextureTier {
        return objc.msgSend(self, "readWriteTextureSupport", ReadWriteTextureTier, .{});
    }
    /// `-[MTLDevice argumentBuffersSupport]
    pub fn argumentBuffersSupport(self: *@This()) ArgumentBuffersTier {
        return objc.msgSend(self, "argumentBuffersSupport", ArgumentBuffersTier, .{});
    }
    /// `-[MTLDevice areRasterOrderGroupsSupported]
    pub fn areRasterOrderGroupsSupported(self: *@This()) bool {
        return objc.msgSend(self, "areRasterOrderGroupsSupported", bool, .{});
    }
    /// `-[MTLDevice supports32BitFloatFiltering]
    pub fn supports32BitFloatFiltering(self: *@This()) bool {
        return objc.msgSend(self, "supports32BitFloatFiltering", bool, .{});
    }
    /// `-[MTLDevice supports32BitMSAA]
    pub fn supports32BitMSAA(self: *@This()) bool {
        return objc.msgSend(self, "supports32BitMSAA", bool, .{});
    }
    /// `-[MTLDevice supportsQueryTextureLOD]
    pub fn supportsQueryTextureLOD(self: *@This()) bool {
        return objc.msgSend(self, "supportsQueryTextureLOD", bool, .{});
    }
    /// `-[MTLDevice supportsBCTextureCompression]
    pub fn supportsBCTextureCompression(self: *@This()) bool {
        return objc.msgSend(self, "supportsBCTextureCompression", bool, .{});
    }
    /// `-[MTLDevice supportsPullModelInterpolation]
    pub fn supportsPullModelInterpolation(self: *@This()) bool {
        return objc.msgSend(self, "supportsPullModelInterpolation", bool, .{});
    }
    /// `-[MTLDevice areBarycentricCoordsSupported]
    pub fn areBarycentricCoordsSupported(self: *@This()) bool {
        return objc.msgSend(self, "areBarycentricCoordsSupported", bool, .{});
    }
    /// `-[MTLDevice supportsShaderBarycentricCoordinates]
    pub fn supportsShaderBarycentricCoordinates(self: *@This()) bool {
        return objc.msgSend(self, "supportsShaderBarycentricCoordinates", bool, .{});
    }
    /// `-[MTLDevice currentAllocatedSize]
    pub fn currentAllocatedSize(self: *@This()) usize {
        return objc.msgSend(self, "currentAllocatedSize", usize, .{});
    }
    /// `-[MTLDevice maxThreadgroupMemoryLength]
    pub fn maxThreadgroupMemoryLength(self: *@This()) usize {
        return objc.msgSend(self, "maxThreadgroupMemoryLength", usize, .{});
    }
    /// `-[MTLDevice maxArgumentBufferSamplerCount]
    pub fn maxArgumentBufferSamplerCount(self: *@This()) usize {
        return objc.msgSend(self, "maxArgumentBufferSamplerCount", usize, .{});
    }
    /// `-[MTLDevice areProgrammableSamplePositionsSupported]
    pub fn areProgrammableSamplePositionsSupported(self: *@This()) bool {
        return objc.msgSend(self, "areProgrammableSamplePositionsSupported", bool, .{});
    }
    /// `-[MTLDevice peerGroupID]
    pub fn peerGroupID(self: *@This()) u64 {
        return objc.msgSend(self, "peerGroupID", u64, .{});
    }
    /// `-[MTLDevice peerIndex]
    pub fn peerIndex(self: *@This()) u32 {
        return objc.msgSend(self, "peerIndex", u32, .{});
    }
    /// `-[MTLDevice peerCount]
    pub fn peerCount(self: *@This()) u32 {
        return objc.msgSend(self, "peerCount", u32, .{});
    }
    /// `-[MTLDevice sparseTileSizeInBytes]
    pub fn sparseTileSizeInBytes(self: *@This()) usize {
        return objc.msgSend(self, "sparseTileSizeInBytes", usize, .{});
    }
    /// `-[MTLDevice maxBufferLength]
    pub fn maxBufferLength(self: *@This()) usize {
        return objc.msgSend(self, "maxBufferLength", usize, .{});
    }
    /// `-[MTLDevice counterSets]
    pub fn counterSets(self: *@This()) ?*ns.Array(*CounterSet) {
        return objc.msgSend(self, "counterSets", ?*ns.Array(*CounterSet), .{});
    }
    /// `-[MTLDevice supportsDynamicLibraries]
    pub fn supportsDynamicLibraries(self: *@This()) bool {
        return objc.msgSend(self, "supportsDynamicLibraries", bool, .{});
    }
    /// `-[MTLDevice supportsRenderDynamicLibraries]
    pub fn supportsRenderDynamicLibraries(self: *@This()) bool {
        return objc.msgSend(self, "supportsRenderDynamicLibraries", bool, .{});
    }
    /// `-[MTLDevice supportsRaytracing]
    pub fn supportsRaytracing(self: *@This()) bool {
        return objc.msgSend(self, "supportsRaytracing", bool, .{});
    }
    /// `-[MTLDevice supportsFunctionPointers]
    pub fn supportsFunctionPointers(self: *@This()) bool {
        return objc.msgSend(self, "supportsFunctionPointers", bool, .{});
    }
    /// `-[MTLDevice supportsFunctionPointersFromRender]
    pub fn supportsFunctionPointersFromRender(self: *@This()) bool {
        return objc.msgSend(self, "supportsFunctionPointersFromRender", bool, .{});
    }
    /// `-[MTLDevice supportsRaytracingFromRender]
    pub fn supportsRaytracingFromRender(self: *@This()) bool {
        return objc.msgSend(self, "supportsRaytracingFromRender", bool, .{});
    }
    /// `-[MTLDevice supportsPrimitiveMotionBlur]
    pub fn supportsPrimitiveMotionBlur(self: *@This()) bool {
        return objc.msgSend(self, "supportsPrimitiveMotionBlur", bool, .{});
    }
    /// `-[MTLDevice shouldMaximizeConcurrentCompilation]
    pub fn shouldMaximizeConcurrentCompilation(self: *@This()) bool {
        return objc.msgSend(self, "shouldMaximizeConcurrentCompilation", bool, .{});
    }
    /// `-[MTLDevice setShouldMaximizeConcurrentCompilation:]
    pub fn setShouldMaximizeConcurrentCompilation_(self: *@This(), should_maximize_concurrent_compilation: bool) void {
        return objc.msgSend(self, "setShouldMaximizeConcurrentCompilation:", void, .{should_maximize_concurrent_compilation});
    }
    /// `-[MTLDevice maximumConcurrentCompilationTaskCount]
    pub fn maximumConcurrentCompilationTaskCount(self: *@This()) usize {
        return objc.msgSend(self, "maximumConcurrentCompilationTaskCount", usize, .{});
    }
};

/// `MTLDrawable`
pub const Drawable = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLDrawable present]
    pub fn present(self: *@This()) void {
        return objc.msgSend(self, "present", void, .{});
    }
    /// `-[MTLDrawable presentAtTime:]
    pub fn presentAtTime_(self: *@This(), presentation_time: cf.TimeInterval) void {
        return objc.msgSend(self, "presentAtTime:", void, .{presentation_time});
    }
    /// `-[MTLDrawable presentAfterMinimumDuration:]
    pub fn presentAfterMinimumDuration_(self: *@This(), duration: cf.TimeInterval) void {
        return objc.msgSend(self, "presentAfterMinimumDuration:", void, .{duration});
    }
    /// `-[MTLDrawable addPresentedHandler:]
    pub fn addPresentedHandler_(self: *@This(), block: *ns.Block(fn (*Drawable) void)) void {
        return objc.msgSend(self, "addPresentedHandler:", void, .{block});
    }
    /// `-[MTLDrawable presentedTime]
    pub fn presentedTime(self: *@This()) cf.TimeInterval {
        return objc.msgSend(self, "presentedTime", cf.TimeInterval, .{});
    }
    /// `-[MTLDrawable drawableID]
    pub fn drawableID(self: *@This()) usize {
        return objc.msgSend(self, "drawableID", usize, .{});
    }
};

/// `MTLDynamicLibrary`
pub const DynamicLibrary = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLDynamicLibrary serializeToURL:error:]
    pub fn serializeToUrl_error_(self: *@This(), url: *ns.Url, err: ?*?*ns.Error) bool {
        return objc.msgSend(self, "serializeToURL:error:", bool, .{ url, err });
    }
    /// `-[MTLDynamicLibrary label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLDynamicLibrary setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLDynamicLibrary device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLDynamicLibrary installName]
    pub fn installName(self: *@This()) *ns.String {
        return objc.msgSend(self, "installName", *ns.String, .{});
    }
};

/// `MTLEvent`
pub const Event = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLEvent device]
    pub fn device(self: *@This()) ?*Device {
        return objc.msgSend(self, "device", ?*Device, .{});
    }
    /// `-[MTLEvent label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLEvent setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLSharedEventListener`
pub const SharedEventListener = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLSharedEventListener new]`
    pub const new = InternalInfo.new;
    /// `+[MTLSharedEventListener alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLSharedEventListener alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLSharedEventListener initWithDispatchQueue:]
    pub fn initWithDispatchQueue_(self: *@This(), dispatch_queue: *dispatch.Queue) *@This() {
        return objc.msgSend(self, "initWithDispatchQueue:", *@This(), .{dispatch_queue});
    }
    /// `-[MTLSharedEventListener dispatchQueue]
    pub fn dispatchQueue(self: *@This()) *dispatch.Queue {
        return objc.msgSend(self, "dispatchQueue", *dispatch.Queue, .{});
    }
};

/// `MTLSharedEvent`
pub const SharedEvent = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Event);
    const as = InternalInfo.as;
    /// `-[MTLSharedEvent notifyListener:atValue:block:]
    pub fn notifyListener_atValue_block_(self: *@This(), listener: *SharedEventListener, value: u64, block: *ns.Block(fn (*SharedEvent, u64) void)) void {
        return objc.msgSend(self, "notifyListener:atValue:block:", void, .{ listener, value, block });
    }
    /// `-[MTLSharedEvent newSharedEventHandle]
    pub fn newSharedEventHandle(self: *@This()) *SharedEventHandle {
        return objc.msgSend(self, "newSharedEventHandle", *SharedEventHandle, .{});
    }
    /// `-[MTLSharedEvent signaledValue]
    pub fn signaledValue(self: *@This()) u64 {
        return objc.msgSend(self, "signaledValue", u64, .{});
    }
    /// `-[MTLSharedEvent setSignaledValue:]
    pub fn setSignaledValue_(self: *@This(), signaled_value: u64) void {
        return objc.msgSend(self, "setSignaledValue:", void, .{signaled_value});
    }
};

/// `MTLSharedEventHandle`
pub const SharedEventHandle = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.SecureCoding) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLSharedEventHandle new]`
    pub const new = InternalInfo.new;
    /// `+[MTLSharedEventHandle alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLSharedEventHandle alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLSharedEventHandle label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
};

/// `MTLFence`
pub const Fence = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLFence device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLFence label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLFence setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLFunctionConstantValues`
pub const FunctionConstantValues = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLFunctionConstantValues new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionConstantValues alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionConstantValues alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLFunctionConstantValues setConstantValue:type:atIndex:]
    pub fn setConstantValue_type_atIndex_(self: *@This(), value: *const anyopaque, @"type": DataType, index: usize) void {
        return objc.msgSend(self, "setConstantValue:type:atIndex:", void, .{ value, @"type", index });
    }
    /// `-[MTLFunctionConstantValues setConstantValues:type:withRange:]
    pub fn setConstantValues_type_withRange_(self: *@This(), values: *const anyopaque, @"type": DataType, range: ns.Range) void {
        return objc.msgSend(self, "setConstantValues:type:withRange:", void, .{ values, @"type", range });
    }
    /// `-[MTLFunctionConstantValues setConstantValue:type:withName:]
    pub fn setConstantValue_type_withName_(self: *@This(), value: *const anyopaque, @"type": DataType, name: *ns.String) void {
        return objc.msgSend(self, "setConstantValue:type:withName:", void, .{ value, @"type", name });
    }
    /// `-[MTLFunctionConstantValues reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
};

/// `MTLFunctionDescriptor`
pub const FunctionDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLFunctionDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLFunctionDescriptor functionDescriptor]
    pub fn functionDescriptor() *FunctionDescriptor {
        return objc.msgSend(InternalInfo.class(), "functionDescriptor", *FunctionDescriptor, .{});
    }
    /// `-[MTLFunctionDescriptor name]
    pub fn name(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "name", ?*ns.String, .{});
    }
    /// `-[MTLFunctionDescriptor setName:]
    pub fn setName_(self: *@This(), name: ?*ns.String) void {
        return objc.msgSend(self, "setName:", void, .{name});
    }
    /// `-[MTLFunctionDescriptor specializedName]
    pub fn specializedName(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "specializedName", ?*ns.String, .{});
    }
    /// `-[MTLFunctionDescriptor setSpecializedName:]
    pub fn setSpecializedName_(self: *@This(), specialized_name: ?*ns.String) void {
        return objc.msgSend(self, "setSpecializedName:", void, .{specialized_name});
    }
    /// `-[MTLFunctionDescriptor constantValues]
    pub fn constantValues(self: *@This()) ?*FunctionConstantValues {
        return objc.msgSend(self, "constantValues", ?*FunctionConstantValues, .{});
    }
    /// `-[MTLFunctionDescriptor setConstantValues:]
    pub fn setConstantValues_(self: *@This(), constant_values: ?*FunctionConstantValues) void {
        return objc.msgSend(self, "setConstantValues:", void, .{constant_values});
    }
    /// `-[MTLFunctionDescriptor options]
    pub fn options(self: *@This()) FunctionOptions {
        return objc.msgSend(self, "options", FunctionOptions, .{});
    }
    /// `-[MTLFunctionDescriptor setOptions:]
    pub fn setOptions_(self: *@This(), options: FunctionOptions) void {
        return objc.msgSend(self, "setOptions:", void, .{options});
    }
    /// `-[MTLFunctionDescriptor binaryArchives]
    pub fn binaryArchives(self: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    /// `-[MTLFunctionDescriptor setBinaryArchives:]
    pub fn setBinaryArchives_(self: *@This(), binary_archives: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self, "setBinaryArchives:", void, .{binary_archives});
    }
};

/// `MTLIntersectionFunctionDescriptor`
pub const IntersectionFunctionDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), FunctionDescriptor);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLIntersectionFunctionDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLIntersectionFunctionDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLIntersectionFunctionDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
};

/// `MTLFunctionHandle`
pub const FunctionHandle = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLFunctionHandle functionType]
    pub fn functionType(self: *@This()) FunctionType {
        return objc.msgSend(self, "functionType", FunctionType, .{});
    }
    /// `-[MTLFunctionHandle name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLFunctionHandle device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
};

/// `MTLLogContainer`
pub const LogContainer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.FastEnumeration);
    const as = InternalInfo.as;
};

/// `MTLFunctionLogDebugLocation`
pub const FunctionLogDebugLocation = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLFunctionLogDebugLocation functionName]
    pub fn functionName(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "functionName", ?*ns.String, .{});
    }
    /// `-[MTLFunctionLogDebugLocation URL]
    pub fn url(self: *@This()) ?*ns.Url {
        return objc.msgSend(self, "URL", ?*ns.Url, .{});
    }
    /// `-[MTLFunctionLogDebugLocation line]
    pub fn line(self: *@This()) usize {
        return objc.msgSend(self, "line", usize, .{});
    }
    /// `-[MTLFunctionLogDebugLocation column]
    pub fn column(self: *@This()) usize {
        return objc.msgSend(self, "column", usize, .{});
    }
};

/// `MTLFunctionLog`
pub const FunctionLog = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLFunctionLog type]
    pub fn @"type"(self: *@This()) FunctionLogType {
        return objc.msgSend(self, "type", FunctionLogType, .{});
    }
    /// `-[MTLFunctionLog encoderLabel]
    pub fn encoderLabel(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "encoderLabel", ?*ns.String, .{});
    }
    /// `-[MTLFunctionLog function]
    pub fn function(self: *@This()) ?*Function {
        return objc.msgSend(self, "function", ?*Function, .{});
    }
    /// `-[MTLFunctionLog debugLocation]
    pub fn debugLocation(self: *@This()) ?*FunctionLogDebugLocation {
        return objc.msgSend(self, "debugLocation", ?*FunctionLogDebugLocation, .{});
    }
};

/// `MTLFunctionStitchingAttribute`
pub const FunctionStitchingAttribute = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
};

/// `MTLFunctionStitchingAttributeAlwaysInline`
pub const FunctionStitchingAttributeAlwaysInline = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == FunctionStitchingAttribute) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLFunctionStitchingAttributeAlwaysInline new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionStitchingAttributeAlwaysInline alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionStitchingAttributeAlwaysInline alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
};

/// `MTLFunctionStitchingNode`
pub const FunctionStitchingNode = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), objc.Id);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.ObjectProtocol) return @ptrCast(self);
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
};

/// `MTLFunctionStitchingInputNode`
pub const FunctionStitchingInputNode = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == FunctionStitchingNode) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLFunctionStitchingInputNode new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionStitchingInputNode alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionStitchingInputNode alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLFunctionStitchingInputNode initWithArgumentIndex:]
    pub fn initWithArgumentIndex_(self: *@This(), argument: usize) *@This() {
        return objc.msgSend(self, "initWithArgumentIndex:", *@This(), .{argument});
    }
    /// `-[MTLFunctionStitchingInputNode argumentIndex]
    pub fn argumentIndex(self: *@This()) usize {
        return objc.msgSend(self, "argumentIndex", usize, .{});
    }
    /// `-[MTLFunctionStitchingInputNode setArgumentIndex:]
    pub fn setArgumentIndex_(self: *@This(), argument_index: usize) void {
        return objc.msgSend(self, "setArgumentIndex:", void, .{argument_index});
    }
};

/// `MTLFunctionStitchingFunctionNode`
pub const FunctionStitchingFunctionNode = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == FunctionStitchingNode) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLFunctionStitchingFunctionNode new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionStitchingFunctionNode alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionStitchingFunctionNode alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLFunctionStitchingFunctionNode initWithName:arguments:controlDependencies:]
    pub fn initWithName_arguments_controlDependencies_(self: *@This(), name: *ns.String, arguments: *ns.Array(*FunctionStitchingNode), control_dependencies: *ns.Array(*FunctionStitchingFunctionNode)) *@This() {
        return objc.msgSend(self, "initWithName:arguments:controlDependencies:", *@This(), .{ name, arguments, control_dependencies });
    }
    /// `-[MTLFunctionStitchingFunctionNode name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLFunctionStitchingFunctionNode setName:]
    pub fn setName_(self: *@This(), name: *ns.String) void {
        return objc.msgSend(self, "setName:", void, .{name});
    }
    /// `-[MTLFunctionStitchingFunctionNode arguments]
    pub fn arguments(self: *@This()) *ns.Array(*FunctionStitchingNode) {
        return objc.msgSend(self, "arguments", *ns.Array(*FunctionStitchingNode), .{});
    }
    /// `-[MTLFunctionStitchingFunctionNode setArguments:]
    pub fn setArguments_(self: *@This(), arguments: *ns.Array(*FunctionStitchingNode)) void {
        return objc.msgSend(self, "setArguments:", void, .{arguments});
    }
    /// `-[MTLFunctionStitchingFunctionNode controlDependencies]
    pub fn controlDependencies(self: *@This()) *ns.Array(*FunctionStitchingFunctionNode) {
        return objc.msgSend(self, "controlDependencies", *ns.Array(*FunctionStitchingFunctionNode), .{});
    }
    /// `-[MTLFunctionStitchingFunctionNode setControlDependencies:]
    pub fn setControlDependencies_(self: *@This(), control_dependencies: *ns.Array(*FunctionStitchingFunctionNode)) void {
        return objc.msgSend(self, "setControlDependencies:", void, .{control_dependencies});
    }
};

/// `MTLFunctionStitchingGraph`
pub const FunctionStitchingGraph = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLFunctionStitchingGraph new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionStitchingGraph alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionStitchingGraph alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLFunctionStitchingGraph initWithFunctionName:nodes:outputNode:attributes:]
    pub fn initWithFunctionName_nodes_outputNode_attributes_(self: *@This(), function_name: *ns.String, nodes: *ns.Array(*FunctionStitchingFunctionNode), output_node: ?*FunctionStitchingFunctionNode, attributes: *ns.Array(*FunctionStitchingAttribute)) *@This() {
        return objc.msgSend(self, "initWithFunctionName:nodes:outputNode:attributes:", *@This(), .{ function_name, nodes, output_node, attributes });
    }
    /// `-[MTLFunctionStitchingGraph functionName]
    pub fn functionName(self: *@This()) *ns.String {
        return objc.msgSend(self, "functionName", *ns.String, .{});
    }
    /// `-[MTLFunctionStitchingGraph setFunctionName:]
    pub fn setFunctionName_(self: *@This(), function_name: *ns.String) void {
        return objc.msgSend(self, "setFunctionName:", void, .{function_name});
    }
    /// `-[MTLFunctionStitchingGraph nodes]
    pub fn nodes(self: *@This()) *ns.Array(*FunctionStitchingFunctionNode) {
        return objc.msgSend(self, "nodes", *ns.Array(*FunctionStitchingFunctionNode), .{});
    }
    /// `-[MTLFunctionStitchingGraph setNodes:]
    pub fn setNodes_(self: *@This(), nodes: *ns.Array(*FunctionStitchingFunctionNode)) void {
        return objc.msgSend(self, "setNodes:", void, .{nodes});
    }
    /// `-[MTLFunctionStitchingGraph outputNode]
    pub fn outputNode(self: *@This()) ?*FunctionStitchingFunctionNode {
        return objc.msgSend(self, "outputNode", ?*FunctionStitchingFunctionNode, .{});
    }
    /// `-[MTLFunctionStitchingGraph setOutputNode:]
    pub fn setOutputNode_(self: *@This(), output_node: ?*FunctionStitchingFunctionNode) void {
        return objc.msgSend(self, "setOutputNode:", void, .{output_node});
    }
    /// `-[MTLFunctionStitchingGraph attributes]
    pub fn attributes(self: *@This()) *ns.Array(*FunctionStitchingAttribute) {
        return objc.msgSend(self, "attributes", *ns.Array(*FunctionStitchingAttribute), .{});
    }
    /// `-[MTLFunctionStitchingGraph setAttributes:]
    pub fn setAttributes_(self: *@This(), attributes: *ns.Array(*FunctionStitchingAttribute)) void {
        return objc.msgSend(self, "setAttributes:", void, .{attributes});
    }
};

/// `MTLStitchedLibraryDescriptor`
pub const StitchedLibraryDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLStitchedLibraryDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLStitchedLibraryDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLStitchedLibraryDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLStitchedLibraryDescriptor functionGraphs]
    pub fn functionGraphs(self: *@This()) *ns.Array(*FunctionStitchingGraph) {
        return objc.msgSend(self, "functionGraphs", *ns.Array(*FunctionStitchingGraph), .{});
    }
    /// `-[MTLStitchedLibraryDescriptor setFunctionGraphs:]
    pub fn setFunctionGraphs_(self: *@This(), function_graphs: *ns.Array(*FunctionStitchingGraph)) void {
        return objc.msgSend(self, "setFunctionGraphs:", void, .{function_graphs});
    }
    /// `-[MTLStitchedLibraryDescriptor functions]
    pub fn functions(self: *@This()) *ns.Array(*Function) {
        return objc.msgSend(self, "functions", *ns.Array(*Function), .{});
    }
    /// `-[MTLStitchedLibraryDescriptor setFunctions:]
    pub fn setFunctions_(self: *@This(), functions: *ns.Array(*Function)) void {
        return objc.msgSend(self, "setFunctions:", void, .{functions});
    }
};

/// `MTLHeapDescriptor`
pub const HeapDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLHeapDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLHeapDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLHeapDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLHeapDescriptor size]
    pub fn size(self: *@This()) usize {
        return objc.msgSend(self, "size", usize, .{});
    }
    /// `-[MTLHeapDescriptor setSize:]
    pub fn setSize_(self: *@This(), size: usize) void {
        return objc.msgSend(self, "setSize:", void, .{size});
    }
    /// `-[MTLHeapDescriptor storageMode]
    pub fn storageMode(self: *@This()) StorageMode {
        return objc.msgSend(self, "storageMode", StorageMode, .{});
    }
    /// `-[MTLHeapDescriptor setStorageMode:]
    pub fn setStorageMode_(self: *@This(), storage_mode: StorageMode) void {
        return objc.msgSend(self, "setStorageMode:", void, .{storage_mode});
    }
    /// `-[MTLHeapDescriptor cpuCacheMode]
    pub fn cpuCacheMode(self: *@This()) CpuCacheMode {
        return objc.msgSend(self, "cpuCacheMode", CpuCacheMode, .{});
    }
    /// `-[MTLHeapDescriptor setCpuCacheMode:]
    pub fn setCpuCacheMode_(self: *@This(), cpu_cache_mode: CpuCacheMode) void {
        return objc.msgSend(self, "setCpuCacheMode:", void, .{cpu_cache_mode});
    }
    /// `-[MTLHeapDescriptor sparsePageSize]
    pub fn sparsePageSize(self: *@This()) SparsePageSize {
        return objc.msgSend(self, "sparsePageSize", SparsePageSize, .{});
    }
    /// `-[MTLHeapDescriptor setSparsePageSize:]
    pub fn setSparsePageSize_(self: *@This(), sparse_page_size: SparsePageSize) void {
        return objc.msgSend(self, "setSparsePageSize:", void, .{sparse_page_size});
    }
    /// `-[MTLHeapDescriptor hazardTrackingMode]
    pub fn hazardTrackingMode(self: *@This()) HazardTrackingMode {
        return objc.msgSend(self, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    /// `-[MTLHeapDescriptor setHazardTrackingMode:]
    pub fn setHazardTrackingMode_(self: *@This(), hazard_tracking_mode: HazardTrackingMode) void {
        return objc.msgSend(self, "setHazardTrackingMode:", void, .{hazard_tracking_mode});
    }
    /// `-[MTLHeapDescriptor resourceOptions]
    pub fn resourceOptions(self: *@This()) ResourceOptions {
        return objc.msgSend(self, "resourceOptions", ResourceOptions, .{});
    }
    /// `-[MTLHeapDescriptor setResourceOptions:]
    pub fn setResourceOptions_(self: *@This(), resource_options: ResourceOptions) void {
        return objc.msgSend(self, "setResourceOptions:", void, .{resource_options});
    }
    /// `-[MTLHeapDescriptor type]
    pub fn @"type"(self: *@This()) HeapType {
        return objc.msgSend(self, "type", HeapType, .{});
    }
    /// `-[MTLHeapDescriptor setType:]
    pub fn setType_(self: *@This(), @"type": HeapType) void {
        return objc.msgSend(self, "setType:", void, .{@"type"});
    }
};

/// `MTLHeap`
pub const Heap = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLHeap maxAvailableSizeWithAlignment:]
    pub fn maxAvailableSizeWithAlignment_(self: *@This(), alignment: usize) usize {
        return objc.msgSend(self, "maxAvailableSizeWithAlignment:", usize, .{alignment});
    }
    /// `-[MTLHeap newBufferWithLength:options:]
    pub fn newBufferWithLength_options_(self: *@This(), length: usize, options: ResourceOptions) ?*Buffer {
        return objc.msgSend(self, "newBufferWithLength:options:", ?*Buffer, .{ length, options });
    }
    /// `-[MTLHeap newTextureWithDescriptor:]
    pub fn newTextureWithDescriptor_(self: *@This(), descriptor: *TextureDescriptor) ?*Texture {
        return objc.msgSend(self, "newTextureWithDescriptor:", ?*Texture, .{descriptor});
    }
    /// `-[MTLHeap setPurgeableState:]
    pub fn setPurgeableState_(self: *@This(), state: PurgeableState) PurgeableState {
        return objc.msgSend(self, "setPurgeableState:", PurgeableState, .{state});
    }
    /// `-[MTLHeap newBufferWithLength:options:offset:]
    pub fn newBufferWithLength_options_offset_(self: *@This(), length: usize, options: ResourceOptions, offset: usize) ?*Buffer {
        return objc.msgSend(self, "newBufferWithLength:options:offset:", ?*Buffer, .{ length, options, offset });
    }
    /// `-[MTLHeap newTextureWithDescriptor:offset:]
    pub fn newTextureWithDescriptor_offset_(self: *@This(), descriptor: *TextureDescriptor, offset: usize) ?*Texture {
        return objc.msgSend(self, "newTextureWithDescriptor:offset:", ?*Texture, .{ descriptor, offset });
    }
    /// `-[MTLHeap newAccelerationStructureWithSize:]
    pub fn newAccelerationStructureWithSize_(self: *@This(), size: usize) ?*AccelerationStructure {
        return objc.msgSend(self, "newAccelerationStructureWithSize:", ?*AccelerationStructure, .{size});
    }
    /// `-[MTLHeap newAccelerationStructureWithDescriptor:]
    pub fn newAccelerationStructureWithDescriptor_(self: *@This(), descriptor: *AccelerationStructureDescriptor) ?*AccelerationStructure {
        return objc.msgSend(self, "newAccelerationStructureWithDescriptor:", ?*AccelerationStructure, .{descriptor});
    }
    /// `-[MTLHeap newAccelerationStructureWithSize:offset:]
    pub fn newAccelerationStructureWithSize_offset_(self: *@This(), size: usize, offset: usize) ?*AccelerationStructure {
        return objc.msgSend(self, "newAccelerationStructureWithSize:offset:", ?*AccelerationStructure, .{ size, offset });
    }
    /// `-[MTLHeap newAccelerationStructureWithDescriptor:offset:]
    pub fn newAccelerationStructureWithDescriptor_offset_(self: *@This(), descriptor: *AccelerationStructureDescriptor, offset: usize) ?*AccelerationStructure {
        return objc.msgSend(self, "newAccelerationStructureWithDescriptor:offset:", ?*AccelerationStructure, .{ descriptor, offset });
    }
    /// `-[MTLHeap label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLHeap setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLHeap device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLHeap storageMode]
    pub fn storageMode(self: *@This()) StorageMode {
        return objc.msgSend(self, "storageMode", StorageMode, .{});
    }
    /// `-[MTLHeap cpuCacheMode]
    pub fn cpuCacheMode(self: *@This()) CpuCacheMode {
        return objc.msgSend(self, "cpuCacheMode", CpuCacheMode, .{});
    }
    /// `-[MTLHeap hazardTrackingMode]
    pub fn hazardTrackingMode(self: *@This()) HazardTrackingMode {
        return objc.msgSend(self, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    /// `-[MTLHeap resourceOptions]
    pub fn resourceOptions(self: *@This()) ResourceOptions {
        return objc.msgSend(self, "resourceOptions", ResourceOptions, .{});
    }
    /// `-[MTLHeap size]
    pub fn size(self: *@This()) usize {
        return objc.msgSend(self, "size", usize, .{});
    }
    /// `-[MTLHeap usedSize]
    pub fn usedSize(self: *@This()) usize {
        return objc.msgSend(self, "usedSize", usize, .{});
    }
    /// `-[MTLHeap currentAllocatedSize]
    pub fn currentAllocatedSize(self: *@This()) usize {
        return objc.msgSend(self, "currentAllocatedSize", usize, .{});
    }
    /// `-[MTLHeap type]
    pub fn @"type"(self: *@This()) HeapType {
        return objc.msgSend(self, "type", HeapType, .{});
    }
};

/// `MTLIndirectCommandBufferDescriptor`
pub const IndirectCommandBufferDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLIndirectCommandBufferDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLIndirectCommandBufferDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLIndirectCommandBufferDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLIndirectCommandBufferDescriptor commandTypes]
    pub fn commandTypes(self: *@This()) IndirectCommandType {
        return objc.msgSend(self, "commandTypes", IndirectCommandType, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setCommandTypes:]
    pub fn setCommandTypes_(self: *@This(), command_types: IndirectCommandType) void {
        return objc.msgSend(self, "setCommandTypes:", void, .{command_types});
    }
    /// `-[MTLIndirectCommandBufferDescriptor inheritPipelineState]
    pub fn inheritPipelineState(self: *@This()) bool {
        return objc.msgSend(self, "inheritPipelineState", bool, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setInheritPipelineState:]
    pub fn setInheritPipelineState_(self: *@This(), inherit_pipeline_state: bool) void {
        return objc.msgSend(self, "setInheritPipelineState:", void, .{inherit_pipeline_state});
    }
    /// `-[MTLIndirectCommandBufferDescriptor inheritBuffers]
    pub fn inheritBuffers(self: *@This()) bool {
        return objc.msgSend(self, "inheritBuffers", bool, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setInheritBuffers:]
    pub fn setInheritBuffers_(self: *@This(), inherit_buffers: bool) void {
        return objc.msgSend(self, "setInheritBuffers:", void, .{inherit_buffers});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxVertexBufferBindCount]
    pub fn maxVertexBufferBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxVertexBufferBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxVertexBufferBindCount:]
    pub fn setMaxVertexBufferBindCount_(self: *@This(), max_vertex_buffer_bind_count: usize) void {
        return objc.msgSend(self, "setMaxVertexBufferBindCount:", void, .{max_vertex_buffer_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxFragmentBufferBindCount]
    pub fn maxFragmentBufferBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxFragmentBufferBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxFragmentBufferBindCount:]
    pub fn setMaxFragmentBufferBindCount_(self: *@This(), max_fragment_buffer_bind_count: usize) void {
        return objc.msgSend(self, "setMaxFragmentBufferBindCount:", void, .{max_fragment_buffer_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxKernelBufferBindCount]
    pub fn maxKernelBufferBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxKernelBufferBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxKernelBufferBindCount:]
    pub fn setMaxKernelBufferBindCount_(self: *@This(), max_kernel_buffer_bind_count: usize) void {
        return objc.msgSend(self, "setMaxKernelBufferBindCount:", void, .{max_kernel_buffer_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxKernelThreadgroupMemoryBindCount]
    pub fn maxKernelThreadgroupMemoryBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxKernelThreadgroupMemoryBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxKernelThreadgroupMemoryBindCount:]
    pub fn setMaxKernelThreadgroupMemoryBindCount_(self: *@This(), max_kernel_threadgroup_memory_bind_count: usize) void {
        return objc.msgSend(self, "setMaxKernelThreadgroupMemoryBindCount:", void, .{max_kernel_threadgroup_memory_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxObjectBufferBindCount]
    pub fn maxObjectBufferBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxObjectBufferBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxObjectBufferBindCount:]
    pub fn setMaxObjectBufferBindCount_(self: *@This(), max_object_buffer_bind_count: usize) void {
        return objc.msgSend(self, "setMaxObjectBufferBindCount:", void, .{max_object_buffer_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxMeshBufferBindCount]
    pub fn maxMeshBufferBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxMeshBufferBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxMeshBufferBindCount:]
    pub fn setMaxMeshBufferBindCount_(self: *@This(), max_mesh_buffer_bind_count: usize) void {
        return objc.msgSend(self, "setMaxMeshBufferBindCount:", void, .{max_mesh_buffer_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor maxObjectThreadgroupMemoryBindCount]
    pub fn maxObjectThreadgroupMemoryBindCount(self: *@This()) usize {
        return objc.msgSend(self, "maxObjectThreadgroupMemoryBindCount", usize, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setMaxObjectThreadgroupMemoryBindCount:]
    pub fn setMaxObjectThreadgroupMemoryBindCount_(self: *@This(), max_object_threadgroup_memory_bind_count: usize) void {
        return objc.msgSend(self, "setMaxObjectThreadgroupMemoryBindCount:", void, .{max_object_threadgroup_memory_bind_count});
    }
    /// `-[MTLIndirectCommandBufferDescriptor supportRayTracing]
    pub fn supportRayTracing(self: *@This()) bool {
        return objc.msgSend(self, "supportRayTracing", bool, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setSupportRayTracing:]
    pub fn setSupportRayTracing_(self: *@This(), support_ray_tracing: bool) void {
        return objc.msgSend(self, "setSupportRayTracing:", void, .{support_ray_tracing});
    }
    /// `-[MTLIndirectCommandBufferDescriptor supportDynamicAttributeStride]
    pub fn supportDynamicAttributeStride(self: *@This()) bool {
        return objc.msgSend(self, "supportDynamicAttributeStride", bool, .{});
    }
    /// `-[MTLIndirectCommandBufferDescriptor setSupportDynamicAttributeStride:]
    pub fn setSupportDynamicAttributeStride_(self: *@This(), support_dynamic_attribute_stride: bool) void {
        return objc.msgSend(self, "setSupportDynamicAttributeStride:", void, .{support_dynamic_attribute_stride});
    }
};

/// `MTLIndirectCommandBuffer`
pub const IndirectCommandBuffer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Resource);
    const as = InternalInfo.as;
    /// `-[MTLIndirectCommandBuffer resetWithRange:]
    pub fn resetWithRange_(self: *@This(), range: ns.Range) void {
        return objc.msgSend(self, "resetWithRange:", void, .{range});
    }
    /// `-[MTLIndirectCommandBuffer indirectRenderCommandAtIndex:]
    pub fn indirectRenderCommandAtIndex_(self: *@This(), command_index: usize) *IndirectRenderCommand {
        return objc.msgSend(self, "indirectRenderCommandAtIndex:", *IndirectRenderCommand, .{command_index});
    }
    /// `-[MTLIndirectCommandBuffer indirectComputeCommandAtIndex:]
    pub fn indirectComputeCommandAtIndex_(self: *@This(), command_index: usize) *IndirectComputeCommand {
        return objc.msgSend(self, "indirectComputeCommandAtIndex:", *IndirectComputeCommand, .{command_index});
    }
    /// `-[MTLIndirectCommandBuffer size]
    pub fn size(self: *@This()) usize {
        return objc.msgSend(self, "size", usize, .{});
    }
    /// `-[MTLIndirectCommandBuffer gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};

/// `MTLIndirectRenderCommand`
pub const IndirectRenderCommand = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIndirectRenderCommand setRenderPipelineState:]
    pub fn setRenderPipelineState_(self: *@This(), pipeline_state: *RenderPipelineState) void {
        return objc.msgSend(self, "setRenderPipelineState:", void, .{pipeline_state});
    }
    /// `-[MTLIndirectRenderCommand setVertexBuffer:offset:atIndex:]
    pub fn setVertexBuffer_offset_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLIndirectRenderCommand setFragmentBuffer:offset:atIndex:]
    pub fn setFragmentBuffer_offset_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setFragmentBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLIndirectRenderCommand setVertexBuffer:offset:attributeStride:atIndex:]
    pub fn setVertexBuffer_offset_attributeStride_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBuffer:offset:attributeStride:atIndex:", void, .{ buffer, offset, stride, index });
    }
    /// `-[MTLIndirectRenderCommand drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:]
    pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_(self: *@This(), number_of_patch_control_points: usize, patch_start: usize, patch_count: usize, patch_index_buffer: ?*Buffer, patch_index_buffer_offset: usize, instance_count: usize, base_instance: usize, buffer: *Buffer, offset: usize, instance_stride: usize) void {
        return objc.msgSend(self, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", void, .{ number_of_patch_control_points, patch_start, patch_count, patch_index_buffer, patch_index_buffer_offset, instance_count, base_instance, buffer, offset, instance_stride });
    }
    /// `-[MTLIndirectRenderCommand drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:]
    pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_(self: *@This(), number_of_patch_control_points: usize, patch_start: usize, patch_count: usize, patch_index_buffer: ?*Buffer, patch_index_buffer_offset: usize, control_point_index_buffer: *Buffer, control_point_index_buffer_offset: usize, instance_count: usize, base_instance: usize, buffer: *Buffer, offset: usize, instance_stride: usize) void {
        return objc.msgSend(self, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:", void, .{ number_of_patch_control_points, patch_start, patch_count, patch_index_buffer, patch_index_buffer_offset, control_point_index_buffer, control_point_index_buffer_offset, instance_count, base_instance, buffer, offset, instance_stride });
    }
    /// `-[MTLIndirectRenderCommand drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:]
    pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_(self: *@This(), primitive_type: PrimitiveType, vertex_start: usize, vertex_count: usize, instance_count: usize, base_instance: usize) void {
        return objc.msgSend(self, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", void, .{ primitive_type, vertex_start, vertex_count, instance_count, base_instance });
    }
    /// `-[MTLIndirectRenderCommand drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:]
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_(self: *@This(), primitive_type: PrimitiveType, index_count: usize, index_type: IndexType, index_buffer: *Buffer, index_buffer_offset: usize, instance_count: usize, base_vertex: isize, base_instance: usize) void {
        return objc.msgSend(self, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", void, .{ primitive_type, index_count, index_type, index_buffer, index_buffer_offset, instance_count, base_vertex, base_instance });
    }
    /// `-[MTLIndirectRenderCommand setObjectThreadgroupMemoryLength:atIndex:]
    pub fn setObjectThreadgroupMemoryLength_atIndex_(self: *@This(), length: usize, index: usize) void {
        return objc.msgSend(self, "setObjectThreadgroupMemoryLength:atIndex:", void, .{ length, index });
    }
    /// `-[MTLIndirectRenderCommand setObjectBuffer:offset:atIndex:]
    pub fn setObjectBuffer_offset_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setObjectBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLIndirectRenderCommand setMeshBuffer:offset:atIndex:]
    pub fn setMeshBuffer_offset_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setMeshBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLIndirectRenderCommand drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]
    pub fn drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(self: *@This(), threadgroups_per_grid: Size, threads_per_object_threadgroup: Size, threads_per_mesh_threadgroup: Size) void {
        return objc.msgSend(self, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threadgroups_per_grid, threads_per_object_threadgroup, threads_per_mesh_threadgroup });
    }
    /// `-[MTLIndirectRenderCommand drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]
    pub fn drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(self: *@This(), threads_per_grid: Size, threads_per_object_threadgroup: Size, threads_per_mesh_threadgroup: Size) void {
        return objc.msgSend(self, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threads_per_grid, threads_per_object_threadgroup, threads_per_mesh_threadgroup });
    }
    /// `-[MTLIndirectRenderCommand setBarrier]
    pub fn setBarrier(self: *@This()) void {
        return objc.msgSend(self, "setBarrier", void, .{});
    }
    /// `-[MTLIndirectRenderCommand clearBarrier]
    pub fn clearBarrier(self: *@This()) void {
        return objc.msgSend(self, "clearBarrier", void, .{});
    }
    /// `-[MTLIndirectRenderCommand reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
};

/// `MTLIndirectComputeCommand`
pub const IndirectComputeCommand = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIndirectComputeCommand setComputePipelineState:]
    pub fn setComputePipelineState_(self: *@This(), pipeline_state: *ComputePipelineState) void {
        return objc.msgSend(self, "setComputePipelineState:", void, .{pipeline_state});
    }
    /// `-[MTLIndirectComputeCommand setKernelBuffer:offset:atIndex:]
    pub fn setKernelBuffer_offset_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setKernelBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLIndirectComputeCommand setKernelBuffer:offset:attributeStride:atIndex:]
    pub fn setKernelBuffer_offset_attributeStride_atIndex_(self: *@This(), buffer: *Buffer, offset: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setKernelBuffer:offset:attributeStride:atIndex:", void, .{ buffer, offset, stride, index });
    }
    /// `-[MTLIndirectComputeCommand concurrentDispatchThreadgroups:threadsPerThreadgroup:]
    pub fn concurrentDispatchThreadgroups_threadsPerThreadgroup_(self: *@This(), threadgroups_per_grid: Size, threads_per_threadgroup: Size) void {
        return objc.msgSend(self, "concurrentDispatchThreadgroups:threadsPerThreadgroup:", void, .{ threadgroups_per_grid, threads_per_threadgroup });
    }
    /// `-[MTLIndirectComputeCommand concurrentDispatchThreads:threadsPerThreadgroup:]
    pub fn concurrentDispatchThreads_threadsPerThreadgroup_(self: *@This(), threads_per_grid: Size, threads_per_threadgroup: Size) void {
        return objc.msgSend(self, "concurrentDispatchThreads:threadsPerThreadgroup:", void, .{ threads_per_grid, threads_per_threadgroup });
    }
    /// `-[MTLIndirectComputeCommand setBarrier]
    pub fn setBarrier(self: *@This()) void {
        return objc.msgSend(self, "setBarrier", void, .{});
    }
    /// `-[MTLIndirectComputeCommand clearBarrier]
    pub fn clearBarrier(self: *@This()) void {
        return objc.msgSend(self, "clearBarrier", void, .{});
    }
    /// `-[MTLIndirectComputeCommand setImageblockWidth:height:]
    pub fn setImageblockWidth_height_(self: *@This(), width: usize, height: usize) void {
        return objc.msgSend(self, "setImageblockWidth:height:", void, .{ width, height });
    }
    /// `-[MTLIndirectComputeCommand reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLIndirectComputeCommand setThreadgroupMemoryLength:atIndex:]
    pub fn setThreadgroupMemoryLength_atIndex_(self: *@This(), length: usize, index: usize) void {
        return objc.msgSend(self, "setThreadgroupMemoryLength:atIndex:", void, .{ length, index });
    }
    /// `-[MTLIndirectComputeCommand setStageInRegion:]
    pub fn setStageInRegion_(self: *@This(), region: Region) void {
        return objc.msgSend(self, "setStageInRegion:", void, .{region});
    }
};

/// `MTLIntersectionFunctionTableDescriptor`
pub const IntersectionFunctionTableDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLIntersectionFunctionTableDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLIntersectionFunctionTableDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLIntersectionFunctionTableDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLIntersectionFunctionTableDescriptor intersectionFunctionTableDescriptor]
    pub fn intersectionFunctionTableDescriptor() *IntersectionFunctionTableDescriptor {
        return objc.msgSend(InternalInfo.class(), "intersectionFunctionTableDescriptor", *IntersectionFunctionTableDescriptor, .{});
    }
    /// `-[MTLIntersectionFunctionTableDescriptor functionCount]
    pub fn functionCount(self: *@This()) usize {
        return objc.msgSend(self, "functionCount", usize, .{});
    }
    /// `-[MTLIntersectionFunctionTableDescriptor setFunctionCount:]
    pub fn setFunctionCount_(self: *@This(), function_count: usize) void {
        return objc.msgSend(self, "setFunctionCount:", void, .{function_count});
    }
};

/// `MTLIntersectionFunctionTable`
pub const IntersectionFunctionTable = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Resource);
    const as = InternalInfo.as;
    /// `-[MTLIntersectionFunctionTable setBuffer:offset:atIndex:]
    pub fn setBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLIntersectionFunctionTable setBuffers:offsets:withRange:]
    pub fn setBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLIntersectionFunctionTable setFunction:atIndex:]
    pub fn setFunction_atIndex_(self: *@This(), function: ?*FunctionHandle, index: usize) void {
        return objc.msgSend(self, "setFunction:atIndex:", void, .{ function, index });
    }
    /// `-[MTLIntersectionFunctionTable setFunctions:withRange:]
    pub fn setFunctions_withRange_(self: *@This(), functions: [*]?*const FunctionHandle, range: ns.Range) void {
        return objc.msgSend(self, "setFunctions:withRange:", void, .{ functions, range });
    }
    /// `-[MTLIntersectionFunctionTable setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:]
    pub fn setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_(self: *@This(), signature: IntersectionFunctionSignature, index: usize) void {
        return objc.msgSend(self, "setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:", void, .{ signature, index });
    }
    /// `-[MTLIntersectionFunctionTable setOpaqueTriangleIntersectionFunctionWithSignature:withRange:]
    pub fn setOpaqueTriangleIntersectionFunctionWithSignature_withRange_(self: *@This(), signature: IntersectionFunctionSignature, range: ns.Range) void {
        return objc.msgSend(self, "setOpaqueTriangleIntersectionFunctionWithSignature:withRange:", void, .{ signature, range });
    }
    /// `-[MTLIntersectionFunctionTable setOpaqueCurveIntersectionFunctionWithSignature:atIndex:]
    pub fn setOpaqueCurveIntersectionFunctionWithSignature_atIndex_(self: *@This(), signature: IntersectionFunctionSignature, index: usize) void {
        return objc.msgSend(self, "setOpaqueCurveIntersectionFunctionWithSignature:atIndex:", void, .{ signature, index });
    }
    /// `-[MTLIntersectionFunctionTable setOpaqueCurveIntersectionFunctionWithSignature:withRange:]
    pub fn setOpaqueCurveIntersectionFunctionWithSignature_withRange_(self: *@This(), signature: IntersectionFunctionSignature, range: ns.Range) void {
        return objc.msgSend(self, "setOpaqueCurveIntersectionFunctionWithSignature:withRange:", void, .{ signature, range });
    }
    /// `-[MTLIntersectionFunctionTable setVisibleFunctionTable:atBufferIndex:]
    pub fn setVisibleFunctionTable_atBufferIndex_(self: *@This(), function_table: ?*VisibleFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setVisibleFunctionTable:atBufferIndex:", void, .{ function_table, buffer_index });
    }
    /// `-[MTLIntersectionFunctionTable setVisibleFunctionTables:withBufferRange:]
    pub fn setVisibleFunctionTables_withBufferRange_(self: *@This(), function_tables: [*]?*const VisibleFunctionTable, buffer_range: ns.Range) void {
        return objc.msgSend(self, "setVisibleFunctionTables:withBufferRange:", void, .{ function_tables, buffer_range });
    }
    /// `-[MTLIntersectionFunctionTable gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};

/// `MTLIOCommandBuffer`
pub const IoCommandBuffer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIOCommandBuffer addCompletedHandler:]
    pub fn addCompletedHandler_(self: *@This(), block: *ns.Block(fn (*IoCommandBuffer) void)) void {
        return objc.msgSend(self, "addCompletedHandler:", void, .{block});
    }
    /// `-[MTLIOCommandBuffer loadBytes:size:sourceHandle:sourceHandleOffset:]
    pub fn loadBytes_size_sourceHandle_sourceHandleOffset_(self: *@This(), pointer: *anyopaque, size: usize, source_handle: *IoFileHandle, source_handle_offset: usize) void {
        return objc.msgSend(self, "loadBytes:size:sourceHandle:sourceHandleOffset:", void, .{ pointer, size, source_handle, source_handle_offset });
    }
    /// `-[MTLIOCommandBuffer loadBuffer:offset:size:sourceHandle:sourceHandleOffset:]
    pub fn loadBuffer_offset_size_sourceHandle_sourceHandleOffset_(self: *@This(), buffer: *Buffer, offset: usize, size: usize, source_handle: *IoFileHandle, source_handle_offset: usize) void {
        return objc.msgSend(self, "loadBuffer:offset:size:sourceHandle:sourceHandleOffset:", void, .{ buffer, offset, size, source_handle, source_handle_offset });
    }
    /// `-[MTLIOCommandBuffer loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:]
    pub fn loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_(self: *@This(), texture: *Texture, slice: usize, level: usize, size: Size, source_bytes_per_row: usize, source_bytes_per_image: usize, destination_origin: Origin, source_handle: *IoFileHandle, source_handle_offset: usize) void {
        return objc.msgSend(self, "loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:", void, .{ texture, slice, level, size, source_bytes_per_row, source_bytes_per_image, destination_origin, source_handle, source_handle_offset });
    }
    /// `-[MTLIOCommandBuffer copyStatusToBuffer:offset:]
    pub fn copyStatusToBuffer_offset_(self: *@This(), buffer: *Buffer, offset: usize) void {
        return objc.msgSend(self, "copyStatusToBuffer:offset:", void, .{ buffer, offset });
    }
    /// `-[MTLIOCommandBuffer commit]
    pub fn commit(self: *@This()) void {
        return objc.msgSend(self, "commit", void, .{});
    }
    /// `-[MTLIOCommandBuffer waitUntilCompleted]
    pub fn waitUntilCompleted(self: *@This()) void {
        return objc.msgSend(self, "waitUntilCompleted", void, .{});
    }
    /// `-[MTLIOCommandBuffer tryCancel]
    pub fn tryCancel(self: *@This()) void {
        return objc.msgSend(self, "tryCancel", void, .{});
    }
    /// `-[MTLIOCommandBuffer addBarrier]
    pub fn addBarrier(self: *@This()) void {
        return objc.msgSend(self, "addBarrier", void, .{});
    }
    /// `-[MTLIOCommandBuffer pushDebugGroup:]
    pub fn pushDebugGroup_(self: *@This(), string: *ns.String) void {
        return objc.msgSend(self, "pushDebugGroup:", void, .{string});
    }
    /// `-[MTLIOCommandBuffer popDebugGroup]
    pub fn popDebugGroup(self: *@This()) void {
        return objc.msgSend(self, "popDebugGroup", void, .{});
    }
    /// `-[MTLIOCommandBuffer enqueue]
    pub fn enqueue(self: *@This()) void {
        return objc.msgSend(self, "enqueue", void, .{});
    }
    /// `-[MTLIOCommandBuffer waitForEvent:value:]
    pub fn waitForEvent_value_(self: *@This(), event: *SharedEvent, value: u64) void {
        return objc.msgSend(self, "waitForEvent:value:", void, .{ event, value });
    }
    /// `-[MTLIOCommandBuffer signalEvent:value:]
    pub fn signalEvent_value_(self: *@This(), event: *SharedEvent, value: u64) void {
        return objc.msgSend(self, "signalEvent:value:", void, .{ event, value });
    }
    /// `-[MTLIOCommandBuffer label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLIOCommandBuffer setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLIOCommandBuffer status]
    pub fn status(self: *@This()) IoStatus {
        return objc.msgSend(self, "status", IoStatus, .{});
    }
    /// `-[MTLIOCommandBuffer error]
    pub fn @"error"(self: *@This()) ?*ns.Error {
        return objc.msgSend(self, "error", ?*ns.Error, .{});
    }
};

/// `MTLIOCommandQueue`
pub const IoCommandQueue = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIOCommandQueue enqueueBarrier]
    pub fn enqueueBarrier(self: *@This()) void {
        return objc.msgSend(self, "enqueueBarrier", void, .{});
    }
    /// `-[MTLIOCommandQueue commandBuffer]
    pub fn commandBuffer(self: *@This()) *IoCommandBuffer {
        return objc.msgSend(self, "commandBuffer", *IoCommandBuffer, .{});
    }
    /// `-[MTLIOCommandQueue commandBufferWithUnretainedReferences]
    pub fn commandBufferWithUnretainedReferences(self: *@This()) *IoCommandBuffer {
        return objc.msgSend(self, "commandBufferWithUnretainedReferences", *IoCommandBuffer, .{});
    }
    /// `-[MTLIOCommandQueue label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLIOCommandQueue setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLIOScratchBuffer`
pub const IoScratchBuffer = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIOScratchBuffer buffer]
    pub fn buffer(self: *@This()) *Buffer {
        return objc.msgSend(self, "buffer", *Buffer, .{});
    }
};

/// `MTLIOScratchBufferAllocator`
pub const IoScratchBufferAllocator = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIOScratchBufferAllocator newScratchBufferWithMinimumSize:]
    pub fn newScratchBufferWithMinimumSize_(self: *@This(), minimum_size: usize) ?*IoScratchBuffer {
        return objc.msgSend(self, "newScratchBufferWithMinimumSize:", ?*IoScratchBuffer, .{minimum_size});
    }
};

/// `MTLIOCommandQueueDescriptor`
pub const IoCommandQueueDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLIOCommandQueueDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLIOCommandQueueDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLIOCommandQueueDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLIOCommandQueueDescriptor maxCommandBufferCount]
    pub fn maxCommandBufferCount(self: *@This()) usize {
        return objc.msgSend(self, "maxCommandBufferCount", usize, .{});
    }
    /// `-[MTLIOCommandQueueDescriptor setMaxCommandBufferCount:]
    pub fn setMaxCommandBufferCount_(self: *@This(), max_command_buffer_count: usize) void {
        return objc.msgSend(self, "setMaxCommandBufferCount:", void, .{max_command_buffer_count});
    }
    /// `-[MTLIOCommandQueueDescriptor priority]
    pub fn priority(self: *@This()) IoPriority {
        return objc.msgSend(self, "priority", IoPriority, .{});
    }
    /// `-[MTLIOCommandQueueDescriptor setPriority:]
    pub fn setPriority_(self: *@This(), priority: IoPriority) void {
        return objc.msgSend(self, "setPriority:", void, .{priority});
    }
    /// `-[MTLIOCommandQueueDescriptor type]
    pub fn @"type"(self: *@This()) IoCommandQueueType {
        return objc.msgSend(self, "type", IoCommandQueueType, .{});
    }
    /// `-[MTLIOCommandQueueDescriptor setType:]
    pub fn setType_(self: *@This(), @"type": IoCommandQueueType) void {
        return objc.msgSend(self, "setType:", void, .{@"type"});
    }
    /// `-[MTLIOCommandQueueDescriptor maxCommandsInFlight]
    pub fn maxCommandsInFlight(self: *@This()) usize {
        return objc.msgSend(self, "maxCommandsInFlight", usize, .{});
    }
    /// `-[MTLIOCommandQueueDescriptor setMaxCommandsInFlight:]
    pub fn setMaxCommandsInFlight_(self: *@This(), max_commands_in_flight: usize) void {
        return objc.msgSend(self, "setMaxCommandsInFlight:", void, .{max_commands_in_flight});
    }
    /// `-[MTLIOCommandQueueDescriptor scratchBufferAllocator]
    pub fn scratchBufferAllocator(self: *@This()) ?*IoScratchBufferAllocator {
        return objc.msgSend(self, "scratchBufferAllocator", ?*IoScratchBufferAllocator, .{});
    }
    /// `-[MTLIOCommandQueueDescriptor setScratchBufferAllocator:]
    pub fn setScratchBufferAllocator_(self: *@This(), scratch_buffer_allocator: ?*IoScratchBufferAllocator) void {
        return objc.msgSend(self, "setScratchBufferAllocator:", void, .{scratch_buffer_allocator});
    }
};

/// `MTLIOFileHandle`
pub const IoFileHandle = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLIOFileHandle label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLIOFileHandle setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLVertexAttribute`
pub const VertexAttribute = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLVertexAttribute new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVertexAttribute alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVertexAttribute alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLVertexAttribute name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLVertexAttribute attributeIndex]
    pub fn attributeIndex(self: *@This()) usize {
        return objc.msgSend(self, "attributeIndex", usize, .{});
    }
    /// `-[MTLVertexAttribute attributeType]
    pub fn attributeType(self: *@This()) DataType {
        return objc.msgSend(self, "attributeType", DataType, .{});
    }
    /// `-[MTLVertexAttribute isActive]
    pub fn isActive(self: *@This()) bool {
        return objc.msgSend(self, "isActive", bool, .{});
    }
    /// `-[MTLVertexAttribute isPatchData]
    pub fn isPatchData(self: *@This()) bool {
        return objc.msgSend(self, "isPatchData", bool, .{});
    }
    /// `-[MTLVertexAttribute isPatchControlPointData]
    pub fn isPatchControlPointData(self: *@This()) bool {
        return objc.msgSend(self, "isPatchControlPointData", bool, .{});
    }
};

/// `MTLAttribute`
pub const Attribute = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLAttribute new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAttribute alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAttribute alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAttribute name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLAttribute attributeIndex]
    pub fn attributeIndex(self: *@This()) usize {
        return objc.msgSend(self, "attributeIndex", usize, .{});
    }
    /// `-[MTLAttribute attributeType]
    pub fn attributeType(self: *@This()) DataType {
        return objc.msgSend(self, "attributeType", DataType, .{});
    }
    /// `-[MTLAttribute isActive]
    pub fn isActive(self: *@This()) bool {
        return objc.msgSend(self, "isActive", bool, .{});
    }
    /// `-[MTLAttribute isPatchData]
    pub fn isPatchData(self: *@This()) bool {
        return objc.msgSend(self, "isPatchData", bool, .{});
    }
    /// `-[MTLAttribute isPatchControlPointData]
    pub fn isPatchControlPointData(self: *@This()) bool {
        return objc.msgSend(self, "isPatchControlPointData", bool, .{});
    }
};

/// `MTLFunctionConstant`
pub const FunctionConstant = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLFunctionConstant new]`
    pub const new = InternalInfo.new;
    /// `+[MTLFunctionConstant alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLFunctionConstant alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLFunctionConstant name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLFunctionConstant type]
    pub fn @"type"(self: *@This()) DataType {
        return objc.msgSend(self, "type", DataType, .{});
    }
    /// `-[MTLFunctionConstant index]
    pub fn index(self: *@This()) usize {
        return objc.msgSend(self, "index", usize, .{});
    }
    /// `-[MTLFunctionConstant required]
    pub fn required(self: *@This()) bool {
        return objc.msgSend(self, "required", bool, .{});
    }
};

/// `MTLFunction`
pub const Function = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLFunction newArgumentEncoderWithBufferIndex:]
    pub fn newArgumentEncoderWithBufferIndex_(self: *@This(), buffer_index: usize) *ArgumentEncoder {
        return objc.msgSend(self, "newArgumentEncoderWithBufferIndex:", *ArgumentEncoder, .{buffer_index});
    }
    /// `-[MTLFunction newArgumentEncoderWithBufferIndex:reflection:]
    pub fn newArgumentEncoderWithBufferIndex_reflection_(self: *@This(), buffer_index: usize, reflection: ?*AutoreleasedArgument) *ArgumentEncoder {
        return objc.msgSend(self, "newArgumentEncoderWithBufferIndex:reflection:", *ArgumentEncoder, .{ buffer_index, reflection });
    }
    /// `-[MTLFunction label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLFunction setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLFunction device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLFunction functionType]
    pub fn functionType(self: *@This()) FunctionType {
        return objc.msgSend(self, "functionType", FunctionType, .{});
    }
    /// `-[MTLFunction patchType]
    pub fn patchType(self: *@This()) PatchType {
        return objc.msgSend(self, "patchType", PatchType, .{});
    }
    /// `-[MTLFunction patchControlPointCount]
    pub fn patchControlPointCount(self: *@This()) isize {
        return objc.msgSend(self, "patchControlPointCount", isize, .{});
    }
    /// `-[MTLFunction vertexAttributes]
    pub fn vertexAttributes(self: *@This()) ?*ns.Array(*VertexAttribute) {
        return objc.msgSend(self, "vertexAttributes", ?*ns.Array(*VertexAttribute), .{});
    }
    /// `-[MTLFunction stageInputAttributes]
    pub fn stageInputAttributes(self: *@This()) ?*ns.Array(*Attribute) {
        return objc.msgSend(self, "stageInputAttributes", ?*ns.Array(*Attribute), .{});
    }
    /// `-[MTLFunction name]
    pub fn name(self: *@This()) *ns.String {
        return objc.msgSend(self, "name", *ns.String, .{});
    }
    /// `-[MTLFunction functionConstantsDictionary]
    pub fn functionConstantsDictionary(self: *@This()) *ns.Dictionary(*ns.String, *FunctionConstant) {
        return objc.msgSend(self, "functionConstantsDictionary", *ns.Dictionary(*ns.String, *FunctionConstant), .{});
    }
    /// `-[MTLFunction options]
    pub fn options(self: *@This()) FunctionOptions {
        return objc.msgSend(self, "options", FunctionOptions, .{});
    }
};

/// `MTLCompileOptions`
pub const CompileOptions = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLCompileOptions new]`
    pub const new = InternalInfo.new;
    /// `+[MTLCompileOptions alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLCompileOptions alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLCompileOptions preprocessorMacros]
    pub fn preprocessorMacros(self: *@This()) ?*ns.Dictionary(*ns.String, *ns.ObjectProtocol) {
        return objc.msgSend(self, "preprocessorMacros", ?*ns.Dictionary(*ns.String, *ns.ObjectProtocol), .{});
    }
    /// `-[MTLCompileOptions setPreprocessorMacros:]
    pub fn setPreprocessorMacros_(self: *@This(), preprocessor_macros: ?*ns.Dictionary(*ns.String, *ns.ObjectProtocol)) void {
        return objc.msgSend(self, "setPreprocessorMacros:", void, .{preprocessor_macros});
    }
    /// `-[MTLCompileOptions fastMathEnabled]
    pub fn fastMathEnabled(self: *@This()) bool {
        return objc.msgSend(self, "fastMathEnabled", bool, .{});
    }
    /// `-[MTLCompileOptions setFastMathEnabled:]
    pub fn setFastMathEnabled_(self: *@This(), fast_math_enabled: bool) void {
        return objc.msgSend(self, "setFastMathEnabled:", void, .{fast_math_enabled});
    }
    /// `-[MTLCompileOptions languageVersion]
    pub fn languageVersion(self: *@This()) LanguageVersion {
        return objc.msgSend(self, "languageVersion", LanguageVersion, .{});
    }
    /// `-[MTLCompileOptions setLanguageVersion:]
    pub fn setLanguageVersion_(self: *@This(), language_version: LanguageVersion) void {
        return objc.msgSend(self, "setLanguageVersion:", void, .{language_version});
    }
    /// `-[MTLCompileOptions libraryType]
    pub fn libraryType(self: *@This()) LibraryType {
        return objc.msgSend(self, "libraryType", LibraryType, .{});
    }
    /// `-[MTLCompileOptions setLibraryType:]
    pub fn setLibraryType_(self: *@This(), library_type: LibraryType) void {
        return objc.msgSend(self, "setLibraryType:", void, .{library_type});
    }
    /// `-[MTLCompileOptions installName]
    pub fn installName(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "installName", ?*ns.String, .{});
    }
    /// `-[MTLCompileOptions setInstallName:]
    pub fn setInstallName_(self: *@This(), install_name: ?*ns.String) void {
        return objc.msgSend(self, "setInstallName:", void, .{install_name});
    }
    /// `-[MTLCompileOptions libraries]
    pub fn libraries(self: *@This()) ?*ns.Array(*DynamicLibrary) {
        return objc.msgSend(self, "libraries", ?*ns.Array(*DynamicLibrary), .{});
    }
    /// `-[MTLCompileOptions setLibraries:]
    pub fn setLibraries_(self: *@This(), libraries: ?*ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self, "setLibraries:", void, .{libraries});
    }
    /// `-[MTLCompileOptions preserveInvariance]
    pub fn preserveInvariance(self: *@This()) bool {
        return objc.msgSend(self, "preserveInvariance", bool, .{});
    }
    /// `-[MTLCompileOptions setPreserveInvariance:]
    pub fn setPreserveInvariance_(self: *@This(), preserve_invariance: bool) void {
        return objc.msgSend(self, "setPreserveInvariance:", void, .{preserve_invariance});
    }
    /// `-[MTLCompileOptions optimizationLevel]
    pub fn optimizationLevel(self: *@This()) LibraryOptimizationLevel {
        return objc.msgSend(self, "optimizationLevel", LibraryOptimizationLevel, .{});
    }
    /// `-[MTLCompileOptions setOptimizationLevel:]
    pub fn setOptimizationLevel_(self: *@This(), optimization_level: LibraryOptimizationLevel) void {
        return objc.msgSend(self, "setOptimizationLevel:", void, .{optimization_level});
    }
    /// `-[MTLCompileOptions compileSymbolVisibility]
    pub fn compileSymbolVisibility(self: *@This()) CompileSymbolVisibility {
        return objc.msgSend(self, "compileSymbolVisibility", CompileSymbolVisibility, .{});
    }
    /// `-[MTLCompileOptions setCompileSymbolVisibility:]
    pub fn setCompileSymbolVisibility_(self: *@This(), compile_symbol_visibility: CompileSymbolVisibility) void {
        return objc.msgSend(self, "setCompileSymbolVisibility:", void, .{compile_symbol_visibility});
    }
    /// `-[MTLCompileOptions allowReferencingUndefinedSymbols]
    pub fn allowReferencingUndefinedSymbols(self: *@This()) bool {
        return objc.msgSend(self, "allowReferencingUndefinedSymbols", bool, .{});
    }
    /// `-[MTLCompileOptions setAllowReferencingUndefinedSymbols:]
    pub fn setAllowReferencingUndefinedSymbols_(self: *@This(), allow_referencing_undefined_symbols: bool) void {
        return objc.msgSend(self, "setAllowReferencingUndefinedSymbols:", void, .{allow_referencing_undefined_symbols});
    }
    /// `-[MTLCompileOptions maxTotalThreadsPerThreadgroup]
    pub fn maxTotalThreadsPerThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerThreadgroup", usize, .{});
    }
    /// `-[MTLCompileOptions setMaxTotalThreadsPerThreadgroup:]
    pub fn setMaxTotalThreadsPerThreadgroup_(self: *@This(), max_total_threads_per_threadgroup: usize) void {
        return objc.msgSend(self, "setMaxTotalThreadsPerThreadgroup:", void, .{max_total_threads_per_threadgroup});
    }
};

/// `MTLLibrary`
pub const Library = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLLibrary newFunctionWithName:]
    pub fn newFunctionWithName_(self: *@This(), function_name: *ns.String) ?*Function {
        return objc.msgSend(self, "newFunctionWithName:", ?*Function, .{function_name});
    }
    /// `-[MTLLibrary newFunctionWithName:constantValues:error:]
    pub fn newFunctionWithName_constantValues_error_(self: *@This(), name: *ns.String, constant_values: *FunctionConstantValues, err: ?*?*ns.Error) ?*Function {
        return objc.msgSend(self, "newFunctionWithName:constantValues:error:", ?*Function, .{ name, constant_values, err });
    }
    /// `-[MTLLibrary newFunctionWithName:constantValues:completionHandler:]
    pub fn newFunctionWithName_constantValues_completionHandler_(self: *@This(), name: *ns.String, constant_values: *FunctionConstantValues, completion_handler: *ns.Block(fn (?*Function, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newFunctionWithName:constantValues:completionHandler:", void, .{ name, constant_values, completion_handler });
    }
    /// `-[MTLLibrary newFunctionWithDescriptor:completionHandler:]
    pub fn newFunctionWithDescriptor_completionHandler_(self: *@This(), descriptor: *FunctionDescriptor, completion_handler: *ns.Block(fn (?*Function, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newFunctionWithDescriptor:completionHandler:", void, .{ descriptor, completion_handler });
    }
    /// `-[MTLLibrary newFunctionWithDescriptor:error:]
    pub fn newFunctionWithDescriptor_error_(self: *@This(), descriptor: *FunctionDescriptor, err: ?*?*ns.Error) ?*Function {
        return objc.msgSend(self, "newFunctionWithDescriptor:error:", ?*Function, .{ descriptor, err });
    }
    /// `-[MTLLibrary newIntersectionFunctionWithDescriptor:completionHandler:]
    pub fn newIntersectionFunctionWithDescriptor_completionHandler_(self: *@This(), descriptor: *IntersectionFunctionDescriptor, completion_handler: *ns.Block(fn (?*Function, ?*ns.Error) void)) void {
        return objc.msgSend(self, "newIntersectionFunctionWithDescriptor:completionHandler:", void, .{ descriptor, completion_handler });
    }
    /// `-[MTLLibrary newIntersectionFunctionWithDescriptor:error:]
    pub fn newIntersectionFunctionWithDescriptor_error_(self: *@This(), descriptor: *IntersectionFunctionDescriptor, err: ?*?*ns.Error) ?*Function {
        return objc.msgSend(self, "newIntersectionFunctionWithDescriptor:error:", ?*Function, .{ descriptor, err });
    }
    /// `-[MTLLibrary label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLLibrary setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLLibrary device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLLibrary functionNames]
    pub fn functionNames(self: *@This()) *ns.Array(*ns.String) {
        return objc.msgSend(self, "functionNames", *ns.Array(*ns.String), .{});
    }
    /// `-[MTLLibrary type]
    pub fn @"type"(self: *@This()) LibraryType {
        return objc.msgSend(self, "type", LibraryType, .{});
    }
    /// `-[MTLLibrary installName]
    pub fn installName(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "installName", ?*ns.String, .{});
    }
};

/// `MTLLinkedFunctions`
pub const LinkedFunctions = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLLinkedFunctions new]`
    pub const new = InternalInfo.new;
    /// `+[MTLLinkedFunctions alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLLinkedFunctions alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLLinkedFunctions linkedFunctions]
    pub fn linkedFunctions() *LinkedFunctions {
        return objc.msgSend(InternalInfo.class(), "linkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLLinkedFunctions functions]
    pub fn functions(self: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self, "functions", ?*ns.Array(*Function), .{});
    }
    /// `-[MTLLinkedFunctions setFunctions:]
    pub fn setFunctions_(self: *@This(), functions: ?*ns.Array(*Function)) void {
        return objc.msgSend(self, "setFunctions:", void, .{functions});
    }
    /// `-[MTLLinkedFunctions binaryFunctions]
    pub fn binaryFunctions(self: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self, "binaryFunctions", ?*ns.Array(*Function), .{});
    }
    /// `-[MTLLinkedFunctions setBinaryFunctions:]
    pub fn setBinaryFunctions_(self: *@This(), binary_functions: ?*ns.Array(*Function)) void {
        return objc.msgSend(self, "setBinaryFunctions:", void, .{binary_functions});
    }
    /// `-[MTLLinkedFunctions groups]
    pub fn groups(self: *@This()) ?*ns.Dictionary(*ns.String, *ns.Array(*Function)) {
        return objc.msgSend(self, "groups", ?*ns.Dictionary(*ns.String, *ns.Array(*Function)), .{});
    }
    /// `-[MTLLinkedFunctions setGroups:]
    pub fn setGroups_(self: *@This(), groups: ?*ns.Dictionary(*ns.String, *ns.Array(*Function))) void {
        return objc.msgSend(self, "setGroups:", void, .{groups});
    }
    /// `-[MTLLinkedFunctions privateFunctions]
    pub fn privateFunctions(self: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self, "privateFunctions", ?*ns.Array(*Function), .{});
    }
    /// `-[MTLLinkedFunctions setPrivateFunctions:]
    pub fn setPrivateFunctions_(self: *@This(), private_functions: ?*ns.Array(*Function)) void {
        return objc.msgSend(self, "setPrivateFunctions:", void, .{private_functions});
    }
};

/// `MTLParallelRenderCommandEncoder`
pub const ParallelRenderCommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), CommandEncoder);
    const as = InternalInfo.as;
    /// `-[MTLParallelRenderCommandEncoder renderCommandEncoder]
    pub fn renderCommandEncoder(self: *@This()) ?*RenderCommandEncoder {
        return objc.msgSend(self, "renderCommandEncoder", ?*RenderCommandEncoder, .{});
    }
    /// `-[MTLParallelRenderCommandEncoder setColorStoreAction:atIndex:]
    pub fn setColorStoreAction_atIndex_(self: *@This(), store_action: StoreAction, color_attachment_index: usize) void {
        return objc.msgSend(self, "setColorStoreAction:atIndex:", void, .{ store_action, color_attachment_index });
    }
    /// `-[MTLParallelRenderCommandEncoder setDepthStoreAction:]
    pub fn setDepthStoreAction_(self: *@This(), store_action: StoreAction) void {
        return objc.msgSend(self, "setDepthStoreAction:", void, .{store_action});
    }
    /// `-[MTLParallelRenderCommandEncoder setStencilStoreAction:]
    pub fn setStencilStoreAction_(self: *@This(), store_action: StoreAction) void {
        return objc.msgSend(self, "setStencilStoreAction:", void, .{store_action});
    }
    /// `-[MTLParallelRenderCommandEncoder setColorStoreActionOptions:atIndex:]
    pub fn setColorStoreActionOptions_atIndex_(self: *@This(), store_action_options: StoreActionOptions, color_attachment_index: usize) void {
        return objc.msgSend(self, "setColorStoreActionOptions:atIndex:", void, .{ store_action_options, color_attachment_index });
    }
    /// `-[MTLParallelRenderCommandEncoder setDepthStoreActionOptions:]
    pub fn setDepthStoreActionOptions_(self: *@This(), store_action_options: StoreActionOptions) void {
        return objc.msgSend(self, "setDepthStoreActionOptions:", void, .{store_action_options});
    }
    /// `-[MTLParallelRenderCommandEncoder setStencilStoreActionOptions:]
    pub fn setStencilStoreActionOptions_(self: *@This(), store_action_options: StoreActionOptions) void {
        return objc.msgSend(self, "setStencilStoreActionOptions:", void, .{store_action_options});
    }
};

/// `MTLPipelineBufferDescriptor`
pub const PipelineBufferDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLPipelineBufferDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLPipelineBufferDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLPipelineBufferDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLPipelineBufferDescriptor mutability]
    pub fn mutability(self: *@This()) Mutability {
        return objc.msgSend(self, "mutability", Mutability, .{});
    }
    /// `-[MTLPipelineBufferDescriptor setMutability:]
    pub fn setMutability_(self: *@This(), mutability: Mutability) void {
        return objc.msgSend(self, "setMutability:", void, .{mutability});
    }
};

/// `MTLPipelineBufferDescriptorArray`
pub const PipelineBufferDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLPipelineBufferDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLPipelineBufferDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLPipelineBufferDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLPipelineBufferDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), buffer_index: usize) *PipelineBufferDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *PipelineBufferDescriptor, .{buffer_index});
    }
    /// `-[MTLPipelineBufferDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), buffer: ?*PipelineBufferDescriptor, buffer_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ buffer, buffer_index });
    }
};

/// `MTLRasterizationRateSampleArray`
pub const RasterizationRateSampleArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRasterizationRateSampleArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRasterizationRateSampleArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRasterizationRateSampleArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRasterizationRateSampleArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), index: usize) *ns.Number {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *ns.Number, .{index});
    }
    /// `-[MTLRasterizationRateSampleArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), value: *ns.Number, index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ value, index });
    }
};

/// `MTLRasterizationRateLayerDescriptor`
pub const RasterizationRateLayerDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRasterizationRateLayerDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRasterizationRateLayerDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRasterizationRateLayerDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRasterizationRateLayerDescriptor initWithSampleCount:]
    pub fn initWithSampleCount_(self: *@This(), sample_count: Size) *@This() {
        return objc.msgSend(self, "initWithSampleCount:", *@This(), .{sample_count});
    }
    /// `-[MTLRasterizationRateLayerDescriptor initWithSampleCount:horizontal:vertical:]
    pub fn initWithSampleCount_horizontal_vertical_(self: *@This(), sample_count: Size, horizontal: *const f32, vertical: *const f32) *@This() {
        return objc.msgSend(self, "initWithSampleCount:horizontal:vertical:", *@This(), .{ sample_count, horizontal, vertical });
    }
    /// `-[MTLRasterizationRateLayerDescriptor sampleCount]
    pub fn sampleCount(self: *@This()) Size {
        return objc.msgSend(self, "sampleCount", Size, .{});
    }
    /// `-[MTLRasterizationRateLayerDescriptor maxSampleCount]
    pub fn maxSampleCount(self: *@This()) Size {
        return objc.msgSend(self, "maxSampleCount", Size, .{});
    }
    /// `-[MTLRasterizationRateLayerDescriptor horizontalSampleStorage]
    pub fn horizontalSampleStorage(self: *@This()) *f32 {
        return objc.msgSend(self, "horizontalSampleStorage", *f32, .{});
    }
    /// `-[MTLRasterizationRateLayerDescriptor verticalSampleStorage]
    pub fn verticalSampleStorage(self: *@This()) *f32 {
        return objc.msgSend(self, "verticalSampleStorage", *f32, .{});
    }
    /// `-[MTLRasterizationRateLayerDescriptor horizontal]
    pub fn horizontal(self: *@This()) *RasterizationRateSampleArray {
        return objc.msgSend(self, "horizontal", *RasterizationRateSampleArray, .{});
    }
    /// `-[MTLRasterizationRateLayerDescriptor vertical]
    pub fn vertical(self: *@This()) *RasterizationRateSampleArray {
        return objc.msgSend(self, "vertical", *RasterizationRateSampleArray, .{});
    }
    /// `-[MTLRasterizationRateLayerDescriptor setSampleCount:]
    pub fn setSampleCount_(self: *@This(), sample_count: Size) void {
        return objc.msgSend(self, "setSampleCount:", void, .{sample_count});
    }
};

/// `MTLRasterizationRateLayerArray`
pub const RasterizationRateLayerArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRasterizationRateLayerArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRasterizationRateLayerArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRasterizationRateLayerArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRasterizationRateLayerArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), layer_index: usize) ?*RasterizationRateLayerDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", ?*RasterizationRateLayerDescriptor, .{layer_index});
    }
    /// `-[MTLRasterizationRateLayerArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), layer: ?*RasterizationRateLayerDescriptor, layer_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ layer, layer_index });
    }
};

/// `MTLRasterizationRateMapDescriptor`
pub const RasterizationRateMapDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRasterizationRateMapDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRasterizationRateMapDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRasterizationRateMapDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:]
    pub fn rasterizationRateMapDescriptorWithScreenSize_(screen_size: Size) *RasterizationRateMapDescriptor {
        return objc.msgSend(InternalInfo.class(), "rasterizationRateMapDescriptorWithScreenSize:", *RasterizationRateMapDescriptor, .{screen_size});
    }
    /// `+[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:layer:]
    pub fn rasterizationRateMapDescriptorWithScreenSize_layer_(screen_size: Size, layer: *RasterizationRateLayerDescriptor) *RasterizationRateMapDescriptor {
        return objc.msgSend(InternalInfo.class(), "rasterizationRateMapDescriptorWithScreenSize:layer:", *RasterizationRateMapDescriptor, .{ screen_size, layer });
    }
    /// `+[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:]
    pub fn rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_(screen_size: Size, layer_count: usize, layers: [*]*const RasterizationRateLayerDescriptor) *RasterizationRateMapDescriptor {
        return objc.msgSend(InternalInfo.class(), "rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:", *RasterizationRateMapDescriptor, .{ screen_size, layer_count, layers });
    }
    /// `-[MTLRasterizationRateMapDescriptor layerAtIndex:]
    pub fn layerAtIndex_(self: *@This(), layer_index: usize) ?*RasterizationRateLayerDescriptor {
        return objc.msgSend(self, "layerAtIndex:", ?*RasterizationRateLayerDescriptor, .{layer_index});
    }
    /// `-[MTLRasterizationRateMapDescriptor setLayer:atIndex:]
    pub fn setLayer_atIndex_(self: *@This(), layer: ?*RasterizationRateLayerDescriptor, layer_index: usize) void {
        return objc.msgSend(self, "setLayer:atIndex:", void, .{ layer, layer_index });
    }
    /// `-[MTLRasterizationRateMapDescriptor layers]
    pub fn layers(self: *@This()) *RasterizationRateLayerArray {
        return objc.msgSend(self, "layers", *RasterizationRateLayerArray, .{});
    }
    /// `-[MTLRasterizationRateMapDescriptor screenSize]
    pub fn screenSize(self: *@This()) Size {
        return objc.msgSend(self, "screenSize", Size, .{});
    }
    /// `-[MTLRasterizationRateMapDescriptor setScreenSize:]
    pub fn setScreenSize_(self: *@This(), screen_size: Size) void {
        return objc.msgSend(self, "setScreenSize:", void, .{screen_size});
    }
    /// `-[MTLRasterizationRateMapDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLRasterizationRateMapDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLRasterizationRateMapDescriptor layerCount]
    pub fn layerCount(self: *@This()) usize {
        return objc.msgSend(self, "layerCount", usize, .{});
    }
};

/// `MTLRasterizationRateMap`
pub const RasterizationRateMap = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLRasterizationRateMap copyParameterDataToBuffer:offset:]
    pub fn copyParameterDataToBuffer_offset_(self: *@This(), buffer: *Buffer, offset: usize) void {
        return objc.msgSend(self, "copyParameterDataToBuffer:offset:", void, .{ buffer, offset });
    }
    /// `-[MTLRasterizationRateMap physicalSizeForLayer:]
    pub fn physicalSizeForLayer_(self: *@This(), layer_index: usize) Size {
        return objc.msgSend(self, "physicalSizeForLayer:", Size, .{layer_index});
    }
    /// `-[MTLRasterizationRateMap mapScreenToPhysicalCoordinates:forLayer:]
    pub fn mapScreenToPhysicalCoordinates_forLayer_(self: *@This(), screen_coordinates: Coordinate2D, layer_index: usize) Coordinate2D {
        return objc.msgSend(self, "mapScreenToPhysicalCoordinates:forLayer:", Coordinate2D, .{ screen_coordinates, layer_index });
    }
    /// `-[MTLRasterizationRateMap mapPhysicalToScreenCoordinates:forLayer:]
    pub fn mapPhysicalToScreenCoordinates_forLayer_(self: *@This(), physical_coordinates: Coordinate2D, layer_index: usize) Coordinate2D {
        return objc.msgSend(self, "mapPhysicalToScreenCoordinates:forLayer:", Coordinate2D, .{ physical_coordinates, layer_index });
    }
    /// `-[MTLRasterizationRateMap device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLRasterizationRateMap label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLRasterizationRateMap screenSize]
    pub fn screenSize(self: *@This()) Size {
        return objc.msgSend(self, "screenSize", Size, .{});
    }
    /// `-[MTLRasterizationRateMap physicalGranularity]
    pub fn physicalGranularity(self: *@This()) Size {
        return objc.msgSend(self, "physicalGranularity", Size, .{});
    }
    /// `-[MTLRasterizationRateMap layerCount]
    pub fn layerCount(self: *@This()) usize {
        return objc.msgSend(self, "layerCount", usize, .{});
    }
    /// `-[MTLRasterizationRateMap parameterBufferSizeAndAlign]
    pub fn parameterBufferSizeAndAlign(self: *@This()) SizeAndAlign {
        return objc.msgSend(self, "parameterBufferSizeAndAlign", SizeAndAlign, .{});
    }
};

/// `MTLRenderCommandEncoder`
pub const RenderCommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), CommandEncoder);
    const as = InternalInfo.as;
    /// `-[MTLRenderCommandEncoder setRenderPipelineState:]
    pub fn setRenderPipelineState_(self: *@This(), pipeline_state: *RenderPipelineState) void {
        return objc.msgSend(self, "setRenderPipelineState:", void, .{pipeline_state});
    }
    /// `-[MTLRenderCommandEncoder setVertexBytes:length:atIndex:]
    pub fn setVertexBytes_length_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBytes:length:atIndex:", void, .{ bytes, length, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexBuffer:offset:atIndex:]
    pub fn setVertexBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexBufferOffset:atIndex:]
    pub fn setVertexBufferOffset_atIndex_(self: *@This(), offset: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBufferOffset:atIndex:", void, .{ offset, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexBuffers:offsets:withRange:]
    pub fn setVertexBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setVertexBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexBuffer:offset:attributeStride:atIndex:]
    pub fn setVertexBuffer_offset_attributeStride_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBuffer:offset:attributeStride:atIndex:", void, .{ buffer, offset, stride, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexBuffers:offsets:attributeStrides:withRange:]
    pub fn setVertexBuffers_offsets_attributeStrides_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, strides: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setVertexBuffers:offsets:attributeStrides:withRange:", void, .{ buffers, offsets, strides, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexBufferOffset:attributeStride:atIndex:]
    pub fn setVertexBufferOffset_attributeStride_atIndex_(self: *@This(), offset: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBufferOffset:attributeStride:atIndex:", void, .{ offset, stride, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexBytes:length:attributeStride:atIndex:]
    pub fn setVertexBytes_length_attributeStride_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, stride: usize, index: usize) void {
        return objc.msgSend(self, "setVertexBytes:length:attributeStride:atIndex:", void, .{ bytes, length, stride, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexTexture:atIndex:]
    pub fn setVertexTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setVertexTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexTextures:withRange:]
    pub fn setVertexTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setVertexTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexSamplerState:atIndex:]
    pub fn setVertexSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setVertexSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexSamplerStates:withRange:]
    pub fn setVertexSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setVertexSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:]
    pub fn setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_(self: *@This(), sampler: ?*SamplerState, lod_min_clamp: f32, lod_max_clamp: f32, index: usize) void {
        return objc.msgSend(self, "setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler, lod_min_clamp, lod_max_clamp, index });
    }
    /// `-[MTLRenderCommandEncoder setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:]
    pub fn setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_(self: *@This(), samplers: [*]?*const SamplerState, lod_min_clamps: *const f32, lod_max_clamps: *const f32, range: ns.Range) void {
        return objc.msgSend(self, "setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers, lod_min_clamps, lod_max_clamps, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexVisibleFunctionTable:atBufferIndex:]
    pub fn setVertexVisibleFunctionTable_atBufferIndex_(self: *@This(), function_table: ?*VisibleFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setVertexVisibleFunctionTable:atBufferIndex:", void, .{ function_table, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setVertexVisibleFunctionTables:withBufferRange:]
    pub fn setVertexVisibleFunctionTables_withBufferRange_(self: *@This(), function_tables: [*]?*const VisibleFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setVertexVisibleFunctionTables:withBufferRange:", void, .{ function_tables, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexIntersectionFunctionTable:atBufferIndex:]
    pub fn setVertexIntersectionFunctionTable_atBufferIndex_(self: *@This(), intersection_function_table: ?*IntersectionFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setVertexIntersectionFunctionTable:atBufferIndex:", void, .{ intersection_function_table, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setVertexIntersectionFunctionTables:withBufferRange:]
    pub fn setVertexIntersectionFunctionTables_withBufferRange_(self: *@This(), intersection_function_tables: [*]?*const IntersectionFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setVertexIntersectionFunctionTables:withBufferRange:", void, .{ intersection_function_tables, range });
    }
    /// `-[MTLRenderCommandEncoder setVertexAccelerationStructure:atBufferIndex:]
    pub fn setVertexAccelerationStructure_atBufferIndex_(self: *@This(), acceleration_structure: ?*AccelerationStructure, buffer_index: usize) void {
        return objc.msgSend(self, "setVertexAccelerationStructure:atBufferIndex:", void, .{ acceleration_structure, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setViewport:]
    pub fn setViewport_(self: *@This(), viewport: Viewport) void {
        return objc.msgSend(self, "setViewport:", void, .{viewport});
    }
    /// `-[MTLRenderCommandEncoder setViewports:count:]
    pub fn setViewports_count_(self: *@This(), viewports: *const Viewport, count: usize) void {
        return objc.msgSend(self, "setViewports:count:", void, .{ viewports, count });
    }
    /// `-[MTLRenderCommandEncoder setFrontFacingWinding:]
    pub fn setFrontFacingWinding_(self: *@This(), front_facing_winding: Winding) void {
        return objc.msgSend(self, "setFrontFacingWinding:", void, .{front_facing_winding});
    }
    /// `-[MTLRenderCommandEncoder setVertexAmplificationCount:viewMappings:]
    pub fn setVertexAmplificationCount_viewMappings_(self: *@This(), count: usize, view_mappings: ?*const VertexAmplificationViewMapping) void {
        return objc.msgSend(self, "setVertexAmplificationCount:viewMappings:", void, .{ count, view_mappings });
    }
    /// `-[MTLRenderCommandEncoder setCullMode:]
    pub fn setCullMode_(self: *@This(), cull_mode: CullMode) void {
        return objc.msgSend(self, "setCullMode:", void, .{cull_mode});
    }
    /// `-[MTLRenderCommandEncoder setDepthClipMode:]
    pub fn setDepthClipMode_(self: *@This(), depth_clip_mode: DepthClipMode) void {
        return objc.msgSend(self, "setDepthClipMode:", void, .{depth_clip_mode});
    }
    /// `-[MTLRenderCommandEncoder setDepthBias:slopeScale:clamp:]
    pub fn setDepthBias_slopeScale_clamp_(self: *@This(), depth_bias: f32, slope_scale: f32, clamp: f32) void {
        return objc.msgSend(self, "setDepthBias:slopeScale:clamp:", void, .{ depth_bias, slope_scale, clamp });
    }
    /// `-[MTLRenderCommandEncoder setScissorRect:]
    pub fn setScissorRect_(self: *@This(), rect: ScissorRect) void {
        return objc.msgSend(self, "setScissorRect:", void, .{rect});
    }
    /// `-[MTLRenderCommandEncoder setScissorRects:count:]
    pub fn setScissorRects_count_(self: *@This(), scissor_rects: *const ScissorRect, count: usize) void {
        return objc.msgSend(self, "setScissorRects:count:", void, .{ scissor_rects, count });
    }
    /// `-[MTLRenderCommandEncoder setTriangleFillMode:]
    pub fn setTriangleFillMode_(self: *@This(), fill_mode: TriangleFillMode) void {
        return objc.msgSend(self, "setTriangleFillMode:", void, .{fill_mode});
    }
    /// `-[MTLRenderCommandEncoder setFragmentBytes:length:atIndex:]
    pub fn setFragmentBytes_length_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, index: usize) void {
        return objc.msgSend(self, "setFragmentBytes:length:atIndex:", void, .{ bytes, length, index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentBuffer:offset:atIndex:]
    pub fn setFragmentBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setFragmentBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentBufferOffset:atIndex:]
    pub fn setFragmentBufferOffset_atIndex_(self: *@This(), offset: usize, index: usize) void {
        return objc.msgSend(self, "setFragmentBufferOffset:atIndex:", void, .{ offset, index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentBuffers:offsets:withRange:]
    pub fn setFragmentBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setFragmentBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLRenderCommandEncoder setFragmentTexture:atIndex:]
    pub fn setFragmentTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setFragmentTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentTextures:withRange:]
    pub fn setFragmentTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setFragmentTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLRenderCommandEncoder setFragmentSamplerState:atIndex:]
    pub fn setFragmentSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setFragmentSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentSamplerStates:withRange:]
    pub fn setFragmentSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setFragmentSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLRenderCommandEncoder setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:]
    pub fn setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_(self: *@This(), sampler: ?*SamplerState, lod_min_clamp: f32, lod_max_clamp: f32, index: usize) void {
        return objc.msgSend(self, "setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler, lod_min_clamp, lod_max_clamp, index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:]
    pub fn setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_(self: *@This(), samplers: [*]?*const SamplerState, lod_min_clamps: *const f32, lod_max_clamps: *const f32, range: ns.Range) void {
        return objc.msgSend(self, "setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers, lod_min_clamps, lod_max_clamps, range });
    }
    /// `-[MTLRenderCommandEncoder setFragmentVisibleFunctionTable:atBufferIndex:]
    pub fn setFragmentVisibleFunctionTable_atBufferIndex_(self: *@This(), function_table: ?*VisibleFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setFragmentVisibleFunctionTable:atBufferIndex:", void, .{ function_table, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentVisibleFunctionTables:withBufferRange:]
    pub fn setFragmentVisibleFunctionTables_withBufferRange_(self: *@This(), function_tables: [*]?*const VisibleFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setFragmentVisibleFunctionTables:withBufferRange:", void, .{ function_tables, range });
    }
    /// `-[MTLRenderCommandEncoder setFragmentIntersectionFunctionTable:atBufferIndex:]
    pub fn setFragmentIntersectionFunctionTable_atBufferIndex_(self: *@This(), intersection_function_table: ?*IntersectionFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setFragmentIntersectionFunctionTable:atBufferIndex:", void, .{ intersection_function_table, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setFragmentIntersectionFunctionTables:withBufferRange:]
    pub fn setFragmentIntersectionFunctionTables_withBufferRange_(self: *@This(), intersection_function_tables: [*]?*const IntersectionFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setFragmentIntersectionFunctionTables:withBufferRange:", void, .{ intersection_function_tables, range });
    }
    /// `-[MTLRenderCommandEncoder setFragmentAccelerationStructure:atBufferIndex:]
    pub fn setFragmentAccelerationStructure_atBufferIndex_(self: *@This(), acceleration_structure: ?*AccelerationStructure, buffer_index: usize) void {
        return objc.msgSend(self, "setFragmentAccelerationStructure:atBufferIndex:", void, .{ acceleration_structure, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setBlendColorRed:green:blue:alpha:]
    pub fn setBlendColorRed_green_blue_alpha_(self: *@This(), red: f32, green: f32, blue: f32, alpha: f32) void {
        return objc.msgSend(self, "setBlendColorRed:green:blue:alpha:", void, .{ red, green, blue, alpha });
    }
    /// `-[MTLRenderCommandEncoder setDepthStencilState:]
    pub fn setDepthStencilState_(self: *@This(), depth_stencil_state: ?*DepthStencilState) void {
        return objc.msgSend(self, "setDepthStencilState:", void, .{depth_stencil_state});
    }
    /// `-[MTLRenderCommandEncoder setStencilReferenceValue:]
    pub fn setStencilReferenceValue_(self: *@This(), reference_value: u32) void {
        return objc.msgSend(self, "setStencilReferenceValue:", void, .{reference_value});
    }
    /// `-[MTLRenderCommandEncoder setStencilFrontReferenceValue:backReferenceValue:]
    pub fn setStencilFrontReferenceValue_backReferenceValue_(self: *@This(), front_reference_value: u32, back_reference_value: u32) void {
        return objc.msgSend(self, "setStencilFrontReferenceValue:backReferenceValue:", void, .{ front_reference_value, back_reference_value });
    }
    /// `-[MTLRenderCommandEncoder setVisibilityResultMode:offset:]
    pub fn setVisibilityResultMode_offset_(self: *@This(), mode: VisibilityResultMode, offset: usize) void {
        return objc.msgSend(self, "setVisibilityResultMode:offset:", void, .{ mode, offset });
    }
    /// `-[MTLRenderCommandEncoder setColorStoreAction:atIndex:]
    pub fn setColorStoreAction_atIndex_(self: *@This(), store_action: StoreAction, color_attachment_index: usize) void {
        return objc.msgSend(self, "setColorStoreAction:atIndex:", void, .{ store_action, color_attachment_index });
    }
    /// `-[MTLRenderCommandEncoder setDepthStoreAction:]
    pub fn setDepthStoreAction_(self: *@This(), store_action: StoreAction) void {
        return objc.msgSend(self, "setDepthStoreAction:", void, .{store_action});
    }
    /// `-[MTLRenderCommandEncoder setStencilStoreAction:]
    pub fn setStencilStoreAction_(self: *@This(), store_action: StoreAction) void {
        return objc.msgSend(self, "setStencilStoreAction:", void, .{store_action});
    }
    /// `-[MTLRenderCommandEncoder setColorStoreActionOptions:atIndex:]
    pub fn setColorStoreActionOptions_atIndex_(self: *@This(), store_action_options: StoreActionOptions, color_attachment_index: usize) void {
        return objc.msgSend(self, "setColorStoreActionOptions:atIndex:", void, .{ store_action_options, color_attachment_index });
    }
    /// `-[MTLRenderCommandEncoder setDepthStoreActionOptions:]
    pub fn setDepthStoreActionOptions_(self: *@This(), store_action_options: StoreActionOptions) void {
        return objc.msgSend(self, "setDepthStoreActionOptions:", void, .{store_action_options});
    }
    /// `-[MTLRenderCommandEncoder setStencilStoreActionOptions:]
    pub fn setStencilStoreActionOptions_(self: *@This(), store_action_options: StoreActionOptions) void {
        return objc.msgSend(self, "setStencilStoreActionOptions:", void, .{store_action_options});
    }
    /// `-[MTLRenderCommandEncoder setObjectBytes:length:atIndex:]
    pub fn setObjectBytes_length_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, index: usize) void {
        return objc.msgSend(self, "setObjectBytes:length:atIndex:", void, .{ bytes, length, index });
    }
    /// `-[MTLRenderCommandEncoder setObjectBuffer:offset:atIndex:]
    pub fn setObjectBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setObjectBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLRenderCommandEncoder setObjectBufferOffset:atIndex:]
    pub fn setObjectBufferOffset_atIndex_(self: *@This(), offset: usize, index: usize) void {
        return objc.msgSend(self, "setObjectBufferOffset:atIndex:", void, .{ offset, index });
    }
    /// `-[MTLRenderCommandEncoder setObjectBuffers:offsets:withRange:]
    pub fn setObjectBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setObjectBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLRenderCommandEncoder setObjectTexture:atIndex:]
    pub fn setObjectTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setObjectTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLRenderCommandEncoder setObjectTextures:withRange:]
    pub fn setObjectTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setObjectTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLRenderCommandEncoder setObjectSamplerState:atIndex:]
    pub fn setObjectSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setObjectSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLRenderCommandEncoder setObjectSamplerStates:withRange:]
    pub fn setObjectSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setObjectSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLRenderCommandEncoder setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:]
    pub fn setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_(self: *@This(), sampler: ?*SamplerState, lod_min_clamp: f32, lod_max_clamp: f32, index: usize) void {
        return objc.msgSend(self, "setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler, lod_min_clamp, lod_max_clamp, index });
    }
    /// `-[MTLRenderCommandEncoder setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:]
    pub fn setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_(self: *@This(), samplers: [*]?*const SamplerState, lod_min_clamps: *const f32, lod_max_clamps: *const f32, range: ns.Range) void {
        return objc.msgSend(self, "setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers, lod_min_clamps, lod_max_clamps, range });
    }
    /// `-[MTLRenderCommandEncoder setObjectThreadgroupMemoryLength:atIndex:]
    pub fn setObjectThreadgroupMemoryLength_atIndex_(self: *@This(), length: usize, index: usize) void {
        return objc.msgSend(self, "setObjectThreadgroupMemoryLength:atIndex:", void, .{ length, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshBytes:length:atIndex:]
    pub fn setMeshBytes_length_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, index: usize) void {
        return objc.msgSend(self, "setMeshBytes:length:atIndex:", void, .{ bytes, length, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshBuffer:offset:atIndex:]
    pub fn setMeshBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setMeshBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshBufferOffset:atIndex:]
    pub fn setMeshBufferOffset_atIndex_(self: *@This(), offset: usize, index: usize) void {
        return objc.msgSend(self, "setMeshBufferOffset:atIndex:", void, .{ offset, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshBuffers:offsets:withRange:]
    pub fn setMeshBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setMeshBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLRenderCommandEncoder setMeshTexture:atIndex:]
    pub fn setMeshTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setMeshTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshTextures:withRange:]
    pub fn setMeshTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setMeshTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLRenderCommandEncoder setMeshSamplerState:atIndex:]
    pub fn setMeshSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setMeshSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshSamplerStates:withRange:]
    pub fn setMeshSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setMeshSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLRenderCommandEncoder setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:]
    pub fn setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_(self: *@This(), sampler: ?*SamplerState, lod_min_clamp: f32, lod_max_clamp: f32, index: usize) void {
        return objc.msgSend(self, "setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler, lod_min_clamp, lod_max_clamp, index });
    }
    /// `-[MTLRenderCommandEncoder setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:]
    pub fn setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_(self: *@This(), samplers: [*]?*const SamplerState, lod_min_clamps: *const f32, lod_max_clamps: *const f32, range: ns.Range) void {
        return objc.msgSend(self, "setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers, lod_min_clamps, lod_max_clamps, range });
    }
    /// `-[MTLRenderCommandEncoder drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]
    pub fn drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(self: *@This(), threadgroups_per_grid: Size, threads_per_object_threadgroup: Size, threads_per_mesh_threadgroup: Size) void {
        return objc.msgSend(self, "drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threadgroups_per_grid, threads_per_object_threadgroup, threads_per_mesh_threadgroup });
    }
    /// `-[MTLRenderCommandEncoder drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]
    pub fn drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(self: *@This(), threads_per_grid: Size, threads_per_object_threadgroup: Size, threads_per_mesh_threadgroup: Size) void {
        return objc.msgSend(self, "drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ threads_per_grid, threads_per_object_threadgroup, threads_per_mesh_threadgroup });
    }
    /// `-[MTLRenderCommandEncoder drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:]
    pub fn drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_(self: *@This(), indirect_buffer: *Buffer, indirect_buffer_offset: usize, threads_per_object_threadgroup: Size, threads_per_mesh_threadgroup: Size) void {
        return objc.msgSend(self, "drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:", void, .{ indirect_buffer, indirect_buffer_offset, threads_per_object_threadgroup, threads_per_mesh_threadgroup });
    }
    /// `-[MTLRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:]
    pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_(self: *@This(), primitive_type: PrimitiveType, vertex_start: usize, vertex_count: usize, instance_count: usize) void {
        return objc.msgSend(self, "drawPrimitives:vertexStart:vertexCount:instanceCount:", void, .{ primitive_type, vertex_start, vertex_count, instance_count });
    }
    /// `-[MTLRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:]
    pub fn drawPrimitives_vertexStart_vertexCount_(self: *@This(), primitive_type: PrimitiveType, vertex_start: usize, vertex_count: usize) void {
        return objc.msgSend(self, "drawPrimitives:vertexStart:vertexCount:", void, .{ primitive_type, vertex_start, vertex_count });
    }
    /// `-[MTLRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:]
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_(self: *@This(), primitive_type: PrimitiveType, index_count: usize, index_type: IndexType, index_buffer: *Buffer, index_buffer_offset: usize, instance_count: usize) void {
        return objc.msgSend(self, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:", void, .{ primitive_type, index_count, index_type, index_buffer, index_buffer_offset, instance_count });
    }
    /// `-[MTLRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:]
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_(self: *@This(), primitive_type: PrimitiveType, index_count: usize, index_type: IndexType, index_buffer: *Buffer, index_buffer_offset: usize) void {
        return objc.msgSend(self, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", void, .{ primitive_type, index_count, index_type, index_buffer, index_buffer_offset });
    }
    /// `-[MTLRenderCommandEncoder drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:]
    pub fn drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_(self: *@This(), primitive_type: PrimitiveType, vertex_start: usize, vertex_count: usize, instance_count: usize, base_instance: usize) void {
        return objc.msgSend(self, "drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:", void, .{ primitive_type, vertex_start, vertex_count, instance_count, base_instance });
    }
    /// `-[MTLRenderCommandEncoder drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:]
    pub fn drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_(self: *@This(), primitive_type: PrimitiveType, index_count: usize, index_type: IndexType, index_buffer: *Buffer, index_buffer_offset: usize, instance_count: usize, base_vertex: isize, base_instance: usize) void {
        return objc.msgSend(self, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:", void, .{ primitive_type, index_count, index_type, index_buffer, index_buffer_offset, instance_count, base_vertex, base_instance });
    }
    /// `-[MTLRenderCommandEncoder drawPrimitives:indirectBuffer:indirectBufferOffset:]
    pub fn drawPrimitives_indirectBuffer_indirectBufferOffset_(self: *@This(), primitive_type: PrimitiveType, indirect_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "drawPrimitives:indirectBuffer:indirectBufferOffset:", void, .{ primitive_type, indirect_buffer, indirect_buffer_offset });
    }
    /// `-[MTLRenderCommandEncoder drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:]
    pub fn drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_(self: *@This(), primitive_type: PrimitiveType, index_type: IndexType, index_buffer: *Buffer, index_buffer_offset: usize, indirect_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:", void, .{ primitive_type, index_type, index_buffer, index_buffer_offset, indirect_buffer, indirect_buffer_offset });
    }
    /// `-[MTLRenderCommandEncoder textureBarrier]
    pub fn textureBarrier(self: *@This()) void {
        return objc.msgSend(self, "textureBarrier", void, .{});
    }
    /// `-[MTLRenderCommandEncoder updateFence:afterStages:]
    pub fn updateFence_afterStages_(self: *@This(), fence: *Fence, stages: RenderStages) void {
        return objc.msgSend(self, "updateFence:afterStages:", void, .{ fence, stages });
    }
    /// `-[MTLRenderCommandEncoder waitForFence:beforeStages:]
    pub fn waitForFence_beforeStages_(self: *@This(), fence: *Fence, stages: RenderStages) void {
        return objc.msgSend(self, "waitForFence:beforeStages:", void, .{ fence, stages });
    }
    /// `-[MTLRenderCommandEncoder setTessellationFactorBuffer:offset:instanceStride:]
    pub fn setTessellationFactorBuffer_offset_instanceStride_(self: *@This(), buffer: ?*Buffer, offset: usize, instance_stride: usize) void {
        return objc.msgSend(self, "setTessellationFactorBuffer:offset:instanceStride:", void, .{ buffer, offset, instance_stride });
    }
    /// `-[MTLRenderCommandEncoder setTessellationFactorScale:]
    pub fn setTessellationFactorScale_(self: *@This(), scale: f32) void {
        return objc.msgSend(self, "setTessellationFactorScale:", void, .{scale});
    }
    /// `-[MTLRenderCommandEncoder drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:]
    pub fn drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_(self: *@This(), number_of_patch_control_points: usize, patch_start: usize, patch_count: usize, patch_index_buffer: ?*Buffer, patch_index_buffer_offset: usize, instance_count: usize, base_instance: usize) void {
        return objc.msgSend(self, "drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:", void, .{ number_of_patch_control_points, patch_start, patch_count, patch_index_buffer, patch_index_buffer_offset, instance_count, base_instance });
    }
    /// `-[MTLRenderCommandEncoder drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:]
    pub fn drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_(self: *@This(), number_of_patch_control_points: usize, patch_index_buffer: ?*Buffer, patch_index_buffer_offset: usize, indirect_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:", void, .{ number_of_patch_control_points, patch_index_buffer, patch_index_buffer_offset, indirect_buffer, indirect_buffer_offset });
    }
    /// `-[MTLRenderCommandEncoder drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:]
    pub fn drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_(self: *@This(), number_of_patch_control_points: usize, patch_start: usize, patch_count: usize, patch_index_buffer: ?*Buffer, patch_index_buffer_offset: usize, control_point_index_buffer: *Buffer, control_point_index_buffer_offset: usize, instance_count: usize, base_instance: usize) void {
        return objc.msgSend(self, "drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:", void, .{ number_of_patch_control_points, patch_start, patch_count, patch_index_buffer, patch_index_buffer_offset, control_point_index_buffer, control_point_index_buffer_offset, instance_count, base_instance });
    }
    /// `-[MTLRenderCommandEncoder drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:]
    pub fn drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_(self: *@This(), number_of_patch_control_points: usize, patch_index_buffer: ?*Buffer, patch_index_buffer_offset: usize, control_point_index_buffer: *Buffer, control_point_index_buffer_offset: usize, indirect_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:", void, .{ number_of_patch_control_points, patch_index_buffer, patch_index_buffer_offset, control_point_index_buffer, control_point_index_buffer_offset, indirect_buffer, indirect_buffer_offset });
    }
    /// `-[MTLRenderCommandEncoder setTileBytes:length:atIndex:]
    pub fn setTileBytes_length_atIndex_(self: *@This(), bytes: *const anyopaque, length: usize, index: usize) void {
        return objc.msgSend(self, "setTileBytes:length:atIndex:", void, .{ bytes, length, index });
    }
    /// `-[MTLRenderCommandEncoder setTileBuffer:offset:atIndex:]
    pub fn setTileBuffer_offset_atIndex_(self: *@This(), buffer: ?*Buffer, offset: usize, index: usize) void {
        return objc.msgSend(self, "setTileBuffer:offset:atIndex:", void, .{ buffer, offset, index });
    }
    /// `-[MTLRenderCommandEncoder setTileBufferOffset:atIndex:]
    pub fn setTileBufferOffset_atIndex_(self: *@This(), offset: usize, index: usize) void {
        return objc.msgSend(self, "setTileBufferOffset:atIndex:", void, .{ offset, index });
    }
    /// `-[MTLRenderCommandEncoder setTileBuffers:offsets:withRange:]
    pub fn setTileBuffers_offsets_withRange_(self: *@This(), buffers: [*]?*const Buffer, offsets: *const usize, range: ns.Range) void {
        return objc.msgSend(self, "setTileBuffers:offsets:withRange:", void, .{ buffers, offsets, range });
    }
    /// `-[MTLRenderCommandEncoder setTileTexture:atIndex:]
    pub fn setTileTexture_atIndex_(self: *@This(), texture: ?*Texture, index: usize) void {
        return objc.msgSend(self, "setTileTexture:atIndex:", void, .{ texture, index });
    }
    /// `-[MTLRenderCommandEncoder setTileTextures:withRange:]
    pub fn setTileTextures_withRange_(self: *@This(), textures: [*]?*const Texture, range: ns.Range) void {
        return objc.msgSend(self, "setTileTextures:withRange:", void, .{ textures, range });
    }
    /// `-[MTLRenderCommandEncoder setTileSamplerState:atIndex:]
    pub fn setTileSamplerState_atIndex_(self: *@This(), sampler: ?*SamplerState, index: usize) void {
        return objc.msgSend(self, "setTileSamplerState:atIndex:", void, .{ sampler, index });
    }
    /// `-[MTLRenderCommandEncoder setTileSamplerStates:withRange:]
    pub fn setTileSamplerStates_withRange_(self: *@This(), samplers: [*]?*const SamplerState, range: ns.Range) void {
        return objc.msgSend(self, "setTileSamplerStates:withRange:", void, .{ samplers, range });
    }
    /// `-[MTLRenderCommandEncoder setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:]
    pub fn setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_(self: *@This(), sampler: ?*SamplerState, lod_min_clamp: f32, lod_max_clamp: f32, index: usize) void {
        return objc.msgSend(self, "setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:", void, .{ sampler, lod_min_clamp, lod_max_clamp, index });
    }
    /// `-[MTLRenderCommandEncoder setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:]
    pub fn setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_(self: *@This(), samplers: [*]?*const SamplerState, lod_min_clamps: *const f32, lod_max_clamps: *const f32, range: ns.Range) void {
        return objc.msgSend(self, "setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:", void, .{ samplers, lod_min_clamps, lod_max_clamps, range });
    }
    /// `-[MTLRenderCommandEncoder setTileVisibleFunctionTable:atBufferIndex:]
    pub fn setTileVisibleFunctionTable_atBufferIndex_(self: *@This(), function_table: ?*VisibleFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setTileVisibleFunctionTable:atBufferIndex:", void, .{ function_table, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setTileVisibleFunctionTables:withBufferRange:]
    pub fn setTileVisibleFunctionTables_withBufferRange_(self: *@This(), function_tables: [*]?*const VisibleFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setTileVisibleFunctionTables:withBufferRange:", void, .{ function_tables, range });
    }
    /// `-[MTLRenderCommandEncoder setTileIntersectionFunctionTable:atBufferIndex:]
    pub fn setTileIntersectionFunctionTable_atBufferIndex_(self: *@This(), intersection_function_table: ?*IntersectionFunctionTable, buffer_index: usize) void {
        return objc.msgSend(self, "setTileIntersectionFunctionTable:atBufferIndex:", void, .{ intersection_function_table, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder setTileIntersectionFunctionTables:withBufferRange:]
    pub fn setTileIntersectionFunctionTables_withBufferRange_(self: *@This(), intersection_function_tables: [*]?*const IntersectionFunctionTable, range: ns.Range) void {
        return objc.msgSend(self, "setTileIntersectionFunctionTables:withBufferRange:", void, .{ intersection_function_tables, range });
    }
    /// `-[MTLRenderCommandEncoder setTileAccelerationStructure:atBufferIndex:]
    pub fn setTileAccelerationStructure_atBufferIndex_(self: *@This(), acceleration_structure: ?*AccelerationStructure, buffer_index: usize) void {
        return objc.msgSend(self, "setTileAccelerationStructure:atBufferIndex:", void, .{ acceleration_structure, buffer_index });
    }
    /// `-[MTLRenderCommandEncoder dispatchThreadsPerTile:]
    pub fn dispatchThreadsPerTile_(self: *@This(), threads_per_tile: Size) void {
        return objc.msgSend(self, "dispatchThreadsPerTile:", void, .{threads_per_tile});
    }
    /// `-[MTLRenderCommandEncoder setThreadgroupMemoryLength:offset:atIndex:]
    pub fn setThreadgroupMemoryLength_offset_atIndex_(self: *@This(), length: usize, offset: usize, index: usize) void {
        return objc.msgSend(self, "setThreadgroupMemoryLength:offset:atIndex:", void, .{ length, offset, index });
    }
    /// `-[MTLRenderCommandEncoder useResource:usage:]
    pub fn useResource_usage_(self: *@This(), resource: *Resource, usage: ResourceUsage) void {
        return objc.msgSend(self, "useResource:usage:", void, .{ resource, usage });
    }
    /// `-[MTLRenderCommandEncoder useResources:count:usage:]
    pub fn useResources_count_usage_(self: *@This(), resources: [*]*const Resource, count: usize, usage: ResourceUsage) void {
        return objc.msgSend(self, "useResources:count:usage:", void, .{ resources, count, usage });
    }
    /// `-[MTLRenderCommandEncoder useResource:usage:stages:]
    pub fn useResource_usage_stages_(self: *@This(), resource: *Resource, usage: ResourceUsage, stages: RenderStages) void {
        return objc.msgSend(self, "useResource:usage:stages:", void, .{ resource, usage, stages });
    }
    /// `-[MTLRenderCommandEncoder useResources:count:usage:stages:]
    pub fn useResources_count_usage_stages_(self: *@This(), resources: [*]*const Resource, count: usize, usage: ResourceUsage, stages: RenderStages) void {
        return objc.msgSend(self, "useResources:count:usage:stages:", void, .{ resources, count, usage, stages });
    }
    /// `-[MTLRenderCommandEncoder useHeap:]
    pub fn useHeap_(self: *@This(), heap: *Heap) void {
        return objc.msgSend(self, "useHeap:", void, .{heap});
    }
    /// `-[MTLRenderCommandEncoder useHeaps:count:]
    pub fn useHeaps_count_(self: *@This(), heaps: [*]*const Heap, count: usize) void {
        return objc.msgSend(self, "useHeaps:count:", void, .{ heaps, count });
    }
    /// `-[MTLRenderCommandEncoder useHeap:stages:]
    pub fn useHeap_stages_(self: *@This(), heap: *Heap, stages: RenderStages) void {
        return objc.msgSend(self, "useHeap:stages:", void, .{ heap, stages });
    }
    /// `-[MTLRenderCommandEncoder useHeaps:count:stages:]
    pub fn useHeaps_count_stages_(self: *@This(), heaps: [*]*const Heap, count: usize, stages: RenderStages) void {
        return objc.msgSend(self, "useHeaps:count:stages:", void, .{ heaps, count, stages });
    }
    /// `-[MTLRenderCommandEncoder executeCommandsInBuffer:withRange:]
    pub fn executeCommandsInBuffer_withRange_(self: *@This(), indirect_command_buffer: *IndirectCommandBuffer, execution_range: ns.Range) void {
        return objc.msgSend(self, "executeCommandsInBuffer:withRange:", void, .{ indirect_command_buffer, execution_range });
    }
    /// `-[MTLRenderCommandEncoder executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:]
    pub fn executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_(self: *@This(), indirect_commandbuffer: *IndirectCommandBuffer, indirect_range_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:", void, .{ indirect_commandbuffer, indirect_range_buffer, indirect_buffer_offset });
    }
    /// `-[MTLRenderCommandEncoder memoryBarrierWithScope:afterStages:beforeStages:]
    pub fn memoryBarrierWithScope_afterStages_beforeStages_(self: *@This(), scope: BarrierScope, after: RenderStages, before: RenderStages) void {
        return objc.msgSend(self, "memoryBarrierWithScope:afterStages:beforeStages:", void, .{ scope, after, before });
    }
    /// `-[MTLRenderCommandEncoder memoryBarrierWithResources:count:afterStages:beforeStages:]
    pub fn memoryBarrierWithResources_count_afterStages_beforeStages_(self: *@This(), resources: [*]*const Resource, count: usize, after: RenderStages, before: RenderStages) void {
        return objc.msgSend(self, "memoryBarrierWithResources:count:afterStages:beforeStages:", void, .{ resources, count, after, before });
    }
    /// `-[MTLRenderCommandEncoder sampleCountersInBuffer:atSampleIndex:withBarrier:]
    pub fn sampleCountersInBuffer_atSampleIndex_withBarrier_(self: *@This(), sample_buffer: *CounterSampleBuffer, sample_index: usize, barrier: bool) void {
        return objc.msgSend(self, "sampleCountersInBuffer:atSampleIndex:withBarrier:", void, .{ sample_buffer, sample_index, barrier });
    }
    /// `-[MTLRenderCommandEncoder tileWidth]
    pub fn tileWidth(self: *@This()) usize {
        return objc.msgSend(self, "tileWidth", usize, .{});
    }
    /// `-[MTLRenderCommandEncoder tileHeight]
    pub fn tileHeight(self: *@This()) usize {
        return objc.msgSend(self, "tileHeight", usize, .{});
    }
};

/// `MTLRenderPassAttachmentDescriptor`
pub const RenderPassAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRenderPassAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassAttachmentDescriptor texture]
    pub fn texture(self: *@This()) ?*Texture {
        return objc.msgSend(self, "texture", ?*Texture, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setTexture:]
    pub fn setTexture_(self: *@This(), texture: ?*Texture) void {
        return objc.msgSend(self, "setTexture:", void, .{texture});
    }
    /// `-[MTLRenderPassAttachmentDescriptor level]
    pub fn level(self: *@This()) usize {
        return objc.msgSend(self, "level", usize, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setLevel:]
    pub fn setLevel_(self: *@This(), level: usize) void {
        return objc.msgSend(self, "setLevel:", void, .{level});
    }
    /// `-[MTLRenderPassAttachmentDescriptor slice]
    pub fn slice(self: *@This()) usize {
        return objc.msgSend(self, "slice", usize, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setSlice:]
    pub fn setSlice_(self: *@This(), slice: usize) void {
        return objc.msgSend(self, "setSlice:", void, .{slice});
    }
    /// `-[MTLRenderPassAttachmentDescriptor depthPlane]
    pub fn depthPlane(self: *@This()) usize {
        return objc.msgSend(self, "depthPlane", usize, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setDepthPlane:]
    pub fn setDepthPlane_(self: *@This(), depth_plane: usize) void {
        return objc.msgSend(self, "setDepthPlane:", void, .{depth_plane});
    }
    /// `-[MTLRenderPassAttachmentDescriptor resolveTexture]
    pub fn resolveTexture(self: *@This()) ?*Texture {
        return objc.msgSend(self, "resolveTexture", ?*Texture, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setResolveTexture:]
    pub fn setResolveTexture_(self: *@This(), resolve_texture: ?*Texture) void {
        return objc.msgSend(self, "setResolveTexture:", void, .{resolve_texture});
    }
    /// `-[MTLRenderPassAttachmentDescriptor resolveLevel]
    pub fn resolveLevel(self: *@This()) usize {
        return objc.msgSend(self, "resolveLevel", usize, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setResolveLevel:]
    pub fn setResolveLevel_(self: *@This(), resolve_level: usize) void {
        return objc.msgSend(self, "setResolveLevel:", void, .{resolve_level});
    }
    /// `-[MTLRenderPassAttachmentDescriptor resolveSlice]
    pub fn resolveSlice(self: *@This()) usize {
        return objc.msgSend(self, "resolveSlice", usize, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setResolveSlice:]
    pub fn setResolveSlice_(self: *@This(), resolve_slice: usize) void {
        return objc.msgSend(self, "setResolveSlice:", void, .{resolve_slice});
    }
    /// `-[MTLRenderPassAttachmentDescriptor resolveDepthPlane]
    pub fn resolveDepthPlane(self: *@This()) usize {
        return objc.msgSend(self, "resolveDepthPlane", usize, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setResolveDepthPlane:]
    pub fn setResolveDepthPlane_(self: *@This(), resolve_depth_plane: usize) void {
        return objc.msgSend(self, "setResolveDepthPlane:", void, .{resolve_depth_plane});
    }
    /// `-[MTLRenderPassAttachmentDescriptor loadAction]
    pub fn loadAction(self: *@This()) LoadAction {
        return objc.msgSend(self, "loadAction", LoadAction, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setLoadAction:]
    pub fn setLoadAction_(self: *@This(), load_action: LoadAction) void {
        return objc.msgSend(self, "setLoadAction:", void, .{load_action});
    }
    /// `-[MTLRenderPassAttachmentDescriptor storeAction]
    pub fn storeAction(self: *@This()) StoreAction {
        return objc.msgSend(self, "storeAction", StoreAction, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setStoreAction:]
    pub fn setStoreAction_(self: *@This(), store_action: StoreAction) void {
        return objc.msgSend(self, "setStoreAction:", void, .{store_action});
    }
    /// `-[MTLRenderPassAttachmentDescriptor storeActionOptions]
    pub fn storeActionOptions(self: *@This()) StoreActionOptions {
        return objc.msgSend(self, "storeActionOptions", StoreActionOptions, .{});
    }
    /// `-[MTLRenderPassAttachmentDescriptor setStoreActionOptions:]
    pub fn setStoreActionOptions_(self: *@This(), store_action_options: StoreActionOptions) void {
        return objc.msgSend(self, "setStoreActionOptions:", void, .{store_action_options});
    }
};

/// `MTLRenderPassColorAttachmentDescriptor`
pub const RenderPassColorAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), RenderPassAttachmentDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLRenderPassColorAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassColorAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassColorAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassColorAttachmentDescriptor clearColor]
    pub fn clearColor(self: *@This()) ClearColor {
        return objc.msgSend(self, "clearColor", ClearColor, .{});
    }
    /// `-[MTLRenderPassColorAttachmentDescriptor setClearColor:]
    pub fn setClearColor_(self: *@This(), clear_color: ClearColor) void {
        return objc.msgSend(self, "setClearColor:", void, .{clear_color});
    }
};

/// `MTLRenderPassDepthAttachmentDescriptor`
pub const RenderPassDepthAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), RenderPassAttachmentDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLRenderPassDepthAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassDepthAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassDepthAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassDepthAttachmentDescriptor clearDepth]
    pub fn clearDepth(self: *@This()) f64 {
        return objc.msgSend(self, "clearDepth", f64, .{});
    }
    /// `-[MTLRenderPassDepthAttachmentDescriptor setClearDepth:]
    pub fn setClearDepth_(self: *@This(), clear_depth: f64) void {
        return objc.msgSend(self, "setClearDepth:", void, .{clear_depth});
    }
    /// `-[MTLRenderPassDepthAttachmentDescriptor depthResolveFilter]
    pub fn depthResolveFilter(self: *@This()) MultisampleDepthResolveFilter {
        return objc.msgSend(self, "depthResolveFilter", MultisampleDepthResolveFilter, .{});
    }
    /// `-[MTLRenderPassDepthAttachmentDescriptor setDepthResolveFilter:]
    pub fn setDepthResolveFilter_(self: *@This(), depth_resolve_filter: MultisampleDepthResolveFilter) void {
        return objc.msgSend(self, "setDepthResolveFilter:", void, .{depth_resolve_filter});
    }
};

/// `MTLRenderPassStencilAttachmentDescriptor`
pub const RenderPassStencilAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), RenderPassAttachmentDescriptor);
    const as = InternalInfo.as;
    /// `+[MTLRenderPassStencilAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassStencilAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassStencilAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassStencilAttachmentDescriptor clearStencil]
    pub fn clearStencil(self: *@This()) u32 {
        return objc.msgSend(self, "clearStencil", u32, .{});
    }
    /// `-[MTLRenderPassStencilAttachmentDescriptor setClearStencil:]
    pub fn setClearStencil_(self: *@This(), clear_stencil: u32) void {
        return objc.msgSend(self, "setClearStencil:", void, .{clear_stencil});
    }
    /// `-[MTLRenderPassStencilAttachmentDescriptor stencilResolveFilter]
    pub fn stencilResolveFilter(self: *@This()) MultisampleStencilResolveFilter {
        return objc.msgSend(self, "stencilResolveFilter", MultisampleStencilResolveFilter, .{});
    }
    /// `-[MTLRenderPassStencilAttachmentDescriptor setStencilResolveFilter:]
    pub fn setStencilResolveFilter_(self: *@This(), stencil_resolve_filter: MultisampleStencilResolveFilter) void {
        return objc.msgSend(self, "setStencilResolveFilter:", void, .{stencil_resolve_filter});
    }
};

/// `MTLRenderPassColorAttachmentDescriptorArray`
pub const RenderPassColorAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRenderPassColorAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassColorAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassColorAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassColorAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *RenderPassColorAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *RenderPassColorAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLRenderPassColorAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*RenderPassColorAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLRenderPassSampleBufferAttachmentDescriptor`
pub const RenderPassSampleBufferAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRenderPassSampleBufferAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassSampleBufferAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassSampleBufferAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor sampleBuffer]
    pub fn sampleBuffer(self: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor setSampleBuffer:]
    pub fn setSampleBuffer_(self: *@This(), sample_buffer: ?*CounterSampleBuffer) void {
        return objc.msgSend(self, "setSampleBuffer:", void, .{sample_buffer});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor startOfVertexSampleIndex]
    pub fn startOfVertexSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "startOfVertexSampleIndex", usize, .{});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor setStartOfVertexSampleIndex:]
    pub fn setStartOfVertexSampleIndex_(self: *@This(), start_of_vertex_sample_index: usize) void {
        return objc.msgSend(self, "setStartOfVertexSampleIndex:", void, .{start_of_vertex_sample_index});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor endOfVertexSampleIndex]
    pub fn endOfVertexSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "endOfVertexSampleIndex", usize, .{});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor setEndOfVertexSampleIndex:]
    pub fn setEndOfVertexSampleIndex_(self: *@This(), end_of_vertex_sample_index: usize) void {
        return objc.msgSend(self, "setEndOfVertexSampleIndex:", void, .{end_of_vertex_sample_index});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor startOfFragmentSampleIndex]
    pub fn startOfFragmentSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "startOfFragmentSampleIndex", usize, .{});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor setStartOfFragmentSampleIndex:]
    pub fn setStartOfFragmentSampleIndex_(self: *@This(), start_of_fragment_sample_index: usize) void {
        return objc.msgSend(self, "setStartOfFragmentSampleIndex:", void, .{start_of_fragment_sample_index});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor endOfFragmentSampleIndex]
    pub fn endOfFragmentSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "endOfFragmentSampleIndex", usize, .{});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptor setEndOfFragmentSampleIndex:]
    pub fn setEndOfFragmentSampleIndex_(self: *@This(), end_of_fragment_sample_index: usize) void {
        return objc.msgSend(self, "setEndOfFragmentSampleIndex:", void, .{end_of_fragment_sample_index});
    }
};

/// `MTLRenderPassSampleBufferAttachmentDescriptorArray`
pub const RenderPassSampleBufferAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRenderPassSampleBufferAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassSampleBufferAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassSampleBufferAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *RenderPassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *RenderPassSampleBufferAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLRenderPassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*RenderPassSampleBufferAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLRenderPassDescriptor`
pub const RenderPassDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRenderPassDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPassDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPassDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLRenderPassDescriptor renderPassDescriptor]
    pub fn renderPassDescriptor() *RenderPassDescriptor {
        return objc.msgSend(InternalInfo.class(), "renderPassDescriptor", *RenderPassDescriptor, .{});
    }
    /// `-[MTLRenderPassDescriptor setSamplePositions:count:]
    pub fn setSamplePositions_count_(self: *@This(), positions: ?*const SamplePosition, count: usize) void {
        return objc.msgSend(self, "setSamplePositions:count:", void, .{ positions, count });
    }
    /// `-[MTLRenderPassDescriptor getSamplePositions:count:]
    pub fn getSamplePositions_count_(self: *@This(), positions: ?*SamplePosition, count: usize) usize {
        return objc.msgSend(self, "getSamplePositions:count:", usize, .{ positions, count });
    }
    /// `-[MTLRenderPassDescriptor colorAttachments]
    pub fn colorAttachments(self: *@This()) *RenderPassColorAttachmentDescriptorArray {
        return objc.msgSend(self, "colorAttachments", *RenderPassColorAttachmentDescriptorArray, .{});
    }
    /// `-[MTLRenderPassDescriptor depthAttachment]
    pub fn depthAttachment(self: *@This()) *RenderPassDepthAttachmentDescriptor {
        return objc.msgSend(self, "depthAttachment", *RenderPassDepthAttachmentDescriptor, .{});
    }
    /// `-[MTLRenderPassDescriptor setDepthAttachment:]
    pub fn setDepthAttachment_(self: *@This(), depth_attachment: ?*RenderPassDepthAttachmentDescriptor) void {
        return objc.msgSend(self, "setDepthAttachment:", void, .{depth_attachment});
    }
    /// `-[MTLRenderPassDescriptor stencilAttachment]
    pub fn stencilAttachment(self: *@This()) *RenderPassStencilAttachmentDescriptor {
        return objc.msgSend(self, "stencilAttachment", *RenderPassStencilAttachmentDescriptor, .{});
    }
    /// `-[MTLRenderPassDescriptor setStencilAttachment:]
    pub fn setStencilAttachment_(self: *@This(), stencil_attachment: ?*RenderPassStencilAttachmentDescriptor) void {
        return objc.msgSend(self, "setStencilAttachment:", void, .{stencil_attachment});
    }
    /// `-[MTLRenderPassDescriptor visibilityResultBuffer]
    pub fn visibilityResultBuffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "visibilityResultBuffer", ?*Buffer, .{});
    }
    /// `-[MTLRenderPassDescriptor setVisibilityResultBuffer:]
    pub fn setVisibilityResultBuffer_(self: *@This(), visibility_result_buffer: ?*Buffer) void {
        return objc.msgSend(self, "setVisibilityResultBuffer:", void, .{visibility_result_buffer});
    }
    /// `-[MTLRenderPassDescriptor renderTargetArrayLength]
    pub fn renderTargetArrayLength(self: *@This()) usize {
        return objc.msgSend(self, "renderTargetArrayLength", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setRenderTargetArrayLength:]
    pub fn setRenderTargetArrayLength_(self: *@This(), render_target_array_length: usize) void {
        return objc.msgSend(self, "setRenderTargetArrayLength:", void, .{render_target_array_length});
    }
    /// `-[MTLRenderPassDescriptor imageblockSampleLength]
    pub fn imageblockSampleLength(self: *@This()) usize {
        return objc.msgSend(self, "imageblockSampleLength", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setImageblockSampleLength:]
    pub fn setImageblockSampleLength_(self: *@This(), imageblock_sample_length: usize) void {
        return objc.msgSend(self, "setImageblockSampleLength:", void, .{imageblock_sample_length});
    }
    /// `-[MTLRenderPassDescriptor threadgroupMemoryLength]
    pub fn threadgroupMemoryLength(self: *@This()) usize {
        return objc.msgSend(self, "threadgroupMemoryLength", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setThreadgroupMemoryLength:]
    pub fn setThreadgroupMemoryLength_(self: *@This(), threadgroup_memory_length: usize) void {
        return objc.msgSend(self, "setThreadgroupMemoryLength:", void, .{threadgroup_memory_length});
    }
    /// `-[MTLRenderPassDescriptor tileWidth]
    pub fn tileWidth(self: *@This()) usize {
        return objc.msgSend(self, "tileWidth", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setTileWidth:]
    pub fn setTileWidth_(self: *@This(), tile_width: usize) void {
        return objc.msgSend(self, "setTileWidth:", void, .{tile_width});
    }
    /// `-[MTLRenderPassDescriptor tileHeight]
    pub fn tileHeight(self: *@This()) usize {
        return objc.msgSend(self, "tileHeight", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setTileHeight:]
    pub fn setTileHeight_(self: *@This(), tile_height: usize) void {
        return objc.msgSend(self, "setTileHeight:", void, .{tile_height});
    }
    /// `-[MTLRenderPassDescriptor defaultRasterSampleCount]
    pub fn defaultRasterSampleCount(self: *@This()) usize {
        return objc.msgSend(self, "defaultRasterSampleCount", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setDefaultRasterSampleCount:]
    pub fn setDefaultRasterSampleCount_(self: *@This(), default_raster_sample_count: usize) void {
        return objc.msgSend(self, "setDefaultRasterSampleCount:", void, .{default_raster_sample_count});
    }
    /// `-[MTLRenderPassDescriptor renderTargetWidth]
    pub fn renderTargetWidth(self: *@This()) usize {
        return objc.msgSend(self, "renderTargetWidth", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setRenderTargetWidth:]
    pub fn setRenderTargetWidth_(self: *@This(), render_target_width: usize) void {
        return objc.msgSend(self, "setRenderTargetWidth:", void, .{render_target_width});
    }
    /// `-[MTLRenderPassDescriptor renderTargetHeight]
    pub fn renderTargetHeight(self: *@This()) usize {
        return objc.msgSend(self, "renderTargetHeight", usize, .{});
    }
    /// `-[MTLRenderPassDescriptor setRenderTargetHeight:]
    pub fn setRenderTargetHeight_(self: *@This(), render_target_height: usize) void {
        return objc.msgSend(self, "setRenderTargetHeight:", void, .{render_target_height});
    }
    /// `-[MTLRenderPassDescriptor rasterizationRateMap]
    pub fn rasterizationRateMap(self: *@This()) ?*RasterizationRateMap {
        return objc.msgSend(self, "rasterizationRateMap", ?*RasterizationRateMap, .{});
    }
    /// `-[MTLRenderPassDescriptor setRasterizationRateMap:]
    pub fn setRasterizationRateMap_(self: *@This(), rasterization_rate_map: ?*RasterizationRateMap) void {
        return objc.msgSend(self, "setRasterizationRateMap:", void, .{rasterization_rate_map});
    }
    /// `-[MTLRenderPassDescriptor sampleBufferAttachments]
    pub fn sampleBufferAttachments(self: *@This()) *RenderPassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self, "sampleBufferAttachments", *RenderPassSampleBufferAttachmentDescriptorArray, .{});
    }
};

/// `MTLRenderPipelineColorAttachmentDescriptor`
pub const RenderPipelineColorAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRenderPipelineColorAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPipelineColorAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPipelineColorAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPipelineColorAttachmentDescriptor pixelFormat]
    pub fn pixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "pixelFormat", PixelFormat, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setPixelFormat:]
    pub fn setPixelFormat_(self: *@This(), pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setPixelFormat:", void, .{pixel_format});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor isBlendingEnabled]
    pub fn isBlendingEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isBlendingEnabled", bool, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setBlendingEnabled:]
    pub fn setBlendingEnabled_(self: *@This(), blending_enabled: bool) void {
        return objc.msgSend(self, "setBlendingEnabled:", void, .{blending_enabled});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor sourceRGBBlendFactor]
    pub fn sourceRGBBlendFactor(self: *@This()) BlendFactor {
        return objc.msgSend(self, "sourceRGBBlendFactor", BlendFactor, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setSourceRGBBlendFactor:]
    pub fn setSourceRGBBlendFactor_(self: *@This(), source_rgbblend_factor: BlendFactor) void {
        return objc.msgSend(self, "setSourceRGBBlendFactor:", void, .{source_rgbblend_factor});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor destinationRGBBlendFactor]
    pub fn destinationRGBBlendFactor(self: *@This()) BlendFactor {
        return objc.msgSend(self, "destinationRGBBlendFactor", BlendFactor, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setDestinationRGBBlendFactor:]
    pub fn setDestinationRGBBlendFactor_(self: *@This(), destination_rgbblend_factor: BlendFactor) void {
        return objc.msgSend(self, "setDestinationRGBBlendFactor:", void, .{destination_rgbblend_factor});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor rgbBlendOperation]
    pub fn rgbBlendOperation(self: *@This()) BlendOperation {
        return objc.msgSend(self, "rgbBlendOperation", BlendOperation, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setRgbBlendOperation:]
    pub fn setRgbBlendOperation_(self: *@This(), rgb_blend_operation: BlendOperation) void {
        return objc.msgSend(self, "setRgbBlendOperation:", void, .{rgb_blend_operation});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor sourceAlphaBlendFactor]
    pub fn sourceAlphaBlendFactor(self: *@This()) BlendFactor {
        return objc.msgSend(self, "sourceAlphaBlendFactor", BlendFactor, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setSourceAlphaBlendFactor:]
    pub fn setSourceAlphaBlendFactor_(self: *@This(), source_alpha_blend_factor: BlendFactor) void {
        return objc.msgSend(self, "setSourceAlphaBlendFactor:", void, .{source_alpha_blend_factor});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor destinationAlphaBlendFactor]
    pub fn destinationAlphaBlendFactor(self: *@This()) BlendFactor {
        return objc.msgSend(self, "destinationAlphaBlendFactor", BlendFactor, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setDestinationAlphaBlendFactor:]
    pub fn setDestinationAlphaBlendFactor_(self: *@This(), destination_alpha_blend_factor: BlendFactor) void {
        return objc.msgSend(self, "setDestinationAlphaBlendFactor:", void, .{destination_alpha_blend_factor});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor alphaBlendOperation]
    pub fn alphaBlendOperation(self: *@This()) BlendOperation {
        return objc.msgSend(self, "alphaBlendOperation", BlendOperation, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setAlphaBlendOperation:]
    pub fn setAlphaBlendOperation_(self: *@This(), alpha_blend_operation: BlendOperation) void {
        return objc.msgSend(self, "setAlphaBlendOperation:", void, .{alpha_blend_operation});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor writeMask]
    pub fn writeMask(self: *@This()) ColorWriteMask {
        return objc.msgSend(self, "writeMask", ColorWriteMask, .{});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptor setWriteMask:]
    pub fn setWriteMask_(self: *@This(), write_mask: ColorWriteMask) void {
        return objc.msgSend(self, "setWriteMask:", void, .{write_mask});
    }
};

/// `MTLRenderPipelineReflection`
pub const RenderPipelineReflection = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRenderPipelineReflection new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPipelineReflection alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPipelineReflection alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPipelineReflection vertexBindings]
    pub fn vertexBindings(self: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self, "vertexBindings", *ns.Array(*Binding), .{});
    }
    /// `-[MTLRenderPipelineReflection fragmentBindings]
    pub fn fragmentBindings(self: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self, "fragmentBindings", *ns.Array(*Binding), .{});
    }
    /// `-[MTLRenderPipelineReflection tileBindings]
    pub fn tileBindings(self: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self, "tileBindings", *ns.Array(*Binding), .{});
    }
    /// `-[MTLRenderPipelineReflection objectBindings]
    pub fn objectBindings(self: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self, "objectBindings", *ns.Array(*Binding), .{});
    }
    /// `-[MTLRenderPipelineReflection meshBindings]
    pub fn meshBindings(self: *@This()) *ns.Array(*Binding) {
        return objc.msgSend(self, "meshBindings", *ns.Array(*Binding), .{});
    }
    /// `-[MTLRenderPipelineReflection vertexArguments]
    pub fn vertexArguments(self: *@This()) ?*ns.Array(*Argument) {
        return objc.msgSend(self, "vertexArguments", ?*ns.Array(*Argument), .{});
    }
    /// `-[MTLRenderPipelineReflection fragmentArguments]
    pub fn fragmentArguments(self: *@This()) ?*ns.Array(*Argument) {
        return objc.msgSend(self, "fragmentArguments", ?*ns.Array(*Argument), .{});
    }
    /// `-[MTLRenderPipelineReflection tileArguments]
    pub fn tileArguments(self: *@This()) ?*ns.Array(*Argument) {
        return objc.msgSend(self, "tileArguments", ?*ns.Array(*Argument), .{});
    }
};

/// `MTLRenderPipelineDescriptor`
pub const RenderPipelineDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRenderPipelineDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPipelineDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPipelineDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPipelineDescriptor reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLRenderPipelineDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLRenderPipelineDescriptor vertexFunction]
    pub fn vertexFunction(self: *@This()) ?*Function {
        return objc.msgSend(self, "vertexFunction", ?*Function, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setVertexFunction:]
    pub fn setVertexFunction_(self: *@This(), vertex_function: ?*Function) void {
        return objc.msgSend(self, "setVertexFunction:", void, .{vertex_function});
    }
    /// `-[MTLRenderPipelineDescriptor fragmentFunction]
    pub fn fragmentFunction(self: *@This()) ?*Function {
        return objc.msgSend(self, "fragmentFunction", ?*Function, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setFragmentFunction:]
    pub fn setFragmentFunction_(self: *@This(), fragment_function: ?*Function) void {
        return objc.msgSend(self, "setFragmentFunction:", void, .{fragment_function});
    }
    /// `-[MTLRenderPipelineDescriptor vertexDescriptor]
    pub fn vertexDescriptor(self: *@This()) ?*VertexDescriptor {
        return objc.msgSend(self, "vertexDescriptor", ?*VertexDescriptor, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setVertexDescriptor:]
    pub fn setVertexDescriptor_(self: *@This(), vertex_descriptor: ?*VertexDescriptor) void {
        return objc.msgSend(self, "setVertexDescriptor:", void, .{vertex_descriptor});
    }
    /// `-[MTLRenderPipelineDescriptor sampleCount]
    pub fn sampleCount(self: *@This()) usize {
        return objc.msgSend(self, "sampleCount", usize, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setSampleCount:]
    pub fn setSampleCount_(self: *@This(), sample_count: usize) void {
        return objc.msgSend(self, "setSampleCount:", void, .{sample_count});
    }
    /// `-[MTLRenderPipelineDescriptor rasterSampleCount]
    pub fn rasterSampleCount(self: *@This()) usize {
        return objc.msgSend(self, "rasterSampleCount", usize, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setRasterSampleCount:]
    pub fn setRasterSampleCount_(self: *@This(), raster_sample_count: usize) void {
        return objc.msgSend(self, "setRasterSampleCount:", void, .{raster_sample_count});
    }
    /// `-[MTLRenderPipelineDescriptor isAlphaToCoverageEnabled]
    pub fn isAlphaToCoverageEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isAlphaToCoverageEnabled", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setAlphaToCoverageEnabled:]
    pub fn setAlphaToCoverageEnabled_(self: *@This(), alpha_to_coverage_enabled: bool) void {
        return objc.msgSend(self, "setAlphaToCoverageEnabled:", void, .{alpha_to_coverage_enabled});
    }
    /// `-[MTLRenderPipelineDescriptor isAlphaToOneEnabled]
    pub fn isAlphaToOneEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isAlphaToOneEnabled", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setAlphaToOneEnabled:]
    pub fn setAlphaToOneEnabled_(self: *@This(), alpha_to_one_enabled: bool) void {
        return objc.msgSend(self, "setAlphaToOneEnabled:", void, .{alpha_to_one_enabled});
    }
    /// `-[MTLRenderPipelineDescriptor isRasterizationEnabled]
    pub fn isRasterizationEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isRasterizationEnabled", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setRasterizationEnabled:]
    pub fn setRasterizationEnabled_(self: *@This(), rasterization_enabled: bool) void {
        return objc.msgSend(self, "setRasterizationEnabled:", void, .{rasterization_enabled});
    }
    /// `-[MTLRenderPipelineDescriptor maxVertexAmplificationCount]
    pub fn maxVertexAmplificationCount(self: *@This()) usize {
        return objc.msgSend(self, "maxVertexAmplificationCount", usize, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setMaxVertexAmplificationCount:]
    pub fn setMaxVertexAmplificationCount_(self: *@This(), max_vertex_amplification_count: usize) void {
        return objc.msgSend(self, "setMaxVertexAmplificationCount:", void, .{max_vertex_amplification_count});
    }
    /// `-[MTLRenderPipelineDescriptor colorAttachments]
    pub fn colorAttachments(self: *@This()) *RenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(self, "colorAttachments", *RenderPipelineColorAttachmentDescriptorArray, .{});
    }
    /// `-[MTLRenderPipelineDescriptor depthAttachmentPixelFormat]
    pub fn depthAttachmentPixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "depthAttachmentPixelFormat", PixelFormat, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setDepthAttachmentPixelFormat:]
    pub fn setDepthAttachmentPixelFormat_(self: *@This(), depth_attachment_pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setDepthAttachmentPixelFormat:", void, .{depth_attachment_pixel_format});
    }
    /// `-[MTLRenderPipelineDescriptor stencilAttachmentPixelFormat]
    pub fn stencilAttachmentPixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "stencilAttachmentPixelFormat", PixelFormat, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setStencilAttachmentPixelFormat:]
    pub fn setStencilAttachmentPixelFormat_(self: *@This(), stencil_attachment_pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setStencilAttachmentPixelFormat:", void, .{stencil_attachment_pixel_format});
    }
    /// `-[MTLRenderPipelineDescriptor inputPrimitiveTopology]
    pub fn inputPrimitiveTopology(self: *@This()) PrimitiveTopologyClass {
        return objc.msgSend(self, "inputPrimitiveTopology", PrimitiveTopologyClass, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setInputPrimitiveTopology:]
    pub fn setInputPrimitiveTopology_(self: *@This(), input_primitive_topology: PrimitiveTopologyClass) void {
        return objc.msgSend(self, "setInputPrimitiveTopology:", void, .{input_primitive_topology});
    }
    /// `-[MTLRenderPipelineDescriptor tessellationPartitionMode]
    pub fn tessellationPartitionMode(self: *@This()) TessellationPartitionMode {
        return objc.msgSend(self, "tessellationPartitionMode", TessellationPartitionMode, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setTessellationPartitionMode:]
    pub fn setTessellationPartitionMode_(self: *@This(), tessellation_partition_mode: TessellationPartitionMode) void {
        return objc.msgSend(self, "setTessellationPartitionMode:", void, .{tessellation_partition_mode});
    }
    /// `-[MTLRenderPipelineDescriptor maxTessellationFactor]
    pub fn maxTessellationFactor(self: *@This()) usize {
        return objc.msgSend(self, "maxTessellationFactor", usize, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setMaxTessellationFactor:]
    pub fn setMaxTessellationFactor_(self: *@This(), max_tessellation_factor: usize) void {
        return objc.msgSend(self, "setMaxTessellationFactor:", void, .{max_tessellation_factor});
    }
    /// `-[MTLRenderPipelineDescriptor isTessellationFactorScaleEnabled]
    pub fn isTessellationFactorScaleEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isTessellationFactorScaleEnabled", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setTessellationFactorScaleEnabled:]
    pub fn setTessellationFactorScaleEnabled_(self: *@This(), tessellation_factor_scale_enabled: bool) void {
        return objc.msgSend(self, "setTessellationFactorScaleEnabled:", void, .{tessellation_factor_scale_enabled});
    }
    /// `-[MTLRenderPipelineDescriptor tessellationFactorFormat]
    pub fn tessellationFactorFormat(self: *@This()) TessellationFactorFormat {
        return objc.msgSend(self, "tessellationFactorFormat", TessellationFactorFormat, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setTessellationFactorFormat:]
    pub fn setTessellationFactorFormat_(self: *@This(), tessellation_factor_format: TessellationFactorFormat) void {
        return objc.msgSend(self, "setTessellationFactorFormat:", void, .{tessellation_factor_format});
    }
    /// `-[MTLRenderPipelineDescriptor tessellationControlPointIndexType]
    pub fn tessellationControlPointIndexType(self: *@This()) TessellationControlPointIndexType {
        return objc.msgSend(self, "tessellationControlPointIndexType", TessellationControlPointIndexType, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setTessellationControlPointIndexType:]
    pub fn setTessellationControlPointIndexType_(self: *@This(), tessellation_control_point_index_type: TessellationControlPointIndexType) void {
        return objc.msgSend(self, "setTessellationControlPointIndexType:", void, .{tessellation_control_point_index_type});
    }
    /// `-[MTLRenderPipelineDescriptor tessellationFactorStepFunction]
    pub fn tessellationFactorStepFunction(self: *@This()) TessellationFactorStepFunction {
        return objc.msgSend(self, "tessellationFactorStepFunction", TessellationFactorStepFunction, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setTessellationFactorStepFunction:]
    pub fn setTessellationFactorStepFunction_(self: *@This(), tessellation_factor_step_function: TessellationFactorStepFunction) void {
        return objc.msgSend(self, "setTessellationFactorStepFunction:", void, .{tessellation_factor_step_function});
    }
    /// `-[MTLRenderPipelineDescriptor tessellationOutputWindingOrder]
    pub fn tessellationOutputWindingOrder(self: *@This()) Winding {
        return objc.msgSend(self, "tessellationOutputWindingOrder", Winding, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setTessellationOutputWindingOrder:]
    pub fn setTessellationOutputWindingOrder_(self: *@This(), tessellation_output_winding_order: Winding) void {
        return objc.msgSend(self, "setTessellationOutputWindingOrder:", void, .{tessellation_output_winding_order});
    }
    /// `-[MTLRenderPipelineDescriptor vertexBuffers]
    pub fn vertexBuffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "vertexBuffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLRenderPipelineDescriptor fragmentBuffers]
    pub fn fragmentBuffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "fragmentBuffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLRenderPipelineDescriptor supportIndirectCommandBuffers]
    pub fn supportIndirectCommandBuffers(self: *@This()) bool {
        return objc.msgSend(self, "supportIndirectCommandBuffers", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setSupportIndirectCommandBuffers:]
    pub fn setSupportIndirectCommandBuffers_(self: *@This(), support_indirect_command_buffers: bool) void {
        return objc.msgSend(self, "setSupportIndirectCommandBuffers:", void, .{support_indirect_command_buffers});
    }
    /// `-[MTLRenderPipelineDescriptor binaryArchives]
    pub fn binaryArchives(self: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    /// `-[MTLRenderPipelineDescriptor setBinaryArchives:]
    pub fn setBinaryArchives_(self: *@This(), binary_archives: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self, "setBinaryArchives:", void, .{binary_archives});
    }
    /// `-[MTLRenderPipelineDescriptor vertexPreloadedLibraries]
    pub fn vertexPreloadedLibraries(self: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self, "vertexPreloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    /// `-[MTLRenderPipelineDescriptor setVertexPreloadedLibraries:]
    pub fn setVertexPreloadedLibraries_(self: *@This(), vertex_preloaded_libraries: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self, "setVertexPreloadedLibraries:", void, .{vertex_preloaded_libraries});
    }
    /// `-[MTLRenderPipelineDescriptor fragmentPreloadedLibraries]
    pub fn fragmentPreloadedLibraries(self: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self, "fragmentPreloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    /// `-[MTLRenderPipelineDescriptor setFragmentPreloadedLibraries:]
    pub fn setFragmentPreloadedLibraries_(self: *@This(), fragment_preloaded_libraries: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self, "setFragmentPreloadedLibraries:", void, .{fragment_preloaded_libraries});
    }
    /// `-[MTLRenderPipelineDescriptor vertexLinkedFunctions]
    pub fn vertexLinkedFunctions(self: *@This()) *LinkedFunctions {
        return objc.msgSend(self, "vertexLinkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setVertexLinkedFunctions:]
    pub fn setVertexLinkedFunctions_(self: *@This(), vertex_linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setVertexLinkedFunctions:", void, .{vertex_linked_functions});
    }
    /// `-[MTLRenderPipelineDescriptor fragmentLinkedFunctions]
    pub fn fragmentLinkedFunctions(self: *@This()) *LinkedFunctions {
        return objc.msgSend(self, "fragmentLinkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setFragmentLinkedFunctions:]
    pub fn setFragmentLinkedFunctions_(self: *@This(), fragment_linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setFragmentLinkedFunctions:", void, .{fragment_linked_functions});
    }
    /// `-[MTLRenderPipelineDescriptor supportAddingVertexBinaryFunctions]
    pub fn supportAddingVertexBinaryFunctions(self: *@This()) bool {
        return objc.msgSend(self, "supportAddingVertexBinaryFunctions", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setSupportAddingVertexBinaryFunctions:]
    pub fn setSupportAddingVertexBinaryFunctions_(self: *@This(), support_adding_vertex_binary_functions: bool) void {
        return objc.msgSend(self, "setSupportAddingVertexBinaryFunctions:", void, .{support_adding_vertex_binary_functions});
    }
    /// `-[MTLRenderPipelineDescriptor supportAddingFragmentBinaryFunctions]
    pub fn supportAddingFragmentBinaryFunctions(self: *@This()) bool {
        return objc.msgSend(self, "supportAddingFragmentBinaryFunctions", bool, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setSupportAddingFragmentBinaryFunctions:]
    pub fn setSupportAddingFragmentBinaryFunctions_(self: *@This(), support_adding_fragment_binary_functions: bool) void {
        return objc.msgSend(self, "setSupportAddingFragmentBinaryFunctions:", void, .{support_adding_fragment_binary_functions});
    }
    /// `-[MTLRenderPipelineDescriptor maxVertexCallStackDepth]
    pub fn maxVertexCallStackDepth(self: *@This()) usize {
        return objc.msgSend(self, "maxVertexCallStackDepth", usize, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setMaxVertexCallStackDepth:]
    pub fn setMaxVertexCallStackDepth_(self: *@This(), max_vertex_call_stack_depth: usize) void {
        return objc.msgSend(self, "setMaxVertexCallStackDepth:", void, .{max_vertex_call_stack_depth});
    }
    /// `-[MTLRenderPipelineDescriptor maxFragmentCallStackDepth]
    pub fn maxFragmentCallStackDepth(self: *@This()) usize {
        return objc.msgSend(self, "maxFragmentCallStackDepth", usize, .{});
    }
    /// `-[MTLRenderPipelineDescriptor setMaxFragmentCallStackDepth:]
    pub fn setMaxFragmentCallStackDepth_(self: *@This(), max_fragment_call_stack_depth: usize) void {
        return objc.msgSend(self, "setMaxFragmentCallStackDepth:", void, .{max_fragment_call_stack_depth});
    }
};

/// `MTLRenderPipelineFunctionsDescriptor`
pub const RenderPipelineFunctionsDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLRenderPipelineFunctionsDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPipelineFunctionsDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPipelineFunctionsDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPipelineFunctionsDescriptor vertexAdditionalBinaryFunctions]
    pub fn vertexAdditionalBinaryFunctions(self: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self, "vertexAdditionalBinaryFunctions", ?*ns.Array(*Function), .{});
    }
    /// `-[MTLRenderPipelineFunctionsDescriptor setVertexAdditionalBinaryFunctions:]
    pub fn setVertexAdditionalBinaryFunctions_(self: *@This(), vertex_additional_binary_functions: ?*ns.Array(*Function)) void {
        return objc.msgSend(self, "setVertexAdditionalBinaryFunctions:", void, .{vertex_additional_binary_functions});
    }
    /// `-[MTLRenderPipelineFunctionsDescriptor fragmentAdditionalBinaryFunctions]
    pub fn fragmentAdditionalBinaryFunctions(self: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self, "fragmentAdditionalBinaryFunctions", ?*ns.Array(*Function), .{});
    }
    /// `-[MTLRenderPipelineFunctionsDescriptor setFragmentAdditionalBinaryFunctions:]
    pub fn setFragmentAdditionalBinaryFunctions_(self: *@This(), fragment_additional_binary_functions: ?*ns.Array(*Function)) void {
        return objc.msgSend(self, "setFragmentAdditionalBinaryFunctions:", void, .{fragment_additional_binary_functions});
    }
    /// `-[MTLRenderPipelineFunctionsDescriptor tileAdditionalBinaryFunctions]
    pub fn tileAdditionalBinaryFunctions(self: *@This()) ?*ns.Array(*Function) {
        return objc.msgSend(self, "tileAdditionalBinaryFunctions", ?*ns.Array(*Function), .{});
    }
    /// `-[MTLRenderPipelineFunctionsDescriptor setTileAdditionalBinaryFunctions:]
    pub fn setTileAdditionalBinaryFunctions_(self: *@This(), tile_additional_binary_functions: ?*ns.Array(*Function)) void {
        return objc.msgSend(self, "setTileAdditionalBinaryFunctions:", void, .{tile_additional_binary_functions});
    }
};

/// `MTLRenderPipelineState`
pub const RenderPipelineState = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLRenderPipelineState imageblockMemoryLengthForDimensions:]
    pub fn imageblockMemoryLengthForDimensions_(self: *@This(), imageblock_dimensions: Size) usize {
        return objc.msgSend(self, "imageblockMemoryLengthForDimensions:", usize, .{imageblock_dimensions});
    }
    /// `-[MTLRenderPipelineState functionHandleWithFunction:stage:]
    pub fn functionHandleWithFunction_stage_(self: *@This(), function: *Function, stage: RenderStages) ?*FunctionHandle {
        return objc.msgSend(self, "functionHandleWithFunction:stage:", ?*FunctionHandle, .{ function, stage });
    }
    /// `-[MTLRenderPipelineState newVisibleFunctionTableWithDescriptor:stage:]
    pub fn newVisibleFunctionTableWithDescriptor_stage_(self: *@This(), descriptor: *VisibleFunctionTableDescriptor, stage: RenderStages) ?*VisibleFunctionTable {
        return objc.msgSend(self, "newVisibleFunctionTableWithDescriptor:stage:", ?*VisibleFunctionTable, .{ descriptor, stage });
    }
    /// `-[MTLRenderPipelineState newIntersectionFunctionTableWithDescriptor:stage:]
    pub fn newIntersectionFunctionTableWithDescriptor_stage_(self: *@This(), descriptor: *IntersectionFunctionTableDescriptor, stage: RenderStages) ?*IntersectionFunctionTable {
        return objc.msgSend(self, "newIntersectionFunctionTableWithDescriptor:stage:", ?*IntersectionFunctionTable, .{ descriptor, stage });
    }
    /// `-[MTLRenderPipelineState newRenderPipelineStateWithAdditionalBinaryFunctions:error:]
    pub fn newRenderPipelineStateWithAdditionalBinaryFunctions_error_(self: *@This(), additional_binary_functions: *RenderPipelineFunctionsDescriptor, err: ?*?*ns.Error) ?*RenderPipelineState {
        return objc.msgSend(self, "newRenderPipelineStateWithAdditionalBinaryFunctions:error:", ?*RenderPipelineState, .{ additional_binary_functions, err });
    }
    /// `-[MTLRenderPipelineState label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLRenderPipelineState device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLRenderPipelineState maxTotalThreadsPerThreadgroup]
    pub fn maxTotalThreadsPerThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerThreadgroup", usize, .{});
    }
    /// `-[MTLRenderPipelineState threadgroupSizeMatchesTileSize]
    pub fn threadgroupSizeMatchesTileSize(self: *@This()) bool {
        return objc.msgSend(self, "threadgroupSizeMatchesTileSize", bool, .{});
    }
    /// `-[MTLRenderPipelineState imageblockSampleLength]
    pub fn imageblockSampleLength(self: *@This()) usize {
        return objc.msgSend(self, "imageblockSampleLength", usize, .{});
    }
    /// `-[MTLRenderPipelineState supportIndirectCommandBuffers]
    pub fn supportIndirectCommandBuffers(self: *@This()) bool {
        return objc.msgSend(self, "supportIndirectCommandBuffers", bool, .{});
    }
    /// `-[MTLRenderPipelineState maxTotalThreadsPerObjectThreadgroup]
    pub fn maxTotalThreadsPerObjectThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerObjectThreadgroup", usize, .{});
    }
    /// `-[MTLRenderPipelineState maxTotalThreadsPerMeshThreadgroup]
    pub fn maxTotalThreadsPerMeshThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerMeshThreadgroup", usize, .{});
    }
    /// `-[MTLRenderPipelineState objectThreadExecutionWidth]
    pub fn objectThreadExecutionWidth(self: *@This()) usize {
        return objc.msgSend(self, "objectThreadExecutionWidth", usize, .{});
    }
    /// `-[MTLRenderPipelineState meshThreadExecutionWidth]
    pub fn meshThreadExecutionWidth(self: *@This()) usize {
        return objc.msgSend(self, "meshThreadExecutionWidth", usize, .{});
    }
    /// `-[MTLRenderPipelineState maxTotalThreadgroupsPerMeshGrid]
    pub fn maxTotalThreadgroupsPerMeshGrid(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadgroupsPerMeshGrid", usize, .{});
    }
    /// `-[MTLRenderPipelineState gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};

/// `MTLRenderPipelineColorAttachmentDescriptorArray`
pub const RenderPipelineColorAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLRenderPipelineColorAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLRenderPipelineColorAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLRenderPipelineColorAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLRenderPipelineColorAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *RenderPipelineColorAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *RenderPipelineColorAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLRenderPipelineColorAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*RenderPipelineColorAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLTileRenderPipelineColorAttachmentDescriptor`
pub const TileRenderPipelineColorAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLTileRenderPipelineColorAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLTileRenderPipelineColorAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLTileRenderPipelineColorAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLTileRenderPipelineColorAttachmentDescriptor pixelFormat]
    pub fn pixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "pixelFormat", PixelFormat, .{});
    }
    /// `-[MTLTileRenderPipelineColorAttachmentDescriptor setPixelFormat:]
    pub fn setPixelFormat_(self: *@This(), pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setPixelFormat:", void, .{pixel_format});
    }
};

/// `MTLTileRenderPipelineColorAttachmentDescriptorArray`
pub const TileRenderPipelineColorAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLTileRenderPipelineColorAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLTileRenderPipelineColorAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLTileRenderPipelineColorAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLTileRenderPipelineColorAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *TileRenderPipelineColorAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *TileRenderPipelineColorAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLTileRenderPipelineColorAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: *TileRenderPipelineColorAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLTileRenderPipelineDescriptor`
pub const TileRenderPipelineDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLTileRenderPipelineDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLTileRenderPipelineDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLTileRenderPipelineDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLTileRenderPipelineDescriptor reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLTileRenderPipelineDescriptor tileFunction]
    pub fn tileFunction(self: *@This()) *Function {
        return objc.msgSend(self, "tileFunction", *Function, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setTileFunction:]
    pub fn setTileFunction_(self: *@This(), tile_function: *Function) void {
        return objc.msgSend(self, "setTileFunction:", void, .{tile_function});
    }
    /// `-[MTLTileRenderPipelineDescriptor rasterSampleCount]
    pub fn rasterSampleCount(self: *@This()) usize {
        return objc.msgSend(self, "rasterSampleCount", usize, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setRasterSampleCount:]
    pub fn setRasterSampleCount_(self: *@This(), raster_sample_count: usize) void {
        return objc.msgSend(self, "setRasterSampleCount:", void, .{raster_sample_count});
    }
    /// `-[MTLTileRenderPipelineDescriptor colorAttachments]
    pub fn colorAttachments(self: *@This()) *TileRenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(self, "colorAttachments", *TileRenderPipelineColorAttachmentDescriptorArray, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor threadgroupSizeMatchesTileSize]
    pub fn threadgroupSizeMatchesTileSize(self: *@This()) bool {
        return objc.msgSend(self, "threadgroupSizeMatchesTileSize", bool, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setThreadgroupSizeMatchesTileSize:]
    pub fn setThreadgroupSizeMatchesTileSize_(self: *@This(), threadgroup_size_matches_tile_size: bool) void {
        return objc.msgSend(self, "setThreadgroupSizeMatchesTileSize:", void, .{threadgroup_size_matches_tile_size});
    }
    /// `-[MTLTileRenderPipelineDescriptor tileBuffers]
    pub fn tileBuffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "tileBuffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor maxTotalThreadsPerThreadgroup]
    pub fn maxTotalThreadsPerThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerThreadgroup", usize, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setMaxTotalThreadsPerThreadgroup:]
    pub fn setMaxTotalThreadsPerThreadgroup_(self: *@This(), max_total_threads_per_threadgroup: usize) void {
        return objc.msgSend(self, "setMaxTotalThreadsPerThreadgroup:", void, .{max_total_threads_per_threadgroup});
    }
    /// `-[MTLTileRenderPipelineDescriptor binaryArchives]
    pub fn binaryArchives(self: *@This()) ?*ns.Array(*BinaryArchive) {
        return objc.msgSend(self, "binaryArchives", ?*ns.Array(*BinaryArchive), .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setBinaryArchives:]
    pub fn setBinaryArchives_(self: *@This(), binary_archives: ?*ns.Array(*BinaryArchive)) void {
        return objc.msgSend(self, "setBinaryArchives:", void, .{binary_archives});
    }
    /// `-[MTLTileRenderPipelineDescriptor preloadedLibraries]
    pub fn preloadedLibraries(self: *@This()) *ns.Array(*DynamicLibrary) {
        return objc.msgSend(self, "preloadedLibraries", *ns.Array(*DynamicLibrary), .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setPreloadedLibraries:]
    pub fn setPreloadedLibraries_(self: *@This(), preloaded_libraries: *ns.Array(*DynamicLibrary)) void {
        return objc.msgSend(self, "setPreloadedLibraries:", void, .{preloaded_libraries});
    }
    /// `-[MTLTileRenderPipelineDescriptor linkedFunctions]
    pub fn linkedFunctions(self: *@This()) *LinkedFunctions {
        return objc.msgSend(self, "linkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setLinkedFunctions:]
    pub fn setLinkedFunctions_(self: *@This(), linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setLinkedFunctions:", void, .{linked_functions});
    }
    /// `-[MTLTileRenderPipelineDescriptor supportAddingBinaryFunctions]
    pub fn supportAddingBinaryFunctions(self: *@This()) bool {
        return objc.msgSend(self, "supportAddingBinaryFunctions", bool, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setSupportAddingBinaryFunctions:]
    pub fn setSupportAddingBinaryFunctions_(self: *@This(), support_adding_binary_functions: bool) void {
        return objc.msgSend(self, "setSupportAddingBinaryFunctions:", void, .{support_adding_binary_functions});
    }
    /// `-[MTLTileRenderPipelineDescriptor maxCallStackDepth]
    pub fn maxCallStackDepth(self: *@This()) usize {
        return objc.msgSend(self, "maxCallStackDepth", usize, .{});
    }
    /// `-[MTLTileRenderPipelineDescriptor setMaxCallStackDepth:]
    pub fn setMaxCallStackDepth_(self: *@This(), max_call_stack_depth: usize) void {
        return objc.msgSend(self, "setMaxCallStackDepth:", void, .{max_call_stack_depth});
    }
};

/// `MTLMeshRenderPipelineDescriptor`
pub const MeshRenderPipelineDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLMeshRenderPipelineDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLMeshRenderPipelineDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLMeshRenderPipelineDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLMeshRenderPipelineDescriptor reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLMeshRenderPipelineDescriptor objectFunction]
    pub fn objectFunction(self: *@This()) ?*Function {
        return objc.msgSend(self, "objectFunction", ?*Function, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setObjectFunction:]
    pub fn setObjectFunction_(self: *@This(), object_function: ?*Function) void {
        return objc.msgSend(self, "setObjectFunction:", void, .{object_function});
    }
    /// `-[MTLMeshRenderPipelineDescriptor meshFunction]
    pub fn meshFunction(self: *@This()) ?*Function {
        return objc.msgSend(self, "meshFunction", ?*Function, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMeshFunction:]
    pub fn setMeshFunction_(self: *@This(), mesh_function: ?*Function) void {
        return objc.msgSend(self, "setMeshFunction:", void, .{mesh_function});
    }
    /// `-[MTLMeshRenderPipelineDescriptor fragmentFunction]
    pub fn fragmentFunction(self: *@This()) ?*Function {
        return objc.msgSend(self, "fragmentFunction", ?*Function, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setFragmentFunction:]
    pub fn setFragmentFunction_(self: *@This(), fragment_function: ?*Function) void {
        return objc.msgSend(self, "setFragmentFunction:", void, .{fragment_function});
    }
    /// `-[MTLMeshRenderPipelineDescriptor maxTotalThreadsPerObjectThreadgroup]
    pub fn maxTotalThreadsPerObjectThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerObjectThreadgroup", usize, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMaxTotalThreadsPerObjectThreadgroup:]
    pub fn setMaxTotalThreadsPerObjectThreadgroup_(self: *@This(), max_total_threads_per_object_threadgroup: usize) void {
        return objc.msgSend(self, "setMaxTotalThreadsPerObjectThreadgroup:", void, .{max_total_threads_per_object_threadgroup});
    }
    /// `-[MTLMeshRenderPipelineDescriptor maxTotalThreadsPerMeshThreadgroup]
    pub fn maxTotalThreadsPerMeshThreadgroup(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadsPerMeshThreadgroup", usize, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMaxTotalThreadsPerMeshThreadgroup:]
    pub fn setMaxTotalThreadsPerMeshThreadgroup_(self: *@This(), max_total_threads_per_mesh_threadgroup: usize) void {
        return objc.msgSend(self, "setMaxTotalThreadsPerMeshThreadgroup:", void, .{max_total_threads_per_mesh_threadgroup});
    }
    /// `-[MTLMeshRenderPipelineDescriptor objectThreadgroupSizeIsMultipleOfThreadExecutionWidth]
    pub fn objectThreadgroupSizeIsMultipleOfThreadExecutionWidth(self: *@This()) bool {
        return objc.msgSend(self, "objectThreadgroupSizeIsMultipleOfThreadExecutionWidth", bool, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:]
    pub fn setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_(self: *@This(), object_threadgroup_size_is_multiple_of_thread_execution_width: bool) void {
        return objc.msgSend(self, "setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:", void, .{object_threadgroup_size_is_multiple_of_thread_execution_width});
    }
    /// `-[MTLMeshRenderPipelineDescriptor meshThreadgroupSizeIsMultipleOfThreadExecutionWidth]
    pub fn meshThreadgroupSizeIsMultipleOfThreadExecutionWidth(self: *@This()) bool {
        return objc.msgSend(self, "meshThreadgroupSizeIsMultipleOfThreadExecutionWidth", bool, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:]
    pub fn setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_(self: *@This(), mesh_threadgroup_size_is_multiple_of_thread_execution_width: bool) void {
        return objc.msgSend(self, "setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:", void, .{mesh_threadgroup_size_is_multiple_of_thread_execution_width});
    }
    /// `-[MTLMeshRenderPipelineDescriptor payloadMemoryLength]
    pub fn payloadMemoryLength(self: *@This()) usize {
        return objc.msgSend(self, "payloadMemoryLength", usize, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setPayloadMemoryLength:]
    pub fn setPayloadMemoryLength_(self: *@This(), payload_memory_length: usize) void {
        return objc.msgSend(self, "setPayloadMemoryLength:", void, .{payload_memory_length});
    }
    /// `-[MTLMeshRenderPipelineDescriptor maxTotalThreadgroupsPerMeshGrid]
    pub fn maxTotalThreadgroupsPerMeshGrid(self: *@This()) usize {
        return objc.msgSend(self, "maxTotalThreadgroupsPerMeshGrid", usize, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMaxTotalThreadgroupsPerMeshGrid:]
    pub fn setMaxTotalThreadgroupsPerMeshGrid_(self: *@This(), max_total_threadgroups_per_mesh_grid: usize) void {
        return objc.msgSend(self, "setMaxTotalThreadgroupsPerMeshGrid:", void, .{max_total_threadgroups_per_mesh_grid});
    }
    /// `-[MTLMeshRenderPipelineDescriptor objectBuffers]
    pub fn objectBuffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "objectBuffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor meshBuffers]
    pub fn meshBuffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "meshBuffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor fragmentBuffers]
    pub fn fragmentBuffers(self: *@This()) *PipelineBufferDescriptorArray {
        return objc.msgSend(self, "fragmentBuffers", *PipelineBufferDescriptorArray, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor rasterSampleCount]
    pub fn rasterSampleCount(self: *@This()) usize {
        return objc.msgSend(self, "rasterSampleCount", usize, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setRasterSampleCount:]
    pub fn setRasterSampleCount_(self: *@This(), raster_sample_count: usize) void {
        return objc.msgSend(self, "setRasterSampleCount:", void, .{raster_sample_count});
    }
    /// `-[MTLMeshRenderPipelineDescriptor isAlphaToCoverageEnabled]
    pub fn isAlphaToCoverageEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isAlphaToCoverageEnabled", bool, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setAlphaToCoverageEnabled:]
    pub fn setAlphaToCoverageEnabled_(self: *@This(), alpha_to_coverage_enabled: bool) void {
        return objc.msgSend(self, "setAlphaToCoverageEnabled:", void, .{alpha_to_coverage_enabled});
    }
    /// `-[MTLMeshRenderPipelineDescriptor isAlphaToOneEnabled]
    pub fn isAlphaToOneEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isAlphaToOneEnabled", bool, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setAlphaToOneEnabled:]
    pub fn setAlphaToOneEnabled_(self: *@This(), alpha_to_one_enabled: bool) void {
        return objc.msgSend(self, "setAlphaToOneEnabled:", void, .{alpha_to_one_enabled});
    }
    /// `-[MTLMeshRenderPipelineDescriptor isRasterizationEnabled]
    pub fn isRasterizationEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isRasterizationEnabled", bool, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setRasterizationEnabled:]
    pub fn setRasterizationEnabled_(self: *@This(), rasterization_enabled: bool) void {
        return objc.msgSend(self, "setRasterizationEnabled:", void, .{rasterization_enabled});
    }
    /// `-[MTLMeshRenderPipelineDescriptor maxVertexAmplificationCount]
    pub fn maxVertexAmplificationCount(self: *@This()) usize {
        return objc.msgSend(self, "maxVertexAmplificationCount", usize, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMaxVertexAmplificationCount:]
    pub fn setMaxVertexAmplificationCount_(self: *@This(), max_vertex_amplification_count: usize) void {
        return objc.msgSend(self, "setMaxVertexAmplificationCount:", void, .{max_vertex_amplification_count});
    }
    /// `-[MTLMeshRenderPipelineDescriptor colorAttachments]
    pub fn colorAttachments(self: *@This()) *RenderPipelineColorAttachmentDescriptorArray {
        return objc.msgSend(self, "colorAttachments", *RenderPipelineColorAttachmentDescriptorArray, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor depthAttachmentPixelFormat]
    pub fn depthAttachmentPixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "depthAttachmentPixelFormat", PixelFormat, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setDepthAttachmentPixelFormat:]
    pub fn setDepthAttachmentPixelFormat_(self: *@This(), depth_attachment_pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setDepthAttachmentPixelFormat:", void, .{depth_attachment_pixel_format});
    }
    /// `-[MTLMeshRenderPipelineDescriptor stencilAttachmentPixelFormat]
    pub fn stencilAttachmentPixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "stencilAttachmentPixelFormat", PixelFormat, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setStencilAttachmentPixelFormat:]
    pub fn setStencilAttachmentPixelFormat_(self: *@This(), stencil_attachment_pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setStencilAttachmentPixelFormat:", void, .{stencil_attachment_pixel_format});
    }
    /// `-[MTLMeshRenderPipelineDescriptor supportIndirectCommandBuffers]
    pub fn supportIndirectCommandBuffers(self: *@This()) bool {
        return objc.msgSend(self, "supportIndirectCommandBuffers", bool, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setSupportIndirectCommandBuffers:]
    pub fn setSupportIndirectCommandBuffers_(self: *@This(), support_indirect_command_buffers: bool) void {
        return objc.msgSend(self, "setSupportIndirectCommandBuffers:", void, .{support_indirect_command_buffers});
    }
    /// `-[MTLMeshRenderPipelineDescriptor objectLinkedFunctions]
    pub fn objectLinkedFunctions(self: *@This()) *LinkedFunctions {
        return objc.msgSend(self, "objectLinkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setObjectLinkedFunctions:]
    pub fn setObjectLinkedFunctions_(self: *@This(), object_linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setObjectLinkedFunctions:", void, .{object_linked_functions});
    }
    /// `-[MTLMeshRenderPipelineDescriptor meshLinkedFunctions]
    pub fn meshLinkedFunctions(self: *@This()) *LinkedFunctions {
        return objc.msgSend(self, "meshLinkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setMeshLinkedFunctions:]
    pub fn setMeshLinkedFunctions_(self: *@This(), mesh_linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setMeshLinkedFunctions:", void, .{mesh_linked_functions});
    }
    /// `-[MTLMeshRenderPipelineDescriptor fragmentLinkedFunctions]
    pub fn fragmentLinkedFunctions(self: *@This()) *LinkedFunctions {
        return objc.msgSend(self, "fragmentLinkedFunctions", *LinkedFunctions, .{});
    }
    /// `-[MTLMeshRenderPipelineDescriptor setFragmentLinkedFunctions:]
    pub fn setFragmentLinkedFunctions_(self: *@This(), fragment_linked_functions: ?*LinkedFunctions) void {
        return objc.msgSend(self, "setFragmentLinkedFunctions:", void, .{fragment_linked_functions});
    }
};

/// `MTLResource`
pub const Resource = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLResource setPurgeableState:]
    pub fn setPurgeableState_(self: *@This(), state: PurgeableState) PurgeableState {
        return objc.msgSend(self, "setPurgeableState:", PurgeableState, .{state});
    }
    /// `-[MTLResource makeAliasable]
    pub fn makeAliasable(self: *@This()) void {
        return objc.msgSend(self, "makeAliasable", void, .{});
    }
    /// `-[MTLResource isAliasable]
    pub fn isAliasable(self: *@This()) bool {
        return objc.msgSend(self, "isAliasable", bool, .{});
    }
    /// `-[MTLResource label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLResource setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
    /// `-[MTLResource device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLResource cpuCacheMode]
    pub fn cpuCacheMode(self: *@This()) CpuCacheMode {
        return objc.msgSend(self, "cpuCacheMode", CpuCacheMode, .{});
    }
    /// `-[MTLResource storageMode]
    pub fn storageMode(self: *@This()) StorageMode {
        return objc.msgSend(self, "storageMode", StorageMode, .{});
    }
    /// `-[MTLResource hazardTrackingMode]
    pub fn hazardTrackingMode(self: *@This()) HazardTrackingMode {
        return objc.msgSend(self, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    /// `-[MTLResource resourceOptions]
    pub fn resourceOptions(self: *@This()) ResourceOptions {
        return objc.msgSend(self, "resourceOptions", ResourceOptions, .{});
    }
    /// `-[MTLResource heap]
    pub fn heap(self: *@This()) ?*Heap {
        return objc.msgSend(self, "heap", ?*Heap, .{});
    }
    /// `-[MTLResource heapOffset]
    pub fn heapOffset(self: *@This()) usize {
        return objc.msgSend(self, "heapOffset", usize, .{});
    }
    /// `-[MTLResource allocatedSize]
    pub fn allocatedSize(self: *@This()) usize {
        return objc.msgSend(self, "allocatedSize", usize, .{});
    }
};

/// `MTLResourceStateCommandEncoder`
pub const ResourceStateCommandEncoder = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), CommandEncoder);
    const as = InternalInfo.as;
    /// `-[MTLResourceStateCommandEncoder updateTextureMappings:mode:regions:mipLevels:slices:numRegions:]
    pub fn updateTextureMappings_mode_regions_mipLevels_slices_numRegions_(self: *@This(), texture: *Texture, mode: SparseTextureMappingMode, regions: *const Region, mip_levels: *const usize, slices: *const usize, num_regions: usize) void {
        return objc.msgSend(self, "updateTextureMappings:mode:regions:mipLevels:slices:numRegions:", void, .{ texture, mode, regions, mip_levels, slices, num_regions });
    }
    /// `-[MTLResourceStateCommandEncoder updateTextureMapping:mode:region:mipLevel:slice:]
    pub fn updateTextureMapping_mode_region_mipLevel_slice_(self: *@This(), texture: *Texture, mode: SparseTextureMappingMode, region: Region, mip_level: usize, slice: usize) void {
        return objc.msgSend(self, "updateTextureMapping:mode:region:mipLevel:slice:", void, .{ texture, mode, region, mip_level, slice });
    }
    /// `-[MTLResourceStateCommandEncoder updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:]
    pub fn updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_(self: *@This(), texture: *Texture, mode: SparseTextureMappingMode, indirect_buffer: *Buffer, indirect_buffer_offset: usize) void {
        return objc.msgSend(self, "updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:", void, .{ texture, mode, indirect_buffer, indirect_buffer_offset });
    }
    /// `-[MTLResourceStateCommandEncoder updateFence:]
    pub fn updateFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "updateFence:", void, .{fence});
    }
    /// `-[MTLResourceStateCommandEncoder waitForFence:]
    pub fn waitForFence_(self: *@This(), fence: *Fence) void {
        return objc.msgSend(self, "waitForFence:", void, .{fence});
    }
    /// `-[MTLResourceStateCommandEncoder moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:]
    pub fn moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(self: *@This(), source_texture: *Texture, source_slice: usize, source_level: usize, source_origin: Origin, source_size: Size, destination_texture: *Texture, destination_slice: usize, destination_level: usize, destination_origin: Origin) void {
        return objc.msgSend(self, "moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", void, .{ source_texture, source_slice, source_level, source_origin, source_size, destination_texture, destination_slice, destination_level, destination_origin });
    }
};

/// `MTLResourceStatePassSampleBufferAttachmentDescriptor`
pub const ResourceStatePassSampleBufferAttachmentDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLResourceStatePassSampleBufferAttachmentDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLResourceStatePassSampleBufferAttachmentDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLResourceStatePassSampleBufferAttachmentDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptor sampleBuffer]
    pub fn sampleBuffer(self: *@This()) ?*CounterSampleBuffer {
        return objc.msgSend(self, "sampleBuffer", ?*CounterSampleBuffer, .{});
    }
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptor setSampleBuffer:]
    pub fn setSampleBuffer_(self: *@This(), sample_buffer: ?*CounterSampleBuffer) void {
        return objc.msgSend(self, "setSampleBuffer:", void, .{sample_buffer});
    }
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptor startOfEncoderSampleIndex]
    pub fn startOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "startOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptor setStartOfEncoderSampleIndex:]
    pub fn setStartOfEncoderSampleIndex_(self: *@This(), start_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setStartOfEncoderSampleIndex:", void, .{start_of_encoder_sample_index});
    }
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptor endOfEncoderSampleIndex]
    pub fn endOfEncoderSampleIndex(self: *@This()) usize {
        return objc.msgSend(self, "endOfEncoderSampleIndex", usize, .{});
    }
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptor setEndOfEncoderSampleIndex:]
    pub fn setEndOfEncoderSampleIndex_(self: *@This(), end_of_encoder_sample_index: usize) void {
        return objc.msgSend(self, "setEndOfEncoderSampleIndex:", void, .{end_of_encoder_sample_index});
    }
};

/// `MTLResourceStatePassSampleBufferAttachmentDescriptorArray`
pub const ResourceStatePassSampleBufferAttachmentDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLResourceStatePassSampleBufferAttachmentDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLResourceStatePassSampleBufferAttachmentDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLResourceStatePassSampleBufferAttachmentDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), attachment_index: usize) *ResourceStatePassSampleBufferAttachmentDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *ResourceStatePassSampleBufferAttachmentDescriptor, .{attachment_index});
    }
    /// `-[MTLResourceStatePassSampleBufferAttachmentDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attachment: ?*ResourceStatePassSampleBufferAttachmentDescriptor, attachment_index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attachment, attachment_index });
    }
};

/// `MTLResourceStatePassDescriptor`
pub const ResourceStatePassDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLResourceStatePassDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLResourceStatePassDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLResourceStatePassDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLResourceStatePassDescriptor resourceStatePassDescriptor]
    pub fn resourceStatePassDescriptor() *ResourceStatePassDescriptor {
        return objc.msgSend(InternalInfo.class(), "resourceStatePassDescriptor", *ResourceStatePassDescriptor, .{});
    }
    /// `-[MTLResourceStatePassDescriptor sampleBufferAttachments]
    pub fn sampleBufferAttachments(self: *@This()) *ResourceStatePassSampleBufferAttachmentDescriptorArray {
        return objc.msgSend(self, "sampleBufferAttachments", *ResourceStatePassSampleBufferAttachmentDescriptorArray, .{});
    }
};

/// `MTLSamplerDescriptor`
pub const SamplerDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLSamplerDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLSamplerDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLSamplerDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLSamplerDescriptor minFilter]
    pub fn minFilter(self: *@This()) SamplerMinMagFilter {
        return objc.msgSend(self, "minFilter", SamplerMinMagFilter, .{});
    }
    /// `-[MTLSamplerDescriptor setMinFilter:]
    pub fn setMinFilter_(self: *@This(), min_filter: SamplerMinMagFilter) void {
        return objc.msgSend(self, "setMinFilter:", void, .{min_filter});
    }
    /// `-[MTLSamplerDescriptor magFilter]
    pub fn magFilter(self: *@This()) SamplerMinMagFilter {
        return objc.msgSend(self, "magFilter", SamplerMinMagFilter, .{});
    }
    /// `-[MTLSamplerDescriptor setMagFilter:]
    pub fn setMagFilter_(self: *@This(), mag_filter: SamplerMinMagFilter) void {
        return objc.msgSend(self, "setMagFilter:", void, .{mag_filter});
    }
    /// `-[MTLSamplerDescriptor mipFilter]
    pub fn mipFilter(self: *@This()) SamplerMipFilter {
        return objc.msgSend(self, "mipFilter", SamplerMipFilter, .{});
    }
    /// `-[MTLSamplerDescriptor setMipFilter:]
    pub fn setMipFilter_(self: *@This(), mip_filter: SamplerMipFilter) void {
        return objc.msgSend(self, "setMipFilter:", void, .{mip_filter});
    }
    /// `-[MTLSamplerDescriptor maxAnisotropy]
    pub fn maxAnisotropy(self: *@This()) usize {
        return objc.msgSend(self, "maxAnisotropy", usize, .{});
    }
    /// `-[MTLSamplerDescriptor setMaxAnisotropy:]
    pub fn setMaxAnisotropy_(self: *@This(), max_anisotropy: usize) void {
        return objc.msgSend(self, "setMaxAnisotropy:", void, .{max_anisotropy});
    }
    /// `-[MTLSamplerDescriptor sAddressMode]
    pub fn sAddressMode(self: *@This()) SamplerAddressMode {
        return objc.msgSend(self, "sAddressMode", SamplerAddressMode, .{});
    }
    /// `-[MTLSamplerDescriptor setSAddressMode:]
    pub fn setSAddressMode_(self: *@This(), s_address_mode: SamplerAddressMode) void {
        return objc.msgSend(self, "setSAddressMode:", void, .{s_address_mode});
    }
    /// `-[MTLSamplerDescriptor tAddressMode]
    pub fn tAddressMode(self: *@This()) SamplerAddressMode {
        return objc.msgSend(self, "tAddressMode", SamplerAddressMode, .{});
    }
    /// `-[MTLSamplerDescriptor setTAddressMode:]
    pub fn setTAddressMode_(self: *@This(), t_address_mode: SamplerAddressMode) void {
        return objc.msgSend(self, "setTAddressMode:", void, .{t_address_mode});
    }
    /// `-[MTLSamplerDescriptor rAddressMode]
    pub fn rAddressMode(self: *@This()) SamplerAddressMode {
        return objc.msgSend(self, "rAddressMode", SamplerAddressMode, .{});
    }
    /// `-[MTLSamplerDescriptor setRAddressMode:]
    pub fn setRAddressMode_(self: *@This(), r_address_mode: SamplerAddressMode) void {
        return objc.msgSend(self, "setRAddressMode:", void, .{r_address_mode});
    }
    /// `-[MTLSamplerDescriptor borderColor]
    pub fn borderColor(self: *@This()) SamplerBorderColor {
        return objc.msgSend(self, "borderColor", SamplerBorderColor, .{});
    }
    /// `-[MTLSamplerDescriptor setBorderColor:]
    pub fn setBorderColor_(self: *@This(), border_color: SamplerBorderColor) void {
        return objc.msgSend(self, "setBorderColor:", void, .{border_color});
    }
    /// `-[MTLSamplerDescriptor normalizedCoordinates]
    pub fn normalizedCoordinates(self: *@This()) bool {
        return objc.msgSend(self, "normalizedCoordinates", bool, .{});
    }
    /// `-[MTLSamplerDescriptor setNormalizedCoordinates:]
    pub fn setNormalizedCoordinates_(self: *@This(), normalized_coordinates: bool) void {
        return objc.msgSend(self, "setNormalizedCoordinates:", void, .{normalized_coordinates});
    }
    /// `-[MTLSamplerDescriptor lodMinClamp]
    pub fn lodMinClamp(self: *@This()) f32 {
        return objc.msgSend(self, "lodMinClamp", f32, .{});
    }
    /// `-[MTLSamplerDescriptor setLodMinClamp:]
    pub fn setLodMinClamp_(self: *@This(), lod_min_clamp: f32) void {
        return objc.msgSend(self, "setLodMinClamp:", void, .{lod_min_clamp});
    }
    /// `-[MTLSamplerDescriptor lodMaxClamp]
    pub fn lodMaxClamp(self: *@This()) f32 {
        return objc.msgSend(self, "lodMaxClamp", f32, .{});
    }
    /// `-[MTLSamplerDescriptor setLodMaxClamp:]
    pub fn setLodMaxClamp_(self: *@This(), lod_max_clamp: f32) void {
        return objc.msgSend(self, "setLodMaxClamp:", void, .{lod_max_clamp});
    }
    /// `-[MTLSamplerDescriptor lodAverage]
    pub fn lodAverage(self: *@This()) bool {
        return objc.msgSend(self, "lodAverage", bool, .{});
    }
    /// `-[MTLSamplerDescriptor setLodAverage:]
    pub fn setLodAverage_(self: *@This(), lod_average: bool) void {
        return objc.msgSend(self, "setLodAverage:", void, .{lod_average});
    }
    /// `-[MTLSamplerDescriptor compareFunction]
    pub fn compareFunction(self: *@This()) CompareFunction {
        return objc.msgSend(self, "compareFunction", CompareFunction, .{});
    }
    /// `-[MTLSamplerDescriptor setCompareFunction:]
    pub fn setCompareFunction_(self: *@This(), compare_function: CompareFunction) void {
        return objc.msgSend(self, "setCompareFunction:", void, .{compare_function});
    }
    /// `-[MTLSamplerDescriptor supportArgumentBuffers]
    pub fn supportArgumentBuffers(self: *@This()) bool {
        return objc.msgSend(self, "supportArgumentBuffers", bool, .{});
    }
    /// `-[MTLSamplerDescriptor setSupportArgumentBuffers:]
    pub fn setSupportArgumentBuffers_(self: *@This(), support_argument_buffers: bool) void {
        return objc.msgSend(self, "setSupportArgumentBuffers:", void, .{support_argument_buffers});
    }
    /// `-[MTLSamplerDescriptor label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLSamplerDescriptor setLabel:]
    pub fn setLabel_(self: *@This(), str: ?*ns.String) void {
        return objc.msgSend(self, "setLabel:", void, .{str});
    }
};

/// `MTLSamplerState`
pub const SamplerState = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[MTLSamplerState label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
    /// `-[MTLSamplerState device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLSamplerState gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};

/// `MTLBufferLayoutDescriptor`
pub const BufferLayoutDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLBufferLayoutDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLBufferLayoutDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLBufferLayoutDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLBufferLayoutDescriptor stride]
    pub fn stride(self: *@This()) usize {
        return objc.msgSend(self, "stride", usize, .{});
    }
    /// `-[MTLBufferLayoutDescriptor setStride:]
    pub fn setStride_(self: *@This(), stride: usize) void {
        return objc.msgSend(self, "setStride:", void, .{stride});
    }
    /// `-[MTLBufferLayoutDescriptor stepFunction]
    pub fn stepFunction(self: *@This()) StepFunction {
        return objc.msgSend(self, "stepFunction", StepFunction, .{});
    }
    /// `-[MTLBufferLayoutDescriptor setStepFunction:]
    pub fn setStepFunction_(self: *@This(), step_function: StepFunction) void {
        return objc.msgSend(self, "setStepFunction:", void, .{step_function});
    }
    /// `-[MTLBufferLayoutDescriptor stepRate]
    pub fn stepRate(self: *@This()) usize {
        return objc.msgSend(self, "stepRate", usize, .{});
    }
    /// `-[MTLBufferLayoutDescriptor setStepRate:]
    pub fn setStepRate_(self: *@This(), step_rate: usize) void {
        return objc.msgSend(self, "setStepRate:", void, .{step_rate});
    }
};

/// `MTLBufferLayoutDescriptorArray`
pub const BufferLayoutDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLBufferLayoutDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLBufferLayoutDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLBufferLayoutDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLBufferLayoutDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), index: usize) *BufferLayoutDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *BufferLayoutDescriptor, .{index});
    }
    /// `-[MTLBufferLayoutDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), buffer_desc: ?*BufferLayoutDescriptor, index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ buffer_desc, index });
    }
};

/// `MTLAttributeDescriptor`
pub const AttributeDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLAttributeDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAttributeDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAttributeDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAttributeDescriptor format]
    pub fn format(self: *@This()) AttributeFormat {
        return objc.msgSend(self, "format", AttributeFormat, .{});
    }
    /// `-[MTLAttributeDescriptor setFormat:]
    pub fn setFormat_(self: *@This(), format: AttributeFormat) void {
        return objc.msgSend(self, "setFormat:", void, .{format});
    }
    /// `-[MTLAttributeDescriptor offset]
    pub fn offset(self: *@This()) usize {
        return objc.msgSend(self, "offset", usize, .{});
    }
    /// `-[MTLAttributeDescriptor setOffset:]
    pub fn setOffset_(self: *@This(), offset: usize) void {
        return objc.msgSend(self, "setOffset:", void, .{offset});
    }
    /// `-[MTLAttributeDescriptor bufferIndex]
    pub fn bufferIndex(self: *@This()) usize {
        return objc.msgSend(self, "bufferIndex", usize, .{});
    }
    /// `-[MTLAttributeDescriptor setBufferIndex:]
    pub fn setBufferIndex_(self: *@This(), buffer_index: usize) void {
        return objc.msgSend(self, "setBufferIndex:", void, .{buffer_index});
    }
};

/// `MTLAttributeDescriptorArray`
pub const AttributeDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLAttributeDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLAttributeDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLAttributeDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLAttributeDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), index: usize) *AttributeDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *AttributeDescriptor, .{index});
    }
    /// `-[MTLAttributeDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attribute_desc: ?*AttributeDescriptor, index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attribute_desc, index });
    }
};

/// `MTLStageInputOutputDescriptor`
pub const StageInputOutputDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLStageInputOutputDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLStageInputOutputDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLStageInputOutputDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLStageInputOutputDescriptor stageInputOutputDescriptor]
    pub fn stageInputOutputDescriptor() *StageInputOutputDescriptor {
        return objc.msgSend(InternalInfo.class(), "stageInputOutputDescriptor", *StageInputOutputDescriptor, .{});
    }
    /// `-[MTLStageInputOutputDescriptor reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLStageInputOutputDescriptor layouts]
    pub fn layouts(self: *@This()) *BufferLayoutDescriptorArray {
        return objc.msgSend(self, "layouts", *BufferLayoutDescriptorArray, .{});
    }
    /// `-[MTLStageInputOutputDescriptor attributes]
    pub fn attributes(self: *@This()) *AttributeDescriptorArray {
        return objc.msgSend(self, "attributes", *AttributeDescriptorArray, .{});
    }
    /// `-[MTLStageInputOutputDescriptor indexType]
    pub fn indexType(self: *@This()) IndexType {
        return objc.msgSend(self, "indexType", IndexType, .{});
    }
    /// `-[MTLStageInputOutputDescriptor setIndexType:]
    pub fn setIndexType_(self: *@This(), index_type: IndexType) void {
        return objc.msgSend(self, "setIndexType:", void, .{index_type});
    }
    /// `-[MTLStageInputOutputDescriptor indexBufferIndex]
    pub fn indexBufferIndex(self: *@This()) usize {
        return objc.msgSend(self, "indexBufferIndex", usize, .{});
    }
    /// `-[MTLStageInputOutputDescriptor setIndexBufferIndex:]
    pub fn setIndexBufferIndex_(self: *@This(), index_buffer_index: usize) void {
        return objc.msgSend(self, "setIndexBufferIndex:", void, .{index_buffer_index});
    }
};

/// `MTLSharedTextureHandle`
pub const SharedTextureHandle = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.SecureCoding) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLSharedTextureHandle new]`
    pub const new = InternalInfo.new;
    /// `+[MTLSharedTextureHandle alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLSharedTextureHandle alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLSharedTextureHandle device]
    pub fn device(self: *@This()) *Device {
        return objc.msgSend(self, "device", *Device, .{});
    }
    /// `-[MTLSharedTextureHandle label]
    pub fn label(self: *@This()) ?*ns.String {
        return objc.msgSend(self, "label", ?*ns.String, .{});
    }
};

/// `MTLTextureDescriptor`
pub const TextureDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLTextureDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLTextureDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLTextureDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:]
    pub fn texture2DDescriptorWithPixelFormat_width_height_mipmapped_(pixel_format: PixelFormat, width: usize, height: usize, mipmapped: bool) *TextureDescriptor {
        return objc.msgSend(InternalInfo.class(), "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", *TextureDescriptor, .{ pixel_format, width, height, mipmapped });
    }
    /// `+[MTLTextureDescriptor textureCubeDescriptorWithPixelFormat:size:mipmapped:]
    pub fn textureCubeDescriptorWithPixelFormat_size_mipmapped_(pixel_format: PixelFormat, size: usize, mipmapped: bool) *TextureDescriptor {
        return objc.msgSend(InternalInfo.class(), "textureCubeDescriptorWithPixelFormat:size:mipmapped:", *TextureDescriptor, .{ pixel_format, size, mipmapped });
    }
    /// `+[MTLTextureDescriptor textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:]
    pub fn textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_(pixel_format: PixelFormat, width: usize, resource_options: ResourceOptions, usage: TextureUsage) *TextureDescriptor {
        return objc.msgSend(InternalInfo.class(), "textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:", *TextureDescriptor, .{ pixel_format, width, resource_options, usage });
    }
    /// `-[MTLTextureDescriptor textureType]
    pub fn textureType(self: *@This()) TextureType {
        return objc.msgSend(self, "textureType", TextureType, .{});
    }
    /// `-[MTLTextureDescriptor setTextureType:]
    pub fn setTextureType_(self: *@This(), texture_type: TextureType) void {
        return objc.msgSend(self, "setTextureType:", void, .{texture_type});
    }
    /// `-[MTLTextureDescriptor pixelFormat]
    pub fn pixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "pixelFormat", PixelFormat, .{});
    }
    /// `-[MTLTextureDescriptor setPixelFormat:]
    pub fn setPixelFormat_(self: *@This(), pixel_format: PixelFormat) void {
        return objc.msgSend(self, "setPixelFormat:", void, .{pixel_format});
    }
    /// `-[MTLTextureDescriptor width]
    pub fn width(self: *@This()) usize {
        return objc.msgSend(self, "width", usize, .{});
    }
    /// `-[MTLTextureDescriptor setWidth:]
    pub fn setWidth_(self: *@This(), width: usize) void {
        return objc.msgSend(self, "setWidth:", void, .{width});
    }
    /// `-[MTLTextureDescriptor height]
    pub fn height(self: *@This()) usize {
        return objc.msgSend(self, "height", usize, .{});
    }
    /// `-[MTLTextureDescriptor setHeight:]
    pub fn setHeight_(self: *@This(), height: usize) void {
        return objc.msgSend(self, "setHeight:", void, .{height});
    }
    /// `-[MTLTextureDescriptor depth]
    pub fn depth(self: *@This()) usize {
        return objc.msgSend(self, "depth", usize, .{});
    }
    /// `-[MTLTextureDescriptor setDepth:]
    pub fn setDepth_(self: *@This(), depth: usize) void {
        return objc.msgSend(self, "setDepth:", void, .{depth});
    }
    /// `-[MTLTextureDescriptor mipmapLevelCount]
    pub fn mipmapLevelCount(self: *@This()) usize {
        return objc.msgSend(self, "mipmapLevelCount", usize, .{});
    }
    /// `-[MTLTextureDescriptor setMipmapLevelCount:]
    pub fn setMipmapLevelCount_(self: *@This(), mipmap_level_count: usize) void {
        return objc.msgSend(self, "setMipmapLevelCount:", void, .{mipmap_level_count});
    }
    /// `-[MTLTextureDescriptor sampleCount]
    pub fn sampleCount(self: *@This()) usize {
        return objc.msgSend(self, "sampleCount", usize, .{});
    }
    /// `-[MTLTextureDescriptor setSampleCount:]
    pub fn setSampleCount_(self: *@This(), sample_count: usize) void {
        return objc.msgSend(self, "setSampleCount:", void, .{sample_count});
    }
    /// `-[MTLTextureDescriptor arrayLength]
    pub fn arrayLength(self: *@This()) usize {
        return objc.msgSend(self, "arrayLength", usize, .{});
    }
    /// `-[MTLTextureDescriptor setArrayLength:]
    pub fn setArrayLength_(self: *@This(), array_length: usize) void {
        return objc.msgSend(self, "setArrayLength:", void, .{array_length});
    }
    /// `-[MTLTextureDescriptor resourceOptions]
    pub fn resourceOptions(self: *@This()) ResourceOptions {
        return objc.msgSend(self, "resourceOptions", ResourceOptions, .{});
    }
    /// `-[MTLTextureDescriptor setResourceOptions:]
    pub fn setResourceOptions_(self: *@This(), resource_options: ResourceOptions) void {
        return objc.msgSend(self, "setResourceOptions:", void, .{resource_options});
    }
    /// `-[MTLTextureDescriptor cpuCacheMode]
    pub fn cpuCacheMode(self: *@This()) CpuCacheMode {
        return objc.msgSend(self, "cpuCacheMode", CpuCacheMode, .{});
    }
    /// `-[MTLTextureDescriptor setCpuCacheMode:]
    pub fn setCpuCacheMode_(self: *@This(), cpu_cache_mode: CpuCacheMode) void {
        return objc.msgSend(self, "setCpuCacheMode:", void, .{cpu_cache_mode});
    }
    /// `-[MTLTextureDescriptor storageMode]
    pub fn storageMode(self: *@This()) StorageMode {
        return objc.msgSend(self, "storageMode", StorageMode, .{});
    }
    /// `-[MTLTextureDescriptor setStorageMode:]
    pub fn setStorageMode_(self: *@This(), storage_mode: StorageMode) void {
        return objc.msgSend(self, "setStorageMode:", void, .{storage_mode});
    }
    /// `-[MTLTextureDescriptor hazardTrackingMode]
    pub fn hazardTrackingMode(self: *@This()) HazardTrackingMode {
        return objc.msgSend(self, "hazardTrackingMode", HazardTrackingMode, .{});
    }
    /// `-[MTLTextureDescriptor setHazardTrackingMode:]
    pub fn setHazardTrackingMode_(self: *@This(), hazard_tracking_mode: HazardTrackingMode) void {
        return objc.msgSend(self, "setHazardTrackingMode:", void, .{hazard_tracking_mode});
    }
    /// `-[MTLTextureDescriptor usage]
    pub fn usage(self: *@This()) TextureUsage {
        return objc.msgSend(self, "usage", TextureUsage, .{});
    }
    /// `-[MTLTextureDescriptor setUsage:]
    pub fn setUsage_(self: *@This(), usage: TextureUsage) void {
        return objc.msgSend(self, "setUsage:", void, .{usage});
    }
    /// `-[MTLTextureDescriptor allowGPUOptimizedContents]
    pub fn allowGPUOptimizedContents(self: *@This()) bool {
        return objc.msgSend(self, "allowGPUOptimizedContents", bool, .{});
    }
    /// `-[MTLTextureDescriptor setAllowGPUOptimizedContents:]
    pub fn setAllowGPUOptimizedContents_(self: *@This(), allow_gpuoptimized_contents: bool) void {
        return objc.msgSend(self, "setAllowGPUOptimizedContents:", void, .{allow_gpuoptimized_contents});
    }
    /// `-[MTLTextureDescriptor compressionType]
    pub fn compressionType(self: *@This()) TextureCompressionType {
        return objc.msgSend(self, "compressionType", TextureCompressionType, .{});
    }
    /// `-[MTLTextureDescriptor setCompressionType:]
    pub fn setCompressionType_(self: *@This(), compression_type: TextureCompressionType) void {
        return objc.msgSend(self, "setCompressionType:", void, .{compression_type});
    }
    /// `-[MTLTextureDescriptor swizzle]
    pub fn swizzle(self: *@This()) TextureSwizzleChannels {
        return objc.msgSend(self, "swizzle", TextureSwizzleChannels, .{});
    }
    /// `-[MTLTextureDescriptor setSwizzle:]
    pub fn setSwizzle_(self: *@This(), swizzle: TextureSwizzleChannels) void {
        return objc.msgSend(self, "setSwizzle:", void, .{swizzle});
    }
};

/// `MTLTexture`
pub const Texture = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Resource);
    const as = InternalInfo.as;
    /// `-[MTLTexture getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:]
    pub fn getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_(self: *@This(), pixel_bytes: *anyopaque, bytes_per_row: usize, bytes_per_image: usize, region: Region, level: usize, slice: usize) void {
        return objc.msgSend(self, "getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:", void, .{ pixel_bytes, bytes_per_row, bytes_per_image, region, level, slice });
    }
    /// `-[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:]
    pub fn replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(self: *@This(), region: Region, level: usize, slice: usize, pixel_bytes: *const anyopaque, bytes_per_row: usize, bytes_per_image: usize) void {
        return objc.msgSend(self, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", void, .{ region, level, slice, pixel_bytes, bytes_per_row, bytes_per_image });
    }
    /// `-[MTLTexture getBytes:bytesPerRow:fromRegion:mipmapLevel:]
    pub fn getBytes_bytesPerRow_fromRegion_mipmapLevel_(self: *@This(), pixel_bytes: *anyopaque, bytes_per_row: usize, region: Region, level: usize) void {
        return objc.msgSend(self, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", void, .{ pixel_bytes, bytes_per_row, region, level });
    }
    /// `-[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:]
    pub fn replaceRegion_mipmapLevel_withBytes_bytesPerRow_(self: *@This(), region: Region, level: usize, pixel_bytes: *const anyopaque, bytes_per_row: usize) void {
        return objc.msgSend(self, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", void, .{ region, level, pixel_bytes, bytes_per_row });
    }
    /// `-[MTLTexture newTextureViewWithPixelFormat:]
    pub fn newTextureViewWithPixelFormat_(self: *@This(), pixel_format: PixelFormat) ?*Texture {
        return objc.msgSend(self, "newTextureViewWithPixelFormat:", ?*Texture, .{pixel_format});
    }
    /// `-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:]
    pub fn newTextureViewWithPixelFormat_textureType_levels_slices_(self: *@This(), pixel_format: PixelFormat, texture_type: TextureType, level_range: ns.Range, slice_range: ns.Range) ?*Texture {
        return objc.msgSend(self, "newTextureViewWithPixelFormat:textureType:levels:slices:", ?*Texture, .{ pixel_format, texture_type, level_range, slice_range });
    }
    /// `-[MTLTexture newSharedTextureHandle]
    pub fn newSharedTextureHandle(self: *@This()) ?*SharedTextureHandle {
        return objc.msgSend(self, "newSharedTextureHandle", ?*SharedTextureHandle, .{});
    }
    /// `-[MTLTexture newRemoteTextureViewForDevice:]
    pub fn newRemoteTextureViewForDevice_(self: *@This(), device: *Device) ?*Texture {
        return objc.msgSend(self, "newRemoteTextureViewForDevice:", ?*Texture, .{device});
    }
    /// `-[MTLTexture newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:]
    pub fn newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_(self: *@This(), pixel_format: PixelFormat, texture_type: TextureType, level_range: ns.Range, slice_range: ns.Range, swizzle: TextureSwizzleChannels) ?*Texture {
        return objc.msgSend(self, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", ?*Texture, .{ pixel_format, texture_type, level_range, slice_range, swizzle });
    }
    /// `-[MTLTexture rootResource]
    pub fn rootResource(self: *@This()) ?*Resource {
        return objc.msgSend(self, "rootResource", ?*Resource, .{});
    }
    /// `-[MTLTexture parentTexture]
    pub fn parentTexture(self: *@This()) ?*Texture {
        return objc.msgSend(self, "parentTexture", ?*Texture, .{});
    }
    /// `-[MTLTexture parentRelativeLevel]
    pub fn parentRelativeLevel(self: *@This()) usize {
        return objc.msgSend(self, "parentRelativeLevel", usize, .{});
    }
    /// `-[MTLTexture parentRelativeSlice]
    pub fn parentRelativeSlice(self: *@This()) usize {
        return objc.msgSend(self, "parentRelativeSlice", usize, .{});
    }
    /// `-[MTLTexture buffer]
    pub fn buffer(self: *@This()) ?*Buffer {
        return objc.msgSend(self, "buffer", ?*Buffer, .{});
    }
    /// `-[MTLTexture bufferOffset]
    pub fn bufferOffset(self: *@This()) usize {
        return objc.msgSend(self, "bufferOffset", usize, .{});
    }
    /// `-[MTLTexture bufferBytesPerRow]
    pub fn bufferBytesPerRow(self: *@This()) usize {
        return objc.msgSend(self, "bufferBytesPerRow", usize, .{});
    }
    /// `-[MTLTexture iosurface]
    pub fn iosurface(self: *@This()) ?*io.Surface {
        return objc.msgSend(self, "iosurface", ?*io.Surface, .{});
    }
    /// `-[MTLTexture iosurfacePlane]
    pub fn iosurfacePlane(self: *@This()) usize {
        return objc.msgSend(self, "iosurfacePlane", usize, .{});
    }
    /// `-[MTLTexture textureType]
    pub fn textureType(self: *@This()) TextureType {
        return objc.msgSend(self, "textureType", TextureType, .{});
    }
    /// `-[MTLTexture pixelFormat]
    pub fn pixelFormat(self: *@This()) PixelFormat {
        return objc.msgSend(self, "pixelFormat", PixelFormat, .{});
    }
    /// `-[MTLTexture width]
    pub fn width(self: *@This()) usize {
        return objc.msgSend(self, "width", usize, .{});
    }
    /// `-[MTLTexture height]
    pub fn height(self: *@This()) usize {
        return objc.msgSend(self, "height", usize, .{});
    }
    /// `-[MTLTexture depth]
    pub fn depth(self: *@This()) usize {
        return objc.msgSend(self, "depth", usize, .{});
    }
    /// `-[MTLTexture mipmapLevelCount]
    pub fn mipmapLevelCount(self: *@This()) usize {
        return objc.msgSend(self, "mipmapLevelCount", usize, .{});
    }
    /// `-[MTLTexture sampleCount]
    pub fn sampleCount(self: *@This()) usize {
        return objc.msgSend(self, "sampleCount", usize, .{});
    }
    /// `-[MTLTexture arrayLength]
    pub fn arrayLength(self: *@This()) usize {
        return objc.msgSend(self, "arrayLength", usize, .{});
    }
    /// `-[MTLTexture usage]
    pub fn usage(self: *@This()) TextureUsage {
        return objc.msgSend(self, "usage", TextureUsage, .{});
    }
    /// `-[MTLTexture isShareable]
    pub fn isShareable(self: *@This()) bool {
        return objc.msgSend(self, "isShareable", bool, .{});
    }
    /// `-[MTLTexture isFramebufferOnly]
    pub fn isFramebufferOnly(self: *@This()) bool {
        return objc.msgSend(self, "isFramebufferOnly", bool, .{});
    }
    /// `-[MTLTexture firstMipmapInTail]
    pub fn firstMipmapInTail(self: *@This()) usize {
        return objc.msgSend(self, "firstMipmapInTail", usize, .{});
    }
    /// `-[MTLTexture tailSizeInBytes]
    pub fn tailSizeInBytes(self: *@This()) usize {
        return objc.msgSend(self, "tailSizeInBytes", usize, .{});
    }
    /// `-[MTLTexture isSparse]
    pub fn isSparse(self: *@This()) bool {
        return objc.msgSend(self, "isSparse", bool, .{});
    }
    /// `-[MTLTexture allowGPUOptimizedContents]
    pub fn allowGPUOptimizedContents(self: *@This()) bool {
        return objc.msgSend(self, "allowGPUOptimizedContents", bool, .{});
    }
    /// `-[MTLTexture compressionType]
    pub fn compressionType(self: *@This()) TextureCompressionType {
        return objc.msgSend(self, "compressionType", TextureCompressionType, .{});
    }
    /// `-[MTLTexture gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
    /// `-[MTLTexture remoteStorageTexture]
    pub fn remoteStorageTexture(self: *@This()) *Texture {
        return objc.msgSend(self, "remoteStorageTexture", *Texture, .{});
    }
    /// `-[MTLTexture swizzle]
    pub fn swizzle(self: *@This()) TextureSwizzleChannels {
        return objc.msgSend(self, "swizzle", TextureSwizzleChannels, .{});
    }
};

/// `MTLVertexBufferLayoutDescriptor`
pub const VertexBufferLayoutDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLVertexBufferLayoutDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVertexBufferLayoutDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVertexBufferLayoutDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLVertexBufferLayoutDescriptor stride]
    pub fn stride(self: *@This()) usize {
        return objc.msgSend(self, "stride", usize, .{});
    }
    /// `-[MTLVertexBufferLayoutDescriptor setStride:]
    pub fn setStride_(self: *@This(), stride: usize) void {
        return objc.msgSend(self, "setStride:", void, .{stride});
    }
    /// `-[MTLVertexBufferLayoutDescriptor stepFunction]
    pub fn stepFunction(self: *@This()) VertexStepFunction {
        return objc.msgSend(self, "stepFunction", VertexStepFunction, .{});
    }
    /// `-[MTLVertexBufferLayoutDescriptor setStepFunction:]
    pub fn setStepFunction_(self: *@This(), step_function: VertexStepFunction) void {
        return objc.msgSend(self, "setStepFunction:", void, .{step_function});
    }
    /// `-[MTLVertexBufferLayoutDescriptor stepRate]
    pub fn stepRate(self: *@This()) usize {
        return objc.msgSend(self, "stepRate", usize, .{});
    }
    /// `-[MTLVertexBufferLayoutDescriptor setStepRate:]
    pub fn setStepRate_(self: *@This(), step_rate: usize) void {
        return objc.msgSend(self, "setStepRate:", void, .{step_rate});
    }
};

/// `MTLVertexBufferLayoutDescriptorArray`
pub const VertexBufferLayoutDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLVertexBufferLayoutDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVertexBufferLayoutDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVertexBufferLayoutDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLVertexBufferLayoutDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), index: usize) *VertexBufferLayoutDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *VertexBufferLayoutDescriptor, .{index});
    }
    /// `-[MTLVertexBufferLayoutDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), buffer_desc: ?*VertexBufferLayoutDescriptor, index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ buffer_desc, index });
    }
};

/// `MTLVertexAttributeDescriptor`
pub const VertexAttributeDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLVertexAttributeDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVertexAttributeDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVertexAttributeDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLVertexAttributeDescriptor format]
    pub fn format(self: *@This()) VertexFormat {
        return objc.msgSend(self, "format", VertexFormat, .{});
    }
    /// `-[MTLVertexAttributeDescriptor setFormat:]
    pub fn setFormat_(self: *@This(), format: VertexFormat) void {
        return objc.msgSend(self, "setFormat:", void, .{format});
    }
    /// `-[MTLVertexAttributeDescriptor offset]
    pub fn offset(self: *@This()) usize {
        return objc.msgSend(self, "offset", usize, .{});
    }
    /// `-[MTLVertexAttributeDescriptor setOffset:]
    pub fn setOffset_(self: *@This(), offset: usize) void {
        return objc.msgSend(self, "setOffset:", void, .{offset});
    }
    /// `-[MTLVertexAttributeDescriptor bufferIndex]
    pub fn bufferIndex(self: *@This()) usize {
        return objc.msgSend(self, "bufferIndex", usize, .{});
    }
    /// `-[MTLVertexAttributeDescriptor setBufferIndex:]
    pub fn setBufferIndex_(self: *@This(), buffer_index: usize) void {
        return objc.msgSend(self, "setBufferIndex:", void, .{buffer_index});
    }
};

/// `MTLVertexAttributeDescriptorArray`
pub const VertexAttributeDescriptorArray = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[MTLVertexAttributeDescriptorArray new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVertexAttributeDescriptorArray alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVertexAttributeDescriptorArray alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[MTLVertexAttributeDescriptorArray objectAtIndexedSubscript:]
    pub fn objectAtIndexedSubscript_(self: *@This(), index: usize) *VertexAttributeDescriptor {
        return objc.msgSend(self, "objectAtIndexedSubscript:", *VertexAttributeDescriptor, .{index});
    }
    /// `-[MTLVertexAttributeDescriptorArray setObject:atIndexedSubscript:]
    pub fn setObject_atIndexedSubscript_(self: *@This(), attribute_desc: ?*VertexAttributeDescriptor, index: usize) void {
        return objc.msgSend(self, "setObject:atIndexedSubscript:", void, .{ attribute_desc, index });
    }
};

/// `MTLVertexDescriptor`
pub const VertexDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLVertexDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVertexDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVertexDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLVertexDescriptor vertexDescriptor]
    pub fn vertexDescriptor() *VertexDescriptor {
        return objc.msgSend(InternalInfo.class(), "vertexDescriptor", *VertexDescriptor, .{});
    }
    /// `-[MTLVertexDescriptor reset]
    pub fn reset(self: *@This()) void {
        return objc.msgSend(self, "reset", void, .{});
    }
    /// `-[MTLVertexDescriptor layouts]
    pub fn layouts(self: *@This()) *VertexBufferLayoutDescriptorArray {
        return objc.msgSend(self, "layouts", *VertexBufferLayoutDescriptorArray, .{});
    }
    /// `-[MTLVertexDescriptor attributes]
    pub fn attributes(self: *@This()) *VertexAttributeDescriptorArray {
        return objc.msgSend(self, "attributes", *VertexAttributeDescriptorArray, .{});
    }
};

/// `MTLVisibleFunctionTableDescriptor`
pub const VisibleFunctionTableDescriptor = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    pub fn as(self: *@This(), comptime Base: type) *Base {
        if (Base == ns.Copying) return @ptrCast(self);
        return InternalInfo.as(self, Base);
    }
    /// `+[MTLVisibleFunctionTableDescriptor new]`
    pub const new = InternalInfo.new;
    /// `+[MTLVisibleFunctionTableDescriptor alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[MTLVisibleFunctionTableDescriptor alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[MTLVisibleFunctionTableDescriptor visibleFunctionTableDescriptor]
    pub fn visibleFunctionTableDescriptor() *VisibleFunctionTableDescriptor {
        return objc.msgSend(InternalInfo.class(), "visibleFunctionTableDescriptor", *VisibleFunctionTableDescriptor, .{});
    }
    /// `-[MTLVisibleFunctionTableDescriptor functionCount]
    pub fn functionCount(self: *@This()) usize {
        return objc.msgSend(self, "functionCount", usize, .{});
    }
    /// `-[MTLVisibleFunctionTableDescriptor setFunctionCount:]
    pub fn setFunctionCount_(self: *@This(), function_count: usize) void {
        return objc.msgSend(self, "setFunctionCount:", void, .{function_count});
    }
};

/// `MTLVisibleFunctionTable`
pub const VisibleFunctionTable = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), Resource);
    const as = InternalInfo.as;
    /// `-[MTLVisibleFunctionTable setFunction:atIndex:]
    pub fn setFunction_atIndex_(self: *@This(), function: ?*FunctionHandle, index: usize) void {
        return objc.msgSend(self, "setFunction:atIndex:", void, .{ function, index });
    }
    /// `-[MTLVisibleFunctionTable setFunctions:withRange:]
    pub fn setFunctions_withRange_(self: *@This(), functions: [*]?*const FunctionHandle, range: ns.Range) void {
        return objc.msgSend(self, "setFunctions:withRange:", void, .{ functions, range });
    }
    /// `-[MTLVisibleFunctionTable gpuResourceID]
    pub fn gpuResourceId(self: *@This()) ResourceId {
        return objc.msgSend(self, "gpuResourceID", ResourceId, .{});
    }
};
