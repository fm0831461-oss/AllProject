import 'package:dio/dio.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';

class UserServices {
  static Dio dio = Dio();
  static Future<user> getUsers() async {
    try {
      Response response = await dio.get("http://randomuser.me/api/?results=50");
      return user.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error ${other.toString()}");
    }
  }
}
