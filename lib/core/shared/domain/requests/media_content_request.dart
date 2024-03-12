import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_content_request.freezed.dart';
part 'media_content_request.g.dart';

enum MediaType { image, video, audio }

@freezed
class MediaContentRequest with _$MediaContentRequest {
  const factory MediaContentRequest({
    @Default(1) int page,
    @JsonKey(name: 'q') String? query,
    @JsonKey(name: 'center') bool? nasaCenterPublishedIt,
    @JsonKey(toJson: _keywordsToJson) @Default([]) List<String> keywords,
    MediaType? mediaType,
    String? photographer,
    String? secondaryCreator,
    String? title,
    String? yearStart,
    String? yearEnd,
    @Default(30) int pageSize,
  }) = _MediaContentRequest;

  factory MediaContentRequest.fromJson(Map<String, dynamic> json) =>
      _$MediaContentRequestFromJson(json);
}

String? _keywordsToJson(List<String> list) {
  final buffer = StringBuffer();
  for (final item in list) {
    buffer.write(item);
    if (list.indexOf(item) < list.length - 1) {
      buffer.write(',');
    }
  }
  return buffer.isNotEmpty ? buffer.toString() : null;
}
