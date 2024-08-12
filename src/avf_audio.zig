const objc = @import("objc.zig");
const cf = @import("core_foundation.zig");
const ns = @import("foundation.zig");

pub const AudioSessionCategory = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;
};
pub const AudioSessionMode = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;
};
pub const AudioSessionPort = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;
};
pub const AudioSessionPolarPattern = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;
};
pub const AudioSessionLocation = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;
};
pub const AudioSessionOrientation = opaque {
    pub const InternalInfo = objc.AliasClass(@This(), ns.String);
    pub const as = InternalInfo.as;
};

pub const AudioChannelLabel = enum(u32) {
    _,
};

/// `AVAudioSessionCategoryOptions`
pub const AudioSessionCategoryOptions = packed struct(usize) {
    /// `AVAudioSessionCategoryOptionMixWithOthers`
    mix_with_others: bool = false,
    /// `AVAudioSessionCategoryOptionDuckOthers`
    duck_others: bool = false,
    /// `AVAudioSessionCategoryOptionAllowBluetooth`
    allow_bluetooth: bool = false,
    /// `AVAudioSessionCategoryOptionDefaultToSpeaker`
    default_to_speaker: bool = false,
    /// `AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers`
    interrupt_spoken_audio: bool = false,
    /// `AVAudioSessionCategoryOptionAllowBluetoothA2DP`
    allow_bluetooth_a2_dp: bool = false,
    /// `AVAudioSessionCategoryOptionAllowAirPlay`
    allow_air_play: bool = false,
    /// `AVAudioSessionCategoryOptionOverrideMutedMicrophoneInterruption`
    override_muted_microphone_interruption: bool = false,
    _padding: u56 = 0,

    /// `AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers`
    pub const interrupt_spoken_audio_and_mix_with_others = .{ .mix_with_others = true, .interrupt_spoken_audio = true };
};

/// `AVAudioSessionRouteSharingPolicy`
pub const AudioSessionRouteSharingPolicy = enum(usize) {
    /// `AVAudioSessionRouteSharingPolicyDefault`
    default = 0,
    /// `AVAudioSessionRouteSharingPolicyLongFormAudio`
    long_form_audio = 1,
    /// `AVAudioSessionRouteSharingPolicyIndependent`
    independent = 2,
    /// `AVAudioSessionRouteSharingPolicyLongFormVideo`
    long_form_video = 3,
    _,
};

/// `AVAudioSessionPortOverride`
pub const AudioSessionPortOverride = enum(usize) {
    /// `AVAudioSessionPortOverrideNone`
    none = 0,
    /// `AVAudioSessionPortOverrideSpeaker`
    speaker = 1936747378,
    _,
};

/// `AVAudioSessionRecordPermission`
pub const AudioSessionRecordPermission = enum(usize) {
    /// `AVAudioSessionRecordPermissionUndetermined`
    undetermined = 1970168948,
    /// `AVAudioSessionRecordPermissionDenied`
    denied = 1684369017,
    /// `AVAudioSessionRecordPermissionGranted`
    granted = 1735552628,
    _,
};

/// `AVAudioSessionSetActiveOptions`
pub const AudioSessionSetActiveOptions = packed struct(usize) {
    /// `AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation`
    notify_others_on_deactivation: bool = false,
    _padding: u63 = 0,
};

/// `AVAudioSessionActivationOptions`
pub const AudioSessionActivationOptions = packed struct(usize) {
    _padding: u64 = 0,

    /// `AVAudioSessionActivationOptionNone`
    pub const none: AudioSessionActivationOptions = .{};
};

/// `AVAudioStereoOrientation`
pub const AudioStereoOrientation = enum(isize) {
    /// `AVAudioStereoOrientationNone`
    none = 0,
    /// `AVAudioStereoOrientationPortrait`
    portrait = 1,
    /// `AVAudioStereoOrientationPortraitUpsideDown`
    portrait_upside_down = 2,
    /// `AVAudioStereoOrientationLandscapeRight`
    landscape_right = 3,
    /// `AVAudioStereoOrientationLandscapeLeft`
    landscape_left = 4,
    _,
};

