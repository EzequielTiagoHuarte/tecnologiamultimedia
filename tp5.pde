//tp5 - Ezequiel Tiago Huarte
//Halloween Case
//Historia / contexto
/*Sos un detective que investiga un caso sobre desapariciones de jovenes en el día de Halloween, todos fueron vistos por ultima vez delante de una casa antigua, 
  dicen que hay movimiento dentro del lugar pero que nadie salió de ahí, entonces vos durante la noche vas y entras al lugar con una linterna durante la noche, 
  al ingresar te das cuenta de que no es como las demas casas si no que es un laberinto lleno de fantasmas, intentas salir de buenas a primeras pero no podes porque 
  está bloqueada la puerta y tu linterna comienza a fallar, lo unico que podes hacer es adentrarte más en la oscuridad hasta encontrar una forma de salir.
*/
//Actualizaciones(No decidido por el momento):
/*
- FUNDAMENTAL agregar clases, pantalla de inicio (Anotación para no olvidarme) 
- Poner objetos sobre el mapa que tendrá que conseguir el jugador (Tengo pensado que el jugador, que sería el detective, encuentre huesos en el laberito, 
  si consigue todos gana el juego)(Estaría bueno que aparezcan de forma aleatoria).
- Cambiar el color del laberito por imagenes (Es decir, al suelo ponerle una imagen de tablas de madera, para dar la sensación de que estas dentro de un edificio).
- Cambiar la forma de los fantasmas por imagenes (Dudo que lo haga por cosas de tiempo, y más cuando ya de por sí funciona así,
  pero tal vez lo haga porque ver un rombo con ojos rojos te persigue como que no me convence mucho)(Tambien en el caso del detective, pero eso ya lo veré)
- Agregar musica para el ambiente
 */

//Bugs:
/*
- No funcionan las teclas debido a un error que todavía no he detectado,
  sin embargo, si mantenes el click izquierdo o derecho del mouse encima del circulo prodrá moverse
  (Igual la idea sería usar las teclas así que espero encontrar el error).
- Hay que solucionar el tema del marcador y del tiempo que no avanza.
- La salida del laberinto no funciona (Habré borrado el comando por error, lo tendré que buscar)(La luz que marca donde está la salida parece que funciona, asi que no perdí todo).
 */
//Controles:
/*
- Movimiento: W,A,S,D o las flechas (También si mantenes el click izquierdo o derecho del mouse encima del circulo prodrá moverse)
 - Reset: R
 */

//****************************************************************************************
//Variables:

//Jugador
float px, py; //x,y
float pSize = 15;
float vision = 200; //Campo de visión
float Luz = 255;
boolean flickerN = true;
//Movimientos
boolean aDown = false;
boolean sDown = false;
boolean dDown = false;
boolean wDown = false;

//Enemigos
int arrayS = 10; //Numero de fantasmas
float[] eX = new float[arrayS];
float[] eY = new float[arrayS];
float[] speedX = new float[arrayS]; 
float[] speedY = new float[arrayS]; 

//Detect. lineas
int lArraySize = 119;
//Cord. lineas
float[] lx1 = new float[lArraySize];
float[] lx2 = new float[lArraySize];
float[] ly1 = new float[lArraySize];
float[] ly2 = new float[lArraySize];

//Color
color LCol = color(0, 0, 0);

//Score
float score = 0;
float highScore = 0;

//Reset
boolean reset = false;

//****************************************************************************************
void setup() {
  size(800, 800);
  //Pos. Inicio
  px = 25; 
  py = 25;
  //Fantasma
  for (int n = 0; n < arrayS; n += 1) {
    eX[n] = random(100, 700);
    eY[n] = random(100, 700);
    speedX[n] = random(-1.5, 1.5);
    speedY[n] = random(-1.5, 1.5);
  }
}
//****************************************************************************************
void draw() {
  background(LCol);
  //Visión
  fov (px, py, vision);
  Luz();
  //Laberinto
  Laberinto();
  //Bases del laberinto
  for (int n = 0; n < lArraySize; ++n) {
    strokeWeight(6);
    stroke(LCol);
    line(lx1[n], ly1[n], lx2[n], ly2[n]);
  }
  //exit
  exitGate();
  //Detective
  Detective(px, py);
  //Fantasma
  Fantasma(arrayS);
  //hit
  Hit();
  //reset
  reset = false;
  //Instrucciones
  Instrucciones();
  //score
  Score();
  //Ganar
  Ganar();
 }
