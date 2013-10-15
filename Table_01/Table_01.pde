
// global variables

int marginX = 100;
int marginY = 100;
Table table;
int days [];
float hours [];
float xDot [];
float yDot [];
float newX [];
float temp =0;


void setup() {
  
  size(1200, 700);
  smooth();
  noLoop();
  
  table = loadTable("Data_week4_cleanup.csv", "header");
  //println(table.getRowCount() + " toatal rows in table");

  days = new int[table.getRowCount()];
  hours = new float[table.getRowCount()];

  int i = 0;

  for (TableRow row: table.rows()) {

    days[i] = row.getInt("day");
    hours[i] = row.getFloat(" hour");

    println(days[i]+ " / " +hours[i]);
    i++;
  }
} 
  
void draw(){
  background(255);
  
  // compute dots location
  
  xDot = new float[days.length];
  yDot = new float[hours.length];
  
  
  for (int i=0; i<days.length; i++) {
    println(i);
    xDot[i] = marginX + map(i, 0, days.length-1, 0, width-marginX *2); 
    yDot[i] = height-marginY - map(hours[i], min(hours), max(hours), 0, 500);
  } 
  
  
  // connect dots with lines
  stroke(255);
  for (int i=0; i<days.length-1; i++){
    line(xDot[i], yDot[i], xDot[i+1], yDot[i+1]);
   
  }
  
  
  
    // draw dots
  noStroke();
  fill(49, 172, 151);
  for (int i=0; i<days.length; i++) {
    ellipse( xDot[i], yDot[i], 8, 8);
  } 
  
  
  // try my crazy line thing
  newX  = new float[days.length];
  
  for (int i=0; i<days.length-1; i++) {
    newX[i] = (xDot[i] +xDot[i+1])/2;
    println(newX);
    }
  
  
  stroke(155);
  for (int i=0; i<days.length-1; i++){  
  line(xDot[i], yDot[i], newX[i], height-marginY);
  line(newX[i], height-marginY, xDot[i+1], yDot[i+1]);
  }
 
  
  
  
  
  // draw annotations
  stroke(0);
  line(marginX, height-marginY, width-marginX, height-marginY);
    



  
  
}

