// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.
PImage img;  // Declare variable of type PImage

Table table;
float x, y;
float pSensorData;

void setup() {
  size(800, 600);
  background(255);
  img = loadImage("lightbulb.jpg");  // Load the image into the program 
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

      strokeWeight(0);
      vertex(x, y);              //point determined by CSV data
      imageMode(CENTER);

      image(img, x, y, (height/y)*(img.width/30), (height/y)*(img.height/30));
      fill(0);                                    //text color
      textAlign(RIGHT);
      textSize(20);
      text(room, x, y);
    }
    pSensorData=sensorScaled;    //saves current data to compare with next data
  }
  endShape();    //line graph ends here
  textSize(30);
  text("Room Luminosity", 300, height-50);    //Visualization Title
}

