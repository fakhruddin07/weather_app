import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
              },
              icon: const Icon(Icons.home),
              label: const Text("Home")),
        ),
      ),
    );
  }
}
