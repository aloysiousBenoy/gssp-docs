// byte buff[25];
// uint8_t command[] = {0xc1, 0x00, 0x02};
// SoftwareSerial serial2 = SoftwareSerial(9, 10);
#define pinaux 7
void setup()
{
  Serial.begin(9600);
  pinMode(pinaux, INPUT);
  // serial2.begin(9600);
}

void loop()
{
  int a = digitalRead(pinaux);
  if (a)
  {
    Serial.print("d");
  }
  // serial2.write(command, 3);
  // serial2.readBytes(buff, 7);
  // Serial.println("buffer contents");
  // for (int i = 0; i < 8; i++)
  //   Serial.print(buff[i]);
}
