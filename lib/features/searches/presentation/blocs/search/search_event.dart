part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.performSearch(MediaContentRequest request) =
      _PerformSearch;

  const factory SearchEvent.fetch() = _Fetch;
}
