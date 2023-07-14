import 'package:flutter/material.dart';

import 'package:weather/feature/feature.dart';
import 'package:weather/models/models.dart';
import 'package:weather/styles/styles.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({
    super.key,
    required this.onSelectedCity,
    required this.cities,
  });

  final List<City> cities;

  Function(City city) onSelectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MainBackgroundDecoration.backgroundDecoration,
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return ListCitiesWidget(
              onSelectedCity: onSelectedCity,
              city: cities[index],
            );
          },
        ),
      ),
    );
  }
}
