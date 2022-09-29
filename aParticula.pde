class Principal{
ArrayList<Circle> circles;
PImage img;
int n;
float s,x,y;
efecto f;
Circle c;
Principal(){
  n= 3500;
  circles = new ArrayList<Circle>();
  img = loadImage("Br.png");
  x=0;
   y=0;
    s=0;
f=new efecto(s,x,y);
}
  void dibujo(){
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);
  if(circles.size() > 0) {
    for(int i = 0; i < circles.size(); i++) {
      Circle c = circles.get(i);
      c.c = img.get(int(c.pos.x), int(c.pos.y));
      f.show();
      f.move();
      if(f.isDead()) circles.remove(i);
    }
  }
 }
void click(){
  for(int i = 0; i < n; i++)
    circles.add(new Circle(mouseX, mouseY, 20));
 }
}
