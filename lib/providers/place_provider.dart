import 'package:flutter/material.dart';
import 'dart:io';

import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        image: image,
        title: title,
        location: null);
    _items.add(newPlace);
    notifyListeners();
  }
}
