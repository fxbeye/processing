class Snake { //<>// //<>//
  PVector pos;
  PVector dir;
  PVector[] dirs = new PVector[4];

  ArrayList<PVector> tiles = new ArrayList<PVector>();

  int growBy = 1;
  int scale;
  
  Snake(int x, int y, int s) {
    initializeDirs();

    pos = new PVector(x, y);
    dir = dirs[3];
    scale = s;
    
    tiles.add(pos);

    PVector second = new PVector(x-1, y); 
    tiles.add(second);

    PVector third = new PVector(x-2, y); 
    tiles.add(third);

    //println("Initial Snake length:" + tiles.size());
  }

  void initializeDirs() {
    dirs[0] = new PVector(0, -1); 
    dirs[1] = new PVector(0, 1);
    dirs[2] = new PVector(-1, 0); 
    dirs[3] = new PVector(1, 0);
  }

  void grow() {
    PVector last = tiles.get(tiles.size()-1);
    for (int i = 0; i<growBy; i++) {
      PVector nextTile = new PVector(last.x, last.y);
      //println(last);

      tiles.add(nextTile);
    }
    growBy++;
  }

  void shrink() {
    tiles.remove(tiles.size()-1);
  }

  void move() {

    PVector curHead = tiles.get(0);
    float newX = curHead.x + dir.x;
    float newY = curHead.y + dir.y;

    PVector newHead = new PVector(newX, newY);
    tiles.add(0, newHead);

    tiles.remove(tiles.size()-1);

    edges();
  }

  boolean collidesWith(PVector pos) {
    PVector curHead = tiles.get(0);
    if (curHead.x == pos.x && curHead.y == pos.y) {
      return true;
    }
    return false;
  }

  void up() {
    dir = dirs[0];
  }

  void down() {
    dir = dirs[1];
  }

  void left() {
    dir = dirs[2];
  }

  void right() {
    dir = dirs[3];
  }

  void edges() {
    PVector curHead = tiles.get(0);

    if (curHead.x < 0) {
      curHead.x = int(width/scale)-1;
    }   

    if (curHead.x > int(width/scale)-1) {
      curHead.x = 0;
    }

    if (curHead.y < 0) {
      curHead.y = int(height/scale)-1;
    }   

    if (curHead.y > int(height/scale)-1) {
      curHead.y = 0;
    }
  }

  void draw() {
    PVector cur;

    // draw tail
    fill(color(0, 0, 255));
    for (int i=1; i<tiles.size(); i++) {    
      cur = tiles.get(i);
      float xPos = cur.x*scale+scale/2;
      float yPos = cur.y*scale+scale/2;
      float tailRadius = scale-1;
      ellipse(xPos, yPos, tailRadius, tailRadius);
    }

    // draw head
    cur = tiles.get(0);

    fill(color(255, 0, 0));
    rect(cur.x*scale+1, cur.y*scale+1, scale-2, scale-2);
  }
}