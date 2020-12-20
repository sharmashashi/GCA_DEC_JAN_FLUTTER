import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt _counter = 0.obs;

  int get counter => _counter.value;
  // set setCounter(int value) {
  //   _counter = value;
  // }

  void incrementCounter() {
    _counter.value++;
  }

  void decrementCounter() {
    _counter.value--;
  }

  Size getScreenSize() {
    double height = Get.height;
    double width = Get.width;
    return Size(width, height);
  }
}
