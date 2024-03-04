import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:ui_common/ui_common.dart';

class APODImageCard extends StatelessWidget {
  const APODImageCard({
    required this.apod,
    required this.onTap,
    this.aspectRatio = 1,
    super.key,
  });

  final APODFile apod;
  final double aspectRatio;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final url = apod.map(
      video: (value) => value.thumbnailUrl,
      image: (value) => value.url,
    );
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: 12.borderRadiusA,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
              ),
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
              if (apod.mapOrNull(video: (value) => true) ?? false)
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
                      apod.title,
                      style: context.bodySmall.copyWith(
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      apod.explanation,
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
