class Grid {
  int size;

  Grid(int gridSize) {
    size =gridSize;
  }

  void draw() {
    stroke(50);

    //vertical lines
    for (int i=0; i<width; i+=size) {
      line(i, 0, i, height);
    }

    // horizontal lines
    for (int i=0; i<height; i+=size) {
      line(0, i, width, i);
    }
  }
}