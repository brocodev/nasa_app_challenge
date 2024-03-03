import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/message_index_cubit.dart';
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
      ],
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () => context.pushReplacementNamed(AppRoutes.home.name),
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
