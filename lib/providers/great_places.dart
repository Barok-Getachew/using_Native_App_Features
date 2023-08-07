import 'package:flutter/material.dart';
import '../models/place.dart';

class placeProvider with ChangeNotifier {
  final List<place> _places = [];

  List<place> get placess {
    return [..._places];
  }
}
