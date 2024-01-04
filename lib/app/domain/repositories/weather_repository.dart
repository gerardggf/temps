import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/data/repositories_impl/weather_repository_impl.dart';
import 'package:temps/app/data/services/local/geolocator_service.dart';
import 'package:temps/app/domain/http_failure/error_type.dart';
import 'package:temps/app/domain/models/current_weather_model.dart';
import 'package:temps/providers.dart';

import '../either/either.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepositoryImpl(
    ref.watch(dioProvider),
    ref.watch(geolocatorServiceProvider),
  ),
);

abstract class WeatherRepository {
  Future<Either<ErrorType, CurrentWeatherModel>> getCurrentWeatherData(
      {String? city});
}
