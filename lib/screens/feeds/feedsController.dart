import 'package:flutter/material.dart';
import 'package:fluttergca/api/api.dart';
import 'package:fluttergca/models/feedmodel.dart';
import 'package:fluttergca/models/jsonplaceholdermodel.dart';
import 'package:fluttergca/screens/custom_card/customcard.dart';
import 'package:fluttergca/screens/detailed_page/detailed_page.dart';
import 'package:get/get.dart';

class FeedsController extends GetxController {
  String _link = "https://bit.ly/BarkShoppe #LiftBlackVoices";
  String _hashtag = "#MoreTogether";

  String _reactionCounts = "5.3";
  String _comments = "525";
  String _shares = "187";

  FeedsController() {
    refresh();
  }

  List<Widget> _cards = [
    Center(
      child: CircularProgressIndicator(),
    )
  ];
  List<Widget> get cards => _cards;

  Future<void> refresh() async {
    await _loadCards();
    update();
  }

  List<Widget> tempList = List();
  Future<void> _loadCards() async {
    // await Future.delayed(Duration(seconds: 2));
    List<JsonPlaceholderModel> modelList = await API.fetchPost();
    for (int i = 0; i < modelList.length; i++) {
      FeedModel model = FeedModel(
          description: modelList[i].body,
          link: _link,
          hashtag: _hashtag,
          pagename: "Facebook App",
          reacations: _reactionCounts,
          comments: _comments,
          shares: _shares);

      tempList.add(GestureDetector(
          onTap: () {
            Get.to(DetailedPage(model));
          },
          child: CustomCard(model)));
    }
    _cards = tempList;
  }
}
