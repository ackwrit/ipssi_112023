import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //variable
  Completer<GoogleMapController> completer = Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: (controller) {
          completer.complete(controller);
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(48.84866334053075, 2.388339971696687), zoom: 14));
  }
}
