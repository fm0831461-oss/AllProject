import 'package:flutter/material.dart';

class Customlist extends StatelessWidget {
  final String name;
  final String time;
  const Customlist({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black12,
      child: ListTile(
        leading: Icon(Icons.mosque_outlined),
        title: (Text(name)),
        trailing: Text(time),
      ),
    );
  }
}
