float x= random(0,450);
float y= random(0,450);
float speedX=3;
float speedY=3;



void setup() {
  size(500,500);
  smooth();
}


void draw (){
  background(0);
  x = x+speedX;
  y = y+speedY;
  if(x>450) {
    speedX = speedX *-1;
  }
  if(x<0) {
  speedX= speedX*-2; 
  }
  
  if((y>450) || (y<0)) {
    speedY = speedY *-1;
  }
  if(speedX>20){
    speedX=1; 
  }
  
  fill(255);
  rect(x,y,50,50);
}

