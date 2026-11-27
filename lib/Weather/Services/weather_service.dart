import 'package:dio/dio.dart';
import 'package:project1/Weather/Model/weather_data.dart';

class WeatherService {
  static Dio dio = Dio();
  static Future<Weather> get() async {
    try {
      Response response = await dio.get(
        "https://iats.runasp.net/api/Country/GetCountries",
      );
      return Weather.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (other) {
      throw Exception("other error${other.toString()}");
    }
  }
}
