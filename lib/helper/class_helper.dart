import 'package:flutter/cupertino.dart';

class Helper {

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
