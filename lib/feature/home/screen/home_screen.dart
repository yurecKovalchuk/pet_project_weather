import 'package:flutter/material.dart';

import 'package:weather/feature/feature.dart';
import 'package:weather/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    City? selectedCity,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  City? selectedCity;
  int _currentIndex = 1;

  List<City> cities = [
    City(name: "Kiev", location: Location(lat: 50.4501, lon: 30.5234)),
    City(name: "Lviv", location: Location(lat: 49.8397, lon: 24.0297)),
    City(name: "Odesa", location: Location(lat: 46.4825, lon: 30.7233)),
  ];

  Widget getPage(int index) {
    if (index == 0) {
      return LocationScreen(
        onSelectedCity: onSelectCity,
        cities: cities,
      );
    } else if (index == 1) {
      return WeatherScreen(
        selectedCity: selectedCity,
      );
    }
    return MenuScreen(
      selectedCity: selectedCity,
    );
  }

  void onSelectCity(City city) {
    _currentIndex = 1;
    selectedCity = city;
    setState(() {});
  }

  @override
  void initState() {
    selectedCity = cities.first;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "location",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "weather",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "menu",
          ),
        ],
      ),
    );
  }
}
