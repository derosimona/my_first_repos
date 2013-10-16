

// global variables
int marginX = 100;
int marginY = 100;
Table table;
int days [];
float hours [];   // hours in percentage 
float info [];    // hours for info bubble
String week [];
float xDot [];    // x location of the dot
float yDot [];    // y location of the dot
float newX [];    // x location of intermediate dots (to draw crazy triangular thing)
PFont myFont;     


//-------------------------------------------------------------------`
void setup() {

  size(1200, 700);
  smooth();
//  noLoop();   //<--------- mouse interaction will not work !!!!!

  //load font in
  myFont = createFont("helvetica", 9);
  textFont(myFont);
  
  loadData();
  
  // compute dots location  
  xDot = new float[days.length];
  yDot = new float[hours.length];

  for (int i=0; i<days.length; i++) {
   // println(i);
    xDot[i] = map(i, 0, days.length-1, marginX, width-marginX); 
    yDot[i] = map(hours[i], max(hours), min(hours), marginY, height-marginY);
  } 
} 


//-------------------------------------------------------------------`



//-------------------------------------------------------------------`
void draw() {
  background(255);
  

// --------------------------------------------------------------------------------------- //
  //connect dots with lines
  //  stroke(0);
  //  for (int i=0; i<days.length-1; i++){
  //    line(xDot[i], yDot[i], xDot[i+1], yDot[i+1]);
  //   
  //  }  
// --------------------------------------------------------------------------------------- //  

  // draw dots
  noStroke();
  fill(49, 172, 151);
  for (int i=0; i<days.length; i++) {
    ellipse( xDot[i], yDot[i], 5, 5);
  } 


  // draw timeline
  stroke(0);
  line(80, height-marginY, width-marginX, height-marginY); 
  
  //write annotations
    for (int i=0; i<days.length; i++) {
      textAlign(CENTER);
      text(days[i], xDot[i], height-80);
      text(week[i], xDot[i], height-65);
    }


  // try my crazy line thing
  newX  = new float[days.length];

  //calculate intermediate dots
  for (int i=0; i<days.length-1; i++) {
    newX[i] = (xDot[i] +xDot[i+1])/2;
   // println(newX);
  }

  // connect intermediate dots with triangular lines
  strokeWeight(0.5);
  stroke(155);
  for (int i=0; i<days.length-1; i++) {  
    line(xDot[i], yDot[i], newX[i], height-marginY);
    line(newX[i], height-marginY, xDot[i+1], yDot[i+1]);
  }
 
  
  // mouse over shows info bubble 
  noStroke();
  fill(49, 172, 151, 60);
  for (int i = 0; i < days.length; i++){
     
     float distance = dist( mouseX, mouseY, xDot[i], yDot[i]);
     if (distance < 10){
         rect(mouseX, mouseY, 75,20);
         //textAlign(CENTER);
         fill(0);
         text(info[i]+ " hours", mouseX+40, mouseY+13);
     } 
  }

}
  
  
  


