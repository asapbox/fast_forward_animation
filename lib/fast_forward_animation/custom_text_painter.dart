import 'package:flutter/material.dart';

class CustomTextPainter extends CustomPainter {
  CustomTextPainter({
    required this.heightY,
    required this.widthX,
    required this.customText,
    required this.textColor,
    required this.opacityValue,
  });

  final double heightY;
  final double widthX;
  final String customText;
  final Color textColor;
  final double opacityValue;

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing text
    final textPainter = TextPainter(
      text: TextSpan(
        text: customText,
        style: TextStyle(color: textColor.withOpacity(opacityValue), fontSize: 25),
      ),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    textPainter.paint(
      canvas,
      Offset((widthX - textWidth) / 4, (heightY - textHeight) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomTextPainter oldDelegate) {
    return this != oldDelegate;
  }
}
