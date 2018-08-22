color c;

void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {
  background(0);

  drawColorRectangle();
  
  fill(c);
  rect(255, 0, 150, 150);

  stroke(255);
  line(mouseX-5, mouseY, mouseX+5, mouseY);
  line(mouseX, mouseY-5, mouseX, mouseY+5);

  if (mousePressed) {
    println("color(" + int(red(c)) + "," +int(green(c)) + ","+int(blue(c))+")" );
  }
}

void drawColorRectangle(){
  loadPixels();
  for (int h=0; h<255; h++) {
    for (int s=0; s<255; s++) {
      int index = h * width + s;
      pixels[index] = color(h, s, 255);
    }
  }
  c = pixels[mouseY*width+mouseX];
  updatePixels();
}