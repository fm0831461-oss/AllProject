import 'package:dio/dio.dart';
import 'package:project1/Weather/Model/we_auth_model.dart';

class AuthServices {
  static Dio dio = Dio();
  static Future<WeAuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return WeAuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error${other.toString()}");
    }
  }

  static Future<WeAuthModel> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Email": email,
          "Password": password,
          "Name": name,
          "Phone": phone,
        },
      );
      return WeAuthModel.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error${other.toString()}");
    }
  }
}
