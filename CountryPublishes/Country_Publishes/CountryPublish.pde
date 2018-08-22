class CountryPublish {
  String countryName;
  int no_publishes;
  int week;

  CountryPublish(String pCountryName, int pWeek, int pNoPublishes) {
    this.countryName = pCountryName; 
    this.week = pWeek;
    this.no_publishes = pNoPublishes;
  }

  boolean show(int offset, int maxPublishes, int currentWeek) {
    if (week == currentWeek) {
      stroke(255);

      text(countryName, 10, offset + 4);
      text(no_publishes, 30, offset + 4);

      strokeWeight(3);
      int end = no_publishes/maxPublishes * width;
      if (end>0) {
        line(50, offset, 50+end-60, offset);
      }
      return true;
    }
    
    return false;
  }
}