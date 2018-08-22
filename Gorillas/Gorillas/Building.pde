class Building {
  PVector pos;
  int winw;
  int winh;
  int h;
  int w;

  Building(int pX, int pY, int pW, int pH, int pWinw, int pWinh) {
    this.pos = new PVector (pX, pY);
    h = pH;
    w = pW;
    winw = pWinw;
    winh = pWinh;
  }

  void draw() {
    // draw house
    fill(200);
    rect(pos.x, pos.y, w, h);
    
    int distw = int(winw + winw*0.4);
    int disth = int(winh + winh*0.4);
    
    // draw windows
    for (int i=0; i<int(w/distw); i++) {
      for (int j=0; j<int(h/disth); j++) {
        fill(color(255, 255, 0));
        rect(pos.x+i*distw+winw*0.4, pos.y+j*disth+winh*0.4, winw, winh);
      }
    }
  }
}