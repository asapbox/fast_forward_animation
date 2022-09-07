import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  TrianglePainter({
    required this.heightY,
    required this.widthX,
    required this.triangleColor,
    required this.opacityValue,
  });

  final double heightY;
  final double widthX;
  final Color triangleColor;
  final double opacityValue;

  @override
  void paint(Canvas canvas, Size size) {
    // First triangle.
    canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(widthX, heightY / 2)
          ..lineTo(0, heightY)
          ..lineTo(0, 0),
        Paint()
          ..color = Colors.grey.withOpacity(opacityValue)

          // ColorTween(
          //   begin: triangleColor,
          //   end: null, // equivalent of transparent color
          // ).
          // transform(opacityValue)!
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant TrianglePainter oldDelegate) {
    return this != oldDelegate;
  }
}
