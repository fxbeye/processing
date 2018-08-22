SnowFlake[] flakes;
int n = 300;

void setup() {
  size(800,600);
  background(0);
  flakes = new SnowFlake[n];
  flakes[0] = new SnowFlake(true,1);
  for(int i=1; i<flakes.length; i++){
    flakes[i] = new SnowFlake(false,int(random(1,4)));
  }
  smooth();
  noStroke(); 
}


void draw(){
  background(0);
  for (int i=0;i<flakes.length; i++){
    flakes[i].show();
    flakes[i].step();
  } 
}