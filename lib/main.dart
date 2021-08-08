import 'package:flutter/material.dart';
import 'package:great_places/providers/place_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/place_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlaceProvider(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlaceListScreen(),
        routes: {AddPlaceScreen.page_name: (ctx) => AddPlaceScreen()},
      ),
    );
  }
}
