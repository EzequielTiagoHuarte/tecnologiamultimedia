Ezequiel Tiago Huarte
91348/9

Principal p;
void setup() {
  size(700, 700);
  p = new Principal();
}
void draw() {
  background(0);
  p.dibujo();

}
void mousePressed() {
  p.click();
}