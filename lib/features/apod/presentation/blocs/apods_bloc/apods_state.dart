part of 'apods_bloc.dart';

@freezed
class APODsState with _$APODsState {
  const factory APODsState.initial() = _Initial;

  const factory APODsState.loading({
    @Default([]) List<APODFile> apods,
  }) = _Loading;

  const factory APODsState.success({
    required List<APODFile> apods,
  }) = _Success;

  const factory APODsState.error({
    required AppException exception,
    @Default([]) List<APODFile> apods,
  }) = _Error;
}

extension APODsStateExt on APODsState {
  bool get isLoading =>
      whenOrNull(loading: (_) => true, initial: () => true) ?? false;

  List<APODFile> get apods =>
      mapOrNull(
        success: (value) => value.apods,
        loading: (value) => value.apods,
        error: (value) => value.apods,
      ) ??
      [];
}
