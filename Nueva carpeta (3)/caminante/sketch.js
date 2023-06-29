
let AMP_MAX = 1000;
let IMPRIMIR = false;


let c;
let posiciones = []; 

let mic;

let amp;
let haySonido = false;

let backgroundImage;

function preload() {
  backgroundImage = loadImage('FormatFactoryb7a88fcc-1344-46a8-9c13-a3afad52cf41.png');
}

function setup() {
  createCanvas(800, 800); 
  c = new Caminante();

  mic = new p5.AudioIn();
  mic.start();

  userStartAudio(); 
}

function draw() {
  amp = mic.getLevel();
  haySonido = amp < AMP_MAX;

  background(backgroundImage);

  if (haySonido) {
    c.mover();
  }

  c.dibujar();
  dibujarRastro();

  if (IMPRIMIR) {
    imprimirData();
  }
}

function windowResized() {
  resizeCanvas(800, 800);
}

function imprimirData() {
  background(255);
  push();
  textSize(16);
  fill(0);
  let texto = 'amplitud: ' + amp;
  text(texto, 10, 20);
  pop();
}

function dibujarRastro() {
  for (let i = 0; i < posiciones.length; i++) {
    let pos = posiciones[i];
    image(c.imagen, pos.x, pos.y, c.diam, c.diam);
  }
}