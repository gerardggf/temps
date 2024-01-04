import 'package:flutter/material.dart';

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
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'No se ha encontrado la ciudad',
              textAlign: TextAlign.center,
              style: TextStyle(
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
