class Circle {
  PVector pos, acel, vel;
  float s, x, y;
  color c;
  Circle(float x, float y, float s_) { 
    this.x=x;
    this.y=y;
    pos = new PVector(x, y);
    acel = new PVector();
    vel = new PVector();

    s = s_;
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
