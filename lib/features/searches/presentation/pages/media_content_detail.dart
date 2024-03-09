import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';

class MediaContentPage extends StatelessWidget {
  const MediaContentPage({
    required this.content,
    super.key,
  });

  final MediaContent content;

  @override
  Widget build(BuildContext context) {
    final data = content.data.first;
    final link = content.links?.firstWhere((e) => e.rel == 'preview');
    final url = link?.href;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleTextStyle: context.titleMedium,
        title: Text(
          data.title,
          maxLines: 2,
        ),
        toolbarHeight: 70.h,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            bottom: .4.sh,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (url != null)
                  CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                  )
                else
                  Icon(
                    content.data.first.map(
                      image: (value) => Icons.image,
                      video: (value) => Icons.ondemand_video_rounded,
                      audio: (value) => Icons.audio_file,
                    ),
                    size: .1.sh,
                    color: Colors.white24,
                  ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black87,
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
          SingleChildScrollView(
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
                            data.title,
                            style: context.titleMedium.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            data.dateCreated.dayMonthYear(context.l10n),
                            overflow: TextOverflow.ellipsis,
                            style: context.labelMedium.copyWith(
                              color: AppColors.primaryColor.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      child: data.map(
                        video: (_) => const Icon(Icons.play_arrow_rounded),
                        audio: (value) => const Icon(Icons.play_arrow_rounded),
                        image: (_) => const Icon(Icons.zoom_out_map_rounded),
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Text(
                  data.description,
                  style: context.bodySmall.copyWith(
                    color: Colors.white54,
                  ),
                ),
                if (data.description508 != null) ...[
                  12.verticalSpace,
                  Text(
                    data.description508!,
                    style: context.bodySmall.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MediaContentView extends StatelessWidget {
  const _MediaContentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
