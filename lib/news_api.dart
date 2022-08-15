import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model.dart';

Future<List<NewsApiModel>> getNews() async {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=2099df5a2f164da4b6c140cbf7f3506f");

  final response = await http.get(uri);

  if (response.statusCode == 200 || response.statusCode == 201) {
    Map<String, dynamic> map = json.decode(response.body);

    List _articalsList = map['articles'];

    List<NewsApiModel> newsList = _articalsList
        .map((jsonData) => NewsApiModel.fromJson(jsonData))

        .toList();

    print(_articalsList);

    return newsList;
  } else {
    print("error");
    return [];
  }
}