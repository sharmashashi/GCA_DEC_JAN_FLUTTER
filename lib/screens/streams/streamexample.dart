import 'dart:async';

import 'package:flutter/material.dart';

class StreamExample extends StatelessWidget {
  final StreamController streamController = StreamController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Streams"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [_listenbutton(), _addbutton()],
    );
  }

  Widget _addbutton() {
    String currentDateTime = DateTime.now().toIso8601String();
    return RaisedButton(
      onPressed: () {
        streamController.sink.add(currentDateTime);
      },
      child: Text("Add"),
    );
  }

  Widget _listenbutton() {
    return RaisedButton(
      onPressed: () {
        streamController.stream.listen((data) {
          print(data);
        });
      },
      child: Text("Listen to Changes"),
    );
  }
}
