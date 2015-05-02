// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;    //table object for organizing date
int row = 0;

void setup() {

  size(400, 400);
  table = loadTable("test.csv");    //make sure to change name to match your data file, header is optiona
  println(table.getRowCount() + " total rows in table");
}

void draw() {
  background(50);

  if (row>=table.getRowCount()) {        //if there is no more data return to top row
    row=0;
  }

  //-----read the data-----

  float time = table.getFloat(row, 0);          //define parameter = column 
  float sensor = table.getFloat(row, 1);          //define parameter = column 

  println(time, ",", sensor);

  //-----scale the data-----

  float timeScaled = map(time, 0, 60000, 0, 255); 
  float sensorScaled = map(sensor, 0, 1.5, 0, 255);

  println(timeScaled, ",", sensorScaled);

  //------draw the data------  
  stroke(255-timeScaled, timeScaled, 255);
  strokeWeight(10);
  fill(timeScaled, 255-timeScaled, 255, 100);     //fill color, transparency determined by time
  ellipse(width/2, height/2, sensorScaled*2, sensorScaled*2);  //size determined by CSV data

  frameRate(30);   //control timing

  row++;            //move to next row
}

