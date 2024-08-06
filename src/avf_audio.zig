const c = @import("../c.zig");
const cf = @import("../core_foundation/cf.zig");
const ns = @import("../foundation/ns.zig");

// ------------------------------------------------------------------------------------------------
// Types

pub const AVAudioSessionCategory = *ns.String;
pub const AVAudioSessionMode = *ns.String;
pub const AVAudioSessionPort = *ns.String;
pub const AVAudioSessionPolarPattern = *ns.String;
pub const AVAudioSessionLocation = *ns.String;
pub const AVAudioSessionOrientation = *ns.String;

pub const AudioChannelLabel = u32;

// TODO - can we use definition in ns
extern const _NSConcreteStackBlock: *anyopaque;

pub const AVAudioSessionCategoryOptions = ns.UInteger;
pub const AVAudioSessionCategoryOptionMixWithOthers: AVAudioSessionCategoryOptions = 1;
pub const AVAudioSessionCategoryOptionDuckOthers: AVAudioSessionCategoryOptions = 2;
pub const AVAudioSessionCategoryOptionAllowBluetooth: AVAudioSessionCategoryOptions = 4;
pub const AVAudioSessionCategoryOptionDefaultToSpeaker: AVAudioSessionCategoryOptions = 8;
pub const AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers: AVAudioSessionCategoryOptions = 17;
pub const AVAudioSessionCategoryOptionAllowBluetoothA2DP: AVAudioSessionCategoryOptions = 32;
pub const AVAudioSessionCategoryOptionAllowAirPlay: AVAudioSessionCategoryOptions = 64;
pub const AVAudioSessionCategoryOptionOverrideMutedMicrophoneInterruption: AVAudioSessionCategoryOptions = 128;

pub const AVAudioSessionRouteSharingPolicy = ns.UInteger;
pub const AVAudioSessionRouteSharingPolicyDefault: AVAudioSessionRouteSharingPolicy = 0;
pub const AVAudioSessionRouteSharingPolicyLongFormAudio: AVAudioSessionRouteSharingPolicy = 1;
pub const AVAudioSessionRouteSharingPolicyLongForm: AVAudioSessionRouteSharingPolicy = 1;
pub const AVAudioSessionRouteSharingPolicyIndependent: AVAudioSessionRouteSharingPolicy = 2;
pub const AVAudioSessionRouteSharingPolicyLongFormVideo: AVAudioSessionRouteSharingPolicy = 3;

pub const AVAudioSessionPortOverride = ns.UInteger;
pub const AVAudioSessionPortOverrideNone: AVAudioSessionPortOverride = 0;
pub const AVAudioSessionPortOverrideSpeaker: AVAudioSessionPortOverride = 1936747378;

pub const AVAudioSessionRecordPermission = ns.UInteger;
pub const AVAudioSessionRecordPermissionUndetermined: AVAudioSessionRecordPermission = 1970168948;
pub const AVAudioSessionRecordPermissionDenied: AVAudioSessionRecordPermission = 1684369017;
pub const AVAudioSessionRecordPermissionGranted: AVAudioSessionRecordPermission = 1735552628;

pub const AVAudioSessionSetActiveOptions = ns.UInteger;
pub const AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation: AVAudioSessionSetActiveOptions = 1;

pub const AVAudioSessionActivationOptions = ns.UInteger;
pub const AVAudioSessionActivationOptionNone: AVAudioSessionActivationOptions = 0;

pub const AVAudioStereoOrientation = ns.Integer;
pub const AVAudioStereoOrientationNone: AVAudioStereoOrientation = 0;
pub const AVAudioStereoOrientationPortrait: AVAudioStereoOrientation = 1;
pub const AVAudioStereoOrientationPortraitUpsideDown: AVAudioStereoOrientation = 2;
pub const AVAudioStereoOrientationLandscapeRight: AVAudioStereoOrientation = 3;
pub const AVAudioStereoOrientationLandscapeLeft: AVAudioStereoOrientation = 4;

