import processing.serial.*;
Serial port;
String arduinoValues;

PImage right1, right2, right3, right4, right5, right6, right7, right8, right9, right10, right11, right12;
PImage right [] = new PImage[12]; 
int currRight = 0;
PImage left1, left2, left3, left4, left5, left6, left7, left8, left9, left10, left11, left12; 
PImage left[] = new PImage[12]; 
int currLeft = 0;
PImage down1, down2, down3, down4;
PImage down[] = new PImage[4];
int currDown = 0;
int currUp = 0;
PImage forward1, forward2, forward3, forward4;
PImage forward[] = new PImage[4];
int currForward;

Character c;

void setup(){
  size(1000, 500);
  //fullScreen();
  background(255, 5);
  /*String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);
  port.bufferUntil('\n');*/
  c = new Character();
  loadImages();
  frameRate(5);
}

void draw(){
  //background(255);
  if (keyCode == UP){
    c.up();
  }
  if (keyCode == DOWN){
    c.down();
  }
  if (keyCode == LEFT){
    c.left();
  }
  if (keyCode == RIGHT){
    c.right();
  }
  if (keyCode == CONTROL){
    c.backward();
  }
  if (keyCode == SHIFT){
    c.forward();
  }
}

class Character{
  float x = random(width); 
  float y = random(height);
  float pastx, pasty, pastx1, pasty1;
  float d = 100;
  void right(){
    this.x+=10;
    currRight++;
    if (this.x > width){this.x = 0;}
    if (currRight >= 12){currRight = 0;}
    image(right[currRight], this.x, this.y, d, d);
    //drawChar(-10, 0);
  }
  void left(){
    this.x-=10;
    currLeft++;
    if (this.x > width){this.x = 0;}
    if (currLeft >= 12){currLeft = 0;}
    image(left[currLeft], this.x, this.y, d, d);
    //drawChar(-10, 0);
  }
  void up(){
    this.y-=5;
    currUp--;
    if (this.y < 0){this.y = height;}
    if (currUp < 0){currUp = 3;}
    image(down[currUp], this.x, this.y, d, d);
    //drawChar(0, 10);
  }
  void down(){
    this.y+=5;
    currDown++;
    if (this.y > height){this.y = 0;}
    if (currDown >=4){currDown = 0;}
    image(down[currDown], this.x, this.y, d, d);
    //drawChar(0, -10);
  }
  void backward(){
    this.d--;
    if (this.d < 0){
      this.d = height;
    }
    drawChar(0, 0);
  }
  void forward(){
    this.d+=5;
    currForward++;
    if (this.d > 200){this.d = 0;}
    if (currForward >=4){currForward = 0;}
    image (forward[currForward], this.x, this.y, d, d);
    //drawChar(0, 0);
  }
  void drawChar(float rl, float ud){
    noStroke();
    fill(255, 0, 0, 10);
    ellipse(this.pastx1, this.pasty1, d, d);
    fill(0, 255, 0, 50);
    ellipse(this.pastx, this.pasty, d, d);
    fill(0, 0, 255);
    ellipse(this.x, this.y, d, d);
    pastx = this.x + rl;
    pasty = this.y + ud ;
    pastx1 = this.pastx + (rl*1.5);
    pasty1 = this.pasty + (ud*1.5);
  }
}

void loadImages(){
  imageMode(CENTER);
  for (int i=0; i<12; i++){
    right[i] = loadImage("right/right"+(i+1)+".png");
    left[i] = loadImage("left/left"+(i+1)+".png");
  }
  for (int i=0; i<4; i++){
    down[i] = loadImage("down/down"+(i+1)+".png");
    forward[i] = loadImage("forward/forward"+(i+1)+".png");
  }
}