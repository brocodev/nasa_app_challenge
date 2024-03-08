import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:nasa_app_challenge/features/apod/presentation/blocs/download_file/download_file_bloc.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:ui_common/ui_common.dart';

class DownloadAPODButton extends StatefulWidget {
  const DownloadAPODButton({
    required this.url,
    super.key,
  });

  final String url;

  @override
  State<DownloadAPODButton> createState() => _DownloadAPODButtonState();
}

class _DownloadAPODButtonState extends State<DownloadAPODButton> {
  final ReceivePort _port = ReceivePort();
  static const _kDownloadPort = 'download_port';
  String? _taskId;

  @pragma('vm:entry-point')
  static void _downloadCallback(String id, int status, int progress) {
    final port = IsolateNameServer.lookupPortByName(_kDownloadPort);
    port?.send(progress / 100);
  }

  void listenPort(dynamic message) {
    if (message is double) {
      context
          .read<DownloadFileBloc>()
          .add(DownloadFileEvent.updateProgress(message));
    }
  }

  Future<void> startDownload() async {
    final bloc = context.read<DownloadFileBloc>();
    // TODO(me): Added request permission logic
    final dir = await path.getDownloadsDirectory();
    _taskId = await FlutterDownloader.enqueue(
      url: widget.url,
      saveInPublicStorage: true,
      savedDir: dir!.path,
    );
    bloc.add(DownloadFileEvent.start(_taskId!));
  }

  void downloadListener(BuildContext context, DownloadFileState state) {
    state.mapOrNull(
      downloading: (state) {
        if (state.progress == 0) {
          context.showSnackBar(const Text('Downloading'));
        }
      },
      completed: (state) =>
          context.showSnackBar(const Text('Download complete')),
    );
  }

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(_port.sendPort, _kDownloadPort);
    _port.listen(listenPort);
    FlutterDownloader.registerCallback(_downloadCallback);
    super.initState();
  }

  @override
  void dispose() {
    if (_taskId != null) {
      FlutterDownloader.cancel(taskId: _taskId!);
    }
    IsolateNameServer.removePortNameMapping(_kDownloadPort);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadFileBloc, DownloadFileState>(
      listener: downloadListener,
      builder: (context, state) {
        final showLoading = state.maybeMap(
          downloading: (_) => true,
          orElse: () => false,
        );
        final color =
            state.whenOrNull(completed: (_) => Colors.white) ?? Colors.white38;
        return IconButton(
          onPressed: () {
            state.whenOrNull(
              initial: startDownload,
              completed: (taskId) => FlutterDownloader.open(taskId: taskId),
            );
          },
          icon: Stack(
            alignment: Alignment.center,
            children: [
              if (showLoading)
                CircularProgressIndicator(
                  color: color,
                  value: state.whenOrNull(
                    downloading: (_, progress) =>
                        progress == 0 ? null : progress,
                    completed: (_) => 1,
                  ),
                ),
              Icon(
                state.mapOrNull(
                      completed: (_) => Icons.open_in_new_rounded,
                    ) ??
                    Icons.download_rounded,
                color: color,
              ),
            ],
          ),
        );
      },
    );
  }
}
