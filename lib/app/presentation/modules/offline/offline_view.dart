import 'package:flutter/material.dart';
import 'package:temps/generated/translations.g.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key});

//TODO: implementar esta vista y hacer stream que detecte desocneixon de internet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          texts.global.noInternet,
        ),
      ),
    );
  }
}
