import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class WeatherData {
  final String location;
  String? main;
  String? description;
  String? temp;
  String? feelsLike;
  String? pressure;
  String? humidity;
  String? windSpeed;
  String? sunrise;
  String? sunset;

  WeatherData({required this.location});

  Future<void> getWeatherData() async {
    try {
      Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=f807d5cd9805a3bf5e96334b30da6c88");
      Response response = await get(url);
      final decodedResponse = jsonDecode(response.body);

      //Getting weather's main, description, icon
      Map<String, dynamic> weatherInfo = decodedResponse["weather"][0];
      main = weatherInfo["main"];
      description = weatherInfo["description"];

      //Getting temp, feels like, pressure, humidity
      Map<String, dynamic> mainData = decodedResponse["main"];
      temp = mainData["temp"].toString();
      feelsLike = mainData["feels_like"].toString();
      feelsLike = mainData["pressure"].toString();
      humidity = mainData["humidity"].toString();

      //Getting wind speed
      Map<String, dynamic> airSpeedInfo = decodedResponse["wind"];
      windSpeed = airSpeedInfo["speed"].toString();

      //Getting sunrise, sunset
      Map<String, dynamic> sysDataInfo = decodedResponse["sys"];
      sunrise = sysDataInfo["sunrise"].toString();
      sunset = sysDataInfo["sunset"].toString();
    }catch(e){
      main = "Can't find data";
      description = "Can't find data";
      temp = "Can't find data";
      feelsLike = "Can't find data";
      feelsLike = "Can't find data";
      humidity = "Can't find data";
      windSpeed = "Can't find data";
      sunrise = "Can't find data";
      sunset = "Can't find data";
      log(e.toString());
    }
  }
}
