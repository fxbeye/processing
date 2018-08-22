boolean[] keys;

void setup() {
  size(400,400);
  keys = new boolean[5];

  for (int i=0; i< keys.length; i++) {
    keys[i] = false;
  }

  background(0);
}

void keyPressed() {
  boolean active = true;
  if (key == CODED) {
    if (keyCode == UP) {
      keys[0] = active;
    } else if (keyCode == DOWN) {
      keys[1] = active;
    } else if (keyCode == LEFT) {
      keys[2] = active;
    } else if (keyCode == RIGHT) {
      keys[3] = active;
    }
  } else if (key == ' ') {
    keys[4] = active;
  }
}

void keyReleased() {
  boolean active = false;
  if (key == CODED) {
    if (keyCode == UP) {
      keys[0] = active;
    } else if (keyCode == DOWN) {
      keys[1] = active;
    } else if (keyCode == LEFT) {
      keys[2] = active;
    } else if (keyCode == RIGHT) {
      keys[3] = active;
    }
  } else if (key == ' ') {
    keys[4] = active;
  }
}

void draw() {
  background(0);
  pushMatrix();
  stroke(255);
  strokeWeight(4);
  translate(width/2,height/2);
  int l = 100;
  
  if(keys[4]){
    stroke(color(255,0,0));
    ellipse(0,0,50,50);
    l *= 1.5;
  }

  if (keys[0]) {
    line(0, 0, 0, -l);
  }

  if (keys[1]) {
    line(0, 0, 0, l);
  }

  if (keys[2]) {
    line(0, 0, -l, 0);
  }

  if (keys[3]) {
    line(0, 0, l, 0);
  }
  
  popMatrix();
}