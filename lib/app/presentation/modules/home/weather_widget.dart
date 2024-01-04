import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/domain/models/current_weather_model.dart';
import 'package:temps/app/presentation/global/extensions/num_sizedbox_extension.dart';
import 'package:temps/app/presentation/global/utils/temp_conversions.dart';
import 'package:temps/app/presentation/modules/home/home_controller.dart';

import '../../global/utils/map_weather.dart';

class WeatherWidget extends ConsumerWidget {
  const WeatherWidget({
    super.key,
    required this.weather,
  });

  final CurrentWeatherModel weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeControllerProvider);
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: mapGradient(weather.weather[0].id),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Ubicación actual'),
                    Text(
                      weather.name.toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 120,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i in weather.weather)
                              Icon(
                                mapIcons(i.id),
                                color: Colors.white,
                              ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            controller.isFarenheit
                                ? '${kelvinToFahrenheit(weather.main.temp).toStringAsFixed(0)}ºF'
                                : '${kelvinToCelsius(weather.main.temp).toStringAsFixed(0)}ºC',
                            style: const TextStyle(fontSize: 60),
                          ),
                          20.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                controller.isFarenheit
                                    ? 'Temp min.  ${kelvinToFahrenheit(weather.main.tempMin).toStringAsFixed(0)}ºF'
                                    : 'Temp min.  ${kelvinToCelsius(weather.main.tempMin).toStringAsFixed(0)}ºC',
                              ),
                              Text(
                                controller.isFarenheit
                                    ? 'Temp máx.  ${kelvinToFahrenheit(weather.main.tempMax).toStringAsFixed(0)}ºF'
                                    : 'Temp máx.  ${kelvinToCelsius(weather.main.tempMax).toStringAsFixed(0)}ºC',
                              ),
                            ],
                          ),
                          30.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Sensación de',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  3.h,
                                  Text(
                                    controller.isFarenheit
                                        ? '${kelvinToFahrenheit(weather.main.feelsLike).toStringAsFixed(0)}ºF'
                                        : '${kelvinToCelsius(weather.main.feelsLike).toStringAsFixed(0)}ºC',
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Humedad',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  3.h,
                                  Text(
                                    '${weather.main.humidity.toString()}%',
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
