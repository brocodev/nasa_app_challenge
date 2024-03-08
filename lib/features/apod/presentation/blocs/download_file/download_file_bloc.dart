import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_file_bloc.freezed.dart';
part 'download_file_event.dart';
part 'download_file_state.dart';

class DownloadFileBloc extends Bloc<DownloadFileEvent, DownloadFileState> {
  DownloadFileBloc() : super(const DownloadFileState.initial()) {
    on<_Start>(_onStart);
    on<_UpdateProgress>(_onUpdateProgress);
    on<_Cancel>(_onCancel);
  }

  void _onStart(_Start event, Emitter<DownloadFileState> emit) {
    emit(_Downloading(taskId: event.taskId));
  }

  void _onUpdateProgress(
    _UpdateProgress event,
    Emitter<DownloadFileState> emit,
  ) {
    state.mapOrNull(
      downloading: (state) {
        if (event.progress == 1.0) {
          emit(_Completed(taskId: state.taskId));
          return;
        }
        emit(state.copyWith(progress: event.progress));
      },
    );
  }

  void _onCancel(
    _Cancel event,
    Emitter<DownloadFileState> emit,
  ) {
    emit(const _Initial());
  }
}
