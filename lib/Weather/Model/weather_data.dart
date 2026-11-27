class WeatherData {
  final String countryImageUrl;
  final String weatherImageUrl;
  final String tempreature;
  final String name;

  WeatherData({
    required this.countryImageUrl,
    required this.weatherImageUrl,
    required this.tempreature,
    required this.name,
  });
}

class Weather {
  final List<WeatherData> data;

  Weather({required this.data});
  factory Weather.fromJson(Map<String, dynamic> json) {
    final tempList = json["country"]
        .map<WeatherData>(
          (item) => WeatherData(
            countryImageUrl: item["countryImageUrl"],
            weatherImageUrl: item["weatherImageUrl"],
            tempreature: item["tempreature"],
            name: item["name"],
          ),
        )
        .toList();
    return Weather(data: tempList);
  }
}
