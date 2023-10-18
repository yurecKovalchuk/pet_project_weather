import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather/feature/menu/cubit/cubit.dart';
import 'package:weather/helper/helper.dart';
import 'package:weather/styles/styles.dart';
import 'package:weather/widgets/widgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    super.key,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  MenuCubit get _menuCubit => BlocProvider.of<MenuCubit>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuCubit, MenuState>(
          bloc: _menuCubit,
          builder: (context, state) {
            return state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    decoration: MainBackgroundDecoration.backgroundDecoration,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.weatherParameters?.data[0].coordinates[0].dates.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 50,
                                width: 85,
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                  const SizedBox(
                                    height: 1,
                                  ),
                                  Text(
                                    "${state.weatherParameters?.data[0].coordinates[0].dates[index].date.toString().substring(0, 16)}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    Helper().getDayOfWeek(
                                      state.weatherParameters!.data[0].coordinates[0].dates[index].date.weekday,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  WeatherIconWidget(
                                    value: state.value,
                                    dataTime: state.weatherParameters!.data[0].coordinates[0].dates[index].date,
                                  ),
                                  Text(
                                    "${state.weatherParameters?.data[0].coordinates[0].dates[index].value.toString()}º",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 1,
                                  ),
                                ]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 400,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "RAINFALL",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        "${state.weatherParameters?.data[1].coordinates[0].dates[0].value.toString() ?? ''} mm in last hour",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.water_drop_outlined,
                                        size: 120,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 400,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "WIND",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Text(
                                        "${state.weatherParameters?.data[2].coordinates[0].dates[0].value.toString() ?? ''} km/h",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Center(
                                        child: Icon(
                                          Icons.wind_power,
                                          size: 120,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                          width: 500,
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
