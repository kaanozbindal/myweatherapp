import 'package:flutter/material.dart';

class Weathermodel {
  final String cityName;
  // final String icon;
  final double temp;
  final double feelsLike;
  final int humidity;
  final String weather;

  Weathermodel({
    required this.cityName,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.weather,
  });

  factory Weathermodel.fromJson(Map<String, dynamic> json) {
    return Weathermodel(
      cityName: json["name"],
      temp: json["main"]["temp"],
      humidity: json["main"]["humidity"],
      feelsLike: json["main"]["feels_like"],
      weather: json["weather"][0]["description"],
    );
  }
}

class City {
  String? lat;
  String? lon;
  String? name;
  City({this.lat, this.lon, this.name});
}
