import 'package:flutter/material.dart';
import 'package:using_native_app_features/widgets/image_input.dart';

class addPlace extends StatefulWidget {
  static const routename = 'addplace';
  const addPlace({super.key});

  @override
  State<addPlace> createState() => _addPlaceState();
}

class _addPlaceState extends State<addPlace> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add places')),
      body: Padding(
        padding: EdgeInsets.all(9),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('add place'),
          ),
        ]),
      ),
    );
  }
}
