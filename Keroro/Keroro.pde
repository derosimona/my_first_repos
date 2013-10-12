
void setup() {
  size(600,600);
}

void draw(){
  background(175);
  
  println(mouseX + "," + mouseY);
  
  //face shape
  
  stroke(0);
  fill(120,186,88);
  ellipseMode(CENTER);
  ellipse(300,300,500,500);
  
  //eyes
  strokeWeight(5);
  stroke(0);
  fill(255);
  ellipse(200,125,150,150);
  ellipse(400,125,150,150);

  //eyeball
  float x1 = map(mouseX, 0, width, 160, 240);
  float x2 = map(mouseX, 0, width, 360, 440);
  float y1 = map(mouseY, 0, height, 90, 160); 
  
  ellipseMode(CENTER);
  fill(0);
  ellipse(x1,y1,70,70);
  ellipse(x2,y1,70,70);
  
  //tongue
  
  fill(240,139,151);
  arc(300, 400, mouseX, 200, 0, PI, CHORD);
  
  
  
}