//****************************************************************************************
void exitGate() {
  if (px > width-150 && py > height-100) {
    strokeWeight(6);
    stroke(255);
    fill(255);
    line(width-100, height, width, height);
    //p.luz
    if (px > width-100 && py > height-75) { 
      noStroke();
      fill(255, 100);
      beginShape();
      vertex(width-100, height);
      vertex(width, height);
      vertex(px, py);
      endShape(CLOSE);
      
    }
  }
  
  if (px > 500 && px < 550 && py > 650 && py < 750) {
    //luz
    noStroke();
    fill(255, 100);
    beginShape();
    vertex(525-17, 725);
    vertex(525+17, 725);
    vertex(px, py);
    endShape();
  }
}

void fov(float x, float y, float size) {
  noStroke();
  fill(150, Luz);
  circle(x, y, size);
}

void Luz() {
  float n = -5;
  if (Luz >= 255) {
    flickerN = true;
  }
  if (Luz <= 0) {
    flickerN = false;
  }
  if (!flickerN) {
    Luz -= n;
  } else if (flickerN) {
    Luz += n;
  }
}

void Detective(float x, float y) {
  strokeWeight(3);
  stroke(0);
  fill(252, 194, 104);
  circle(x, y, pSize);
}

void Fantasma(int n) {
  vision = 200;
  for (n = 0; n <(arrayS-1); n += 1) {
    eX[n] = eX[n] - speedX[n];
    eY[n] = eY[n] - speedY[n];
    if (eX[n] < px+pSize*6 && eY[n] < py+pSize*6 && eX[n] > px-pSize*6 && eY[n] > py-pSize*6) {
      vision = 100; //La luz de la linterna se achica cuando tenes un fantasma cerca (capaz lo saque y cambie la cantidad de visión principal a 100, 
                    //solamente se apagaría la linterna cada cierto tiempo)
    }
    //Fantasma
    strokeWeight(2);
    stroke(LCol);
    fill(LCol);
    //Cuerpo
    beginShape();
    vertex(eX[n], eY[n]-pSize*2);
    vertex(eX[n]+pSize*2, eY[n]);
    vertex(eX[n], eY[n]+pSize*2);
    vertex(eX[n]-pSize*2, eY[n]);
    endShape(CLOSE);
    //Ojos
    noStroke();
    if (LCol != color(0)) {
      fill(255, 255, 255);
    } else {
      fill(255, 0, 0);
    }
    circle(eX[n]-5, eY[n], 5);
    circle(eX[n]+5, eY[n], 5);
    if (eX[n] >= 800-pSize*2) {
      speedX[n] = speedX[n] *-1;
    }
    if (eX[n] <= 0+pSize*2) {
      speedX[n] = speedX[n] *-1;
    }
    if (eY[n] >= 800-pSize*2) {
      speedY[n] = speedY[n] *-1;
    }
    if (eY[n] <= 0+pSize*2) {
      speedY[n] = speedY[n] *-1;
    }
    if (eX[n] < px+pSize*2 && eY[n] < py+pSize*2 && eX[n] > px-pSize*2 && eY[n] > py-pSize*2) {
      reset = true;
    }
  }
}

void Hit() {
  for (int n = 0; n < lArraySize; ++n) {
    boolean hit = contorno (lx1[n], ly1[n], lx2[n], ly2[n], px, py, pSize/2);
    if (hit || reset) {
      px = 25; 
      py = 25;
      score = 0;
    }
  }
}

void Score() {
  if (highScore < score && highScore == 0 && Ganar()) {
    highScore = score;
  } else if (highScore > score && score > 0 && Ganar()) {
    highScore = score;
  }
  textAlign(CENTER, BOTTOM);
  textSize(25);
  fill(252, 194, 104);
  text("Tiempo rapido: "+(int)highScore/60, 650, 30);
  text("Tiempo actual: "+(int)score/60, 150, 30);
}

boolean Ganar() {
  if (py >= height) {
    reset = true;
    return true;
  }
  return false;
}

