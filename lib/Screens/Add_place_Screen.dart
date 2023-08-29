import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_native_app_features/providers/great_places.dart';
import 'package:using_native_app_features/widgets/image_input.dart';
import 'package:using_native_app_features/widgets/location_inut.dart';

// ignore: camel_case_types
class addPlace extends StatefulWidget {
  static const routename = 'addplace';

  const addPlace({super.key});

  @override
  State<addPlace> createState() => _addPlaceState();
}

// ignore: camel_case_types
class _addPlaceState extends State<addPlace> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectedImage(File pickedImage) {
    print(pickedImage.path);

    _pickedImage = pickedImage;
  }

  void _saveplace() {
    //  ignore: unnecessary_null_comparison
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<placeProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add places')),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ImageInput(
                      onSelect: _selectedImage,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LocationInput()
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _saveplace,
            icon: const Icon(Icons.add),
            label: const Text('add place'),
          ),
        ]),
      ),
    );
  }
}
