class Cell {
  int solution;
  boolean[] remaining;
  int sudokuSize;
  boolean isSolved =false;
  
  Cell(int pSudokuSize) {
    sudokuSize = pSudokuSize;
    remaining = new boolean[sudokuSize];
    for (int i=0; i<sudokuSize; i++) {
      remaining[i] = true;
    }
  }

  boolean isSolved() {
    if(isSolved) return false;
    
    int count = 0;
    for (int i=0; i<sudokuSize; i++) {
      if (remaining[i]) {
        count++;
      }
    }
    
    if(count>1){
      return false;
    }
    
    return true;
  }

  void setSolution(int pSolution) {
    isSolved = true;
    solution = pSolution;
    for (int i=0; i< sudokuSize; i++) {
      remaining[i] = false;
    }
    //println("Solution:" + pSolution);
    remaining[solution-1] = true;
  }

  void clearSolution(int pSolution) {
    remaining[pSolution-1] = false;
  }

  String toString() {
    return solution + "/" + remaining.length;
  }
}