void Instrucciones() {
  if (px < 150 && py < 50) {
    textAlign(CENTER, BOTTOM);
    textSize(40);
    fill(252, 194, 104);
    text("¡Encuentra la forma de escapar!", width/2, height/2);
    textSize(30);
    text("Muevete con las flechas o con W,A,S,D", width/2, height/2+50);
    strokeWeight(5);
    stroke(252, 194, 104);
    line(765, 725, 765, 775);
    line(765, 775, 750, 760);
    line(765, 775, 780, 760);
  }
}
boolean contorno (float x1, float y1, float x2, float y2, float px, float py, float pSize) {
  //detecta si alguno está dentro del círculo en el interior
  boolean i1 = Detective(x1, y1, px, py, pSize);
  boolean i2 = Detective(x2, y2, px, py, pSize);
  if (i1 || i2) {
    return true;
  }
  float distX = x1 - x2;
  float distY = y1 - y2;
  float len = sqrt( (distX*distX) + (distY*distY) );
  float dot = (((px-x1)*(x2-x1)) + ((py-y1)*(y2-y1))) / pow(len, 2);
  float closestX = x1 + (dot * (x2-x1));
  float closestY = y1 + (dot * (y2-y1));
  boolean onSegment = linePoint(x1, y1, x2, y2, closestX, closestY);
  if (!onSegment) return false;
  fill(0, 0, 0, 0); //Invisible
  noStroke();
  ellipse(closestX, closestY, 5, 5);
  // distancia cercana
  distX = closestX - px;
  distY = closestY - py;
  float distancia = sqrt( (distX*distX) + (distY*distY) );
  if (distancia <= pSize) {
    return true;
  }
  return false;
}

boolean Detective(float pointx, float pointy, float px, float py, float pSize) {
  //Distancia entre el punto y el circulo
  float distX = pointx - px;
  float distY = pointy - py;
  float distance = sqrt((distX*distX) + (distY*distY));
  //Distancia mayor que el circulo
  if (distance <= pSize) {
    return true;
  }
  return false;
}

boolean linePoint(float x1, float y1, float x2, float y2, float pointx, float pointy) {
  // Lineas de un punto a otro
  float d1 = dist(pointx, pointy, x1, y1);
  float d2 = dist(pointx, pointy, x2, y2);

  // Longitud de lineas
  float lineLen = dist(x1, y1, x2, y2);

  // Colisión
  float buffer = 0.1;   //Mas = preciso

  if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
    return true;
  }
  return false;
}

//controls
//Teclas
void keyReleased() 
{
  if (key == 'A' || key == 'a' || keyCode == LEFT) {
    aDown = false;
  } else if (key == 'D' || key == 'd' || keyCode == RIGHT) {
    dDown = false;
  } else if (key == 'W' || key == 'w' || keyCode == UP) {
    wDown = false;
  } else if (key == 'S' || key == 's' || keyCode == DOWN) {
    sDown = false;
  }
}

void keyPressed()
{
  if (key == 'A' || key == 'a' || keyCode == LEFT) {
    aDown = true;
  } else if (key == 'D' || key == 'd' || keyCode == RIGHT) {
    dDown = true;
  } else if (key == 'W' || key == 'w' || keyCode == UP) {
    wDown = true;
  } else if (key == 'S' || key == 's' || keyCode == DOWN) {
    sDown = true;
  }
  if (key == 'r' || key == 'R') {
    reset = true;
  }
 }
