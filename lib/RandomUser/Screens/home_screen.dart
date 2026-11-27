import 'package:flutter/material.dart';
import 'package:project1/RandomUser/Providor/user_provider.dart';
import 'package:project1/RandomUser/Widgets/custom_user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Random User"),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final data = value.users?.users;
          if (data == null) {
            value.get();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => CustomUser(data: data[index]),
            );
          }
        },
      ),
    );
  }
}
