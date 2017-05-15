// Clase Receta

// Implementa todas las funcionalidades y objetos que contiene una receta


class Receta 
{

  PFont fuente;
  String titulo;
  String autor;
  String localidad;
  SoundFile audio;
  color colorBackground;
  color colorFont;
  PGraphics canvas;
  int width, height;
  float actWidth, actHeight;
  float widthTg, heightTg;
  float posXidle, posYidle;
  float posXtg, posYtg;
  float posXSelected, posYSelected;
  float posX, posY;
  int offset;
  int id;
  boolean selected, playing, needsDrawing;
  int fontSizeBig, fontSizeMedium, fontSizeSmall;
  PImage imgAutor, imgReceta, play, pause;
  
  Receta(PApplet applet, int id_) {
    
    fuente = loadFont("LeelawadeeUI-200.vlw");
    titulo = "Titulo";
    autor = "Autor";
    localidad = "Localidad";
    audio = new SoundFile(applet, "receta.mp3");
    colorBackground = color(100);
    colorFont = color(255);
    
    width = 1280;
    height = 720;
    
    actWidth = width / 3;
    actHeight = height / 3;
    
    widthTg = actWidth;
    heightTg = actHeight;
   
    fontSizeBig = int(height) / 4;
    fontSizeMedium = int(height) / 10;
    fontSizeSmall = int(height) / 20;

    canvas = createGraphics(width, height); 
    imgAutor = loadImage("abuela.jpg");
    float imgAutorHeight = 0.4 * height;
    float imgAutorWidth = imgAutorHeight * imgAutor.width / imgAutor.height;
    
    imgAutor.resize(int(imgAutorWidth), int(imgAutorHeight));
      
    imgReceta = loadImage("receta.jpg");
    
    float imgRecetaHeight = 0.55 * height;
    float imgRecetaWidth = imgRecetaHeight * imgReceta.width / imgReceta.height;
    imgReceta.resize(int(imgRecetaWidth), int(imgRecetaHeight));
    
    play = loadImage("play.png");
    pause = loadImage("pause.png");
    
    selected = false;
    playing = false;
    
    int id = id_;
    posXidle = (id%3) * width/3;
    posYidle = ((id - id%3) / 3) * height/3;
    
    posXSelected = 0;
    posYSelected = 0;
    
    posXtg = posXidle;
    posYtg = posYidle;
    
    posX = posXtg;
    posY = posYtg;
    
    needsDrawing = true;
    
  }
  
  void setFont(String font_) {
  
    fuente = loadFont(font_);
    needsDrawing = true;
    
  }
  
  boolean isSelected() {
  
    return selected;
    
  }
  
  void setImgAutor(String loc_) 
  {
    
    imgAutor = loadImage(loc_);
    needsDrawing = true;
  
  }

  void setImgReceta(String loc_) 
  {
    
    imgReceta = loadImage(loc_);
    needsDrawing = true;
  
  }
  
  void setSelected() {
  
    selected = true;
    
    posXtg = posXSelected;
    posYtg = posYSelected;
    
    widthTg = width;
    heightTg = height;
    needsDrawing = true;
    
  }
  
  void setUnselected() {
  
    selected = false;

    posXtg = posXidle;
    posYtg = posYidle;
    
    widthTg = width/3;
    heightTg = height/3;
    needsDrawing = true;
    
  }
  
  void setTitle(String title_) {
  
    titulo = title_;
    needsDrawing = true;
    
  }
  
  void setAutor(String autor_) 
  {
    
    autor = autor_;
    needsDrawing = true;
    
  }
  
  void setLocation(String location_)
  {
  
    localidad = location_;
    needsDrawing = true;
    
  }
  
  void setAudio(PApplet applet, String audio_) 
  {
  
    audio = new SoundFile(applet, audio_);
    needsDrawing = true;
    
  }
  
  void setColor(color color_) 
  {
  
    colorBackground = color_;
    needsDrawing = true;
    
  }
  
  void setFontSizeBig(int n_)
  {
  
    fontSizeBig = n_;
    needsDrawing = true;
    
  }

  void setFontSizeSmall(int n_)
  {
  
    fontSizeSmall = n_;
    needsDrawing = true;
    
  }
  
