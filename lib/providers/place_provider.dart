import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/helpers/location_helper.dart';

import 'package:great_places/models/place.dart';

class PlaceProvider with ChangeNotifier {
  static const dbName = 'user_places';

  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlace(String title, File img, LatLng pickedLoc) async {
    var address = await LocationHelper.getAddress(
        pickedLoc.latitude, pickedLoc.longitude);
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: PlaceLocation(
            lat: pickedLoc.latitude,
            lng: pickedLoc.longitude,
            address: address),
        locationImg: img);
    _items.add(newPlace);
    notifyListeners();

    DbHelper.insert(dbName, {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.locationImg.path,
      'loc_lat': newPlace.location.lat,
      'loc_lng': newPlace.location.lng,
      'address': newPlace.location.address
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final placeList = await DbHelper.getData(dbName);

    _items = placeList
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: PlaceLocation(
                lat: e['loc_lat'], lng: e['loc_lng'], address: e['address']),
            locationImg: File(e['image'])))
        .toList();
    notifyListeners();
  }
}
