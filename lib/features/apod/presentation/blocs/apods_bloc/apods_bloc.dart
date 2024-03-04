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

  DateTime endDate = DateTime.now();

  Future<void> _onFetchAPODs(
    _FetchAPODs event,
    Emitter<APODsState> emit,
  ) async {
    final refresh = event.refresh;
    emit(_Loading(apods: refresh ? [] : state.apods));
    endDate = refresh ? DateTime.now() : endDate;
    final startDate = endDate.subtract(const Duration(days: 20));
    final request = APODRequest.dateRange(
      starDate: startDate,
      endDate: endDate,
    );
    final res = await _useCase(request);
    res.when(
      success: (apods) => emit(
        _Success(
          apods: refresh ? apods : [...apods, ...state.apods],
        ),
      ),
      error: (exception) => emit(_Error(exception: exception)),
    );
    endDate = startDate;
  }
}
