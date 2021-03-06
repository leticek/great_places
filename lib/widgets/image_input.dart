import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageInputWidget extends StatefulWidget {
  final Function _onImageTaken;

  const ImageInputWidget({onImageTaken}) : _onImageTaken = onImageTaken;

  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File _storedImage;
  ImagePicker _imagePicker = ImagePicker();

  Future<void> _takePicture() async {
    final imageFile = await _imagePicker.getImage(
        source: ImageSource.camera, maxWidth: 900, maxHeight: 600);
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });

    final appDir = await path_provider.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storedImage.path);
    final savedImage = await _storedImage.copy('${appDir.path}/$fileName');
    widget._onImageTaken(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                  'No Image',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take a Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
            //highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        )
      ],
    );
  }
}
