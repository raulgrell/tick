const ctx = $canvas.getContext('2d');

const getCanvasWidth = () => canvas2d.width;
const getCanvasHeight = () => canvas2d.height;

const rect = (x, y, width, height) => ctx.rect(x, y, width, height);
const clearRect = (x, y, width, height) => ctx.clearRect(x, y, width, height);
const fillRect = (x, y, width, height) => ctx.fillRect(x, y, width, height);
const strokeRect = (x, y, width, height) => ctx.strokeRect(x, y, width, height);
const arc = (x, y, radius, startAngle, endAngle, ccw) => ctx.arc(x, y, radius, startAngle, endAngle, ccw);

const fillColor = (r, g, b, a) => ctx.fillStyle = `rgba(${r}, ${g}, ${b}, ${a / 255.0})`;
const fillStyle = (style, len) => ctx.fillStyle = readCharStr(style, len); // 'red|#ff0000|#f00|rgb(255,0,0)|rgba(255,0,0,1)';
const fill = () => ctx.fill();

const strokeStyle = (style, len) => ctx.strokeStyle = readCharStr(style, len); // 'red|#ff0000|#f00|rgb(255,0,0)|rgba(255,0,0,1)';
const stroke = () => ctx.stroke();

const beginPath = () => ctx.beginPath();
const moveTo = (x, y) => ctx.moveTo(x, y)
const lineTo = (x, y) => ctx.lineTo(x, y);
const quadraticCurveTo = (cx, cy, x, y) => ctx.quadraticCurveTo(cx, cy, x, y);
const bezierCurveTo = (cx1, cy1, cx2, cy2, x, y) => ctx.bezierCurveTo(cx1, cy1, cx2, cy2, x, y);
const closePath = () => ctx.closePath();

const createLinearGradient = (x1, y1, x2, y2) => ctx.createLinearGradient(x1, y1, x2, y2);
const createRadialGradient = (x1, y1, radius1, x2, y2, radius2) => ctx.createLinearGradient(x1, y1, radius1, x2, y2, radius2);
const addColorStop = (grd, index, color, len) => grd.addColorStop(index, readCharStr(color, len));

const lineWidth = (width) => ctx.lineWidth = width;;
const lineJoin = (style, len) => ctx.lineJoin = readCharStr(style, len); // 'miter|round|bevel';
const lineCap = (style, len) => ctx.lineCap = readCharStr(style, len); // 'butt|round|square';

const shadowColor = (r, g, b, a) => ctx.shadowColor = `rgba(${r}, ${g}, ${b}, ${a / 255.0})`;
const shadowStyle = (style, len) => ctx.shadowColor = readCharStr(style, len);
const shadowBlur = (val) => ctx.shadowBlur = val;
const shadowOffsetX = (val) => ctx.shadowOffsetX = val;
const shadowOffsetY = (val) => ctx.shadowOffsetY = val;

//'source-atop|source-in|source-out|source-over|destination-atop|destination-in|destination-out|destination-over|lighter|xor|copy';
const globalCompositeOperation = (op) => ctx.globalCompositeOperation = op;
const globalAlpha = (val) => ctx.globalAlpha = val; // between 0 and 1

const font = (style, len) => ctx.font = readCharStr(style, len); // 'bold 40px Arial';
const fillText = (text, len, x, y) => ctx.fillText(readCharStr(text, len), x, y);
const strokeText = (text, len, x, y) => ctx.strokeText(readCharStr(text, len), x, y);
const textAlign = (style, len) => ctx.textAlign = readCharStr(style, len); // 'start|end|left|center|right';
const textBaseline = (style, len) => ctx.textBaseline = readCharStr(style, len); // 'top|hanging|middle|alphabetic|ideographic|bottom';
const measureText = (text, len) => ctx.measureText(readCharStr(text, len)).width;

const translate = (x, y) => ctx.translate(x, y);
const scale = (x, y) => ctx.scale(x, y);
const rotate = (radians) => ctx.rotate(radians);
const transform = (a, b, c, d, e, f) => ctx.transform(a, b, c, d, e, f);
const setTransform = (a, b, c, d, e, f) => ctx.setTransform(a, b, c, d, e, f);

const save = () => ctx.save();
const restore = () => ctx.restore();

const clip = () => ctx.clip();

const getImageData = (x, y, width, height) => ctx.getImageData(x, y, width, height);
const putImageData = (imageData, x, y) => ctx.putImageData(imageData, x, y);

const createPattern = (imageObj, style) => ctx.createPattern(imageObj, readCharStr(style, len));

const drawImage = (path, len, x, y) => {
    var imageObj = new Image();
    imageObj.onload = function () {
        ctx.drawImage(imageObj, x, y);
    };
    imageObj.src = readCharStr(path, len);
}

const drawImageRect = (path, len, x, y, width, height) => {
    var imageObj = new Image();
    imageObj.onload = function () {
        ctx.drawImage(imageObj, x, y, width, height);
    };
    imageObj.src = readCharStr(path, len);
}

const toDataURL = () => canvas.toDataURL();

var canvas = {
    getCanvasWidth,
    getCanvasHeight,
    rect,
    clearRect,
    fillRect,
    strokeRect,
    arc,
    fillColor,
    fillStyle,
    fill,
    strokeStyle,
    stroke,
    beginPath,
    moveTo,
    lineTo,
    arc,
    quadraticCurveTo,
    bezierCurveTo,
    closePath,
    createLinearGradient,
    createRadialGradient,
    addColorStop,
    lineWidth,
    lineJoin,
    lineCap,
    shadowColor,
    shadowStyle,
    shadowBlur,
    shadowOffsetX,
    shadowOffsetY,
    globalCompositeOperation,
    globalAlpha,
    font,
    fillText,
    strokeText,
    textAlign,
    textBaseline,
    measureText,
    translate,
    scale,
    rotate,
    scale,
    transform,
    setTransform,
    save,
    restore,
    clip,
    getImageData,
    putImageData,
    createPattern,
    drawImage,
    drawImageRect,
    toDataURL
};