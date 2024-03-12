import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/download_file/download_file_bloc.dart';
import 'package:nasa_app_challenge/features/apod/presentation/widgets/download_apod_button.dart';
import 'package:nasa_app_challenge/l10n/l10n.dart';
import 'package:ui_common/ui_common.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewerAPODPage extends StatelessWidget {
  const ViewerAPODPage({super.key, required this.apod});

  final APODFile apod;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DownloadFileBloc(),
      child: _ViewerAPODView(apod: apod),
    );
  }
}

class _ViewerAPODView extends StatefulWidget {
  const _ViewerAPODView({required this.apod});

  final APODFile apod;

  @override
  State<_ViewerAPODView> createState() => _ViewerAPODViewState();
}

class _ViewerAPODViewState extends State<_ViewerAPODView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight.sp,
        title: Text(
          widget.apod.title,
          maxLines: 2,
          style: context.titleSmall,
        ),
        actions: [
          widget.apod.map(
            video: (_) => const SizedBox.shrink(),
            image: (apod) => DownloadAPODButton(url: apod.hdurl),
          ),
        ],
      ),
      backgroundColor: context.backgroundColor,
      body: widget.apod.map(
        video: (value) {
          return Center(
            child: AspectRatio(
              aspectRatio: 1.4,
              child: MediaWebViewPlayer(
                url: value.url,
                loadingPlaceholder: _ImageLoadingIndicator(apod: value),
                onNavigationRequest: (request) {
                  if (request.url == value.url) {
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
            ),
          );
        },
        image: (value) => ZoomContainer(
          maxScale: 6,
          child: CachedNetworkImage(
            imageUrl: value.hdurl,
            placeholder: (_, __) => _ImageLoadingIndicator(apod: widget.apod),
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
