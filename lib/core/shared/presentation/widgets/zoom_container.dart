import 'package:flutter/material.dart';

class ZoomContainer extends StatefulWidget {
  const ZoomContainer({
    required this.child,
    this.resetDuration = const Duration(milliseconds: 200),
    this.enable = true,
    this.maxScale = 2.5,
    this.onStarCallback,
    this.onEndCallback,
    super.key,
  });

  final Widget child;
  final Duration resetDuration;
  final bool enable;
  final VoidCallback? onStarCallback;
  final VoidCallback? onEndCallback;
  final double maxScale;

  @override
  State<ZoomContainer> createState() => _ZoomContainerState();
}

class _ZoomContainerState extends State<ZoomContainer>
    with SingleTickerProviderStateMixin {
  late final TransformationController transformationController;
  late final AnimationController controllerReset;
  late Animation<Matrix4> animationReset;

  void onInteractionStart(_) {
    if (controllerReset.status == AnimationStatus.forward) {
      animateResetStop();
    }
  }

  void animateResetStop() {
    controllerReset.stop();
    animationReset.removeListener(onAnimateReset);
    animationReset = Matrix4Tween().animate(controllerReset);
    controllerReset.reset();
  }

  void onAnimateReset() {
    transformationController.value = animationReset.value;
    if (!controllerReset.isAnimating) {
      animationReset.removeListener(onAnimateReset);
      animationReset = Matrix4Tween().animate(controllerReset);
      controllerReset.reset();
    }
  }

  void animateResetInitialize(_) {
    controllerReset.reset();
    animationReset = Matrix4Tween(
      begin: transformationController.value,
      end: Matrix4.identity(),
    ).animate(controllerReset);
    animationReset.addListener(onAnimateReset);
    controllerReset.forward();
  }

  @override
  void initState() {
    transformationController = TransformationController();
    controllerReset = AnimationController(
      vsync: this,
      duration: widget.resetDuration,
    );
    super.initState();
  }

  @override
  void dispose() {
    controllerReset.dispose();
    transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: InteractiveViewer(
        scaleEnabled: widget.enable,
        maxScale: widget.maxScale,
        clipBehavior: Clip.none,
        panEnabled: false,
        transformationController: transformationController,
        onInteractionStart: widget.enable ? onInteractionStart : null,
        onInteractionEnd: animateResetInitialize,
        child: widget.child,
      ),
    );
  }
}
