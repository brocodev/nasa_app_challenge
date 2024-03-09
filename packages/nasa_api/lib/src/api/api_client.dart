import 'package:flutter/foundation.dart';
import 'package:nasa_core/nasa_core.dart';

class NasaGovAPI extends APIClient {
  NasaGovAPI._({
    required super.baseUrl,
    super.enableLogging,
    super.queryParameters,
  });

  factory NasaGovAPI.init(String apiKey) => NasaGovAPI._(
        baseUrl: 'https://api.nasa.gov/',
        enableLogging: kDebugMode,
        queryParameters: {'api_key': apiKey},
      );
}

class NasaImagesAPI extends APIClient {
  NasaImagesAPI._({
    required super.baseUrl,
    super.enableLogging,
  });

  factory NasaImagesAPI.init() => NasaImagesAPI._(
        baseUrl: 'https://images-api.nasa.gov/',
        enableLogging: kDebugMode,
      );
}
