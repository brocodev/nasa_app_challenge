import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_core/src/helpers/typedefs.dart';

part 'api_client_exception.freezed.dart';

@freezed
class ApiException with _$ApiException implements Exception {
  const factory ApiException.unknown({required String? message}) =
      _UnknownException;

  const factory ApiException.timeout() = _TimeoutException;

  const factory ApiException.sendTimeout() = _SendTimeoutException;

  const factory ApiException.receiveTimeout() = _ReceiveTimeoutException;

  const factory ApiException.badCertificate() = _BadCertificateException;

  const factory ApiException.badResponse({String? message}) =
      _BadResponseException;

  const factory ApiException.cancel() = _CancelException;

  const factory ApiException.connectionError() = _ConnectionException;

  const factory ApiException.userNotFound() = _UserNotFound;

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const ApiException.timeout();
      case DioExceptionType.sendTimeout:
        return const ApiException.sendTimeout();
      case DioExceptionType.receiveTimeout:
        return const ApiException.receiveTimeout();
      case DioExceptionType.badCertificate:
        return const ApiException.badCertificate();
      case DioExceptionType.badResponse:
        return ApiException.badResponse(
          message: _getMessage(error),
        );
      case DioExceptionType.cancel:
        return const ApiException.cancel();
      case DioExceptionType.connectionError:
        return const ApiException.connectionError();
      case DioExceptionType.unknown:
        return ApiException.unknown(message: error.message ?? 'Unknown error');
    }
  }
}

String? _getMessage(DioException error) {
  final data = error.response?.data;
  if (data is Json) {
    return data['message'] as String?;
  }
  if (data is String) {
    return data;
  }
  return null;
}
