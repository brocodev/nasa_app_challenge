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

  void _animationListener() {
    if(controller.value >= .8){
      controller.stop();
      context.pushReplacementNamed(AppRoutes.onboarding.name);
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..forward();
    controller.addListener(_animationListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f0f0f),
      body: Column(
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
    );
  }
}
