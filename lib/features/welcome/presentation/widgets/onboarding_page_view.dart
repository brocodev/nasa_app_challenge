import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/message_index_cubit.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/open_home_cubit.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/position_index_cubit.dart';
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

  void animationListener() {
    if (controller.status == AnimationStatus.dismissed) {
      context.read<MessageIndexCubit>().nextMessage();
      controller.forward();
    }
  }

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
          BlocBuilder<MessageIndexCubit, int>(
            builder: (_, index) {
              return _EntryAnimationWidget(
                listenable: titleEntryAnimation,
                child: [
                  _TitleText(
                    padding: 20.edgeInsetsR,
                    text: context.l10n.welcomeToTheNASAAwesomeApp,
                  ),
                  _TitleText(
                    padding: 20.edgeInsetsL,
                    text: context.l10n.exploreThingsBeyondPlanetEarth,
                    textAlign: TextAlign.right,
                  ),
                  _TitleText(
                    padding: 30.edgeInsetsT,
                    text: context.l10n.andDiscoverTheWondersOfTheCosmos,
                    textAlign: TextAlign.center,
                  ),
                ][index],
              );
            },
          ),
          30.verticalSpace,
          BlocBuilder<MessageIndexCubit, int>(
            builder: (_, index) {
              return _EntryAnimationWidget(
                listenable: buttonEntryAnimation,
                child: [
                  LabelButton(
                    offsetX: -12.w,
                    onPressed: () {
                      context.read<PositionIndexCubit>().nextPosition();
                      controller.reverse();
                    },
                    text: context.l10n.goAhead,
                  ),
                  LabelButton(
                    offsetX: 12.w,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      context.read<PositionIndexCubit>().nextPosition();
                      controller.reverse();
                    },
                    text: context.l10n.goAhead,
                  ),
                  LabelButton(
                    alignment: Alignment.center,
                    onPressed: () => context.read<OpenHomeCubit>().change(true),
                    text: context.l10n.startNow,
                  ),
                ][index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class LabelButton extends StatelessWidget {
  const LabelButton({
    required this.onPressed,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.offsetX = 0,
    super.key,
  });

  final VoidCallback onPressed;
  final String text;
  final double offsetX;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: Offset(offsetX, 0),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(padding: 12.edgeInsetsH),
          child: Text(text),
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText({
    required this.padding,
    required this.text,
    this.textAlign,
    super.key,
  });

  final EdgeInsets padding;
  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: context.displaySmall,
        textAlign: textAlign,
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
