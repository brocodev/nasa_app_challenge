import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:ui_common/ui_common.dart';

class APODRotatingImageCard extends StatelessWidget {
  const APODRotatingImageCard({
    required this.apod,
    required this.factorChange,
    required this.direction,
    super.key,
  });

  final APODFile apod;
  final double factorChange;
  final ScrollDirection direction;

  @override
  Widget build(BuildContext context) {
    final imageUrl = apod.map(
      video: (value) => value.thumbnailUrl,
      image: (value) => value.url,
    );
    final animation = AlwaysStoppedAnimation(1 - factorChange);
    final interval1 = CurvedAnimation(
      parent: animation,
      curve: const Interval(.5, 1),
    );
    final interval2 = CurvedAnimation(
      parent: animation,
      curve: const Interval(.25, 1),
    );
    final interval3 = CurvedAnimation(
      parent: animation,
      curve: const Interval(0, 1),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          padding: 1.edgeInsetsB,
          child: _AnimationWrapper(
            animation: interval3,
            direction: direction,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        _AnimationWrapper(
          animation: interval2,
          direction: direction,
          child: ClipPath(
            clipper: _CircleClipper(dimension: .85.sw),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(.2),
              fit: BoxFit.cover,
            ),
          ),
        ),
        _AnimationWrapper(
          animation: interval1,
          direction: direction,
          child: ClipPath(
            clipper: _CircleClipper(dimension: .4.sw),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimationWrapper extends StatelessWidget {
  const _AnimationWrapper({
    required this.child,
    required this.animation,
    required this.direction,
  });

  final Widget child;
  final Animation<double> animation;
  final ScrollDirection direction;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: RotationTransition(
        turns: direction == ScrollDirection.forward
            ? Tween<double>(begin: 1, end: 0).animate(animation)
            : animation,
        child: child,
      ),
    );
  }
}

class _CircleClipper extends CustomClipper<Path> {
  _CircleClipper({
    required this.dimension,
    super.reclip,
  });

  final double dimension;

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: dimension / 2);
    return Path()..addOval(rect);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>
      this != oldClipper;
}
