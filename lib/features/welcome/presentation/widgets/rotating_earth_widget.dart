import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/welcome/presentation/cubits/position_index_cubit.dart';
import 'package:ui_common/ui_common.dart';

class RotatingEarthWidget extends StatelessWidget {
  const RotatingEarthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PositionIndexCubit, int>(
      builder: (_, index) {
        return AnimatedPositioned(
          duration: const Duration(seconds: 4),
          curve: Curves.fastOutSlowIn,
          height: 2.5.sh,
          bottom: [
            -1.85.sh,
            -1.6.sh,
            -1.95.sh,
          ][index],
          right: [
            -1.5.sh,
            -0.25.sh,
            -1.sh,
          ][index],
          child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 2000),
            tween: Tween(begin: 1, end: 0),
            curve: const Interval(
              0.3,
              1,
              curve: Curves.fastOutSlowIn,
            ),
            builder: (_, value, child) {
              return Opacity(
                opacity: 1 - value,
                child: Transform.translate(
                  offset: Offset(200 * value, 200 * value),
                  child: child,
                ),
              );
            },
            child: const _EarthWidget(),
          ),
        );
      },
    );
  }
}

class _EarthWidget extends StatelessWidget {
  const _EarthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.absoluteBlue,
            AppColors.absoluteBlue.withOpacity(0.5),
            AppColors.absoluteBlue.withOpacity(0),
          ],
        ),
      ),
      child: AutomaticRotationWidget(
        child: Assets.images.earth.image(fit: BoxFit.cover),
      ),
    );
  }
}
