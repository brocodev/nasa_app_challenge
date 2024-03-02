import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/config/flavors/flavor_config.dart';

@staging
@Injectable(as: FlavorConfig)
class FlavorSTG implements FlavorConfig {

  @override
  String get nasaApiKey => throw UnimplementedError();

  @override
  String get environment => staging.name;
}
