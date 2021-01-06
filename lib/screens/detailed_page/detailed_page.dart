import 'package:flutter/material.dart';
import 'package:fluttergca/screens/detailed_page/cover_with_title.dart';
import 'package:fluttergca/utils/custom_color.dart';
import 'package:get/get.dart';

class DetailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(child: _body());
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(Get.context).padding.top),
        CoverWithTitle(),
        SizedBox(
          height: 10,
        ),
        _rating(),
        _details(),
        _storyLine(),
      ],
    );
  }

  Widget _storyLine() {
    final _description =
        "As hicup fulfills his dream of creating a peaceful dragon utopia. Toothless discovery of an untamed.";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Storyline",
              style: TextStyle(
                  color: CustomColors.primaryBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          SizedBox(height: 15),
          Text(
            _description,
            style: TextStyle(color: Colors.grey.shade700),
          )
        ],
      ),
    );
  }

  Widget _details() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _detailsText(),
          SizedBox(
            width: 20,
          ),
          _movieCover(),
        ],
      ),
    );
  }

  Widget _detailsText() {
    return SizedBox(
      width: Get.width * .55,
      height: Get.height * .25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _eachdetailsText(lable: "Release date: ", content: "January 9, 2019"),
          _eachdetailsText(lable: "Director: ", content: "Dean DeBlois"),
          _eachdetailsText(
              lable: "Writes: ", content: "Dean DeBlois, Cressida Cowell"),
        ],
      ),
    );
  }

  _eachdetailsText({String lable, String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable,
            style: TextStyle(
              color: CustomColors.primaryBlue,
            )),
        Flexible(
          child: Text(content,
              style: TextStyle(
                  color: CustomColors.primaryBlue,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }

  Widget _movieCover() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/dog.jpg",
          height: Get.height * .3,
          width: Get.width * .35,
          fit: BoxFit.fitHeight,
        ));
  }

  Widget _rating() {
    TextStyle style = TextStyle(
        color: CustomColors.primaryBlue,
        fontWeight: FontWeight.bold,
        fontSize: 18);
    return Column(
      children: [
        Text("7.6/10", style: style),
        Text(
          "IMDb",
          style: style,
        )
      ],
    );
  }
}
