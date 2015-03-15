// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;    //table object for organizing date
float x = 150;      //variables for x and y
float y = 150;
float spacing = 150;


void setup() {

  size(900, 600);
  background(0,0,100);


  table = loadTable("data.csv");    //make sure to change name to match your data file, header is optional

  println(table.getRowCount() + " total rows in table"); 

  //-----read the data-----

  for (TableRow row : table.rows ()) {

    float time = row.getFloat(0);          //define parameter = column 
    float sensor = row.getFloat(1);          //define parameter = column 

    println(time, ",", sensor);

    //-----scale the data-----

    float timeScaled = map(time, 0, 50, 100, 255); 
    float sensorScaled = map(sensor, 40, 30000, 25, 200);
    println(timeScaled, ",", sensorScaled);

    //------draw the data------  

    fill(0,timeScaled,255,timeScaled);     //fill color, transparency determined by time

    rectMode(CENTER);
    rect(x, y, sensorScaled, sensorScaled);  //size determined by CSV data

    textAlign(CENTER);
    fill(255-timeScaled);
    text((int)sensor, x, y);  //printing as int to avoid decimal places
    
    x+=spacing;
    if (x>width-spacing){
      x=spacing;
      y+=spacing;
    }
  }
}

