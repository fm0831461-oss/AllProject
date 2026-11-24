import 'package:flutter/material.dart';
import 'package:project1/Weather/Providers/auth_provider.dart';
import 'package:project1/Weather/Screens/login_weather.dart';
import 'package:project1/Weather/Widgets/custom_text_form.dart';
import 'package:provider/provider.dart';

class SignWeather extends StatelessWidget {
  SignWeather({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> ckey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final logpro = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orangeAccent),
      body: Form(
        key: ckey,
        child: Column(
          children: [
            CustomTextForm(
              controller: name,
              isPass: false,
              label: "Name",
              prefixIcon: Icons.person,
            ),
            CustomTextForm(
              controller: email,
              isPass: false,
              label: "Email",
              prefixIcon: Icons.email,
            ),
            CustomTextForm(
              controller: password,
              isPass: true,
              label: "Password",
              prefixIcon: Icons.email,
              sufixIcon: IconButton(
                onPressed: logpro.toggle,
                icon: Icon(
                  logpro.isPass ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            CustomTextForm(
              controller: phone,
              isPass: false,
              label: "Phone",
              prefixIcon: Icons.phone,
            ),
            ElevatedButton(
              onPressed: () async {
                if (!ckey.currentState!.validate()) return;
                final sucsses = await logpro.login(
                  email: email.text,
                  password: password.text,
                );
                if (!context.mounted) return;
                if (sucsses) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginWeather()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(logpro.authModel?.message ?? "")),
                  );
                }
                if (!context.mounted) return;
              },
              child: Text("Sign Up"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginWeather()),
                );
              },
              child: Text("i have account"),
            ),
          ],
        ),
      ),
    );
  }
}
