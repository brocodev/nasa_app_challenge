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
  }

  final MediaContentRepository _repository;

  Future<void> _onPerformSearch(
    _PerformSearch event,
    Emitter<SearchState> emit,
  ) async {
    emit(const _Loading());
    final res = await _repository.searchMediaContent(
      MediaContentRequest(page: 1, query: event.text, pageSize: 80),
    );
    res.when(
      success: (data) => emit(_Success(results: data)),
      error: (exception) => emit(_Error(exception: exception)),
    );
  }
}
