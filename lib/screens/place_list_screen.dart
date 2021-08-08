import 'package:flutter/material.dart';
import 'package:great_places/providers/place_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  // const PlaceListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your space'),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AddPlaceScreen.page_name),
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<PlaceProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<PlaceProvider>(
                  child: Center(
                    child: Text('Got no place yet'),
                  ),
                  builder: (ctx, placeData, ch) => placeData.items.length <= 0
                      ? ch
                      : ListView.builder(
                          itemCount: placeData.items.length,
                          itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(placeData.items[i].locationImg),
                                ),
                                title: Text(placeData.items[i].title),
                                //subtitle: Text(placeData.items[i].location),
                                onTap: () {},
                              )),
                ),
        ));
  }
}
