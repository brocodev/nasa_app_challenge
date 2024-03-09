import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/shared/domain/repositories/media_content_repository.dart';
import 'package:nasa_app_challenge/core/shared/domain/requests/media_content_request.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._repository) : super(const SearchState.initial()) {
    on<_PerformSearch>(_onPerformSearch);
    on<_Fetch>(_onFetch);
  }

  final MediaContentRepository _repository;

  int _page = 1;
  String _text = '';

  Future<void> _onPerformSearch(
    _PerformSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(const _Loading());
    _page = 1;
    _text = event.text;
    final res = await _repository.searchMediaContent(
      MediaContentRequest(page: _page, query: _text),
    );
    res.when(
      success: (data) => emit(_Success(results: data)),
      error: (exception) => emit(_Error(exception: exception)),
    );
  }

  Future<void> _onFetch(_Fetch event, Emitter<SearchState> emit) async {
    await state.whenOrNull(
      success: (results) async {
        emit(_Fetching(results: results));
        _page++;
        final res = await _repository.searchMediaContent(
          MediaContentRequest(page: _page, query: _text),
        );
        res.when(
          success: (data) => emit(_Success(results: [...results, ...data])),
          error: (exception) => emit(_Error(exception: exception)),
        );
      },
    );
  }
}
