import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  // const LocationInput({ Key? key }) : super(key: key);
//
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImgUrl;

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
              onPressed: () {},
              icon: Icon(Icons.location_on),
              label: Text(
                'Current Location',
                // style: TextStyle(color: Theme.of(context).accentColor),
              ),
              textColor: Theme.of(context).primaryColor,
            ),
            FlatButton.icon(
              onPressed: () {},
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
