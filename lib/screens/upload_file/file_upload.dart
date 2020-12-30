import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FileUpload extends StatefulWidget {
  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  File _imageFile;
  Widget _previewWidget = SizedBox();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Upload example"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [_pickImgBtn(), _preview(), _uploadBtn()],
      ),
    );
  }

  Widget _pickImgBtn() {
    return RaisedButton(
      onPressed: () {
        _pick();
      },
      child: Text("Pick Image"),
      color: Colors.green,
    );
  }

  Widget _preview() {
    return _previewWidget;
  }

  Widget _uploadBtn() {
    return RaisedButton(
        onPressed: () {
          _upload();
        },
        child: Text("Upload"),
        color: Colors.purple);
  }

  _pick() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      _previewWidget = Image.file(
        _imageFile,
        height: Get.height * .5,
      );
      setState(() {});
    }
  }

  _upload() async {
    FirebaseStorage firebaseStorage = FirebaseStorage();
    StorageReference reference = firebaseStorage
        .ref()
        .child("images/" + DateTime.now().toIso8601String());
    StorageUploadTask task = reference.putFile(_imageFile);
    StorageTaskSnapshot snapshot = await task.onComplete;
    var downloadUrl = await snapshot.ref.getDownloadURL();

    Get.dialog(AlertDialog(
      title: Text("Upload Successful !"),
      content: Image.network(
        downloadUrl,
        height: Get.height * .25,
      ),
    ));
  }
}
