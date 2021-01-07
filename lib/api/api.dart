import 'package:flutter/foundation.dart';
import 'package:fluttergca/model/listmovies.dart';
import 'package:fluttergca/model/movie_details.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<ListMovies> listMovies() async {
    String url = "https://yts.mx/api/v2/list_movies.json";

    http.Response response = await http.get(url);

    //  ListMovies model =  ListMovies.fromJson(response.body);
    return ListMovies.fromJson(response.body);
  }

  static Future<MovieDetails> movieDetails({@required int id}) async {
    String url =
        "https://yts.mx/api/v2/movie_details.json?movie_id=$id&with_cast=true";

    http.Response response = await http.get(url);

    //  ListMovies model =  ListMovies.fromJson(response.body);
    return MovieDetails.fromJson(response.body);
  }
}
