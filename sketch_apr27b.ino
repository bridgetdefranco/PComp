#include <CapacitiveSensor.h>

long sensor9, sensor8, sensor7, sensor6, sensor5, sensor4, sensor3, sensor2, sensor1;

//9 capacitance sensors in 13, 12, 11, 10, 9, 8, 7 , 6, 5
//all connected to 4
CapacitiveSensor cs_4_13 = CapacitiveSensor(4,13);
CapacitiveSensor cs_4_12 = CapacitiveSensor(4,12);
CapacitiveSensor cs_4_11 = CapacitiveSensor(4, 11);
CapacitiveSensor cs_4_10 = CapacitiveSensor(4, 10);
CapacitiveSensor cs_4_9 = CapacitiveSensor(4, 9);
CapacitiveSensor cs_4_8 = CapacitiveSensor(4, 8);
CapacitiveSensor cs_4_7 = CapacitiveSensor(4, 7);
CapacitiveSensor cs_4_6 = CapacitiveSensor(4, 6);
CapacitiveSensor cs_4_5 = CapacitiveSensor(4, 5);

void setup(){
   Serial.begin(9600); //Serial communication over xbees
}

void loop(){
    //set sensor values to coming from capacitance sensors
    sensor9 =  cs_4_13.capacitiveSensor(30);
    sensor8 =  cs_4_12.capacitiveSensor(30);
    sensor7 =  cs_4_11.capacitiveSensor(30);
    sensor6 =  cs_4_10.capacitiveSensor(30);
    sensor5 =  cs_4_9.capacitiveSensor(30);
    sensor4 =  cs_4_8.capacitiveSensor(30);
    sensor3 =  cs_4_7.capacitiveSensor(30);
    sensor2 =  cs_4_6.capacitiveSensor(30);
    sensor1 =  cs_4_5.capacitiveSensor(30);
    //print all sensor values to serial
    //commas between each value to be parsed in processing
    Serial.print(sensor9);
    Serial.print(",");
    Serial.print(sensor8);
    Serial.print(",");
    Serial.print(sensor7);
    Serial.print(",");
    Serial.print(sensor6);
    Serial.print(",");
    Serial.print(sensor5);
    Serial.print(",");
    Serial.print(sensor4);
    Serial.print(",");
    Serial.print(sensor3);
    Serial.print(",");
    Serial.print(sensor2);
    Serial.print(",");
    Serial.print(sensor1);
    Serial.println (",");
    delay(100); 
}