/// `AVAudioSessionPromptStyle`
pub const AudioSessionPromptStyle = enum(usize) {
    /// `AVAudioSessionPromptStyleNone`
    none = 1852796517,
    /// `AVAudioSessionPromptStyleShort`
    short = 1936224884,
    /// `AVAudioSessionPromptStyleNormal`
    normal = 1852992876,
    _,
};

/// `AVAudioSessionIOType`
pub const AudioSessionIoType = enum(usize) {
    /// `AVAudioSessionIOTypeNotSpecified`
    not_specified = 0,
    /// `AVAudioSessionIOTypeAggregated`
    aggregated = 1,
    _,
};

/// `AVAudioSession`
pub const AudioSession = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[AVAudioSession new]`
    pub const new = InternalInfo.new;
    /// `+[AVAudioSession alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[AVAudioSession alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `+[AVAudioSession sharedInstance]
    pub fn sharedInstance() *AudioSession {
        return objc.msgSend(InternalInfo.class(), "sharedInstance", *AudioSession, .{});
    }
    /// `-[AVAudioSession setCategory:error:]
    pub fn setCategory_error_(self: *@This(), session_category: AudioSessionCategory, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setCategory:error:", bool, .{ session_category, out_error });
    }
    /// `-[AVAudioSession setCategory:withOptions:error:]
    pub fn setCategory_withOptions_error_(self: *@This(), session_category: AudioSessionCategory, options: AudioSessionCategoryOptions, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setCategory:withOptions:error:", bool, .{ session_category, options, out_error });
    }
    /// `-[AVAudioSession setCategory:mode:options:error:]
    pub fn setCategory_mode_options_error_(self: *@This(), session_category: AudioSessionCategory, session_mode: AudioSessionMode, options: *objc.Id, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setCategory:mode:options:error:", bool, .{ session_category, session_mode, options, out_error });
    }
    /// `-[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:]
    pub fn setCategory_mode_routeSharingPolicy_options_error_(self: *@This(), session_category: AudioSessionCategory, session_mode: AudioSessionMode, policy: AudioSessionRouteSharingPolicy, options: AudioSessionCategoryOptions, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setCategory:mode:routeSharingPolicy:options:error:", bool, .{ session_category, session_mode, policy, options, out_error });
    }
    /// `-[AVAudioSession setMode:error:]
    pub fn setMode_error_(self: *@This(), session_mode: AudioSessionMode, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setMode:error:", bool, .{ session_mode, out_error });
    }
    /// `-[AVAudioSession setAllowHapticsAndSystemSoundsDuringRecording:error:]
    pub fn setAllowHapticsAndSystemSoundsDuringRecording_error_(self: *@This(), in_value: bool, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setAllowHapticsAndSystemSoundsDuringRecording:error:", bool, .{ in_value, out_error });
    }
    /// `-[AVAudioSession requestRecordPermission:]
    pub fn requestRecordPermission_(self: *@This(), response: *ns.Block(fn (bool) void)) void {
        return objc.msgSend(self, "requestRecordPermission:", void, .{response});
    }
    /// `-[AVAudioSession overrideOutputAudioPort:error:]
    pub fn overrideOutputAudioPort_error_(self: *@This(), port_override: AudioSessionPortOverride, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "overrideOutputAudioPort:error:", bool, .{ port_override, out_error });
    }
    /// `-[AVAudioSession setPreferredInput:error:]
    pub fn setPreferredInput_error_(self: *@This(), in_port: ?*AudioSessionPortDescription, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredInput:error:", bool, .{ in_port, out_error });
    }
    /// `-[AVAudioSession setPrefersNoInterruptionsFromSystemAlerts:error:]
    pub fn setPrefersNoInterruptionsFromSystemAlerts_error_(self: *@This(), in_value: bool, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPrefersNoInterruptionsFromSystemAlerts:error:", bool, .{ in_value, out_error });
    }
    /// `-[AVAudioSession availableCategories]
    pub fn availableCategories(self: *@This()) *ns.Array(AudioSessionCategory) {
        return objc.msgSend(self, "availableCategories", *ns.Array(AudioSessionCategory), .{});
    }
    /// `-[AVAudioSession category]
    pub fn category(self: *@This()) AudioSessionCategory {
        return objc.msgSend(self, "category", AudioSessionCategory, .{});
    }
    /// `-[AVAudioSession categoryOptions]
    pub fn categoryOptions(self: *@This()) AudioSessionCategoryOptions {
        return objc.msgSend(self, "categoryOptions", AudioSessionCategoryOptions, .{});
    }
    /// `-[AVAudioSession routeSharingPolicy]
    pub fn routeSharingPolicy(self: *@This()) AudioSessionRouteSharingPolicy {
        return objc.msgSend(self, "routeSharingPolicy", AudioSessionRouteSharingPolicy, .{});
    }
    /// `-[AVAudioSession availableModes]
    pub fn availableModes(self: *@This()) *ns.Array(AudioSessionMode) {
        return objc.msgSend(self, "availableModes", *ns.Array(AudioSessionMode), .{});
    }
    /// `-[AVAudioSession mode]
    pub fn mode(self: *@This()) AudioSessionMode {
        return objc.msgSend(self, "mode", AudioSessionMode, .{});
    }
    /// `-[AVAudioSession allowHapticsAndSystemSoundsDuringRecording]
    pub fn allowHapticsAndSystemSoundsDuringRecording(self: *@This()) bool {
        return objc.msgSend(self, "allowHapticsAndSystemSoundsDuringRecording", bool, .{});
    }
    /// `-[AVAudioSession recordPermission]
    pub fn recordPermission(self: *@This()) AudioSessionRecordPermission {
        return objc.msgSend(self, "recordPermission", AudioSessionRecordPermission, .{});
    }
    /// `-[AVAudioSession preferredInput]
    pub fn preferredInput(self: *@This()) ?*AudioSessionPortDescription {
        return objc.msgSend(self, "preferredInput", ?*AudioSessionPortDescription, .{});
    }
    /// `-[AVAudioSession prefersNoInterruptionsFromSystemAlerts]
    pub fn prefersNoInterruptionsFromSystemAlerts(self: *@This()) bool {
        return objc.msgSend(self, "prefersNoInterruptionsFromSystemAlerts", bool, .{});
    }
    /// `-[AVAudioSession setActive:error:]
    pub fn setActive_error_(self: *@This(), active: bool, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setActive:error:", bool, .{ active, out_error });
    }
    /// `-[AVAudioSession setActive:withOptions:error:]
    pub fn setActive_withOptions_error_(self: *@This(), active: bool, options: AudioSessionSetActiveOptions, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setActive:withOptions:error:", bool, .{ active, options, out_error });
    }
    /// `-[AVAudioSession activateWithOptions:completionHandler:]
    pub fn activateWithOptions_completionHandler_(self: *@This(), options: AudioSessionActivationOptions, handler: *ns.Block(fn (bool, ?*ns.Error) void)) void {
        return objc.msgSend(self, "activateWithOptions:completionHandler:", void, .{ options, handler });
    }
    /// `-[AVAudioSession setPreferredSampleRate:error:]
    pub fn setPreferredSampleRate_error_(self: *@This(), sample_rate: f64, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredSampleRate:error:", bool, .{ sample_rate, out_error });
    }
    /// `-[AVAudioSession setPreferredIOBufferDuration:error:]
    pub fn setPreferredIOBufferDuration_error_(self: *@This(), duration: ns.TimeInterval, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredIOBufferDuration:error:", bool, .{ duration, out_error });
    }
    /// `-[AVAudioSession setPreferredInputNumberOfChannels:error:]
    pub fn setPreferredInputNumberOfChannels_error_(self: *@This(), count: isize, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredInputNumberOfChannels:error:", bool, .{ count, out_error });
    }
    /// `-[AVAudioSession setPreferredOutputNumberOfChannels:error:]
    pub fn setPreferredOutputNumberOfChannels_error_(self: *@This(), count: isize, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredOutputNumberOfChannels:error:", bool, .{ count, out_error });
    }
    /// `-[AVAudioSession setPreferredInputOrientation:error:]
    pub fn setPreferredInputOrientation_error_(self: *@This(), orientation: AudioStereoOrientation, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredInputOrientation:error:", bool, .{ orientation, out_error });
    }
    /// `-[AVAudioSession setInputGain:error:]
    pub fn setInputGain_error_(self: *@This(), gain: f32, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setInputGain:error:", bool, .{ gain, out_error });
    }
    /// `-[AVAudioSession setInputDataSource:error:]
    pub fn setInputDataSource_error_(self: *@This(), data_source: ?*AudioSessionDataSourceDescription, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setInputDataSource:error:", bool, .{ data_source, out_error });
    }
    /// `-[AVAudioSession setOutputDataSource:error:]
    pub fn setOutputDataSource_error_(self: *@This(), data_source: ?*AudioSessionDataSourceDescription, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setOutputDataSource:error:", bool, .{ data_source, out_error });
    }
    /// `-[AVAudioSession preferredSampleRate]
    pub fn preferredSampleRate(self: *@This()) f64 {
        return objc.msgSend(self, "preferredSampleRate", f64, .{});
    }
    /// `-[AVAudioSession preferredIOBufferDuration]
    pub fn preferredIOBufferDuration(self: *@This()) ns.TimeInterval {
        return objc.msgSend(self, "preferredIOBufferDuration", ns.TimeInterval, .{});
    }
    /// `-[AVAudioSession preferredInputNumberOfChannels]
    pub fn preferredInputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "preferredInputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession preferredOutputNumberOfChannels]
    pub fn preferredOutputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "preferredOutputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession preferredInputOrientation]
    pub fn preferredInputOrientation(self: *@This()) AudioStereoOrientation {
        return objc.msgSend(self, "preferredInputOrientation", AudioStereoOrientation, .{});
    }
    /// `-[AVAudioSession inputOrientation]
    pub fn inputOrientation(self: *@This()) AudioStereoOrientation {
        return objc.msgSend(self, "inputOrientation", AudioStereoOrientation, .{});
    }
    /// `-[AVAudioSession maximumInputNumberOfChannels]
    pub fn maximumInputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "maximumInputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession maximumOutputNumberOfChannels]
    pub fn maximumOutputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "maximumOutputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession inputGain]
    pub fn inputGain(self: *@This()) f32 {
        return objc.msgSend(self, "inputGain", f32, .{});
    }
    /// `-[AVAudioSession isInputGainSettable]
    pub fn isInputGainSettable(self: *@This()) bool {
        return objc.msgSend(self, "isInputGainSettable", bool, .{});
    }
    /// `-[AVAudioSession isInputAvailable]
    pub fn isInputAvailable(self: *@This()) bool {
        return objc.msgSend(self, "isInputAvailable", bool, .{});
    }
    /// `-[AVAudioSession inputDataSources]
    pub fn inputDataSources(self: *@This()) *ns.Array(AudioSessionDataSourceDescription) {
        return objc.msgSend(self, "inputDataSources", *ns.Array(AudioSessionDataSourceDescription), .{});
    }
    /// `-[AVAudioSession inputDataSource]
    pub fn inputDataSource(self: *@This()) *AudioSessionDataSourceDescription {
        return objc.msgSend(self, "inputDataSource", *AudioSessionDataSourceDescription, .{});
    }
    /// `-[AVAudioSession outputDataSources]
    pub fn outputDataSources(self: *@This()) *ns.Array(AudioSessionDataSourceDescription) {
        return objc.msgSend(self, "outputDataSources", *ns.Array(AudioSessionDataSourceDescription), .{});
    }
    /// `-[AVAudioSession outputDataSource]
    pub fn outputDataSource(self: *@This()) *AudioSessionDataSourceDescription {
        return objc.msgSend(self, "outputDataSource", *AudioSessionDataSourceDescription, .{});
    }
    /// `-[AVAudioSession sampleRate]
    pub fn sampleRate(self: *@This()) f64 {
        return objc.msgSend(self, "sampleRate", f64, .{});
    }
    /// `-[AVAudioSession inputNumberOfChannels]
    pub fn inputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "inputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession outputNumberOfChannels]
    pub fn outputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "outputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession inputLatency]
    pub fn inputLatency(self: *@This()) ns.TimeInterval {
        return objc.msgSend(self, "inputLatency", ns.TimeInterval, .{});
    }
    /// `-[AVAudioSession outputLatency]
    pub fn outputLatency(self: *@This()) ns.TimeInterval {
        return objc.msgSend(self, "outputLatency", ns.TimeInterval, .{});
    }
    /// `-[AVAudioSession IOBufferDuration]
    pub fn IOBufferDuration(self: *@This()) ns.TimeInterval {
        return objc.msgSend(self, "IOBufferDuration", ns.TimeInterval, .{});
    }
    /// `-[AVAudioSession isOtherAudioPlaying]
    pub fn isOtherAudioPlaying(self: *@This()) bool {
        return objc.msgSend(self, "isOtherAudioPlaying", bool, .{});
    }
    /// `-[AVAudioSession secondaryAudioShouldBeSilencedHint]
    pub fn secondaryAudioShouldBeSilencedHint(self: *@This()) bool {
        return objc.msgSend(self, "secondaryAudioShouldBeSilencedHint", bool, .{});
    }
    /// `-[AVAudioSession outputVolume]
    pub fn outputVolume(self: *@This()) f32 {
        return objc.msgSend(self, "outputVolume", f32, .{});
    }
    /// `-[AVAudioSession promptStyle]
    pub fn promptStyle(self: *@This()) AudioSessionPromptStyle {
        return objc.msgSend(self, "promptStyle", AudioSessionPromptStyle, .{});
    }
    /// `-[AVAudioSession setAggregatedIOPreference:error:]
    pub fn setAggregatedIOPreference_error_(self: *@This(), in_iotype: AudioSessionIoType, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setAggregatedIOPreference:error:", bool, .{ in_iotype, out_error });
    }
    /// `-[AVAudioSession availableInputs]
    pub fn availableInputs(self: *@This()) *ns.Array(AudioSessionPortDescription) {
        return objc.msgSend(self, "availableInputs", *ns.Array(AudioSessionPortDescription), .{});
    }
    /// `-[AVAudioSession currentRoute]
    pub fn currentRoute(self: *@This()) *AudioSessionRouteDescription {
        return objc.msgSend(self, "currentRoute", *AudioSessionRouteDescription, .{});
    }
    /// `-[AVAudioSession setActive:withFlags:error:]
    pub fn setActive_withFlags_error_(self: *@This(), active: bool, flags: isize, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setActive:withFlags:error:", bool, .{ active, flags, out_error });
    }
    /// `-[AVAudioSession setPreferredHardwareSampleRate:error:]
    pub fn setPreferredHardwareSampleRate_error_(self: *@This(), sample_rate: f64, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredHardwareSampleRate:error:", bool, .{ sample_rate, out_error });
    }
    /// `-[AVAudioSession delegate]
    pub fn delegate(self: *@This()) *AudioSessionDelegate {
        return objc.msgSend(self, "delegate", *AudioSessionDelegate, .{});
    }
    /// `-[AVAudioSession setDelegate:]
    pub fn setDelegate_(self: *@This(), session_delegate: *AudioSessionDelegate) void {
        return objc.msgSend(self, "setDelegate:", void, .{session_delegate});
    }
    /// `-[AVAudioSession inputIsAvailable]
    pub fn inputIsAvailable(self: *@This()) bool {
        return objc.msgSend(self, "inputIsAvailable", bool, .{});
    }
    /// `-[AVAudioSession currentHardwareSampleRate]
    pub fn currentHardwareSampleRate(self: *@This()) f64 {
        return objc.msgSend(self, "currentHardwareSampleRate", f64, .{});
    }
    /// `-[AVAudioSession currentHardwareInputNumberOfChannels]
    pub fn currentHardwareInputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "currentHardwareInputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession currentHardwareOutputNumberOfChannels]
    pub fn currentHardwareOutputNumberOfChannels(self: *@This()) isize {
        return objc.msgSend(self, "currentHardwareOutputNumberOfChannels", isize, .{});
    }
    /// `-[AVAudioSession preferredHardwareSampleRate]
    pub fn preferredHardwareSampleRate(self: *@This()) f64 {
        return objc.msgSend(self, "preferredHardwareSampleRate", f64, .{});
    }
};

