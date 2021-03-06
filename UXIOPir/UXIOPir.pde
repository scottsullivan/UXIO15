// - - - - - - - - - - - - - - - - - - - - - - - 
// UXIOPir
// UX/IO: UX Week 2015
// 8/26-27/15
// Scott Sullivan / Adaptive Path
// - - - - - - - - - - - - - - - - - - - - - - -


// - - - - - - - - - - - - - - - - - - - - - - - 
// LIBRARIES
// - - - - - - - - - - - - - - - - - - - - - - - 
import processing.serial.*;
import cc.arduino.*;

// - - - - - - - - - - - - - - - - - - - - - - - 
// GLOBAL VARIABLES
// - - - - - - - - - - - - - - - - - - - - - - - 
Arduino arduino;
int moveCount = 0;
int moveCurrentState = 0;
int moveLastState = 0;

// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(300, 300);
  background(255, 255, 255);

  textSize(25);
  fill(#FF8664);
  noStroke();
  smooth();

  text("0", 30, height-30); 

  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[X], 57600);

  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW LOOP
// - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  moveCurrentState = arduino.digitalRead(2);

  if ((moveCurrentState != moveLastState) && (moveCurrentState == 1)) {
    moveCount++;
      background(255, 255, 255);
    ellipse(width/2, height/2, (moveCount * 5), (moveCount * 5));
    text(moveCount, 30, 270);
  }

  moveLastState = moveCurrentState;
}

