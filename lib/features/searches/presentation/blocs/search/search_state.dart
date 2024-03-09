part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = _Loading;

  const factory SearchState.fetching({required List<MediaContent> results}) =
      _Fetching;

  const factory SearchState.success({required List<MediaContent> results}) =
      _Success;

  const factory SearchState.error({required AppException exception}) = _Error;
}
