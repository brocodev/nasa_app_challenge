import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouteTransition {
  scale,
  slideFromBottom,
  slideFromRight,
  slideFromLeft,
  slideFromTop,
  fade,
  fadeUp,
  fadeDown,
  fadeToLeft,
  fadeToRight,
  fadeScale,
}

Page<T> buildTransitionPage<T>({
  required RouteTransition transition,
  required Widget child,
}) {
  return CustomTransitionPage(
    transitionsBuilder: (
      __,
      animation,
      _,
      child,
    ) =>
        _buildTransition(
      transition: transition,
      animation: animation,
      child: child,
    ),
    child: child,
  );
}

Widget _buildTransition({
  required Animation<double> animation,
  required RouteTransition transition,
  required Widget child,
}) {
  switch (transition) {
    case RouteTransition.scale:
      return ScaleTransition(
        scale: _transformAnimation(animation, Curves.easeOutQuart),
        child: child,
      );
    case RouteTransition.slideFromBottom:
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: Offset.zero).animate(
          _transformAnimation(animation, Curves.fastOutSlowIn),
        ),
        child: child,
      );
    case RouteTransition.slideFromRight:
      return SlideTransition(
        position: Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
          _transformAnimation(animation, Curves.fastOutSlowIn),
        ),
        child: child,
      );

    case RouteTransition.slideFromLeft:
      return SlideTransition(
        position: Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
          _transformAnimation(animation, Curves.fastOutSlowIn),
        ),
        child: child,
      );
    case RouteTransition.slideFromTop:
      return SlideTransition(
        position: Tween(begin: const Offset(0, -1), end: Offset.zero).animate(
          _transformAnimation(animation, Curves.fastOutSlowIn),
        ),
        child: child,
      );
    case RouteTransition.fade:
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    case RouteTransition.fadeUp:
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position:
              Tween(begin: const Offset(0, .05), end: Offset.zero).animate(
            _transformAnimation(animation, Curves.fastOutSlowIn),
          ),
          child: child,
        ),
      );
    case RouteTransition.fadeDown:
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position:
              Tween(begin: const Offset(0, -.05), end: Offset.zero).animate(
            _transformAnimation(animation, Curves.fastOutSlowIn),
          ),
          child: child,
        ),
      );
    case RouteTransition.fadeToLeft:
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position:
              Tween(begin: const Offset(.05, 0), end: Offset.zero).animate(
            _transformAnimation(animation, Curves.fastOutSlowIn),
          ),
          child: child,
        ),
      );
    case RouteTransition.fadeToRight:
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position:
              Tween(begin: const Offset(-.05, 0), end: Offset.zero).animate(
            _transformAnimation(animation, Curves.fastOutSlowIn),
          ),
          child: child,
        ),
      );
    case RouteTransition.fadeScale:
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: .8, end: 1).animate(
            _transformAnimation(animation, Curves.easeOutBack),
          ),
          child: child,
        ),
      );
  }
}

CurvedAnimation _transformAnimation(
  Animation<double> animation,
  Curve curve,
) =>
    CurvedAnimation(
      parent: animation,
      curve: curve,
    );
