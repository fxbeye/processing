
TrackPart[] allParts = new TrackPart[10];
TrackPart[] track = new TrackPart[allParts.length];

void setup() {

  size(400, 400);
  
  PVector pos = new PVector(10,10);
  for (int i=0; i<allParts.length; i++) {  
    TrackPart part = new TrackPart(2, 18, pos.x, pos.y);
    pos = part.getEnd();
    allParts[i] = part;
  }
  
  
  for (int i=0; i<allParts.length; i++) {  
    allParts[i].draw();
  }  
  findTrack();
}

void findTrack(){
  
}

void draw() {
}