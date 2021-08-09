import 'package:flutter/material.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  // const LocationInput({ Key? key }) : super(key: key);
//
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImgUrl;

  Future<void> _getUserCurrentLocation() async {
    Location location = new Location();
    final locData = await location.getLocation();
    final previewUrl = LocationHelper.generateLocationPreviewImg(
        locData.latitude, locData.longitude);

    setState(() {
      _previewImgUrl = previewUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedLoc = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
              isSelecting: true,
            )));

    if (selectedLoc == null) {
      return;
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
