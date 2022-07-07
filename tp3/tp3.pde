/* Nombre: Joaquín Asprea
leg: 84219/8
Profesor: David Bedoian
Comision: 3 */
//Link del video: https://youtu.be/tM9R7f1Mn-o
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w = 30, h = 30, bs = 20, dir = 2, mznx = 12, mzny = 10;//
int[] dx = {0,0,1,-1}, dy = {1,-1,0,0};
int estado = 0;
int puntos = 0;
PImage Snake2;
PFont fuente;
boolean gameover = false;

void setup() {
size(600,600);
x.add(5);
y.add(5);
  fuente = createFont("8-BIT WONDER.TTF",48);
  Snake2 = loadImage("Snake2.png");
}

void draw() {
background(178,189,8);
if (estado==0){
  image(Snake2,180,20);
  fill(0);
 textFont(fuente);
  textSize(15);
text("W A S D Para moverse", 160, 300);
 textSize(10);
text("Si recolectas 30 manzanas ganas", 150, 350);
 textSize(20);
text("Haz click para empezar", 100, 400);

}
if (estado==1){
Puntaje();
for(int i = 0 ; i < w; i++) line(i*bs, 0, i*bs, height); 
for(int i = 0 ; i < h; i++) line(0, i*bs, width, i*bs);
for(int i = 0 ; i < x.size(); i++) {
fill (10);
rect(x.get(i)*bs, y.get(i)*bs, bs, bs);

}
if(!gameover) {
fill(200,0,0);
rect(mznx*bs, mzny*bs, bs, bs);
 if(frameCount%5==0) {
x.add(0,x.get(0) + dx[dir]);
y.add(0,y.get(0) + dy[dir]);
if(x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true;
for(int i = 1; i < x.size(); i++) if(x.get(0) == x.get(i) &&  y.get(0) == y.get(i)) gameover = true;
if(x.get(0)==mznx && y.get(0)==mzny) {
    puntos+=1;
mznx = (int)random(0,w);
mzny = (int)random(0,h);
}else {
x.remove(x.size()-1);
y.remove(y.size()-1);
}
}
} else {
fill(255,0,0);
 textFont(fuente);
textSize(30);
text("PERDISTE", 180, 200);
textSize(20);
text("presiona espacio para reiniciar", 30, 300);
if(keyPressed && key == ' ') {
x.clear(); 
y.clear(); 
x.add(5);
y.add(5);
gameover = false;
}
}

if (keyPressed == true) {
int newdir = key=='s' ? 0 : (key=='w' ? 1 : (key=='d' ? 2 : (key=='a' ? 3 : -1)));
if(newdir != -1 && (x.size() <= 1 || !(x.get(1) ==x.get(0) + dx[newdir] && y.get (1) == y.get(0) + dy[newdir]))) dir = newdir;

 }
 if (puntos==30)
 {
estado=2;
 }
}
if (estado==2){
  background (0);
    fill(178,189,8);
 textFont(fuente);
textSize(30);
text("GANASTE", 180, 200);
textSize(20);
text("Creditos - Joaquin Asprea", 80, 300);
}
}
void Puntaje (){
 fill(255);
 textFont(fuente);
textSize(20);
text("PUNTOS- " + (puntos), 10, 20);
}

void mousePressed (){
    if (estado==0){
      estado=1;
    }
}
