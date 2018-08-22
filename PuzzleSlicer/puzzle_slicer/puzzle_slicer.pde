PImage img;
int[][] hist;

int maxr;
int maxg;
int maxb;


void setup() {
  size(900, 800);
  colorMode(RGB, 255, 255, 255);
  img = loadImage("vogel.jpg");

  createHist();
}

void createHist() {
  hist = new int[3][256];
  maxr=0;
  maxg=0;
  maxb=0;

  for (int index=0; index<img.width*img.height; index++) {
    color col = img.pixels[index];
    int r = int(red(col));
    int g = int(green(col));
    int b = int(blue(col));

    hist[0][r] += 1;
    hist[1][g] += 1;
    hist[2][b] += 1;
  }

  for (int i=0; i<255; i++) {
    if (maxr< hist[0][i]) {
      maxr = hist[0][i];
    }

    if (maxg< hist[1][i]) {
      maxg = hist[1][i];
    }

    if (maxb< hist[2][i]) {
      maxb = hist[2][i];
    }
  }
}

void showHist() {
  int start = 50;

  for (int i=0; i<hist[0].length; i++) {
    int lh = int(map(hist[0][i], 0, maxr, 0, 255));
    stroke(color(255, 0, 0, 127));
    line (start+i, height-30, start+i, height-30-lh);
  }

  for (int i=0; i<hist[1].length; i++) {
    int lh = int(map(hist[1][i], 0, maxg, 0, 255));
    stroke(color(0, 255, 0, 127));
    line (start+i, height-30, start+i, height-30-lh);
  }

  for (int i=0; i<hist[2].length; i++) {
    int lh = int(map(hist[2][i], 0, maxb, 0, 255));
    stroke(color(0, 0, 255, 127));
    line (start+i, height-30, start+i, height-30-lh);
  }
}

void draw() {

  background(127);

  image(img, 50, 50, img.width, img.height);
  showHist();

  int posX = int(mouseX) - 50;
  int posY = int(mouseY) - 50;
  
  if (posX>=0 && posX < img.width && posY>=0 && posY < img.height) {
    color col = img.pixels[posY*img.width+posX];

    int r = int(red(col));
    int g = int(green(col));
    int b = int(blue(col));

    fill(col);
    rect(width-100, height-100, 50, 50);

    noStroke();
    fill(color(255, 0, 0));
    triangle(50+r, height-28, 50+r+5, height-22, 50+r-5, height-22);

    noStroke();
    fill(color(0, 255, 0));
    triangle(50+g, height-28, 50+g+5, height-22, 50+g-5, height-22);

    noStroke();
    fill(color(0, 0, 255));
    triangle(50+b, height-28, 50+b+5, height-22, 50+b-5, height-22);
  }
}