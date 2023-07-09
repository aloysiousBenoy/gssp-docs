// millis,hh#mm#ss,acc_x,acc_y,acc_z,gyro_x,gyro_y,gyro_z,pressure,humidity,temperature,latitude,longitude,altitude,sats_count\n

class Data {
  int millis;
  String hhmmss;
  double accX;
  double accY;
  double accZ;
  double gyroX;
  double gyroY;
  double gyroZ;
  double pressure;
  double humidity;
  double temperature;
  double latitude;
  double longitude;
  double altitude;

  Data({
    required this.millis,
    required this.hhmmss,
    required this.accX,
    required this.accY,
    required this.accZ,
    required this.gyroX,
    required this.gyroY,
    required this.gyroZ,
    required this.pressure,
    required this.humidity,
    required this.temperature,
    required this.latitude,
    required this.longitude,
    required this.altitude,
  });

  factory Data.parse(String str) {
    final List<String> data = str.split(',');
    final List<String> hhmmss = data[1].split('#');
    return Data(
      millis: int.parse(data[0]),
      hhmmss: hhmmss.join(':'),
      accX: double.tryParse(data[2]) ?? 0,
      accY: double.tryParse(data[3]) ?? 0,
      accZ: double.tryParse(data[4]) ?? 0,
      gyroX: double.tryParse(data[5]) ?? 0,
      gyroY: double.tryParse(data[6]) ?? 0,
      gyroZ: double.tryParse(data[7]) ?? 0,
      pressure: double.tryParse(data[8]) ?? 0,
      humidity: double.tryParse(data[9]) ?? 0,
      temperature: double.tryParse(data[10]) ?? 0,
      latitude: double.tryParse(data[11]) ?? 0,
      longitude: double.tryParse(data[12]) ?? 0,
      altitude: double.tryParse(data[13]) ?? 0,
    );
  }
}
