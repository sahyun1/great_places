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
  LatLng _pickedLocation;

  void _selectLocation(LatLng latLng) {
    setState(() {
      _pickedLocation = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Map'),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: () => _pickedLocation == null
                    ? null
                    : Navigator.of(context).pop(_pickedLocation),
                icon: Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        circles: {
          Circle(
              circleId: CircleId('1'),
              // fillColor: Colors.blue,
              radius: 10,
              strokeColor: Colors.blue,
              strokeWidth: 5,
              center: LatLng(widget.initLoc.lat, widget.initLoc.lng))
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.initLoc.lat, widget.initLoc.lng), zoom: 16),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? null
            : {Marker(markerId: MarkerId('m1'), position: _pickedLocation)},
      ),
    );
  }
}
