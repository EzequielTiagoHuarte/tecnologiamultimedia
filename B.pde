//Todo esto sería la pelota y sus funciones como el movimiento, la posición, reicio de posición y la coalicones que tiene con las paletas y las paredes.
//Aquello que dice add y sub serían la suma y la resta de los componentes, comandos que van junto con el PVector
class Pelota {
  PVector pos, vel;
  int ancho, alto;
  
  Pelota(int direccion) {
    ancho = 20;
    alto = 150;
    pos = new PVector(width/2, height/2);
    vel = new PVector(direccion*random(6,7), random(6,7));
  }
  void mover() {
    pos.add(vel);
  }
  
  void pelota() {
    fill(255);
    noStroke();
    ellipse(pos.x, pos.y, 20,20);
  }
  
  void reboteT1 (PVector posTenista) {

    float min = posTenista.y - alto/2;
    
    float max = posTenista.y + alto/2;
    
    if(pos.x < ancho && pos.y > min && pos.y < max) {
      vel.x *= -1;
    }
  }
  
  void reboteT2 (PVector TenistaPos) {

    float min = TenistaPos.y - alto/2;
    
    float max = TenistaPos.y + alto/2;
    
    if(pos.x > width - ancho && pos.y > min && pos.y < max) {
      vel.x *= -1;
    }
  }
  
  void reboteP() {

    if(pos.y > height) {
      vel.y *= -1;
    } else if(pos.y < 0) {
      vel.y *= -1;
    }
  }
  
  PVector reinicioPos() {
    return pos;
  }
}
