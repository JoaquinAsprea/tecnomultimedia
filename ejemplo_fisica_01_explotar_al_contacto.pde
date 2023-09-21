import ddf.minim.*;
Minim minim;
import fisica.*;
AudioPlayer inicio;
AudioPlayer juego;
AudioPlayer ganaste;
AudioPlayer perdiste;
int puntosRojos = 0;
int puntosAzules = 0;
int puntosAmarillos = 0;
int vidas = 3; // Número de vidas inicial
int vidasPerdidas = 0; // Número de vidas perdidas
float sueloY;
FWorld mundo;
FCircle bola;
FMouseJoint cadena;
ArrayList<FCircle> bolas;
float radioBolas = 60;
int tiempoUltimaBola = 0;
int intervaloBolas = 3000;
float rangoXMin, rangoXMax;

boolean victoria = false; // Variable para verificar si se ha ganado el juego
boolean pantallaInicial = true; // Variable para verificar si se muestra la pantalla inicial

// Cuadrados para representar las vidas
FBox[] vidasCuadrados = new FBox[3];

void setup() {
   minim = new Minim(this);
  inicio = minim.loadFile("inicio.mp3");
  juego = minim.loadFile("juego.mp3");
  ganaste = minim.loadFile("ganaste.mp3");
  perdiste = minim.loadFile("perdiste.mp3");
  size(1200, 600);
  Fisica.init(this);
  sueloY = height - 10;
  mundo = new FWorld();
  mundo.setEdges();
  bolas = new ArrayList<FCircle>();

  bola = new FCircle(radioBolas);
  bola.setPosition(width / 2, height / 4);
  bola.setName("mouse");
  mundo.add(bola);

  cadena = new FMouseJoint(bola, width / 2, height / 4);
  cadena.setFrequency(400000);
  mundo.add(cadena);

  crearTriangulos();

  rangoXMin = 50;
  rangoXMax = width - 50;

  // Inicializar los cuadrados de vidas
  for (int i = 0; i < vidasCuadrados.length; i++) {
    vidasCuadrados[i] = new FBox(30, 30); // Tamaño de los cuadrados de vidas
    vidasCuadrados[i].setPosition(width - 40 - i * 40, 20); // Posición de los cuadrados de vidas
    vidasCuadrados[i].setStatic(true);
    mundo.add(vidasCuadrados[i]);
  }
  FBox fbox1 = new FBox(150, 600);
  fbox1.setPosition(0, 0);
  fbox1.setStatic(true);
  mundo.add(fbox1);

  FBox fbox2 = new FBox(150, 600);
  fbox2.setPosition(1050, 0);
  fbox2.setStatic(true);
  mundo.add(fbox2);
}

void crearTriangulos() {
  float lado = 60;
  float xSpacing = 200;

  for (int i = 0; i < 3; i++) {
    float x = (width / 4) + (i * xSpacing);
    float y1 = height / 2;
    float y2 = y1 - lado;
    float y3 = y1 + (lado / 2 * sqrt(3));

    FBox ladoIzquierdo = new FBox(10, lado + 125);
    ladoIzquierdo.setPosition(x - (lado / 2), (y2 + y1) / 2);
    ladoIzquierdo.setRotation(radians(20));
    ladoIzquierdo.setStatic(true);
    mundo.add(ladoIzquierdo);

    FBox ladoDerecho = new FBox(10, lado + 125);
    ladoDerecho.setPosition(x + (lado / 2), (y2 + y1) / 2);
    ladoDerecho.setRotation(-radians(20));
    ladoDerecho.setStatic(true);
    mundo.add(ladoDerecho);

    FBox ladoHorizontal = new FBox(lado + 75, 10);
    ladoHorizontal.setPosition(x, y3);
    ladoHorizontal.setStatic(true);
    mundo.add(ladoHorizontal);
  }
}

void draw() {
  if (pantallaInicial) {
    pantallaInicio();
  } else {
    background(255);
      if (inicio.isPlaying()) {
    inicio.pause();
    inicio.rewind();
  }
  if (ganaste.isPlaying()) {
    ganaste.pause();
    ganaste.rewind();
  }
  if (perdiste.isPlaying()) {
    perdiste.pause();
    perdiste.rewind();
  }

juego.play(); 
    fill(0);
    textAlign(RIGHT);
    textSize(24);
    text("Puntos Rojos: " + puntosRojos, width - 20, 60);
    text("Puntos Azules: " + puntosAzules, width - 20, 90);
    text("Puntos Amarillos: " + puntosAmarillos, width - 20, 120);

    for (int i = bolas.size() - 1; i >= 0; i--) {
      FCircle bola = bolas.get(i);
      float posY = bola.getY();

      if (posY + radioBolas >= sueloY) {
        mundo.remove(bola);
        bolas.remove(i);
      }
    }

    if (millis() - tiempoUltimaBola >= intervaloBolas) {
      float probabilidad = random(1);
      FCircle circulo;

      if (probabilidad < 0.125) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoRojo");
        circulo.setFillColor(color(255, 0, 0));
      } else if (probabilidad < 0.25) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoAzul");
        circulo.setFillColor(color(0, 0, 255));
      } else if (probabilidad < 0.375) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoAmarillo");
        circulo.setFillColor(color(255, 255, 0));
      } else if (probabilidad < 0.5) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoVerde");
        circulo.setFillColor(color(0, 255, 0));
      } else if (probabilidad < 0.625) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoVioleta");
        circulo.setFillColor(color(128, 0, 128));
      } else if (probabilidad < 0.75) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoNaranja");
        circulo.setFillColor(color(255, 165, 0));
      } else if (probabilidad < 0.875) {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoNegro");
        circulo.setFillColor(color(0, 0, 0));
      } else {
        circulo = new FCircle(radioBolas);
        circulo.setName("enemigoMarron");
        circulo.setFillColor(color(139, 69, 19));
      }

      circulo.setPosition(random(rangoXMin, rangoXMax), 50);
      mundo.add(circulo);
      bolas.add(circulo);

      tiempoUltimaBola = millis();
    }

    float mouseXClamped = constrain(mouseX, rangoXMin, rangoXMax);
    cadena.setTarget(mouseXClamped, sueloY - radioBolas);

    mundo.step();
    mundo.draw();

    if (vidas <= 0) {
      gameOver();
    }

    if (puntosAmarillos >= 1 && puntosRojos >= 1 && puntosAzules >= 1 && !victoria) {
      victoria = true;
      pantallaVictoria();
    }
  }
}

