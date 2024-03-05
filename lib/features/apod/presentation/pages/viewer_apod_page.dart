import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';

class ViewerAPODPage extends StatelessWidget {
  const ViewerAPODPage({super.key, required this.apod});

  final APODFile apod;

  @override
  Widget build(BuildContext context) {
    return _ViewerAPODView(apod: apod);
  }
}

class _ViewerAPODView extends StatelessWidget {
  const _ViewerAPODView({required this.apod});

  final APODFile apod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          apod.title,
          maxLines: 2,
          style: context.titleSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download_rounded,
              color: Colors.white38,
            ),
          ),
        ],
      ),
      backgroundColor: context.backgroundColor,
      body: apod.map(
        video: (value) => CachedNetworkImage(imageUrl: value.thumbnailUrl),
        image: (value) => ZoomContainer(
          child: CachedNetworkImage(
            imageUrl: value.hdurl,
            placeholder: (_, __) => _ImageLoadingIndicator(apod: apod),
          ),
        ),
      ),
    );
  }
}

class _ImageLoadingIndicator extends StatelessWidget {
  const _ImageLoadingIndicator({
    required this.apod,
  });

  final APODFile apod;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          apod.map(
            video: (value) => CachedNetworkImage(
              imageUrl: value.thumbnailUrl,
              fit: BoxFit.cover,
            ),
            image: (value) => CachedNetworkImage(
              imageUrl: value.url,
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: const ColoredBox(color: Colors.black54),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              12.verticalSpace,
              Text(
                context.l10n.loadingHDImage,
                style: context.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
