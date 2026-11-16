import 'package:flutter/material.dart';
import 'package:project1/Project1/Providers/prayers_provider.dart';
import 'package:project1/Project1/Screens/home.dart';
import 'package:project1/Project2/Providor/user_provider.dart';
import 'package:project1/Project2/Screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PrayersProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        // home: HomeScreen(),
        home: HomeScreen(),
      ),
    );
  }
}
