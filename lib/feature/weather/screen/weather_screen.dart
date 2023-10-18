import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/feature/weather/cubit/cubit.dart';
import 'package:weather/widgets/widgets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreen();
}

class _WeatherScreen extends State<WeatherScreen> {
  WeatherCubit get _weatherCubit => BlocProvider.of<WeatherCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.cover,
            ),
          ),
          BlocBuilder<WeatherCubit, WeatherScreenState>(
              bloc: _weatherCubit,
              builder: (context, state) {
                return state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(_weatherCubit.state.selectedCity?.name.toString() ?? " ",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                  )),
                              Text(
                                "${state.weatherParameters?.data[0].coordinates[0].dates[0].value.toString() ?? ""}º",
                                style: const TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.w100),
                              ),
                              const SizedBox(height: 16),
                              WeatherIconWidget(
                                value: state.value,
                                dataTime: DateTime.now(),
                              ),
                            ],
                          ),
                        ],
                      );
              }),
        ],
      ),
    );
  }
}
