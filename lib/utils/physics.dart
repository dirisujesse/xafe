import 'dart:math' as math;

import 'package:flutter/material.dart';

class MarqueSimulation extends Simulation {
  final double intiPos;
  final double velocity;

  MarqueSimulation({required this.intiPos, required this.velocity});

  @override
  double x(double time) {
    final max = math.max(math.min(intiPos, 0.0), intiPos + velocity * time);
    return max.toDouble();
  }

  @override
  double dx(double time) {
    return velocity;
  }

  @override
  bool isDone(double time) {
    return false;
  }
}

class MarqueScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return MarqueScrollPhysics();
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    return MarqueSimulation(intiPos: position.pixels, velocity: 50);
  }
}
