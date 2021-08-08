import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places/helpers/db_helper.dart';

import 'package:great_places/models/place.dart';

class PlaceProvider with ChangeNotifier {
  static const dbName = 'user_places';

  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  addPlace(
    String title,
    File img,
  ) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        locationImg: img);
    _items.add(newPlace);
    notifyListeners();

    DbHelper.insert(dbName, {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.locationImg.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final placeList = await DbHelper.getData(dbName);

    _items = placeList
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            locationImg: File(e['image'])))
        .toList();
    notifyListeners();
  }
}
