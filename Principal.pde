//Clase principal + void de display, void score, void win
class Principal {
Tenista paleta1, paleta2;
Pelota pelota;
int pantalla;
boolean win;
int MaxScore;
float tam, x, y;
PImage Foto;
PImage Fotito;
PImage Copa;
PImage R;
PImage A;
PFont fuente;
Texto [] frase = new Texto [3];
 Boton [] Cambio = new Boton [6];
  Principal() {
  paleta1 = new Tenista(1); //Guillermo Vilas
  paleta2 = new Tenista(2); //Brian Gottfried
  pelota = new Pelota(1);
  MaxScore =3; //Maximo puntaje
  win = false; //Si no llegan al maximo puntaje sigue el partido
  pantalla = 0;
  fuente = createFont("ArcadeClassic.ttf",30);
  frase[0] = new Texto(fuente, 50, 255, CENTER);
  frase[1] = new Texto(fuente, 60, 255, CENTER);
  frase[2] = new Texto(fuente, 70, 255, CENTER);
  Foto=loadImage("Guillermo Vilas 150x150.png");
  Fotito=loadImage("Brian Gottfried 150x150.png");
  Copa=loadImage("copa.png");
  A=loadImage("paleta1.png");
  R=loadImage("paleta2.png");
   Cambio[0] = new Boton (460,460,150,50);
   Cambio[1] = new Boton (460,460,150,50);
   Cambio[2] = new Boton (460,460,150,50);
}

  void display() {
    if (pantalla == 0) {
      background(0,0,0);
       image(Copa,460,125);
       image(A,125,275);
       image(R,800,275);
      frase[0].textos("PingPong!\nTorneo Roland Garros\n1977 ", width/2, height/2);
      Cambio[0].Dibujin(0, 1);
    }
    if (pantalla == 1) {
      frase[1].textos("¡Instrucciones!", width/2, height/2);
      Cambio[1].Dibujin(1, 2);
      if (pantalla == 2) {
      frase[0].textos(" Jugador 1\n Presione W y S para subir y bajar", width/2, height/2);
       Cambio[2].Dibujin(2, 3);
    } 
    if (pantalla == 3) {
      frase[0].textos(" Jugador 2\n Presione ↑ y ↓ para subir y bajar", width/2, height/2);
    }
    if (pantalla == 4) {
      frase[0].textos("El que hace 3 puntos primero gana", width/2, height/2);
    }
      if (pantalla == 5) {
        frase[2].textos("Creditos \n\n Huarte, Ezequiel Tiago \n Legajo:91348/9", width/2, height/2);
      }
            if (pantalla == 6) {
  textSize(30);
  text(paleta1.reinicioScore(), width/2 - 60, 40);
  text(paleta2.reinicioScore(), width/2 + 40, 40);
  
  if(win == false) {
    strokeWeight(2);
    stroke(255);
    
    for(int y = 0; y < height; y+= 10) {
      stroke(255);
      line(540,0,540,800);
      noFill();
      ellipse(540,300,80,80);
    }
    pelota.pelota();
    pelota.mover();
  }
  paleta1.cuerpo();
  paleta1.mover();
  pelota.reboteT1(paleta1.reinicioPos());
  paleta2.cuerpo();
  paleta2.mover();
  pelota.reboteT2(paleta2.reinicioPos());
  pelota.reboteP();
  score();
  win();
 }
}
 }
void score() {
  PVector pelotaPos = pelota.reinicioPos();
  if(pelotaPos.x > width && paleta1.reinicioScore() <= MaxScore) {
    paleta1.score(1);
    pelota = new Pelota(-1);
  } 
  else if(pelotaPos.x < 0 && paleta2.reinicioScore() <= MaxScore) { 
    paleta2.score(1);
    pelota = new Pelota(1);
  }
  else if (keyPressed && win == true) {
    setup();
  }
}
void win() {
  if(paleta1.reinicioScore() == MaxScore) {
    
    image(Foto,465,250);
    text("Guillermo Vilas ha ganado la partida", 300, 450);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 345, 500, CENTER);
    win = true;
  } else if(paleta2.reinicioScore() == MaxScore) {
    
    image(Fotito,465,250);
    text("Brian Gottfried ha ganado la partida", 300, 450);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 345, 500, CENTER);
    win = true;
  }
 }
 void interacion() {
    if (Cambio[0].Clic(460,460,150,50) && pantalla == Cambio[0].a) {
      pantalla = Cambio[0].d;
    }
    if (Cambio[1].Clic(460,460,150,50) && pantalla == Cambio[1].a) {
      pantalla = Cambio[1].d;
    }
    if (Cambio[2].Clic(460,460,150,50) && pantalla == Cambio[2].a) {
      pantalla = Cambio[2].d;
   }
 }
}
