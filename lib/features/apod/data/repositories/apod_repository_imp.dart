import 'package:injectable/injectable.dart';
import 'package:nasa_api/nasa_api.dart';
import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/features/apod/domain/repositories/apod_repository.dart';
import 'package:nasa_core/nasa_core.dart';

@Injectable(as: APODRepository)
class APODRepositoryImp implements APODRepository {
  APODRepositoryImp(this._api) {
    _api.dio.options.queryParameters.addAll({'thumbs': true});
  }

  final NasaGovAPI _api;

  @override
  Future<Result<APODFile>> getAPODFromDate(DateTime date) {
    final request = ApiRequest.get(
      NasaAPIPaths.apod,
      query: {'date': date.yearMonthDay},
    );
    return ResultHelper.execute(() => _api.request(request, APODFile.fromJson));
  }

  @override
  Future<Result<List<APODFile>>> getAPODsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final request = ApiRequest.get(
      NasaAPIPaths.apod,
      query: {
        'start_date': startDate.yearMonthDay,
        'end_date': endDate.yearMonthDay,
      },
    );
    return ResultHelper.execute(
      () => _api.request(
        request,
        (json) => (json! as List<dynamic>)
            .map((e) => APODFile.fromJson(e as Json))
            .toList(),
      ),
    );
  }

  @override
  Future<Result<List<APODFile>>> getRandomAPODs(int count) {
    final request = ApiRequest.get(
      NasaAPIPaths.apod,
      query: {'count': count},
    );
    return ResultHelper.execute(
      () => _api.request(
        request,
        (json) => (json! as List<dynamic>)
            .map((e) => APODFile.fromJson(e as Json))
            .toList(),
      ),
    );
  }
}

extension on DateTime {
  String get yearMonthDay => '$year-$month-$day';
}
