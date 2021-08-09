import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/models/place.dart';

class MapScreen extends StatefulWidget {
  // const MapScreen({ Key? key }) : super(key: key);

  final PlaceLocation initLoc;
  final bool isSelecting;

  const MapScreen(
      {this.initLoc = const PlaceLocation(lat: -36.771475, lng: 174.723690),
      this.isSelecting = false});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
      ),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.initLoc.lat, widget.initLoc.lng),
              zoom: 16)),
    );
  }
}
