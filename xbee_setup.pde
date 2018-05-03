import processing.serial.*;

Serial myPort;
float val;
String portName;


void setup(){
  printArray(Serial.list());
  portName = Serial.list()[7];
  println(portName);
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
}

void draw(){
  background(0, 0, val*2);
}

void serialEvent(Serial port){
  val = float(port.readStringUntil('\n'));
  println(val);
}


  