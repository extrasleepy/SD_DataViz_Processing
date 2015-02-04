// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;
float x, y;
float plightData;
int grow;

void setup() {
  size(800, 600);
  background(0, 55, 100);
  frameRate(30);
  table = loadTable("light.csv", "header");    //make sure to change name to match your data file
  println(table.getRowCount() + " total rows in table"); 
}

void draw() {
  background(0, 80, 100);
  beginShape();
  for (TableRow row : table.rows ()) {

    float timeData = row.getInt("Time");
    float lightData = row.getInt("Light");
    String roomData = row.getString("Room");

    timeData=map(timeData, 10, 80, 0, width);
    lightData=map(lightData, 200, 1000, height, 0);

    println(timeData, " ", lightData, " ", roomData);

    fill(255,10);
    stroke(255,255,0,100);
    strokeWeight(5);
    vertex(timeData, lightData);  //size determined by CSV data
    
    pushMatrix();
    stroke(255,100,0,100);
    strokeWeight(3);
    ellipse(timeData, lightData, (height/lightData)*grow, (height/lightData)*grow);
    popMatrix();

    if ((lightData > plightData+10) || (lightData < plightData-10)) {
      fill(255);
      textAlign(CENTER);
      textSize(20);
      text(roomData, timeData, lightData);
    }
    plightData=lightData;
  }
  
  endShape();
  
  if ((grow==0) || (grow==30)){
  grow=-grow;
  delay(1000);
  
}
grow+=1;
}

void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

