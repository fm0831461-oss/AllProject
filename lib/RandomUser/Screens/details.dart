// import 'package:flutter/material.dart';
// import 'package:project1/RandomUser/DataModels/data_model.dart';

// class Details extends StatelessWidget {
//   final DataModel data;
//   const Details({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Text("User Deatials"),
//       ),
//       body: Center(
//         child: Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(data.imgeUrl),
//                 backgroundColor: Colors.grey.shade200,
//               ),
//               SizedBox(height: 12),
//               Text(
//                 data.name,
//                 style: const TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 12),
//               Row(children: [Icon(Icons.email), Text(data.email)]),
//               const SizedBox(height: 12),
//               Row(children: [Icon(Icons.location_on), Text(data.address)]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';

class Details extends StatelessWidget {
  final DataModel data;
  const Details({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("User Deatials"),
      ),
      body: Center(
        child: Card(
          // elevation: 10,
          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(data.imgeUrl),
                radius: 50,
              ),

              SizedBox(height: 20),
              Text(data.name),
              SizedBox(height: 20),
              Row(children: [Icon(Icons.email), Text(data.email)]),
              SizedBox(height: 12),
              Row(children: [Icon(Icons.location_on), Text(data.address)]),
            ],
          ),
        ),
      ),
    );
  }
}