pub const AVAudioSessionPromptStyle = ns.UInteger;
pub const AVAudioSessionPromptStyleNone: AVAudioSessionPromptStyle = 1852796517;
pub const AVAudioSessionPromptStyleShort: AVAudioSessionPromptStyle = 1936224884;
pub const AVAudioSessionPromptStyleNormal: AVAudioSessionPromptStyle = 1852992876;

pub const AVAudioSessionIOType = ns.UInteger;
pub const AVAudioSessionIOTypeNotSpecified: AVAudioSessionIOType = 0;
pub const AVAudioSessionIOTypeAggregated: AVAudioSessionIOType = 1;

pub const AVAudioSession = opaque {
    pub fn class() *c.objc_class {
        return class_AVAudioSession;
    }
    pub usingnamespace Methods(AVAudioSession);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn sharedInstance() *AVAudioSession {
                return @as(*const fn (*c.objc_class, *c.objc_selector) callconv(.C) *AVAudioSession, @ptrCast(&c.objc_msgSend))(T.class(), sel_sharedInstance);
            }
            pub fn setCategory_error(self_: *T, category_: AVAudioSessionCategory, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionCategory, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setCategory_error_, category_, outError_);
            }
            pub fn setCategory_withOptions_error(self_: *T, category_: AVAudioSessionCategory, options_: AVAudioSessionCategoryOptions, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionCategory, AVAudioSessionCategoryOptions, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setCategory_withOptions_error_, category_, options_, outError_);
            }
            pub fn setCategory_mode_options_error(self_: *T, category_: AVAudioSessionCategory, mode_: AVAudioSessionMode, options_: *c.objc_object, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionCategory, AVAudioSessionMode, *c.objc_object, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setCategory_mode_options_error_, category_, mode_, options_, outError_);
            }
            pub fn setCategory_mode_routeSharingPolicy_options_error(self_: *T, category_: AVAudioSessionCategory, mode_: AVAudioSessionMode, policy_: AVAudioSessionRouteSharingPolicy, options_: AVAudioSessionCategoryOptions, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionCategory, AVAudioSessionMode, AVAudioSessionRouteSharingPolicy, AVAudioSessionCategoryOptions, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setCategory_mode_routeSharingPolicy_options_error_, category_, mode_, policy_, options_, outError_);
            }
            pub fn setMode_error(self_: *T, mode_: AVAudioSessionMode, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionMode, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setMode_error_, mode_, outError_);
            }
            pub fn setAllowHapticsAndSystemSoundsDuringRecording_error(self_: *T, inValue_: bool, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, bool, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setAllowHapticsAndSystemSoundsDuringRecording_error_, inValue_, outError_);
            }
            pub fn requestRecordPermission(self_: *T, context: anytype, comptime response_: fn (ctx: @TypeOf(context), _: bool) void) void {
                const Literal = ns.BlockLiteral(@TypeOf(context));
                const Helper = struct {
                    pub fn cCallback(literal: *Literal, a0: bool) callconv(.C) void {
                        response_(literal.context, a0);
                    }
                };
                const descriptor = ns.BlockDescriptor{ .reserved = 0, .size = @sizeOf(Literal) };
                const block = Literal{ .isa = _NSConcreteStackBlock, .flags = 0, .reserved = 0, .invoke = @ptrCast(&Helper.cCallback), .descriptor = &descriptor, .context = context };
                return @as(*const fn (*T, *c.objc_selector, *const anyopaque) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_requestRecordPermission_, @ptrCast(&block));
            }
            pub fn overrideOutputAudioPort_error(self_: *T, portOverride_: AVAudioSessionPortOverride, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionPortOverride, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_overrideOutputAudioPort_error_, portOverride_, outError_);
            }
            pub fn setPreferredInput_error(self_: *T, inPort_: ?*AVAudioSessionPortDescription, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ?*AVAudioSessionPortDescription, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredInput_error_, inPort_, outError_);
            }
            pub fn setPrefersNoInterruptionsFromSystemAlerts_error(self_: *T, inValue_: bool, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, bool, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPrefersNoInterruptionsFromSystemAlerts_error_, inValue_, outError_);
            }
            pub fn availableCategories(self_: *T) *ns.Array(AVAudioSessionCategory) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(AVAudioSessionCategory), @ptrCast(&c.objc_msgSend))(self_, sel_availableCategories);
            }
            pub fn category(self_: *T) AVAudioSessionCategory {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionCategory, @ptrCast(&c.objc_msgSend))(self_, sel_category);
            }
            pub fn categoryOptions(self_: *T) AVAudioSessionCategoryOptions {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionCategoryOptions, @ptrCast(&c.objc_msgSend))(self_, sel_categoryOptions);
            }
            pub fn routeSharingPolicy(self_: *T) AVAudioSessionRouteSharingPolicy {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionRouteSharingPolicy, @ptrCast(&c.objc_msgSend))(self_, sel_routeSharingPolicy);
            }
            pub fn availableModes(self_: *T) *ns.Array(AVAudioSessionMode) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(AVAudioSessionMode), @ptrCast(&c.objc_msgSend))(self_, sel_availableModes);
            }
            pub fn mode(self_: *T) AVAudioSessionMode {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionMode, @ptrCast(&c.objc_msgSend))(self_, sel_mode);
            }
            pub fn allowHapticsAndSystemSoundsDuringRecording(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_allowHapticsAndSystemSoundsDuringRecording);
            }
            pub fn recordPermission(self_: *T) AVAudioSessionRecordPermission {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionRecordPermission, @ptrCast(&c.objc_msgSend))(self_, sel_recordPermission);
            }
            pub fn preferredInput(self_: *T) ?*AVAudioSessionPortDescription {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*AVAudioSessionPortDescription, @ptrCast(&c.objc_msgSend))(self_, sel_preferredInput);
            }
            pub fn prefersNoInterruptionsFromSystemAlerts(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_prefersNoInterruptionsFromSystemAlerts);
            }
            pub fn setActive_error(self_: *T, active_: bool, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, bool, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setActive_error_, active_, outError_);
            }
            pub fn setActive_withOptions_error(self_: *T, active_: bool, options_: AVAudioSessionSetActiveOptions, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, bool, AVAudioSessionSetActiveOptions, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setActive_withOptions_error_, active_, options_, outError_);
            }
            pub fn activateWithOptions_completionHandler(self_: *T, options_: AVAudioSessionActivationOptions, context: anytype, comptime handler_: fn (ctx: @TypeOf(context), _: bool, _: ?*ns.Error) void) void {
                const Literal = ns.BlockLiteral(@TypeOf(context));
                const Helper = struct {
                    pub fn cCallback(literal: *Literal, a0: bool, a1: ?*ns.Error) callconv(.C) void {
                        handler_(literal.context, a0, a1);
                    }
                };
                const descriptor = ns.BlockDescriptor{ .reserved = 0, .size = @sizeOf(Literal) };
                const block = Literal{ .isa = _NSConcreteStackBlock, .flags = 0, .reserved = 0, .invoke = @ptrCast(&Helper.cCallback), .descriptor = &descriptor, .context = context };
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionActivationOptions, *const anyopaque) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_activateWithOptions_completionHandler_, options_, @ptrCast(&block));
            }
            pub fn setPreferredSampleRate_error(self_: *T, sampleRate_: f64, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, f64, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredSampleRate_error_, sampleRate_, outError_);
            }
            pub fn setPreferredIOBufferDuration_error(self_: *T, duration_: ns.TimeInterval, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ns.TimeInterval, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredIOBufferDuration_error_, duration_, outError_);
            }
            pub fn setPreferredInputNumberOfChannels_error(self_: *T, count_: ns.Integer, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ns.Integer, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredInputNumberOfChannels_error_, count_, outError_);
            }
            pub fn setPreferredOutputNumberOfChannels_error(self_: *T, count_: ns.Integer, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ns.Integer, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredOutputNumberOfChannels_error_, count_, outError_);
            }
            pub fn setPreferredInputOrientation_error(self_: *T, orientation_: AVAudioStereoOrientation, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioStereoOrientation, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredInputOrientation_error_, orientation_, outError_);
            }
            pub fn setInputGain_error(self_: *T, gain_: f32, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, f32, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setInputGain_error_, gain_, outError_);
            }
            pub fn setInputDataSource_error(self_: *T, dataSource_: ?*AVAudioSessionDataSourceDescription, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ?*AVAudioSessionDataSourceDescription, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setInputDataSource_error_, dataSource_, outError_);
            }
            pub fn setOutputDataSource_error(self_: *T, dataSource_: ?*AVAudioSessionDataSourceDescription, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ?*AVAudioSessionDataSourceDescription, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setOutputDataSource_error_, dataSource_, outError_);
            }
            pub fn preferredSampleRate(self_: *T) f64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f64, @ptrCast(&c.objc_msgSend))(self_, sel_preferredSampleRate);
            }
            pub fn preferredIOBufferDuration(self_: *T) ns.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_preferredIOBufferDuration);
            }
            pub fn preferredInputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_preferredInputNumberOfChannels);
            }
            pub fn preferredOutputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_preferredOutputNumberOfChannels);
            }
            pub fn preferredInputOrientation(self_: *T) AVAudioStereoOrientation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioStereoOrientation, @ptrCast(&c.objc_msgSend))(self_, sel_preferredInputOrientation);
            }
            pub fn inputOrientation(self_: *T) AVAudioStereoOrientation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioStereoOrientation, @ptrCast(&c.objc_msgSend))(self_, sel_inputOrientation);
            }
            pub fn maximumInputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_maximumInputNumberOfChannels);
            }
            pub fn maximumOutputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_maximumOutputNumberOfChannels);
            }
            pub fn inputGain(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_inputGain);
            }
            pub fn isInputGainSettable(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isInputGainSettable);
            }
            pub fn isInputAvailable(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isInputAvailable);
            }
            pub fn inputDataSources(self_: *T) *ns.Array(*AVAudioSessionDataSourceDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(*AVAudioSessionDataSourceDescription), @ptrCast(&c.objc_msgSend))(self_, sel_inputDataSources);
            }
            pub fn inputDataSource(self_: *T) *AVAudioSessionDataSourceDescription {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *AVAudioSessionDataSourceDescription, @ptrCast(&c.objc_msgSend))(self_, sel_inputDataSource);
            }
            pub fn outputDataSources(self_: *T) *ns.Array(*AVAudioSessionDataSourceDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(*AVAudioSessionDataSourceDescription), @ptrCast(&c.objc_msgSend))(self_, sel_outputDataSources);
            }
            pub fn outputDataSource(self_: *T) *AVAudioSessionDataSourceDescription {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *AVAudioSessionDataSourceDescription, @ptrCast(&c.objc_msgSend))(self_, sel_outputDataSource);
            }
            pub fn sampleRate(self_: *T) f64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f64, @ptrCast(&c.objc_msgSend))(self_, sel_sampleRate);
            }
            pub fn inputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_inputNumberOfChannels);
            }
            pub fn outputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_outputNumberOfChannels);
            }
            pub fn inputLatency(self_: *T) ns.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_inputLatency);
            }
            pub fn outputLatency(self_: *T) ns.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_outputLatency);
            }
            pub fn IOBufferDuration(self_: *T) ns.TimeInterval {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.TimeInterval, @ptrCast(&c.objc_msgSend))(self_, sel_IOBufferDuration);
            }
            pub fn isOtherAudioPlaying(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isOtherAudioPlaying);
            }
            pub fn secondaryAudioShouldBeSilencedHint(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_secondaryAudioShouldBeSilencedHint);
            }
            pub fn outputVolume(self_: *T) f32 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f32, @ptrCast(&c.objc_msgSend))(self_, sel_outputVolume);
            }
            pub fn promptStyle(self_: *T) AVAudioSessionPromptStyle {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionPromptStyle, @ptrCast(&c.objc_msgSend))(self_, sel_promptStyle);
            }
            pub fn setAggregatedIOPreference_error(self_: *T, inIOType_: AVAudioSessionIOType, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionIOType, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setAggregatedIOPreference_error_, inIOType_, outError_);
            }
            pub fn availableInputs(self_: *T) *ns.Array(*AVAudioSessionPortDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(*AVAudioSessionPortDescription), @ptrCast(&c.objc_msgSend))(self_, sel_availableInputs);
            }
            pub fn currentRoute(self_: *T) *AVAudioSessionRouteDescription {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *AVAudioSessionRouteDescription, @ptrCast(&c.objc_msgSend))(self_, sel_currentRoute);
            }
            pub fn setActive_withFlags_error(self_: *T, active_: bool, flags_: ns.Integer, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, bool, ns.Integer, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setActive_withFlags_error_, active_, flags_, outError_);
            }
            pub fn setPreferredHardwareSampleRate_error(self_: *T, sampleRate_: f64, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, f64, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredHardwareSampleRate_error_, sampleRate_, outError_);
            }
            pub fn delegate(self_: *T) *AVAudioSessionDelegate {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *AVAudioSessionDelegate, @ptrCast(&c.objc_msgSend))(self_, sel_delegate);
            }
            pub fn setDelegate(self_: *T, delegate_: *AVAudioSessionDelegate) void {
                return @as(*const fn (*T, *c.objc_selector, *AVAudioSessionDelegate) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_setDelegate_, delegate_);
            }
            pub fn inputIsAvailable(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_inputIsAvailable);
            }
            pub fn currentHardwareSampleRate(self_: *T) f64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f64, @ptrCast(&c.objc_msgSend))(self_, sel_currentHardwareSampleRate);
            }
            pub fn currentHardwareInputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_currentHardwareInputNumberOfChannels);
            }
            pub fn currentHardwareOutputNumberOfChannels(self_: *T) ns.Integer {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.Integer, @ptrCast(&c.objc_msgSend))(self_, sel_currentHardwareOutputNumberOfChannels);
            }
            pub fn preferredHardwareSampleRate(self_: *T) f64 {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) f64, @ptrCast(&c.objc_msgSend))(self_, sel_preferredHardwareSampleRate);
            }
        };
    }
};

