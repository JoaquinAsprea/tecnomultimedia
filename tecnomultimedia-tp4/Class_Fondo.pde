class Fondo {
  //-----------
  PGraphics cielo;
  PGraphics ed;
  //-----------
  float x;
  float y;
  int diameter;
  float ang, vel, vel2 = -250;
  //----Amortiguacion----
  float origen = 0;
  float destino = vel;
  float amortiguacion = 0.9;
  //------------
  PImage fondo, E;


  Fondo(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y= tempY;
    diameter = tempDiameter;
    cielo = createGraphics(width, height);
    cielo.beginDraw();
    cielo.endDraw();
    ed = createGraphics(width, height);
    ed.beginDraw();
    ed.endDraw();
    fondo = loadImage("fondo.png");
    fondo.resize(900, 900);
    E = loadImage("Edificio.png");
  }
  void move() {
    background(255);
  
    vel++; 
    
    destino = vel;
    origen = destino*(1-amortiguacion)+origen*amortiguacion;
    ang =+origen;
    cielo.beginDraw();
    cielo.background(255);
    cielo.pushStyle();
    cielo.imageMode(CENTER);
    cielo.translate(width/2, height/2);
    cielo.rotate(radians(ang));
    cielo.image(fondo, 0, 10);
    cielo.popStyle();
    cielo.endDraw();
    image(cielo, 0, 0);
  }
  void edificios() {

    vel2 = vel2+4;
    if (vel2>width+10) {
      vel2 = -250;
    }
    if (vel2<-251) {
      vel2=width+10;
    }
    ed.beginDraw();
    ed.background(255,1);
    ed.pushStyle();
    ed.translate(0, height/2);
    ed.imageMode(CENTER);
    ed.image(E, 0+vel2, -100);
    ed.popStyle();
    ed.endDraw();
    image(ed,0,0);

  }
}
