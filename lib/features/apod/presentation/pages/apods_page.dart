import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/apods_bloc/apods_bloc.dart';
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
  int index = 0;

  void _pageListener() {}

  @override
  void initState() {
    controller = PageController(initialPage: widget.initialPage);
    controller.addListener(_pageListener);
    index = widget.initialPage;
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
              bottom: .4.sh,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: state.apods[index].map(
                      video: (value) => value.thumbnailUrl,
                      image: (value) => value.url,
                    ),
                    fit: BoxFit.cover,
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
                        ],
                      ),
                    ),
                  ),
                  // Positioned.fill(
                  //   left: 20.w,
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           crossAxisAlignment: CrossAxisAlignment.stretch,
                  //           children: [
                  //             Text(
                  //               apod.title,
                  //               style: context.titleMedium.copyWith(
                  //                 color: Colors.white70,
                  //               ),
                  //             ),
                  //             Text(
                  //               apod.date.dayMonthYear(context.l10n),
                  //               overflow: TextOverflow.ellipsis,
                  //               style: context.bodyMedium.copyWith(
                  //                 color: Colors.white38,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       FloatingActionButton(
                  //         onPressed: () {},
                  //         mini: true,
                  //         child: apod.map(
                  //           video: (_) => const Icon(Icons.play_arrow_rounded),
                  //           image: (_) =>
                  //               const Icon(Icons.zoom_out_map_rounded),
                  //         ),
                  //       ),
                  //       12.horizontalSpace,
                  //     ],
                  //   ),
                  // ),
                ],
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
                            onPressed: () {},
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
