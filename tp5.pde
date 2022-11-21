  import processing.sound.*;
SoundFile Music;
/*
Bugs: -La musica se suporpone.
      -El boton se corre para un constao cuando se reinicia
.*/
Principal p;
void setup() {
size(1080,600);
p = new Principal();
Music= new SoundFile (this, "music8bits.mp3");
Music.loop();
Music.amp(0.1);

}
void draw() {
  background(0);
  p. display();
}
void mousePressed() {
p.interacion();
}
