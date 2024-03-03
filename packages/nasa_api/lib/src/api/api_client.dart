import 'package:flutter/foundation.dart';
import 'package:nasa_core/nasa_core.dart';

/// [NasaGovAPI]
class NasaGovAPI extends APIClient {
  NasaGovAPI._({
    required super.baseUrl,
    super.enableLogging,
    super.queryParameters,
  });

  /// Initialize the api with the defined base url
  factory NasaGovAPI.init(String apiKey) => NasaGovAPI._(
        baseUrl: 'https://api.nasa.gov/',
        enableLogging: kDebugMode,
        queryParameters: {'api_key': apiKey},
      );
}
