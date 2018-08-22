int noBubbles = 50;
int rows = 10;
Paddle p = new Paddle(150, 250, PI/2);

Bubble[] bubbles = new Bubble[noBubbles];

color[] cols = new color[]{
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(0, 0, 255), 
  color(255, 0, 255), 
  color(255, 255, 0), 
  color(0, 255, 255)
};

void setup() {
  size(300, 300);
  background(100);

  for (int i=0; i<noBubbles; i++) {
    int x = i%rows*22+50;
    int y = 50+(i/rows)*22;
    color c = cols[int(random(cols.length))];
    bubbles[i] = new Bubble(x, y, c);
  }
  p.spawn(new Bubble(-20,0,cols[int(random(cols.length))]));
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      p.turnLeft();
    } else if (keyCode == RIGHT) {
      p.turnRight();
    }
  }
  if(key == ' '){
    p.shoot();
  }
}

void draw() {
  background(100);

  for (int i=0; i<noBubbles; i++) {
    bubbles[i].render();
  }
  p.update();
  p.render();
}