import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'import_file.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  WeatherApp({
    super.key,
    City? selectedCity,
  });

  @override
  State<WeatherApp> createState() => _WeatherApp();
}

class _WeatherApp extends State<WeatherApp> {
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
    return MaterialApp(
      home: Scaffold(
        body: getPage(_currentIndex),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.indigo,
          buttonBackgroundColor: Colors.black,
          color: Colors.black54,
          animationDuration: Duration(microseconds: 300),
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.place_outlined,
              color: Colors.white,
              size: 50,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 50,
            ),
            Icon(
              Icons.list,
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
