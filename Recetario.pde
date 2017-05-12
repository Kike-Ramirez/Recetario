import processing.sound.*;

Receta receta;

void setup() {

  receta = new Receta();
  
}


void draw() {


  receta.update();
  receta.display();
}