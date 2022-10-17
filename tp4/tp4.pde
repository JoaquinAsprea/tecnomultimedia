/* Trabajo práctico 4
Comision 3
Joaquín Asprea 84219/8
Brenda Katherine Mogni 91479/0
Docente: David Bedoian 
Link del video: https://youtu.be/4lUEiazVTIE */

Fondo bug;
//Boton bag;
Char p;
int cuenta;
int cuentamx;

void setup(){
  size (600,600);
  
  bug = new Fondo(width/2, height/2, 200);
  //bag = new Boton(width/2, height/2, 200);
  p = new Char(width/2, height/2, 200);
  
}
void draw(){
 
  
  bug.move();
  bug.edificios();
  //agg una boolean q se active con las direcciones izquierda derecha y asi 
  p.personaje();
  p.movimiento();
  fill (50);
  noStroke ();
  rect (0, 335, 1000, 1000);
}
