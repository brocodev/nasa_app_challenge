// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasa_app_challenge/core/config/flavors/flavor_config.dart'
    as _i3;
import 'package:nasa_app_challenge/core/config/flavors/flavor_dev.dart' as _i4;
import 'package:nasa_app_challenge/core/config/flavors/flavor_prod.dart' as _i5;
import 'package:nasa_app_challenge/core/config/flavors/flavor_stg.dart' as _i6;

const String _development = 'development';
const String _production = 'production';
const String _staging = 'staging';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FlavorConfig>(
      () => _i4.FlavorDEV(),
      registerFor: {_development},
    );
    gh.factory<_i3.FlavorConfig>(
      () => _i5.FlavorPROD(),
      registerFor: {_production},
    );
    gh.factory<_i3.FlavorConfig>(
      () => _i6.FlavorSTG(),
      registerFor: {_staging},
    );
    return this;
  }
}
