import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:ui_common/ui_common.dart';

class MediaContentCard extends StatelessWidget {
  const MediaContentCard({
    required this.content,
    required this.onTap,
    this.aspectRatio = 1,
    super.key,
  });

  final MediaContent content;
  final double aspectRatio;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final link = content.links?.firstWhere((e) => e.rel == 'preview');
    final url = link?.href;
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: 12.borderRadiusA,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (url != null)
                CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                )
              else ...[
                Icon(
                  content.data.first.map(
                    image: (value) => Icons.image,
                    video: (value) => Icons.ondemand_video_rounded,
                    audio: (value) => Icons.audio_file,
                  ),
                  size: 32.sp,
                ),
              ],
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black12,
                      Colors.black26,
                      Colors.black38,
                      Colors.black54,
                    ],
                  ),
                ),
              ),
              if (content.data.first.mapOrNull(video: (value) => true) ?? false)
                const Center(
                  child: Icon(
                    Icons.play_circle_rounded,
                    color: Colors.white54,
                  ),
                ),
              Positioned(
                bottom: 12.h,
                left: 16.w,
                right: 16.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      content.data.first.title,
                      style: context.bodySmall.copyWith(
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      content.data.first.description,
                      overflow: TextOverflow.ellipsis,
                      style: context.labelSmall.copyWith(
                        color: Colors.white54,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
