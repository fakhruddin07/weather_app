import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class WeatherData {
  final String location;
  late String main;
  late String description;
  late String temp;
  late String feelsLike;
  late String tempMin;
  late String tempMax;
  late String pressure;
  late String humidity;
  late String windSpeed;
  late String sunrise;
  late String sunset;

  WeatherData({required this.location});

  Future<void> getWeatherData() async {
    try {
      Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=f807d5cd9805a3bf5e96334b30da6c88&units=metric");
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
      tempMin = mainData["temp_min"].toString();
      tempMax = mainData["temp_max"].toString();
      pressure = mainData["pressure"].toString();
      humidity = mainData["humidity"].toString();

      //Getting wind speed
      Map<String, dynamic> airSpeedInfo = decodedResponse["wind"];
      windSpeed = (airSpeedInfo["speed"] * 3.6).toString();

      //Getting sunrise, sunset
      Map<String, dynamic> sysDataInfo = decodedResponse["sys"];
      sunrise = sysDataInfo["sunrise"].toString();
      sunset = sysDataInfo["sunset"].toString();
    }catch(e){
      main = "Can't find data";
      description = "Can't find data";
      temp = "Can't find data";
      feelsLike = "Can't find data";
      tempMin = "Can't find data";
      tempMax = "Can't find data";
      humidity = "Can't find data";
      windSpeed = "Can't find data";
      sunrise = "Can't find data";
      sunset = "Can't find data";
      log(e.toString());
    }
  }
}
