Snake snake;
boolean paused;
Grid grid;
Fruit[] fruits;
int points = 0;
int noFruits = 16;
int scale = 20;
PShape[] fruitShapes = new PShape[3];

void setup() {
  size(600, 600);
  
  grid = new Grid(scale);
  snake = new Snake(10, 10, scale);
  
  fruits = new Fruit[noFruits];
  
  fruitShapes[0] = loadShape("apple.svg");
  fruitShapes[1] = loadShape("banana.svg");
  fruitShapes[2] = loadShape("grape.svg");

  for (int i= 0; i<fruits.length; i++) {
    fruits[i] = new Fruit(0,0, scale, fruitShapes[int(random(fruitShapes.length))]);
    fruits[i].newPosition();
  }

  frameRate(10);
  paused = false;
}

void draw() {
  background(100);
  //grid.draw();

  if (!paused) {
    snake.move();
  }

  snake.draw();

  for (int i=0; i < fruits.length; i++ ) {
    if (snake.collidesWith(fruits[i].pos)) {
      points += 10;
      snake.grow();
      fruits[i].newPosition();
      fruits[i].newShape(fruitShapes[int(random(fruitShapes.length))]);
    }

    fruits[i].draw();
  }

  fill(255);
  textSize(20);
  text(points, 10, 50);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      snake.up();
    } else if (keyCode == DOWN) {
      snake.down();
    } else if (keyCode == LEFT) {
      snake.left();
    } else if (keyCode == RIGHT) {
      snake.right();
    }
  } else if (key == '+') {
    snake.grow();
  } else if (key == '-') {
    snake.shrink();
  } else if (key == 'm') {
    snake.move();
  } else if (key == 'p') {
    paused = !paused;
    //println("Paused=" + paused);
  }
}