import 'dart:math';
import 'package:flutter/material.dart';

class RainDrop {
  double x;
  double y;
  double length;

  RainDrop({
    required this.x,
    required this.y,
    required this.length,
  });
}

class RainAnimationWidget extends StatefulWidget {
  const RainAnimationWidget({
    super.key,
    this.intensity = 2,
    this.speed = 1,
  });

  final int intensity;
  final int speed;

  @override
  State<RainAnimationWidget> createState() => _RainAnimationWidgetState();
}

class _RainAnimationWidgetState extends State<RainAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<RainDrop> rainDrops = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _controller.addListener(() {
      _generateRain();
    });
  }

  void _generateRain() {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (rainDrops.length < (40 * widget.intensity)) {
      rainDrops.add(RainDrop(
        x: random.nextDouble() * screenWidth,
        y: random.nextDouble() * screenHeight,
        length: random.nextDouble() * 20 + 10,
      ));
    }

    for (var rainDrop in rainDrops) {
      rainDrop.y = rainDrop.y + 3 + (widget.speed * 2);

      if (rainDrop.y > screenHeight) {
        rainDrop.y = 0;
        rainDrop.x = random.nextDouble() * screenWidth;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPaint(
        painter: RainPainter(rainDrops),
        size: Size.infinite,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RainPainter extends CustomPainter {
  List<RainDrop> rainDrops;

  RainPainter(this.rainDrops);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 140, 185, 218)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    for (var rainDrop in rainDrops) {
      canvas.drawLine(
        Offset(rainDrop.x, rainDrop.y),
        Offset(rainDrop.x, rainDrop.y + rainDrop.length),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
