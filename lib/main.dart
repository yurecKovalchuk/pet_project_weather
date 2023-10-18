import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/feature/data/data_sources/data_sources.dart';
import 'package:weather/feature/feature.dart';
import 'package:weather/feature/menu/cubit/cubit.dart';
import 'package:weather/feature/weather/cubit/cubit.dart';
import 'feature/location/cubit/cubit.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherApp();
}

class _WeatherApp extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    final staticDatasource = StaticDataSource();

    return MaterialApp(
      home: HomeScreen(
        builder: (index) {
          if (index == 0) {
            return BlocProvider(
              create: (context) => LocationCubit(staticDatasource),
              child: const LocationScreen(),
            );
          } else if (index == 1) {
            return BlocProvider(
              create: (context) => WeatherCubit(staticDatasource),
              child: const WeatherScreen(),
            );
          } else if (index == 2) {
            return BlocProvider(
              create: (context) => MenuCubit(staticDatasource),
              child: const MenuScreen(),
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}
