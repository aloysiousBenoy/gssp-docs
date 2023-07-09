# read from serial and write to file

import serial
import time

ser = serial.Serial('/dev/ttyUSB0', 9600)
while True:
    if ser.in_waiting > 0:
        line = ser.read_until('\n').decode('utf-8')
        print(line)
        with open("tm.txt", "a") as f:
            f.write(line)
