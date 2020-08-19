import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double _latitude;
  final double _longitude;
  final String _address;

  PlaceLocation({
    @required latitude,
    @required longitude,
    address,
  })  : _latitude = latitude,
        _longitude = longitude,
        _address = address;
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
