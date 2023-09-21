import 'package:weather/models/models.dart';

class WeatherScreenState {
  final City? selectedCity;
  final WeatherParameters? weatherParameters;
  final double value;
  final bool isLoading;

  WeatherScreenState({
    required this.selectedCity,
    required this.weatherParameters,
    required this.value,
    required this.isLoading,
  });

  WeatherScreenState copyWith({
    City? selectedCity,
    WeatherParameters? weatherParameters,
    double? value,
    bool? isLoading,
  }) {
    return WeatherScreenState(
      selectedCity: selectedCity ?? this.selectedCity,
      weatherParameters: weatherParameters ?? this.weatherParameters,
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory WeatherScreenState.initial() {
    return WeatherScreenState(
      selectedCity: null,
      weatherParameters: null,
      value: 0,
      isLoading: true,
    );
  }
}