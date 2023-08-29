import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longtude;
  final String adress;

  PlaceLocation(
      {required this.latitude, required this.longtude, required this.adress});
}

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation? location;

  Place(
      {required this.id,
      required this.image,
      required this.location,
      required this.title});
}
