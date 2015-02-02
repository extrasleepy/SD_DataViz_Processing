int[] data;
float x=0;
float movement=10;
float increment =1;

void setup() {
  size(1150, 400);
  background(0);
}

void draw() {
  // The text from the file is loaded into an array. 
  String[] stuff = loadStrings("data.txt");
  // This array has one element because the file only has one line. 
  // Convert String into an array of integers using ',' as a delimiter
  data = int(split(stuff[0], ',' ));
  for (int i = 0; i < data.length; i ++ ) {
    // The array of ints is used to set the color and height of each ellipse.

    fill(data[i], 255, data[i]*2); 
    ellipse(x+(data[i]/2), (height/2), data[i], data[i]);
    fill(0);
    textAlign(CENTER);
    text(data[i], x+(data[i]/2), height/2);

    x+=data[i];
  }
}



