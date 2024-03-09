import 'package:freezed_annotation/freezed_annotation.dart';

part 'link.freezed.dart';
part 'link.g.dart';

@freezed
class Link with _$Link {
  const factory Link({
    required String href,
    required String rel,
    required String render,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
