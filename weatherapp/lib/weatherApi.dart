import 'dart:convert' as convert;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/controller.dart';
import 'package:weatherapp/models.dart';
import 'package:get/get.dart';

class WeatherApiFuncs {
  void iconCase() {
    switch (controller.weather!.weather.toString()) {
      case "az bulutlu":
        {
          controller.icon = Icons.cloud;
        }
        break;
      case "güneşli":
        {
          controller.icon = Icons.sunny;
        }
        break;
      case "yağmurlu":
        {
          controller.icon = Icons.radar;
        }
        break;
      case "güneşli":
        {
          controller.icon = Icons.sunny;
        }
        break;
      case "güneşli":
        {
          controller.icon = Icons.sunny;
        }
        break;
      default:
    }
  }

  String? apiKey = "";
  String? data;
  String? cityLat;
  WeatherController controller = Get.put(WeatherController());
  Future callApi(String lat, String lon) async {
    controller.isLoading.value = true;
    print("weatherapi calismaya basladi");
    final response = (await http.get(Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=tr")))
        .body;

    debugPrint("datamiz: " + response.toString());
    //  debugPrint('getweather calisti');

    controller.weather = Weathermodel.fromJson(convert.jsonDecode(response));
    iconCase();
    print(controller.weather!.weather.toString());

    controller.isLoading.value = false;
  }
}
