import 'package:flutter/material.dart';
import 'package:fluttergca/models/jsonPlaceholderModel.dart';

class DetailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    JsonPlaceholderModel model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(model.body),
      ),
    );
  }
}
