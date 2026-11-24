import 'package:flutter/material.dart';
import 'package:project1/Weather/Model/we_auth_model.dart';
import 'package:project1/Weather/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  WeAuthModel? authModel;
  bool isPass = true;
  Future<bool> login({required String email, required String password}) async {
    final response = await AuthServices.login(email: email, password: password);
    authModel = response;
    return response.status;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final response = await AuthServices.signUp(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    authModel = response;
    return response.status;
  }

  void toggle() {
    isPass = !isPass;
    notifyListeners();
  }
}
