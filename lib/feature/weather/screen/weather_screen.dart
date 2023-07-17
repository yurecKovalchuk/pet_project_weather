import 'package:flutter/material.dart';

import 'package:weather/models/models.dart';
import 'package:weather/services/services.dart';
import 'package:weather/widgets/widgets.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({
    super.key,
    required this.selectedCity,
  });

  City? selectedCity;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherParameters? weatherParameters;
  final requestHelper = GetRequest();
  double value = 0;

  @override
  void initState() {
    super.initState();
    getDataWeather();
  }

  Future<void> getDataWeather() async {
    weatherParameters =
        await requestHelper.fetchWeatherData(widget.selectedCity!);
    value = weatherParameters!.data[1].coordinates[0].dates[0].value;
    loadedData();
    setState(() {});
  }

  bool isLoading = true;

  void loadedData() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/image.png',
            fit: BoxFit.cover,
          ),
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.selectedCity?.name.toString() ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          )),
                      Text(
                        "${weatherParameters?.data[0].coordinates[0].dates[0].value.toString() ?? ""}º",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w100),
                      ),
                      const SizedBox(height: 16),
                      WeatherIconWidget(
                        value: value,
                        dataTime: DateTime.now(),
                      ),
                    ],
                  ),
                ],
              ),
      ]),
    );
  }
}
