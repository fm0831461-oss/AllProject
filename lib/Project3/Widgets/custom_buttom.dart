import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButtom({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 14, 113, 155),
        ),
        child: Text(
          text,
          style: TextStyle(fontWeight: .bold, color: Colors.white),
        ),
      ),
    );
  }
}
