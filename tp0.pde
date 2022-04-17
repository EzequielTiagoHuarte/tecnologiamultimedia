//Huarte, Ezequiel Tiago
//tp0 figuras
void setup() {
  size(800, 800);  
  background(#FFFFFF); //color de fondo
}
void draw() {
  fill(#F7F014); //primera capa  
  ellipse(400, 400, 600, 600);  
  fill(#030303); //primera capa  
  ellipse(400, 400, 550, 550); 

  fill(#F7F014); //primera capa 
  //triangulos 1
  triangle(200, 200, 300, 400, 400, 300);
  triangle(200, 600, 300, 400, 400, 500);
  triangle(600, 200, 400, 300, 500, 400);
  triangle(600, 600, 400, 500, 500, 400);


  //triagulos 2
  triangle(400, 100, 300, 300, 500, 300);
  triangle(400, 700, 300, 500, 500, 500);
  triangle(100, 400, 300, 300, 300, 500);
  triangle(700, 400, 500, 300, 500, 500);

  fill(#030303); //circulo central 1
  ellipse(400, 400, 300, 300);

  fill(#F7F014); //circulo central 2
  ellipse(400, 400, 250, 250);

  fill(#030303); //primera capa 
  ellipse(400, 400, 200, 200);

  fill(#F7F014); //circulo central 3
  ellipse(400, 400, 150, 150);

  fill(#030303); //primera capa 
  ellipse(400, 400, 100, 100);

  fill(#F7F014); //circulo central 4
  ellipse(400, 400, 50, 50);

  fill(#030303); //circulo en la punta del triangulo 1
  ellipse(400, 200, 50, 50);
  ellipse(200, 400, 50, 50);
  ellipse(600, 400, 50, 50);
  ellipse(400, 600, 50, 50);

  fill(#F7F014); //circulo en la punta del triangulo 2
  ellipse(400, 200, 25, 25);
  ellipse(200, 400, 25, 25);
  ellipse(600, 400, 25, 25);
  ellipse(400, 600, 25, 25);


  fill(#F7F014); //circulo de la esquina 1
  ellipse(50, 50, 75, 75);
  ellipse(750, 50, 75, 75);
  ellipse(50, 750, 75, 75);
  ellipse(750, 750, 75, 75);

  fill(#030303); //circulo de la esquina 2
  ellipse(50, 50, 50, 50);
  ellipse(750, 50, 50, 50);
  ellipse(50, 750, 50, 50);
  ellipse(750, 750, 50, 50);

  fill(#F7F014); //circulo de la esquina 3
  ellipse(50, 50, 25, 25);
  ellipse(750, 50, 25, 25);
  ellipse(50, 750, 25, 25);
  ellipse(750, 750, 25, 25);
}