/// `AVAudioSessionPortDescription`
pub const AudioSessionPortDescription = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[AVAudioSessionPortDescription new]`
    pub const new = InternalInfo.new;
    /// `+[AVAudioSessionPortDescription alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[AVAudioSessionPortDescription alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[AVAudioSessionPortDescription setPreferredDataSource:error:]
    pub fn setPreferredDataSource_error_(self: *@This(), data_source: ?*AudioSessionDataSourceDescription, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredDataSource:error:", bool, .{ data_source, out_error });
    }
    /// `-[AVAudioSessionPortDescription portType]
    pub fn portType(self: *@This()) AudioSessionPort {
        return objc.msgSend(self, "portType", AudioSessionPort, .{});
    }
    /// `-[AVAudioSessionPortDescription portName]
    pub fn portName(self: *@This()) *ns.String {
        return objc.msgSend(self, "portName", *ns.String, .{});
    }
    /// `-[AVAudioSessionPortDescription UID]
    pub fn UID(self: *@This()) *ns.String {
        return objc.msgSend(self, "UID", *ns.String, .{});
    }
    /// `-[AVAudioSessionPortDescription hasHardwareVoiceCallProcessing]
    pub fn hasHardwareVoiceCallProcessing(self: *@This()) bool {
        return objc.msgSend(self, "hasHardwareVoiceCallProcessing", bool, .{});
    }
    /// `-[AVAudioSessionPortDescription isSpatialAudioEnabled]
    pub fn isSpatialAudioEnabled(self: *@This()) bool {
        return objc.msgSend(self, "isSpatialAudioEnabled", bool, .{});
    }
    /// `-[AVAudioSessionPortDescription channels]
    pub fn channels(self: *@This()) *ns.Array(AudioSessionChannelDescription) {
        return objc.msgSend(self, "channels", *ns.Array(AudioSessionChannelDescription), .{});
    }
    /// `-[AVAudioSessionPortDescription dataSources]
    pub fn dataSources(self: *@This()) ?*ns.Array(AudioSessionDataSourceDescription) {
        return objc.msgSend(self, "dataSources", ?*ns.Array(AudioSessionDataSourceDescription), .{});
    }
    /// `-[AVAudioSessionPortDescription selectedDataSource]
    pub fn selectedDataSource(self: *@This()) ?*AudioSessionDataSourceDescription {
        return objc.msgSend(self, "selectedDataSource", ?*AudioSessionDataSourceDescription, .{});
    }
    /// `-[AVAudioSessionPortDescription preferredDataSource]
    pub fn preferredDataSource(self: *@This()) ?*AudioSessionDataSourceDescription {
        return objc.msgSend(self, "preferredDataSource", ?*AudioSessionDataSourceDescription, .{});
    }
};

/// `AVAudioSessionDataSourceDescription`
pub const AudioSessionDataSourceDescription = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[AVAudioSessionDataSourceDescription new]`
    pub const new = InternalInfo.new;
    /// `+[AVAudioSessionDataSourceDescription alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[AVAudioSessionDataSourceDescription alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[AVAudioSessionDataSourceDescription setPreferredPolarPattern:error:]
    pub fn setPreferredPolarPattern_error_(self: *@This(), pattern: AudioSessionPolarPattern, out_error: ?*?*ns.Error) bool {
        return objc.msgSend(self, "setPreferredPolarPattern:error:", bool, .{ pattern, out_error });
    }
    /// `-[AVAudioSessionDataSourceDescription dataSourceID]
    pub fn dataSourceID(self: *@This()) *ns.Number {
        return objc.msgSend(self, "dataSourceID", *ns.Number, .{});
    }
    /// `-[AVAudioSessionDataSourceDescription dataSourceName]
    pub fn dataSourceName(self: *@This()) *ns.String {
        return objc.msgSend(self, "dataSourceName", *ns.String, .{});
    }
    /// `-[AVAudioSessionDataSourceDescription location]
    pub fn location(self: *@This()) AudioSessionLocation {
        return objc.msgSend(self, "location", AudioSessionLocation, .{});
    }
    /// `-[AVAudioSessionDataSourceDescription orientation]
    pub fn orientation(self: *@This()) AudioSessionOrientation {
        return objc.msgSend(self, "orientation", AudioSessionOrientation, .{});
    }
    /// `-[AVAudioSessionDataSourceDescription supportedPolarPatterns]
    pub fn supportedPolarPatterns(self: *@This()) ?*ns.Array(AudioSessionPolarPattern) {
        return objc.msgSend(self, "supportedPolarPatterns", ?*ns.Array(AudioSessionPolarPattern), .{});
    }
    /// `-[AVAudioSessionDataSourceDescription selectedPolarPattern]
    pub fn selectedPolarPattern(self: *@This()) AudioSessionPolarPattern {
        return objc.msgSend(self, "selectedPolarPattern", AudioSessionPolarPattern, .{});
    }
    /// `-[AVAudioSessionDataSourceDescription preferredPolarPattern]
    pub fn preferredPolarPattern(self: *@This()) AudioSessionPolarPattern {
        return objc.msgSend(self, "preferredPolarPattern", AudioSessionPolarPattern, .{});
    }
};

/// `AVAudioSessionRouteDescription`
pub const AudioSessionRouteDescription = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[AVAudioSessionRouteDescription new]`
    pub const new = InternalInfo.new;
    /// `+[AVAudioSessionRouteDescription alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[AVAudioSessionRouteDescription alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[AVAudioSessionRouteDescription inputs]
    pub fn inputs(self: *@This()) *ns.Array(AudioSessionPortDescription) {
        return objc.msgSend(self, "inputs", *ns.Array(AudioSessionPortDescription), .{});
    }
    /// `-[AVAudioSessionRouteDescription outputs]
    pub fn outputs(self: *@This()) *ns.Array(AudioSessionPortDescription) {
        return objc.msgSend(self, "outputs", *ns.Array(AudioSessionPortDescription), .{});
    }
};

/// `AVAudioSessionChannelDescription`
pub const AudioSessionChannelDescription = opaque {
    const InternalInfo = objc.ExternClass(@This(), ns.Object);
    const as = InternalInfo.as;
    /// `+[AVAudioSessionChannelDescription new]`
    pub const new = InternalInfo.new;
    /// `+[AVAudioSessionChannelDescription alloc]`
    pub const alloc = InternalInfo.alloc;
    /// `[[AVAudioSessionChannelDescription alloc] init]`
    pub const allocInit = InternalInfo.allocInit;
    /// `-[AVAudioSessionChannelDescription channelName]
    pub fn channelName(self: *@This()) *ns.String {
        return objc.msgSend(self, "channelName", *ns.String, .{});
    }
    /// `-[AVAudioSessionChannelDescription owningPortUID]
    pub fn owningPortUID(self: *@This()) *ns.String {
        return objc.msgSend(self, "owningPortUID", *ns.String, .{});
    }
    /// `-[AVAudioSessionChannelDescription channelNumber]
    pub fn channelNumber(self: *@This()) usize {
        return objc.msgSend(self, "channelNumber", usize, .{});
    }
    /// `-[AVAudioSessionChannelDescription channelLabel]
    pub fn channelLabel(self: *@This()) AudioChannelLabel {
        return objc.msgSend(self, "channelLabel", AudioChannelLabel, .{});
    }
};

/// `AVAudioSessionDelegate`
pub const AudioSessionDelegate = opaque {
    const InternalInfo = objc.ExternProtocol(@This(), ns.ObjectProtocol);
    const as = InternalInfo.as;
    /// `-[AVAudioSessionDelegate beginInterruption]
    pub fn beginInterruption(self: *@This()) void {
        return objc.msgSend(self, "beginInterruption", void, .{});
    }
    /// `-[AVAudioSessionDelegate endInterruptionWithFlags:]
    pub fn endInterruptionWithFlags_(self: *@This(), flags: usize) void {
        return objc.msgSend(self, "endInterruptionWithFlags:", void, .{flags});
    }
    /// `-[AVAudioSessionDelegate endInterruption]
    pub fn endInterruption(self: *@This()) void {
        return objc.msgSend(self, "endInterruption", void, .{});
    }
    /// `-[AVAudioSessionDelegate inputIsAvailableChanged:]
    pub fn inputIsAvailableChanged_(self: *@This(), is_input_available: bool) void {
        return objc.msgSend(self, "inputIsAvailableChanged:", void, .{is_input_available});
    }
};
