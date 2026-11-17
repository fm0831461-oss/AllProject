import 'package:flutter/material.dart';
import 'package:project1/Project3/DataModels/auth_model.dart';
import 'package:project1/Project3/Services/login_services.dart';
import 'package:project1/Project3/Services/sign_services.dart';

class AuthProvider extends ChangeNotifier {
  Auth? auth;

  bool isLoading = false;
  String? errorMessage;

  // Text Controllers
  final controllerUser = TextEditingController();
  final controllerPass = TextEditingController();

  // Password Visibility
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  // Username Validation
  String? validUser(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter username";
    }
    return null;
  }

  // Password Validation
  String? validPass(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    return null;
  }

  // Login
  Future<void> login(String username, String password) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      auth = await LoginServices.login(username, password);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Signup
  Future<void> signup(
    String firstName,
    String lastName,
    String email,
    String username,
    String password,
  ) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      auth = await SignServices.signup(
        firstName,
        lastName,
        email,
        username,
        password,
      );
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controllerUser.dispose();
    controllerPass.dispose();
    super.dispose();
  }
}
