 //<>//
int gridSize = 8;
Brick currentBrick;
Brick[][] grid = new Brick[gridSize][2*gridSize];
int brickSize = 20;
color[] brickColors = new color[]{ color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};

void setup() {
  size(320, 320);
  background(0);
  frameRate(60);

  currentBrick = createNewTopBrick();
  grid[5][2*gridSize-1] = new Brick(5*brickSize, (2*gridSize-1)*brickSize, brickSize, 1, getRandomBrickColor());
  //fillGridWithRandomBricks();
}

void fillGridWithRandomBricks() {
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[0].length; j++) {
      if (random(1)>0.2) {
        Brick b = new Brick(i*brickSize, j*brickSize, brickSize, 0, getRandomBrickColor());
        b.switchState(int(random(4))) ; 
        grid[i][j] = b;
      }
    }
  }
}

Brick createNewTopBrick() {
  return new Brick(5*brickSize, 0, brickSize, 1, getRandomBrickColor());
}

color getRandomBrickColor() {
  return brickColors[int(random(brickColors.length))];
}

void checkForCollisionsWithGridBricks() {
  boolean collided = false; 

  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[0].length; j++) {
      Brick gridBrick = grid[i][j];
      if (gridBrick != null) {
        if (currentBrick.collidesWith(gridBrick)) {
          //println (currentBrick + " collides with brick at " + gridBrick);
          //println(i + ";"+ j);

          collided = true;

          grid[i][j-1] = currentBrick;
          currentBrick.dir.y = 0;
          currentBrick.pos.x = i*brickSize;
          currentBrick.pos.y = (j-1)*brickSize;

          currentBrick = createNewTopBrick();
        }
      }
      if (collided) break;
    }
    if (collided) break;
  }
}


void shiftBricksDown(int column){
  for(int i=2*gridSize-1; i>0; i--){
    grid[column][i] = grid[column][i-1];
    Brick b = grid[column][i]; 
    if(b != null){
      b.pos.y += brickSize;
    }
  }
}

void calculateBrickStates() {
  for (int i=0; i<grid.length; i++) {
    for (int j=grid[0].length-1; j>=0; j--) {
      Brick gridBrick = grid[i][j];
      if (gridBrick != null) {
        int stackSize = calculateStackSize(gridBrick, i, j);
        if(stackSize>1 && stackSize <4){
          //println(stackSize);
          gridBrick.switchState(stackSize-1);
        } else if(stackSize == 4){
          shiftBricksDown(i);
        }
      }
    }
  }
}

int calculateStackSize(Brick current, int x, int y) {
  int ss = 0;
  color currentColor = current.col;
  
  for(int i = y-1; i>=0; i--){
    Brick checkBrick = grid[x][i];
    if(checkBrick != null){
      if(checkBrick.col == currentColor){ //<>//
        ss++;
      } else {
        return ss;
      }
    } else {
      return ss;
    }
  }
  
  return ss;
  
}

void checkForGroundCollision() {
  if (currentBrick.pos.y + brickSize >= height) {

    int gridX = int(currentBrick.pos.x/brickSize); 
    int gridY = int(currentBrick.pos.y/brickSize); 

    if (gridX<0) gridX = 0;
    if (gridX>gridSize-1) gridX = gridSize-1;

    if (gridY<0) gridY = 0;
    if (gridY>2*gridSize-1) gridY = 2*gridSize-1;

    grid[gridX][gridY] = currentBrick;
    //println("ground Collision on grid tile pos:" + gridX + ";" + gridY);
    currentBrick.dir.y = 0;

    currentBrick.pos.x = gridX*brickSize;    
    currentBrick.pos.y = gridY*brickSize;

    currentBrick = createNewTopBrick();
  }
}

void draw() {
  background(0);

  // pushMatrix();
  //translate(0, height - gridSize*brickSize);
  drawGrid();

  currentBrick.update();
  currentBrick.draw();
  //popMatrix();

  checkForCollisionsWithGridBricks();
  checkForGroundCollision();
  calculateBrickStates();
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      currentBrick.move(-brickSize, 0);
      if (currentBrick.pos.x<0) currentBrick.pos.x = 0;
    } else if (keyCode == RIGHT) {
      currentBrick.move(brickSize, 0);
      if (currentBrick.pos.x>(gridSize-1)*brickSize) currentBrick.pos.x = (gridSize-1)*brickSize;
    } else if (keyCode == DOWN) {
      currentBrick.move(0, brickSize);
    }
  }
}

void drawGrid() {
  for (int i=0; i<grid.length; i++) {
    for (int j=0; j<grid[0].length; j++) {
      Brick b = grid[i][j];
      if (b != null) {
        b.draw();
      }
    }
  }
}