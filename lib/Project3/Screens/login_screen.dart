import 'package:flutter/material.dart';
import 'package:project1/Project3/Providers/auth_provider.dart';
import 'package:project1/Project3/Widgets/custom_textfield.dart';
import 'package:project1/Project3/Widgets/custom_buttom.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => LoginscreenState();
}

class LoginscreenState extends State<Loginscreen> {
  final ckey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final logProvider = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: ckey,
          child: Column(
            children: [
              CustomTextfield(
                controller: logProvider.controllerUser,
                validator: logProvider.validUser,
                isPass: false,
                hintText: "Enter your username",
                prefixIcon: Icons.person,
              ),

              const SizedBox(height: 20),

              CustomTextfield(
                controller: logProvider.controllerPass,
                validator: logProvider.validPass,
                isPass: true,
                hintText: "Enter your password",
                prefixIcon: Icons.lock,
              ),

              const SizedBox(height: 30),

              CustomButtom(
                text: "Login",
                onPressed: () async {
                  if (ckey.currentState!.validate()) {
                    await logProvider.login(
                      logProvider.controllerUser.text,
                      logProvider.controllerPass.text,
                    );

                    if (!context.mounted) return;

                    if (logProvider.errorMessage != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(logProvider.errorMessage!)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login Successful")),
                      );
                    }
                  }
                },
              ),

              TextButton(
                onPressed: () {
                  // Navigate to Sign Up Screen
                },
                child: Text("Don't have an account? Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
