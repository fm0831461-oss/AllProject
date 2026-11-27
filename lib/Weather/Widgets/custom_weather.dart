import 'package:flutter/material.dart';
import 'package:project1/Weather/Model/weather_data.dart';
import 'package:project1/Weather/Screens/details_app.dart';

class CustomWeather extends StatelessWidget {
  final WeatherData data;
  const CustomWeather({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsApp(data: data)),
        );
      },
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: Image.network(data.countryImageUrl),
          title: Text(data.name),
          subtitle: Text(data.tempreature),
        ),
      ),
    );
  }
}
