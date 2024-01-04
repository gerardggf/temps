import 'package:dio/dio.dart';
import 'package:temps/app/const/endpoints.dart';
import 'package:temps/app/data/services/local/geolocator_service.dart';
import 'package:temps/app/domain/models/current_weather_model.dart';
import 'package:temps/app/domain/repositories/weather_repository.dart';

import '../../domain/either/either.dart';
import '../../domain/http_failure/error_type.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(
    this.dio,
    this.geolocatorService,
  );

  final Dio dio;
  final GeolocatorService geolocatorService;

  @override
  Future<Either<ErrorType, CurrentWeatherModel>> getCurrentWeatherData(
      {String? city}) async {
    if (city?.isEmpty ?? true) {
      if (geolocatorService.position == null) {
        return Either.left(
          ErrorType.noPosition(),
        );
      }
    }
    //print(Endpoints.currentWeatherByCityUrl(geolocatorService.position!));
    //print(Endpoints.currentWeatherByPosUrl(city!));
    try {
      final response = await dio.get(
        city?.isNotEmpty ?? false
            ? Endpoints.currentWeatherByCityUrl(city!)
            : Endpoints.currentWeatherByPosUrl(geolocatorService.position!),
      );
      if (response.statusCode == 200) {
        return Either.right(
          CurrentWeatherModel.fromJson(response.data),
        );
      }
      return Either.left(
        ErrorType.unknown(),
      );
    } catch (e) {
      if (e is DioException) {
        final statusCode = e.response?.statusCode;
        if (statusCode == null) {
          return Either.left(
            ErrorType.connection(),
          );
        }
        switch (statusCode) {
          case 401:
            return Either.left(
              ErrorType.apiKey(),
            );
          case 404:
            return Either.left(
              ErrorType.locationNotFound(),
            );
          case 429:
            return Either.left(
              ErrorType.freePlan(),
            );
          case 500 || 502 || 503 || 504:
            return Either.left(
              ErrorType.server(),
            );
          default:
            return Either.left(
              ErrorType.connection(),
            );
        }
      }
      return Either.left(
        ErrorType.unknown(),
      );
    }
  }
}
