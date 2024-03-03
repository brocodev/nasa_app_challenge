import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_app_challenge/core/shared/domain/exceptions/app_exception.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success({required T data}) = _Success<T>;

  const factory Result.error({required AppException exception}) = _Error;
}
