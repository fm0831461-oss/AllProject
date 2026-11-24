import 'package:dio/dio.dart';
import 'package:project1/NewApp/Models/auth_model.dart';

class AuthServices {
  static Dio dio = Dio();
  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return AuthModel.fromhjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error ${other.toString()}");
    }
  }

  static Future<AuthModel> sign({
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
          "Phone": phone,
          "Name": name,
        },
      );
      return AuthModel.fromhjson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error ${other.toString()}");
    }
  }
}
