import 'package:flutter/material.dart';
import 'package:project1/Project2/DataModels/data_model.dart';
import 'package:project1/Project2/Services/user_services.dart';

class UserProvider extends ChangeNotifier {
  Users? users;
  Future<void> resquestUser() async {
    users = await UserServices.getUsers();
    notifyListeners();
  }
}
