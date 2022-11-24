class Pelota {
  PVector pos, vel;
  int ancho, alto;

  Pelota(int direccion) {
    ancho = 20;
    alto = 150;
    pos = new PVector(width/2, height/2);
    vel = new PVector(direccion*random(6, 7), random(6, 7));
  }
  void mover() {
    pos.add(vel);
  }

  void pelota() {
    fill(173, 196, 20);
    noStroke();
    ellipse(pos.x, pos.y, 20, 20);
  }

  void reboteT1 (PVector posTenista) {
    float min = posTenista.y - alto/2;

    float max = posTenista.y + alto/2;

    if (pos.x < ancho && pos.y > min && pos.y < max) {
      vel.x *= -1;
    }
  }

  void reboteT2 (PVector TenistaPos) {
    float min = TenistaPos.y - alto/2;

    float max = TenistaPos.y + alto/2;

    if (pos.x > width - ancho && pos.y > min && pos.y < max) {
      vel.x *= -1;
    }
  }

  void reboteP() {
    if (pos.y > height) {
      vel.y *= -1;
    } else if (pos.y < 0) {
      vel.y *= -1;
    }
  }

  PVector reinicioPos() {
    return pos;
  }
}
