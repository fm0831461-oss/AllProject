import 'package:dio/dio.dart';
import 'package:project1/Project3/DataModels/auth_model.dart';

class SignServices {
  static Dio dio = Dio();
  static Future<Auth> signup(
    String firstName,
    String lastName,
    String email,
    String username,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        "https://dummyjson.com/users/add",
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "username": username,
          "password": password,
        },
      );
      return Auth.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherException) {
      throw Exception("Other Error ${otherException.toString()}");
    }
  }
}
