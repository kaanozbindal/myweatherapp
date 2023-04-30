import 'package:flutter/material.dart';
import 'package:weatherapp/controller.dart';
import 'package:weatherapp/weatherApi.dart';
import 'package:get/get.dart';

class Mainpage extends StatelessWidget {
  Mainpage({super.key});
  WeatherController controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    if (controller.dropDownValue.value == "ISTANBUL") {
      WeatherApiFuncs().callApi('41.015137', '28.979530');
    }

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : weatherWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget dropdown() {
    return Obx(
      () => SizedBox(
        width: 200,
        child: DropdownButton(
            dropdownColor: Colors.blue,
            icon: Icon(
              Icons.location_city,
              color: Colors.white,
            ),
            value: controller.dropDownValue.value,
            isExpanded: true,
            onChanged: (value) {
              controller.dropDownValue.value = value.toString();
              switch (controller.dropDownValue.value) {
                case "ISTANBUL":
                  {
                    WeatherApiFuncs().callApi('41.015137', '28.979530');
                  }
                  break;
                case "ADANA":
                  {
                    WeatherApiFuncs().callApi("37.000000", "35.321335");
                    print("adana");
                  }
                  break;
                case "MERSIN":
                  {
                    WeatherApiFuncs().callApi("36.812103", "34.641479");
                    print("mersin");
                  }

                  break;
                case "ANKARA":
                  {
                    WeatherApiFuncs().callApi("39.91987", "32.85427");
                  }
                  break;
                default:
              }
            },
            items: <String>['ADANA', 'MERSIN', 'ISTANBUL', 'ANKARA']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              );
            }).toList()),
      ),
    );
  }

  Widget weatherWidget(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 20,
            ),
            child: Text(
              controller.weather!.cityName.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Icon(
              controller.icon,
              color: Colors.yellow,
              size: 110.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${controller.weather!.temp.toString().split(".")[0]}°C",
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          Text(
            "HİSSEDİLEN ${controller.weather!.feelsLike.toString().split(".")[0]}",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "NEM: %${controller.weather!.humidity}",
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              controller.weather!.weather.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: dropdown(),
          )
        ],
      ),
    );
  }
}
