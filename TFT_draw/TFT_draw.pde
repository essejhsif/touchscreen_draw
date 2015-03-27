/*****************************************************
 * Jesse Fish
 * March 2015
 * Processing sketch that listens on serial port for 
 * x,y position from TFT touchscreen for Arduino.
 *****************************************************/

import processing.serial.*;

Serial fd;

float x = 0;
float y = 0;

void setup () 
{
  size(640, 360, P3D); 
  //Connect to the corresponding serial port
  fd = new Serial(this, Serial.list()[2], 9600);
  // Defer callback until new line
  fd.bufferUntil('\n');
  background(1);
}

void draw () 
{
  noStroke();
  if(x != Float.NaN && y != Float.NaN){  
    ellipse(x,y,10,10);
  }
}

void serialEvent (Serial fd) 
{
  // get the ASCII string:
  String rpstr = fd.readStringUntil('\n');
  try{
    if (rpstr != null) {
      String[] list = split(rpstr.toString(), ':');
      x = float(list[0]);
      y = float(list[1]);
    }
  }
  catch (Exception e){
  }
}
