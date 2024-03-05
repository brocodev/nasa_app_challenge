import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        toolbarHeight: kToolbarHeight.sp,
        title: Text(
          apod.title,
          maxLines: 2,
          style: context.titleSmall,
        ),
        actions: [
          apod.map(
            video: (_) => const SizedBox.shrink(),
            image: (_) => IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.download_rounded,
                color: Colors.white38,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: context.backgroundColor,
      body: apod.map(
        video: (value) => Center(
          child: AspectRatio(
            aspectRatio: 1.4,
            child: _WebViewWidget(apod: value),
          ),
        ),
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

class _WebViewWidget extends StatefulWidget {
  const _WebViewWidget({
    required this.apod,
  });

  final APODFile apod;

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
          onNavigationRequest: (request) {
            if (request.url == widget.apod.url) {
              return NavigationDecision.navigate;
            }
            if (request.isMainFrame) {
              launchUrl(
                Uri.parse(request.url),
                mode: LaunchMode.externalApplication,
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.apod.url));
  }

  @override
  void initState() {
    _initWebViewController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: progressNotifier,
          builder: (__, value, _) {
            return AnimatedSwitcher(
              duration: kThemeChangeDuration,
              switchInCurve: Curves.decelerate,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween(
                      begin: const Offset(0, .1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: value == 100
                  ? WebViewWidget(controller: controller)
                  : _ImageLoadingIndicator(apod: widget.apod),
            );
          },
        ),
      ],
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
                apod.map(
                  image: (_) => context.l10n.loadingHDImage,
                  video: (_) => context.l10n.loadingVideo,
                ),
                style: context.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
