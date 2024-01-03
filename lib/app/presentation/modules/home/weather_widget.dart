import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/const/colors.dart';
import 'package:temps/app/domain/models/weather_model.dart';
import 'package:temps/app/presentation/global/utils/temp_conversions.dart';
import 'package:temps/app/presentation/modules/home/home_controller.dart';

import '../../global/utils/map_weather.dart';

class WeatherWidget extends ConsumerWidget {
  const WeatherWidget({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              mapColors(weather.weather.first.id),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  weather.name.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var i in weather.weather)
                          Icon(
                            mapIcons(i.id),
                            size: 120,
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      controller.isFarenheit
                          ? '${kelvinToFahrenheit(weather.main.temp).toStringAsFixed(0)}ºF'
                          : '${kelvinToCelsius(weather.main.temp).toStringAsFixed(0)}ºC',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1 / 2,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
