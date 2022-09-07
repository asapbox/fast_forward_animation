import 'package:fast_forward_animation/fast_forward_animation/triangle_paint.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityTriangle extends StatelessWidget {
  const AnimatedOpacityTriangle({
    Key? key,
    this.animationController,
    this.animationInterval,
  }) : super(key: key);

  final AnimationController? animationController;

  final Interval? animationInterval;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,

      // CurvedAnimation(
      //   parent: animationController,
      //   curve: Curves.linear,
      // ),

      builder: (BuildContext context, Widget? child) {

        final animationPercent = animationInterval!.transform(animationController!.value);

        final x = animationPercent;

        // debugPrint('animationPercent = $animationPercent');

        // Parabolic function creates a range of values from 0 to 1 and back to 0.
        final opacity = -4*x*x + 4*x;
        // debugPrint('opacity = $opacity');
        // debugPrint('--------------');

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TrianglePaint(
                height: 100,
                width: 100,
                triangleColor: Colors.redAccent,
                opacityValue:  opacity,
              ),
            ),
          ],
        );
      },

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: TrianglePaint(
      //         height: 100,
      //         width: 100,
      //         triangleColor: Colors.redAccent,
      //         opacityValue: animationPercent,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
