import processing.serial.*;
Serial myPort;
float[] vals; //sensor values
String portName;

int count = 0; //# nothing has been drawn

PImage hillImgs[] = new PImage[20]; //hill frames
Hill hillObj = new Hill(); 
float hillVal; //hill sensor input
boolean hillActive = false; 
PImage horseImgs[] = new PImage[26]; //horse frames
Horse horseObj = new Horse();
float horseVal; //horse sensor input
boolean horseActive = false;
PImage negativeImgs[] = new PImage[18]; //negative frames
Negative negativeObj = new Negative();
boolean negativeActive = false;
PImage lineImgs[] = new PImage[29]; //line frames
Line lineObj = new Line();
float lineVal; //line sensor input
boolean lineActive = false;
PImage treeImgs[] = new PImage[10]; //tree frames
Tree treeObj = new Tree();
float treeVal; //tree sensor input
PImage mirrorImgs[] = new PImage[15]; //mirror frames
Mirror mirrorObj = new Mirror();
float mirrorVal; //mirror sensor input
boolean mirrorActive = false;
PImage socksImgs[] = new PImage[26]; //sock frames
Socks socksObj = new Socks();
float socksVal; //socks sensor input
boolean socksActive = false;
PImage roseImgs[] = new PImage[11]; //rose frames
Rose roseObj = new Rose();
float roseVal; //rose sensor input
boolean roseActive = false;
PImage lightsImgs[] = new PImage[15]; //light frams
Lights lightsObj = new Lights();
float lightsVal; //lights sensor input
boolean lightsActive = false;
PImage starsImgs[] = new PImage[2]; //star frames
Stars starsObj = new Stars();
float starsVal; //stars sensor input

int imgXloc = 300;
int imgYloc = 200;
int imgWidth = 600;
int imgHeight = 400;

void setup(){
  printArray(Serial.list()); //serial ports
  portName = Serial.list()[3]; //assign port
  println(portName);
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('\n');
  
  background(0); //black
  size(600, 400); //fullScreen();
  loadImages(); //load all frames
  frameRate(5); //slow frame rate
}

void draw(){
  background(0); //black
  // tree -> hill -> negatives -> mirror -> line -> lights -> rose -> socks -> horse 
  //TREE
  if (treeVal>10){treeObj.draw();} //draw tree if sensed
  else {count++;}
  //HILL
  if (hillVal>10){hillActive = true;} //activate hill animation if sensed
  if (hillActive == true){hillObj.draw();}  //draw if active
  else {count++;}
  //MIRROR
  if (mirrorVal>10){mirrorActive = true;}  //activate mirror animation if sensed
  if (mirrorActive == true){mirrorObj.draw();} //draw if active
  else {count++;}
  //LINE
  if (lineVal>10){lineActive = true;}  //activate line amination if sensed
  if (lineActive == true){lineObj.draw();} //draw if active
  else {count++;}
  //LIGHTS
  if (lightsVal>10){lightsActive = true;}  //activate light animation if sensed
  if (lightsActive == true){lightsObj.draw();} //draw if active
  else {count++;}
  //ROSE
  if (roseVal>10){roseActive = true;}  //activate rose animation if sensed
  if (roseActive == true){roseObj.draw();} //draw if active
  else {count++;}
  //STARS
  if (starsVal>10){starsObj.draw();} //draw stars if sensed
  else {count++;}
  //SOCKS
  if (socksVal>10){socksActive = true;} //activate socks animation if sensed
  if (socksActive == true){socksObj.draw();} //draw if active
  else {count++;}
  //HORSE
  if (horseVal>10){horseActive = true;} //activate horse animation if sensed
  if (horseActive == true){horseObj.draw();} //draw if sensed
  else {count++;}
  //NEGATIVE
  if (count > 500){ //if nothing has been drawn in 500 counts
    negativeActive = true; //activate negative
    count = 0; //reset count
  }
  if (negativeActive == true){negativeObj.draw();} //draw if active
}

