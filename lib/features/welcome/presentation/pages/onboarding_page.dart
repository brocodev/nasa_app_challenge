
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:ui_common/ui_common.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _OnboardingView();
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            height: 3.sh,
            bottom: -2.2.sh,
            right: -3.5.sw,
            child: AutomaticRotationWidget(
              child: Assets.images.earth.image(),
            ),
          ),
        ],
      ),
    );
  }
}
