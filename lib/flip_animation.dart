import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation({super.key});

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with TickerProviderStateMixin<FlipAnimation> {
  late AnimationController _controller;
  late Animation<double> _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(_animationListener)
      ..addStatusListener(_animationStatusListener);
  }

  void _animationListener() {
    setState(() {});
  }

  void _animationStatusListener(AnimationStatus status) {
    _status = status;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_animationListener);
    _controller.removeStatusListener(_animationStatusListener);
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(2, 1, 0.0015)
                ..rotateY(pi * _animation.value),
              child: Card(
                child: _animation.value <= .5
                    ? const FlutterLogo(
                        size: 200,
                      )
                    : const FlutterLogo(
                        size: 200,
                      ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_status == AnimationStatus.dismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: const Text('Flip'),
            ),
          ],
        ),
      ),
    );
  }
}
