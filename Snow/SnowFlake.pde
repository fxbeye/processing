class SnowFlake{

  int x;
  int y;
  int c;
  int s = 3;
  int speed;
  boolean isGreen;
  
  SnowFlake(boolean isGreen_, int speed_){
    speed = speed_;
    isGreen = isGreen_;
    initialize();
  }
  
  void initialize(){
    x = int(random(0,width));
    y = int(random(0,height));
    
    c = int(random(0,255));
    speed = int(random(1,4));    
  
  }
  
  void show(){
    
    fill(c,c,c);
    if(isGreen) {
      fill(0,255,0);
    }
    ellipse(x,y,s,s);
  }
  
  void step(){
    y += speed;
  
    if(y>=height){
      initialize();
      y = 0;  
    }
    
    int variation = int(random(0,2));
    int left = int(random(-1,1));
    
    if(variation == 1){
      if(left == 1){
        x+=variation;
      } else {
        x-=variation;
      }
    }
    
  }

}