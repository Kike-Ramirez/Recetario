// Sketch que muestra el recetario en pantalla

// Importamos la librería de sonido para cargar los audios
import processing.sound.*;


// Necesitamos una lista de objetos de la clase "Receta" que definimos en la pestaña
// de al lado
ArrayList<Receta> recetas;


// La función setup solo se ejecuta una vez al inicio
void setup() {
  
  // Marcamos la resolución de trabajo
  size(1280, 720);
  
  // Definimos un framerate objetivo de 30
  frameRate(30);
  
  // Inicializamos la lista de objetos de la clase Receta, pero aún está vacía
  recetas = new ArrayList<Receta>();
  
  // Comenzamos a llenar la lista
  
  
  // Creamos la Primera receta
  Receta receta = new Receta(this, 0);
  // Definimos el nombre de la receta
  receta.setTitle("Titulo 1");
  // Definimos el nombre de la autora
  receta.setAutor("Autor 1");
  // Definimos el lugar de origen
  receta.setLocation("Localization 1");
  // Ponemos el nombre de la foto de la abuela correspondiente (tiene que estar en la carpeta "Data")
  receta.setImgAutor("abuela.jpg");
  // Ponemos el nombre de la foto de la receta correspondiente (tiene que estar en la carpeta "Data")
  receta.setImgReceta("receta.jpg");
  // Ponemos el nombre del archivo de audio (tiene que estar en la carpeta "Data")
  receta.setAudio(this, "receta.mp3");
  // Definimos el color de la tarjeta
  receta.setColor(color(255, 0, 0));
  
  // Finalmente añadimos esta primera receta a la lista
  recetas.add(receta);

  // Proceder igual para el resto de recetas que aparecen debajo.
  // IMPORTANTE: 
  // Todas las fotos, tipografías y audios, han de estar en la carpeta "Data", dentro de la carpeta del sketch.
  
  
  // Definimos la segunda receta
  receta = new Receta(this, 1);
  receta.setTitle("Titulo 2");
  receta.setAutor("Autor 2");
  receta.setLocation("Localization 2");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(255, 255, 0));

  // Añadimos la segunda receta a la lista
  recetas.add(receta);

  // Definimos la Tercera receta
  receta = new Receta(this, 2);
  receta.setTitle("Titulo 3");
  receta.setAutor("Autor 3");
  receta.setLocation("Localization 3");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(255, 0, 255));

  // Añadimos la tercera receta a la lista
  recetas.add(receta);  

  // Cuarta receta
  receta = new Receta(this, 3);
  receta.setTitle("Titulo 4");
  receta.setAutor("Autor 4");
  receta.setLocation("Localization 4");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(0, 255, 255));

  recetas.add(receta);  

  // Quinta receta
  receta = new Receta(this, 4);
  receta.setTitle("Titulo 5");
  receta.setAutor("Autor 5");
  receta.setLocation("Localization 5");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(100, 100, 255));

  recetas.add(receta);  

  // Sexta receta
  receta = new Receta(this, 5);
  receta.setTitle("Titulo 6");
  receta.setAutor("Autor 6");
  receta.setLocation("Localization 6");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(255, 100, 100));

  recetas.add(receta);  
  
  // Septima receta
  receta = new Receta(this, 6);
  receta.setTitle("Titulo 7");
  receta.setAutor("Autor 7");
  receta.setLocation("Localization 7");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(100, 255, 100));

  recetas.add(receta);  

  // Octava receta
  receta = new Receta(this, 7);
  receta.setTitle("Titulo 8");
  receta.setAutor("Autor 8");
  receta.setLocation("Localization 8");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(255, 255, 100));

  recetas.add(receta);  
  
  // Novena receta
  receta = new Receta(this, 8);
  receta.setTitle("Titulo 9");
  receta.setAutor("Autor 9");
  receta.setLocation("Localization 9");
  receta.setImgAutor("abuela.jpg");
  receta.setImgReceta("receta.jpg");
  receta.setAudio(this, "receta.mp3");
  receta.setColor(color(100, 255, 255));

  recetas.add(receta);  

  // Definimos dibujar las imágenes usando su punto central como referencia o "Anchor Point"
  imageMode(CENTER);
  
  // Finalizamos la función setup(), ya tenemos la lista de recetas creadas y con toda la información
}


// La función draw() se ejecuta una vez por cada frame
void draw() {

  // Borramos la pantalla con un fondo negro
  background(0);
  
  // Recorremos la lista de recetas
  for (int i = 0; i < recetas.size(); i++) 
  {
    // Actualizamos y redibujamos todas las recetas
    recetas.get(i).update(0);
    recetas.get(i).display();
    
    // Si no están activas, las dibujamos en pantalla
    if (recetas.get(i).actWidth <= recetas.get(i).width/3 + 10) image(recetas.get(i).canvas, recetas.get(i).posX, recetas.get(i).posY, recetas.get(i).actWidth, recetas.get(i).actHeight);
  }

  // Volvemos a recorrer la lista de nuevo
  for (int i = 0; i < recetas.size(); i++) 
  {
    // En este caso dibujamos las que sí estén activas
    // Lo hacemos así para que se dibuje la última siempre la que está en movimiento, para que no haya solapes con las demás.
    if (recetas.get(i).actWidth > recetas.get(i).width/3 + 10) image(recetas.get(i).canvas, recetas.get(i).posX, recetas.get(i).posY, recetas.get(i).actWidth, recetas.get(i).actHeight);
  }
  
}


// La función mousePressed() se ejecuta cada vez que pulso el ratón
void mousePressed()
{
  
  saveFrame();

  // Creamos esta variable para detectar si hay alguna receta seleccionada
  boolean isSelectedAny = false;
  
  // Recorremos la lista de recetas
  for (int i = 0; i < recetas.size(); i++) {
  
    // Si hay alguna seleccionada
    if (recetas.get(i).isSelected()) {
      // Llamamos a la función de "Receta" que se encarga de la pulsación del raton "mPressed"
      recetas.get(i).mPressed();
      // Definimos la variable isSelectedAny a verdadero
      isSelectedAny = true;
    }
    
  }

  // En caso de que no haya ninguna seleccionada
  if (!isSelectedAny) {
  
  // Vuelvo a recorrer la lista de recetas
  for (int i = 0; i < recetas.size(); i++) {
  
    // Si no está seleccionada
    if (!recetas.get(i).isSelected()) {
      // Seleccionala
      recetas.get(i).mPressed();
    }
    
  }  
  
  }
  
}