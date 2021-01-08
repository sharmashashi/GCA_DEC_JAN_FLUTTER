import 'package:flutter/foundation.dart';
import 'package:fluttergca/model/listmovies.dart';
import 'package:fluttergca/model/movie_details.dart';
import 'package:fluttergca/model/movie_suggestion.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class Api {
  static Future<ListMovies> listMovies({@required String genre}) async {
    String url = "https://yts.mx/api/v2/list_movies.json?genre=$genre";

    http.Response response = await http.get(url);

    //  ListMovies model =  ListMovies.fromJson(response.body);
    return ListMovies.fromJson(response.body);
  }

  static Future<MovieSuggestion> searchMovies(
      {@required String queryTerm}) async {
    String url = "https://yts.mx/api/v2/list_movies.json?query_term=$queryTerm";
    http.Response response = await http.get(url);
    print(response.body);
    Map map = jsonDecode(response.body);
    MovieSuggestion movieSuggestion;
    if (map['data']['movie_count'] == 0) {
      String customJsonResponse =
          '{"status":"ok","status_message":"Query was successful","data":{"movie_count":0,"movies":[],"limit":20,"page_number":1},"@meta":{"server_time":1610110617,"server_timezone":"CET","api_version":2,"execution_time":"0 ms"}}';
      movieSuggestion = MovieSuggestion.fromJson(customJsonResponse);
    } else {
      movieSuggestion = MovieSuggestion.fromJson(response.body);
    }
    //  ListMovies model =  ListMovies.fromJson(response.body);

    return movieSuggestion;
  }

  static Future<MovieDetails> movieDetails({@required int id}) async {
    String url =
        "https://yts.mx/api/v2/movie_details.json?movie_id=$id&with_cast=true";

    http.Response response = await http.get(url);

    //  ListMovies model =  ListMovies.fromJson(response.body);
    return MovieDetails.fromJson(response.body);
  }
}
