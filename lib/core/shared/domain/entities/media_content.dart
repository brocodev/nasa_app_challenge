import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_app_challenge/core/shared/domain/entities/link.dart';
import 'package:nasa_app_challenge/core/shared/domain/entities/media_data.dart';

part 'media_content.freezed.dart';
part 'media_content.g.dart';

@freezed
class MediaContent with _$MediaContent {
  const factory MediaContent({
    @JsonKey(name: 'href') required String collection,
    required List<MediaData> data,
    List<Link>? links,
  }) = _MediaContent;

  factory MediaContent.fromJson(Map<String, dynamic> json) =>
      _$MediaContentFromJson(json);
}
