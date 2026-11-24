import 'package:flutter/material.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';
import 'package:project1/RandomUser/Screens/details.dart';

class CustomUser extends StatelessWidget {
  final UserModel model;
  const CustomUser({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Details(model: model)),
      ),
      child: Card(
        elevation: 10,
        shadowColor: Colors.black87,
        child: ListTile(
          leading: Image.network(model.imgeUrl),
          title: Text(model.name),
          subtitle: Text(model.email),
        ),
      ),
    );
  }
}
