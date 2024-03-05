import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_values_cubit.freezed.dart';
part 'page_values_state.dart';

class PageValuesCubit extends Cubit<PageValuesState> {
  PageValuesCubit({required int initialIndex})
      : super(
          PageValuesState(
            pageIndex: initialIndex,
            index: initialIndex,
            nextIndex: initialIndex - 1,
            percent: 0,
            nextPercent: 1,
          ),
        );

  void changePageIndex(int value) => emit(
        state.copyWith(pageIndex: value),
      );

  void changeIndex(int value) => emit(
        state.copyWith(index: value),
      );

  void changeNextIndex(int value) => emit(
        state.copyWith(nextIndex: value),
      );

  void changePercent(double value) => emit(
        state.copyWith(percent: value),
      );

  void changeNextPercent(double value) => emit(
        state.copyWith(nextPercent: value),
      );

  void changeDirection(ScrollDirection value) => emit(
        state.copyWith(direction: value),
      );
}
