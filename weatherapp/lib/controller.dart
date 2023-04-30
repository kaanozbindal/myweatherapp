import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'weatherApi.dart';
import 'package:weatherapp/models.dart';

class WeatherController extends GetxController {
  // Weathermodel? istanbulModel;

  // List weatherlist = [].obs;
  RxBool isLoading = false.obs;
  Weathermodel? weather;
  RxString dropDownValue = "ISTANBUL".obs;
  IconData icon = Icons.sunny;

  // Rx<Weathermodel> weather;
/*  getweather() {
    weatherlist.add(WeatherApiFuncs().callApi(
      '41.015137',
      '28.979530',
    ) as Weathermodel);
  }*/

/*  WeatherApiFuncs().getWeather(
          City(lat: '41.015137', lon: '28.979530', name: "Istanbul"))
      as Weathermodel; */
}
