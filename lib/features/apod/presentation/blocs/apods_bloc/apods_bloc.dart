import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/shared/domain/exceptions/app_exception.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/features/apod/domain/requests/apod_request.dart';
import 'package:nasa_app_challenge/features/apod/domain/usecase/get_apods_usecase.dart';

part 'apods_bloc.freezed.dart';
part 'apods_event.dart';
part 'apods_state.dart';

@injectable
class APODsBloc extends Bloc<APODsEvent, APODsState> {
  APODsBloc(this._useCase) : super(const APODsState.initial()) {
    on<_FetchAPODs>(_onFetchAPODs);
  }

  final GetAPODUseCase _useCase;

  DateTime _endDate = DateTime.now();

  Future<void> _onFetchAPODs(
    _FetchAPODs event,
    Emitter<APODsState> emit,
  ) async {
    final refresh = event.refresh;
    emit(_Loading(apods: refresh ? [] : state.apods));
    _endDate = refresh ? DateTime.now() : _endDate;
    final startDate = _endDate.subtract(const Duration(days: 30));
    final request = APODRequest.dateRange(
      starDate: startDate,
      endDate: _endDate,
    );
    final res = await _useCase(request);
    res.when(
      success: (apods) {
        final reversedApods = apods.reversed.toList();
        return emit(
          _Success(
            apods: refresh ? reversedApods : [...state.apods, ...reversedApods],
          ),
        );
      },
      error: (exception) => emit(_Error(exception: exception)),
    );
    _endDate = startDate.subtract(const Duration(days: 1));
  }
}
