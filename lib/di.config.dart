// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter/app/cubit/app_theme_cubit.dart' as _i42;
import 'package:currency_converter/app/router/app_router.dart' as _i851;
import 'package:currency_converter/features/exchangerate/data/data_source/exchangerate_remote_ds.dart'
    as _i224;
import 'package:currency_converter/features/exchangerate/data/repository/exchangerate_repository_impl.dart'
    as _i642;
import 'package:currency_converter/features/exchangerate/domain/repository/exchangerate_repository.dart'
    as _i443;
import 'package:currency_converter/http/di/http_module.dart' as _i650;
import 'package:currency_converter/screens/home/routing/home_routes.dart'
    as _i567;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpModule = _$HttpModule();
    gh.singleton<_i42.AppThemeCubit>(() => _i42.AppThemeCubit());
    gh.singleton<_i851.AppRouter>(() => _i851.AppRouter());
    gh.singleton<_i361.BaseOptions>(() => httpModule.baseOptions);
    gh.singleton<_i567.HomeRoutes>(() => _i567.HomeRoutes());
    gh.singleton<_i361.Dio>(
      () => httpModule.exchangerateHttpClient,
      instanceName: 'ExchangerateHttpClient',
    );
    gh.singleton<_i224.ExchangerateRemoteDataSource>(() =>
        _i224.ExchangerateRemoteDataSource(
            httpClient: gh<_i361.Dio>(instanceName: 'ExchangerateHttpClient')));
    gh.singleton<_i443.ExchangerateRepository>(() =>
        _i642.ExchangerateRepositoryImpl(
            remoteDS: gh<_i224.ExchangerateRemoteDataSource>()));
    return this;
  }
}

class _$HttpModule extends _i650.HttpModule {}
