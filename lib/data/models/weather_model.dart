import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final DateTime data;
  final String image;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.weatherCondition,
    required this.image,
    required this.data,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      cityName: json['location']['name'],
      data: DateTime.parse(json['current']['last_updated']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }

  MaterialColor getThemeColor(String condition) {
    if (condition == 'Sunny' || condition == 'Clear' ||  condition == 'partly cloudy') {
      return Colors.orange;
    } else if (

    condition == 'Blizzard' ||  condition == 'Patchy snow possible'  ||  condition == 'Patchy sleet possible' || condition == 'Patchy freezing drizzle possible' || condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' || condition == 'Fog' ||  condition == 'Heavy Cloud' || condition == 'Mist' || condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible' || condition == 'Moderate or heavy snow with thunder' || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder' || condition == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
