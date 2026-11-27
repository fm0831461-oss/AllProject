import 'package:flutter/material.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';
import 'package:project1/RandomUser/Screens/details.dart';

class CustomUser extends StatelessWidget {
  final DataModel data;
  const CustomUser({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(data: data)),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.network(data.imgeUrl),
          title: Text(data.name),
          subtitle: Text(data.email),
        ),
      ),
    );
  }
}
