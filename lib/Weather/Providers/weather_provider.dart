import 'package:flutter/material.dart';
import 'package:project1/Weather/Model/weather_data.dart';
import 'package:project1/Weather/Services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  Future<void> get() async {
    weather = await WeatherService.get();
    notifyListeners();
  }
}
