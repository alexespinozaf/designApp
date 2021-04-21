import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _AnimatedSquare()),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  @override
  __AnimatedSquareState createState() => __AnimatedSquareState();
}

class __AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> moveRight;
  Animation<double> moveTop;
  Animation<double> moveLeft;
  Animation<double> moveBotton;

  @override
  void initState() {
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    moveRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.25, curve: Curves.bounceIn)));
    moveTop = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.25, 0.5, curve: Curves.bounceIn)));
    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.75, curve: Curves.bounceIn)));
    moveBotton = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.bounceIn)));

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
    animationController.repeat();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
            offset: Offset(moveRight.value + moveLeft.value,
                moveTop.value + moveBotton.value),
            child: child);
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
