const ns = @import("foundation.zig");
const objc = @import("objc.zig");
const std = @import("std");

// ------------------------------------------------------------------------------------------------
// Types

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

/// `MTLCreateSystemDefaultDevice()`
pub const createSystemDefaultDevice = MTLCreateSystemDefaultDevice;
extern fn MTLCreateSystemDefaultDevice() ?*Device;

/// `MTLCopyAllDevices()`
pub const copyAllDevices = MTLCopyAllDevices;
extern fn MTLCopyAllDevices() *ns.Array(*Device);

/// `MTLScissorRect`
pub const ScissorRect = extern struct {
    x: usize,
    y: usize,
    width: usize,
    height: usize,
};

/// `MTLViewport`
pub const Viewport = extern struct {
    origin_x: f64,
    origin_y: f64,
    width: f64,
    height: f64,
    z_near: f64,
    z_far: f64,
};

/// `MTLClearColor`
pub const ClearColor = extern struct {
    red: f64,
    green: f64,
    blue: f64,
    alpha: f64,
};

/// `MTLOrigin`
pub const Origin = extern struct {
    x: usize,
    y: usize,
    z: usize,
};

/// `MTLSize`
pub const Size = extern struct {
    width: usize,
    height: usize,
    depth: usize,
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
    float2x2 = 7,
    /// `MTLDataTypeFloat2x3`
    float2x3 = 8,
    /// `MTLDataTypeFloat2x4`
    float2x4 = 9,
    /// `MTLDataTypeFloat3x2`
    float3x2 = 10,
    /// `MTLDataTypeFloat3x3`
    float3x3 = 11,
    /// `MTLDataTypeFloat3x4`
    float3x4 = 12,
    /// `MTLDataTypeFloat4x2`
    float4x2 = 13,
    /// `MTLDataTypeFloat4x3`
    float4x3 = 14,
    /// `MTLDataTypeFloat4x4`
    float4x4 = 15,
    /// `MTLDataTypeHalf`
    half = 16,
    /// `MTLDataTypeHalf2`
    half2 = 17,
    /// `MTLDataTypeHalf3`
    half3 = 18,
    /// `MTLDataTypeHalf4`
    half4 = 19,
    /// `MTLDataTypeHalf2x2`
    half2x2 = 20,
    /// `MTLDataTypeHalf2x3`
    half2x3 = 21,
    /// `MTLDataTypeHalf2x4`
    half2x4 = 22,
    /// `MTLDataTypeHalf3x2`
    half3x2 = 23,
    /// `MTLDataTypeHalf3x3`
    half3x3 = 24,
    /// `MTLDataTypeHalf3x4`
    half3x4 = 25,
    /// `MTLDataTypeHalf4x2`
    half4x2 = 26,
    /// `MTLDataTypeHalf4x3`
    half4x3 = 27,
    /// `MTLDataTypeHalf4x4`
    half4x4 = 28,
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
    rgba8_unorm_srgb = 71,
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

/// `MTLCaptureDestination`
pub const CaptureDestination = enum(isize) {
    /// `MTLCaptureDestinationDeveloperTools`
    developer_tools = 1,
    /// `MTLCaptureDestinationGPUTraceDocument`
    gpu_trace_document = 0,
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

// TODO: OPTIONS
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

/// `MTLStoreActionOptions`
pub const StoreActionOptions = packed struct(usize) {
    /// `MTLStoreActionOptionCustomSamplePositions`
    custom_sample_positions: bool = false,
    _padding: u63 = 0,

    /// `MTLStoreActionOptionNone`
    pub const none: StoreActionOptions = .{};
};

/// `MTLCommandBufferErrorOption`
pub const CommandBufferErrorOption = packed struct(usize) {
    /// `MTLCommandBufferErrorOptionEncoderExecutionStatus`
    encoder_execution_status: bool = false,
    _padding: u63 = 0,

    /// `MTLCommandBufferErrorOptionNone`
    pub const none: CommandBufferErrorOption = .{};
};

/// `MTLAccelerationStructureRefitOptions`
pub const AccelerationStructureRefitOptions = packed struct(usize) {
    /// `MTLAccelerationStructureRefitOptionVertexData`
    vertex_data: bool = false,
    /// `MTLAccelerationStructureRefitOptionPerPrimitiveData`
    per_primitive_data: bool = false,
    _padding: u62 = 0,
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
