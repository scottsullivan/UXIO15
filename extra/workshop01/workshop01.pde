int wholeNumber = 55;
float pointNumber = 65.78;
String name = "Scott";

void setup() {
  size(600, 300);
  background(#FFFFFF);
  smooth();
}

void draw() {
  background(#FFFFFF);

  int lineLength = int(dist(mouseX, mouseY, width/2, height/2));

  fill(#FAFF00);
  noStroke();
  ellipse(width/2, height/2, lineLength*2, lineLength*2);

  stroke(#00FF01);
  line(mouseX, mouseY, width/2, height/2);
  
  fill(#FF0000);
  text(lineLength, 20, 30);
  
  rectMode(CENTER);
  noStroke();
  fill(#0028FF);
  rect(width/2, height-10, lineLength, 20);
  
  fill(#0028FF, 200);
  triangle(0, 0, width, 0, mouseX, mouseY);
}

