int cellSize = 50;
int rows = width;
int cols = height;
float [] lightArray = new float[50] ;
float i=0;


Table table;



void setup() {
  size(800, 600);
  background(0);

  table = loadTable("light.csv", "header");    //make sure to change name to match your data file
  println(table.getRowCount() + " total rows in table"); 

  rows = width;
  cols = height;

  for (TableRow row : table.rows ()) {
    i++;
    float timeData = row.getInt("Time");
    float lightData = row.getInt("Light");
    String roomData = row.getString("Room");

    lightData=map(lightData, 200, 1000, 0, 255);
    lightArray[i]=lightData;
    println(timeData, " ", lightData, " ", roomData);
  }

  for (int j = 0; j<cols; j+=cellSize) {
    for (int i = 0; i<rows; i+=cellSize) {
      fill(random(100));
      rect(i, j, cellSize, cellSize);
    }
  }
}

//not using draw in this sketch
void draw() {
}

