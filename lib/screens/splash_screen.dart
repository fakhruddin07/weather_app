import 'package:flutter/material.dart';
import 'package:weather_app/data/weather_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateToHome() {
    Future.delayed(const Duration(seconds: 5),).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
    });
  }
  
  Future<void> startApp() async{
    WeatherData data = WeatherData(location: "Comilla");
    await data.getWeatherData();
  }

  @override
  void initState() {
    navigateToHome();
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}
