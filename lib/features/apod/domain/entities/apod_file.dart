import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_file.freezed.dart';
part 'apod_file.g.dart';

@Freezed(unionKey: 'media_type')
class APODFile with _$APODFile {
  @FreezedUnionValue('image')
  const factory APODFile.image({
    required DateTime date,
    required String explanation,
    required String serviceVersion,
    required String title,
    required String url,
    required String hdurl,
    String? copyright,
  }) = _Image;

  @FreezedUnionValue('video')
  const factory APODFile.video({
    required DateTime date,
    required String explanation,
    required String serviceVersion,
    required String thumbnailUrl,
    required String title,
    required String url,
    String? copyright,
  }) = _Video;

  factory APODFile.fromJson(Map<String, dynamic> json) =>
      _$APODFileFromJson(json);
}
