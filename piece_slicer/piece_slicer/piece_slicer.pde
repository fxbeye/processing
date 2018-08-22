PImage img;

int minx, miny, maxx, maxy;

void setup() {
  size(1000, 600);
  background(255);
  img = loadImage("vogel.jpg");

  image(img, width/2-img.width/2, height/2-img.height/2);

  stroke(255);
  strokeWeight(3);

  minx = width/2 - img.width/2;
  miny = height/2 - img.height/2;
  maxx = width/2 + img.width/2;
  maxy = height/2 + img.height/2;

  // 2 vertical slice lines
  line (random(minx, minx+img.width), random(0, miny), random(minx, minx+img.width), random(miny+img.height, miny+img.height+50));
  line (random(minx, minx+img.width), random(0, miny), random(minx, minx+img.width), random(miny+img.height, miny+img.height+50));

  // 2 horizontal slice lines
  line (random(0, minx), random(miny, miny+img.height), random(maxx, maxx+50), random(miny, miny+img.height));
  //line (random(0,minx), random(miny, miny+img.height), random(maxx,maxx+50), random(miny, miny+img.height));
  
  // store new white strokes in image
  loadPixels();
  
  for(int i=minx;i<maxx;i++){
    for(int j=miny;j<maxy;j++){
  }
  
  updatePixels();
  
}

int[] createMask(int startX, int startY){
  int[] mask = new int[img.pixels.length];
  
  // find the top left corner start position based on the start coordinates 
  
  // find the bottom right corner end position
  
  // scan this area for non-white pixels
  
  // each non white pixel should be part of the mask array
  
  for(int i=0; i<img.width*(startY-miny); i++){
    mask[i] = int(random(255));
  }
  
  return mask;
}

void mousePressed() {
  if (mouseButton == LEFT) {
    
    // create mask array
    int[] mask = createMask(mouseX, mouseY); //<>//
    
    // apply mask array
    img.mask(mask);
    image(img, width/2-img.width/2, height/2-img.height/2);
    
  } else if (mouseButton == RIGHT) {
    // reset image
    
  }
}

void draw(){
  background(255);
  image(img, width/2-img.width/2, height/2-img.height/2);
}