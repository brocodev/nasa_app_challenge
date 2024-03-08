import 'package:flutter/foundation.dart';
import 'package:nasa_core/nasa_core.dart';

class NasaLibraryAPI extends APIClient {
  NasaLibraryAPI._({
    required super.baseUrl,
    super.enableLogging,
    super.interceptors,
  });

  factory NasaLibraryAPI.init(String baseUrl) => NasaLibraryAPI._(
        baseUrl: baseUrl,
        enableLogging: kDebugMode,
        interceptors: [],
      );
}
