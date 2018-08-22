class Bullet {
  PVector pos;
  PVector dir;
  PVector speed;
  int scale;

  Bullet(int x, int y, int dir, float pSpeed, int pWidth) {
    this.pos = new PVector(x, y);
    this.dir = new PVector(dir*pSpeed, 0);
    scale = pWidth;
  }

  void update() {
    this.pos.add(dir);
  }

  boolean hits(Outlaw o) {
    return !(
      this.pos.x+scale<o.pos.x ||
      this.pos.x>o.pos.x+8*scale ||
      this.pos.y+scale<o.pos.y ||
      this.pos.y+scale>o.pos.y+12*scale);
  }

  Bullet edges() {

    if (this.pos.x<2*scale) {
      this.pos.x = 2*scale;
    }

    if (this.pos.x>width-2*scale) {
      this.pos.x= width-2*scale;
    }

    if (this.pos.y<7*scale) {
      this.pos.y = 7*scale;
    }

    if (this.pos.y>height-2*scale) {
      this.pos.y = height-2*scale;
    }

    return this;
  }

  void show() {
    fill(color(0, 0, 0));
    noStroke();
    rect(this.pos.x, this.pos.y, scale, scale);
  }
}