import 'package:flutter/material.dart';
import 'package:movieapp/HomeScreen/homeScreen.dart';
import 'package:movieapp/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_SCreen.Rotename,
      routes: {
        Home_SCreen.Rotename: (context) => Home_SCreen(),
      },
      theme: Mytheme.lightmode,
    );
  }
}
