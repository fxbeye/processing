boolean[] blids = new boolean[4];

int max = 225;
int normal = 60;
int maxLength = 4;

int[] gameOrder;
int[] trackPlayerOrder;
int currentPlayerPosition;

int currentLength;
int currentPosition;

int shownFrames;
int pauseFrames;
boolean isPaused; 

boolean computerShowOrder = false;

void setup() {
  size(400, 400);
  background(0);
  frameRate(30);

  for (int i=0; i<blids.length; i++) {
    blids[i] = false;
  }
  initializeGame();
}

void resetPlayerOrder() {
  for (int i=0; i<gameOrder.length; i++) {
    trackPlayerOrder[i] = -1;
  }
  currentPlayerPosition =0;
}

void shuffleOrder() {  
  for (int i=0; i<gameOrder.length; i++) {
    int number = int(random(1, 4));
    gameOrder[i] = number;
    trackPlayerOrder[i] = -1;
  }
}

void initializeGame() {
  gameOrder = new int[maxLength];
  trackPlayerOrder = new int[maxLength];

  shuffleOrder();

  currentLength = maxLength;
  currentPosition = 0;
  shownFrames = 0;
  pauseFrames=0;
  currentPlayerPosition = 0;
}

void keyPressed() {
  if (key == CODED) {
    boolean val = true;
    if (keyCode == UP) {
      blids[0] = val;
    } else if (keyCode == DOWN) {
      blids[2] = val;
    } else if (keyCode == RIGHT) {
      blids[1] = val;
    } else if (keyCode == LEFT) {
      blids[3] = val;
    }
  } else if (key== ' ') {
    resetPlayerOrder();
    computerShowOrder = true;
  } else if (key=='s') {
    resetPlayerOrder();
    shuffleOrder();
  }
}

void keyReleased() {
  if (key == CODED) {
    boolean val = false;
    if (keyCode == UP) {
      blids[0] = val;
      trackPlayerOrder[currentPlayerPosition] = 0;
    } else if (keyCode == DOWN) {
      blids[2] = val;
      trackPlayerOrder[currentPlayerPosition] = 2;
    } else if (keyCode == RIGHT) {
      blids[1] = val;
      trackPlayerOrder[currentPlayerPosition] = 1;
    } else if (keyCode == LEFT) {
      blids[3] = val;
      trackPlayerOrder[currentPlayerPosition] = 3;
    }
    currentPlayerPosition++;
    currentPlayerPosition = min(maxLength-1, currentPlayerPosition);
  }
}

String getGameOrder(){
  String playerInput ="";
  for (int i=0; i<gameOrder.length; i++) {
    if (gameOrder[i]!=-1) {
      playerInput += gameOrder[i];
    }
    playerInput += "-";
  }
  return playerInput;
}

void printGameOrder() {
  textSize(12);
  text(getGameOrder(), width/2-5, 32);
}

String getPlayerOrder(){
  String playerInput ="";
  for (int i=0; i<=currentPlayerPosition; i++) {
    if (trackPlayerOrder[i]!=-1) {
      playerInput += trackPlayerOrder[i];
    }
    playerInput += "-";
  }
  return playerInput;

}

void printPlayerOrder() {
  textSize(12);
  text(getPlayerOrder(), width/2-5, height-32);
}

void printBlids() {
  noStroke();
  int centerX=width/2;
  int centerY=height/2;

  fill(blids[0]?max:normal, 0, 0);
  triangle(0, 0, width, 0, centerX, centerY);

  fill(0, blids[3]?max:normal, 0);
  triangle(0, 0, 0, height, centerX, centerY);

  fill(0, 0, blids[1]?max:normal);
  triangle(width, 0, width, height, centerX, centerY);

  fill(blids[2]?max:normal, blids[2]?max:normal, 0);
  triangle(0, height, width, height, centerX, centerY);
}

void printDebugInfo() {
  fill(255);
  textSize(32);
  text(currentLength, width/2-5, height/2+10);

  String gameOrder = getGameOrder();
  printGameOrder();
  
  String playerOrder = getPlayerOrder();
  printPlayerOrder();
  
  checkForWinSituation(gameOrder,playerOrder);
}

void checkForWinSituation(String gameOrder, String playerOrder){
  if(gameOrder.length() != playerOrder.length()) {
    return;
  }
  
  if(gameOrder.equals(playerOrder)){
    textSize(12);
    text("WIN", width/2-5, height/2-32);  
  }
}

void draw() {
  background(0);

  printBlids();

  printDebugInfo();

  if (computerShowOrder) {

    if (!isPaused) {
      shownFrames++;
      blids[gameOrder[currentPosition]] = true;
    } else {
      pauseFrames++;
    }

    if (!isPaused && shownFrames == 20) {
      blids[gameOrder[currentPosition]] = false;
      shownFrames = 0;

      isPaused=!isPaused;

      if (currentPosition+1<currentLength) {
        currentPosition++;
      } else {
        currentPosition = 0;
        shownFrames=0;
        computerShowOrder = false;
      }
    } else {
      if (pauseFrames==10) {
        pauseFrames=0;
        isPaused =!isPaused;
      }
    }
  }
}
