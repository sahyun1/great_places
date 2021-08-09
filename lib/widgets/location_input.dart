import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  // const LocationInput({ Key? key }) : super(key: key);

  final Function onSelectLocation;

  const LocationInput(this.onSelectLocation);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImgUrl;

  void setPreviewImage(double lat, double lng) {
    final previewUrl = LocationHelper.generateLocationPreviewImg(lat, lng);

    setState(() {
      _previewImgUrl = previewUrl;
    });
  }

  Future<void> _getUserCurrentLocation() async {
    Location location = new Location();
    final locData = await location.getLocation();
    setPreviewImage(locData.latitude, locData.longitude);

    widget.onSelectLocation(LatLng(locData.latitude, locData.longitude));
  }

  Future<void> _selectOnMap() async {
    final selectedLoc =
        await Navigator.of(context).push<LatLng>(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (ctx) => MapScreen(
                  isSelecting: true,
                )));

    if (selectedLoc == null) {
      return;
    } else {
      print('selected loc : $selectedLoc');

      setPreviewImage(selectedLoc.latitude, selectedLoc.longitude);

      widget.onSelectLocation(
          LatLng(selectedLoc.latitude, selectedLoc.longitude));
    }
  }

  // @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            height: 170,
            width: double.infinity,
            alignment: Alignment.center,
            child: _previewImgUrl == null
                ? Text(
                    'No location choosen',
                    textAlign: TextAlign.center,
                  )
                : Image.network(
                    _previewImgUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: _getUserCurrentLocation,
              icon: Icon(Icons.location_on),
              label: Text(
                'Current Location',
                // style: TextStyle(color: Theme.of(context).accentColor),
              ),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text(
                'Select on Map',
                // style: TextStyle(color: Theme.of(context).accentColor),
              ),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        )
      ],
    );
  }
}
