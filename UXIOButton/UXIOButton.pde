import processing.serial.*; //imports the processing serial library

import cc.arduino.*; //imports the arduino library

Arduino arduino; //identifies Arduino

int pressCount = 0; //establishes the integer for the count times the button has been pressed
int pressActive = 0; //shows if the button (plugged in to pin two) is being pressed (1 if being pressed, 0 if not)
int pressLastState = 0; //establishes the last read state of pin two

void setup() {
  size(300, 300); //size of canvas
  textSize(25);
  fill(#FF8664); //the color of the circle
  noStroke(); //no stroke for the circle
  smooth(); //anti-alaising
  
  println(Serial.list()); //prints a list of available ports
  arduino = new Arduino(this, Arduino.list()[6], 57600); //the [#] is where the arduino is plugged in to

  for (int i = 0; i <= 13; i++) //establishes the arduino pins that the sketch is looking at (all pins under 13)
    arduino.pinMode(i, Arduino.INPUT); //establishes that the sketch is using the pins as an input
  background(255, 255, 255); //background color
  text("0", 30, 270); //displays the 0 initially
}

void draw() {
  int pressActive = arduino.digitalRead(2); //establishes the name of pin two, and is in the draw loop so it runs continuously 

  if ((pressActive != pressLastState) && (pressActive == 1)) {
    pressCount++; //increase this integer by 1
    background(255, 255, 255); //re-draw background, so the previous drawing (numbers) is erased
    ellipse(150, 150, (pressCount * 5), (pressCount * 5)); //draws a circle in the center of the canvas with the size of the count of activations (times 5)
    text(pressCount, 30, 270); //displays the number of times the sensor has been active
  }

  pressLastState = pressActive; //pin two last state is the current state (1 or 0)
}

