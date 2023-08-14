import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/constants/app_constants.dart';
import 'package:weatherapp/constants/color_constants.dart';
import 'package:weatherapp/constants/string_constants.dart';
import 'package:weatherapp/providers/location_provider/location_provider.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
        builder: (context, locationProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            StringConstants.location,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next),
          onPressed: () => locationProvider.onNextClicked(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: locationProvider.cityTextController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: StringConstants.enterCityLableText,
                    hintText: StringConstants.enterCityHintText,
                  ),
                  onChanged: (value) => locationProvider.onTextFieldChanged(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _getDivider(context),
                  Text(
                    StringConstants.or,
                    style: TextStyle(
                      color: AppColors.textBlackColor.withOpacity(0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  _getDivider(context),
                ],
              ),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: AppConstants.cityList.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => locationProvider.onCitySelected(index),
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: locationProvider.selectedCityIndex == index
                              ? Colors.blueAccent.withOpacity(0.1)
                              : Colors.white,
                        ),
                        child: Text(
                          AppConstants.cityList[index],
                          style: TextStyle(
                            color: AppColors.textBlackColor.withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Colors.grey.withOpacity(0.8),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _getDivider(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(0.8),
      width: MediaQuery.of(context).size.width * 0.4,
    );
  }
}
