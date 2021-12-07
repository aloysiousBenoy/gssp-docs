#include <Arduino.h>
#line 1 "/home/raider0ne/projects/hardware/esp_lights/sketch_nov29a/sketch_nov29a.ino"
#include <SoftwareSerial.h>
byte buff[25];
uint8_t command[] = {0xc1, 0x00, 0x02};
SoftwareSerial serial2 = SoftwareSerial(9, 10);
#line 5 "/home/raider0ne/projects/hardware/esp_lights/sketch_nov29a/sketch_nov29a.ino"
void setup();
#line 11 "/home/raider0ne/projects/hardware/esp_lights/sketch_nov29a/sketch_nov29a.ino"
void loop();
#line 5 "/home/raider0ne/projects/hardware/esp_lights/sketch_nov29a/sketch_nov29a.ino"
void setup()
{
  Serial.begin(9600);
  serial2.begin(9600);
}

void loop()
{
  serial2.write(command, 3);
  serial2.readBytes(buff, 7);
  Serial.println("buffer contents");
  for (int i = 0; i < 8; i++)
    Serial.print(buff[i]);
  delay(1000);
}

