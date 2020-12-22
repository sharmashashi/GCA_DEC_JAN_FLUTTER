import 'package:flutter/material.dart';
import 'package:fluttergca/screens/custom_card/customcard.dart';
import 'package:fluttergca/screens/feeds/feedsController.dart';
import 'package:get/get.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade700,
          title: Text("News Feed"),
        ),
        body: GetBuilder(
          init: FeedsController(),
          builder: (FeedsController controller) =>
              ListView(children: controller.cards),
        ));
  }
}
