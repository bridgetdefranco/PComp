int motor1 = 3; //motor side 1
int motor2 = 4; //motor side 2
int enable = 9; 

int threshold = 400; //half max press value
int sensorVal; //press value
int lastSensorVal; //last press value
bool reverse = false; //direction of motor

const int MIN = 0;
const int MAX = 800;

void setup() {
  Serial.begin(9600);
  pinMode(motor1, OUTPUT);
  pinMode(motor2, OUTPUT);
  pinMode(enable, OUTPUT);
  
  digitalWrite(enable, HIGH); //motor enabled
}

void loop() {
  sensorVal = analogRead(0); //press (0-800ish)
  Serial.println(sensorVal);
  int motorSpeed = map(sensorVal, MIN, MAX, 0, 255); //map press to motor speed
  motorSpeed = constrain(motorSpeed, 0, 255); 
  Serial.println(motorSpeed);
  if (reverse) { //if press > 400
    analogWrite(motor1, motorSpeed); //spins motor1 direction
    analogWrite(motor2, 0);
  }
  else { //if press < 400
    analogWrite(motor1, 0); 
    analogWrite(motor2, motorSpeed); //spins motor2 direction
  }
  if (sensorVal > threshold) { //if press is > 400
    if (lastSensorVal < threshold) { //if threshold was crossed
      reverse = !reverse; //change motor direction
      Serial.println("SWITCH");
    }
  }
  else if (sensorVal < threshold) { //if press is < 400
    if (lastSensorVal > threshold){ //if threshold was crossed
      reverse = !reverse; //change motor direction
      Serial.println("SWITCH");
    }
  }
  lastSensorVal = sensorVal;
}
