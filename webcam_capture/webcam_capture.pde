import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println("Camera "+i + " " + cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[1]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  // set(0, 0, cam);
  loadPixels();
  int[] src = new int[width*height];
  for(int i=0; i<width*height/2; i++){
    int tmp = pixels[width*height-i-1];
    pixels[width*height-i-1] = pixels[i];
    pixels[i] = tmp;
  }
  
  
  updatePixels();
  
}