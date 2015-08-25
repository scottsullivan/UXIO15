// - - - - - - - - - - - - - - - - - - - - - - - 
// UXIOPot
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
float potRead = 0;

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
  background(255, 255, 255);
  potRead = arduino.analogRead(0);
  println(potRead);
  
  text(potRead, 30, 270);
}

