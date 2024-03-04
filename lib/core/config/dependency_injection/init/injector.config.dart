// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nasa_api/nasa_api.dart' as _i7;
import 'package:nasa_app_challenge/core/config/dependency_injection/modules/register_modules_apis.dart'
    as _i12;
import 'package:nasa_app_challenge/core/config/flavors/flavor_config.dart'
    as _i3;
import 'package:nasa_app_challenge/core/config/flavors/flavor_dev.dart' as _i4;
import 'package:nasa_app_challenge/core/config/flavors/flavor_prod.dart' as _i5;
import 'package:nasa_app_challenge/core/config/flavors/flavor_stg.dart' as _i6;
import 'package:nasa_app_challenge/features/apod/data/repositories/apod_repository_imp.dart'
    as _i9;
import 'package:nasa_app_challenge/features/apod/domain/repositories/apod_repository.dart'
    as _i8;
import 'package:nasa_app_challenge/features/apod/domain/usecase/get_apods_usecase.dart'
    as _i10;
import 'package:nasa_app_challenge/features/apod/presentation/blocs/apods_bloc/apods_bloc.dart'
    as _i11;

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
    final registerModulesAPIs = _$RegisterModulesAPIs();
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
    gh.singleton<_i7.NasaGovAPI>(registerModulesAPIs.nasaGovAPI);
    gh.factory<_i8.APODRepository>(
        () => _i9.APODRepositoryImp(gh<_i7.NasaGovAPI>()));
    gh.factory<_i10.GetAPODUseCase>(
        () => _i10.GetAPODUseCase(gh<_i8.APODRepository>()));
    gh.factory<_i11.APODsBloc>(() => _i11.APODsBloc(gh<_i10.GetAPODUseCase>()));
    return this;
  }
}

class _$RegisterModulesAPIs extends _i12.RegisterModulesAPIs {}
