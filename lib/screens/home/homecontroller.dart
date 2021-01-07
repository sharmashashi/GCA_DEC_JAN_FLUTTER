import 'package:flutter/material.dart';
import 'package:fluttergca/screens/movies/movies.dart';
import 'package:fluttergca/screens/trending/trending.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  int navbarIndex = 0;

  onNavbarItemTap(int index) {
    navbarIndex = index;
    update();
  }

  List<Widget> _homePages = [Movies(), Trending()];

  Widget get homePage => _homePages[navbarIndex];
}
