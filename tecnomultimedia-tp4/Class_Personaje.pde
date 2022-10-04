Animation animation1;

class Char {
float xpos;
float ypos;
float drag = 30.0;
int numberOfFrames;
int f;
  float x;
  float y;
  int diameter;
  float ang, vel;
  int contador;


  Char(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y= tempY;
    diameter = tempDiameter;
    
  }
  void personaje (){
 frameRate(24);
  animation1 = new Animation ("Personaje_", 38);
  ypos = height * 0.25;
}
}
  void movimiento() { 
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;

  if (mousePressed) {
    background(153, 153, 0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
    
}
}
