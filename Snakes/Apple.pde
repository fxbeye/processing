class Fruit {
  PVector pos;
  int scale;
  PShape fruitShape;
  
  Fruit(int x, int y, int s, PShape shape) {
    pos = new PVector(x, y);
    scale = s;
    fruitShape = shape;
  }

  void newPosition() {
    this.pos.x = int(random(width/scale));
    this.pos.y = int(random(height/scale));
  }

  void newShape(PShape shape){
    fruitShape = shape;
  }
  
  void draw() {
    //fill(color(0, 255, 0));
    //noStroke();
    
    float xPos = pos.x*scale+3;//+scale*5/2; 
    float yPos = pos.y*scale+3;//+scale*5/2;
    float fruitRadius = scale;
    shape(fruitShape,xPos,yPos, scale, scale);
    //ellipse(xPos, yPos, appleRadius, appleRadius);
  }
}