class Brick {

  PVector pos;
  PVector dir;
  color col;
  int size;
  int state;

  Brick(int x, int y, int pSize, int fallSpeed, color c) {
    this.size = pSize;
    this.pos = new PVector(x, y);
    this.dir = new PVector(0, fallSpeed);
    col = c;
  }

  void update() {
    this.pos.add(dir);
  }

  void switchState(int newState) {
    this.state = newState;
  }

  void move(int x, int y) {
    this.pos.x += x;
    this.pos.y += y;
  }

  boolean collidesWith(Brick otherBrick) {
    return !(this.pos.x+1 + this.size-2 < otherBrick.pos.x ||
      this.pos.x+1 > otherBrick.pos.x+1 + this.size-2 ||             
      this.pos.y+1 + this.size-2 < otherBrick.pos.y ||
      this.pos.y+1 > otherBrick.pos.y+1 + this.size-2);
  }

  void draw() {
    stroke(0);
    strokeWeight(2);
    fill(col);

    if (state == 0) {
      rect(pos.x, pos.y, size, size);
    } else 
    if (state == 1) {
      rect(pos.x, pos.y, size, size/2);
      rect(pos.x, pos.y+size/2, size, size/2);
    } else 
    if (state == 2) {
      rect(pos.x, pos.y, size, size/3);
      rect(pos.x, pos.y+size/3, size, size/3);
      rect(pos.x, pos.y+2*size/3, size, size/3);
    } else 
    if (state == 3) {
      // nothing to draw
    }
  }

  String toString() {
    return pos.toString();
  }
}