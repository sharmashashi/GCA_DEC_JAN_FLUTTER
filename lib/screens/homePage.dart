import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class Home extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  // final HomeController homeController = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color swapper"),
      ),
      body: GetBuilder(
        init: HomeController(),
        builder: (HomeController homeController) => Column(
          children: [
            TextField(
              controller: _textFieldController,
              onChanged: (value) {
                // print(value);
                homeController.updateValue(value);
              },
            ),
            RaisedButton(
                onPressed: () {
                  // print(_textFieldController.text);
                  homeController.updateValue(_textFieldController.text);
                },
                child: Text(
                  "Display",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green),
            Text(homeController.inputText)
            // Obx(() => Text(homeController.inputText))
          ],
        ),
      ),
    );
  }
}

class HomeController extends GetxController {
  // RxString _inputText = 'Initial'.obs;
  // String get inputText => _inputText.value;
  // updateValue(String str) {
  //   _inputText.value = str;
  // }

  String _inputText = 'Initial';
  String get inputText => _inputText;
  updateValue(String str) {
    _inputText = str;
    update();
  }
}
