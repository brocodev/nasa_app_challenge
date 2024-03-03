import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:ui_common/ui_common.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SplashView();
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> circleAnimation;

  void animationListener() {
    if (controller.status == AnimationStatus.completed) {
      context.pushReplacementNamed(AppRoutes.onboarding.name);
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..forward();
    circleAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(.75, 1, curve: Curves.fastOutSlowIn),
    );
    controller.addListener(animationListener);
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
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              const Spacer(),
              Center(
                child: Assets.lottie.nasaSymbol.lottie(
                  height: 100,
                  controller: controller,
                ),
              ),
              const Spacer(),
              const CircularProgressIndicator(color: Colors.white),
              30.verticalSpace,
            ],
          ),
          AnimatedBuilder(
            animation: circleAnimation,
            builder: (context, _) {
              return Transform.scale(
                scale: 3 * circleAnimation.value,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.lerp(
                        context.scaffoldBackgroundColor,
                        context.backgroundColor,
                        circleAnimation.value * 1.5,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
