import 'package:flutter/material.dart';
import 'package:weatherapp/constants/color_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';

class MinMaxTemperatureComponent extends StatelessWidget {
  final String minTemp;
  final String maxTemp;
  const MinMaxTemperatureComponent(
      {super.key, required this.minTemp, required this.maxTemp});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getDetailsComp(StringConstants.minTemp, minTemp),
        _getDetailsComp(StringConstants.maxTemp, maxTemp),
      ],
    );
  }

  Widget _getDetailsComp(String title, String data) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
          color: AppColors.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              data,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            )
          ],
        ),
      );
}
