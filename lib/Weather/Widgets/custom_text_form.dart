import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String label;
  final Widget? sufixIcon;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscure;
  final bool isPass;
  const CustomTextForm({
    super.key,
    required this.controller,
    required this.isPass,
    required this.label,
    required this.prefixIcon,
    this.sufixIcon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
