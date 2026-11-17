import 'package:flutter/material.dart';
import 'package:project1/Project3/Providers/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final bool isPass;
  final IconData prefixIcon;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.isPass,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<AuthProvider>();
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPass && !logProvider.isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: isPass
            ? IconButton(
                onPressed: logProvider.togglePasswordVisibility,
                icon: Icon(
                  logProvider.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
