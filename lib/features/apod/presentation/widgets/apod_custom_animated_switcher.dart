import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/features/apod/presentation/cubits/page_values/page_values_cubit.dart';
import 'package:nasa_app_challenge/features/apod/presentation/widgets/apod_rotating_image_card.dart';
import 'package:ui_common/ui_common.dart';

class APODCustomAnimatedSwitcher extends StatelessWidget {
  const APODCustomAnimatedSwitcher({
    super.key,
    required this.apods,
  });

  final List<APODFile> apods;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BlocBuilder<PageValuesCubit, PageValuesState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: [
              APODRotatingImageCard(
                apod: apods[state.nextIndex.clamp(
                  0,
                  apods.length - 1,
                )],
                factorChange: state.nextPercent,
                direction: state.direction,
              ),
              APODRotatingImageCard(
                apod: apods[state.index],
                factorChange: state.percent,
                direction: state.direction,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black54,
                      Colors.black38,
                      Colors.black54,
                      context.scaffoldBackgroundColor,
                      context.scaffoldBackgroundColor,
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
