import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapBoxWidget extends StatefulWidget {
  const MapBoxWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MapBoxWidget();
  }
}

class _MapBoxWidget extends State<MapBoxWidget> {

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: const LatLng(51.509364, -0.128928),
              zoom: 3.2,
            ),
            children: [
              TileLayer(
                  urlTemplate: 'https://api.mapbox.com/styles/v1/jiwanhumagain/clmbkgmov018t01pbamvz98mn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoiaml3YW5odW1hZ2FpbiIsImEiOiJjbGxqZ3I0ZHAyNzJ0M3FxaGNha3ZxbnhtIn0.HAMERLeNSPOi__x2x8xiMg',
                  additionalOptions: const {
                    'accessToken':'pk.eyJ1Ijoiaml3YW5odW1hZ2FpbiIsImEiOiJjbGxqZ3I0ZHAyNzJ0M3FxaGNha3ZxbnhtIn0.HAMERLeNSPOi__x2x8xiMg',
                    'id':'mapbox.mapbox-streets-v8'

                  },
              ),
            ],
          ),
        ],
      ),
    );


}}
