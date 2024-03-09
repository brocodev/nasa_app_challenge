import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/shared/domain/requests/media_content_request.dart';

abstract class MediaContentRepository {
  Future<Result<List<MediaContent>>> searchMediaContent(
    MediaContentRequest request,
  );

  Future<Result<List<String>>> loadMediaSourceUrls(
    String href,
  );
}
