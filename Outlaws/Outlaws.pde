int w = 10;
Outlaw outlaw;    
Bullet myBullet;

Outlaw enemy;
Bullet enemyBullet;

SoundFX fx;

void setup() {
  size(600, 400);
  outlaw = new Outlaw(60, 80, w, false);
  enemy  = new Outlaw(420, 80, w, true);
  
  fx = new SoundFX(this);
  //frameRate(12);
}

void draw() {
  background(color(100, 100, 255));

  drawFrame();
  drawScore();

  drawOutlaw();
  drawEnemy();
}

void keyPressed() {

  // Player moves
  if (key == CODED) {
    if (keyCode == UP) {
      outlaw.move(0, -5);
      fx.walk();
    } else if (keyCode == DOWN) {
      outlaw.move(0, 5);
      fx.walk();  
  } else if (keyCode == LEFT) {
      outlaw.move(-5, 0);
      fx.walk();
    } else if (keyCode == RIGHT) {
      outlaw.move(5, 0);
      fx.walk();
    }
  } else if (key == ' ') {
    myBullet = outlaw.shoot();
    fx.shoot();
  } else if (key == 'd') {
    outlaw.goDown();
  }
 
  // Enemy moves
  if (key == 'w') {
    enemy.move(0, -5);
  } else if (key == 's') {
    enemy.move(0, 5);  
  } else if (key == 'a') {
    enemy.move(-5, 0);
  } else if (key == 'd') {
    enemy.move(5, 0);
  } else if (key == 'f') {
    enemyBullet = enemy.shoot();
  }
}

void drawFrame() {
  noStroke();
  fill(color(0, 0, 200));

  for (int i=w; i<=width-2*w; i+=w) {
    rect(i, 6*w, w, w);
    rect(i, height-2*w, w, w);
  }

  for (int j=6*w; j< height-2*w; j+=w) {
    rect(w, j, w, w);
    rect(width-2*w, j, w, w);
  }
}

void drawScore() {
  text(outlaw.currentHits(), 30, 10);
  text(enemy.currentHits(), width-40, 10);
}

void drawOutlaw() {
  outlaw.edges();
  outlaw.show();

  if (myBullet != null) {
    myBullet.update();

    Bullet myNewBullet = myBullet.edges();    
    myBullet.show();    

    if (myBullet.hits(enemy)) {
      enemy.goDown();
      fx.hit();
      //println("enemy hit");
      myBullet = null;
      outlaw.goNormal();
    } else {
      myBullet = myNewBullet;
    }
  }
}

void drawEnemy() {
  enemy.edges();
  enemy.show();

  if (enemyBullet != null) {
    enemyBullet.update();
    Bullet enemyNewBullet = enemyBullet.edges();

    enemyBullet.show();
    if (enemyBullet.hits(outlaw)) {
      outlaw.goDown();
      fx.hit();
      //println("outlaw hit");
      enemyBullet = null;
      enemy.goNormal();
    } else {
      enemyBullet = enemyNewBullet;
    }
  }
}