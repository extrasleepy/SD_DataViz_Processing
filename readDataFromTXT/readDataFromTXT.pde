String filename = "TEST.TXT";
String[] rawData;


void setup(){
  rawData = loadStrings(filename);
 // printArray(rawData);
 for(int i=0; i<rawData.length; i++){
   String[] thisRow = split(rawData[i], " ");
   printArray(thisRow);
 }
}


void draw(){

  
}