class Hill{ //play animation once    
  int curr = 0; 
  void draw(){
    count = 0;
    negativeActive = false;
    image(hillImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    curr++; //next image
    if (curr >= 19){ //if animation over
      hillActive = false;  //deactivate
      curr = 0; //reset frame position
    }
  }
}

class Horse{ //play animation once
  int curr = 0;
  void draw(){
    count = 0;
    negativeActive = false;
    image(horseImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    curr++; //next image
    if (curr >=25){ //if animation over
      horseActive = false;  //deactivate
      curr=0;  //reset frame position
    }
  }
}

class Line{ //play animation once, forward & backward
  int curr = 0;
  boolean forward = true;
  void draw(){
    count = 0;
    negativeActive = false;
    image(lineImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    if (curr<29 && forward) {curr++;} //move forward
    if (curr>=29 && forward){ forward = !forward; } //set to backward
    if (!forward){curr--;} //move backward
    if (curr<0){ 
      lineActive = false; //deactivate
      forward = true; 
      curr = 0; //reset frame position
    }
  }
}

class Tree{ //play only when sensed
  int curr = 0; 
  void draw(){
    count = 0;
    negativeActive = false;
    curr++; //next image
    if (curr>=10){curr = 0;} //reset frame position
    image(treeImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
  }
}

class Mirror{ //play once
  int curr = 0;
  void draw(){
    count = 0;
    negativeActive = false;
    image(mirrorImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    curr++; //next image
    if (curr>=15){ 
      mirrorActive = false; //deactivate
      curr=0; //reset frame position
    }
  }
}

class Socks{ //play once
  int curr = 0;
  void draw(){
    count = 0;
    negativeActive = false;
    image(socksImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    curr++; //next image
    if (curr >=26){ 
      socksActive = false; //deactivate
      curr=0; //reset frame position
    }
  }
}

class Rose{ //play once, forward & backward
  int curr = 0;
  boolean forward = true;
  void draw(){
    count = 0;
    negativeActive = false;
    image(roseImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    if (curr<11 && forward) {curr++;}
    if (curr>=11 && forward){ forward = !forward; }
    if (!forward){curr--;}
    if (curr<0){
      roseActive = false; //deactivate
      forward = true; //reset to move forward
      curr = 0; //reset frame position
    }
  }
}

class Lights{ //play once
  int curr = 0;
  void draw(){
    count = 0;
    negativeActive = false;
    image(lightsImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
    curr++; //next image
    if (curr >=15){ 
      lightsActive = false; //deactivate
      curr=0;  //reset frame position
    }
  }
}

class Stars{ //play when pressed
  int curr = 0;
  void draw(){
    count = 0;
    negativeActive = false;
    curr++; //next image
    if (curr>=2){curr = 0;} //reset frame position
    image(starsImgs[curr], imgXloc, imgYloc, imgWidth, imgHeight);
  }
}

class Negative{ 
  int curr = 0; 
  int num = 0; //number diplayed
  void draw(){
    curr++; //next image
    num++;
    if (curr>=17){curr = 0;} //reset frame position
    if (num <5){num++;} //display 1 more
    else {num--;} //display 1 less
    for (int i = 0; i<num; i++){ //show num images, shift position between -5/5
      image(negativeImgs[curr], imgXloc+random(-5,5), imgYloc+random(-5,5), imgWidth, imgHeight);
    }
  }
}

void loadImages(){ //load all frames from data
  imageMode(CENTER);
  for (int i=0; i<20; i++){hillImgs[i] = loadImage("hill/hill"+(i+1)+".png");}
  for (int i = 0; i <26;i++){horseImgs[i] = loadImage("horse/horse"+(i+1)+".png");}
  for (int i = 0; i<18; i++){negativeImgs[i] = loadImage("negative/negative"+(i+1)+".png");}
  for (int i = 0; i<29; i++){lineImgs[i] = loadImage("line/line"+(i+1)+".png");}
  for (int i = 0; i<10; i++){treeImgs[i] = loadImage("tree/tree"+(i+1)+".png");}
  for (int i = 0; i<15; i++){mirrorImgs[i] = loadImage("mirror/mirror"+(i+1)+".png");}
  for (int i = 0; i<26; i++){socksImgs[i] = loadImage("socks/socks"+(i+1)+".png");}
  for (int i = 0; i<11; i++){roseImgs[i] = loadImage("rose/rose"+(i+1)+".png");}
  for (int i = 0; i<15; i++){lightsImgs[i] = loadImage("lights/lights"+(i+1)+".png");}
  for (int i = 0; i<2; i++){starsImgs[i] = loadImage("stars/stars"+(i+1)+".png");}
}

void serialEvent(Serial port){
  // tree -> hill -> negatives -> mirror -> line -> lights -> rose -> socks -> horse 
  String values = (port.readStringUntil('\n'));
  if (values != null){
    vals = float(split(values, ",")); //split sensor vals into array by ","
    treeVal = vals[0]; //set values of each object to 1 of sensor values
    hillVal = vals[1];
    starsVal = vals[2];
    mirrorVal = vals[3];
    lineVal = vals[4];
    lightsVal = vals[5];
    roseVal = vals[6];
    socksVal = vals[7];
    horseVal = vals[8];
    //common new base values the program jumps to instead of 0/1
    //reset to 0
    if (treeVal == 31 || treeVal == 30 || treeVal == 29 || treeVal == 59 || treeVal == 60){ treeVal = 0;}
    if (hillVal == 31 || hillVal == 30 || hillVal == 29 || hillVal == 59 || hillVal == 60){ hillVal = 0;}
    if (mirrorVal == 31 || mirrorVal == 30 || mirrorVal == 29 || mirrorVal == 59 || mirrorVal == 60){ mirrorVal = 0;}
    if (lineVal == 31 || lineVal == 30 || lineVal == 29 || lineVal == 59 || lineVal == 60){ lineVal = 0;}
    if (lightsVal == 31 || lightsVal == 30 || lightsVal == 29 || lightsVal == 59 || lightsVal == 60){ lightsVal = 0;}
    if (roseVal == 31 || roseVal == 30 || roseVal == 29 || roseVal == 59 || roseVal == 60){ roseVal = 0;}
    if (socksVal == 31 || socksVal == 30 || socksVal == 29 || socksVal == 59 || socksVal == 60){ socksVal = 0;}
    if (horseVal == 31 || horseVal == 30 || horseVal == 29 || horseVal == 59 || horseVal == 60){ horseVal = 0;}
    if (starsVal == 31 || starsVal == 30 || starsVal == 29 || starsVal == 59 || starsVal == 60){ starsVal = 0;}
    println("Tree: "+horseVal);
    println ("Hill: "+hillVal);
    println("Mirrror: "+mirrorVal);
    println("Line: "+lineVal);
    println("Lights: "+lightsVal);
    println("Rose: "+roseVal);
    println("Socks: "+socksVal);
    println("Horse: "+horseVal);
    println("Stars: "+starsVal);
  }
}