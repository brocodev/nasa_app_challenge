import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_data.freezed.dart';
part 'media_data.g.dart';

@Freezed(unionKey: 'media_type')
class MediaData with _$MediaData {
  @FreezedUnionValue('image')
  const factory MediaData.image({
    required String title,
    required String description,
    required DateTime dateCreated,
    required String center,
    required String nasaId,
    String? location,
    String? photographer,
    String? description508,
    @Default([]) List<String> keywords,
  }) = _Image;

  @FreezedUnionValue('video')
  const factory MediaData.video({
    required String title,
    required String description,
    required DateTime dateCreated,
    required String center,
    required String nasaId,
    String? description508,
    @Default([]) List<String> keywords,
  }) = _Video;

  @FreezedUnionValue('audio')
  const factory MediaData.audio({
    required String title,
    required String description,
    required DateTime dateCreated,
    required String center,
    required String nasaId,
    String? description508,
    @Default([]) List<String> keywords,
  }) = _Audio;

  factory MediaData.fromJson(Map<String, dynamic> json) =>
      _$MediaDataFromJson(json);
}

// "data": [
