part of 'download_file_bloc.dart';

@freezed
class DownloadFileEvent with _$DownloadFileEvent {
  const factory DownloadFileEvent.start(String taskId) = _Start;

  const factory DownloadFileEvent.updateProgress(double progress) =
      _UpdateProgress;

  const factory DownloadFileEvent.cancel() = _Cancel;
}
