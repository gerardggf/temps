import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/domain/models/weather_model.dart';
import 'package:temps/app/domain/repositories/weather_repository.dart';

import '../../../domain/either/either.dart';
import '../../../domain/http_failure/http_failure.dart';
import 'weather_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

final getWeatherFutureProvider =
    FutureProvider<Either<HttpFailure, WeatherModel>>(
  (ref) => ref.watch(weatherRepositoryProvider).getWeatherData(),
);

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final getWeatherFuture = ref.watch(getWeatherFutureProvider);
    return Scaffold(
      body: getWeatherFuture.when(
        data: (either) {
          return either.when(
            left: (failure) {
              return Center(
                child: Text(
                  failure.maybeWhen(
                      noPosition: () =>
                          'No se ha podido encontrar tu ubicación',
                      orElse: () => 'Se ha producido un error'),
                ),
              );
            },
            right: (data) {
              return WeatherWidget(weather: data);
            },
          );
        },
        error: (e, __) {
          return Center(
            child: Text('Error: ${e.toString()}'),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
