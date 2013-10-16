

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
float speed = 1;


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
    yDot[i] = map(hours[i], max(hours), min(hours), height-marginY, 0);
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
  if (speed<=600){
    speed+=1;
  }

  for (int i=0; i<days.length; i++) {
    float h = abs(yDot[i]-600);
    rect( xDot[i], 0, 6, speed-yDot[i]);
  } 
  



  // draw timeline
  stroke(0);
  line(80, height-marginY, 1120, height-marginY); 

  //write annotations
  for (int i=0; i<days.length; i++) {
    textAlign(CENTER);
    text(days[i], xDot[i], height-80);
    text(week[i], xDot[i], height-65);
  }


  // mouse over shows info bubble 
  noStroke();
  fill(49, 172, 151, 60);
  for (int i = 0; i < days.length; i++) {

    float distance = dist( mouseX, mouseY, xDot[i], yDot[i]);
    if (distance < 10) {
      rect(mouseX, mouseY, 75, 20);
      //textAlign(CENTER);
      fill(0);
      text(info[i]+ " hours", mouseX+40, mouseY+13);
    }
  }
}




