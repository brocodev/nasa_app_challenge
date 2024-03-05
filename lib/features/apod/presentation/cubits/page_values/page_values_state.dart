part of 'page_values_cubit.dart';

@freezed
class PageValuesState with _$PageValuesState {
  const factory PageValuesState({
    required int pageIndex,
    required int index,
    required int nextIndex,
    required double percent,
    required double nextPercent,
    @Default(ScrollDirection.idle) ScrollDirection direction,
  }) = _PageValuesState;
}
