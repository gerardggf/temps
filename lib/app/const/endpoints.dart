import 'package:geolocator/geolocator.dart';

class Endpoints {
  Endpoints._();

  ///Url path to request the current weather
  static const String apiKey = '052a0252b9f8c92694681c9bf3d6a77b';

  static String currentWeatherByPosUrl(Position pos) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=${pos.latitude}&lon=${pos.longitude}&appid=$apiKey';

  static String currentWeatherByCityUrl(String city) =>
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

  ///Number of days returned by the API in next days weather request.
  ///
  ///The value can be from 1 to 16
  static const int kNumOfDays = 10;

  ///Url path to request the next days weather
  static String nextDaysWeatherUrl(Position pos) =>
      'api.openweathermap.org/data/2.5/forecast/daily?lat=${pos.latitude}&lon=${pos.longitude}&cnt=$kNumOfDays&appid=$apiKey';
}
