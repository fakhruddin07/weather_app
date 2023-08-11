import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _cityName = ["Cumilla", "Dhaka", "Rajshahi"];
  final _random = Random();
  // var city = _cityName[_random.nextInt(_cityName.length)];
  @override
  Widget build(BuildContext context) {
    // final _cityName = ["Cumilla", "Dhaka", "Rajshahi"];
    // final _random = Random();
    var city = _cityName[_random.nextInt(_cityName.length)];
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                        child: const Icon(Icons.search),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.search),
                          hintText: "Search $city",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          /*child: Column(
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
          ),*/
        ),
      ),
    );
  }
}
