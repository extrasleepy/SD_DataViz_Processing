// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;
float x, y;
float pSensorData;

void setup() {
  size(800, 600);
  background(0, 20, 100);

  table = loadTable("light.csv");
  println(table.getRowCount() + " total rows in table"); 

  beginShape();    //line graph starts here

    for (TableRow row : table.rows ()) {

    float time = row.getFloat(0);            //define parameter = column 
    float sensor = row.getFloat(1);          //define parameter = column
    String room = row.getString(2);          //define parameter = column  

    float timeScaled=map(time, 7, 80, 0, width);
    float sensorScaled=map(sensor, 200, 1000, height, 0);

    println(time, " ", sensor, " ", room);
    noFill();

    if ((sensorScaled > pSensorData+40) || (sensorScaled < pSensorData-40)) {   //keeps data from being redundant
      x=timeScaled;
      y=sensorScaled;

      stroke(255, 100, 0, 255);
      strokeWeight(2);
      
      vertex(x, y);              //point determined by CSV data
      fill(0, 10, 80);                              //ellipse fill color
      ellipse(x, y, 100, 100);  //ellipse for visual effect
      fill(255);                                    //text color
      textAlign(CENTER);
      textSize(20);
      text(room, x, y);
    }
    pSensorData=sensorScaled;    //saves current data to compare with next data
  }
  endShape();    //line graph ends here
  textSize(30);
  text("Room Luminosity", 200, height-50);    //Visualization Title
}

