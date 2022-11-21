class Boton{
  PFont fuente;
  int a, d;
  float px, py, anc, alt;

  Boton(float px, float py, float anc, float alt) {
    this.px = px;
    this.py = py;
    this.anc = anc;
    this.alt = alt;
  }
  void Dibujin(int a, int d) {
    this.a = a;
    this.d = d;
    fill(255);
    strokeWeight(0);
    rect(px, py, anc, alt);
  }
  void AD(int a, int d) {
    this.a = a;
    this.d = d;
  }
  boolean Clic(float px, float py, float anc, float alt) {
    this.px = px;
    this.py = py;
    this.anc = anc;
    this.alt = alt;
    boolean botones = mouseX > px && mouseX < px + anc && mouseY > py && mouseY < py + alt == true;
    return botones;
  }
}
