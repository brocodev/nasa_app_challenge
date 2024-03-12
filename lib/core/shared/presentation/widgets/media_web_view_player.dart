import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediaWebViewPlayer extends StatefulWidget {
  const MediaWebViewPlayer({
    required this.url,
    this.loadingPlaceholder,
    this.onNavigationRequest,
    super.key,
  });

  final String url;
  final Widget? loadingPlaceholder;
  final FutureOr<NavigationDecision> Function(NavigationRequest request)?
      onNavigationRequest;

  @override
  State<MediaWebViewPlayer> createState() => _MediaWebViewPlayerState();
}

class _MediaWebViewPlayerState extends State<MediaWebViewPlayer> {
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
          onNavigationRequest: widget.onNavigationRequest,
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
    return Stack(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: progressNotifier,
          builder: (__, value, _) {
            return AnimatedSwitcher(
              duration: kThemeChangeDuration,
              switchInCurve: Curves.decelerate,
              child: value == 100
                  ? WebViewWidget(controller: controller)
                  : widget.loadingPlaceholder ??
                      const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ],
    );
  }
}
