class Outlaw {
  PVector pos;
  int scale;
  int[][] currentShape;
  boolean inverted;
  int hits;
  float shootSpeed = 4.8;
  boolean isDead;
  int waitCounter;

  int[][] shapeNormal = new int[][]{
    {0, 0, 0, 1, 1, 0, 0, 0}, 
    {0, 0, 1, 1, 1, 1, 1, 0}, 
    {0, 0, 0, 1, 1, 1, 0, 0}, 
    {0, 0, 0, 1, 1, 0, 0, 0}, 
    {0, 1, 1, 1, 1, 1, 1, 0}, 
    {1, 0, 0, 1, 1, 0, 0, 1}, 
    {1, 0, 0, 1, 1, 0, 0, 1}, 
    {0, 1, 0, 1, 1, 0, 1, 0}, 
    {0, 0, 1, 1, 1, 1, 0, 0}, 
    {0, 1, 1, 0, 0, 1, 1, 0}, 
    {1, 1, 0, 0, 0, 0, 1, 1}};

  int[][] shapeShooting = new int[][]{
    {0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 1, 1, 0, 0, 0, 0, 0}, 
    {1, 1, 1, 1, 1, 0, 0, 0}, 
    {0, 1, 1, 1, 0, 0, 0, 0}, 
    {0, 1, 1, 0, 0, 1, 1, 1}, 
    {0, 1, 1, 1, 1, 1, 0, 0}, 
    {0, 1, 1, 0, 0, 0, 0, 0}, 
    {0, 1, 1, 0, 0, 0, 0, 0}, 
    {0, 1, 1, 1, 1, 0, 0, 0}, 
    {0, 0, 1, 0, 1, 0, 0, 0}, 
    {1, 1, 1, 0, 1, 1, 0, 0}};

  int[][] shapeDown = new int[][]{
    {0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 1, 1, 0, 0, 0, 0}, 
    {0, 1, 1, 1, 1, 1, 0, 0}, 
    {0, 0, 1, 1, 1, 0, 0, 0}, 
    {0, 0, 1, 1, 0, 0, 0, 0}, 
    {0, 1, 1, 1, 0, 0, 0, 0}, 
    {1, 0, 1, 1, 0, 0, 0, 0}, 
    {1, 0, 1, 1, 0, 0, 0, 1}, 
    {0, 1, 1, 1, 1, 1, 1, 1}};

  Outlaw(int x, int y, int pScale, boolean pInverted) {
    this.pos = new PVector(x, y);
    this.scale = pScale;
    this.inverted = pInverted;

    this.currentShape = shapeNormal;
    this.hits = 0;
    this.isDead = false;
  }

  int currentHits() {
    return hits;
  }

  void edges() {

    if (this.pos.x<2*scale) {
      this.pos.x = 2*scale;
    }

    if (this.pos.x>width-10*scale) {
      this.pos.x= width-10*scale;
    }

    if (this.pos.y<7*scale) {
      this.pos.y = 7*scale;
    }

    if (this.pos.y>height-13*scale) {
      this.pos.y = height-13*scale;
    }
  }

  void move(int x, int y) {
    this.pos.add(new PVector(x, y));
  }

  void goDown() {
    this.currentShape = shapeDown;
    hits++;
    this.isDead = true;
  }

  void goNormal() {
    this.currentShape = shapeNormal;
  }

  Bullet shoot() {
    this.currentShape = shapeShooting;
    
    int xPos = int(pos.x)+8*scale;
    int yPos = int(pos.y)+4*scale;
    
    if (inverted) {
      xPos = xPos-8*scale;
    }

    int dir = 1;
    if (inverted) {
      dir = dir * -1;
    }    

    Bullet bullet = new Bullet(xPos, yPos, dir, shootSpeed, scale);
    return bullet;
  }

  void show() {
    fill(color(255, 200, 0));
    noStroke();   

    if (isDead) {
      waitCounter++;
      if (waitCounter>60) {
        isDead = false;
        waitCounter = 0;
        currentShape = shapeNormal;
      }
    }

    for (int j=0; j<currentShape.length; j++) {
      for (int i=0; i<currentShape[0].length; i++) {
        if (currentShape[j][i] == 1) {
          
          float posX = pos.x;
          float posY = pos.y + j*scale;
          
          if (inverted) {
            posX = posX + 8*scale - i*scale;
          } else {
            posX = posX + i*scale;
          }
          
          rect(posX, posY, scale, scale);
        }
      }
    }
    
  }
}