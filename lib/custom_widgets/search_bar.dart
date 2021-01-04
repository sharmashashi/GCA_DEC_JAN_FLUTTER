import 'package:flutter/material.dart';
import 'package:fluttergca/utils/custom_color.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
  final border = OutlineInputBorder(borderRadius: BorderRadius.circular(100));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        width: Get.width * .8,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: CustomColors.background,
              // contentPadding: EdgeInsets.only(left:20),
              isDense: true,
              hintText: "Type something",
              focusedBorder: border,
              enabledBorder: border),
        ),
      ),
    );
  }
}
