String[] articles = {
  "a", "the", "some", "more than one", "exactly one", "a quantity of"
}; 
String[] location = {
  "inside", "close to", "with", "beside", "near", "far from", "at", "above", "around"
};
String[] nouns = {
  "dog", "cat", "hamster", "toad", "woman", "man", "rat", "elephant", "police", "teacher", "American"
};
String[] nouns2 = {
  "goat", "fish", "shark", "bird", "child", "baby", "snake", "yak", "llama", "clam", "slug"
};
String[] verb = {
  "eat", "nibble", "play", "lounge", "complain", "love", "snuggle", "sing", "dance", "howl", "cry", "faint", "bleed"
};
String[] action = {
  "can", "did", "will", "might", "may", "can't", "didn't", "will never", "could"
};
String[] frequency = {
  "on Friday", "sometimes", "never", "way too often", "on occasion", "if the timing is right", "on Wednesday", "in October", "at 5:30pm"
};

String[] punctuation = {
  "?", "!", "!!!", "."
};

Table table;
float ptime;

void setup() {
  table = loadTable("light.csv");    //make sure to change name to match your data file
  println(table.getRowCount() + " total rows in table"); 

  size(1200, 600);
  background(30);
  textSize(25);

  for (TableRow row : table.rows ()) {
    float time = row.getFloat(0);
    float sensor = row.getFloat(1);

    println(time, " ", sensor);

    if ((time > ptime+5) || (time < ptime-5)) {
      fill(150, time*4, 255);
      text(articles[(int)map(sensor, 200, 1000, 0, articles.length)]+" "+
        nouns[(int)map(sensor, 200, 1000, 0, nouns.length)]+" "+
        action[(int)map(sensor, 200, 1000, 0, action.length)]+" "+
        verb[(int)map(sensor, 200, 1000, 0, verb.length)]+" "+
        location[(int)map(sensor, 200, 1000, 0, location.length)]+" "+
        articles[(int)map(sensor, 200, 1000, 0, articles.length)]+" "+
        nouns2[(int)map(sensor, 200, 1000, 0, nouns2.length)]+" "+
        frequency[(int)map(sensor, 200, 1000, 0, frequency.length)]+" "+
        punctuation[(int)map(sensor, 200, 1000, 0, punctuation.length)], 
      10, time*5);
    }
    ptime=time;
  }
}


