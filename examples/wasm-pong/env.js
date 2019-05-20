var memory;

const readCharStr = (ptr, len) => {
  const bytes = new Uint8Array(memory.buffer, ptr, len);
  let s = "";
  for(let i = 0; i < len; ++i) {
    s += String.fromCharCode(bytes[i]);
  }
  return s;
}

const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
const audioBuffer = audioCtx.createBuffer(1, audioCtx.sampleRate*2.0, audioCtx.sampleRate);

const canvas = document.getElementById("canvas");
const gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl');
gl.viewport(0, 0, canvas.width, canvas.height);

const shaders = [];
const glPrograms = [];
const glBuffers = [];
const glTextures = [];
const glUniformLocations = [];

const consoleLog = (value) => console.log('consoleLog', value);
const compileShader = (sourcePtr, sourceLen, type) => {
  const source = readCharStr(sourcePtr, sourceLen);
  const shader = gl.createShader(type);
  gl.shaderSource(shader, source);
  gl.compileShader(shader);
  if(!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    throw "Error compiling shader:" + gl.getShaderInfoLog(shader);
  }
  shaders.push(shader);
  return shaders.length - 1;
}

const linkShaderProgram = (vertexShaderId, fragmentShaderId) => {
  const program = gl.createProgram();
  gl.attachShader(program, shaders[vertexShaderId]);
  gl.attachShader(program, shaders[fragmentShaderId]);
  gl.linkProgram(program);
  if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
    throw ("Error linking program:" + gl.getProgramInfoLog (program));
  }
  glPrograms.push(program);
  return glPrograms.length - 1;
}

const glClearColor = (r, g, b, a) => gl.clearColor(r, g, b, a);
const glEnable = x => gl.enable(x);
const glDepthFunc = x => gl.depthFunc(x);
const glBlendFunc = (x, y) => gl.blendFunc(x, y);
const glClear = x => gl.clear(x);
const glGetAttribLocation = (programId, namePtr, nameLen) => gl.getAttribLocation(glPrograms[programId], readCharStr(namePtr, nameLen));

const glGetUniformLocation = (programId, namePtr, nameLen) =>  {
  glUniformLocations.push(gl.getUniformLocation(glPrograms[programId], readCharStr(namePtr, nameLen)));
  return glUniformLocations.length - 1;
}
const glUniform4fv = (locationId, x, y, z, w) => gl.uniform4fv(glUniformLocations[locationId], [x, y, z, w]);
const glUniform1i = (locationId, x) => gl.uniform1i(glUniformLocations[locationId], x);
const glUniform1f = (locationId, x) => gl.uniform1f(glUniformLocations[locationId], x);
const glCreateBuffer = () => {
  glBuffers.push(gl.createBuffer());
  return glBuffers.length - 1;
}
const glBindBuffer = (type, bufferId) => gl.bindBuffer(type, glBuffers[bufferId]);
const glBufferData = (type, dataPtr, count, drawType) => {
  const floats = new Float32Array(memory.buffer, dataPtr, count);
  gl.bufferData(type, floats, drawType);
}
const glUseProgram = (programId) => gl.useProgram(glPrograms[programId]);
const glEnableVertexAttribArray = (x) => gl.enableVertexAttribArray(x);
const glVertexAttribPointer = (attribLocation, size, type, normalize, stride, offset) => {
  gl.vertexAttribPointer(attribLocation, size, type, normalize, stride, offset);
}
const glDrawArrays = (type, offset, count) => gl.drawArrays(type, offset, count);
const glCreateTexture = () => {
  glTextures.push(gl.createTexture());
  return glTextures.length - 1;
};
const glBindTexture = (target, textureId) => gl.bindTexture(target, glTextures[textureId]);
const glTexImage2D = (target, level, internalFormat, width, height, border, format, type, dataPtr, dataLen) => {
  const data = new Uint8Array(memory.buffer, dataPtr, dataLen);
  gl.texImage2D(target, level, internalFormat, width, height, border, format, type, data);
}
const glTexParameteri = (target, pname, param) => gl.texParameteri(target, pname, param);
const glActiveTexture = (target) => gl.activeTexture(target);

const setScore = (player, score) => document.getElementById("score" + player).textContent = ""  + score;
const playAudio = (bufferPtr, bufferSize) => {
  audioBuffer.copyToChannel(new Float32Array(memory.buffer, bufferPtr, bufferSize), 0);
  const source = audioCtx.createBufferSource();
  source.buffer = audioBuffer;
  source.connect(audioCtx.destination);
  source.start();
}

var env = {
  compileShader, 
  linkShaderProgram, 
  glClearColor, 
  glEnable, 
  glDepthFunc, 
  glBlendFunc, 
  glClear, 
  glGetAttribLocation, 
  glGetUniformLocation, 
  glUniform4fv, 
  glUniform1i, 
  glUniform1f, 
  glCreateBuffer, 
  glBindBuffer, 
  glBufferData, 
  glUseProgram, 
  glEnableVertexAttribArray, 
  glVertexAttribPointer, 
  glDrawArrays, 
  glCreateTexture, 
  glBindTexture, 
  glTexImage2D, 
  glTexParameteri, 
  glActiveTexture, 
  consoleLog, 
  consoleLogF: consoleLog, 
  playAudio,
  setScore
};