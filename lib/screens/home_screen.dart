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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade300,
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                // margin:
                //     const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                info["weather-description"],
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                city,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.thermostat,
                          size: 100,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${info["temperature"]}",
                              style: Theme.of(context).textTheme.displayLarge),
                          Text("°C",
                              style: Theme.of(context).textTheme.displaySmall),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            info["weather-main"],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${info["temp_max"]}°/",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "${info["temp_min"]}°",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {},style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700
                      ),
                        icon: const Icon(Icons.energy_savings_leaf, color: Colors.white),
                        label: const Text("AQI", style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.air, size: 70)),
                          const SizedBox(height: 20),
                          Text("${info["windSpeed"]} km/h",
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text("Humidity"),
                              Spacer(),
                              Text("${info["humidity"]}%"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Real feel"),
                              Spacer(),
                              Text("${info["feels-Like"]}°"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Pressure"),
                              Spacer(),
                              Text("${info["pressure"]}mbar"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Sea Lvl"),
                              Spacer(),
                              Text("${info["sea_level"]}mbar"),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Ground Lvl"),
                              Spacer(),
                              Text("${info["grnd_level"]}mbar"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Data Provided By Openweathermap.org"),
              ),
            ],
          ),
          /*child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(info["weather-main"]),
              Text(info["weather-description"]),
              Text("${info["temperature"]}°C"),
              Text("${info["feels-Like"]}°C"),
              Text("${info["temp_min"]}°C"),
              Text("${info["temp_max"]}°C"),
              Text("${info["pressure"]} mbar"),
              Text("${info["humidity"]}%"),
              Text("${info["sea_level"]}%"),
              Text("${info["grnd_level"]}%"),
              Text("${info["windSpeed"]} km/h"),
            ],
          ),*/
        ),
      ),
    );
  }
}
