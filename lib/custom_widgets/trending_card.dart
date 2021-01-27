import 'package:flutter/material.dart';
import 'package:fluttergca/model/listmovies.dart' as lm;
import 'package:fluttergca/screens/detailed_page/detailed_page.dart';
import 'package:get/get.dart';

class TrendingCard extends StatelessWidget {
  final bool isInProgress;
  final lm.Movie movieModel;
  TrendingCard({@required this.isInProgress, this.movieModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isInProgress == false) {
          Get.to(DetailedPage(movieModel));
        }
      },
      child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
              height: Get.height * .25,
              width: Get.width * .8,
              child: isInProgress == true
                  ? Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            spreadRadius: 0.5,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: CircularProgressIndicator()))
                  : Stack(
                      children: [
                        _background(),
                        _opacity(),
                        _movieInfo(),
                      ],
                    ))),
    );
  }

  Widget _opacity() {
    return Opacity(
      opacity: 0.3,
      child: Container(
        height: Get.height * .25,
        width: Get.width * .8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _movieInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(),
              SizedBox(
                height: 10,
              ),
              _duration(),
            ],
          ),
          _genres(),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      text: TextSpan(
          text: movieModel.titleEnglish,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: "(${movieModel.year})",
                style: TextStyle(color: Colors.grey.shade300, fontSize: 14))
          ]),
    );
  }

  Widget _duration() {
    return Text("${movieModel.runtime} min",
        style: TextStyle(color: Colors.grey.shade300));
  }

  Widget _genres() {
    return Container(
      // color: Colors.blue,
      height: 40,
      width: Get.width * .55,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [for (String genre in movieModel.genres) _eachGenre(genre)],
        ),
      ),
    );
  }

  Widget _eachGenre(String genre) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.black26),
        child: Text(
          genre,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ));
  }

  Widget _background() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        movieModel.mediumCoverImage,
        fit: BoxFit.fitWidth,
        width: Get.width * .8,
      ),
    );
  }
}
