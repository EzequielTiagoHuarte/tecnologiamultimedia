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
PFont fuente;
Texto [] frase = new Texto [3];
  Principal() {
  paleta1 = new Tenista(1); //Guillermo Vilas
  paleta2 = new Tenista(2); //Brian Gottfried
  pelota = new Pelota(1);
  MaxScore =3; //Maximo puntaje
  win = false; //Si no llegan al maximo puntaje sigue el partido
  pantalla = 0;
  fuente = createFont("ArcadeClassic.ttf",30);
  frase[0] = new Texto(fuente, 50, 0, CENTER);
  frase[1] = new Texto(fuente, 60, 0, CENTER);
  frase[2] = new Texto(fuente, 70, 0, CENTER);
}

  void display() {
    if (pantalla == 0) {
      background(255,255,0);
      frase[0].textos("PingPong!", width/2, height/2);
    }
    if (pantalla == 1) {
      frase[1].textos("¡Instrucciones!", width/2, height/2);
      if (pantalla == 2) {
      frase[0].textos(" Jugador 1\n Presione W y S para subir y bajar", width/2, height/2);
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
    Foto=loadImage("Guillermo Vilas 150x150.png");
    image(Foto,465,250);
    text("Guillermo Vilas ha ganado la partida", 300, 450);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 345, 500, CENTER);
    win = true;
  } else if(paleta2.reinicioScore() == MaxScore) {
    Fotito=loadImage("Brian Gottfried 150x150.png");
    image(Fotito,465,250);
    text("Brian Gottfried ha ganado la partida", 300, 450);
    textSize(20);
    text("Presione cualquier tecla para volver a jugar", 345, 500, CENTER);
    win = true;
  }
 }
}
