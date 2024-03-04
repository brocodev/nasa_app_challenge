import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/shared/domain/entities/result.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';
import 'package:nasa_app_challenge/features/apod/domain/repositories/apod_repository.dart';
import 'package:nasa_app_challenge/features/apod/domain/requests/apod_request.dart';

@injectable
class GetAPODUseCase {
  GetAPODUseCase(this._repository);

  final APODRepository _repository;

  Future<Result<List<APODFile>>> call(APODRequest request) {
    return request.when(
      date: (date) async {
        final result = await _repository.getAPODFromDate(date);
        return result.when(
          success: (data) => Result.success(data: [data]),
          error: (error) => Result.error(exception: error),
        );
      },
      dateRange: _repository.getAPODsFromDateRange,
      count: _repository.getRandomAPODs,
    );
  }
}
