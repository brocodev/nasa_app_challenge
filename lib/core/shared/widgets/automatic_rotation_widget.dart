import 'dart:math' as math;
import 'package:flutter/material.dart';

class AutomaticRotationWidget extends StatefulWidget {
  const AutomaticRotationWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AutomaticRotationWidget> createState() =>
      _AutomaticRotationWidgetState();
}

class _AutomaticRotationWidgetState extends State<AutomaticRotationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  void animationListener() {}

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100),
    )..addListener(animationListener)..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (_, child) => Transform.rotate(
        angle: (math.pi * 2) * controller.value,
        child: child,
      ),
    );
  }
}
