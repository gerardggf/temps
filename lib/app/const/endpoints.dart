import 'package:geolocator/geolocator.dart';

class Endpoints {
  Endpoints._();

  static const String apiKey = '052a0252b9f8c92694681c9bf3d6a77b';

  static String weatherUrl(Position pos) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=${pos.latitude}&lon=${pos.longitude}&exclude={part}&appid=$apiKey';
}
