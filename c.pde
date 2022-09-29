class efecto extends Circle{
  efecto(float s, float x, float y){
  super(s, x, y);
}
  void show(){
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, s, s);
    
    s -= 0.1
   ;
  }
  
  void move() {
    acel = PVector.random2D();
    acel.mult(0.5);
    vel.add(acel);
    vel.limit(5);
    pos.add(vel);
  }
 boolean isDead() {
    if(s < 1) return true;
    else return false;
  }
}
  
