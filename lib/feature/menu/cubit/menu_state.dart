import 'package:weather/models/models.dart';

class MenuState {
  final City? selectedCity;
  final WeatherParameters? weatherParameters;
  final double value;
  final bool isLoading;

  MenuState({
    required this.selectedCity,
    required this.weatherParameters,
    required this.value,
    required this.isLoading,
  });

  MenuState copyWith({
    City? selectedCity,
    WeatherParameters? weatherParameters,
    double? value,
    bool? isLoading,
  }) {
    return MenuState(
      selectedCity: selectedCity ?? this.selectedCity,
      weatherParameters: weatherParameters ?? this.weatherParameters,
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory MenuState.initial() {
    return MenuState(
      selectedCity: null,
      weatherParameters: null,
      value: 0,
      isLoading: true,
    );
  }
}
