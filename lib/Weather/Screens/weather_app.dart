import 'package:flutter/material.dart';
import 'package:project1/Weather/Providers/weather_provider.dart';
import 'package:project1/Weather/Widgets/custom_weather.dart';
import 'package:provider/provider.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, value, child) {
          final data = value.weather?.data;
          if (data == null) {
            value.get();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => CustomWeather(data: data[index]),
            );
          }
        },
      ),
    );
  }
}
