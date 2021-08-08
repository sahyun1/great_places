import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:great_places/models/place.dart';

class PlaceProvider with ChangeNotifier {
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
  }
}
