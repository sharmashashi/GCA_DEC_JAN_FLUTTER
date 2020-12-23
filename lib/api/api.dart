import 'dart:convert';

import 'package:fluttergca/models/jsonplaceholdermodel.dart';
import 'package:http/http.dart';

class API {
  static Future<List<JsonPlaceholderModel>> fetchPost() async {
    String url = "https://jsonplaceholder.typicode.com/posts";

    Response response = await get(url);

    List list = jsonDecode(response.body);
    List<JsonPlaceholderModel> responseModelList = List();
    for (var each in list) {
      JsonPlaceholderModel model =
          JsonPlaceholderModel(body: each['body'], title: each['title']);
      responseModelList.add(model);
    }
    return responseModelList;
  }
}
