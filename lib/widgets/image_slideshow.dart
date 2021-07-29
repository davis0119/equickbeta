import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../constants.dart';
import '../theme.dart';

class ImageCarousel extends StatefulWidget {
  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  // Active image file
  File _imageFile;
  final ImagePicker _imagePicker = ImagePicker();
  List<File> files = [];

  int _current = 0;

  List<Widget> photos = [];

  final CarouselController _controller = CarouselController();

  // Select an image via gallery or camera
  Future<void> pickImage(ImageSource source) async {
    // Decides whether image is from gallery or camera
    PickedFile selectedFile = await _imagePicker.getImage(source: source);
    File selected = File(selectedFile.path);

    setState(() {
      _imageFile = selected;
      photos.insert(0, Image.file(_imageFile));
      files.insert(0, _imageFile);

    });
  }

  // Crop image
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: files[_current].path, // creates newly cropped or modified image
      maxWidth: 512,
      maxHeight: 512,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image',
        )

    );

    setState(() {
      files[_current] = cropped ?? files[_current];
      Iterable<Widget> replacement = [Image.file(files[_current])] as Iterable<Widget>;
      photos.replaceRange(_current, _current + 1, replacement);
    });
  }

  // Remove image
  void clear() {
    setState(()  {
      photos.removeAt(_current);
      files[_current] = null;
      files.removeAt(_current);
    });
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CarouselSlider.builder(
            itemBuilder: (context, index, realIdx) {
              // if there aren't any photos only show icon button
              if(photos.length == 0) {
                photos.add(_addPhotoButton());
                return Container(
                  child: photos[index],
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                );
              } else {
                return Container(
                  child: photos[index],
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                );
              }
            },
            itemCount: photos.length == 0 ? 1 : photos.length,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  //_imageFile = photos[index] as File;
                });
                },
              scrollDirection: Axis.horizontal,
              //height: 250,
              aspectRatio: 1,
              viewportFraction: 0.8,
              initialPage: _current,
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
            carouselController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: photos.map((url) {
              int index = photos.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? themeProvider.themeMode().gradient[3]
                      : Colors.grey,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                child: Icon(Icons.crop),
                onPressed: _cropImage,
              ),
              TextButton(
                child: Icon(Icons.delete),
                onPressed: clear,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addPhotoButton() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return RawMaterialButton(
      onPressed:() {
        _bottomSheet(context);
      },
      elevation: 0.0,
      fillColor: Theme.of(context).canvasColor,
      child: Icon(Icons.add_a_photo, size: 50.0, color: themeProvider.themeMode().iconColor),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(
          side: BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: themeProvider.themeMode().iconColor
          )
      ),
    );
  }

  void _bottomSheet(BuildContext context) {
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
                        pickImage(ImageSource.camera);
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
                        pickImage(ImageSource.gallery);
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





