import 'package:dio/dio.dart';
import 'package:project1/NewApp/Models/article_model.dart';

class ArticlesService {
  static Dio dio = Dio();
  static Future<Articles> fetchData() async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Articles.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("Other error: ${other.toString()}");
    }
  }

  static Future<Articles> searchNews({required String query}) async {
    try {
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$query&apiKey=a410b1724f84452c8df8a810efe34642",
      );
      return Articles.fromjson(response.data);
    } on DioException catch (dioError) {
      throw Exception("Network error: ${dioError.message}");
    } catch (otherError) {
      throw Exception("Something went wrong: $otherError");
    }
  }
}
