import 'package:flutter/material.dart';
import 'package:fluttergca/screens/stoptime/stoptimecontroller.dart';
import 'package:get/get.dart';

class StopTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: StopTimeController(),
      builder: (StopTimeController controller) => Scaffold(
        appBar: AppBar(
          title: Text("Stop Time"),
        ),
        floatingActionButton: _floatingButton(controller),
        body: _body(controller),
      ),
    );
  }

  Widget _floatingButton(StopTimeController controller) {
    return FloatingActionButton(
        onPressed: () {
          controller.stop();
        },
        child: Icon(Icons.timer));
  }

  Widget _body(StopTimeController controller) {
    return ListView(
      children: controller.timeList,
    );
  }
}
