import 'dart:io';

class placeLocation {
  final double latitude;
  final double longtude;
  final String adress;

  placeLocation(
      {required this.latitude, required this.longtude, required this.adress});
}

class place {
  final String id;
  final String title;
  final File image;
  final placeLocation location;

  place(
      {required this.id,
      required this.image,
      required this.location,
      required this.title});
}
