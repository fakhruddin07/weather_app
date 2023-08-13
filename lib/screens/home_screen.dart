import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchTEController = TextEditingController();
  final List _cityName = ["Cumilla", "Dhaka", "Rajshahi"];
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    // var city = _cityName[_random.nextInt(_cityName.length)];
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (searchTEController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("This field can't be an empty"),
                              ),
                            );
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              "/splash",
                              (route) => false,
                              arguments: {
                                "search_name": searchTEController.text.trim(),
                              },
                            );
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Icon(Icons.search),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchTEController,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                            hintText: "Search any city",
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
                            Image.network(
                              "https://openweathermap.org/img/wn/${info["weather_icon"]}@2x.png",
                              width: 50,
                              color: Colors.transparent,
                              fit: BoxFit.fill,
                              errorBuilder: (_, __, ___) {
                                return Image.asset(
                                  "assets/images.logo.png",
                                  width: 50,
                                );
                              },
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  info["weather_description"],
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  "In ${info["city_name"]}",
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
                              info["weather_main"],
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade700),
                          icon: const Icon(Icons.energy_savings_leaf,
                              color: Colors.white),
                          label: const Text(
                            "AQI",
                            style: TextStyle(color: Colors.white),
                          ),
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
                                const Text("Humidity"),
                                const Spacer(),
                                Text("${info["humidity"]}%"),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Real feel"),
                                const Spacer(),
                                Text("${info["feels_Like"]}°"),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Pressure"),
                                const Spacer(),
                                Text("${info["pressure"]}mbar"),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Sea Lvl"),
                                const Spacer(),
                                Text("${info["sea_level"]}mbar"),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Ground Lvl"),
                                const Spacer(),
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
          ),
        ),
      ),
    );
  }
}
