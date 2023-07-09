import 'dart:async';
import 'dart:convert';

import 'package:command_center/map.dart';
import 'package:command_center/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Data> _data = [];

  void connectToPort() {
    final ports = SerialPort.availablePorts;
    final port = ports.firstWhere((element) => element == '/dev/ttyUSB0');

    final portHandle = SerialPort(port);
    // portHandle.config.baudRate = 115200;
    portHandle.openRead();
    final reader = SerialPortReader(portHandle);
    reader.stream.listen((event) {
      try {
        String decoded = utf8.decode(event);
        print("log: $decoded");
        final data = Data.parse(decoded);

        setState(() {
          _data.add(data);
        });
      } catch (e) {
        debugPrint("could not parse frame");
      }
    });
  }

  @override
  void initState() {
    connectToPort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_data.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('No data'),
        ),
      );
    }
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 150,
                      width: 350,
                      child: Column(
                        children: [
                          Text(
                            "Mission Clock",
                            style: clockStyle.copyWith(
                                color: Colors.black, fontSize: 32),
                          ),
                          Text(
                            _data.last.millis.toString(),
                            style: clockStyle,
                          )
                        ],
                      )),
                  SizedBox(
                      height: 150,
                      width: 350,
                      child: Column(
                        children: [
                          Text(
                            "GPS TIME",
                            style: clockStyle.copyWith(
                                color: Colors.black, fontSize: 32),
                          ),
                          Text(
                            _data.last.hhmmss,
                            style: clockStyle,
                          )
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SfCartesianChart(series: <LineSeries<Data, int>>[
                      LineSeries(
                        dataSource: _data,
                        xValueMapper: (Data data, _) => data.millis,
                        yValueMapper: (Data data, _) => data.humidity,
                      )
                    ]),
                  ),
                  Expanded(
                    child: SfCartesianChart(series: <LineSeries<Data, int>>[
                      LineSeries(
                        dataSource: _data,
                        xValueMapper: (Data data, _) => data.millis,
                        yValueMapper: (Data data, _) => data.temperature,
                      )
                    ]),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                      height: 500, width: 500, child: MapWidget(data: _data)),
                  Expanded(
                    child: SfCartesianChart(series: <LineSeries<Data, int>>[
                      LineSeries(
                        dataSource: _data,
                        xValueMapper: (Data data, _) => data.millis,
                        yValueMapper: (Data data, _) => data.altitude,
                      )
                    ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
