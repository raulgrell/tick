const io = @import("std").io;
const panic = @import("std").debug.panic;
const math = @import("std").math;

const c = @import("../system/c.zig");

const AudioCallback = fn(os: ?&c.SoundIoOutStream, frame_count_min: c_int, frame_count_max: c_int);

error NoMem;
error InitAudioBackend;
error SystemResources;
error OpeningDevice;
error NoSuchDevice;
error Invalid;
error BackendUnavailable;
error Streaming;
error IncompatibleDevice;
error NoSuchClient;
error IncompatibleBackend;
error BackendDisconnected;
error Interrupted;
error Underflow;
error EncodingString;

fn sio_err(err: c_int) -> %void {
    switch (c.SoundIoError(err)) {
        c.SoundIoError.None => {},
        c.SoundIoError.NoMem => error.NoMem,
        c.SoundIoError.InitAudioBackend => error.InitAudioBackend,
        c.SoundIoError.SystemResources => error.SystemResources,
        c.SoundIoError.OpeningDevice => error.OpeningDevice,
        c.SoundIoError.NoSuchDevice => error.NoSuchDevice,
        c.SoundIoError.Invalid => error.Invalid,
        c.SoundIoError.BackendUnavailable => error.BackendUnavailable,
        c.SoundIoError.Streaming => error.Streaming,
        c.SoundIoError.IncompatibleDevice => error.IncompatibleDevice,
        c.SoundIoError.NoSuchClient => error.NoSuchClient,
        c.SoundIoError.IncompatibleBackend => error.IncompatibleBackend,
        c.SoundIoError.BackendDisconnected => error.BackendDisconnected,
        c.SoundIoError.Interrupted => error.Interrupted,
        c.SoundIoError.Underflow => error.Underflow,
        c.SoundIoError.EncodingString => error.EncodingString,
        else => unreachable, // TODO zig bug: take out this line and get a segfault
    }
}

var seconds_offset = f32(0.0);

extern fn write_callback(os: ?&c.SoundIoOutStream, frame_count_min: c_int, frame_count_max: c_int) {
    const outstream = ??os;
    const layout: &c.SoundIoChannelLayout = &outstream.layout;
    const float_sample_rate = f32(outstream.sample_rate);
    const seconds_per_frame = 1.0 / float_sample_rate;
    
    var frames_left = frame_count_max;

    while (frames_left > 0) {
        var frame_count = frames_left;
        var areas: &c.SoundIoChannelArea = undefined;

        sio_err(c.soundio_outstream_begin_write(outstream, @ptrCast(&?&c.SoundIoChannelArea, &areas), &frame_count)) %% |err| {
            panic("write failed: {}", @errorName(err));
        };

        if (frame_count == 0) break;

        const pitch: f32 = 880.0;
        const radians_per_second: f32 = pitch * 2.0 * math.pi;

        { var frame = c_int(0); while(frame < frame_count) : (frame += 1) {
            const sample = 0; // math.sin((seconds_offset + f32(frame) * seconds_per_frame) * radians_per_second) / 100;

            { var channel = c_int(0); while (channel < layout.channel_count) : (channel += 1) {
                const area = areas[usize(channel)];
                const channel_ptr = ??area.ptr;
                const sample_ptr = &channel_ptr[usize(area.step * frame)];
                @ptrCast(&f32, sample_ptr)[0] = sample;
            }}
        }}

        seconds_offset = c.fmodf(seconds_offset + seconds_per_frame * f32(frame_count), 1.0);

        sio_err(c.soundio_outstream_end_write(outstream)) %% |err| {
            panic("end write failed: {}", @errorName(err));
        };

        frames_left -= frame_count;
    }
}

pub const AudioEngine = struct {
    sound_io: &c.SoundIo,
    device: &c.SoundIoDevice,
    outstream: &c.SoundIoOutStream,
    audio_callback: AudioCallback,

    fn init(self: &AudioEngine) -> %void {
        const soundio = c.soundio_create() ?? {
            panic("could not create soundio object: out of memory");
        };

        sio_err(c.soundio_connect(soundio)) %% |err| {
            panic("unable to connect: {}", @errorName(err));
        };

        c.soundio_flush_events(soundio);

        const default_output_index = c.soundio_default_output_device_index(soundio);
        if (default_output_index < 0) {
            panic("no output device found");
        }

        const device = c.soundio_get_output_device(soundio, default_output_index) ?? {
            panic("could not get output device {}: out of memory", default_output_index);
        };

        const outstream = c.soundio_outstream_create(device) ?? {
            panic("could not create outstream: out of memory");
        };
        
        self.sound_io = soundio;
        self.device = device;
        self.outstream = outstream;
    }

    fn setAudioCallback(self: &AudioEngine, cb: AudioCallback) {
        self.audio_callback = cb;
    }

    fn open(self: &AudioEngine) -> %void {
        self.outstream.format = c.SoundIoFormat(usize(c.SoundIoFormatFloat32NE));
        self.outstream.write_callback = write_callback;

        sio_err(c.soundio_outstream_open(self.outstream)) %% |err| {
            panic("unable to open stream: {}", @errorName(err));
        };

        if (self.outstream.layout_error != 0)
            %%io.stdout.printf("unable to set channel layout: {}\n", self.outstream.layout_error);
    }

    fn start(self: &AudioEngine) -> %void {
        sio_err(c.soundio_outstream_start(self.outstream)) %% |err| {
            panic("unable to start stream: {}", @errorName(err));
        };
    }

    fn update(self: &AudioEngine) {
        // Blocks
        // c.soundio_wait_events(self.sound_io);
    }

    fn stop(self: &AudioEngine) {
    }

    fn close(self: &AudioEngine) {
    }

    pub fn destroy(self: &AudioEngine) {
        c.soundio_outstream_destroy(self.outstream);
        c.soundio_device_unref(self.device);
        c.soundio_destroy(self.soundio);
    }
};

// Wave type, defines audio wave data
const Wave = struct {
    sampleCount: usize,   // Number of samples
    sampleRate: usize,    // Frequency (samples per second)
    sampleSize: usize,    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels: usize,      // Number of channels (1-mono, 2-stereo)
    data: &u8,          // Buffer data pointer
};

const Sound = struct {
    source: usize,        // OpenAL audio source id
    buffer: usize,        // OpenAL audio buffer id
    format: int,          // OpenAL audio format specifier
};

// Audio stream type
const AudioStream = struct {
    sampleRate: usize,    // Frequency (samples per second)
    sampleSize: usize,    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels: usize,      // Number of channels (1-mono, 2-stereo)
    format: int,          // OpenAL audio format specifier
    source: usize,        // OpenAL audio source id
    buffers: [2]usize,    // OpenAL audio buffers (double buffering)
};