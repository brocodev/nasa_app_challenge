import 'package:nasa_api/nasa_api.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/core/shared/domain/entities/search_media_response.dart';
import 'package:nasa_app_challenge/core/shared/domain/repositories/media_content_repository.dart';
import 'package:nasa_app_challenge/core/shared/domain/requests/media_content_request.dart';
import 'package:nasa_core/nasa_core.dart';

class MediaContentRepositoryImp implements MediaContentRepository {
  MediaContentRepositoryImp(this._api);

  final NasaImagesAPI _api;

  @override
  Future<Result<List<String>>> loadMediaSourceUrls(String href) {
    final path = href.replaceAll(_api.baseUrl, '');
    return ResultHelper.execute(
      () => _api.request(
        ApiRequest.get(path),
        (json) => (json! as List<dynamic>).map((e) => e.toString()).toList(),
      ),
    );
  }

  @override
  Future<Result<List<MediaContent>>> searchMediaContent(
    MediaContentRequest request,
  ) =>
      ResultHelper.execute(
        () => _api.request(
          ApiRequest.get(NasaImagesAPIPaths.search, query: request.toJson()),
          (data) =>
              SearchMediaResponse.fromJson(data! as Json).collection.items,
        ),
      );
}
