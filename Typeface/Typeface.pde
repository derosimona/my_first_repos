PFont font;
float x=320 ;
float y=100;
float speed=0.7;


void setup(){
  size(640,350);
  smooth();
  //background(0);
}

void draw() {
  background(0);

  fill(255);
  font = loadFont("Abel-Regular-48.vlw");
  textFont(font, 50);
  text("S", 320, 175);
  //text("I", 345, 175);
  
  y = y-speed;
  fill(0);
  noStroke();
  rect(310,y,60,80);

  
  }
