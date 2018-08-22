String[] input; //<>//
Cell[] grid;
int sudokuSize;

int xSize;
int ySize;

int[][] subSpaces;

boolean sudokuSolved = false;

void setup() {
  size(400, 400);
  frameRate(1);
  sudokuSize=4;

  input = new String[4];
  input[0] = "3   ";
  input[1] = "  2 ";
  input[2] = " 1  ";
  input[3] = "   2";

  xSize = input[0].length();
  ySize = input.length;

  grid = new Cell[xSize*ySize];

  for (int i=0; i< sudokuSize*sudokuSize; i++) {
    Cell cell = new Cell(sudokuSize);
    grid[i] = cell;
  }

  buildSubSpaces();

  // println(grid.length);

  int pos=-1;
  //solve(6,2);

  for (String line : input) {
    for (char c : line.toCharArray()) {
      ++pos;    
      if (c !=' ') {
        //println(pos+".:"+c+"-");
        solve(pos, int(c)-48);
      }
    }
  }
}

void buildSubSpaces() {
  subSpaces = new int[sudokuSize*sudokuSize][sudokuSize];

  //int size = int(Math.pow(sudokuSize,(1/2)));

  // 0 -> 0,1,4,5; 1->0,1,4,5; 4 -> 4,5,0,1
  // 2 -> 3,6,7

  for (int j=0; j < sudokuSize; j+=Math.sqrt(sudokuSize)) {
    for (int i=0; i < sudokuSize; i+=Math.sqrt(sudokuSize)) {

      int offset = j * sudokuSize;
      int index = i + offset;

      subSpaces[index][0] = index;
      subSpaces[index][1] = index+1;
      subSpaces[index][2] = index+sudokuSize;
      subSpaces[index][3] = index+sudokuSize+1;

      subSpaces[index+1] = subSpaces[index];
      subSpaces[index+sudokuSize] = subSpaces[index];
      subSpaces[index+sudokuSize+1] = subSpaces[index];
    }
  }
  //println(subSpaces[8]);
}

void solve(int position, int solution) {
  // set position as solved
  grid[position].setSolution(solution);

  // clear row
  int start = int(position/sudokuSize)*sudokuSize; 
  for (int i=start; i<start+sudokuSize; i++) {
    Cell c = grid[i];
    if (i!=position) {     
      c.clearSolution(solution);
    }
  }

  // clear column
  start = position%sudokuSize; 
  for (int i=start; i<sudokuSize*sudokuSize; i+=sudokuSize) {
    Cell c = grid[i];
    if (i!=position) {     
      c.clearSolution(solution);
    }
  }

  // clear quadrant 
  for (int i=0; i<sudokuSize; i++) {
    int index = subSpaces[position][i];
    Cell c = grid[index];
    if (index!=position) {
      c.clearSolution(solution);
    }
  }
}

void solveNext() {
  if (!sudokuSolved) {
    boolean newSolutionFound = false;
    for (int i=0; i<grid.length; i++) {
      Cell c = grid[i];
      if (c.isSolved()) {
        int solution = 0;
        newSolutionFound = true;
        for (int j=0; j<sudokuSize; j++) {
          if (c.remaining[j]) {
            solution = j+1;
            break;
          }
        }
        solve(i, solution);
        break;
      }
    }
    if(!newSolutionFound)
      sudokuSolved = true;
  }
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(3);
  int distx = (int)width/input[0].length();
  int disty = (int)height/input[0].length();

  for (int i=0; i<input[0].length()+1; i++) {
    line(i*distx, 0, i*distx, height);
  } 

  for (int j=0; j<input.length+1; j++) {
    line(0, j*disty, width, j*disty);
  }

  int pos=-1; 
  textAlign(CENTER);

  for (int j=0; j<input.length; j++) {
    for (int i=0; i<input[0].length(); i++) {
      Cell c = grid[++pos];   

      int xPos = (i*distx)+int(distx/2);
      int yPos = (j*disty)+int(disty/2); 
      if (c.solution > 0) {
        textSize(32);
        text(c.solution, xPos, yPos);
      } else {
        String solutions = "";
        for (int k = 0; k<c.remaining.length; k++) {
          solutions += c.remaining[k]? (k+1)+ ",":",";
        }
        textSize(14);   
        text(solutions, xPos, yPos);
      }
    }
  }
  
  if(sudokuSolved){
      text("SOLVED !!!", width/2, height/2);
  }
  
  solveNext();
}
