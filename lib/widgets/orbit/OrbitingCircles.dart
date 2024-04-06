import 'package:flutter/material.dart';
import 'package:putt_putt_pal/widgets/orbit/OrbitPainter.dart';

class OrbitingCircles extends StatefulWidget {
  const OrbitingCircles({super.key});

  @override
  State<OrbitingCircles> createState() => _OrbitingCirclesState();
}

class _OrbitingCirclesState extends State<OrbitingCircles>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(200, 200),
        painter: OrbitPainter(_controller),
      ),
    );
  }
}
