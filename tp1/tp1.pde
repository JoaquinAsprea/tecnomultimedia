int beginX = 0;
int beginY = 300;
int endX = 255;
int endY = 302;

float x = beginX;
float y = beginY;
float step = 0.01;
float pct = 0.0;

int beginC = 255;
int beginV = 300;
int endC = 500;
int endV = 302;

float c = beginC;
float v = beginV;
float step2 = 0.01;
float pct2 = 0.0;

int beginB = 500;
int beginN = 300;
int endB = 300;
int endN = 302;

float b = beginB;
float n = beginN;
float step3 = 0.01;
float pct3 = 0.0;

int beginA = 460;
int beginS = 260;
int endA = 260;
int endS = 260;

float a = beginA;
float s = beginS;
float step4 = 0.01;
float pct4 = 0.0;

int beginD = -600;
int beginF = 0;
int endD = 0;
int endF = 0;

float d = beginD;
float f = beginF;
float step5 = 0.01;
float pct5 = 0.0;

int estado = 0;
PFont fuente;
PImage Bond1;
PImage bond2;
PImage James;

void setup () {
  size (600,600);
  Bond1 = loadImage("Bond1.png");
  bond2 = loadImage("bond2.png");
  James = loadImage("007.png");
  fuente = createFont("007 GoldenEye.ttf",48); 
}
void draw (){
  background (0);
  if (estado==0){
  inicio();
   textSize (20);
    fill (255);
    textAlign (CENTER,CENTER);
    text ("HARRY SALTZMAN     ALBERT R.BROCCOLI present", width/2, height/2);
        textSize (20);
    fill (0);
    textAlign (200,CENTER);
    text ("&", 250, height/2);
}
else if (estado==1){
  background(0);
  iniciofin();
  image(Bond1,460,260);
   textSize (20);
    fill (255);
    textFont(fuente);
    textAlign (CENTER,CENTER);
    text ("Jean Connery", 300, 500);
}
else if (estado==2){
  background(0);
  titulo ();
  titulobond ();
     textSize (2);
    fill (255);
    textFont(fuente);
    textAlign (CENTER,CENTER);
    text ("Shirley Eaton and", 300, 500);
       textSize (2);
    fill (255);
    textFont(fuente);
    textAlign (CENTER,CENTER);
    text ("Gert Frobe", 300, 550);
}
else if (estado==3){
  background(0);
  fill(255);
  ellipse(300,302,100,100);
  image (bond2,260,260);
 blood ();
   image(James,150,450);
}
else if (estado==4){
  background(0);
fill (255,0,0,80);
rect (0,0,600,600);
textSize (20);
    fill (255);
    textFont(fuente);
    textAlign (CENTER,CENTER);
    text ("director Guy Hamilton", 300, 275);
textSize (20);
    fill (255);
    textFont(fuente);
    textAlign (CENTER,CENTER);
    text ("music by John Barry", 300, 325);

}
}
void inicio (){
  if(pct < 1.0){
    x = beginX + ((endX - beginX) * pct);
    y = beginY + ((endY - beginY) * pct);
    pct += step;
  }
  fill (255);
  ellipse(x, y, 25, 25);
}
void iniciofin (){
  fill (255);
  if(pct2 <1.0){
    c = beginC + ((endC - beginC) * pct2);
    v = beginV + ((endV - beginV) * pct2);
    pct2 += step2;
  }
  fill (255);
  ellipse(c, v, 100, 100);
}
void titulo(){
  if(pct3 <1.0){
    b = beginB + ((endB - beginB) *pct3);
    n = beginN + ((endN - beginN) *pct3);
    pct3 += step3;
  }
  fill (255);
  ellipse(b,n,100,100);
}
void titulobond(){
   if(pct4 <1.0){
    a = beginA + ((endA - beginA) *pct4);
    s = beginS + ((endS - beginS) *pct4);
    pct4 += step4;
   }
   image(Bond1,a,s);
}
void blood (){
  if(pct5 <1.0){
    d = beginD + ((endD - beginD) *pct5);
    f = beginF + ((endF - beginF) *pct5);
    pct5 += step5;
   }
   fill(255,0,0,60);
   rect(f,d,600,600);

}
 void mousePressed (){
    if (estado==0){
      estado=1;
    }
    else if (estado==1){
      estado=2;
    }
    else if (estado==2){
      estado=3;
    }
    else if (estado==3){
      estado=4;
    }
 }
