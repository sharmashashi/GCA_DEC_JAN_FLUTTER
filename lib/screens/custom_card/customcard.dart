import 'package:flutter/material.dart';
import 'package:fluttergca/models/feedmodel.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final FeedModel feedModel;
  CustomCard(this.feedModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _activity(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _description(),
          ),
          _image(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _actions(),
          )
        ],
      ),
    );
  }

  Widget _activity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _logo(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: _pageActivity(),
        ),
        _more()
      ],
    );
  }

  Widget _logo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Get.width * .12),
      child: Image.asset("assets/facebook.png", height: Get.width * .12),
    );
  }

  Widget _pageActivity() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Row(
              children: [
                Text(feedModel.pagename,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 15,
                  ),
                )
              ],
            ),
            Text("updated their cover photo.")
          ],
        ),
        _postedDate()
      ],
    );
  }

  Widget _postedDate() {
    Color color = Colors.grey.shade700;
    return Row(
      children: [
        Text("Aug 26", style: TextStyle(color: color, fontSize: 12)),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 5,
          width: 5,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        Icon(Icons.public, color: color, size: 15),
      ],
    );
  }

  Widget _more() {
    return Icon(
      Icons.more_horiz,
      color: Colors.grey.shade800,
    );
  }

  Widget _description() {
    TextStyle _clickableTextStyle = TextStyle(color: Colors.blue);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          feedModel.description,
        ),
        Text(
          feedModel.link,
          style: _clickableTextStyle,
        ),
        Text(
          feedModel.hashtag,
          style: _clickableTextStyle,
        )
      ],
    );
  }

  Widget _image() {
    return Image.asset(
      "assets/dog.jpg",
      height: Get.height * .3,
      fit: BoxFit.fitHeight,
    );
  }

  Widget _actions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _postData(),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
        _actionButtons()
      ],
    );
  }

  Widget _postData() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_reactions(), _commentsShares()],
    );
  }

  Widget _reactions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _reactionIcons(),
        SizedBox(
          width: 10,
        ),
        Text(feedModel.reacations + "K")
      ],
    );
  }

  Widget _reactionIcons() {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          Positioned(
              right: 0,
              child: _stackIconBuilder(Icons.favorite,
                  backgroundColor: Colors.red)),
          _stackIconBuilder(Icons.thumb_up, backgroundColor: Colors.blue)
        ],
      ),
    );
  }

  Widget _stackIconBuilder(IconData iconData, {Color backgroundColor}) {
    return Container(
      margin: EdgeInsets.only(right: iconData == Icons.thumb_up ? 5 : 0),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(
        iconData,
        size: 15,
        color: Colors.white,
      ),
    );
  }

  Widget _commentsShares() {
    TextStyle textStyle = TextStyle(color: Colors.grey.shade700);
    return Text(
      "${feedModel.comments} Comments \u2022 ${feedModel.shares} Shares",
      style: textStyle,
    );
  }

  Widget _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _eachActionButton(Icons.thumb_up, "Like"),
        _eachActionButton(Icons.comment, "Comment"),
        _eachActionButton(Icons.share, "Shares"),
      ],
    );
  }

  Widget _eachActionButton(IconData iconData, String action) {
    return Row(
      children: [
        Icon(iconData, color: Colors.grey.shade700),
        SizedBox(
          width: 5,
        ),
        Text(action, style: TextStyle(color: Colors.grey.shade700))
      ],
    );
  }
}
