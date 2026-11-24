import 'package:flutter/foundation.dart';
import 'package:project1/NewApp/Models/article_model.dart';
import 'package:project1/NewApp/Services/articles_services.dart';

class ArticleProvider extends ChangeNotifier {
  Articles? dataModel;

  Future<void> getNews() async {
    dataModel = await ArticlesService.fetchData();
    notifyListeners();
  }

  Future<void> searchArticles({required String query}) async {
    if (query.isEmpty) return;

    dataModel = await ArticlesService.searchNews(query: query);
    notifyListeners();
  }
}
