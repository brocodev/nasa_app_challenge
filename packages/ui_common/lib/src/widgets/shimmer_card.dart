import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_common/src/extensions/extensions.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    required this.aspectRatio,
    this.borderRadius,
    super.key,
  });

  final double aspectRatio;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Shimmer.fromColors(
        baseColor: context.scaffoldBackgroundColor,
        highlightColor: context.backgroundColor.withOpacity(.4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? 12.borderRadiusA,
            color: context.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
