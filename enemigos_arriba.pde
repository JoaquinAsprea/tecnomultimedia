class MinionsMoradosArriba {
 PImage img;
  float Ax;
  float Ay;
  float Aspeed;
  float mov;
  float miAncho, miAlto;

  MinionsMoradosArriba(PImage archivo, float tempAx, float tempAy, float tempAspeed, float space) {
    img=archivo;
    Ax=tempAx;
    Ay=tempAy;
    Aspeed=tempAspeed;
    mov=space;
    img=loadImage("Up.png");
    miAncho = 50;
    miAlto = 50;
  }

  void drive() {
    Ax=Aspeed;
    if (Ax>width) {
      Ax=-100;
    }

    if (Ay>height) {
      Ay=random(-100, -500);
    }
  }

  void display() {
    push();
    imageMode(CENTER);
    image(img, Ax, Ay, miAncho, miAlto);
    pop();
  }
  boolean colision( float x_, float y_, float ancho_, float alto_) {

    if ( Ax-miAncho/2<x_+ancho_/2
      && Ax+miAncho/2>x_-ancho_/2
      && Ay-miAlto/2<y_+alto_/2
      && Ay+miAlto/2>y_-alto_/2 )
    { 
      return true;
    } else { 
      return false;
    }
  }
}
