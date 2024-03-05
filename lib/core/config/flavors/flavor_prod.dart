import 'package:injectable/injectable.dart';
import 'package:nasa_app_challenge/core/config/flavors/flavor_config.dart';

@production
@Injectable(as: FlavorConfig)
class FlavorPROD implements FlavorConfig {
  @override
  String get environment => production.name;

  @override
  String get nasaApiKey => throw UnimplementedError();
}
