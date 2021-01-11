import 'package:flutter/material.dart';
import 'package:fluttergca/model/listmovies.dart';
import 'package:fluttergca/model/movie_details.dart' as md;
import 'package:fluttergca/screens/detailed_page/cover_with_title.dart';
import 'package:fluttergca/screens/detailed_page/detailed_page_controller.dart';
import 'package:fluttergca/utils/custom_color.dart';
import 'package:get/get.dart';

class DetailedPage extends StatelessWidget {
  DetailedPageController detailedPageController;
  final Movie movie;
  DetailedPage(this.movie);
  @override
  Widget build(BuildContext context) {
    detailedPageController = DetailedPageController(movie.id);
    return Scaffold(
      body: _body(),
      floatingActionButton: _floatingBtn(),
    );
  }

  Widget _floatingBtn() {
    return FloatingActionButton(
      onPressed: () {
        Get.dialog(_downloadDialog());
      },
      child: Icon(Icons.file_download, color: Colors.white),
      backgroundColor: Colors.green.shade800,
    );
  }

  Widget _downloadDialog() {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(10),
      title: Text("Download your movie"),
      children: [for (var each in movie.torrents) _eachTorrentDownloader(each)],
    );
  }

  Widget _eachTorrentDownloader(Torrent torrent) {
    TextStyle style =
        TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
    return MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          detailedPageController.downloadTorrent(movie.title, torrent.url);
        },
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${torrent.quality}, ", style: style),
            SizedBox(width: 10),
            Text(torrent.size, style: style)
          ],
        ));
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(Get.context).padding.top),
          CoverWithTitle(movie),
          SizedBox(
            height: 10,
          ),
          _rating(),
          _details(),
          _storyLine(),
          _fullCast(),
        ],
      ),
    );
  }

  Widget _fullCast() {
    return GetBuilder(
      init: detailedPageController,
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Full cast",
                style: TextStyle(
                    color: CustomColors.primaryBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _castList(controller)
          ],
        ),
      ),
    );
  }

  Widget _castList(DetailedPageController controller) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.casts.length == 0
              ? [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ]
              : [
                  for (var eachCast in controller.casts)
                    _eachCastMember(eachCast)
                ]),
    );
  }

  Widget _eachCastMember(md.Cast cast) {
    double imageSize = Get.width * .2;
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cast.urlSmallImage != null
                  ? cast.urlSmallImage
                  : "https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png",
              height: imageSize,
              width: imageSize,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            cast.name,
            style: TextStyle(
                color: CustomColors.primaryBlue, fontWeight: FontWeight.bold),
          ),
          Text(
            cast.characterName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget _storyLine() {
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
            movie.descriptionFull,
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
          _eachdetailsText(lable: "Release date: ", content: "${movie.year}"),
          _eachdetailsText(lable: "Director: ", content: ""),
          _eachdetailsText(lable: "Writes: ", content: ""),
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
        child: Image.network(
          movie.mediumCoverImage,
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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${movie.rating}/10", style: style),
          Text(
            "IMDb",
            style: style,
          )
        ],
      ),
    );
  }
}
