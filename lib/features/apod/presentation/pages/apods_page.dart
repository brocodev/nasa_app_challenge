import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/apods_bloc/apods_bloc.dart';
import 'package:nasa_app_challenge/features/apod/presentation/widgets/apod_rotating_image_card.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';

class APODsPage extends StatelessWidget {
  const APODsPage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('APOD'),
      ),
      extendBodyBehindAppBar: true,
      body: _APODsView(index),
    );
  }
}

class _APODsView extends StatefulWidget {
  const _APODsView(this.initialPage);

  final int initialPage;

  @override
  State<_APODsView> createState() => _APODsViewState();
}

class _APODsViewState extends State<_APODsView> {
  late final PageController controller;

  late int index;

  late int auxIndex;
  late double percent;
  late double auxPercent;

  ScrollDirection direction = ScrollDirection.idle;

  void _pageListener() {
    index = controller.page!.floor();
    auxIndex = index + 1;
    percent = (controller.page! - index).abs();
    auxPercent = 1.0 - percent;
    direction = controller.position.userScrollDirection;
    print(controller.position.userScrollDirection);
    setState(() {});
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialPage);
    controller.addListener(_pageListener);
    index = widget.initialPage;
    auxIndex = index + 1;
    percent = 0.0;
    auxPercent = 1.0 - percent;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<APODsBloc, APODsState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              bottom: .3.sh,
              left: -.5.sw,
              top: -.2.sw,
              right: -.5.sw,
              child: ClipRRect(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    APODRotatingImageCard(
                      apod: state
                          .apods[auxIndex.clamp(0, state.apods.length - 1)],
                      animation: AlwaysStoppedAnimation(1 - auxPercent),
                    ),
                    APODRotatingImageCard(
                      apod: state.apods[index],
                      animation: AlwaysStoppedAnimation(1 - percent),
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
                ),
              ),
            ),
            PageView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                final apod = state.apods[index];
                return SingleChildScrollView(
                  padding: 20.edgeInsetsH.copyWith(bottom: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: .53.sh),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  apod.title,
                                  style: context.titleMedium.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                                Text(
                                  apod.date.dayMonthYear(context.l10n),
                                  overflow: TextOverflow.ellipsis,
                                  style: context.labelMedium.copyWith(
                                    color:
                                        AppColors.primaryColor.withOpacity(.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () => context.pushNamed(
                              AppRoutes.viewApod.name,
                              extra: apod,
                            ),
                            mini: true,
                            child: apod.map(
                              video: (_) =>
                                  const Icon(Icons.play_arrow_rounded),
                              image: (_) =>
                                  const Icon(Icons.zoom_out_map_rounded),
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Text(
                        apod.explanation,
                        style: context.bodySmall.copyWith(
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }
}
