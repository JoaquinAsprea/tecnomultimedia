class Char {

  Animation animation1;

  float xpos =  width/2-120;
  float ypos = height/2;
  float drag = 30.0;
  int numberOfFrames;
  int f;
  float x;
  float y;
  int diameter;
  float ang, vel;
  int cuenta = 1;
  int cuentamx = 4;

  Char(float tempX, float tempY, int tempDiameter) {

    x = tempX;
    y= tempY;
    diameter = tempDiameter;
  }
  void personaje () {

    animation1 = new Animation ();
    ypos = height * 0.25;
  }
  void movimiento() {
    if (cuenta >= cuentamx) {
      cuenta = 1;
    }
    cuenta++;
    println(cuenta);

    /*
    float dx = mouseX - xpos;
     xpos = xpos + dx/drag;
     */
    animation1.display(xpos, ypos, cuenta);

    if (mousePressed) {
      cuenta = 1;
    }
  }
}
