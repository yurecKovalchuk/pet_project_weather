import 'package:weather/models/models.dart';

class LocationState{
  final List<City> cities;
  final City? selectedCity;

  LocationState({
    required this.cities,
    required this.selectedCity,
  });

  factory LocationState.initial() {
    return LocationState(
      cities: [],
      selectedCity: null,
    );
  }

  LocationState copyWith({
    List<City>? cities,
    City? selectedCity,
  }) {
    return LocationState(
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }
}