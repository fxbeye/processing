Building[] city = new Building[8];

void setup() {
  size(800, 600);
  generateCity();
}

void generateCity(){
  
  for (int i=0; i<city.length; i++) {
    if(i==0){
      int h = int(random(100,400));
      int w = int(random(50, 200));
      city[i] = new Building(0, height-h, w, h, int(w/random(5,10)),int(h/random(5,10)));
    } else if(i<city.length-1) {
      Building lastBuilding = city[i-1];
      
      int newh = int(random(100, 400));
      int neww = int(random(50, 200));
      city[i] = new Building(int(lastBuilding.pos.x + lastBuilding.w), height-newh, neww, newh, int(neww/random(5,10)),int(newh/random(5,10)));    
    } else {
      Building lastBuilding = city[i-1];
      
      int newh = int(random(100, 400));
      int neww = int(width-lastBuilding.pos.x);
      city[i] = new Building(int(lastBuilding.pos.x + lastBuilding.w), height-newh, neww, newh, 5 ,10);        
    }
    
    city[i].draw();
  }
}

void draw() {
background(0);
  for (int i=0; i<city.length; i++) {
    city[i].draw();
  }
}