// - - - - - - - - - - - - - - - - - - - - - - - 
// UXIOBlink
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

int pressActive = 0;

// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(300, 300);
  textSize(25);
  fill(#FF8664);
  noStroke();
  smooth(); 
  
  println(Serial.list());
  arduino = new Arduino(this, Arduino.list()[5], 57600);

  for (int i = 0; i <= 13; i++) 
    arduino.pinMode(i, Arduino.INPUT);
  background(255, 255, 255);
}

// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW LOOP
// - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  int pressActive = arduino.digitalRead(2); 

  if ((pressActive == 1) { 
    text("PRESSED!", width/2, height/2);
  }

}

