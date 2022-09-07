import 'package:fast_forward_animation/fast_forward_animation/triangle_painter.dart';
import 'package:flutter/material.dart';

class TrianglePaint extends StatelessWidget {
  const TrianglePaint({
    Key? key,
    required this.height,
    required this.width,
    required this.triangleColor,
    required this.opacityValue,
  }) : super(key: key);

  final double height;
  final double width;
  final Color triangleColor;
  final double opacityValue;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(
        heightY: height,
        widthX: width,
        triangleColor: triangleColor,
        opacityValue: opacityValue,
      ),
      child:  SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
