/*La nueva idea que tuve fue retomar el juego de ping pong del tp3 y ambientarlo en el Torneo de Roland Garros 1977, especificamente el partido entre Guillermo Vilas 
y  Brian Gottfried.*/
/*Me falta agregarle objetos (que tengo pensado usar textos) y las pantallas de inicio, instrucciones y creditos (que anduve probando y digamos que funcionó, 
pero igual tengo que solucionarlo por hay veces que no responde)*/
//Bug: A veces no responden las paletas pero pasa muy pocas veces, para solucionarlo solamente tiene que cerrar el juego y abrirlo de nuevo.
Principal p;
void setup() {
   size(1080,600);
  p = new Principal();
}
void draw() {
  background(0);
  p. display();
}
