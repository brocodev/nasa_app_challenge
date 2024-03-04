import 'package:nasa_app_challenge/core/core.dart';
import 'package:nasa_app_challenge/features/apod/domain/entities/apod_file.dart';

abstract class APODRepository {
  Future<Result<APODFile>> getAPODFromDate(DateTime date);

  Future<Result<List<APODFile>>> getRandomAPODs(int count);

  Future<Result<List<APODFile>>> getAPODsFromDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
