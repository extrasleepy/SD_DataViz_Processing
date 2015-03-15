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

void setup() {
  size(1200, 600);
  background(30);
  frameRate(30);
  smooth();
  textSize(25);
 
 for (int i=0; i<400 ; i+=30){
  fill(i,i,255);
  text(articles[(int)random(articles.length)]+" "+
  nouns[(int)random(nouns.length)]+" "+
  action[(int)random(action.length)]+" "+
  verb[(int)random(verb.length)]+" "+
  location[(int)random(location.length)]+" "+
  articles[(int)random(articles.length)]+" "+
  nouns2[(int)random(nouns2.length)]+" "+
  frequency[(int)random(frequency.length)]+" "+
  punctuation[(int)random(punctuation.length)]
  ,10, 100 + i, 100);
  }
}

