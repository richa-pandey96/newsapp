import 'dart:convert';
import 'package:newsapp/models/articles_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news=[];

  Future<void> getNews() async {
    var url =Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=2000422e3f5b4ba0a3bd40d7c6093bc");
    var response =await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          print(element["urlToImage"]);
          print(element["description"]);
          ArticleModel articleModel = new ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'].toString(),
            url: element['url'],
            urlToImage: element['urlToImage'].toString(),
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    category=category.toLowerCase();
    print((category.runtimeType));
    print(category);
    print(category.length);

    var url =Uri.parse('http://newsapi.org/v2/top-headlines?category=$category&country=ph&category=business&apiKey=3699636a771049aca38ea30dd4ac1344');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          print(element["urlToImage"]);
          print(element["description"]);
          ArticleModel articleModel = new ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'].toString(),
            url: element['url'],
            urlToImage: element['urlToImage'].toString(),
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}


