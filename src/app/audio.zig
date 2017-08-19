const c = @cImport({
    @cInclude("math.h");
    @cInclude("stdlib.h");
    @cInclude("stdio.h");
    @cInclude("soundio/soundio.h");
});

// Central c import:
// const c = @import("../system/c.zig");

const io = @import("std").io;

error NoMem;
error ConnectionFailure;
error OutputDeviceNotFound;
error CannotOpenDevice;
error CannotSetChannel;
error CannotStartDevice;

const PI = f32(3.1415926535);

var seconds_offset = f32(0.0);

extern fn write_callback(os: ?&c.SoundIoOutStream, frame_count_min: c_int, frame_count_max: c_int) {
    var outstream = os ?? return;

    const layout: &c.SoundIoChannelLayout = &outstream.layout;
    const float_sample_rate = f32(outstream.sample_rate);
    const seconds_per_frame = 1.0 / float_sample_rate;

    var areas: ?&c.SoundIoChannelArea = undefined;
    var frames_left = frame_count_max;

    var err: c_int = 0;

    while (frames_left > 0) {
        var frame_count = frames_left;

        err = c.soundio_outstream_begin_write(outstream, &areas, &frame_count);
        if (err != 0) {
            %%io.stdout.printf("{}\n", err);
            c.exit(1);
        }

        if (frame_count == 0) break;

        const pitch: f32 = 880.0;
        const radians_per_second: f32 = pitch * 2.0 * PI;

        var frame = c_int(0);

        while(frame < frame_count) : (frame += 1) {
            const sample = c.sinf((seconds_offset + f32(frame) * seconds_per_frame) * radians_per_second);
            var channel = c_int(0);
            while (channel < layout.channel_count) : (channel += 1) {
                const area_ptr = (areas ?? return)[usize(channel)].ptr ?? return;
                const area_step = (areas ?? return)[usize(channel)].step;
                var ptr = @intToPtr(&f32, @ptrToInt(area_ptr) + usize(area_step * frame));
                *ptr = sample;
            }
        }

        seconds_offset = c.fmodf(seconds_offset + seconds_per_frame * f32(frame_count), 1.0);

        err = c.soundio_outstream_end_write(outstream);
        if (err != 0) {
            %%io.stdout.printf("{}\n", err);
            c.exit(1);
        }

        frames_left -= frame_count;
    }
}

// Wave type, defines audio wave data
const Wave = struct {
    sampleCount: usize,   // Number of samples
    sampleRate: usize,    // Frequency (samples per second)
    sampleSize: usize,    // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels: usize,      // Number of channels (1-mono, 2-stereo)
    data: &u8,          // Buffer data pointer
};

// Sound source type
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

pub const AudioEngine = struct {
    sound_io: &c.SoundIo,
    device: &c.SoundIoDevice,
    outstream: &c.SoundIoOutStream,

    fn init(self: &AudioEngine) -> %void {
        var soundio = c.soundio_create() ?? {
            %%io.stdout.printf("out of memory\n");
            return error.NoMem;
        };

        const err = c.soundio_connect(soundio);
        if ( err != 0 ) {
            %%io.stdout.printf("error connecting: {}", err);
            return error.ConnectionFailure;
        }

        c.soundio_flush_events(soundio);

        const default_out_device_index = c.soundio_default_output_device_index(soundio);
        if (default_out_device_index < 0) {
            %%io.stdout.printf("no output device found");
            return error.OutputDeviceNotFound;
        }

        var device = c.soundio_get_output_device(soundio, default_out_device_index) ?? {
            %%io.stdout.printf("could not get output device {}", default_out_device_index);
            return error.NoMem;
        };

        var outstream = c.soundio_outstream_create(self.device) ?? {
            %%io.stdout.printf("could not create outstream");
            return error.NoMem;
        };

        self.sound_io = soundio;
        self.device = device;
        self.outstream = outstream;
    }

    fn setRenderCallback(cb: renderCallback) {
        currentRenderCallback = cb;
    }

    fn open(self: &AudioEngine) -> %void {

        self.outstream.format = c.SoundIoFormat(usize(c.SoundIoFormatFloat32NE));
        self.outstream.write_callback = write_callback;

        const err = c.soundio_outstream_open(self.outstream);
        if ( err != 0 ) {
            %%io.stdout.printf("unable to open device: {}", err);
            return error.CannotOpenDevice;
        }

        if (self.outstream.layout_error != 0)
            %%io.stdout.printf("unable to set channel layout: {}\n", self.outstream.layout_error);
    }

    fn start(self: &AudioEngine) -> %void {
        const err = c.soundio_outstream_start(self.outstream);
        if ( err != 0 ) {
            %%io.stdout.printf("unable to start device: {}", err);
            return error.CannotStartDevice;
        }
    }

    fn update(self: &AudioEngine) {
        c.soundio_wait_events(self.sound_io);
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