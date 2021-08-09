import 'package:flutter/material.dart';
import 'package:great_places/providers/place_provider.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  // const PlaceDetailScreen({ Key? key }) : super(key: key);
  static const page_name = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<PlaceProvider>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(title: Text(selectedPlace.title)),
      body: Column(
        children: [
          Container(
              height: 200,
              width: double.infinity,
              child: Image.file(
                selectedPlace.locationImg,
                fit: BoxFit.cover,
                width: double.infinity,
              )),
          SizedBox(height: 10),
          Text(
            selectedPlace.location.address,
            style: TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          FlatButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (ctx) => MapScreen(initLoc: selectedPlace.location))),
            child: Text('View on the map'),
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
