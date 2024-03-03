import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_core/nasa_core.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.unknown({required String? message}) =
      _UnknownException;

  const factory AppException.timeout() = _TimeoutException;

  const factory AppException.sendTimeout() = _SendTimeoutException;

  const factory AppException.receiveTimeout() = _ReceiveTimeoutException;

  const factory AppException.badCertificate() = _BadCertificateException;

  const factory AppException.badResponse({String? message}) =
      _BadResponseException;

  const factory AppException.cancel() = _CancelException;

  const factory AppException.connectionError() = _ConnectionException;

  const factory AppException.userNotFound() = _UserNotFound;

  const factory AppException.notNetworkAccess() = _NotNetworkAccess;

  factory AppException.fromDatasourceException(ApiException exception) {
    return exception.when(
      unknown: (message) => AppException.unknown(message: message),
      timeout: AppException.timeout,
      sendTimeout: AppException.sendTimeout,
      receiveTimeout: AppException.receiveTimeout,
      badCertificate: AppException.badCertificate,
      badResponse: (message) {
        if (message == null || message.trim().isEmpty) {
          return const AppException.badResponse();
        }
        return AppException.badResponse(message: message);
      },
      cancel: AppException.cancel,
      connectionError: AppException.connectionError,
      userNotFound: AppException.userNotFound,
    );
  }
}
