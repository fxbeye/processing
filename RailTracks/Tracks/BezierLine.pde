class TrackPart {
  int form;
  PVector pos;
  float s;
  color red = color(255, 0, 0);

  TrackPart(int pForm, float scale, float x, float y) {
    form =pForm;
    pos = new PVector(x, y);
    s = scale;
  }

  PVector getStart(){
    PVector start = pos.copy();
    
    switch(form){
      case 1: 
        start.add(0,0);
        break;
      case 2: 
        start.add(0,0);
    }
    
    return start;
  }
  
  PVector getEnd(){
    PVector end = pos.copy();
    
    switch(form){
      case 1: 
        end.add(0*s, 1*s);
        break;
      case 2:
        end.add(0.5*s, 1*s); 
        break;
    }
    
    return end;
  }

  // straight track part
  void draw1() {
    stroke(1);
    strokeWeight(3);
    bezier(0, 0, 0, 0, 0*s, 1*s, 0*s, 1*s);
  }

  // curved track part
  void draw2() {
    stroke(1);
    strokeWeight(3);
    bezier(0, 0, 0, 0, 0.5*s, 0.3*s, 0.5*s, 1*s);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    switch (form) { 
    case 1: 
      draw1();
      break;
    case 2: 
      draw2();
      break;
    default: 
      break;
    }
    
    popMatrix();

    stroke(red);
    PVector p = getStart();
    point(p.x, p.y);
    p = getEnd();
    point(p.x, p.y);

}
}