import processing.sound.*;

class SoundFX{
SoundFile[] files = new SoundFile[3];

  SoundFX(PApplet applet){
    files[0] = new SoundFile(applet, "hit.mp3");
    files[1] = new SoundFile(applet, "shoot.mp3");
    files[2] = new SoundFile(applet, "walk.mp3");
  }
  
  void hit(){
    files[0].play();
  }
  
  void shoot(){
    files[1].play();
  }
  
  void walk(){
    files[2].loop();
  }
  
}