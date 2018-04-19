import processing.serial.*;

Serial port;
String arduinoValues;
Character c;

void setup(){
  size(600, 400);
  //fullScreen();
  background(255);
  /*String portName = Serial.list()[0];
  port = new Serial(this, portName, 9600);
  port.bufferUntil('\n');*/
  c = new Character();
}

void draw(){
  background(255);
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
  float d = 50;
  void right(){
    this.x+=1;
    if (this.x > width){
      this.x = 0;
    }
    drawChar(-10, 0);
  }
  void left(){
    this.x-=1;
    if (this.x < 0){
      this.x = width;
     }
    drawChar(10, 0);
  }
  void up(){
    this.y--;
    if (this.y < 0){
      this.y = height;
    }
    drawChar(0, 10);
  }
  void down(){
    this.y++;
    if (this.y > height){
      this.y = 0;
    }
    drawChar(0, -10);
  }
  void backward(){
    this.d--;
    if (this.d < 0){
      this.d = height;
    }
    drawChar(0, 0);
  }
  void forward(){
    this.d++;
    if (this.d > height){
      this.d = 0;
    }
    drawChar(0, 0);
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