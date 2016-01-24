// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;    //table object for organizing date
float x = 0;      //variables for x and y
float y = 0;
float radius = 250;
float angle = 0;

void setup() {

  size(800, 800);
  background(50);
  translate(width/2, height/2);


  table = loadTable("data.csv");    //make sure to change name to match your data file, header is optional
  angle = TWO_PI/(table.getRowCount());   //set rotation angle, TW0_PI is a full circle

  println(table.getRowCount() + " total rows in table"); 



  //-----read the data-----

  for (TableRow row : table.rows ()) {

    float time = row.getFloat(0);          //define parameter = column 
    float sensor = row.getFloat(1);          //define parameter = column 

    println(time, ",", sensor);

    //-----scale the data-----

    float timeScaled = map(time, 0, 50, 0, 255); 
    float sensorScaled = map(sensor, 40, 30000, 10, 110);
    println(timeScaled, ",", sensorScaled);

    //------draw the data------  

    fill(255, timeScaled);     //fill color, transparency determined by time

    ellipse(x-radius, y, sensorScaled, sensorScaled);  //size determined by CSV data

    fill(255, 255);
    textAlign(CENTER);
    text((int)sensor, x-radius, y);  //printing as int to avoid decimal places

    rotate(angle);
  }
}