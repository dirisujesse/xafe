import 'package:flutter/material.dart';
import 'package:xafe/style/colors.dart';

class GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    final lightBlue = Color(0xFF3F74FF);
    final blue = Color(0xFF0047FF);

    Rect rect = new Rect.fromLTWH(0, 0, size.width, size.height);

    final Gradient gradient = LinearGradient(
      colors: <Color>[lightBlue, blue],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    paint.shader = gradient.createShader(rect);
    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProgressPainter extends CustomPainter {
  Color color;
  Color inactiveColor;
  final double extent;

  ProgressPainter({
    this.color = XfColors.black,
    this.inactiveColor = XfColors.grey,
    this.extent = 0,
  }) : assert(extent >= 0 && extent <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..style = PaintingStyle.fill;
    Paint paint2 = Paint()
      ..color = inactiveColor
      ..strokeWidth = size.height
      ..style = PaintingStyle.fill;

    if (extent < 1) {
      canvas.drawPath(_strokeButt(size, ignoreExtent: true), paint2);
    }
    canvas.drawPath(_strokeButt(size), paint);
  }

  Path _strokeButt(Size size, {bool ignoreExtent = false}) {
    final path = Path();
    double x = size.width;
    double y = size.height;
    double widthFraction = (x * (ignoreExtent ? 1 : extent));
    path.addRRect(
      RRect.fromLTRBR(
        0,
        0,
        widthFraction,
        y,
        Radius.circular(size.width * .5),
      ),
    );

    return path;
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.extent != extent;
  }
}

class BarPainter extends CustomPainter {
  Color color;
  Color inactiveColor;
  final double extent;

  BarPainter({
    this.color = XfColors.white,
    this.inactiveColor = XfColors.transparent,
    this.extent = 0,
  }) : assert(extent >= 0 && extent <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.width
      ..style = PaintingStyle.fill;
    Paint paint2 = Paint()
      ..color = inactiveColor
      ..strokeWidth = size.width
      ..style = PaintingStyle.fill;

    if (extent < 1) {
      canvas.drawPath(_strokeButt(size, ignoreExtent: true), paint2);
    }
    canvas.drawPath(_strokeButt(size), paint);
  }

  Path _strokeButt(Size size, {bool ignoreExtent = false}) {
    final path = Path();
    double x = size.width * .6;
    double y = size.height;
    double heightFraction = (y - (y * (ignoreExtent ? 1 : extent)));
    path.addRRect(
      RRect.fromLTRBR(
        0,
        heightFraction,
        x,
        y,
        Radius.circular(size.width * .1),
      ),
    );

    return path;
  }

  @override
  bool shouldRepaint(BarPainter oldDelegate) {
    return oldDelegate.extent != extent;
  }
}
