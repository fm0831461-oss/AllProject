import 'package:flutter/material.dart';
import 'package:project1/Project2/Providor/user_provider.dart';
import 'package:project1/Project2/Widgets/custom_user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<UserProvider>(
          builder: (context, value, child) {
            final data = value.users?.users;
            if (data == null) {
              value.resquestUser();
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => CustomUser(model: data[index]),
              );
            }
          },
        ),
      ),
    );
  }
}
