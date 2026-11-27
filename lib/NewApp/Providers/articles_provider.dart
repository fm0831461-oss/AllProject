import 'package:flutter/material.dart';
import 'package:project1/NewApp/Models/article_model.dart';
import 'package:project1/NewApp/Services/articles_services.dart';

class ArticlesProvider extends ChangeNotifier {
  Article? article;
  Future<void> getNews() async {
    article = await ArticlesServices.getData();
    notifyListeners();
  }

  Future<void> search({required String news}) async {
    if (news.isEmpty) return;
    article = await ArticlesServices.search(news: news);
    notifyListeners();
  }
}
