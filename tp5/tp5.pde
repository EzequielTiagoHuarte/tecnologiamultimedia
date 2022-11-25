//Apellido y nombre: Huarte, Ezequiel Tiago
//Legajo: 91348/9
//https://youtu.be/lmsVhM5EodY
import processing.sound.*;
SoundFile Music;
Principal p;
void setup() {
  size(1080, 600);
  p = new Principal();
  Music= new SoundFile (this, "music8bits.mp3");
  Music.play();
  Music.amp(0.1);
}
void draw() {
  background(0);
  p. display();
}
void mousePressed() {
  p.interacion();
}
