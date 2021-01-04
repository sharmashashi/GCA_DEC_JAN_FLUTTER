import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: Get.width * .05),
      height: Get.height * .30,
      width: Get.width * .9,
      color: Colors.blue,
      child: Stack(
        children: [
          _bottomCard(),
          _movieCover(),
        ],
      ),
    );
  }

  Widget _bottomCard() {
    return SizedBox();
  }

  Widget _movieCover() {
    return SizedBox();
  }
}
