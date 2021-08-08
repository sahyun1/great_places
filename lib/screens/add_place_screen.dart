import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/place_provider.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  // const AddPlaceScreen({ Key? key }) : super(key: key);
  static const page_name = './add-place';
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  // set pickedImage(File pickedImage) => _pickedImage = pickedImage;
  void _setPickedImage(File pickedImage) => _pickedImage = pickedImage;

  void _savePlace() {
    // TODO some error checking
    Provider.of<PlaceProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "title",
                        ),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10),
                      ImageInput(_setPickedImage)
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text("Add"),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
