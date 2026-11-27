import 'package:flutter/material.dart';
import 'package:project1/Weather/Providers/auth_provider.dart';
import 'package:project1/Weather/Screens/weather_app.dart';
import 'package:project1/Weather/Screens/sign_weather.dart';
import 'package:project1/Weather/Widgets/custom_text_form.dart';
import 'package:provider/provider.dart';

class LoginWeather extends StatelessWidget {
  LoginWeather({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                    MaterialPageRoute(builder: (context) => WeatherApp()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(logpro.authModel?.message ?? "")),
                  );
                }
                if (!context.mounted) return;
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignWeather()),
                );
              },
              child: Text("dont have account"),
            ),
          ],
        ),
      ),
    );
  }
}
