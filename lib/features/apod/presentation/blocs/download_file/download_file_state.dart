part of 'download_file_bloc.dart';

@freezed
class DownloadFileState with _$DownloadFileState {
  const factory DownloadFileState.initial() = _Initial;

  const factory DownloadFileState.downloading({
    @Default('') String taskId,
    @Default(0) double progress,
  }) = _Downloading;

  const factory DownloadFileState.completed({
    required String taskId,
  }) = _Completed;
}
