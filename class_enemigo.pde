class MinionsMorados {
  int tipo;
  PImage img;
  float Ax;
  float Ay;
  float Aspeed;
  float mov;
  float miAncho, miAlto;

  MinionsMorados(int tipo_, PImage archivo, float tempAx, float tempAy, float tempAspeed, float space) {
    tipo = tipo_;
    img=archivo;
    Ax=tempAx;
    Ay=tempAy;
    Aspeed=tempAspeed;
    mov=space;
    img=archivo;
    miAncho = 50;
    miAlto = 50;
  }

  void drive() {
//NO PUEDO HACER QUE LOS MINIONS MALOS ESTEN EN LA UBICACIÓN QUE QUIERO, SE SALEN DE LA PANTALLA
    if ( tipo==1 ) {

      Ax=Ax + Aspeed;
      if (Ax>width) {
        Ax=-100;
      }
      if (Ay>height) {
        Ay=random(-100, -500);
      }
    } else if ( tipo==2 ) {
      Ay=Ay + Aspeed;
      if (Ay>height) {
        Ay=-100;
      }
      if (Ax>width) {
        Ax=random(-100, 500);
      } else if ( tipo==3 ) {

      Ax=Ax - Aspeed;
      if (Ax>width) {
        Ax=-500;
      }
      if (Ay>height) {
        Ay=random(-100, -500);
      }
    }
    } else if ( tipo==4 ) {
      Ay=Ay - Aspeed;
      if (Ay>height) {
        Ay=-500;
      }
      if (Ax>width) {
        Ax=random(-100, 500);
      }
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
