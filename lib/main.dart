import 'package:flutter/material.dart';
import 'package:weather_app/Screen/home.dart';
import 'package:weather_app/Screen/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
      },
    );
  }
}