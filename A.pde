class Tenista {
  PVector pos, vel;
  int ancho, alto, paleta, puntos;

  Tenista(int player) {
    paleta = player;
    ancho = 20; 
    alto = 150; 
    puntos = 0; 

    if (paleta == 1) {
      pos = new PVector(ancho/2, height/2);
    } else if (paleta == 2) {
      pos = new PVector(width - ancho/2, height/2);
    }
    vel = new PVector(0, 5);
  }
  void mover() {
    if (paleta == 1 && key == 'w') {
      pos.sub(vel);
    } else if (paleta == 1 && key == 's') {
      pos.add(vel);
    }

    if (paleta == 2 && keyCode == UP) {
      pos.sub(vel);
    } else if (paleta == 2 && keyCode == DOWN) {
      pos.add(vel);
    }

    pos.y = constrain(pos.y, alto/2, height - alto/2);
  }

  void cuerpo() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(pos.x, pos.y, ancho, alto);
  }

  PVector reinicioPos() {
    return pos;
  }
  void score(int love) {
    puntos += love;
  } 
  int reinicioScore() {
    return puntos;
  }
}
