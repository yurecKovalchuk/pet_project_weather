import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/feature/feature.dart';
import 'package:weather/feature/location/cubit/cubit.dart';
import 'package:weather/styles/styles.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locationCubit = BlocProvider.of<LocationCubit>(context);

    return Scaffold(
      body: Container(
        decoration: MainBackgroundDecoration.backgroundDecoration,
        child: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.cities.length,
              itemBuilder: (context, index) {
                return ListCitiesWidget(
                  onSelectedCity: (city) {
                    HomeScreen.selectTab(context, 1);
                    locationCubit.selectCity(city);
                  },
                  city: state.cities[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
