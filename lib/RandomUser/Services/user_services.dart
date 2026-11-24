import 'package:dio/dio.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';

class UserServices {
  static Dio dio = Dio();
  static Future<Users> getUsers() async {
    try {
      Response response = await dio.get("http://randomuser.me/api/?results=50");
      return Users.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherExptions) {
      throw Exception("other Error${otherExptions.toString()}");
    }
  }
}
