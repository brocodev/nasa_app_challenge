import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/apods_bloc/apods_bloc.dart';
import 'package:nasa_app_challenge/features/apod/presentation/cubits/page_values/page_values_cubit.dart';
import 'package:nasa_app_challenge/features/apod/presentation/widgets/apod_custom_animated_switcher.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';

class APODsPage extends StatelessWidget {
  const APODsPage({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageValuesCubit(initialIndex: index),
      child: _APODsView(index),
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

  void _pageListener() {
    final cubit = context.read<PageValuesCubit>();
    final index = controller.page!.floor();
    final percent = controller.page! - index;
    cubit
      ..changeIndex(index)
      ..changeNextIndex(index + 1)
      ..changePercent(percent)
      ..changeNextPercent(1 - percent);
    var pageIndex = cubit.state.pageIndex;
    if (percent == 0) {
      pageIndex = index;
      cubit.changePageIndex(index);
    }
    cubit.changeDirection(
      pageIndex <= controller.page!
          ? ScrollDirection.forward
          : ScrollDirection.reverse,
    );
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialPage);
    controller.addListener(_pageListener);
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('APOD'),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.download_rounded,
              color: Colors.white38,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<APODsBloc, APODsState>(
        builder: (context, state) {
          final apods = state.apods;
          return Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                bottom: .3.sh,
                left: -.5.sw,
                top: -.2.sw,
                right: -.5.sw,
                child: APODCustomAnimatedSwitcher(apods: apods),
              ),
              PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  final apod = apods[index];
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
                                      color: AppColors.primaryColor
                                          .withOpacity(.8),
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
      ),
    );
  }
}
