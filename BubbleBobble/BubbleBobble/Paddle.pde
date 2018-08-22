class Paddle {
  PVector pos;
  float angle;
  int l;
  int w;
  float increment = 0.2;
  Bubble currentBubble;

  PVector bubbleDir = new PVector(0, 0);

  Paddle(int x, int y, float a) {
    pos = new PVector(x, y);
    angle = a;
    l = 40;
    w = 10;
  }

  void turnLeft() {
    angle -= increment;
    if (angle<0) {
      angle = 0;
    }
  }

  void turnRight() {
    angle += increment;
    if (angle>PI) {
      angle = PI;
    }
  }

  void spawn(Bubble b) {
    currentBubble = b;
  }

  void shoot() {
    bubbleDir = PVector.fromAngle(PI/2);    
    bubbleDir.normalize();
    bubbleDir.rotate(angle);
    bubbleDir.mult(2.5);
  }

  void update() {
    currentBubble.pos.add(bubbleDir);
  }

  void render() {
    pushMatrix();

    rectMode(CENTER);
    translate(pos.x, pos.y);
    rotate(angle);
    fill(255);
    noStroke();
    rect(0, 0, l, w);


    if (currentBubble != null) {
      currentBubble.render();
    }
    
    popMatrix();
    
    PVector bDir = PVector.fromAngle(PI/2);    
    bDir.normalize();
    bDir.rotate(angle);
    bDir.rotate(PI/2);
    bDir.mult(50);
    float curx = 200;
    float cury = 200;
    stroke(color(0,0,255));
    strokeWeight(5);
    line(curx, cury, curx + bDir.x, cury+bDir.y);
    println(angle);

  }
}