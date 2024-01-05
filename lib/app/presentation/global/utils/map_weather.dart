import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temps/app/const/colors.dart';
import '../../modules/home/widgets/weather_animations/rain_animation_widget.dart';
import '../../modules/home/widgets/weather_animations/snow_animation_widget.dart';

IconData mapIcons(int id) {
  switch (id) {
    case >= 200 && < 299:
      return Icons.thunderstorm_outlined;
    case >= 300 && < 399:
      return CupertinoIcons.cloud_drizzle;
    case >= 500 && < 599:
      return CupertinoIcons.cloud_rain;
    case >= 600 && < 699:
      return Icons.snowing;
    case 701 || 711 || 741:
      return Icons.foggy;
    case 781:
      return Icons.tornado_outlined;
    case 800:
      return CupertinoIcons.sun_max;
    case 801 || 802:
      return CupertinoIcons.cloud_sun;
    case >= 803 && < 899:
      return CupertinoIcons.cloud;
    default:
      return Icons.wb_sunny_outlined;
  }
}

List<Color> mapGradient(int id) {
  switch (id) {
    case > 200 && < 299:
      return [AppColors.lightCloudy, AppColors.cloudy];
    case >= 300 && < 399:
      return [AppColors.lightCloudy, AppColors.lightCloudy];
    case >= 500 && < 599:
      return [AppColors.lightCloudy, AppColors.cloudy];
    case >= 600 && < 699:
      return [AppColors.cloudy, AppColors.snowy];
    case 701 || 711 || 741:
      return [AppColors.lightCloudy, AppColors.cloudy];
    case 781:
      return [AppColors.cloudy, AppColors.heavyCloudy];
    case 800:
      return [AppColors.clearSky, AppColors.sky];
    case 801 || 802:
      return [AppColors.cloudy, AppColors.clearSky];
    case >= 803 && < 899:
      return [AppColors.cloudy, AppColors.cloudy];
    default:
      return [AppColors.clearSky, AppColors.sky];
  }
}

Widget mapWeatherAnimation(List<int> ids) {
  if ((ids.any((number) => number >= 500 && number < 600) ||
          ids.contains(310)) &&
      ids.any((number) => number >= 600 && number < 700)) {
    return const Stack(
      children: [
        RainAnimationWidget(),
        SnowAnimationWidget(),
      ],
    );
  } else if (ids.any((number) => number >= 300 && number < 399) ||
      ids.contains(500)) {
    return const RainAnimationWidget(
      intensity: 1,
    );
  } else if (ids.contains(502)) {
    return const RainAnimationWidget(
      intensity: 3,
    );
  } else if (ids.contains(503)) {
    return const RainAnimationWidget(
      intensity: 5,
      speed: 2,
    );
  } else if (ids.contains(504)) {
    return const RainAnimationWidget(
      intensity: 6,
      speed: 3,
    );
  } else if (ids.any((number) => number >= 500 && number < 600)) {
    return const RainAnimationWidget(
      intensity: 2,
    );
  } else if (ids.any((number) => number >= 600 && number < 700)) {
    return const SnowAnimationWidget();
  } else {
    return const SizedBox();
  }
}
