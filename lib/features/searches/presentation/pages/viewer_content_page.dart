import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/shared/domain/repositories/media_content_repository.dart';
import 'package:ui_common/ui_common.dart';

class ViewerContentPage extends StatelessWidget {
  const ViewerContentPage({
    required this.content,
    super.key,
  });

  final MediaContent content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight.sp,
        title: Text(
          content.data.first.title,
          maxLines: 2,
          style: context.titleSmall,
        ),
      ),
      backgroundColor: context.backgroundColor,
      // TODO(me): Add state handler
      body: FutureBuilder<Result<List<String>>>(
        future: GetIt.I.get<MediaContentRepository>().loadMediaSourceUrls(
              content.collection,
            ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final urls =
                snapshot.data?.whenOrNull(success: (data) => data) ?? [];
            final index =
                urls.indexWhere((element) => element.contains('~medium.'));
            final url = index != -1 ? urls[index] : urls.first;
            return content.data.first.map(
              // TODO(me): Switch to a video player
              video: (value) {
                return Center(
                  child: MediaWebViewPlayer(url: url),
                );
              },
              image: (value) => ZoomContainer(
                maxScale: 6,
                child: CachedNetworkImage(
                  imageUrl: url,
                ),
              ),
              // TODO(me): Switch to a mp3 player
              audio: (value) => Center(
                child: AspectRatio(
                  aspectRatio: 2,
                  child: MediaWebViewPlayer(url: url),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
