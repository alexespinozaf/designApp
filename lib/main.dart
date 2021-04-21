import 'package:design/challenges/animated_square_page.dart';
import 'package:design/pages/animation_page.dart';
import 'package:design/pages/header_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diseño app',
        home: AnimatedSquarePage());
  }
}
