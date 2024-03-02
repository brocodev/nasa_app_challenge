import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nasa_core/nasa_core.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Base Api client
abstract class APIClient {
  /// API Client that serves as a basis for creating new
  /// API clients for different services
  APIClient({
    required this.baseUrl,
    this.enableLogging = false,
    this.interceptors = const [],
  }) : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
          ),
        ) {
    _initialize();
  }

  /// Dio HTTP Client
  final Dio dio;

  /// Base URL API
  final String baseUrl;

  /// Flag to enable logging
  final bool enableLogging;

  /// List of interceptors
  final List<Interceptor> interceptors;

  void _initialize() {
    if (enableLogging) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          logPrint: (message) => log('$message'),
        ),
      );
    }
    dio.interceptors.addAll(interceptors);
  }

  /// Perform an HTTP request to the endpoint and throws a [ApiException]
  /// in case something goes wrong
  Future<T> request<T extends Object?, R extends Object?>(
    ApiRequest request,
    T Function(R json) fromJson,
  ) async {
    try {
      final response = await _performRequest(request);
      return fromJson(response.data as R);
    } on DioException catch (error, stackTrace) {
      log(
        'Dio Request Error: ${error.runtimeType}',
        error: error,
        stackTrace: stackTrace,
      );
      final data = error.response?.data as Json?;
      if (data != null && data['data'] != null) {
        return fromJson(data as R);
      }
      throw ApiException.fromDioError(error);
    } on ApiException catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      log(
        'Unknown error: ${error.runtimeType}',
        error: error,
        stackTrace: stackTrace,
      );
      throw ApiException.unknown(message: error.toString());
    }
  }

  Future<Response<dynamic>> _performRequest(ApiRequest request) {
    return dio.request(
      request.url,
      data: request.body,
      queryParameters: request.query,
      options: Options(
        method: request.method,
        headers: request.headers,
        contentType: request.contentType,
      ),
    );
  }
}
