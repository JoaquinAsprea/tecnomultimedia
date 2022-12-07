class Prota {
  PImage img;
  PImage up;
  PImage down;
  PImage izq;
  PImage der;
  float x;
  float y;
  float t;
  float ancho, alto;

  boolean arriba, abajo, izquierda, derecha;
  boolean quieto;
  Prota(PImage arc, float tempAx, float tempAy, float mov) {
    img=arc;
    x=tempAx;
    y=tempAy;
    t=mov;

    img=loadImage("Minion.png");
    up=loadImage("Arriba.png");
    down=loadImage("Abajo.png");
    izq=loadImage("Izquierda.png");
    der=loadImage("Derecha.png");
    ancho = 50;
    alto = 50;
  }
  void mover() {
    if (quieto == true) {
      image(img, x-25, y-25, ancho, alto);
      
      push();
      rectMode(CENTER);
    noFill();
    stroke(0);
    rect(x, y, ancho, alto);
    pop();
    }
    if (keyPressed) {
      if (key =='w') {
        quieto = false;
        arriba = true;
        y-= t;
        image (up, x-25, y-25, ancho, alto);
      }
    } else {
      quieto =true;
    }

    if (keyPressed) {
      if (key =='a') {
        izquierda = true;
        x-= t;
        image (izq, x-25, y-25, ancho, alto);
        quieto = false;
      }
    } else {
      quieto =true;
    }
    if (keyPressed) {
      if (key =='d') {
        derecha = true;
        x+= t;
        image (der, x-25, y-25, ancho, alto);
        quieto = false;
      } else {
        quieto =true;
      }
      if (keyPressed) {
        if (key =='s') {
          abajo = true;
          y+= t;
          image (down, x-25, y-25, ancho, alto);
          quieto = false;
        } else {
          quieto =true;
        }

        if (y<=0) {
          y=0;
        }
        if (y>=600) {
          y=600;
        }
        if (x>=600) {
          x=600;
        }
        if (x<=0) {
          x=0;
        }
      }
    }
  }
  void display() {
    push();
    imageMode(CENTER);

    if ( DEBUG ) {
      println(x, y);
      stroke(255);
      noFill();
      rect(x, y, 50, 50);
    }
    pop();
  }
}
