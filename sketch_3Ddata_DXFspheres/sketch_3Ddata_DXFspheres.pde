import processing.dxf.*;


Table table;


float x =0;
float y =0;
float z =0;

void setup() {
  size(1000, 800, P3D);
  noStroke();
  fill(204,120);
  background(0);

  table = loadTable("data.csv", "header");
  beginRaw(DXF, "output.dxf");
  ambientLight(20, 102, 102);
  directionalLight(126, 126, 126, 0, 0, -1);
  
  for (TableRow row : table.rows ()) {

    int id = row.getInt("diameter");
    String name = row.getString("name");

    println(name + " has an ID of " + id);

    x = randomGaussian();
    y = randomGaussian();
    z = randomGaussian();

    float sd = 60;                // Define a standard deviation
    float meanX = width/2;         // Define a mean value (middle of the screen along the x-axis)
    float meanY = height/2;         // Define a mean value (middle of the screen along the y-axis)
    float meanZ = 50;         // Define a mean value (middle of the screen along the z-axis)

    x = ( x * sd ) + meanX;  // Scale the gaussian random number by standard deviation and mean
    y = ( y * sd ) + meanY;  // Scale the gaussian random number by standard deviation and mean
    z = ( z * sd ) + meanZ;  // Scale the gaussian random number by standard deviation and mean


    pushMatrix();
    translate(x, y, z);
    rotateX(-0.5);
    rotateY(1);
    sphere(id/200);
    popMatrix();
  }

  endRaw();
}

void draw() {
}
