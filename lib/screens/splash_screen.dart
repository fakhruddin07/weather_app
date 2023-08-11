import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/data/weather_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String main;
  late String description;
  late String temp;
  late String feelsLike;
  late String pressure;
  late String humidity;
  late String windSpeed;
  late String sunrise;
  late String sunset;

  Future<void> navigateToHome() async {
    WeatherData data = WeatherData(location: "Comilla");
    await data.getWeatherData();
    main = data.main;
    description = data.description;
    temp = data.temp;
    feelsLike = data.feelsLike;
    pressure = data.pressure;
    humidity = data.humidity;
    windSpeed = data.windSpeed;
    sunrise = data.sunrise;
    sunset = data.sunset;
    Future.delayed(
      const Duration(seconds: 3),
    ).then((value) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (route) => false,
        arguments: {
          "weather-main": main,
          "weather-description": description,
          "temperature": temp,
          "feels-Like": feelsLike,
          "pressure": pressure,
          "humidity": humidity,
          "windSpeed": windSpeed,
          "sunrise": sunrise,
          "sunset": sunset,
        },
      );
    });
  }

  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 240),
            Text("Weather app", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text("Made by Fakhruddin Noman",
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 30),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
