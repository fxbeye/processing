class Bubble {
  PVector pos;
  color col;
  int r;

  Bubble(int x, int y, color c) {
    this.pos = new PVector(x, y);
    this.col = c;
    this.r = 20;
  }

  void render() {
    fill(col);
    stroke(red(col),green(col),blue(col),255);
    ellipse(pos.x, pos.y, r, r);
  }
}