import 'package:flutter/material.dart';
import 'package:weatherapp/constants/image_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';

class ErrorDataWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorDataWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(ImageConstants.error),
          Text(
            StringConstants.oops,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
            ),
          )
        ],
      ),
    );
  }
}
