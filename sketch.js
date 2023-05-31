let rects = [];
let lines = [];
let backgroundImage;

function preload() {
  
  backgroundImage = loadImage('FormatFactoryb7a88fcc-1344-46a8-9c13-a3afad52cf41.png');
}

function setup() {
  createCanvas(800, 800);
  background(0);
  strokeWeight(2);
}

function draw() {
  background(backgroundImage);
  
  
  
  for (let i = 0; i < lines.length; i++) {
    let { x1, y1, x2, y2, color } = lines[i];
    stroke(color);
    line(x1, y1, x2, y2);
  }
  for (let i = 0; i < rects.length; i++) {
    let { x, y, w, h, color } = rects[i];
    fill(color);
    rect(x, y, w, h);
  }
}

function keyPressed() {
  if (key === 'a') {
    drawRandomRect();
  } else if (key === 'l') {
    drawRandomLine();
  } else if (key === 'g') {
    clearShapes();
  }
}

function drawRandomRect() {
  let rectObj = {
    x: random(width),
    y: random(height),
    w: random(20, 100),
    h: random(50, 200),
    color: color(random(255), random(255), random(255))
  };
  
  rects.push(rectObj);
}

function drawRandomLine() {
  let horizontal = random() < 0.5; 
  
  let lineObj;
  if (horizontal) {
    let y = random(height);
    lineObj = {
      x1: 0,
      y1: y,
      x2: width,
      y2: y,
      color: color(0)
    };
  } else {
    let x = random(width);
    lineObj = {
      x1: x,
      y1: 0,
      x2: x,
      y2: height,
      color: color(0)
    };
  }
  
  lines.push(lineObj);
}

function clearShapes() {
  rects = [];
  lines = [];
}