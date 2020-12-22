import 'package:flutter/material.dart';
import 'package:fluttergca/models/feedmodel.dart';
import 'package:fluttergca/screens/custom_card/customcard.dart';
import 'package:get/state_manager.dart';

class FeedsController extends GetxController {
  String _descriptionText =
      "Pamper your pooch. The Bark Shoppe is a pet care facility in New York offering grooming products and makeovers with your pet's individual needs in mind. Take a look and shop now to #BuyBlack:";
  String _link = "https://bit.ly/BarkShoppe #LiftBlackVoices";
  String _hashtag = "#MoreTogether";

  String _reactionCounts = "5.3";
  String _comments = "525";
  String _shares = "187";

  FeedsController() {
    init();
  }

  

  List<Widget> _cards = [
    Center(
      child: CircularProgressIndicator(),
    )
  ];
  List<Widget> get cards => _cards;

  init() async {
    await _loadCards();
    update();
  }

  List<Widget> tempList = List();
  Future<void> _loadCards() async {
    await Future.delayed(Duration(seconds: 2));
    for (int i = 0; i < 10; i++) {
      FeedModel model = FeedModel(
          description: _descriptionText,
          link: _link,
          hashtag: _hashtag,
          reacations: _reactionCounts,
          comments: _comments,
          shares: _shares);

      tempList.add(CustomCard(model));
    }
    _cards = tempList;
  }
}
