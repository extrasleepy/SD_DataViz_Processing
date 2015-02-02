import processing.dxf.*;


Table table;


float variationx =0;
float variationy =0;
float variationz =0;
float a =0;

void setup() {
  size(1000, 800, P3D);
  noStroke();
  fill(204);
  background(0);

  table = loadTable("data.csv", "header");
  beginRaw(DXF, "output.dxf");
  ambientLight(20, 102, 102);
  directionalLight(126, 126, 126, 0, 0, -1);
  for (TableRow row : table.rows ()) {

    int id = row.getInt("diameter");
    String name = row.getString("name");

    println(name + " has an ID of " + id);
    //noStroke(); 
    //background(0); 
    //lights();
    //translate(100,100); 
    variationx = random(-100, 100);
    variationy = random(-100, 100);
    variationz = random(-100, 100);
    pushMatrix();
    translate((width/2)+variationx, (height/2)+variationy, variationz);
    sphere(id/200);
    popMatrix();
  }

  endRaw();
}

void draw() {
}

