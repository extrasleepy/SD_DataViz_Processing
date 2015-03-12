// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;    //table object for organizing date
float x = 0;      //variables for x and y
float y = 0;

void setup() {

  size(800, 600);
  background(0);

  table = loadTable("data.csv");    //make sure to change name to match your data file, header is optional

  println(table.getRowCount() + " total rows in table"); 

  //-----read the data-----

  for (TableRow row : table.rows ()) {
    float time = row.getFloat(0);          //define parameter = column 
    float sensor = row.getFloat(1);          //define parameter = column 

    println(time, ",", sensor);

    //-----scale the data-----

    float timeScaled = map(time, 0, 50, 100, 255); 
    float sensorScaled = map(sensor, 40, 30000, 10, 110);
    println(timeScaled, ",", sensorScaled);

    //------draw the data------  

    fill(255, timeScaled);     //fill color, transparency determined by time
    y = height/2;      //y location
    
    ellipse(x+sensorScaled/2, y, sensorScaled, sensorScaled);  //size determined by CSV data
    
    textAlign(CENTER);
    text((int)sensor, x+sensorScaled/2, y);

    x+=sensorScaled;
  }
}
