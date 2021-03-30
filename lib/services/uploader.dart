import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: 'gs://easyquick-beta.appspot.com');
  UploadTask _uploadTask; // provides state of upload
  var _progress;

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';
    _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<TaskSnapshot>(
          stream: _uploadTask.snapshotEvents,
          builder: (context, snapshot) {
            _uploadTask.snapshotEvents.listen((event) {
              setState(() {
                _progress = event.bytesTransferred.toDouble() /
                    event.totalBytes.toDouble();
              });
            }).onError((error) {
              // TODO: display error
            });
            return Column(
              children: [
                LinearProgressIndicator(
                  value: _progress,
                ),
                Text('Uploading ${(_progress * 100).toStringAsFixed(2)} %'),
              ],
            );
          });
    } else {
      return FlatButton.icon(
        icon: Icon(Icons.cloud_upload),
        label: Text('Upload to Firebase'),
        onPressed: _startUpload,
      );
    }
  }
}
