import 'package:flutter/material.dart';
import 'package:fluttergca/screens/homepage/homepagecontroller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Using SharedPreferences"),
      ),
      body: GetBuilder(
        init: HomePageController(),
        builder: (HomePageController homePageController) => Column(
          children: [
            TextField(
              controller: homePageController.textFieldController,
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                homePageController.save();
              },
              child: Text("Save"),
            ),
            FlatButton(
              onPressed: () {
                homePageController.load();
              },
              color: Colors.purple,
              child: Text("Load"),
            )
          ],
        ),
      ),
    );
  }
}
