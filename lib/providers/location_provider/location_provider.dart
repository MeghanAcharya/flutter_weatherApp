import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/screens/weather/weather_data_screen.dart';

class LocationProvider with ChangeNotifier {
  TextEditingController cityTextController = TextEditingController();
  int selectedCityIndex = -1;

  void onCitySelected(int index) {
    cityTextController.text = "";
    selectedCityIndex = index;
    notifyListeners();
  }

  void onTextFieldChanged() {
    selectedCityIndex = -1;
  }

  void onNextClicked(BuildContext context) {
    if (cityTextController.text.trim().isEmpty && selectedCityIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Text(
            StringConstants.errorSelectCity,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WeatherScreen(
            selectedCity: selectedCityIndex == -1
                ? cityTextController.text
                : AppConstants.cityList[selectedCityIndex],
          ),
        ),
      );
    }
  }
}
