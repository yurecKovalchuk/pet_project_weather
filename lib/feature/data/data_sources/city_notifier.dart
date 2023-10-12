import 'package:flutter/cupertino.dart';

import 'package:weather/models/models.dart';

class CityNotifier with ChangeNotifier {
  late City currentCity;

  void setSelectedCity(City city) {
    currentCity = city;
    notifyListeners();
  }
}
