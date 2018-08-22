int c = 9;
int csqrt = int(sqrt(c));
int[][] grid = new int[c*c][];

void setup() {
  init();
  size(400,400);
  noLoop();
}

void draw(){
  //background(0);
  fill(12);
  stroke(255);
  int s = int(width/c);
  
  for(int i=0;i<c;i++){
    for(int j=0;j<c;j++){
      rect(i*s,j*s,s,s);
    }
  }
  
  for (int i=0; i<c*c; i++) {
    stroke(255/c*i,0,0);
    
    for(int j=0;j<c;j++){
      int index = grid[i][j];
      int x = int(index%c*s+random(s));
      int y = int(index/c*s+random(s));       
      point(x,y);
    }
  }
  
}

void init(){
  for (int i=0; i<c*c; i++) {

    int[] inner = new int[c];
    
    if (i%csqrt==0) {
      
      for (int j=0; j<csqrt; j++) {
        for (int k=0; k<csqrt; k++) {
          
          int value = j+k*c;
          
          if (i%c>=csqrt) {
            value += i%c;
          }
          
          if(i>=csqrt*c){
            value += csqrt*c;
          }
          
          inner[j*csqrt+k] = value;
        }
      }
      
    } else {
      inner = grid[int((i/csqrt)*csqrt)];
    }
    
    grid[i] = inner;
  }

  for (int i=0; i<c*c; i++) {
    grid[i] = sort(grid[i]);
    println("["+i+"]: " + pa(grid[i]));
  }

}

String pa(int[] a) {
  if (a.length== 0) 
    return "";

  String result = "";
  for (int i=0; i<a.length-1; i++) {
    result += a[i]+",";
  }
  result += a[a.length-1];

  return result;
}