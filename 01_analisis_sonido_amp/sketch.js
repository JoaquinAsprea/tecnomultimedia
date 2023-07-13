let mic;
let threshold = 0.2; 
let cuadrados = []; 
let formas = [];
let lineas = [];
let estado = 1;
let tiempoInicioEstado2;
let tiempoSilencioThreshold = 20;
let caminanteImg, cuadradoImg, grandeImg, horizontalImg, pinceladaImg, rectanguloImg, lineaImg;
let backgroundImage;

const colorsEstado1 = ["#FFA240", "#FFA240", "#FFA240", "#E9347C", "#2152B4", "#FFA240", "#FFA240", "#FFA240", "#FFA240"];
const colorsEstado2 = ["#E9347C", "#2152B4"];

function preload() {
  caminanteImg = loadImage("caminante.png");
  cuadradoImg = loadImage("cuadrado.png");
  grandeImg = loadImage("grande.png");
  horizontalImg = loadImage("horizontal.png");
  pinceladaImg = loadImage("pincelada.png");
  rectanguloImg = loadImage("rectangulo.png");
  lineaImg = loadImage("linea.png");
  backgroundImage = loadImage("FormatFactoryb7a88fcc-1344-46a8-9c13-a3afad52cf41.png");
}

function setup() {
  createCanvas(1000, 800);
  mic = new p5.AudioIn();
  mic.start();
}

function draw() {
  image(backgroundImage, 0, 0, width, height);

  let volume = mic.getLevel();

  if (estado === 1) {
    if (!tiempoInicioEstado2 && millis() / 1000 >= tiempoSilencioThreshold) {
      tiempoInicioEstado2 = millis();
      estado = 2; 
    } else {
      if (volume > threshold) {
        generarCuadrado();
        generarForma();
      }

      let predominante = colorsEstado1[0];

      for (let i = 0; i < cuadrados.length; i++) {
        let cuadrado = cuadrados[i];
        let posX = cuadrado.col * 200;
        let posY = cuadrado.row * 200;

        if (cuadrado.size === 200) {
          push();
          tint(color(predominante));
          image(cuadradoImg, posX, posY, 200, 200);
          pop();
        } else if (cuadrado.size === 400) {
          push();
          tint(color(predominante));
          image(grandeImg, posX, posY, 400, 400);
          pop();
        }
      }

      for (let i = 0; i < formas.length; i++) {
        let forma = formas[i];
        let posX = forma.col * 200;
        let posY = forma.row * 200;

        if (forma.width === 2 && forma.height === 1) {
          push();
          tint(color(predominante));
          image(horizontalImg, posX, posY, 400, 200);
          pop();
        }
        else if (forma.width === 1 && forma.height === 2) {
          push();
          tint(color(predominante));
          image(rectanguloImg, posX, posY, 200, 400);
          pop();
        }
      }
    }
  } else if (estado === 2) {
    for (let i = 0; i < cuadrados.length; i++) {
      let cuadrado = cuadrados[i];
      let posX = cuadrado.col * 200;
      let posY = cuadrado.row * 200;

      if (cuadrado.size === 200) {
        push();
        tint(color(colorsEstado1[i % colorsEstado1.length]));
        image(cuadradoImg, posX, posY, 200, 200);
        pop();
      } else if (cuadrado.size === 400) {
        push();
        tint(color(colorsEstado1[i % colorsEstado1.length]));
        image(grandeImg, posX, posY, 400, 400);
        pop();
      }
    }

    for (let i = 0; i < formas.length; i++) {
      let forma = formas[i];
      let posX = forma.col * 200;
      let posY = forma.row * 200;

      if (forma.width === 2 && forma.height === 1) {
        push();
        tint(color(colorsEstado1[i % colorsEstado1.length]));
        image(horizontalImg, posX, posY, 400, 200);
        pop();
      }
      else if (forma.width === 1 && forma.height === 2) {
        push();
        tint(color(colorsEstado1[i % colorsEstado1.length]));
        image(rectanguloImg, posX, posY, 200, 400);
        pop();
      }
    }

    if (millis() - tiempoInicioEstado2 >= 1000 && volume > threshold) {
      generarLinea();
      tiempoInicioEstado2 = millis();
    }

    for (let i = 0; i < lineas.length; i++) {
      let linea = lineas[i];
      let posX = linea.x1;
      let posY = linea.y1;
      let width = linea.x2 - linea.x1;
      let height = linea.y2 - linea.y1;
      let colorIndex = i % colorsEstado2.length;
      let colorHex = colorsEstado2[colorIndex];

      if (colorHex !== "#FFA240") {
        push();
        tint(color(colorHex));
        image(lineaImg, posX, posY, width, height);
        pop();
      }
    }
  }
}

function generarCuadrado() {
  let col = floor(random(5));
  let row = floor(random(4));
  let sizeType = random(); 

  let ocupado = false;
  for (let i = 0; i < cuadrados.length; i++) {
    let cuadrado = cuadrados[i];
    if (cuadrado.col === col && cuadrado.row === row) {
      ocupado = true;
      break;
    }
  }

  
  if (!ocupado) {
    let size = sizeType < 0.5 ? 200 : 400;
    cuadrados.push({ col, row, size });
  }
}

function generarForma() {
  let col = floor(random(5)); 
  let row = floor(random(4)); 
  let formaType = random(); 

  let ocupado = false;
  for (let i = 0; i < formas.length; i++) {
    let forma = formas[i];
    if (forma.col === col && forma.row === row) {
      ocupado = true;
      break;
    }
  }

  if (!ocupado) {
    let width, height;
    if (formaType < 0.5) {
      width = 2;
      height = 1;
    } else {
      width = 1;
      height = 2;
    }

    formas.push({ col, row, width, height });
  }
}

function generarLinea() {
  let x1 = random([0, 200, 400, 600, 800]); 
  let y1 = random([0, 200, 400, 600]); 

  let colorIndex = floor(random(2));
  let r, g, b;

  if (colorIndex === 0) {
    
    r = 233;
    g = 52;
    b = 124;
  } else {
    
    r = 33;
    g = 82;
    b = 180;
  }

  let horizontal = random() < 0.6; 

  if (horizontal) {
    let x2 = x1 + random(100, 400);
    let y2 = y1 + random(8, 20); 
    lineas.push({ x1, y1, x2, y2, color: color(r, g, b), thickness: 10, horizontal });
  } else {
    let x2 = x1 + random(8, 20); 
    let y2 = y1 + random(100, 400);
    lineas.push({ x1, y1, x2, y2, color: color(r, g, b), thickness: 10, horizontal });
  }
}