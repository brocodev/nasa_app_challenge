import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/config/flavors/flavor_config.dart';

@development
@Injectable(as: FlavorConfig)
class FlavorDEV implements FlavorConfig {

  @override
  String get environment => development.name;

  @override
  String get nasaApiKey => throw UnimplementedError();
}
