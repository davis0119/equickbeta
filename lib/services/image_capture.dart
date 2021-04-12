import 'dart:io';
import 'package:easy_quick/services/uploader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../theme.dart';

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
  void clear() {
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
                  onPressed: clear,
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

  // Bottom Modal Sheet
  void bottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      return Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
          ),
        ),
        child: Column(

          children: <Widget>[
            SizedBox(height: 15.0),
            Text('Add a Photo', style: themeProvider.isLightTheme
                ? Constants.bottomSheetTitleLightThemeText
                : Constants.bottomSheetTitleDarkThemeText
            ),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed:() {
                        Navigator.pop(context);
                        _pickImage(ImageSource.camera);
                      },
                      elevation: 0.0,
                      fillColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.photo_camera, size: 25.0, color: themeProvider.themeMode().gradient[6]),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: themeProvider.themeMode().iconColor
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Camera',
                      style: themeProvider.isLightTheme
                          ? Constants.bottomSheetDescriptionLightThemeHeading
                          : Constants.bottomSheetDescriptionDarkThemeHeading,
                    )
                  ],
                ),
                Column(
                  children: [
                    RawMaterialButton(
                      onPressed:() {
                        Navigator.pop(context);
                        _pickImage(ImageSource.gallery);
                      },
                      elevation: 0.0,
                      fillColor: Theme.of(context).canvasColor,
                      child: Icon(Icons.photo_library, size: 25.0, color: themeProvider.themeMode().gradient[7]),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(
                          side: BorderSide(
                              width: 2.0,
                              style: BorderStyle.solid,
                              color: themeProvider.themeMode().iconColor
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Gallery',
                      style: themeProvider.isLightTheme
                          ? Constants.bottomSheetDescriptionLightThemeHeading
                          : Constants.bottomSheetDescriptionDarkThemeHeading,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
