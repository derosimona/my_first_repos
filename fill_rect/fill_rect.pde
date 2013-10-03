//float x=255;
//float y=205;
float speed=0;


void setup() {
  size (500,500);
  smooth();
 
}

void draw(){
  background(0);
  //x= x+speed;
  //y= y-speed;
  fill(255);
  //rectMode(CENTER);
  if (speed<=80) {
    speed+=1;
  }
  rect(200,280,120,0-speed);
  //fill(0);
  //rect(x,y,100,100);
  
}
