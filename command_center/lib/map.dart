import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'data_model.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.data});

  final List<Data> data;
  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: MapOptions(
          center: const LatLng(8.50496250, 76.94039883),
        ),
        nonRotatedChildren: [
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () {},
              ),
            ],
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: widget.data
                .where((element) =>
                    element.latitude != 0.00 && element.longitude != 0.00)
                .map((e) => Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(e.latitude, e.longitude),
                      builder: (ctx) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                    ))
                .toList(),
          )
        ]);
  }
}
