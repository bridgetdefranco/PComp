#include <CapacitiveSensor.h>

CapacitiveSensor cs_4_12 = CapacitiveSensor(4,12);

void setup(){
   Serial.begin(9600);
}

void loop(){
    long sensor6 =  cs_4_12.capacitiveSensor(30);
    Serial.println(sensor6);
    delay(100); 
}
