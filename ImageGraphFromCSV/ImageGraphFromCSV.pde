// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

PImage img;  // Declare variable "a" of type PImage

Table table;
float plightData;

void setup() {
  size(800, 600);
  background(255);
  frameRate(30);
  table = loadTable("light.csv", "header");    //make sure to change name to match your data file
  println(table.getRowCount() + " total rows in table"); 

  img = loadImage("lightbulb.jpg");  // Load the image into the program 

  beginShape();
  for (TableRow row : table.rows ()) {

    float timeData = row.getInt("Time");
    float lightData = row.getInt("Light");
    String roomData = row.getString("Room");

    timeData=map(timeData, 10, 85, 0, width);
    lightData=map(lightData, 200, 1000, height, 0);

    println(timeData, " ", lightData, " ", roomData);

    noFill();
    vertex(timeData, lightData);  //size determined by CSV data
    stroke(0, 100, 0, 100);
    strokeWeight(3);


    if ((lightData > plightData+10) || (lightData < plightData-10)) {
      imageMode(CENTER);
      image(img, timeData, lightData, (height/lightData)*(img.width/25), (height/lightData)*(img.height/25));
      fill(0);
      textAlign(CENTER);
      textSize((height/lightData)*8);
      text(roomData, timeData, lightData);
    }
    plightData=lightData;
  }

  endShape();
}

void draw() {
}


