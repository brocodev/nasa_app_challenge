import 'package:injectable/injectable.dart';
import 'package:nasa_api/nasa_api.dart';

@module
abstract class RegisterModulesAPIs {
  NasaGovAPI get nasaGovAPI => NasaGovAPI.init(
        const String.fromEnvironment('NASA_API_KEY'),
      );
}
