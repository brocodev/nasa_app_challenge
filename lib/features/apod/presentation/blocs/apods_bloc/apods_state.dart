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
