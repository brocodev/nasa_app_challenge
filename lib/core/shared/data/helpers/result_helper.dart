import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nasa_app_challenge/core/shared/domain/entities/result.dart';
import 'package:nasa_app_challenge/core/shared/domain/exceptions/app_exception.dart';
import 'package:nasa_core/nasa_core.dart';

abstract class ResultHelper {
  static Future<Result<T>> execute<T extends Object?>(
    Future<T> Function() callback, {
    bool checkConnection = true,
  }) async {
    try {
      final connection = await Connectivity().checkConnectivity();
      if (connection != ConnectivityResult.none || !checkConnection) {
        final res = await callback.call();
        return Result<T>.success(data: res);
      }
      return const Result.error(
        exception: AppException.notNetworkAccess(),
      );
    } on ApiException catch (e, stackTrace) {
      log('Datasource Exception $e', error: e, stackTrace: stackTrace);
      return Result.error(exception: AppException.fromDatasourceException(e));
    } catch (e, stackTrace) {
      log('Unknown exception  $e', error: e, stackTrace: stackTrace);
      return Result.error(
        exception: AppException.unknown(message: e.toString()),
      );
    }
  }
}