pub const AVAudioSessionPortDescription = opaque {
    pub fn class() *c.objc_class {
        return class_AVAudioSessionPortDescription;
    }
    pub usingnamespace Methods(AVAudioSessionPortDescription);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn setPreferredDataSource_error(self_: *T, dataSource_: ?*AVAudioSessionDataSourceDescription, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, ?*AVAudioSessionDataSourceDescription, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredDataSource_error_, dataSource_, outError_);
            }
            pub fn portType(self_: *T) AVAudioSessionPort {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionPort, @ptrCast(&c.objc_msgSend))(self_, sel_portType);
            }
            pub fn portName(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_portName);
            }
            pub fn UID(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_UID);
            }
            pub fn hasHardwareVoiceCallProcessing(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_hasHardwareVoiceCallProcessing);
            }
            pub fn isSpatialAudioEnabled(self_: *T) bool {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_isSpatialAudioEnabled);
            }
            pub fn channels(self_: *T) *ns.Array(*AVAudioSessionChannelDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(*AVAudioSessionChannelDescription), @ptrCast(&c.objc_msgSend))(self_, sel_channels);
            }
            pub fn dataSources(self_: *T) ?*ns.Array(*AVAudioSessionDataSourceDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.Array(*AVAudioSessionDataSourceDescription), @ptrCast(&c.objc_msgSend))(self_, sel_dataSources);
            }
            pub fn selectedDataSource(self_: *T) ?*AVAudioSessionDataSourceDescription {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*AVAudioSessionDataSourceDescription, @ptrCast(&c.objc_msgSend))(self_, sel_selectedDataSource);
            }
            pub fn preferredDataSource(self_: *T) ?*AVAudioSessionDataSourceDescription {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*AVAudioSessionDataSourceDescription, @ptrCast(&c.objc_msgSend))(self_, sel_preferredDataSource);
            }
        };
    }
};

