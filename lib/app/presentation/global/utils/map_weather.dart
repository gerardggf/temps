import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temps/app/const/colors.dart';

IconData mapIcons(int id) {
  switch (id) {
    case > 200 && < 299:
      return Icons.thunderstorm_outlined;
    case > 300 && < 399:
      return CupertinoIcons.cloud_drizzle;
    case > 500 && < 599:
      return CupertinoIcons.cloud_rain;
    case > 600 && < 699:
      return Icons.snowing;
    case > 701 || 711 || 741:
      return Icons.foggy;
    case > 781:
      return Icons.tornado_outlined;
    case > 800:
      return Icons.wb_sunny_outlined;
    case > 801 && < 899:
      return Icons.cloud_outlined;
    default:
      return Icons.wb_sunny_outlined;
  }
}

Color mapColors(int id) {
  switch (id) {
    case > 200 && < 299:
      return AppColors.cloudy;
    case > 300 && < 399:
      return AppColors.lightCloudy;
    case > 500 && < 599:
      return AppColors.cloudy;
    case > 600 && < 699:
      return AppColors.snowy;
    case > 701 || 711 || 741:
      return AppColors.cloudy;
    case > 781:
      return AppColors.heavyCloudy;
    case > 800:
      return AppColors.clearSky;
    case > 801 && < 899:
      return AppColors.cloudy;
    default:
      return AppColors.clearSky;
  }
}
