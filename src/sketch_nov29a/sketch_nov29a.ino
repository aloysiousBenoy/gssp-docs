#include <SoftwareSerial.h>
byte buff[25];
uint8_t command[] = {0xc1, 0x00, 0x02};
SoftwareSerial serial2 = SoftwareSerial(9, 10);
SoftwareSerial sGps = SoftwareSerial(6, 7);

void setup()
{
  Serial.begin(9600);
  serial2.begin(9600);
  sGps.begin(9600);
}

void loop()
{

  String s = sGps.readString();
  serial2.println(s);
  // serial2.write(command, 3);
  // serial2.readBytes(buff, 7);
  // Serial.println("buffer contents");
  // for (int i = 0; i < 8; i++)
  //   Serial.print(buff[i]);
  delay(1000);
}
