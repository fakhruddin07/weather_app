import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/data/weather_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String city = "Comilla";
  late String main;
  late String description;
  late String icon;
  late String temp;
  late String feelsLike;
  late String tempMin;
  late String tempMax;
  late String pressure;
  late String humidity;
  late String seaLevel;
  late String groundLevel;
  late String windSpeed;

  Future<void> navigateToHome() async {
    WeatherData data = WeatherData(location: city);
    await data.getWeatherData();
    main = data.main;
    description = data.description;
    icon = data.icon;
    temp = data.temp;
    feelsLike = data.feelsLike;
    tempMin = data.tempMin;
    tempMax = data.tempMax;
    pressure = data.pressure;
    humidity = data.humidity;
    seaLevel = data.seaLevel;
    groundLevel = data.groundLevel;
    windSpeed = data.windSpeed;
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (route) => false,
        arguments: {
          "city_name": city,
          "weather_main": main,
          "weather_description": description,
          "weather_icon": icon,
          "temperature": temp,
          "feels_Like": feelsLike,
          "temp_min": tempMin,
          "temp_max": tempMax,
          "pressure": pressure,
          "humidity": humidity,
          "sea_level": seaLevel,
          "grnd_level": groundLevel,
          "windSpeed": windSpeed,
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? searchInfo = ModalRoute.of(context)!.settings.arguments as Map?;
    if(searchInfo?.isNotEmpty ?? false){
      city = searchInfo?["search_name"];
    }
    navigateToHome();
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", width: 240),
            Text("Weather app", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text("Made by Fakhruddin",
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
