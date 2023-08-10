import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(DateFormat.jm().format(DateTime.utc(int.parse(info["sunrise"])))),
              Text(DateFormat.jm().format(DateTime.utc(int.parse(info["sunset"])))),
              Text(DateFormat().format(DateTime.utc(int.parse(info["sunrise"])))),
              Text(DateFormat().format(DateTime.utc(int.parse(info["sunset"])))),
              Text(info["weather-main"]),
              Text(info["weather-description"]),
              Text("${info["temperature"]}°C"),
              Text("${info["feels-Like"]}°C"),
              Text("${info["pressure"]} mbar"),
              Text("${info["humidity"]}%"),
              Text("${info["windSpeed"]} km/h"),
              Text(info["sunrise"]),
              Text(info["sunset"]),
            ],
          ),
        ),
      ),
    );
  }
}
