// - - - - - - - - - - - - - - - - - - - - - - - 
// UXIOBlink2
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
int ledPin = 13;
int ledPinTwo = 2;

// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(300, 300);
  background(255, 255, 255);

  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[5], 57600);

  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
}

// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW LOOP
// - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  background(255, 255, 255);
  arduino.digitalWrite(ledPin, Arduino.HIGH);
  arduino.digitalWrite(ledPin2, Arduino.LOW);
  delay(500);
  arduino.digitalWrite(ledPin, Arduino.LOW);
  arduino.digitalWrite(ledPin2, Arduino.HIGH);
  delay(1000);
}
