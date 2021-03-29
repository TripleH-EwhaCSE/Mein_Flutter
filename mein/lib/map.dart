import 'package:flutter/material.dart';
import 'package:mein/bottomnavigationbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('map')),
      body: MyMap(),
      bottomNavigationBar: BottomNavigation(currentTab: 0),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final gwanghwamun = CameraPosition(
    target: LatLng(37.575929, 126.976849),
    zoom: 3.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: gwanghwamun,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
