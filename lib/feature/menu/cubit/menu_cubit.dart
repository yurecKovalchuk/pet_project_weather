import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/feature/data/data_sources/data_sources.dart';
import 'package:weather/feature/menu/cubit/cubit.dart';
import 'package:weather/models/models.dart';
import 'package:weather/services/services.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(
      this.staticDatasource,
      ) : super(
    MenuState.initial(),
  ) {
    _init();
  }

  final StaticDataSource staticDatasource;

  void _init() async {
    setDataCity(staticDatasource.cityNotifier.currentCity);
    staticDatasource.cityNotifier.addListener(() {
      setDataCity(staticDatasource.cityNotifier.currentCity);
    });
  }

  void setDataCity(City city) async {
    emit(state.copyWith(isLoading: true));

    final requestHelper = GetRequest();
    final weatherParameters = await requestHelper.fetchWeatherData(city);
    final value = weatherParameters?.data[1].coordinates[0].dates[0].value ?? 0;

    emit(state.copyWith(
      selectedCity: city,
      weatherParameters: weatherParameters,
      value: value,
      isLoading: false,
    ));
  }
}