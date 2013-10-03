float x=0;
float speed=3;
float x1 =0;
float speed1 =2.9;


void setup() {
  size(500,500);
}


void draw (){
  background(0);
  x = x+speed;
  if((x>450) || (x<0)) {
    speed = speed *-1;
  }
  
  fill(255);
  rect(x,225,50,50);
  
  x1=x1+speed1;
  if ((x1>450) || (x1<0)) {
    speed1 = speed1 *-1;
  }
  stroke(255);
  line(x1,300,x1+50,300);
 

}

