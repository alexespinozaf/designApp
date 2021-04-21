import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> opacityOut;
  Animation<double> moveRight;
  Animation<double> enlarge;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeOutBack));
    // opacity = Tween(begin: 0.1, end: 1.0).animate(animationController);
    opacity = Tween(begin: 0.1, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0, 0.25)));
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0.75, 1.0)));
    moveRight = Tween(begin: 0.0, end: 200.0).animate(animationController);

    enlarge = Tween(begin: 0.0, end: 2.0).animate(animationController);

    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //play
    animationController.repeat();
    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
              angle: rotation.value,
              child: Opacity(
                  opacity: opacity.value - opacityOut.value,
                  child: Transform.scale(scale: enlarge.value, child: child))),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
