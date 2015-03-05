import processing.pdf.*;
boolean savePDF = false;

void setup() 
{
  size(800,600);     //determine size of PDF here
}

void draw() 
{
  if (savePDF) beginRecord(PDF, "filename.pdf");    //name your PDF here
    fill(100);
    rect(0,0,800,600);                              //backgound color will not export use a filled rect for color
    fill(0);
    ellipse(width/2,height/2,200,200);
  endRecord();
}

void keyPressed() {
  if (key=='p' || key=='P') savePDF = true;  //press p key to save PDF
}



