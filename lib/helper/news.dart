import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutternews/models/article_model.dart';

class News{

  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=daa3218f2a32449fa3ef50e69dd423d5';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context']
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass{

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url = 'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=daa3218f2a32449fa3ef50e69dd423d5';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['context']
          );
          news.add(articleModel);
        }
      });
    }
  }
}