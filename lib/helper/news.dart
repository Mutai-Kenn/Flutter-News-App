import 'dart:convert';
import 'package:myapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=gb&category=business&apiKey=788a317f81054eeb97cd0de7c12f85ae";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              // publishedAt: element['publishedAt'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=gb&category=$category&apiKey=788a317f81054eeb97cd0de7c12f85ae";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              // publishedAt: element['publishedAt'],
              content: element['content']);

          news.add(articleModel);
        }
      });
    }
  }
}
