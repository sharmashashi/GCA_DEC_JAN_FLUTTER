import 'package:flutter/material.dart';
import 'package:fluttergca/utils/custom_color.dart';
import 'package:get/state_manager.dart';

class MoviesController extends GetxController {
  // Color selectedTabColor = CustomColors.orange;
  // Color unselectedTabColor = CustomColors.lightPurple;

  int currentIndex = 0;

  onTabClick(int index) {
    currentIndex = index;
    update();
  }
}
