import 'dart:html';

import 'package:flutter/material.dart';

import 'package:weather/feature/feature.dart';
import 'package:weather/models/class_city_location.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherApp();
}

class _WeatherApp extends State<WeatherApp> {


  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: HomeScreen(),
    );
  }
}
