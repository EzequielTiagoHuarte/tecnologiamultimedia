color c1,c2,c3;
void setup(){
  size (800,800);
  rectMode(RADIUS);
  noStroke();
}
void draw(){
  c1=color(0);//negro
  c2=color(255);//blanco
  c3=color(250,165,60);//ocre
  translate(width/2, height/2);//Hace desplazar una forma
  rotate(map(mouseX, 0, width, 0, PI/2)); //Hace girar una forma
  background(c2);//Fondo
  for (int i = 0; i<40;i++){
    rotate(map(mouseX, 0,width, PI/80, PI/10));
    translate(map(mouseY, 0, height, 10,-10),0);
    if(i%2==0) 
    fill(c1);
    else 
    fill(c2);
    float radio= (width/3) - i*6.8 ;
    rect(0,0,radio,radio,10);}
  }
//void mousePressed(){
 // translate(width/2, height/2);
 // rotate(map(mouseX, 0, width, 0, PI/2));
  //background(c3);
  // for (int i = 0; i<40;i++){
 //   rotate(map(mouseX, 0,width, PI/80, PI/10));
 //   translate(map(mouseY, 0, height, 10,-10),0);
 //   if(i%2==0) 
 //   fill(c3);
  //  else 
 //   fill(c2);
 //   float radio= (width/3) - i*6.8 ;
 //   rect(0,0,radio,radio,10);}
 // }
