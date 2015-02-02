// The following short CSV file is parsed 
// in the code below. It must be in the project's "data" folder.

Table table;
float x,y;

void setup() {
  
  size(800, 600);
  background(0,55,100);
  
  table = loadTable("data.csv", "header");    //make sure to change name to match your data file

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    int data = row.getInt("diameter");
    String name = row.getString("name");
    
    println(data);
    
    fill(random(255),255,0,100);
    x = random(50,width-50);       //random x location
    y = random(50,height-50);      //random y location
    ellipse(x,y,data/70,data/70);  //size determined by CSV data
    textAlign(CENTER);
    text(data,x,y);
  }
  
}

