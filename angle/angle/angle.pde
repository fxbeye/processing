PVector start;
PVector v0;
PVector xAxis;
boolean detStrength = false;
int strength = 1;

void setup() {
  size(800, 600);

  start = new PVector(width/2, height/2);
  xAxis = new PVector (1, 0);
  v0 = new PVector(1, 0);
}

void calcAngle() {
  float t = ((v0.dot(xAxis)) / (v0.mag() * xAxis.mag()));
  float theta = acos(t);
  //println ("t is " + t +"; Theta Radian angle: " + theta + "; Theta degress angle: " + degrees(theta));
}

void draw() {
  background(127);
  if (mouseX>0 && mouseY >0) {
    v0.x = mouseX-start.x;
    v0.y = mouseY-start.y;
    v0.normalize().mult(strength);
  }

  stroke(color(0, 0, 0));
  //line(start.x, start.y, mouseX, mouseY);

  stroke(color(255, 0, 0));
  line(start.x, start.y, start.x + xAxis.x, start.y + xAxis.y);
  line(start.x, start.y, start.x + v0.x*50, start.y + v0.y*50);

  //calcAngle();

  float t2 = ((v0.dot(xAxis)) / (v0.mag() * xAxis.mag()));
  float theta = acos(t2);

  stroke(color(0, 0, 255));
  strokeWeight(1);
  beginShape();
  for (float t=0; t<10; t+=0.05) {
    float x = v0.x * cos(theta) * t;
    float y = v0.y * sin(theta) * t  +  5 * t * t;
    vertex(start.x +x, start.y + y);
  }
  endShape();

  if (detStrength) {
    strength+=2;
    strength = constrain(strength, 0, 150);
  }

  renderStrengthIndicator();
}

void renderStrengthIndicator() {
  stroke(255);
  noFill();
  rect(8, 10, 153, 19);

  fill(255);
  noStroke();
  rect(10, 12, strength, 16);
}

void keyPressed() {
  if (keyCode == ' ') {
    detStrength = true;
  }
}

void keyReleased() {
  if (keyCode == ' ') {
    detStrength = false;
  }
}


void mousePressed() {
  if (mouseButton == LEFT) {
    detStrength = true;
  } else if (mouseButton == RIGHT) {
    strength = 0;
  } else {
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {

    detStrength = false;
  }
}