import 'package:flutter/material.dart';
import 'package:project1/Weather/Model/weather_data.dart';

class DetailsApp extends StatelessWidget {
  final WeatherData data;
  const DetailsApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("details Weather"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(16),
            elevation: 10,
            child: Column(
              children: [
                Image.network(
                  data.weatherImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image, size: 100),
                ),
                SizedBox(height: 10),
                Text(data.name),
                SizedBox(height: 10),
                Text(data.tempreature),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:project1/Weather/Model/weather_data.dart';

// class DetailsApp extends StatelessWidget {
//   final WeatherData data;

//   const DetailsApp({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepOrange,
//         title: Text("Weather Details"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Card(
//           elevation: 10,
//           margin: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.network(
//                 data.weatherImageUrl,
//                 // height: 200,
//                 // width: double.infinity,
//                 // fit: BoxFit.cover,
//               ),
//               SizedBox(height: 15),
//               Text(data.name),
//               SizedBox(height: 10),
//               Text(data.tempreature),
//               // SizedBox(height: 10),
//               // Text(data.weatherImageUrl),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
