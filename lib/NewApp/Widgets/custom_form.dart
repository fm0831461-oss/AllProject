import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final Widget sufixIcon;
  final TextEditingController controller;
  final bool obscure;
  final bool isPass;
  const CustomForm({
    super.key,
    required this.controller,
    required this.isPass,
    required this.label,
    required this.prefixIcon,
    required this.sufixIcon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "PLS fill data";
          } else if (label == "Name" && value.length < 3) {
            return "more than 3";
          } else if (label == "Password" && value.length < 8) {
            return "more than 8";
          } else if (label == "Email" && !value.contains("@gmail.com")) {
            return "email in valid";
          }
          return null;
        },
        obscureText: isPass && !obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: sufixIcon,
        ),
      ),
    );
  }
}
