// - - - - - - - - - - - - - - - - - - - - - - - 
// endPIR
// UX/IO: UX Week 2015
// 8/26-27/15
// Scott Sullivan / Adaptive Path
// - - - - - - - - - - - - - - - - - - - - - - -

// - - - - IMPORT LIBRARIES
// imports the two external libraries we're using.

// - - - - GLOBAL VARIABLES
// gives names to all of the numbers we're going to be using.

// - - - - SETUP
// set the size of the sketch window
// set the background color to white

// make the text size 25 pixels
// make the fill color of everything a light orange
// no stroke on anything drawn
// anti-aliasing

// draw a 0 in the corner

// connect Arduino, when you first run the sketch, you will see
// a list of available ports at in the debug window, replace the "X"
// where it says "list()[X], 57600);" with the number of the port 
// that your Arduino is connected to.

// - - - - DRAW LOOP
// current move state is read from the Arduino's digital pin 2

// if the current move state is not the same as the last state, and the 
// current move state is 1, then do what's in the curly brackets.

// increase this integer by 1
// print value to the debug window
// redraw the background
// draw a circle in the center of the screen which size is connected to the moveCount variable
// draw the number of the move count in the bottom left corner

// make the last state the current state at the end of the loop

// - - - - - - - - - - - - - - - - - - - - - - - 
// LIBRARIES
// - - - - - - - - - - - - - - - - - - - - - - - 
import processing.serial.*;
import cc.arduino.*;

// - - - - - - - - - - - - - - - - - - - - - - - 
// GLOBAL VARIABLES
// - - - - - - - - - - - - - - - - - - - - - - - 
Arduino arduino;
int moveCount = -1;
int moveCurrentState = 1;
int moveLastState = 1;

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
  arduino = new Arduino(this, Arduino.list()[5], 57600);

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
    delay(2500);
  }

  moveLastState = moveCurrentState;
}

