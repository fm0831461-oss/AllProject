import 'package:flutter/widgets.dart';
import 'package:project1/NewApp/Models/auth_model.dart';
import 'package:project1/NewApp/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  AuthModel? auth;
  bool isPass = false;
  Future<bool> login({required String email, required String password}) async {
    final response = await AuthServices.login(email: email, password: password);
    auth = response;
    return response.status;
  }

  Future<bool> sign({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    final response = await AuthServices.sign(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    auth = response;
    return response.status;
  }

  void toggle() {
    isPass = !isPass;
    notifyListeners();
  }
}
