import 'package:flutter/material.dart';

import 'styles/styles.dart';

import 'class_city_location.dart';

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
            return Container(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent, // Залитий фон
                borderRadius: BorderRadius.circular(20.0), // Заокруглені кути
              ),
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  cities[index].name ?? "",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onTap: () {
                  onSelectedCity(cities[index]);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
