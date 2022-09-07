import 'package:fast_forward_animation/fast_forward_animation/triangle_painter.dart';
import 'package:flutter/material.dart';

import 'custom_text_painter.dart';

class CustomTextPaint extends StatelessWidget {
  const CustomTextPaint({
    Key? key,
    required this.height,
    required this.width,
    required this.customText,
    required this.textColor,
    required this.opacityValue,
  }) : super(key: key);

  final double height;
  final double width;
  final String customText;
  final Color textColor;
  final double opacityValue;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomTextPainter(
        heightY: height,
        widthX: width,
        customText: customText,
        textColor: textColor,
        opacityValue: opacityValue,
      ),
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
