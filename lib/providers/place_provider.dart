import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'dart:io';

import '../models/place.dart';
import '../helpers/db_helper.dart';

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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      //'location': newPlace.location
    });
  }

  Future<void> selectAndSet() async {
    final dataList = await DBHelper.select('user_places');
    _items = dataList
        .map((map) => Place(
              id: map['id'],
              image: File(map['image']),
              location: null,
              title: map['title'],
            ))
        .toList();
    notifyListeners();
  }
}
