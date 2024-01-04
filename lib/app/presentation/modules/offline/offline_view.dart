import 'package:flutter/material.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key});

//TODO: implementar esta vista y hacer stream que detecte desocneixon de internet

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No internet'),
      ),
    );
  }
}
