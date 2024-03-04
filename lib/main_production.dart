import 'package:nasa_app_challenge/bootstrap.dart';
import 'package:nasa_app_challenge/core/app/app.dart';
import 'package:nasa_app_challenge/core/config/config.dart';

void main() {
  bootstrap(production, () => const NasaApp());
}
