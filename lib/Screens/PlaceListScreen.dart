import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:using_native_app_features/Screens/Add_place_Screen.dart';
import 'package:using_native_app_features/providers/great_places.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('place'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(addPlace.routename);
                },
                icon: const Icon(Icons.add))
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 237, 193, 245),
        body: FutureBuilder(
            future: Provider.of<placeProvider>(context).fetchAndSetData(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<placeProvider>(
                    child: const Center(
                      child: Text("Got no place, Start adding new places"),
                    ),
                    builder: (context, value, child) => value.placess.isEmpty
                        ? child!
                        : ListView.builder(
                            itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(value.placess[i].image)),
                              title: Text(value.placess[i].title),
                              onTap: () {},
                            ),
                            itemCount: value.placess.length,
                          ))));
  }
}
