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
}
