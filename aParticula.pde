class Principal{
ArrayList<Circle> circles;
int n;
float s,x,y;
 PImage img;
Circle c;
Principal(){
  img = loadImage("Bufon.png");
  n= 3500;
  circles = new ArrayList<Circle>();
  s=0;
  x=0;
  y=0;
}
  void dibujo(){
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
  if(circles.size() > 0) {
    for(int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);
        c.c = img.get(int(c.pos.x), int(c.pos.y));
      c.show();
      c.move();
      if(c.isDead()) circles.remove(i);
    }
  }
 }
void click(){
  for(int i = 0; i < n; i++)
    circles.add(new Circle(mouseX, mouseY, 20));
 }
}
