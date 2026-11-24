import 'package:flutter/material.dart';
import 'package:project1/NewApp/Providers/auth_provider.dart';
import 'package:project1/NewApp/Screens/home_screen.dart';
import 'package:project1/NewApp/Widgets/custom_form.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final GlobalKey<FormState> ckey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final logpro = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: Text("Login")),
      body: Form(
        key: ckey,
        child: Column(
          children: [
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
                onPressed: logpro.toggle,
                icon: Icon(
                  logpro.isPass ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (!ckey.currentState!.validate()) return;

                final success = await logpro.login(
                  email: email.text,
                  password: password.text,
                );

                if (!context.mounted) return;

                if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(logpro.auth?.message ?? "Login Failed"),
                    ),
                  );
                }

                if (!context.mounted) return;
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
