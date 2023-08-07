import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:using_native_app_features/Screens/Add_place_Screen.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('place'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(addPlace.routename);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
