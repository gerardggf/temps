import 'package:dio/dio.dart';
import 'package:temps/app/const/endpoints.dart';
import 'package:temps/app/data/services/local/geolocator_service.dart';
import 'package:temps/app/domain/models/current_weather_model.dart';
import 'package:temps/app/domain/repositories/weather_repository.dart';

import '../../domain/either/either.dart';
import '../../domain/http_failure/http_failure.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(
    this.dio,
    this.geolocatorService,
  );

  final Dio dio;
  final GeolocatorService geolocatorService;

  @override
  Future<Either<HttpFailure, CurrentWeatherModel>>
      getCurrentWeatherData() async {
    if (geolocatorService.position == null) {
      return Either.left(
        HttpFailure.noPosition(),
      );
    }
    print(
      Endpoints.nextDaysWeatherUrl(geolocatorService.position!),
    );
    try {
      //print(Endpoints.weatherUrl(geolocatorService.position!));
      final response = await dio.get(
        Endpoints.currentWeatherUrl(geolocatorService.position!),
      );

      final result = CurrentWeatherModel.fromJson(response.data);
      return Either.right(result);
    } catch (e) {
      return Either.left(
        HttpFailure.network(),
      );
    }
  }

  @override
  Future<Either<HttpFailure, CurrentWeatherModel>>
      getNextDaysWeatherData() async {
    if (geolocatorService.position == null) {
      return Either.left(
        HttpFailure.noPosition(),
      );
    }
    try {
      //print(Endpoints.nextDaysWeatherUrl(geolocatorService.position!),);
      final response = await dio.get(
        Endpoints.nextDaysWeatherUrl(geolocatorService.position!),
      );

      final result = CurrentWeatherModel.fromJson(response.data);
      return Either.right(result);
    } catch (e) {
      return Either.left(
        HttpFailure.network(),
      );
    }
  }
}
