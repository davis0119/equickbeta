import 'dart:io';
import 'package:easy_quick/services/uploader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  // Active image file
  File _imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  // Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    // Decides whether image is from gallery or camera
    PickedFile selectedFile = await _imagePicker.getImage(source: source);
    File selected = File(selectedFile.path);

    setState(() => _imageFile = selected);
  }

  // Select an images via gallery or camera
  Future<void> _pickImages(ImageSource source) async {
    // Decides whether image is from gallery or camera
    PickedFile selectedFile = await _imagePicker.getImage(source: source);
    File selected = File(selectedFile.path);

    setState(() => _imageFile = selected);
  }

  // Crop image
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path, // creates newly cropped or modified image
      // TODO: Add extra properties
    );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  // Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            IconButton(
              icon: Icon(Icons.photo_library),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          if(_imageFile != null) ...[
            Image.file(_imageFile),

            Row(
              children: <Widget>[
                FlatButton(
                 child: Icon(Icons.crop),
                 onPressed: _cropImage,
                ),
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
              ],
            ),

            // take the raw file and create a Firebase Storage Upload task
            Uploader(file: _imageFile)
          ]
        ],
      ),
    );
  }
}
