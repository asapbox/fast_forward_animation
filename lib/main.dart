import 'dart:ffi';

import 'package:fast_forward_animation/fast_forward_animation/animated_opacity_text.dart';
import 'package:fast_forward_animation/fast_forward_animation/animated_opacity_triangle.dart';
import 'package:fast_forward_animation/fast_forward_animation/custom_text_paint.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'fast_forward_animation/triangle_paint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FastForwardAnimation(title: 'Fast-Forward Animation'),
    );
  }
}

class FastForwardAnimation extends StatefulWidget {
  const FastForwardAnimation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FastForwardAnimation> createState() => _FastForwardAnimationState();
}

class _FastForwardAnimationState extends State<FastForwardAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  final _animationDuration = const Duration(milliseconds: 400);

  late Interval _firstFigureInterval;
  late Interval _secondFigureInterval;
  late Interval _thirdFigureInterval;

  int skipSeconds = 0;

  void _createAnimationIntervals() {
    _firstFigureInterval = const Interval(
      0,
      0.7,
      curve: Curves.slowMiddle,
    );

    _secondFigureInterval = const Interval(
      0.2,
      0.8,
      curve: Curves.slowMiddle,
    );

    _thirdFigureInterval = const Interval(
      0.4,
      1,
      curve: Curves.slowMiddle,
    );
  }

  @override
  void initState() {
    _createAnimationIntervals();

    _animationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
      value: 0.0,
    )..addListener(() => setState(() {
          if (_animationController.isCompleted) {
            skipSeconds = 0;
            debugPrint(
                '_animationController.value = ${_animationController.value}');
          }
          //  animateBack();
          //  debugPrint('_animationController.value = ${_animationController.value}');
        }));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // void animateBack() {
  //   if (_animationController.isCompleted) {
  //     _animationController.animateBack(
  //       0,
  //       duration: const Duration(milliseconds: 1000),
  //     );
  //   }
  // }

  void incrementBy(int skipSeconds) {
    setState(() {
      if (_animationController.isAnimating) {
        this.skipSeconds += skipSeconds;
        debugPrint('skipSeconds = $skipSeconds');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  AnimatedOpacityTriangle(
                    key: const ValueKey<String>('first_triangle'),
                    animationController: _animationController,
                    animationInterval: _firstFigureInterval,
                  ),
                  AnimatedOpacityText(
                    key: const ValueKey<String>('custom_text'),
                    customText: skipSeconds.toString(),
                    animationController: _animationController,
                    animationInterval: _firstFigureInterval,
                  )
                ],
              ),
            ),
            AnimatedOpacityTriangle(
              key: const ValueKey<String>('second_triangle'),
              animationController: _animationController,
              animationInterval: _secondFigureInterval,
            ),
            AnimatedOpacityTriangle(
              key: const ValueKey<String>('third_triangle'),
              animationController: _animationController,
              animationInterval: _thirdFigureInterval,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _animationController.value = 0;
            _animationController.forward();
            incrementBy(5);
          });
          //   debugPrint('Start animation Value= ${_animationController.value}');
        },
        tooltip: 'Action',
        child: const Icon(
          Icons.run_circle_outlined,
          size: 50,
        ),
      ),
    );
  }
}