pub const AVAudioSessionDataSourceDescription = opaque {
    pub fn class() *c.objc_class {
        return class_AVAudioSessionDataSourceDescription;
    }
    pub usingnamespace Methods(AVAudioSessionDataSourceDescription);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn setPreferredPolarPattern_error(self_: *T, pattern_: AVAudioSessionPolarPattern, outError_: ?*?*ns.Error) bool {
                return @as(*const fn (*T, *c.objc_selector, AVAudioSessionPolarPattern, ?*?*ns.Error) callconv(.C) bool, @ptrCast(&c.objc_msgSend))(self_, sel_setPreferredPolarPattern_error_, pattern_, outError_);
            }
            pub fn dataSourceID(self_: *T) *ns.Number {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Number, @ptrCast(&c.objc_msgSend))(self_, sel_dataSourceID);
            }
            pub fn dataSourceName(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_dataSourceName);
            }
            pub fn location(self_: *T) AVAudioSessionLocation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionLocation, @ptrCast(&c.objc_msgSend))(self_, sel_location);
            }
            pub fn orientation(self_: *T) AVAudioSessionOrientation {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionOrientation, @ptrCast(&c.objc_msgSend))(self_, sel_orientation);
            }
            pub fn supportedPolarPatterns(self_: *T) ?*ns.Array(AVAudioSessionPolarPattern) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ?*ns.Array(AVAudioSessionPolarPattern), @ptrCast(&c.objc_msgSend))(self_, sel_supportedPolarPatterns);
            }
            pub fn selectedPolarPattern(self_: *T) AVAudioSessionPolarPattern {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionPolarPattern, @ptrCast(&c.objc_msgSend))(self_, sel_selectedPolarPattern);
            }
            pub fn preferredPolarPattern(self_: *T) AVAudioSessionPolarPattern {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AVAudioSessionPolarPattern, @ptrCast(&c.objc_msgSend))(self_, sel_preferredPolarPattern);
            }
        };
    }
};

