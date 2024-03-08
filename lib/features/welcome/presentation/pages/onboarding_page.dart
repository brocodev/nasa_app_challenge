import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/message_index_cubit.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/open_home_cubit.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/position_index_cubit.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/widgets/onboarding_page_view.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/widgets/rotating_earth_widget.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PositionIndexCubit(value: 0)),
        BlocProvider(create: (_) => MessageIndexCubit(value: 0)),
        BlocProvider(create: (_) => OpenHomeCubit()),
      ],
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView>
    with SingleTickerProviderStateMixin {
  late final AnimationController outAnimationController;

  void animationListener() {
    if (outAnimationController.status == AnimationStatus.completed) {
      context.pushReplacementNamed(AppRoutes.home.name);
    }
  }

  @override
  void initState() {
    outAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addListener(animationListener);
    super.initState();
  }

  @override
  void dispose() {
    outAnimationController
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OpenHomeCubit, bool>(
      listener: (_, state) {
        if (state) outAnimationController.forward();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            backgroundColor: context.backgroundColor,
            appBar: const _OnboardingAppBar(),
            body: const Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                RotatingEarthWidget(),
                SafeArea(
                  child: OnboardingPageView(),
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: outAnimationController,
            builder: (context, _) {
              return Transform.scale(
                scale: 3 * outAnimationController.value,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.lerp(
                        context.backgroundColor,
                        context.scaffoldBackgroundColor,
                        outAnimationController.value * 1.5,
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

class _OnboardingAppBar extends StatelessWidget implements PreferredSize {
  const _OnboardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 1, end: 0),
      curve: const Interval(
        0.33,
        1,
        curve: Curves.fastOutSlowIn,
      ),
      builder: (_, value, child) {
        return Opacity(
          opacity: 1 - value,
          child: Transform.translate(
            offset: Offset(0, 30 * value),
            child: child,
          ),
        );
      },
      child: AppBar(
        backgroundColor: context.backgroundColor,
        toolbarHeight: (kToolbarHeight + 10).sp,
        centerTitle: false,
        title: Assets.images.nasaGlobe.image(height: kToolbarHeight.sp),
        actions: [
          TextButton(
            onPressed: () => context.read<OpenHomeCubit>().change(true),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Text(
              context.l10n.skip,
              style: context.labelSmall.copyWith(color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => Size.fromHeight((kToolbarHeight + 10).sp);
}
