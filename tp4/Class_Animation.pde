class Animation {
  
  PImage[] images = new PImage[5];
  
  Animation() {
    
    
   for (int i = 1; i < images.length; i++) {
    images [i] = loadImage("Personaje_"+i+".png"); 
    }
    
  }

  void display (float xpos, float ypos, int cuenta) {
    
    image(images[cuenta], xpos, ypos);
  }
  /*
  int getWidth() {
    return images[cuenta2].width;
  }
  */
}
