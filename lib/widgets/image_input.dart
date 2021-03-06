import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImageInput extends StatefulWidget {
  // const ImageInput({ Key? key }) : super(key: key);
  final Function onSelectImg;

  const ImageInput(this.onSelectImg);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    // final imagePicker = ImagePicker();
    final imageTaken = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
    if (imageTaken != null) {
      setState(() {
        _storedImage = File(imageTaken.path);
      });

      final appDir = await sysPath.getApplicationDocumentsDirectory();
      final fileName = path.basename(imageTaken.path);
      final savedImage =
          await File(imageTaken.path).copy('${appDir.path}$fileName');

      widget.onSelectImg(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 150,
        height: 100,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        child: _storedImage != null
            ? Image.file(
                _storedImage,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text(
                "No Image taken",
                textAlign: TextAlign.center,
              ),
        alignment: Alignment.center,
      ),
      SizedBox(width: 10),
      Expanded(
          child: FlatButton.icon(
        onPressed: _takePicture,
        icon: Icon(Icons.camera),
        label: Text("Take img"),
        textColor: Theme.of(context).primaryColor,
      )),
    ]);
  }
}
