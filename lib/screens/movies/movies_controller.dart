import 'package:flutter/material.dart';
import 'package:fluttergca/api/api.dart';
import 'package:fluttergca/custom_widgets/movie_card.dart';
import 'package:fluttergca/model/listmovies.dart';
import 'package:get/state_manager.dart';

class MoviesController extends GetxController {
  // Color selectedTabColor = CustomColors.orange;
  // Color unselectedTabColor = CustomColors.lightPurple;

  MoviesController() {
    _getMovieList();
  }

  List<Widget> _movieList = [Center(child: CircularProgressIndicator())];
  List<Widget> get movieList => _movieList;

  int currentIndex = 0;

  onTabClick(int index) {
    currentIndex = index;
    update();
  }

  _getMovieList() async {
    ListMovies listMovies = await Api.listMovies();

    List<Widget> _tempList = List();
    for (var eachMovie in listMovies.data.movies) {
      _tempList.add(MovieCard(eachMovie));
    }
    _movieList = _tempList;
    update();
  }
}
