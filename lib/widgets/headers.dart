import 'package:flutter/material.dart';

class HeaderSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderRoundedBorders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xffF5973D),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xffF5973D),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = Color(0xffF5973D);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    final path = Path();

    //Dibujar con path y paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xffF5973D),
      child: CustomPaint(
        painter: _HeaderTianglePainter(),
      ),
    );
  }
}

class _HeaderTianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = Color(0xffF5973D);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;
    final pathTop = Path();
    // final pathbottom = Path();

    //Dibujar con path y paint
    pathTop.lineTo(size.width, size.height);
    pathTop.lineTo(size.width, 0);
    pathTop.lineTo(0, 0);

    // pathbottom.lineTo(0, size.height);
    // pathbottom.lineTo(size.width, size.height);
    // pathbottom.lineTo(0, 0);

    canvas.drawPath(pathTop, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderBeak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xffF5973D),
      child: CustomPaint(
        painter: _HeaderBeakPainter(),
      ),
    );
  }
}

class _HeaderBeakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = Color(0xffF5973D);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 3;
    final path = Path();
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
