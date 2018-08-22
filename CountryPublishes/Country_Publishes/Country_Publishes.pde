
PFont font;
CountryPublish[] publishes;
int max;
int currentWeek;

void setup() {
  size(800, 1000);
  font = loadFont("arial.vlw");
  textFont(font, 10);
  loadData();
  max = 0;  

  currentWeek = 29;

  for (int i=0; i<publishes.length; i++) {
    if (publishes[i].no_publishes > max) {
      if (publishes[i].week == currentWeek) {
        max = publishes[i].no_publishes;
      }
    }
  }
}

void draw() {
  int offset = 10;
  for (int i=0; i<publishes.length; i++) {
    if (publishes[i].show(offset, max, currentWeek)) {
      offset+=10;
    }
  }
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  Table table = loadTable("publishes_by_country.csv", "header, csv");

  // The size of the array of Bubble objects is determined by the total number of rows in the CSV
  publishes = new CountryPublish[table.getRowCount()]; 

  int rowCount = 0;
  for (TableRow row : table.rows()) {
    String country = row.getString("country_id");
    int w = row.getInt("week");
    int p = row.getInt("no_publishes");

    publishes[rowCount] = new CountryPublish(country, w, p);
    rowCount++;
  }
}