/* Nombre: Joaquín Asprea & Brenda Mogni
 leg: 84219/8 & 91479/0
 Profesor: David Bedoian
 Comision: 3 */
//Link del video:
import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioPlayer victory;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int[] dx = {0, 0, 1, -1}, dy = {1, -1, 0, 0};
int estado = 0;
int puntos = 0;
PImage Reglas;
PImage Fondo;
PImage Victoria;
PImage Derrota;
boolean gameover = false;
PImage Inicio;
PFont font;
boolean DEBUG= false;
Banana[]banana=new Banana[1];
MinionsMoradosIzquierda[]mmi=new MinionsMoradosIzquierda[3];
MinionsMoradosArriba[]mma=new MinionsMoradosArriba[4];
Prota myProta;
void setup() {
  x.add(5);
  y.add(5);
  minim = new Minim(this);
  player = minim.loadFile("Cancion.wav");
  victory = minim.loadFile("Victory.wav");
  Reglas = loadImage("Reglas.png");
  Fondo = loadImage("Fondo.jpg");
  Victoria = loadImage("Victoria.jpg");
  Derrota = loadImage("Derrota.jpg");
  size(600, 600);
  font= createFont("FUENTE.ttf", 48);
  Inicio=loadImage("Titulo.png");
  myProta= new Prota(loadImage("Minion.png"), width/2, 650, 4);
  for (int i=0; i<mmi.length; i++) {
    mmi[i] = new MinionsMoradosIzquierda(loadImage("Left.png"), -100, i*800/mmi.length, random(3, 6), 3);
  }
    for (int i=0; i<mma.length; i++) {
    mma[i] = new MinionsMoradosArriba(loadImage("Up.png"), -100, i*800/mma.length, random(2, 5), 3);
  }
  for (int i=0; i<banana.length; i++) {
    banana[i] = new Banana(loadImage("Banana.png"), random(10,590),random(10,590));
  }
}

void draw() {
  image(Fondo, 0, 0);
  if (estado==0) {
    player.play();
    image(Inicio, 0, 0);
    fill(0);
    textFont(font);
    textSize(25);
    text("Click para las reglas", 225, 365);
  }
  if (estado==1) {
    image(Reglas, 0, 0);
    fill(0);
    textFont(font);
    textSize(50);
    text("Click para", 250, 340);
    textSize(50);
    text("empezar", 260, 550);
  }
  if (estado==2) {
    for (int i=0; i<mmi.length; i++) {
      mmi[i].display();
      mmi[i].drive();
      if ( mmi[i].colision(myProta.x, myProta.y, myProta.ancho, myProta.alto)) {
        estado=4;
      }
    }
     for (int i=0; i<mmi.length; i++) {
      mma[i].display();
      mma[i].drive();
      if ( mma[i].colision(myProta.x, myProta.y, myProta.ancho, myProta.alto)) {
        estado=4;
      }
    }

    myProta.display();
    myProta.mover();
    banana[0].ubi();
    //banana[0].Puntaje();
  }
  if (estado==3) {
    victory.play();
    image(Victoria, 0, 0);
    fill(255);
    textFont(font);
    textSize(75);
    text("GANASTE", 203, 103);
    textSize(21);
    text("Felicidades,", 248, 350);
    text("con todos los minions alimentados", 190, 375);
    text("Gru logró por fin robar la luna", 205, 400);
    text("Creditos - Joaquín Asprea & Brenda Mogni", 160.5, 550.5);
    fill(255, 170, 0);
    textSize(75);
    text("GANASTE", 200, 100);
    textSize(21);
    text("Creditos - Joaquín Asprea & Brenda Mogni", 160, 550);
  }
  if (estado==4) {
    image(Derrota, 0, 0);
    fill(255, 0, 0);
    textFont(font);
    textSize(75);
    text("PERDISTE", 350, 75);
    textSize(30);
    fill(255);
    text("presiona espacio para reiniciar", 320, 100);
    if (keyPressed && key == ' ') {
      estado=2;
    }
  }
}

void mousePressed () {
  if (estado==0) {
    estado=1;
  } else if (estado==1) {
    player.pause();
    estado=2;
  }
}
