
let AMP_MIN = 0.1;
let mic;
let figuras = []; 
let tamGrilla = 100; 
let anchoCuadrado = 200; 
let anchoRectangulo = 200;  
let altoRectangulo = 400;  
let imgCuadrado, imgRectangulo;  
let colores = ["#FFA240", "#E9347C", "#2152B4"]; 

function preload() {
  backgroundImage = loadImage("FormatFactoryb7a88fcc-1344-46a8-9c13-a3afad52cf41.png");
  imgCuadrado = loadImage("cuadrado.png");
  imgRectangulo = loadImage("rectangulo.png");
}

function setup() {
  createCanvas(800, 800); 

  
  userStartAudio().then(function () {
    mic = new p5.AudioIn();
    mic.start();
  });
}

function draw() {
  if (mic && mic.enabled) {
    let spectrum = mic.getLevel(); 
    let haySonidoGrave = spectrum > AMP_MIN;

    if (haySonidoGrave) {
      generarFigura();
    }
  }

  image(backgroundImage, 0, 0, width, height); 

 
  for (let i = 0; i < figuras.length; i++) {
    let figura = figuras[i];
    figura.dibujar();
  }
}

function generarFigura() {
  let posX = random(width);
  let posY = random(height); 
  let tam = random(10, 100); 
  let col = random(colores); 


  posX = Math.floor(posX / tamGrilla) * tamGrilla;
  posY = Math.floor(posY / tamGrilla) * tamGrilla;

  let figura;
  if (figuras.length % 2 === 0) {
    figura = new Cuadrado(posX, posY, anchoCuadrado, col);
  } else {
    figura = new Rectangulo(posX, posY, anchoRectangulo, altoRectangulo, col);
  }

  figuras.push(figura);
}

class Cuadrado {
  constructor(x, y, tam, color) {
    this.x = x;
    this.y = y;
    this.tam = tam;
    this.color = color;
  }

  dibujar() {
    tint(this.color);
    image(imgCuadrado, this.x, this.y, this.tam, this.tam);
    noTint();
  }
}

class Rectangulo {
  constructor(x, y, ancho, alto, color) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.color = color;
  }

  dibujar() {
    tint(this.color);
    image(imgRectangulo, this.x, this.y, this.ancho, this.alto);
    noTint(); 
  }
}