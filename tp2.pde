// tp2
// Ezequiel Tiago Huarte
// Comision 1
// https://youtu.be/RKG1WZScEXA
color c1,c2;
void setup(){
  size (800,800);
  rectMode(RADIUS);
  noStroke();
}
void draw(){
  c1=color(0);
  c2=color(255);
  translate(width/2, height/2);
  rotate(map(mouseX, 0, width, 0, PI/2));
  background(c2);
  for (int i = 0; i<40;i++){
    rotate(map(mouseX, 0,width, PI/80, PI/10));
    translate(map(mouseY, 0, height, 10,-10),0);
    if(i%2==0) 
    fill(c1);
    else 
    fill(c2);
    float r= (width/3) - i*6.8 ;
    rect(0,0,r,r,10);
  }
 }

