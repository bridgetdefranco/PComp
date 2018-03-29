// include the library code:
#include "Wire.h"
#include "Adafruit_LiquidCrystal.h"

// initialize the library with the numbers of the interface pins
Adafruit_LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

//if the LCD clear? (not displaying a fortune)
boolean isClear = true;
//button to clear LCD
int clearButton = 7;

//nouns to pick from 
char* nouns[]={"spider", "frog", "unicorn", "pig", "ocean", "flower", "banana", "happiness", "love", "team", "art", "ability", "failure", "death", "mood", 
"passion", "psyche", "cousin", "childhood", "queen", "tooth", "toe", "shirt", "time"};
//verbs to pick from 
char* verbs[]={"attack", "burst", "fly", "sing", "break", "rise", "eat", "blow", "grow", "smile", "dream", "burn", "forget", "leave", "lie", "win", "ache", "bleed", "dream", "fight", "laugh", "learn", "quit", "slay", "smell"};

//character graphic for clear LCD
byte eye[8] = {
  0b01110,
  0b01110,
  0b01110,
  0b01110,
  0b01110,
  0b01110,
  0b01110,
  0b01110
};

void setup() {
  lcd.createChar(1, eye); //create character
  Serial.begin(9600);
  lcd.begin(16, 2); //set LCD rows/columns
  lcd.setCursor(0,0); //set LCD cursor
}

void loop() {
  Serial.println(analogRead(5));
  //if clear button is pressed
  if (digitalRead(clearButton) == HIGH){
    lcd.clear(); //clear LCD
    isClear = true; //set LCD clear bool to true
    Serial.println("CLEAR!");
  }
  //if LCD is clear and the sensor is being pressed
  if (isClear == true && analogRead(5) > 50){
    int sensorVal;
    int maxSensorVal = 0;
    int time1 = millis(); //time before pressed
    while (analogRead(5) > 50){ //while sensor is being pressed
      dotdotdot(); //show user machine is thinking with "..."
      sensorVal = analogRead(0);
      if (sensorVal>maxSensorVal){ //if current sensor val is greater than max
        maxSensorVal = sensorVal; //set max to current sensor val
      }
      Serial.println(maxSensorVal);
    }
    int time2 = millis(); //time after pressed
    int timePressed = time2 - time1; //total time pressed
    printFortune(maxSensorVal, timePressed); //print fortune based on max and time
  } 
  //if LCD is clear (and the sensor is not being pressed)
  else if (isClear == true){
    pattern(); //display pattern
  }
}

//prints fortune based on max val of sensor input and amount of time user interacted with sensor
void printFortune(int sensorVal, int timePressed){
  Serial.println(timePressed);
  int reading1 = map(sensorVal, 0, 900, 0, sizeof(nouns)/2); //remap to size of nouns
  int reading2 = map(timePressed, 0, 6000, 0, sizeof(verbs)/2); //remap to size of vers
  lcd.setCursor(0,0); //top line
  lcd.print("noun: ");
  lcd.print(nouns[reading1]); //noun is based on the max value of the sensor
  lcd.setCursor(0,1); 
  lcd.print("verb: "); //bottom line
  lcd.print(verbs[reading2]); //verb is based on the amount of time user interacted with sensor
  isClear = false; //sensor is not clear (currently displaying a fortune
}

//draw pattern while LCD is clear
void pattern(){
  draw(0, 1); //draw checkered pattern
  delay(1000); //slow the alternating of the pattern
  lcd.clear(); //clear for next pattern
  draw(1, 0); //draw opposite checkered pattern
  delay(1000); //slow the alternating of the pattern
  lcd.clear(); //clear for next pattern
}

//draw checker
void draw(int i1, int i2){
  for (int i = 0; i<16; i++){ //draw 16 boxes
    if(i%2==0){ //if even   c
      lcd.setCursor(i,i1); //set cursor to horizontal position, top or bottom
      lcd.write(1); //draw predefined character
    }
    else{ //if odd
      lcd.setCursor(i,i2); //set cursor to horizontal position, bottom or top 
      lcd.write(1); //draw predefined character
    }
  }
}

//show user machine is thinking
//print "..."
void dotdotdot(){
  lcd.setCursor(6,0); //set cursor to top center
  lcd.print("..."); //print "..."
}


