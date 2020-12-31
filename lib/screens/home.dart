import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController fieldController = TextEditingController();
  String fileName = "sample.txt";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Handling"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [_field(), _saveBtn(), _readBtn(), _saveImage(), _readImage()],
    );
  }

  Widget _saveImage() {
    return RaisedButton(
      onPressed: () {
        String imagePath = "assets/facebook.png";
        // rootBundle.load(imagePth)
        // File("").write
      },
      child: Text("Save image as a file"),
    );
  }

  Widget _readImage() {
    return RaisedButton(
      onPressed: () {},
      child: Text("read image from a file"),
    );
  }

  Widget _readBtn() {
    return MaterialButton(
      onPressed: () {
        _fileRead();
      },
      minWidth: double.infinity,
      color: Colors.purple,
      child: Text("Read from a file"),
    );
  }

  Widget _saveBtn() {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        _fileWrite();
      },
      color: Colors.green,
      child: Text("Save as a file"),
    );
  }

  _fileWrite() async {
    Directory directory = await getApplicationDocumentsDirectory();
    listFiles(directory);
    String filePath = directory.path + "/" + fileName;
    String fileData = fieldController.text;
    print("writing into file........\n");
    File file = File(filePath);
    file.writeAsStringSync(fileData);

    print("finished writing.....");
    listFiles(directory);
  }

  listFiles(Directory directory) {
    List<FileSystemEntity> fseList = directory.listSync();
    for (FileSystemEntity each in fseList) {
      print(each.path);
    }
  }

  _fileRead() {
    String filePath =
        "/data/user/0/com.example.fluttergca/app_flutter/sample.txt";
    String readText = File(filePath).readAsStringSync();
    File(filePath).readAsString().asStream().listen((event) {
      print(event);
    });
    // print(readText);
  }

  Widget _field() {
    return TextField(
      controller: fieldController,
    );
  }
}