pub const AVAudioSessionRouteDescription = opaque {
    pub fn class() *c.objc_class {
        return class_AVAudioSessionRouteDescription;
    }
    pub usingnamespace Methods(AVAudioSessionRouteDescription);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn inputs(self_: *T) *ns.Array(*AVAudioSessionPortDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(*AVAudioSessionPortDescription), @ptrCast(&c.objc_msgSend))(self_, sel_inputs);
            }
            pub fn outputs(self_: *T) *ns.Array(*AVAudioSessionPortDescription) {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.Array(*AVAudioSessionPortDescription), @ptrCast(&c.objc_msgSend))(self_, sel_outputs);
            }
        };
    }
};

pub const AVAudioSessionChannelDescription = opaque {
    pub fn class() *c.objc_class {
        return class_AVAudioSessionChannelDescription;
    }
    pub usingnamespace Methods(AVAudioSessionChannelDescription);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectInterface.Methods(T);

            pub fn channelName(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_channelName);
            }
            pub fn owningPortUID(self_: *T) *ns.String {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) *ns.String, @ptrCast(&c.objc_msgSend))(self_, sel_owningPortUID);
            }
            pub fn channelNumber(self_: *T) ns.UInteger {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) ns.UInteger, @ptrCast(&c.objc_msgSend))(self_, sel_channelNumber);
            }
            pub fn channelLabel(self_: *T) AudioChannelLabel {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) AudioChannelLabel, @ptrCast(&c.objc_msgSend))(self_, sel_channelLabel);
            }
        };
    }
};

pub const AVAudioSessionDelegate = opaque {
    pub usingnamespace Methods(AVAudioSessionDelegate);

    pub fn Methods(comptime T: type) type {
        return struct {
            pub usingnamespace ns.ObjectProtocol.Methods(T);

            pub fn beginInterruption(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_beginInterruption);
            }
            pub fn endInterruptionWithFlags(self_: *T, flags_: ns.UInteger) void {
                return @as(*const fn (*T, *c.objc_selector, ns.UInteger) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_endInterruptionWithFlags_, flags_);
            }
            pub fn endInterruption(self_: *T) void {
                return @as(*const fn (*T, *c.objc_selector) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_endInterruption);
            }
            pub fn inputIsAvailableChanged(self_: *T, isInputAvailable_: bool) void {
                return @as(*const fn (*T, *c.objc_selector, bool) callconv(.C) void, @ptrCast(&c.objc_msgSend))(self_, sel_inputIsAvailableChanged_, isInputAvailable_);
            }
        };
    }
};
