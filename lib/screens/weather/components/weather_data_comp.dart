import 'package:flutter/material.dart';
import 'package:weatherapp/constants/color_constants.dart';
import 'package:weatherapp/constants/image_constants.dart';

class WeatherDetailsComp extends StatelessWidget {
  final String imageName;
  final String title;
  final String data;
  final bool? isWeatherDesc;
  const WeatherDetailsComp(
      {super.key,
      required this.imageName,
      required this.title,
      required this.data,
      this.isWeatherDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      child: ListTile(
        leading: isWeatherDesc ?? false
            ? SizedBox(
                height: 30,
                width: 30,
                child: Image.network(
                  imageName,
                  height: 30,
                  width: 30,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    ImageConstants.weather,
                    height: 30,
                    width: 30,
                  ),
                ),
              )
            : Image.asset(
                imageName,
                height: 30,
                width: 30,
              ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
