import 'package:flip_animation/flip_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flip Animation',
      theme: ThemeData.dark(),
      home: const FlipAnimation(),
    );
  }
}
