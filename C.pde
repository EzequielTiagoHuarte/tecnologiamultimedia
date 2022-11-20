class Texto {
  PFont fuente;
  float tam;
  color C;
  int aling;
  Texto(PFont fuente, float tam, color C, int aling) {//detro del constructor, parametros para luego reemplazalos
    this.fuente = fuente; 
    this.tam = tam;
    this.C = C;
    this.aling = aling;
  }
  void txt(String Love, float x, float y) {
    fill(C);
    textFont(fuente);
    textSize(tam);
    textAlign(aling);
    text(Love, x, y);
  }
}
