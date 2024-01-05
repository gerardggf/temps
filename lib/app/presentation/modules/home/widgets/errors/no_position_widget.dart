import 'package:flutter/material.dart';
import 'package:temps/generated/translations.g.dart';

class NoPositionWidget extends StatelessWidget {
  const NoPositionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          texts.global.yourLocationCouldNotBeDetected,
        ),
      ),
    );
  }
}
