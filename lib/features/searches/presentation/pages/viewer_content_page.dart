import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/shared/domain/repositories/media_content_repository.dart';
import 'package:ui_common/ui_common.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
            final url =
                urls.firstWhere((element) => element.contains('~medium.'));
            return content.data.first.map(
              // TODO(me): Switch to a video player
              video: (value) {
                return Center(
                  child: _WebViewWidget(url: url),
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
                  child: _WebViewWidget(url: url),
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

class _WebViewWidget extends StatefulWidget {
  const _WebViewWidget({
    required this.url,
  });

  final String url;

  @override
  State<_WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<_WebViewWidget> {
  late final WebViewController controller;
  final ValueNotifier<int> progressNotifier = ValueNotifier(0);

  void _initWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) => progressNotifier.value = progress,
          onPageFinished: (_) => progressNotifier.value = 100,
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void initState() {
    _initWebViewController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        controller.clearCache();
      },
      child: Stack(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: progressNotifier,
            builder: (__, value, _) {
              return AnimatedSwitcher(
                duration: kThemeChangeDuration,
                switchInCurve: Curves.decelerate,
                child: value == 100
                    ? WebViewWidget(controller: controller)
                    : const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
