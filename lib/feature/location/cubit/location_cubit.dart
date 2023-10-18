import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/feature/data/data_sources/data_sources.dart';
import 'package:weather/feature/location/cubit/cubit.dart';
import 'package:weather/models/models.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.staticDatasource)
      : super(
          LocationState.initial(),
        ) {
    _init();
  }

  final StaticDataSource staticDatasource;

  void _init() async {
    final cities = staticDatasource.cities;
    emit(state.copyWith(
      cities: cities,
    ));
  }

  void selectCity(City city) {
    staticDatasource.cityNotifier.setSelectedCity(city);
    emit(state.copyWith(selectedCity: city));
  }

  void setCities(List<City> cities) {
    emit(state.copyWith(cities: cities));
  }
}
