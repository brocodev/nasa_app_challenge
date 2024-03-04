import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_request.freezed.dart';

@freezed
class APODRequest with _$APODRequest {
  const factory APODRequest.date({
    required DateTime date,
  }) = _Date;

  const factory APODRequest.dateRange({
    required DateTime starDate,
    required DateTime endDate,
  }) = _DateRange;

  const factory APODRequest.count({
    required int count,
  }) = _Count;
}
