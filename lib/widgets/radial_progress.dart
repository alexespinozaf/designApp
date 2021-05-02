import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryThickness;
  const RadialProgress(
      {@required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.secondaryThickness = 10.0});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final differenceAnimate = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MyRadialProgress(
                  (widget.percentage - differenceAnimate) +
                      (differenceAnimate * controller.value),
                  widget.primaryColor,
                  widget.secondaryColor,
                  widget.secondaryThickness),
            ),
          );
        });
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double secondaryThickness;
  _MyRadialProgress(this.percentage, this.primaryColor, this.secondaryColor,
      this.secondaryThickness);

  @override
  void paint(Canvas canvas, Size size) {
    //Circle
    final paint = new Paint()
      ..strokeWidth = secondaryThickness
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height / 2);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);
    //bow
    final paintArc = new Paint()
      ..strokeWidth = 10
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
