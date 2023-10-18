import 'package:flutter/material.dart';

import 'package:weather/models/models.dart';

class ListCitiesWidget extends StatelessWidget {
  const ListCitiesWidget({
    super.key,
    required this.onSelectedCity,
    required this.city,
  });

  final City city;

  final Function(City city) onSelectedCity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          city.name ?? "",
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        onTap: () {
          onSelectedCity(city);
        },
      ),
    );
  }
}
