import 'package:flutter/cupertino.dart';

class Helper {
  getIcon(double value, DateTime dataTime) {
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
          return Image.asset('assets/images/moon.png');
        }
    }
  }

  String getDayOfWeek(int) {
    switch (int) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tues';
      case 3:
        return 'Wednes';
      case 4:
        return 'Thurs';
      case 5:
        return 'Fri';
      case 6:
        return 'Satur';
      case 7:
        return 'Sun';
      default:
        return 'Invalid day number';
    }
  }
}
