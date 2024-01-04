import 'package:flutter/material.dart';

class NoPositionWidget extends StatelessWidget {
  const NoPositionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text('No se ha podido encontrar tu posición'),
      ),
    );
  }
}
