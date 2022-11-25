class Banana {
  float ubx, uby;
  PImage puntaje;
  float speed;
  float rand;
  float BnnW, BnnH;
  Banana(PImage archivo, float tempUbx, float tempUby) {
    puntaje=archivo;
    ubx=tempUbx;
    uby=tempUby;
    puntaje=loadImage("Banana.png");
    BnnW = 40;
    BnnH = 40;
  }
  void ubi() {
    push();
imageMode(CENTER); 
    image(puntaje, ubx, uby, BnnW, BnnH);
    dist(ubx, uby, myProta.x, myProta.y);
    pop();
  }
  boolean colision( float x_, float y_, float ancho_, float alto_) {
 if ( ubx-BnnW/2<x_+ancho_/2
 && ubx+BnnW/2>x_-ancho_/2
 && uby-BnnH/2<y_+alto_/2
 && uby+BnnH/2>y_-alto_/2 )
 {

 ubx = (int)random(0, 600);
 uby = (int)random(0, 600);
 return true;
 } else {
   return false;
 }
 }
}
