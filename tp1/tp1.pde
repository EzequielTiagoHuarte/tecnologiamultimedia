//tp1
//Ezequiel Tiago Huarte
//Comisión 1
//IMPORTANTE, UNA VEZ QUE ARRANQUEN LOS CREDITOS TOQUE CUALQUIER TECLA PARA REINICIAR, NO SE PORQUE MOTIVO AL INICIAR SE DESORDENA TODO, UNA VEZ QUE LO REINICIE SE VA A ACOMODAR
PImage fondo2do;
PImage fondo3es;
PImage personitas5;
PImage titulo; 
PImage joseph; 
PImage jotaro; 
PImage avdol;
PImage polnareff;
PImage kakyoin;
PImage iggy;
PImage dio;
PImage portada;
PFont credits;
int key = 0;
int movimiento;
int posY1=600;
int posY2=700;
int posY3=900;
int posY4=1100;
int posY5=1300;
int posY6=1500;
int posY7=1700;
int posY8=1920;
int posY9=2100;
int posY10=2200;
int posY11=2300;
int posY12=2400;
int posY13=2500;
int posY14=2600;
int posY15=2700;
int posY16=2780;
int v1=-5;
int v2=-6;
Boolean cambiocolor=false;
Boolean activotexto=false;
float imageX;
float imageY;
void setup(){
size(855,600);
 background(0);
 frameRate(10000);
 fondo3es= loadImage("banano.jpg");
 personitas5= loadImage("personitas5.jpg");
 fondo2do= loadImage("fondo numero 999.jpg");
 portada= loadImage("portada.jpg");
 titulo= loadImage("titulo.png");
  }
void draw(){
//Fondo
  background(255);
  fill(0,0,0,255);
  rectMode(CENTER);
  credits=createFont("ArcadeClassic.ttf",15);
  image(portada, 200,-16,443,632);
   if(mouseX > 365 && mouseX< 485 &&
  mouseY > 540 && mouseY< 580){
  fill(225,165,189);
  cambiocolor=true;}
  rect(425,560,120,40);
  fill(255);
  if (activotexto){
  background(0);
 movimiento = frameCount-=v1;
 image(fondo2do,0,0);
 image(fondo2do, 0, 0-movimiento);
 image(titulo, 0, 0-movimiento);
 //Joseph
 joseph = loadImage("joseph.png");
image(joseph,600,660);
image(joseph, 330, 725-movimiento);
 //Jotaro
 jotaro = loadImage("jotaro.png");
image(jotaro,600,660);
image(jotaro, 330, 925-movimiento);
//Avdol
  avdol = loadImage("avdol.png");
image(avdol,600,660);
image(avdol, 330, 1125-movimiento);  
//Polnareff
 polnareff = loadImage("Polnareff.png");
image(polnareff,600,660);
image(polnareff, 315, 1325-movimiento); 
//Kakyoin
 kakyoin = loadImage("Kakyoin.png");
image(kakyoin,600,660);
image(kakyoin, 330, 1525-movimiento); 
//Iggy
 iggy = loadImage("Iggy.png");
image(iggy,600,660);
image(iggy, 330, 1725-movimiento); 
//Dio
 dio = loadImage("dio.png");
image(dio,600,660);
image(dio, 315, 1925-movimiento);   

 //Creditos

credits = createFont("ArcadeClassic.ttf", 36);
textFont(credits);
text("Creditos",360, posY1);
text("Personajes-Actores de voz",205, posY2);
text("Escritor",350, posY10);
text("Desarrollador y Distribuidor",185, posY12);
text("Compositor",340, posY14);
text("Joseph Joestar-Sugita Tomokazu",155, posY3);
text("Jotaro Kujo-Daisuke Ono",220, posY4);
text("Muhammad Avdol-Kenta Miyake",200, posY5);
text("Jean Pierre Polnareff-Komatsu Fuminori",90, posY6);
text("Noriaki Kakyoin-Hirakawa Daisuke",140, posY7);
text("Iggy-Fukuen Misato",260, posY8);
text("Dio Brando-Koyasu Takehito",200, posY9);
text("Hirohiko Araki",305, posY11);
text("Capcom",380, posY13);
text("Capcom",380, posY15);
posY1+=v2;
posY2+=v2;
posY3+=v2;
posY4+=v2;
posY5+=v2;
posY6+=v2;
posY7+=v2;
posY8+=v2;
posY9+=v2;
posY10+=v2;
posY11+=v2;
posY12+=v2;
posY13+=v2;
posY14+=v2;
posY15+=v2;
posY16+=v2;
if (posY16 <= 0){
  //image(personitas,0,0);
  image(personitas5,0,0);
  fill(random(160, 225));
text("Presiona cualquier tecla para reiniciar",80, 300);
}
 movimiento = frameCount;
   if (keyPressed){ 
     frameCount = (0);   
   if (keyPressed) 
    if (key == 'b' || key == 'B') 
      fill(0);
 posY1=600;
 posY2=700;
 posY3=900;
 posY4=1100;
 posY5=1300;
 posY6=1500;
 posY7=1700;
 posY8=1920;
 posY9=2100;
 posY10=2200;
 posY11=2300;
 posY12=2400;
 posY13=2500;
 posY14=2600;
 posY15=2700;
 posY16=2780;
   }else{
     fill(0,0,255);
   }
  }
}
void mouseClicked(){
  if(mouseX > 365 && mouseX< 485 &&
  mouseY > 540 && mouseY< 580){
    activotexto=true;
  }
}