  void setResolution(int width_, int height_)
  {
  
    width = width_;
    height = height_;
    
    canvas = createGraphics(width, height);
    needsDrawing = true;
    
  }
  
  void setPosition(int posX_, int posY_)
  {  
    posX = posX_;
    posY = posY_;

  }
  
  void update(int offset_) {
  
    offset = offset_;
    
    float speed = 0.4;
    
    posX = posX + (posXtg - posX) * speed;
    posY = posY + (posYtg - posY) * speed;
  
    actWidth = actWidth + (widthTg - actWidth) * speed;
    actHeight = actHeight + (heightTg - actHeight) * speed;
    
  }
  
  void display() {
    
    if (selected && needsDrawing) {
    
      canvas.beginDraw();
      canvas.background(colorBackground);
      canvas.tint(255);

      float imgAutorHeight = 0.4 * height;
      float imgAutorWidth = imgAutorHeight * imgAutor.width / imgAutor.height;
      
      canvas.image(imgAutor, 0.05 * width, 0.1 * height, imgAutorWidth, imgAutorHeight);
      canvas.fill(colorFont);
      canvas.textFont(fuente);
      canvas.textSize(fontSizeMedium);
      canvas.textAlign(LEFT, TOP);
      canvas.textSize(fontSizeSmall);
      canvas.text(autor, 0.05 * width , 0.15 * height + imgAutorHeight);
      canvas.text(localidad, 0.05 * width , 0.21 * height + imgAutorHeight);
      canvas.textSize(fontSizeMedium);
      canvas.text(titulo, 0.05 * width, 0.28 * height + imgAutorHeight);

      float imgRecetaHeight = 0.55 * height;
      float imgRecetaWidth = imgRecetaHeight * imgReceta.width / imgReceta.height;
      canvas.image(imgReceta, 0.95 * width - imgRecetaWidth, 0.1 * height, imgRecetaWidth, imgRecetaHeight);
      canvas.fill(255);
      canvas.stroke(255);
      canvas.rect(0.05 * width, 0.8 * height, 0.9 * width, 0.1 * height);
      
      if ((mouseX > 0.05 * width) && (mouseX < 0.15 * width) && (mouseY > 0.8 * height) && (mouseY < 0.9 * height)) canvas.fill(255, 0, 0);
      else canvas.fill(colorBackground);
      
      canvas.rect(0.05 * width, 0.8 * height, 0.1 * height, 0.1 * height);
      if (!playing) canvas.image(play, 0.05 * width, 0.8 * height, 0.1 * height, 0.1 * height);
      else canvas.image(pause, 0.05 * width, 0.8 * height, 0.1 * height, 0.1 * height);
      canvas.stroke(colorBackground);
      canvas.strokeWeight(3);
      canvas.line(0.06 * width + 0.1 * height, 0.85 * height, 0.93 * width, 0.85 * height);
      canvas.endDraw();
      
      needsDrawing = false;
      
    }
    
    else if (!selected && needsDrawing) {
    
      canvas.beginDraw();
      canvas.background(colorBackground);
      canvas.textFont(fuente);
      canvas.fill(255);
      canvas.textSize(fontSizeBig);
      canvas.textAlign(CENTER, CENTER);
      canvas.text(titulo, 0.5 * width, 0.5 * height);
      canvas.endDraw();
      
      needsDrawing = false;
    
    
    }
  }
  

  void mPressed()
  {
    
    if ((!selected) && (mouseX > posX) && (mouseX < posX + actWidth) && (mouseY > posY) && (mouseY < posY + actHeight)) {
    
      setSelected();
      needsDrawing = true;
      
    }
    
    else {
      
      
      needsDrawing = true;
      
      if ((mouseX > 0.05 * width) && (mouseX < 0.15 * width) && (mouseY > 0.8 * height) && (mouseY < 0.9 * height)) 
      {
        if (!playing) audio.play();
        else audio.stop();
        
        playing = !playing;
        
      }
      
      else {
        
        setUnselected();
        
        if (playing) {
        
          playing = false;
          audio.stop();
          
        }
        
      }
  
  }

}
}