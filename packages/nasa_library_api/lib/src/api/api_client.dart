import 'package:flutter/foundation.dart';
import 'package:nasa_core/nasa_core.dart';
import 'package:nasa_library_api/src/response/api_response.dart';

/// [NasaLibraryAPI]
class NasaLibraryAPI extends APIClient {
  NasaLibraryAPI._({
    required super.baseUrl,
    super.enableLogging,
    super.interceptors,
  });

  /// Initialize the api with the defined base url
  factory NasaLibraryAPI.init(String baseUrl) => NasaLibraryAPI._(
        baseUrl: baseUrl,
        enableLogging: kDebugMode,
        interceptors: [],
      );

  /// Execute an http request converting the response into an [NasaLibraryAPIResponse]
  /// and throws an [ApiException] in case the response is not successful
  Future<T> sendApiRequest<T, R>(
    ApiRequest request,
    T Function(R json) fromJson,
  ) async {
    try {
      final response = await super.request<NasaLibraryAPIResponse, Json>(
        request,
        NasaLibraryAPIResponse.fromJson,
      );
      if (!response.success && response.data == null) {
        throw ApiException.badResponse(message: response.message);
      }
      return fromJson(response.data as R);
    } catch (e) {
      rethrow;
    }
  }
}
