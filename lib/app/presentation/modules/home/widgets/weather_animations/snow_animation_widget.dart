// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';

// class SnowAnimationWidget extends StatefulWidget {
//   const SnowAnimationWidget({super.key});

//   @override
//   State<SnowAnimationWidget> createState() => _SnowAnimationWidgetState();
// }

// class _SnowAnimationWidgetState extends State<SnowAnimationWidget> {
//   final Random _random = Random();
//   late Timer _timer;
//   late List<Widget> snowflakes;

//   @override
//   void initState() {
//     super.initState();
//     snowflakes = List.generate(
//       100,
//       (index) => Positioned(
//         left: _random.nextDouble() * 400,
//         top: _random.nextDouble() * 800,
//         child: Container(
//           width: 8,
//           height: 8,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );

//     _timer = Timer.periodic(Duration(milliseconds: 50), (_) {
//       _updateSnowflakes();
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _updateSnowflakes() {
//     setState(() {
//       snowflakes = List.generate(
//         100,
//         (index) => Positioned(
//           left: _random.nextDouble() * 400,
//           top: _random.nextDouble() * 800,
//           child: Container(
//             width: 8,
//             height: 8,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: snowflakes,
//       ),
//     );
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';

class SnowFlake {
  double x;
  double y;
  double length;

  SnowFlake({
    required this.x,
    required this.y,
    required this.length,
  });
}

class SnowAnimationWidget extends StatefulWidget {
  const SnowAnimationWidget({super.key});

  @override
  State<SnowAnimationWidget> createState() => _SnowAnimationWidgetState();
}

class _SnowAnimationWidgetState extends State<SnowAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<SnowFlake> snowFlakes = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _controller.addListener(() {
      _generateSnow();
    });
  }

  void _generateSnow() {
    final random = Random();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    if (snowFlakes.length < 100) {
      snowFlakes.add(
        SnowFlake(
          x: random.nextDouble() * screenWidth,
          y: random.nextDouble() * screenHeight,
          length: random.nextDouble() * 20 + 10,
        ),
      );
    }

    for (var snowFlake in snowFlakes) {
      snowFlake.y += 1;

      if (snowFlake.y > screenHeight) {
        snowFlake.y = 0;
        snowFlake.x = random.nextDouble() * screenWidth;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomPaint(
        painter: SnowPainter(snowFlakes),
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

class SnowPainter extends CustomPainter {
  List<SnowFlake> snowFlakes;

  SnowPainter(this.snowFlakes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white70
      ..strokeCap = StrokeCap.round;

    for (var snowFlake in snowFlakes) {
      canvas.drawCircle(
        Offset(snowFlake.x, snowFlake.y),
        4,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
