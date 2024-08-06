const std = @import("std");
const cf = @import("../core_foundation.zig");
const io = @import("../iosurface.zig");
const ns = @import("../foundation.zig");
const objc = @import("../objc.zig");

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

// ------------------------------------------------------------------------------------------------

/// `MTLSizeAndAlign`
pub const SizeAndAlign = extern struct {
    size: usize,
    @"align": usize,
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

/// `MTLCaptureError`
pub const CaptureError = enum(isize) {
    /// `MTLCaptureErrorNotSupported`
    not_supported = 1,
    /// `MTLCaptureErrorAlreadyCapturing`
    already_capturing = 0,
    /// `MTLCaptureErrorInvalidDescriptor`
    invalid_descriptor = 0,
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

/// `MTLCounterSampleBufferError`
pub const CounterSampleBufferError = enum(isize) {
    /// `MTLCounterSampleBufferErrorOutOfMemory`
    out_of_memory = 0,
    /// `MTLCounterSampleBufferErrorInvalid`
    invalid = 0,
    /// `MTLCounterSampleBufferErrorInternal`
    internal = 0,
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
pub const IOCompressionMethod = enum(isize) {
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
    unspecified = 0,
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
    1 = 1,
    /// `MTLReadWriteTextureTier2`
    2 = 2,
    _,
};

/// `MTLArgumentBuffersTier`
pub const ArgumentBuffersTier = enum(usize) {
    /// `MTLArgumentBuffersTier1`
    1 = 0,
    /// `MTLArgumentBuffersTier2`
    2 = 1,
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
    at_draw_boundary = 0,
    /// `MTLCounterSamplingPointAtDispatchBoundary`
    at_dispatch_boundary = 0,
    /// `MTLCounterSamplingPointAtTileDispatchBoundary`
    at_tile_dispatch_boundary = 0,
    /// `MTLCounterSamplingPointAtBlitBoundary`
    at_blit_boundary = 0,
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

/// `MTLIOStatus`
pub const IOStatus = enum(isize) {
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
pub const IOPriority = enum(isize) {
    /// `MTLIOPriorityHigh`
    high = 0,
    /// `MTLIOPriorityNormal`
    normal = 1,
    /// `MTLIOPriorityLow`
    low = 2,
    _,
};

/// `MTLIOCommandQueueType`
pub const IOCommandQueueType = enum(isize) {
    /// `MTLIOCommandQueueTypeConcurrent`
    concurrent = 0,
    /// `MTLIOCommandQueueTypeSerial`
    serial = 1,
    _,
};

/// `MTLIOError`
pub const IOError = enum(isize) {
    /// `MTLIOErrorURLInvalid`
    urlinvalid = 1,
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
    1_0 = 65536,
    /// `MTLLanguageVersion1_1`
    1_1 = 65537,
    /// `MTLLanguageVersion1_2`
    1_2 = 65538,
    /// `MTLLanguageVersion2_0`
    2_0 = 131072,
    /// `MTLLanguageVersion2_1`
    2_1 = 131073,
    /// `MTLLanguageVersion2_2`
    2_2 = 131074,
    /// `MTLLanguageVersion2_3`
    2_3 = 131075,
    /// `MTLLanguageVersion2_4`
    2_4 = 131076,
    /// `MTLLanguageVersion3_0`
    3_0 = 196608,
    /// `MTLLanguageVersion3_1`
    3_1 = 196609,
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
    r8_unorm_s_rgb = 11,
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
    rg8_unorm_s_rgb = 31,
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
    rgba8_unorm_s_rgb = 71,
    /// `MTLPixelFormatRGBA8Snorm`
    rgba8_snorm = 72,
    /// `MTLPixelFormatRGBA8Uint`
    rgba8_uint = 73,
    /// `MTLPixelFormatRGBA8Sint`
    rgba8_sint = 74,
    /// `MTLPixelFormatBGRA8Unorm`
    bgra8_unorm = 80,
    /// `MTLPixelFormatBGRA8Unorm_sRGB`
    bgra8_unorm_s_rgb = 81,
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
    bgr10_xr_s_rgb = 555,
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
    bgra10_xr_s_rgb = 553,
    /// `MTLPixelFormatRGBA32Uint`
    rgba32_uint = 123,
    /// `MTLPixelFormatRGBA32Sint`
    rgba32_sint = 124,
    /// `MTLPixelFormatRGBA32Float`
    rgba32_float = 125,
    /// `MTLPixelFormatBC1_RGBA`
    bc1_rgba = 130,
    /// `MTLPixelFormatBC1_RGBA_sRGB`
    bc1_rgba_s_rgb = 131,
    /// `MTLPixelFormatBC2_RGBA`
    bc2_rgba = 132,
    /// `MTLPixelFormatBC2_RGBA_sRGB`
    bc2_rgba_s_rgb = 133,
    /// `MTLPixelFormatBC3_RGBA`
    bc3_rgba = 134,
    /// `MTLPixelFormatBC3_RGBA_sRGB`
    bc3_rgba_s_rgb = 135,
    /// `MTLPixelFormatBC4_RUnorm`
    bc4_runorm = 140,
    /// `MTLPixelFormatBC4_RSnorm`
    bc4_rsnorm = 141,
    /// `MTLPixelFormatBC5_RGUnorm`
    bc5_rgunorm = 142,
    /// `MTLPixelFormatBC5_RGSnorm`
    bc5_rgsnorm = 143,
    /// `MTLPixelFormatBC6H_RGBFloat`
    bc6_h_rgbfloat = 150,
    /// `MTLPixelFormatBC6H_RGBUfloat`
    bc6_h_rgbufloat = 151,
    /// `MTLPixelFormatBC7_RGBAUnorm`
    bc7_rgbaunorm = 152,
    /// `MTLPixelFormatBC7_RGBAUnorm_sRGB`
    bc7_rgbaunorm_s_rgb = 153,
    /// `MTLPixelFormatPVRTC_RGB_2BPP`
    pvrtc_rgb_2_bpp = 160,
    /// `MTLPixelFormatPVRTC_RGB_2BPP_sRGB`
    pvrtc_rgb_2_bpp_s_rgb = 161,
    /// `MTLPixelFormatPVRTC_RGB_4BPP`
    pvrtc_rgb_4_bpp = 162,
    /// `MTLPixelFormatPVRTC_RGB_4BPP_sRGB`
    pvrtc_rgb_4_bpp_s_rgb = 163,
    /// `MTLPixelFormatPVRTC_RGBA_2BPP`
    pvrtc_rgba_2_bpp = 164,
    /// `MTLPixelFormatPVRTC_RGBA_2BPP_sRGB`
    pvrtc_rgba_2_bpp_s_rgb = 165,
    /// `MTLPixelFormatPVRTC_RGBA_4BPP`
    pvrtc_rgba_4_bpp = 166,
    /// `MTLPixelFormatPVRTC_RGBA_4BPP_sRGB`
    pvrtc_rgba_4_bpp_s_rgb = 167,
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
    eac_rgba8_s_rgb = 179,
    /// `MTLPixelFormatETC2_RGB8`
    etc2_rgb8 = 180,
    /// `MTLPixelFormatETC2_RGB8_sRGB`
    etc2_rgb8_s_rgb = 181,
    /// `MTLPixelFormatETC2_RGB8A1`
    etc2_rgb8_a1 = 182,
    /// `MTLPixelFormatETC2_RGB8A1_sRGB`
    etc2_rgb8_a1_s_rgb = 183,
    /// `MTLPixelFormatASTC_4x4_sRGB`
    astc_4_x4_s_rgb = 186,
    /// `MTLPixelFormatASTC_5x4_sRGB`
    astc_5_x4_s_rgb = 187,
    /// `MTLPixelFormatASTC_5x5_sRGB`
    astc_5_x5_s_rgb = 188,
    /// `MTLPixelFormatASTC_6x5_sRGB`
    astc_6_x5_s_rgb = 189,
    /// `MTLPixelFormatASTC_6x6_sRGB`
    astc_6_x6_s_rgb = 190,
    /// `MTLPixelFormatASTC_8x5_sRGB`
    astc_8_x5_s_rgb = 192,
    /// `MTLPixelFormatASTC_8x6_sRGB`
    astc_8_x6_s_rgb = 193,
    /// `MTLPixelFormatASTC_8x8_sRGB`
    astc_8_x8_s_rgb = 194,
    /// `MTLPixelFormatASTC_10x5_sRGB`
    astc_10_x5_s_rgb = 195,
    /// `MTLPixelFormatASTC_10x6_sRGB`
    astc_10_x6_s_rgb = 196,
    /// `MTLPixelFormatASTC_10x8_sRGB`
    astc_10_x8_s_rgb = 197,
    /// `MTLPixelFormatASTC_10x10_sRGB`
    astc_10_x10_s_rgb = 198,
    /// `MTLPixelFormatASTC_12x10_sRGB`
    astc_12_x10_s_rgb = 199,
    /// `MTLPixelFormatASTC_12x12_sRGB`
    astc_12_x12_s_rgb = 200,
    /// `MTLPixelFormatASTC_4x4_LDR`
    astc_4_x4_ldr = 204,
    /// `MTLPixelFormatASTC_5x4_LDR`
    astc_5_x4_ldr = 205,
    /// `MTLPixelFormatASTC_5x5_LDR`
    astc_5_x5_ldr = 206,
    /// `MTLPixelFormatASTC_6x5_LDR`
    astc_6_x5_ldr = 207,
    /// `MTLPixelFormatASTC_6x6_LDR`
    astc_6_x6_ldr = 208,
    /// `MTLPixelFormatASTC_8x5_LDR`
    astc_8_x5_ldr = 210,
    /// `MTLPixelFormatASTC_8x6_LDR`
    astc_8_x6_ldr = 211,
    /// `MTLPixelFormatASTC_8x8_LDR`
    astc_8_x8_ldr = 212,
    /// `MTLPixelFormatASTC_10x5_LDR`
    astc_10_x5_ldr = 213,
    /// `MTLPixelFormatASTC_10x6_LDR`
    astc_10_x6_ldr = 214,
    /// `MTLPixelFormatASTC_10x8_LDR`
    astc_10_x8_ldr = 215,
    /// `MTLPixelFormatASTC_10x10_LDR`
    astc_10_x10_ldr = 216,
    /// `MTLPixelFormatASTC_12x10_LDR`
    astc_12_x10_ldr = 217,
    /// `MTLPixelFormatASTC_12x12_LDR`
    astc_12_x12_ldr = 218,
    /// `MTLPixelFormatASTC_4x4_HDR`
    astc_4_x4_hdr = 222,
    /// `MTLPixelFormatASTC_5x4_HDR`
    astc_5_x4_hdr = 223,
    /// `MTLPixelFormatASTC_5x5_HDR`
    astc_5_x5_hdr = 224,
    /// `MTLPixelFormatASTC_6x5_HDR`
    astc_6_x5_hdr = 225,
    /// `MTLPixelFormatASTC_6x6_HDR`
    astc_6_x6_hdr = 226,
    /// `MTLPixelFormatASTC_8x5_HDR`
    astc_8_x5_hdr = 228,
    /// `MTLPixelFormatASTC_8x6_HDR`
    astc_8_x6_hdr = 229,
    /// `MTLPixelFormatASTC_8x8_HDR`
    astc_8_x8_hdr = 230,
    /// `MTLPixelFormatASTC_10x5_HDR`
    astc_10_x5_hdr = 231,
    /// `MTLPixelFormatASTC_10x6_HDR`
    astc_10_x6_hdr = 232,
    /// `MTLPixelFormatASTC_10x8_HDR`
    astc_10_x8_hdr = 233,
    /// `MTLPixelFormatASTC_10x10_HDR`
    astc_10_x10_hdr = 234,
    /// `MTLPixelFormatASTC_12x10_HDR`
    astc_12_x10_hdr = 235,
    /// `MTLPixelFormatASTC_12x12_HDR`
    astc_12_x12_hdr = 236,
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
pub const ColorWriteMask = enum(usize) {
    /// `MTLColorWriteMaskNone`
    none = 0,
    /// `MTLColorWriteMaskRed`
    red = 8,
    /// `MTLColorWriteMaskGreen`
    green = 4,
    /// `MTLColorWriteMaskBlue`
    blue = 2,
    /// `MTLColorWriteMaskAlpha`
    alpha = 1,
    /// `MTLColorWriteMaskAll`
    all = 15,
    _,
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

/// `MTLResourceOptions`
pub const ResourceOptions = enum(usize) {
    /// `MTLResourceCPUCacheModeDefaultCache`
    mtlresource_cpucache_mode_default_cache = 0,
    /// `MTLResourceCPUCacheModeWriteCombined`
    mtlresource_cpucache_mode_write_combined = 1,
    /// `MTLResourceStorageModeShared`
    mtlresource_storage_mode_shared = 0,
    /// `MTLResourceStorageModeManaged`
    mtlresource_storage_mode_managed = 16,
    /// `MTLResourceStorageModePrivate`
    mtlresource_storage_mode_private = 32,
    /// `MTLResourceStorageModeMemoryless`
    mtlresource_storage_mode_memoryless = 48,
    /// `MTLResourceHazardTrackingModeDefault`
    mtlresource_hazard_tracking_mode_default = 0,
    /// `MTLResourceHazardTrackingModeUntracked`
    mtlresource_hazard_tracking_mode_untracked = 256,
    /// `MTLResourceHazardTrackingModeTracked`
    mtlresource_hazard_tracking_mode_tracked = 512,
    /// `MTLResourceOptionCPUCacheModeDefault`
    mtlresource_option_cpucache_mode_default = 0,
    /// `MTLResourceOptionCPUCacheModeWriteCombined`
    mtlresource_option_cpucache_mode_write_combined = 1,
    _,
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
    1d = 0,
    /// `MTLTextureType1DArray`
    1_darray = 1,
    /// `MTLTextureType2D`
    2d = 2,
    /// `MTLTextureType2DArray`
    2_darray = 3,
    /// `MTLTextureType2DMultisample`
    2_dmultisample = 4,
    /// `MTLTextureTypeCube`
    cube = 5,
    /// `MTLTextureTypeCubeArray`
    cube_array = 6,
    /// `MTLTextureType3D`
    3d = 7,
    /// `MTLTextureType2DMultisampleArray`
    2_dmultisample_array = 8,
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
