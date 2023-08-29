import 'dart:io';

import 'package:flutter/material.dart';
import '../models/place.dart';
import '../helpers/db_helper.dart';

class placeProvider with ChangeNotifier {
  final List<Place> _places = [];

  List<Place> get placess {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: image,
        location: null,
        title: title);
    _places.add(newPlace);
    notifyListeners();
    DbHelper.insert(
        'user_place', {'id': newPlace.id, 'title': title, 'image': image.path});
  }

  Future<void> fetchAndSetData() async {
    final listData = await DbHelper.getData('user_places');

    final places = listData
        .map((e) => Place(
            id: e['id'],
            image: File(e['image']),
            location: null,
            title: e['title']))
        .toList();

    notifyListeners();
  }
}
