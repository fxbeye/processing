
int noFlakes = 200;
Flake[] flakes = new Flake[noFlakes];
PImage img;

void setup (){

  size(600, 400);
  img = loadImage("image1.JPG");

  for (int i=0; i<noFlakes; i++) {
    flakes[i] = new Flake();
  }
}

void draw() {
  //background(0);
  image(img,0,0,width,height);
  tint(color(200));
  
  for (Flake flake : flakes) {
    flake.update();
    flake.show();
  }
}