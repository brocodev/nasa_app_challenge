import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod_file.freezed.dart';
part 'apod_file.g.dart';

@Freezed(unionKey: 'medya_type')
class APODFile with _$APODFile {
  @FreezedUnionValue('video')
  const factory APODFile.video({
    required String copyright,
    required String data,
    required String explanation,
    required String serviceVersion,
    required String thumbnailUrl,
    required String title,
    required String url,
  }) = _Video;

  @FreezedUnionValue('image')
  const factory APODFile.image({
    required String copyright,
    required String data,
    required String explanation,
    required String serviceVersion,
    required String title,
    required String url,
  }) = _Image;

  factory APODFile.fromJson(Map<String, dynamic> json) =>
      _$APODFileFromJson(json);
}