void Laberinto() { //Cord.del laberinto
  int n = 0;
  int mC = 50; //contador de laberinto

  if (n < lArraySize) {
    n = 0;
  }
  //paredes
  lx1[n] = 0; 
  ly1[n] = 0; 
  lx2[n] = width; 
  ly2[n] = 0; //Techo
  n = n +1; //Puesto para no escribir una y otra vez "n"

  lx1[n] = 0; 
  ly1[n] = 0; 
  lx2[n] = 0; 
  ly2[n] = height; //Pared Izquierda
  n = n +1;
  lx1[n] = 0; 
  ly1[n] = height; 
  lx2[n] = width-mC*2; 
  ly2[n] = height; //Piso
  n = n +1;
  lx1[n] = width; 
  ly1[n] = 0; 
  lx2[n] = width; 
  ly2[n] = height; //Pared Derecha
  n = n +1;

  //Laberinto actual
  lx1[n] = mC*3; 
  ly1[n] = mC*0; 
  lx2[n] = mC*3; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*0; 
  lx2[n] = mC*5; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*0; 
  lx2[n] = mC*9; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*0; 
  lx2[n] = mC*10; 
  ly2[n] = mC*1;
  n = n +1;
  lx1[n] = mC*14; 
  ly1[n] = mC*0; 
  lx2[n] = mC*14; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*0; 
  ly1[n] = mC*1; 
  lx2[n] = mC*2; 
  ly2[n] = mC*1;
  n = n +1;
  lx1[n] = mC*3; 
  ly1[n] = mC*1; 
  lx2[n] = mC*4; 
  ly2[n] = mC*1;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*1; 
  lx2[n] = mC*6; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*1; 
  lx2[n] = mC*8; 
  ly2[n] = mC*1;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*1; 
  lx2[n] = mC*12; 
  ly2[n] = mC*1;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*1; 
  lx2[n] = mC*13; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*15; 
  ly1[n] = mC*1; 
  lx2[n] = mC*15; 
  ly2[n] = mC*3;
  n = n +1;
  lx1[n] = mC*15; 
  ly1[n] = mC*1; 
  lx2[n] = mC*16; 
  ly2[n] = mC*1;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*2; 
  lx2[n] = mC*1; 
  ly2[n] = mC*3;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*2; 
  lx2[n] = mC*2; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*2; 
  lx2[n] = mC*4; 
  ly2[n] = mC*3;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*2; 
  lx2[n] = mC*7; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*7; 
  ly1[n] = mC*2; 
  lx2[n] = mC*7; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*8; 
  ly1[n] = mC*2; 
  lx2[n] = mC*10; 
  ly2[n] = mC*2;
  n = n +1; 
  lx1[n] = mC*11; 
  ly1[n] = mC*2; 
  lx2[n] = mC*11; 
  ly2[n] = mC*4;
  n = n +1; 
  lx1[n] = mC*11; 
  ly1[n] = mC*2; 
  lx2[n] = mC*13; 
  ly2[n] = mC*2;
  n = n +1; 
  lx1[n] = mC*8; 
  ly1[n] = mC*2; 
  lx2[n] = mC*10; 
  ly2[n] = mC*2;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*3; 
  lx2[n] = mC*4; 
  ly2[n] = mC*3;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*3; 
  lx2[n] = mC*2; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*3; 
  ly1[n] = mC*3; 
  lx2[n] = mC*3; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*3; 
  lx2[n] = mC*6; 
  ly2[n] = mC*3;
  n = n +1;
  lx1[n] = mC*7; 
  ly1[n] = mC*3; 
  lx2[n] = mC*7; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*3; 
  lx2[n] = mC*9; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*3; 
  lx2[n] = mC*13; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*7; 
  ly1[n] = mC*3; 
  lx2[n] = mC*15; 
  ly2[n] = mC*3;
  n = n +1;
  lx1[n] = mC*0; 
  ly1[n] = mC*4; 
  lx2[n] = mC*2; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*4; 
  lx2[n] = mC*4; 
  ly2[n] = mC*5;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*4; 
  lx2[n] = mC*5; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*4; 
  lx2[n] = mC*7; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*8; 
  ly1[n] = mC*4; 
  lx2[n] = mC*8; 
  ly2[n] = mC*5;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*4; 
  lx2[n] = mC*10; 
  ly2[n] = mC*6;
  n = n +1;
  lx1[n] = mC*12; 
  ly1[n] = mC*4; 
  lx2[n] = mC*12; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*4; 
  lx2[n] = mC*15; 
  ly2[n] = mC*4;
  n = n +1;
  lx1[n] = mC*0; 
  ly1[n] = mC*5; 
  lx2[n] = mC*1; 
  ly2[n] = mC*5;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*5; 
  lx2[n] = mC*4; 
  ly2[n] = mC*5;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*5; 
  lx2[n] = mC*5; 
  ly2[n] = mC*6;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*5; 
  lx2[n] = mC*10; 
  ly2[n] = mC*5;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*5; 
  lx2[n] = mC*11; 
  ly2[n] = mC*6;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*5; 
  lx2[n] = mC*15; 
  ly2[n] = mC*5;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*6; 
  lx2[n] = mC*5; 
  ly2[n] = mC*6;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*6; 
  lx2[n] = mC*4; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*6; 
  lx2[n] = mC*6; 
  ly2[n] = mC*7;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*6; 
  lx2[n] = mC*9; 
  ly2[n] = mC*6;
  n = n +1;
  lx1[n] = mC*12; 
  ly1[n] = mC*6; 
  lx2[n] = mC*16; 
  ly2[n] = mC*6;
  n = n +1;
  lx1[n] = mC*0; 
  ly1[n] = mC*7; 
  lx2[n] = mC*3; 
  ly2[n] = mC*7;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*7; 
  lx2[n] = mC*1; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*7; 
  lx2[n] = mC*8; 
  ly2[n] = mC*7;
  n = n +1;
  lx1[n] = mC*7; 
  ly1[n] = mC*7; 
  lx2[n] = mC*7; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*8; 
  ly1[n] = mC*7; 
  lx2[n] = mC*8; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*7; 
  lx2[n] = mC*9; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*7; 
  lx2[n] = mC*12; 
  ly2[n] = mC*7;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*7; 
  lx2[n] = mC*16; 
  ly2[n] = mC*7;
  n = n +1;
  lx1[n] = mC*14; 
  ly1[n] = mC*7; 
  lx2[n] = mC*14; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*15; 
  ly1[n] = mC*7; 
  lx2[n] = mC*15; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*8; 
  lx2[n] = mC*4; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*8; 
  lx2[n] = mC*5; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*8; 
  lx2[n] = mC*7; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*8; 
  lx2[n] = mC*11; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*8; 
  lx2[n] = mC*11; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*12; 
  ly1[n] = mC*8; 
  lx2[n] = mC*13; 
  ly2[n] = mC*8;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*9; 
  lx2[n] = mC*2; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*9; 
  lx2[n] = mC*5; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*9; 
  lx2[n] = mC*6; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*9; 
  lx2[n] = mC*10; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*9; 
  lx2[n] = mC*15; 
  ly2[n] = mC*9;
  n = n +1;
  lx1[n] = mC*14; 
  ly1[n] = mC*9; 
  lx2[n] = mC*14; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*0; 
  ly1[n] = mC*10; 
  lx2[n] = mC*3; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*3; 
  ly1[n] = mC*10; 
  lx2[n] = mC*3; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*10; 
  lx2[n] = mC*11; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*10; 
  lx2[n] = mC*9; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*10; 
  lx2[n] = mC*14; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*15; 
  ly1[n] = mC*10; 
  lx2[n] = mC*16; 
  ly2[n] = mC*10;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*11; 
  lx2[n] = mC*1; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*11; 
  lx2[n] = mC*2; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*11; 
  lx2[n] = mC*2; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*11; 
  lx2[n] = mC*8; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*11; 
  lx2[n] = mC*6; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*7; 
  ly1[n] = mC*11; 
  lx2[n] = mC*7; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*11; 
  lx2[n] = mC*10; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*11; 
  lx2[n] = mC*10; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*11; 
  lx2[n] = mC*11; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*11; 
  lx2[n] = mC*13; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*14; 
  ly1[n] = mC*11; 
  lx2[n] = mC*15; 
  ly2[n] = mC*11;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*12; 
  lx2[n] = mC*5; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*3; 
  ly1[n] = mC*12; 
  lx2[n] = mC*3; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*12; 
  lx2[n] = mC*5; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*7; 
  ly1[n] = mC*12; 
  lx2[n] = mC*9; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*12; 
  lx2[n] = mC*11; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*12; 
  ly1[n] = mC*12; 
  lx2[n] = mC*12; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*12; 
  lx2[n] = mC*14; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*15; 
  ly1[n] = mC*12; 
  lx2[n] = mC*16; 
  ly2[n] = mC*12;
  n = n +1;
  lx1[n] = mC*0; 
  ly1[n] = mC*13; 
  lx2[n] = mC*3; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*13; 
  lx2[n] = mC*4; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*5; 
  ly1[n] = mC*13; 
  lx2[n] = mC*7; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*8; 
  ly1[n] = mC*13; 
  lx2[n] = mC*12; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*10; 
  ly1[n] = mC*13; 
  lx2[n] = mC*10; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*13; 
  lx2[n] = mC*13; 
  ly2[n] = mC*14;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*13; 
  lx2[n] = mC*14; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*15; 
  ly1[n] = mC*13; 
  lx2[n] = mC*16; 
  ly2[n] = mC*13;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*14; 
  lx2[n] = mC*3; 
  ly2[n] = mC*14;
  n = n +1;
  lx1[n] = mC*4; 
  ly1[n] = mC*14; 
  lx2[n] = mC*8; 
  ly2[n] = mC*14;
  n = n +1;
  lx1[n] = mC*9; 
  ly1[n] = mC*14; 
  lx2[n] = mC*9; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*14; 
  lx2[n] = mC*11; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*11; 
  ly1[n] = mC*14; 
  lx2[n] = mC*13; 
  ly2[n] = mC*14;
  n = n +1;
  lx1[n] = mC*14; 
  ly1[n] = mC*14; 
  lx2[n] = mC*15; 
  ly2[n] = mC*14;
  n = n +1;
  lx1[n] = mC*1; 
  ly1[n] = mC*15; 
  lx2[n] = mC*5; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*2; 
  ly1[n] = mC*15; 
  lx2[n] = mC*2; 
  ly2[n] = mC*16;
  n = n +1;
  lx1[n] = mC*6; 
  ly1[n] = mC*15; 
  lx2[n] = mC*12; 
  ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*12; 
  ly1[n] = mC*15; 
  lx2[n] = mC*12; 
  ly2[n] = mC*16;
  n = n +1;
  lx1[n] = mC*13; 
  ly1[n] = mC*15; 
  lx2[n] = mC*13; 
  ly2[n] = mC*16;
  n = n +1;
}

//debug

void mouseDragged() {
  px = mouseX;
  py = mouseY;
}
