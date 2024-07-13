// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../utils/networking/api_factory.dart' as _i4;
import '../../utils/networking/dio_factory.dart' as _i5;
import 'packages_module.dart' as _i6;

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
    final packagesModule = _$PackagesModule();
    gh.factory<_i3.Dio>(() => packagesModule.getDio());
    gh.factory<_i4.ApiFactory>(() => _i5.DioFactory(dio: gh<_i3.Dio>()));
    return this;
  }
}

class _$PackagesModule extends _i6.PackagesModule {}
