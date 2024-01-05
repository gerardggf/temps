import 'package:flutter/material.dart';
import 'package:temps/generated/translations.g.dart';

import '../../../../../const/colors.dart';

class LocationNotFoundWidget extends StatelessWidget {
  const LocationNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [AppColors.clearSky, AppColors.sky],
        )),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              texts.global.theLocationHasNotBeenFound,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
