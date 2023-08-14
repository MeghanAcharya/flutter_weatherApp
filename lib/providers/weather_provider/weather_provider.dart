import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/constants/app_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';

class WeatherProvider with ChangeNotifier {
  WeatherFactory wf = WeatherFactory(AppConstants.weatherApiKey);

  Future<Weather> getWeatherDataFromCityName(String cityName) async {
    Weather weatherData = await wf.currentWeatherByCityName(cityName);
    return weatherData;
  }

  String getRoundOffNum(double value) => "${value.roundToDouble()}";

  String getWeatherImageUrl(String imageValue) =>
      AppConstants.baseImageUrl(imageValue);

  String getCelsiusString(String value) =>
      "$value ${StringConstants.degreeCelsius}";
}
