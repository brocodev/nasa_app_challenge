import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

///Object that maps all responses from [NasaAPIResponse]
@freezed
class NasaAPIResponse with _$ApiResponse {
  /// Factory constructor
  const factory NasaAPIResponse({
    required bool success,
    required String message,
    dynamic data,
  }) = _ApiResponse;

  /// From json method
  factory NasaAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
