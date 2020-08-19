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
  final String _id;
  final String _title;
  final _location;
  final File _image;

  Place({
    @required id,
    @required title,
    @required location,
    @required image,
  })  : _id = id,
        _title = title,
        _location = location,
        _image = image;
}
