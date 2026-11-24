import 'package:flutter/material.dart';
import 'package:project1/NewApp/Providers/articles_provider.dart';
import 'package:project1/NewApp/Screens/sign_up_screen.dart';
import 'package:project1/NewApp/Providers/auth_provider.dart';
import 'package:project1/Prayer/Providers/prayers_provider.dart';
import 'package:project1/RandomUser/Providor/user_provider.dart';
// import 'package:project1/Weather/Providers/auth_provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PrayersProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        // ChangeNotifierProvider(create: (context) => AuthProviderW()),
        ChangeNotifierProvider(create: (context) => ArticleProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: SignUpScreen(),
      ),
    );
  }
}
