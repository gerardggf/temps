import 'package:dio/dio.dart';
import 'package:temps/app/const/endpoints.dart';
import 'package:temps/app/data/services/local/geolocator_service.dart';
import 'package:temps/app/domain/models/weather_model.dart';
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
  Future<Either<HttpFailure, WeatherModel>> getWeatherData() async {
    if (geolocatorService.position == null) {
      return Either.left(
        HttpFailure.noPosition(),
      );
    }
    try {
      print(Endpoints.weatherUrl(geolocatorService.position!));
      final response = await dio.get(
        Endpoints.weatherUrl(geolocatorService.position!),
      );

      final result = WeatherModel.fromJson(response.data);
      return Either.right(result);
    } catch (e) {
      return Either.left(
        HttpFailure.network(),
      );
    }
  }
}
