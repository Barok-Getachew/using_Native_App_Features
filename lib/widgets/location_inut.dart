import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  dynamic? _previewImageUrl;
  double? latitude = 57.08;
  double? longtude = 35.343;

  Future<void> _getUserLocaton() async {
    final locData = await Location().getLocation();
    _previewImageUrl = locData;
    this.latitude = locData.latitude;
    this.longtude = locData.longitude;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          alignment: Alignment.center,
          // child: _previewImageUrl == null
          //     ? const Text(
          //         "No Location yet!!",
          //         textAlign: TextAlign.center,
          //       )
          //     :
          child: FlutterMap(
            options: MapOptions(
              center: _previewImageUrl == null
                  ? LatLng(0, 0)
                  : LatLng(latitude!, longtude!),
              zoom: 3.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              )
            ],

            //  Image.network(
            //     _previewImageUrl!,
            //     fit: BoxFit.cover,
            //     width: double.infinity,
            //   ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black),
              onPressed: _getUserLocaton,
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black),
              onPressed: () {},
              icon: const Icon(Icons.map_outlined),
              label: const Text("Select on Map "),
            ),
          ],
        )
      ],
    );
  }
}