void contactStarted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();

  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  if (nombre1.equals("mouse") && nombre2.equals("enemigoRojo")) {
    FCircle bolaRoja = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaRoja)) {
      mundo.remove(bolaRoja);
      bolas.remove(bolaRoja);
      puntosRojos++;
    }
  } else if (nombre1.equals("mouse") && nombre2.equals("enemigoAzul")) {
    FCircle bolaAzul = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaAzul)) {
      mundo.remove(bolaAzul);
      bolas.remove(bolaAzul);
      puntosAzules++;
    }
  } else if (nombre1.equals("mouse") && nombre2.equals("enemigoAmarillo")) {
    FCircle bolaAmarilla = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaAmarilla)) {
      mundo.remove(bolaAmarilla);
      bolas.remove(bolaAmarilla);
      puntosAmarillos++;
    }
  } else if (nombre1.equals("mouse") && nombre2.equals("enemigoVerde")) {
    FCircle bolaVerde = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaVerde)) {
      mundo.remove(bolaVerde);
      bolas.remove(bolaVerde);
      restarVida();
    }
  } 
  else if (nombre1.equals("mouse") && nombre2.equals("enemigoNegro")) {
    FCircle bolaNegra = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaNegra)) {
      mundo.remove(bolaNegra);
      bolas.remove(bolaNegra);
      restarVida();
    }
  } else if (nombre1.equals("mouse") && nombre2.equals("enemigoVioleta")) {
    FCircle bolaVioleta = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaVioleta)) {
      mundo.remove(bolaVioleta);
      bolas.remove(bolaVioleta);
      restarVida();
    }
  } else if (nombre1.equals("mouse") && nombre2.equals("enemigoNaranja")) {
    FCircle bolaNaranja = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaNaranja)) {
      mundo.remove(bolaNaranja);
      bolas.remove(bolaNaranja);
      restarVida();
    }
  } else if (nombre1.equals("mouse") && nombre2.equals("enemigoMarron")) {
    FCircle bolaMarron = (FCircle) (cuerpo2 instanceof FCircle ? cuerpo2 : cuerpo1);
    if (bolas.contains(bolaMarron)) {
      mundo.remove(bolaMarron);
      bolas.remove(bolaMarron);
      restarVida();
    }
  }
}

void restarVida() {
  vidas--;
  vidasPerdidas++;
  if (vidas <= 0) {
    gameOver();
  } else {
    // Cambiar uno de los cuadrados de vidas a negro
    vidasCuadrados[vidas].setFillColor(color(0)); // Cambiar el color del cuadrado a negro
  }
}

void gameOver() {
    if (juego.isPlaying()) {
    juego.pause();
    juego.rewind();
  }
  if (ganaste.isPlaying()) {
    ganaste.pause();
    ganaste.rewind();
  }
  if (inicio.isPlaying()) {
    inicio.pause();
    inicio.rewind();
  }

  background(255);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("Juego Terminado", width / 2, height / 2);
  noLoop();
  perdiste.play();
}

void pantallaInicio() {
    if (juego.isPlaying()) {
    juego.pause();
    juego.rewind();
  }
  if (ganaste.isPlaying()) {
    ganaste.pause();
    ganaste.rewind();
  }
  if (perdiste.isPlaying()) {
    perdiste.pause();
    perdiste.rewind();
  }
  background(0); // Fondo negro para la pantalla de inicio
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("Bienvenido al Juego", width / 2, height / 3);
  textSize(24);
  text("Haz clic para empezar", width / 2, height / 2);
  inicio.play();
}

void pantallaVictoria() {
    if (juego.isPlaying()) {
    juego.pause();
    juego.rewind();
  }
  if (inicio.isPlaying()) {
    inicio.pause();
    inicio.rewind();
  }
  if (perdiste.isPlaying()) {
    perdiste.pause();
    perdiste.rewind();
  }

  background(0, 255, 0); 
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("¡Has Ganado!", width / 2, height / 2);
  noLoop();
  ganaste.play(); 
}

void mousePressed() {
  if (pantallaInicial) {
    pantallaInicial = false;
  }
}
