import 'package:flutter/material.dart';
import 'package:project1/RandomUser/DataModels/data_model.dart';
import 'package:project1/RandomUser/Services/user_services.dart';

class UserProvider extends ChangeNotifier {
  user? users;
  Future<void> get() async {
    users = await UserServices.getUsers();
    notifyListeners();
  }
}
