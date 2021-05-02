import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  @override
  _CircularProgresPageState createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    controller.addListener(() {
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgress(percentage),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;
  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    //Circle
    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);
    //bow
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
