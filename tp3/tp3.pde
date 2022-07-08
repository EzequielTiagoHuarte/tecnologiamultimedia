//declaramos las variables
//paleta1
int posXp1 = 10;
int posYp1 = 225;
int sizeP1 = 75;
//paleta2
int posXp2 = 480;
int posYp2 = 225;
int sizeP2 = 75;
//pelota
int radio = 20;
float posXpel = 200;
float posYpel = 100;
float vel = 2;
float dirXpel = 1;
float dirYpel = 1;
//marcador
int marcador = 0;
int marcador2 = 0;
int estado=0;
String [] textos = {"PING-PONG","Instrucciones", 
  " Jugador 1\n Presione W y S para subir y bajar", "Jugador 2\n Presione ↑ y ↓ para subir y bajar","El que hace 3 puntos primero gana"};
void setup() {
  size(500, 500);
}
void draw() {
  background(0);
  if (estado==0) {
    pantallas(textos[0], width/2, height/2, 50 );
  } else if (estado==1) {
    pantallas(textos[1], width/2, height/2, 30 );
  } else if (estado==2) {
    pantallas(textos[2], width/2, height/2, 30 );
  } else if (estado==3) {
    pantallas(textos[3], width/2, height/2, 30 );
    } else if (estado==4) {
    pantallas(textos[4], width/2, height/2,25 );
 }
if ( estado==5) {
  paleta1();
  paleta2();
  pelota();
  condicion();
  marcador();
  campo();
 } 
}
void mousePressed() {
  estado ++;
}
 void pantallas(String texto, int px, int py, int tamText) {
  textSize(tamText);
  textAlign(CENTER);
  fill(255);
  text(texto, px, py);
 }
void paleta1() {
  fill(255);
  rect(posXp1, posYp1, 10, sizeP1);
  if (keyPressed) {
    if (key == 's') {
      posYp1 = posYp1 + 1;
    }
    if (key == 'w') {
      posYp1 = posYp1 - 1;
    }
  }
}
void paleta2() {
  fill(255);
  rect(posXp2, posYp2, 10, sizeP2);
  if (keyPressed) {
    if(keyCode == DOWN) {
      posYp2 = posYp2 + 1;
    }
    if(keyCode == UP) {
      posYp2 = posYp2 - 1;
    }
  }
}
void pelota(){
  fill(255);
ellipse(posXpel,posYpel,radio,radio);
posXpel = posXpel + dirXpel * vel;
posYpel = posYpel + dirYpel * vel;
if(posXpel + radio/2 >= width || posXpel + radio/2 <= 15 ){
dirXpel *= -1;
}
if( posYpel + radio/2 >= height || posYpel + radio/2 <= 15){
dirYpel *= -1;
}
}
void condicion(){
 if(posXpel <= 20 && posYpel <= sizeP1 + posYp1 && posYpel >= posYp1){
   dirXpel *= -1;
   dirYpel *= -1;
 }
 if(posXpel >= width - 20 && posYpel <= sizeP2 + posYp2 && posYpel >= posYp2){
   dirXpel *= -1;
   dirYpel *= -1;
 }
  
}
void marcador(){
  textSize(25);
  fill(255);
  text(marcador2,300,50);
  text(marcador,200,50);
  if(posXpel + radio/2 >= width ){
  marcador += 1;

  }
if(marcador == 3){
    fill(255);
    textSize(15);
    text("JUGADOR 1 GANA    JUGADOR 2 PIERDE",248,75);
  }
  if(posXpel + radio/2 <=  15 ){
  marcador2 += 1;

  }
  if(marcador2 == 3){
    fill(255);
    textSize(15);
    fill(255);
    text("JUGADOR 1 PIERDE    JUGADOR 2 GANA",248,75);
  }
  if(marcador == 3 || marcador2 == 3){
    text(marcador2,100,50);
    text(marcador,250,50);
    posXpel = 250;
    posYpel = 250;
    text("toca cualquier tecla para reiniciar \n toque click para ver los creditos",250,325);
  }
}
void campo(){
stroke(255);
line(250,0,250,500);
noFill();
ellipse(250,250,100,100);
}
{
if ( estado==6) {
  text("Huarte, Ezequiel Tiago \n Legajo:91348/9",250,325);
 }
}
