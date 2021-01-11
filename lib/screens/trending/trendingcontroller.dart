import 'package:fluttergca/api/api.dart';
import 'package:fluttergca/custom_widgets/trending_card.dart';
import 'package:fluttergca/model/listmovies.dart' as lm;
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class TrendingController extends GetxController {
  TrendingController() {
    getTrendingList();
    getRecentList();
  }

  List<Widget> trendingList = [
    for (int i = 0; i < 5; i++) _inProgressTrendingCard()
  ];

  List<lm.Movie> recentList = List();

  getRecentList() async {
    lm.ListMovies listMovies = await Api.recentMovies();
    List<lm.Movie> tempList = List();
    for (lm.Movie each in listMovies.data.movies) {
      tempList.add(each);
    }
    recentList = tempList;
    update();
  }

  getTrendingList() async {
    lm.ListMovies listMovies = await Api.trendingMovies();
    List<Widget> tempList = List();
    for (lm.Movie each in listMovies.data.movies) {
      tempList.add(TrendingCard(isInProgress: false, movieModel: each));
    }
    trendingList = tempList;
    update();
  }

  static _inProgressTrendingCard() => TrendingCard(isInProgress: true);
}
