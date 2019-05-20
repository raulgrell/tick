const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
const audioBuffer = audioCtx.createBuffer(1, audioCtx.sampleRate * 2.0, audioCtx.sampleRate);

const playAudio = (bufferPtr, bufferSize) => {
    audioBuffer.copyToChannel(new Float32Array(memory.buffer, bufferPtr, bufferSize), 0);
    const source = audioCtx.createBufferSource();
    source.buffer = audioBuffer;
    source.connect(audioCtx.destination);
    source.start();
}

var audio = {
    playAudio
};