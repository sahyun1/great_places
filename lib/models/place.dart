import 'dart:io';

import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double lat;
  final double lng;
  final String address;

  const PlaceLocation({@required this.lat, @required this.lng, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File locationImg;

  Place(
      {@required this.id,
      @required this.title,
      @required this.location,
      @required this.locationImg});
}
