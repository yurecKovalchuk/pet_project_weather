import 'package:flutter/material.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    super.key,
    required this.value,
    required this.dataTime,
  });

  final double value;
  final DateTime dataTime;

  @override
  Widget build(BuildContext context) {
    final currentTime = dataTime;
    final sunriseTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day, 6, 0);
    final sunsetTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day, 22, 0);

    switch (value) {
      case 0:
        if (currentTime.isAfter(sunriseTime) &&
            currentTime.isBefore(sunsetTime)) {
          return Image.asset('assets/images/sun.png');
        } else {
          return Image.asset('assets/images/moonn.png');
        }
      default:
        if (value.toDouble() > 0 &&
            value.toDouble() > 2 &&
            currentTime.isAfter(sunriseTime) &&
            currentTime.isBefore(sunsetTime)) {
          return Image.asset('assets/images/Sun cloud mid rain.png');
        } else if (value.toDouble() > 0 &&
            value.toDouble() < 2 &&
            currentTime.isAfter(sunsetTime) &&
            currentTime.isBefore(sunriseTime)) {
          return Image.asset('assets/images/Moon cloud mid rain.png');
        } else if (value.toDouble() > 2 &&
            currentTime.isAfter(sunriseTime) &&
            currentTime.isBefore(sunsetTime)) {
          return Image.asset('assets/images/Sun cloud mid rain.png');
        } else {
          return Image.asset('assets/images/moonn.png');
        }
    }
  }
}
