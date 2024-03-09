import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_app_challenge/core/shared/domain/entities/media_content.dart';

part 'search_media_response.freezed.dart';
part 'search_media_response.g.dart';

@freezed
class SearchMediaResponse with _$SearchMediaResponse {
  const factory SearchMediaResponse({
    required CollectionData collection,
  }) = _SearchMediaResponse;

  factory SearchMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMediaResponseFromJson(json);
}

@freezed
class CollectionData with _$CollectionData {
  const factory CollectionData({
    required List<MediaContent> items,
  }) = _CollectionData;

  factory CollectionData.fromJson(Map<String, dynamic> json) =>
      _$CollectionDataFromJson(json);
}
