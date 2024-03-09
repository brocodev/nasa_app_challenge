import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_data.freezed.dart';
part 'media_data.g.dart';

@Freezed(unionKey: 'media_type')
class MediaData with _$MediaData {
  @FreezedUnionValue('image')
  const factory MediaData.image({
    required String title,
    required String description,
    required String photographer,
    required String location,
    required DateTime dateCreated,
    required String center,
    required String nasaId,
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
    required String photographer,
    required String location,
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
// {
// "description": "Chemist Trey Barnes prepares a gas sample for injection into a gas chromatography-mass spectrometry system preconcentrator for analyzing trace level gas contaminants inside NASA Engineering’s Analytical Laboratories at Kennedy Space Center in Florida on July 7, 2021. One of seven branches in the NASA Laboratories, Development, and Testing Division, the Analytical Laboratories branch provides microscopic imagery and analysis through the use of a wide variety of microscopic techniques to identify contaminants and other urgent problems associated with aerospace flight hardware, ground support equipment, and related facilities. ",
// "title": "CSI: Chemistry Space Investigation",
// "photographer": "NASA/Frank Michaux",
// "location": "Analytical Chemistry Lab",
// "nasa_id": "KSC-20210707-PH-FMX01_0262",
// "date_created": "2021-07-07T00:00:00Z",
// "keywords": [
// "Analytical Chemistry Lab",
// "CSI",
// "Chemistry Space Investigation",
// "KSC",
// "Kennedy Space Center",
// "NASA",
// "NASA Engineers"
// ],
// "media_type": "image",
// "center": "KSC"
// }
// ],
