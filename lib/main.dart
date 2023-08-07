import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_native_app_features/Screens/Add_place_Screen.dart';
import '../providers/great_places.dart';
import '../Screens/PlaceListScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return placeProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: PlaceList(),
        routes: {
          addPlace.routename: (context) => addPlace(),
        },
      ),
    );
  }
}
