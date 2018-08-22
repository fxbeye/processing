class Flake {
  float x;
  float y;

  int yspeed; 
  int size;
  int col;

  Flake() {
    initialize();
  }

  void initialize() {
    this.x = random(0, width);
    this.y = random(0, height);

    this.yspeed = int(random(1, 3));
    this.size = int(random(2, 4));
    this.col = int(random(255));
  }

  void show() {
    noStroke();
    colorMode(HSB);
    fill(color(this.col,255,255));
    ellipse(this.x, this.y, this.size, this.size);
    colorMode(RGB);  
}

  void update() {
    this.y += yspeed;

    boolean variation = parseBoolean(int(random(2)));
    boolean left = parseBoolean(int(random(2)));

    if (variation) {
      if (left) {
        x += 1;
      } else {
        x -=1;
      }
    }


    if (this.y>height) {
      initialize();
      this.y = 0;
    }
  }
}