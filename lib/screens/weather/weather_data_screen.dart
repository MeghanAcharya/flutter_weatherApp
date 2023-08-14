import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/common/components/error_widget.dart';
import 'package:weatherapp/constants/image_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/model/response/error_response_entity.dart';
import 'package:weatherapp/providers/weather_provider/weather_provider.dart';
import 'package:weatherapp/screens/weather/components/min_max_temp_comp.dart';
import 'package:weatherapp/screens/weather/components/weather_data_comp.dart';

class WeatherScreen extends StatelessWidget {
  final String selectedCity;
  const WeatherScreen({super.key, required this.selectedCity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringConstants.weatherDetails,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          return FutureBuilder<dynamic>(
            future: weatherProvider.getWeatherDataFromCityName(selectedCity),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                var error = snapshot.error.toString().replaceAll(
                    "OpenWeatherAPIException - The API threw an exception:",
                    "");
                ErrorResponse errorr =
                    ErrorResponse.fromJson(jsonDecode(error));
                return ErrorDataWidget(
                  errorMessage:
                      errorr.message ?? StringConstants.somethingWentWrong,
                );
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WeatherDetailsComp(
                        data: snapshot.data?.areaName ?? "",
                        imageName: ImageConstants.location,
                        title: StringConstants.cityName,
                      ),
                      WeatherDetailsComp(
                        data: weatherProvider.getCelsiusString(
                            weatherProvider.getRoundOffNum(
                                snapshot.data?.temperature?.celsius ?? 0.0)),
                        imageName: ImageConstants.temperarture,
                        title: StringConstants.currentTemp,
                      ),
                      MinMaxTemperatureComponent(
                        maxTemp: weatherProvider.getCelsiusString(
                            weatherProvider.getRoundOffNum(
                                snapshot.data?.tempMax?.celsius ?? 0.0)),
                        minTemp: weatherProvider.getCelsiusString(
                            weatherProvider.getRoundOffNum(
                                snapshot.data?.tempMin?.celsius ?? 0.0)),
                      ),
                      WeatherDetailsComp(
                        data: snapshot.data?.weatherDescription ?? "",
                        imageName: weatherProvider.getWeatherImageUrl(
                            snapshot.data?.weatherIcon ?? ""),
                        title: StringConstants.weather,
                        isWeatherDesc: true,
                      ),
                      WeatherDetailsComp(
                        data: weatherProvider
                            .getRoundOffNum(snapshot.data?.humidity ?? 0.0),
                        imageName: ImageConstants.humidity,
                        title: StringConstants.humidity,
                      ),
                      WeatherDetailsComp(
                        data: weatherProvider
                            .getRoundOffNum(snapshot.data?.windSpeed ?? 0.0),
                        imageName: ImageConstants.wind,
                        title: StringConstants.windSpeed,
                      ),
                    ],
                  ),
                );
              } else {
                return const ErrorDataWidget(
                  errorMessage: StringConstants.somethingWentWrong,
                );
              }
            },
          );
        },
      ),
    );
  }
}
