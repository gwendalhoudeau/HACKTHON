import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatelessWidget {
  final Function(GoogleMapController) onMapCreated;
  final CameraPosition initialCameraPosition;

  CustomMap({
    required this.onMapCreated,
    required this.initialCameraPosition,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: initialCameraPosition,
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Map Example'),
        ),
        body: CustomMap(
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(0.0, 0.0),
            zoom: 10,
          ),
        ),
      ),
    );
  }
}
