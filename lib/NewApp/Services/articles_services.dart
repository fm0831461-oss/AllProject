import 'package:dio/dio.dart';
import 'package:project1/NewApp/Models/article_model.dart';

class ArticlesServices {
  static Dio dio = Dio();
  static Future<Article> getData() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Article.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error${other.toString()}");
    }
  }

  static Future<Article> search({required String news}) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$news&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Article.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error ${other.toString()}");
    }
  }
}
