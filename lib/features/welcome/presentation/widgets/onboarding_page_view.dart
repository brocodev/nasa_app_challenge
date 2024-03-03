import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({
    super.key,
  });

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> titleEntryAnimation;
  late final Animation<double> buttonEntryAnimation;

  void animationListener() {}

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(animationListener);
    titleEntryAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0, .7),
    );
    buttonEntryAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(.3, 1),
    );
    Future.delayed(
      const Duration(milliseconds: 400),
      () => controller.forward(),
    );
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
    return Padding(
      padding: 20.edgeInsetsA,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.verticalSpace,
          _EntryAnimationWidget(
            listenable: titleEntryAnimation,
            child: Padding(
              padding: 20.edgeInsetsR,
              child: Text(
                context.l10n.welcomeToTheNASAAwesomeApp,
                style: context.displaySmall,
              ),
            ),
          ),
          30.verticalSpace,
          _EntryAnimationWidget(
            listenable: buttonEntryAnimation,
            child: Transform.translate(
              offset: Offset(-12.w, 0),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: 12.edgeInsetsH,
                ),
                child: Text(context.l10n.goAhead),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EntryAnimationWidget extends AnimatedWidget {
  const _EntryAnimationWidget({
    required super.listenable,
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final value = animation.value;
    return FadeTransition(
      opacity: animation,
      child: Transform.translate(
        offset: Offset(0, 20 * (1 - value)),
        child: child,
      ),
    );
  }
}
