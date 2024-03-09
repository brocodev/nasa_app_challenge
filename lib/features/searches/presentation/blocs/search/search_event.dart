part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.performSearch(String text) = _PerformSearch;

  const factory SearchEvent.fetch() = _Fetch;
}
