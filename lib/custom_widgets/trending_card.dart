import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0), child: _background());
  }

  Widget _background() {
    return SizedBox(
      height: Get.height * .25,
      width: Get.width * .8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/dog.jpg",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
