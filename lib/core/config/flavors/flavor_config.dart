import 'package:injectable/injectable.dart';

const Environment staging = Environment('staging');
const Environment production = Environment('production');
const Environment development = Environment('development');

abstract class FlavorConfig {
  String get environment;

  String get nasaApiKey;
}
