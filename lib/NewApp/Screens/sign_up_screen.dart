import 'package:flutter/material.dart';
import 'package:project1/NewApp/Providers/auth_provider.dart';
import 'package:project1/NewApp/Screens/login_screen.dart';
import 'package:project1/NewApp/Widgets/custom_form.dart';

import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> ckey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final signpro = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text("Sign Up")),
      body: SingleChildScrollView(
        child: Form(
          key: ckey,
          child: Column(
            children: [
              CustomForm(
                controller: name,
                isPass: false,
                label: "Name",
                prefixIcon: Icons.person,
                sufixIcon: Icon(Icons.person),
              ),
              CustomForm(
                controller: email,
                isPass: false,
                label: "Email",
                prefixIcon: Icons.email,
                sufixIcon: Icon(Icons.email),
              ),
              CustomForm(
                controller: password,
                isPass: true,
                label: "Password",
                prefixIcon: Icons.lock,
                sufixIcon: IconButton(
                  onPressed: signpro.toggle,
                  icon: Icon(
                    signpro.isPass ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              CustomForm(
                controller: phone,
                isPass: false,
                label: "Phone",
                prefixIcon: Icons.phone,
                sufixIcon: Icon(Icons.phone),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!ckey.currentState!.validate()) return;
                  final succses = await signpro.sign(
                    email: email.text,
                    password: password.text,
                    name: name.text,
                    phone: phone.text,
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(signpro.auth?.message ?? "try again"),
                      backgroundColor: succses ? Colors.green : Colors.red,
                    ),
                  );
                  if (succses) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
