import 'package:dio/dio.dart';
import 'package:project1/Project3/DataModels/auth_model.dart';

class LoginServices {
  static Dio dio = Dio();
  static Future<Auth> login(String username, String password) async {
    try {
      Response response = await dio.post(
        "https://dummyjson.com/auth/login",
        data: {"username": username, "password": password},
      );
      return Auth.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherException) {
      throw Exception("otherException ${otherException.toString()}");
    }
  }
}
